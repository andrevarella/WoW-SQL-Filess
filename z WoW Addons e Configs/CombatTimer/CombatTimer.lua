CombatTimer = LibStub("AceAddon-3.0"):NewAddon("CombatTimer", "AceConsole-3.0", "AceEvent-3.0")

local instanceType
local endTime

function CombatTimer:OnInitialize()
	self.db = LibStub:GetLibrary("AceDB-3.0"):New("CombatTimerDB", self:GetDefaultConfig())
	self.media = LibStub:GetLibrary("LibSharedMedia-3.0")
	self:SetupOptions()
	
	--monitor for zone change
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	
	self:CreateDisplay()
	self:UpdateSettings()
end

function CombatTimer:InEnabledZone()
	local type = select(2, IsInInstance())
	return self.db.profile.inside[type]
end

function CombatTimer:OnEnable()
	if( not self:InEnabledZone() ) then
		return
	end

	self:RegisterEvent("PLAYER_REGEN_DISABLED") --entered combat
	self:RegisterEvent("PLAYER_REGEN_ENABLED") --left combat
end

function CombatTimer:OnDisable()
	self:UnregisterAllEvents()
	
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	self.frame:Hide()
end

function CombatTimer:Reload()
	self:OnDisable()

	-- Check to see if we should enable it
	if( self:InEnabledZone() ) then
		self:OnEnable()
	end
end

function CombatTimer:PLAYER_REGEN_DISABLED()
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:StartTimer()
end

function CombatTimer:PLAYER_REGEN_ENABLED()
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:StopTimer()
end

local eventRegistered = {
	["SWING_DAMAGE"] = true, --someone got damaged by meele
	["SWING_MISSED"] = true, --someone missed, resisted, absorbed, etc. damage by meele
	["RANGE_DAMAGE"] = true, --someone got damaged by range
	["RANGE_MISSED"] = true, --someone missed, resisted, absorbed, etc. damage by range
	["SPELL_DAMAGE"] = true, --someone got damaged by caster 
	["SPELL_MISSED"] = true, --someone missed, resisted, absorbed, etc. damage by caster
	["SPELL_HEAL"] = true, --someone got healed by caster
	["SPELL_CAST_SUCCESS"] = true, --some got affected by instant spell like Counterspell
	["SPELL_AURA_APPLIED"] = true, --someone got buffed/debuffed by caster
	["SPELL_AURA_DISPELLED"] = true, --someones buff/debuff got dispelled by caster
	["SPELL_AURA_STOLEN"] = true, --someones buff got stolen by caster
	["SPELL_DISPEL_FAILED"] = true, --caster failed to dispel buff/debuff
	["SPELL_PERIODIC_DISPEL_FAILED"] = true, --caster failed to dispel dot/hot
}

local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE
local COMBATLOG_OBJECT_REACTION_FRIENDLY = COMBATLOG_OBJECT_REACTION_FRIENDLY

function CombatTimer:COMBAT_LOG_EVENT_UNFILTERED(event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
	--return if we don't track that event
	if( not eventRegistered[eventType] ) then
		return
	end
	
	local isDestPlayer = (bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE)
	local isSourcePlayer = (bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE)
	local isSourceFriend = (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) == COMBATLOG_OBJECT_REACTION_FRIENDLY)

	--return if event dest or source is not player
	if( not isDestPlayer and not isSourcePlayer ) then
		return
	end
	
	--return if player only gets healed or buffed by someone
	if( isDestPlayer and (eventType == "SPELL_HEAL" or (eventType == "SPELL_AURA_APPLIED" and isSourceFriend)) ) then
		return
	end
	
	--reset timer because player participated in combat
	self:ResetTimer()
end

function CombatTimer:StartTimer()
	self:ResetTimer()
	self.frame:SetScript("OnUpdate", onUpdate)
	self.frame:Show()
end

function CombatTimer:StopTimer()
	self.frame:SetScript("OnUpdate", nil)
	self.frame:SetValue(0)
	self.frame:SetAlpha(1.0)
	
	self.frame.text:SetText("ooc")
	
	if (self.db.profile.hideTimer and self.db.profile.lock) then
		self.frame:Hide()
	end
end

function CombatTimer:ResetTimer()
	endTime = GetTime() + 5
	self.frame:SetStatusBarColor(0.0, 1.0, 0.0, 1.0)
end

function onUpdate()
	local left = endTime - GetTime()
	
	if (left < 0) then
		left = 0
	end
	
	local passed = 5 - left
	
	CombatTimer.frame:SetValue(passed)
	CombatTimer.frame:SetStatusBarColor(1.0 * passed / 5, 1.0, 0.0, 1.0)
	
	local alpha 
	if (left > CombatTimer.db.profile.fadeInStart) then
		alpha = 0
	elseif (left < CombatTimer.db.profile.fadeInEnd) then
		alpha = 1
	else
		alpha = 1 / (CombatTimer.db.profile.fadeInStart - CombatTimer.db.profile.fadeInEnd) * (CombatTimer.db.profile.fadeInStart - left)
	end
	
	CombatTimer.frame:SetAlpha(alpha)
	
	--add 1sec to time left because it will be rounded down
	if (left > 0) then
		left = left + 1.0
	end
	
	CombatTimer.frame.text:SetText(string.format("%d", left))
end

--see if we should enable CombatTimer in this zone
function CombatTimer:ZONE_CHANGED_NEW_AREA()
	local type = select(2, IsInInstance())

	if( type ~= instanceType ) then
		-- Check if it's supposed to be enabled in this zone
		if( self.db.profile.inside[type] ) then
			self:OnEnable()
		else
			self:OnDisable()
		end
	end
	
	instanceType = type
end

-- Dragging functions
local function OnDragStart(self)
	self.isMoving = true
	self:StartMoving()
end

local function OnDragStop(self)
	if( self.isMoving ) then
		self.isMoving = nil
		self:StopMovingOrSizing()
		
		if( not CombatTimer.db.profile.position ) then
			CombatTimer.db.profile.position = { x = 0, y = 0 }
		end
		
		CombatTimer.db.profile.position.x = self:GetLeft() * CombatTimer.db.profile.scale
		CombatTimer.db.profile.position.y = self:GetTop() * CombatTimer.db.profile.scale
	end
end

function CombatTimer:SetPosition()
	if( self.db.profile.position ) then
		self.frame:ClearAllPoints()	
		self.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.db.profile.position.x/self.db.profile.scale, self.db.profile.position.y/self.db.profile.scale)
	else
		self.frame:ClearAllPoints()
		self.frame:SetPoint("CENTER", UIParent, "CENTER")
	end
end

function CombatTimer:CreateDisplay()
	local backdrop = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 1,
		insets = {left = 1, right = 1, top = 1, bottom = 1}}
		
	self.frame = CreateFrame("StatusBar", nil, UIParent)
	self.frame:SetHeight(16)
	self.frame:SetMovable(true)
	self.frame:EnableMouse(true)
	self.frame:RegisterForDrag("LeftButton")
	self.frame:SetBackdrop(backdrop)
	self.frame:SetBackdropColor(0, 0, 0, 1.0)
	self.frame:SetBackdropBorderColor(0, 0, 0, 1.0)
	self.frame:SetScript("OnDragStart", OnDragStart)
	self.frame:SetScript("OnDragStop", OnDragStop)
	self.frame:SetMinMaxValues(0, 5)
	self.frame:SetValue(0)
	
	self.frame.text = self.frame:CreateFontString(nil)
	self.frame.text:SetFontObject(GameFontHighlight)
	self.frame.text:SetPoint("CENTER", self.frame)
	self.frame.text:SetShadowOffset(1, -1)
	self.frame.text:SetShadowColor(0, 0, 0, 1)
	self.frame.text:SetText("ooc")
end

function CombatTimer:UpdateSettings()
	self.frame:SetStatusBarTexture(self.media:Fetch(self.media.MediaType.STATUSBAR, self.db.profile.texture))
	self.frame:SetWidth(self.db.profile.width)
	self.frame:SetScale(self.db.profile.scale)
	self.frame:SetMovable(not self.db.profile.lock)
	self.frame:EnableMouse(not self.db.profile.lock)
	
	if (not self.db.profile.hideTimer or self.db.profile.lock) then
		--only show frame if combat timer is enabled for that zone
		if( self:InEnabledZone()  ) then
			self.frame:Show()
		end
	else
		self.frame:Hide()
	end
	
	self:SetPosition()
end

function CombatTimer:Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99CombatTimer|r: " .. msg)
end
