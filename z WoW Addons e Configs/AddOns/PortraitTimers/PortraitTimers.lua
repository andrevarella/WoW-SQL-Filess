-- Portrait Timers v1.5
-- Buff/Debuff monitor for default and custom unitframes
-- Written by Killakhan
-- http://www.wowinterface.com/downloads/author-259436.html

local addonName, addon = ...
-- local PortraitTimers = {}
-- local addon = PortraitTimers
addon.version = "1.5"
-- local addonName = "PT"
local L = addon

local defaults = {
	showArenaAuras = true,
	showPlayerAuras = true,
	showPartyFrames = true,
	showPartyAuras = true,
	fontSize = "Normal",
	r = 1.0,
	g = 1.0,
	b = 1.0,
	a = 1.0,
	arenaFrameScale = 1,
	showDecimals = true,
	fontParent = "CENTER",
}

addon.fontsDB = {
	["Normal"] = "GameFontNormalLarge",
	["Small"] = "GameFontNormal",
	["Large"] = "GameFontNormalHuge",
}
local UA_localized = GetSpellInfo(68158) -- Unstable Affliction 
local WS_localized = GetSpellInfo(19386) -- Wyvern Sting

addon.f = CreateFrame("Frame", addonName.."mainFrame", UIParent)

-- main update frames
addon.TargetFrame = CreateFrame("Frame", addonName.."_TargetFrame", UIParent)
local tFrame = addon.TargetFrame
tFrame:SetWidth(1)
tFrame:SetHeight(1)
tFrame:SetFrameStrata("DIALOG")
addon.FocusFrame = CreateFrame("Frame", addonName.."_FocusFrame", UIParent)
local fFrame = addon.FocusFrame
fFrame:SetWidth(1)
fFrame:SetHeight(1)
fFrame:SetFrameStrata("DIALOG")
addon.PlayerFrame = CreateFrame("Frame", addonName.."_PlayerFrame", UIParent)
local pFrame = addon.PlayerFrame
pFrame:SetWidth(1)
pFrame:SetHeight(1)
pFrame:SetFrameStrata("DIALOG")
for i = 1, 4 do
	addon["PartyFrame"..i] = CreateFrame("Frame", addonName.."_PartyFrame"..i, UIParent)
	local frame = addon["PartyFrame"..i]
	frame:SetWidth(1)
	frame:SetHeight(1)
	frame:SetFrameStrata("DIALOG")
	-- print("created " .. frame:GetName())
end
for i = 1, 5 do
	addon["ArenaFrame"..i] = CreateFrame("Frame", addonName.."_ArenaFrame"..i, UIParent)
	local frame = addon["ArenaFrame"..i]
	frame:SetWidth(1)
	frame:SetHeight(1)
	frame:SetFrameStrata("DIALOG")
	-- print("created " .. frame:GetName())
end

addon.f:SetScript("OnEvent", function(self, event, ...) 
      if addon[event] then 
         return addon[event](addon, event, ...) 
      end 
end)

-- register events
addon.f:RegisterEvent("PLAYER_LOGIN")
addon.f:RegisterEvent("PLAYER_ENTERING_WORLD")
addon.f:RegisterEvent("ADDON_LOADED")
addon.f:RegisterEvent("ARENA_OPPONENT_UPDATE")


-- event functions
function addon:PLAYER_ENTERING_WORLD(event, ...)
	local _, instance = IsInInstance()
	local parent
	if instance == "raid" then
		addon.f:UnregisterEvent("UNIT_AURA")
		addon.f:UnregisterEvent("PLAYER_TARGET_CHANGED")
		addon.f:UnregisterEvent("PLAYER_FOCUS_CHANGED")
		addon.f:UnregisterEvent("PARTY_MEMBERS_CHANGED")
		tFrame:SetScript("OnUpdate", nil)
		tFrame:Hide()
		fFrame:SetScript("OnUpdate", nil)
		fFrame:Hide()
		for i = 1, 4 do
			local frame = addon["PartyFrame"..i]
			frame:Hide()
			frame:SetScript("OnUpdate", nil)
		end
	else
		addon.f:RegisterEvent("UNIT_AURA")      
		addon.f:RegisterEvent("PLAYER_TARGET_CHANGED")
		addon.f:RegisterEvent("PLAYER_FOCUS_CHANGED")
		addon.f:RegisterEvent("PARTY_MEMBERS_CHANGED")
	end
	
	if addon.XPerl_loaded then -- XPerl
		-- target
		if XPerl_Target.conf.portrait3D == 1 then -- name, portrait, parent, frame
			parent = XPerl_TargetportraitFrameportrait3D
		else
			parent = XPerl_TargetportraitFrame
		end
		self.CreateAuraIcons(addonName.."TargetTexture", XPerl_TargetportraitFrame.portrait, parent, tFrame)
		-- focus
		if XPerl_Focus.conf.portrait3D == 1 then
			parent = XPerl_FocusportraitFrameportrait3D
		else
			parent = XPerl_FocusportraitFrame
		end
		self.CreateAuraIcons(addonName.."FocusTexture", XPerl_FocusportraitFrame.portrait, parent, fFrame)
		-- player
		if XPerl_Player.conf.portrait3D == 1 then
			parent = XPerl_PlayerportraitFrameportrait3D
		else
			parent = XPerl_PlayerportraitFrame
		end
		self.CreateAuraIcons(addonName.."PlayerTexture", XPerl_PlayerportraitFrame.portrait, parent, pFrame)
		-- party
		for i = 1, 4 do
			local frame = _G["XPerl_party"..i.."portraitFrame"]
			local partyFrame = _G["XPerl_party"..i]
			if frame and partyFrame then
				if partyFrame.conf.portrait3D == 1 then
					parent = _G["XPerl_party"..i.."portraitFrameportrait3D"]
				else
					parent = frame
				end
				self.CreateAuraIcons(addonName.."PartyTexture"..i, frame.portrait, parent, addon["PartyFrame"..i])
				-- addon.XPearl_partyEnabled = true
			-- else
				-- addon.XPearl_partyEnabled = false
			end
		end
	elseif addon.SUF_loaded then
		-- target
		if ShadowUF.db.profile.units.target.portrait.type == "3D" then
			parent = SUFUnittarget.portraitModel
		else
			parent = SUFUnittarget
		end
		self.CreateAuraIcons(addonName.."TargetTexture", SUFUnittarget.portrait, parent, tFrame)
		-- focus
		if ShadowUF.db.profile.units.focus.portrait.type == "3D" and SUFUnitfocus.portraitModel then
			parent = SUFUnitfocus.portraitModel
		else
			parent = SUFUnitfocus
		end
		self.CreateAuraIcons(addonName.."FocusTexture", SUFUnitfocus.portrait, parent, fFrame)
		-- player
		if ShadowUF.db.profile.units.player.portrait.type == "3D" and SUFUnitplayer.portraitModel then
			parent = SUFUnitplayer.portraitModel
		else
			parent = SUFUnitplayer
		end
		self.CreateAuraIcons(addonName.."PlayerTexture", SUFUnitplayer.portrait, parent, pFrame)
		-- party
		addon.UpdateSUFPartyFrames()
	elseif addon.PitBull_Loaded then
		-- player
		self.CreateAuraIcons(addonName.."PlayerTexture", PitBull4_Frames_player.Portrait, PitBull4_Frames_player.Portrait, pFrame)
		-- party
		-- self.UpdatePitbullPartyFrames()
		addon.checkbox1:Hide()
		return
	else
		self.CreateAuraIcons(addonName.."TargetTexture", TargetFrame.portrait, TargetFrame, tFrame)
		self.CreateAuraIcons(addonName.."FocusTexture", FocusFrame.portrait, FocusFrame, fFrame)
		self.CreateAuraIcons(addonName.."PlayerTexture", PlayerFrame.portrait, PlayerFrame, pFrame)
		-- if self.db.showPartyFrames then
			-- self.f:RegisterEvent("PARTY_MEMBERS_CHANGED")
		-- end
		for i = 1, 4 do
			local frame = _G["PartyMemberFrame"..i]
			if frame then
				self.CreateAuraIcons(addonName.."PartyTexture"..i, frame.portrait, frame, addon["PartyFrame"..i])
			end
		end
		self.checkbox2:Show()
	end

end

function addon:ARENA_OPPONENT_UPDATE(event, unit, status)
	if (unit == "arena1" or unit == "arena2" or unit == "arena3" or unit == "arena4" or unit == "arena5") and status == "seen" then
		-- print("found unit: " .. unit)
		for i = 1, 5 do
			local frame = _G["ArenaEnemyFrame"..i]
			local petFrame = _G["ArenaEnemyFrame"..i.."PetFrame"]
			if frame and petFrame then
				self.CreateAuraIcons(addonName.."ArenaTexture"..i, frame.classPortrait, frame, addon["ArenaFrame"..i])
				frame:SetScale(addon.db.arenaFrameScale)
				petFrame:SetScale(addon.db.arenaFrameScale)
			end
		end
	end
end

function addon:PARTY_MEMBERS_CHANGED(event)
	if addon.SUF_loaded then
		addon.UpdateSUFPartyFrames()
	-- elseif addon.PitBull_Loaded then -- i hate you pitbull
		-- addon.f:SetScript("OnUpdate", addon.UpdatePitbullPartyFrames_delayed)
	end
	-- show blizzard frames
	if self.db.showPartyFrames and not (addon.SUF_loaded or addon.PitBull_Loaded or addon.XPerl_loaded) then
		local _, instance = IsInInstance()
		if instance == "arena" then
			-- print("in arena")
			for i = 1, 4 do
				local unit = "party"..i
				if UnitExists(unit) then
					addon.UpdatePartyFrames(_G["PartyMemberFrame"..i])
				end
			end
		end
	end
end

function addon:UNIT_AURA(event, unit)
	if unit == "target" or unit == "focus" then 
		addon.CheckAura(unit)
	end
	if addon.db.showArenaAuras and (ArenaEnemyFrame1 or ArenaEnemyFrame2 or ArenaEnemyFrame3 or ArenaEnemyFrame4 or ArenaEnemyFrame5) then
		if unit == "arena1" or unit == "arena2" or unit == "arena3" or unit == "arena4" or unit == "arena5" then 
			addon.CheckAura(unit)
		end
	end
	if addon.db.showPartyAuras then
		if unit == "party1" or unit == "party2" or unit == "party3" or unit == "party4" then
			if addon.XPerl_loaded or addon.SUF_loaded then
				addon.CheckAura(unit)
			else
				if (unit == "party1" and (PartyMemberFrame1:IsVisible())) or
					(unit == "party2" and (PartyMemberFrame2:IsVisible())) or
					(unit == "party3" and (PartyMemberFrame3:IsVisible())) or
					(unit == "party4" and (PartyMemberFrame4:IsVisible())) then
					addon.CheckAura(unit)
				end
			end
		end
	end
	if addon.db.showPlayerAuras then
		if unit == "player" then
			addon.CheckAura(unit)
		end
	end
end

function addon:PLAYER_TARGET_CHANGED(event)
	if UnitExists("target") then
		if addon.PitBull_Loaded then
			if not tFrame.auraIcon then
				self.CreateAuraIcons(addonName.."TargetTexture", PitBull4_Frames_target.Portrait, PitBull4_Frames_target.Portrait, tFrame)
			else
			tFrame.auraIcon:SetParent(PitBull4_Frames_target.Portrait) -- pitbull is funny
			end
		end
		addon.CheckAura("target")
	else
		tFrame:Hide()
	end
end
function addon:PLAYER_FOCUS_CHANGED(event)
	if UnitExists("focus") then
		if addon.PitBull_Loaded then
			if not fFrame.auraIcon then
				self.CreateAuraIcons(addonName.."FocusTexture", PitBull4_Frames_focus.Portrait, PitBull4_Frames_focus.Portrait, fFrame)
			end
			fFrame.auraIcon:SetParent(PitBull4_Frames_focus.Portrait) -- pitbull is funny
		end
		addon.CheckAura("focus")
	else
		fFrame:Hide()
	end
end

function addon:ADDON_LOADED(event, addon)
	if addon == "PortraitTimers" then
		DEFAULT_CHAT_FRAME:AddMessage("|c00FF9900[PT]: |rPortrait Timers v"..self.version.." Loaded")

		if not PortraitTimersDB then
			PortraitTimersDB = {}
		end
		self.db = self.CopyDefaults(defaults, PortraitTimersDB)
		
		self.CreateConfig()
		UIDropDownMenu_SetText(self.dropdown1, self.db.fontSize)
		self.colorButton.texture:SetTexture("Interface\\ChatFrame\\ChatFrameColorSwatch")
		self.colorButton.texture:SetTexture(self.db.r, self.db.g, self.db.b)
		self.checkbox1:SetChecked(self.db.showPartyAuras)
		self.checkbox2:SetChecked(self.db.showPartyFrames)
		self.checkbox3:SetChecked(self.db.showPlayerAuras)
		self.checkbox4:SetChecked(self.db.showArenaAuras)
		self.submenu1.checkbox1:SetChecked(self.db.showDecimals)
		self.UpdateConfigDecimals(self.db.showDecimals)
		self.UpdateFontParent(self.db.fontParent)
		self.slider1:SetValue(self.db.arenaFrameScale)
		self.arenaTextureFrame:SetScale(self.db.arenaFrameScale)
		self.f:UnregisterEvent("ADDON_LOADED")
	end
end

function addon:PLAYER_LOGIN(event)
	if IsAddOnLoaded("AuraTimers")  then -- check for old addon
		self.AT_loaded = true
		DEFAULT_CHAT_FRAME:AddMessage("|c00FF9900[PT]: |c00FF0000Warning!|r You must remove any previous versions of AuraTimers before installing PortraitTimers!")
		return
	end
	if IsAddOnLoaded("PitBull4") then -- check for pitbull
		DEFAULT_CHAT_FRAME:AddMessage("|c00FF9900[PT]: |rPitBull4 Detected.")
		self.PitBull_Loaded = true
	end
	if IsAddOnLoaded("XPerl") then -- check for xperl
		DEFAULT_CHAT_FRAME:AddMessage("|c00FF9900[PT]: |rXPerl Detected.")
		self.XPerl_loaded = true
	end
	if IsAddOnLoaded("ShadowedUnitFrames") then -- check for sUF
		DEFAULT_CHAT_FRAME:AddMessage("|c00FF9900[PT]: |rsUF Detected.")
		self.SUF_loaded = true
	end
end

-- other functions

function addon.UpdateFontParent(parent)
	addon.testFont:ClearAllPoints()
	addon.testFont2:ClearAllPoints()
	addon.arenaTextureFrame.font:ClearAllPoints()
	addon.testFont:SetPoint(parent, addon.texture, parent)
	addon.testFont2:SetPoint(parent, addon.texture2, parent)
	addon.arenaTextureFrame.font:SetPoint(parent, addon.arenaTextureFrame.port, parent)
end

function addon.UpdateConfigDecimals(checked)
	if checked == true then
		addon.testFont:SetText("8.2")
		addon.testFont2:SetText("4.9")
		addon.arenaTextureFrame.font:SetText("2.7")	
	else
		addon.testFont:SetText("8")
		addon.testFont2:SetText("4")
		addon.arenaTextureFrame.font:SetText("2")
	end
end

function addon.UpdateSUFPartyFrames()
	-- sUF party frames
	if addon.SUF_loaded then
		local parent
		for i = 1, 4 do
			local frame = _G["SUFHeaderpartyUnitButton"..i]
			if frame and frame.portrait then
				if ShadowUF.db.profile.units.party.portrait.type == "3D" then
					parent = frame.portraitModel
				else
					parent = frame
				end
				addon.CreateAuraIcons(addonName.."PartyTexture"..i, frame.portrait, parent, addon["PartyFrame"..i])
				-- addon.SUF_partyEnabled = true
			end
		end
	end
end
-- function addon.UpdatePitbullPartyFrames()
	-- if addon.PitBull_Loaded then
		-- local parent
		-- for i = 1, 4 do
			-- local frame = _G["PitBull4_Groups_PartyUnitButton"..i]
			-- if frame then
			-- print("found frame " .. frame:GetName())
				-- addon.CreateAuraIcons(addonName.."PartyTexture"..i, frame.Portrait, frame.Portrait, addon["PartyFrame"..i])
			-- end
		-- end
	-- end
-- end
-- local total = 0
-- function addon.UpdatePitbullPartyFrames_delayed(self, elapsed)
	-- total = total + elapsed
	-- if total >= 0.01 then
		-- addon.UpdatePitbullPartyFrames()
		-- addon.f:SetScript("OnUpdate", nil)
	-- end
-- end

function addon.UpdatePartyFrames(self)
	local id = self:GetID();
	if ( GetPartyMember(id) ) then
		self:Show();
		
		UnitFrame_Update(self);
		
		local masterIcon = _G[self:GetName().."MasterIcon"];
		local lootMethod;
		local lootMaster;
		lootMethod, lootMaster = GetLootMethod();
		if ( id == lootMaster ) then
			masterIcon:Show();
		else
			masterIcon:Hide();
		end
	else
		self:Hide();
	end
	PartyMemberFrame_UpdatePet(self);
	PartyMemberFrame_UpdatePvPStatus(self);
	RefreshDebuffs(self, "party"..id, nil, nil, true);
	PartyMemberFrame_UpdateVoiceStatus(self);
	PartyMemberFrame_UpdateReadyCheck(self);
	PartyMemberFrame_UpdateOnlineStatus(self);
	PartyMemberFrame_UpdatePhasingDisplay(self);
	UpdatePartyMemberBackground();
	-- print("created " .. self:GetName())
end

function addon.CopyDefaults(src, dst)
	if not src then return { } end
	if not dst then dst = { } end
	for k, v in pairs(src) do
		if type(v) == "table" then
			dst[k] = addon.CopyDefaults(v, dst[k])
		elseif type(v) ~= type(dst[k]) then
			dst[k] = v
		end
	end
	return dst
end

function addon.CreateAuraIcons(name, portrait, parent, frame)
	if frame.auraIcon or not (parent and portrait) then return end
	frame.auraIcon = parent:CreateTexture(name, "OVERlAY")
	frame.auraIcon:SetPoint("CENTER", portrait)
	frame.auraIcon:SetAllPoints(portrait)
	if not frame.font then
		addon.CreateFontStrings(name .. "_Font", frame)
	end
	-- print("Created " .. frame.auraIcon:GetName())
end

function addon.CreateFontStrings(name, frame)
	local fontString
	for k, v in pairs(addon.fontsDB) do
		if k == addon.db.fontSize then
			-- print(k, v)
			fontString = v
		end
	end
	frame.font = frame:CreateFontString(name, "OVERLAY")
	-- frame.font:ClearAllPoints()
	frame.font:SetPoint(addon.db.fontParent, frame.auraIcon, addon.db.fontParent)
	
	local newfont, size = _G[fontString]:GetFont()
	frame.font:SetFont(newfont, size, "OUTLINE")
	frame.font:SetText("")
	frame.font:SetTextColor(addon.db.r, addon.db.g, addon.db.b, addon.db.a)
	-- print("Created " .. frame.font:GetName())
end

function addon.SetFontSize(newFont, frame)
	if frame.font then
		local outlineFont, size = _G[newFont]:GetFont()
		frame.font:SetTextColor(addon.db.r, addon.db.g, addon.db.b, addon.db.a)
		if frame:GetName():find("Party") or frame:GetName():find("Arena") then
			frame.font:SetFont(outlineFont, size/1.3, "OUTLINE")
		else
			frame.font:SetFont(outlineFont, size, "OUTLINE")
		end
	end
end

function addon.HideAll(unit)
	-- print("hide frame " .. unit)
	local frame = addon.GetUnitFrame(unit)
	if not frame then return end
	frame:Hide()
	if frame.auraIcon then
		frame.auraIcon:Hide()
	end
	if frame.font then
		frame.font:SetText("")
	end
end

function addon.CheckAura(unit)
	-- print("check aura " .. unit)
	for idx, spellID in ipairs(addon.spellDB) do
		local spell = GetSpellInfo(spellID)
		if UnitBuff(unit, spell) then
			local _, _, texture, _, _, _, eTime = UnitBuff(unit, spell)
			addon.SetAura(unit, texture, eTime)
			-- print("found buff " .. spell .. " on " .. unit)
			return
		elseif UnitDebuff(unit, spell) then
			local _, _, texture, _, _, _, eTime = UnitDebuff(unit, spell)
			addon.SetAura(unit, texture, eTime)
			-- print("found debuff " .. spell .. " on " .. unit)
			return
		end
	end
	if UnitDebuff(unit, UA_localized) then  -- check for UA silence
		local _, _, texture, _, _, _, eTime = UnitDebuff(unit, UA_localized)
		if texture == "Interface\\Icons\\Spell_Holy_Silence" then
			addon.SetAura(unit, texture, eTime)
		else
			addon.HideAll(unit)
		end
		return
	end
	if UnitDebuff(unit, WS_localized) then  -- check for Wyvern Sting
		local id = select(11, UnitDebuff(unit, WS_localized))
		if id == 19386 then
			local _, _, texture, _, _, _, eTime = UnitDebuff(unit, WS_localized)
			addon.SetAura(unit, texture, eTime)
			-- print("found wyvern sting debuff")
			return
		end
	end
	
	addon.HideAll(unit)
end

function addon.SetPortraitTexture(frame, texture)
	if not frame then return end
	if addon.PitBull_Loaded then
		frame.auraIcon:SetTexture(texture)
		frame.auraIcon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
	elseif addon.XPerl_loaded or addon.SUF_loaded then
		frame.auraIcon:SetTexture(texture)
	else
		SetPortraitToTexture(frame.auraIcon, texture)
	end
end

function addon.SetFormattedText(time)
	if addon.db.showDecimals then
		return string.format("%.1f", time)
	else
		return string.format("%.0f", time)
	end
end

function addon.SetAura(unit, texture, eTime)
	local frame = addon.GetUnitFrame(unit)
	if not frame then return end
	if not frame.auraIcon then return end
	addon.SetPortraitTexture(frame, texture)
	addon.SetFontSize(addon.fontsDB[addon.db.fontSize], frame)
	frame.texture = texture
	frame.font:SetText(addon.SetFormattedText(eTime-GetTime()))
	frame.font:ClearAllPoints()
	frame.font:SetPoint(addon.db.fontParent, frame.auraIcon, addon.db.fontParent)
	frame.eTime = eTime
	frame.name = unit
	frame:Show()
	frame.auraIcon:Show()
	frame.total = 0.01
	frame:SetScript("OnUpdate", addon.UpdateTimer)
end

function addon.UpdateTimer(self, elapsed)
	self.total = self.total + elapsed
	if self.total >= 0.01 then 
		if self.eTime - GetTime() > 0 and UnitExists(self.name) and self:IsVisible() then
			addon.SetPortraitTexture(self, self.texture)	
			self.font:SetText(addon.SetFormattedText(self.eTime-GetTime()))
			self.total = 0
		else
			addon.HideAll(self.name)
		end
	end
end

function addon.GetUnitFrame(unit)
	local frame
	if unit == "target" then
		frame = tFrame
	elseif unit == "focus" then
		frame = fFrame
	elseif unit == "player" then
		frame = pFrame
	elseif unit == "party1" then
		frame = addon.PartyFrame1
	elseif unit == "party2" then
		frame = addon.PartyFrame2
	elseif unit == "party3" then
		frame = addon.PartyFrame3
	elseif unit == "party4" then
		frame = addon.PartyFrame4
	elseif unit == "arena1" then
		frame = addon.ArenaFrame1
	elseif unit == "arena2" then
		frame = addon.ArenaFrame2
	elseif unit == "arena3" then
		frame = addon.ArenaFrame3
	elseif unit == "arena4" then
		frame = addon.ArenaFrame4
	elseif unit == "arena5" then
		frame = addon.ArenaFrame5
	end	
	return frame
end

function addon.ShowColorPicker(r, g, b, changedCallback)
	ColorPickerFrame.opacity  = 1
	ColorPickerFrame.hasOpacity = false
	ColorPickerFrame.previousValues = {r,g,b}
	ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = 
	changedCallback, changedCallback, changedCallback;
	ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
	ColorPickerFrame:Show();
end

function addon.myColorCallback(restore)
	local newR, newG, newB
	if restore then -- canel
		newR, newG, newB = unpack(restore);
	else
		newR, newG, newB = ColorPickerFrame:GetColorRGB();
	end
	addon.db.r, addon.db.g, addon.db.b = newR, newG, newB
	addon.colorButton.texture:SetTexture(addon.db.r, addon.db.g, addon.db.b)
	addon.testFont:SetTextColor(addon.db.r, addon.db.g, addon.db.b, addon.db.a)
	addon.testFont2:SetTextColor(addon.db.r, addon.db.g, addon.db.b, addon.db.a)
	addon.arenaTextureFrame.font:SetTextColor(addon.db.r, addon.db.g, addon.db.b, addon.db.a)
end

