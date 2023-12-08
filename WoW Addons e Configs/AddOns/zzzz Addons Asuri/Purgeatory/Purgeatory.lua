--[[ 
	Purgeatory 3, Mayen of US-Mal'Ganis PvP
]]

Purgeatory = {}

local L = PurgeatoryLocals
local instanceType, arenaBracket
local summonedTotems = {}
local summonedObjects = {}

function Purgeatory:OnInitialize()
	self.defaults = {
		profile = {
			showIcon = true,
			dispelSuccessMsg = "Removed *spell (*target)",
			dispelFailMsg = "FAILED *spell (*target)",
			dispelColor = {r = 1, g = 1, b = 1},
			dispelLocation = "1",
			interruptMsg = "Interrupted *spell (*target)",
			interruptColor = {r = 1, g = 1, b = 1},
			interruptLocation = "1",
			zones = {
				["none"] = {},
				["party"] = {},
				["raid"] = {},
				["arena"] = {
					enabled = true,
					dispelOffensive = true,
					interrupt = true,
				},
				["pvp"] = {
					enabled = true,
					dispelOffensive = true,
					interrupt = true,
				},
			},
		},
	}
			
	-- Initialize DB
	self.db = LibStub:GetLibrary("AceDB-3.0"):New("PurgeatoryDB", self.defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "Reload")
	self.db.RegisterCallback(self, "OnProfileCopied", "Reload")
	self.db.RegisterCallback(self, "OnProfileReset", "Reload")
end

local COMBATLOG_OBJECT_REACTION_HOSTILE	= COMBATLOG_OBJECT_REACTION_HOSTILE
local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE
local eventRegistered = {["SPELL_INTERRUPT"] = true, ["SPELL_STOLEN"] = true, ["SPELL_DISPEL_FAILED"] = true, ["SPELL_DISPEL"] = true}
function Purgeatory:COMBAT_LOG_EVENT_UNFILTERED(event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
	if( not eventRegistered[eventType] or bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= COMBATLOG_OBJECT_AFFILIATION_MINE ) then
		return
	end
	
	local isHostile = bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE
--function Purgeatory:SendMessage(msg, spellID, spellName, usedSpellName, destName, dest, color)
	
	-- We got interrupted, or we interrupted someone else
	if( eventType == "SPELL_INTERRUPT" and self.db.profile.zones[instanceType].interrupt ) then
		local spellID, spellName, spellSchool, extraSpellID, extraSpellName, extraSpellSchool = ...
		self:SendMessage(self.db.profile.interruptMsg, extraSpellID, extraSpellName, spellName, destName, self.db.profile.interruptLocation, self.db.profile.interruptColor)
		
	-- We tried to dispel a buff, and failed
	elseif( eventType == "SPELL_DISPEL_FAILED" and self.db.profile.zones[instanceType].dispelFail and ( ( isHostile and self.db.profile.zones[instanceType].dispelOffensive ) or ( not isHostile and self.db.profile.zones[instanceType].dispelDefensive ) ) ) then
		local spellID, spellName, spellSchool, extraSpellID, extraSpellName, extraSpellSchool, auraType = ...
		self:SendMessage(self.db.profile.dispelFailMsg, extraSpellID, extraSpellName, spellName, destName, self.db.profile.dispelLocation, self.db.profile.dispelColor)
			
	-- Managed to dispel or steal a buff
	elseif( ( eventType == "SPELL_DISPEL" or eventType == "SPELL_STOLEN" ) and ( ( isHostile and self.db.profile.zones[instanceType].dispelOffensive ) or ( not isHostile and self.db.profile.zones[instanceType].dispelDefensive ) ) ) then
		local spellID, spellName, spellSchool, extraSpellID, extraSpellName, extraSpellSchool, auraType = ...
		
		self:SendMessage(self.db.profile.dispelSuccessMsg, extraSpellID, extraSpellName, spellName, destName, self.db.profile.dispelLocation, self.db.profile.dispelColor)
	end
end

-- Enabling Purgeatory based on zone type
function Purgeatory:PLAYER_ENTERING_WORLD()
	self:ZONE_CHANGED_NEW_AREA()
end

function Purgeatory:ZONE_CHANGED_NEW_AREA()
	local type = select(2, IsInInstance())

	if( type ~= instanceType ) then
		if( self.db.profile.zones[type].enabled ) then
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		else
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		end
	end
	
	instanceType = type
end

function Purgeatory:Reload()
	instanceType = nil
	self:ZONE_CHANGED_NEW_AREA()
end

-- Strips server name
function Purgeatory:StripServer(text)
	local name, server = string.match(text, "(.-)%-(.*)$")
	if( not name and not server ) then
		return text
	end
	
	return name
end

-- Wrap the message with an icon if needed
function Purgeatory:WrapIcon(msg, spellID)
	if( not self.db.profile.showIcon or not spellID ) then
		return msg
	end
	
	local icon = select(3, GetSpellInfo(spellID))
	return icon and string.format("|T%s:0:0|t %s", icon, msg) or msg
end

local chatFrames = {}
local _G = getfenv(0)
function Purgeatory:SendMessage(msg, spellID, spellName, usedSpellName, destName, dest, color)
	-- We're undergrouped, so redirect it to our fake alert frame
	if( dest == "rw" and GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 ) then
		dest = "rwframe"
	-- We're grouped, in a raid and not leader or assist
	elseif( dest == "rw" and not IsRaidLeader() and not IsRaidOfficer() and GetNumRaidMembers() > 0 ) then
		dest = "party"
	end
	
	-- Do special things to the message
	msg = string.gsub(msg, "*target", self:StripServer(destName or ""))
	msg = string.gsub(msg, "*spell", spellName or "")
	msg = string.gsub(msg, "*used", usedSpellName or "")
	
	-- Strip out any () leftover from no name being given
	msg = string.trim(string.gsub(msg, "%(%)", ""))
		
	-- Chat frame
	if( tonumber(dest) ) then
		chatFrames[dest] = chatFrames[dest] or _G["ChatFrame" .. dest] or DEFAULT_CHAT_FRAME
		chatFrames[dest]:AddMessage(string.format("|cff33ff99Purgeatory|r|cffffffff:|r %s", self:WrapIcon(msg, spellID)), color.r, color.g, color.b)
	-- Raid warning announcement to raid/party
	elseif( dest == "rw" ) then
		SendChatMessage(msg, "RAID_WARNING")
	-- Party chat
	elseif( dest == "party" ) then
		SendChatMessage(msg, "PARTY")
	-- Raid warning frame, will not send it out to the party
	elseif( dest == "rwframe" ) then
		if( not self.alertFrame ) then
			self.alertFrame = CreateFrame("MessageFrame", nil, UIParent)
			self.alertFrame:SetInsertMode("TOP")
			self.alertFrame:SetFrameStrata("HIGH")
			self.alertFrame:SetWidth(UIParent:GetWidth())
			self.alertFrame:SetHeight(60)
			self.alertFrame:SetFadeDuration(0.5)
			self.alertFrame:SetTimeVisible(2)
			self.alertFrame:SetFont((GameFontNormal:GetFont()), 20, "OUTLINE")
			self.alertFrame:SetPoint("CENTER", 0, 60)
		end
		
		self.alertFrame:AddMessage(self:WrapIcon(msg, spellID), color.r, color.g, color.b)
	-- Combat text
	elseif( dest == "ct" ) then
		msg = self:WrapIcon(msg)
		
		-- SCT
		if( IsAddOnLoaded("sct") ) then
			SCT:DisplayText(msg, color, nil, "event", 1)
		-- MSBT
		elseif( IsAddOnLoaded("MikScrollingBattleText") ) then
			MikSBT.DisplayMessage(msg, MikSBT.DISPLAYTYPE_NOTIFICATION, false, color.r * 255, color.g * 255, color.b * 255)		
		-- Blizzard Combat Text
		elseif( IsAddOnLoaded("Blizzard_CombatText") ) then
			-- Haven't cached the movement function yet
			if( not COMBAT_TEXT_SCROLL_FUNCTION ) then
				CombatText_UpdateDisplayedMessages()
			end
			
			CombatText_AddMessage(msg, COMBAT_TEXT_SCROLL_FUNCTION, color.r, color.g, color.b)
		end
	end
end

function Purgeatory:Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99Purgeatory|r: " .. msg)
end

-- Event handler
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(self, event, ...)
	if( event == "ADDON_LOADED" ) then
		if( select(1, ...) == "Purgeatory" ) then
			Purgeatory:OnInitialize()
			Purgeatory:ZONE_CHANGED_NEW_AREA()

			self:UnregisterEvent("ADDON_LOADED")
		end
	else
		Purgeatory[event](Purgeatory, event, ...)
	end
end)

function Purgeatory:RegisterEvent(event)
	frame:RegisterEvent(event)
end

function Purgeatory:UnregisterEvent(event)
	frame:UnregisterEvent(event)
end


--[[
PurgeatoryLocals = setmetatable(PurgeatoryLocals, {
	__index = function(t, k)
		rawset(t, k, k)
		return k
	end,
})
]]