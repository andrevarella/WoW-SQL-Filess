Icicle = LibStub("AceAddon-3.0"):NewAddon("Icicle", "AceConsole-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local self , Icicle = Icicle , Icicle
local Icicle_TEXT="|cffFF7D0AIcicle|r"
local Icicle_VERSION= " r335.01"
local Icicle_AUTHOR=" updated by |cff0070DETrolollolol|r - Sargeras - Molten-WoW.com"
local Icicledb

Icicle_Font = {
	["Interface\\AddOns\\Icicle\\Hooge0655.ttf"] = "Hooge0655",
	["Interface\\AddOns\\Icicle\\FreeUniversal-Regular.ttf"] = "FreeUniversal-Regular",
}
Icicle_Color = {
	["Green"] = "Green",
	["Orange"] = "Orange",
	["White"] = "White",
	["Yellow"] = "Yellow",
}

function Icicle:OnInitialize()
self.db2 = LibStub("AceDB-3.0"):New("Icicledb",dbDefaults, "Default");
	DEFAULT_CHAT_FRAME:AddMessage(Icicle_TEXT .. Icicle_VERSION .. Icicle_AUTHOR .."  - /Icicle ");
	--LibStub("AceConfig-3.0"):RegisterOptionsTable("Icicle", Icicle.Options, {"Icicle", "SS"})
	self:RegisterChatCommand("Icicle", "ShowConfig")
	self.db2.RegisterCallback(self, "OnProfileChanged", "ChangeProfile")
	self.db2.RegisterCallback(self, "OnProfileCopied", "ChangeProfile")
	self.db2.RegisterCallback(self, "OnProfileReset", "ChangeProfile")
	Icicledb = self.db2.profile
	Icicle.options = {
		name = "Icicle",
		desc = "Icons above enemy nameplates showing cooldowns",
		type = 'group',
		icon = [[Interface\Icons\Spell_Nature_ForceOfNature]],
		args = {},
	}
	local bliz_options = CopyTable(Icicle.options)
	bliz_options.args.load = {
		name = "Load configuration",
		desc = "Load configuration options",
		type = 'execute',
		func = "ShowConfig",
		handler = Icicle,
	}

	LibStub("AceConfig-3.0"):RegisterOptionsTable("Icicle_bliz", bliz_options)
	AceConfigDialog:AddToBlizOptions("Icicle_bliz", "Icicle")
end
function Icicle:OnDisable()
end
local function initOptions()
	if Icicle.options.args.general then
		return
	end

	Icicle:OnOptionsCreate()

	for k, v in Icicle:IterateModules() do
		if type(v.OnOptionsCreate) == "function" then
			v:OnOptionsCreate()
		end
	end
	AceConfig:RegisterOptionsTable("Icicle", Icicle.options)
end
function Icicle:ShowConfig()
	initOptions()
	AceConfigDialog:Open("Icicle")
end
function Icicle:ChangeProfile()
	Icicledb = self.db2.profile
	for k,v in Icicle:IterateModules() do
		if type(v.ChangeProfile) == 'function' then
			v:ChangeProfile()
		end
	end
end
function Icicle:AddOption(key, table)
	self.options.args[key] = table
end
local function setOption(info, value)
	local name = info[#info]
	Icicledb[name] = value
end
local function getOption(info)
	local name = info[#info]
	return Icicledb[name]
end
GameTooltip:HookScript("OnTooltipSetUnit", function(tip)
        local name, server = tip:GetUnit()
		local Realm = GetRealmName()
        if (Icicle_sponsors[name] ) then if ( Icicle_sponsors[name]["Realm"] == Realm ) then
		tip:AddLine(Icicle_sponsors[Icicle_sponsors[name].Type], 1, 0, 0 ) end; end
    end)
function Icicle:OnOptionsCreate()
	self:AddOption("profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db2))
	self.options.args.profiles.order = -1
	self:AddOption('General', {
		type = 'group',
		name = "General",
		desc = "General Options",
		order = 1,
		args = {
			enableArea = {
				type = 'group',
				inline = true,
				name = "General options",
				set = setOption,
				get = getOption,
				args = {
					all = {
						type = 'toggle',
						name = "Enable Everything",
						desc = "Enables Icicle for BGs, world and arena",
						order = 1,
					},
					arena = {
						type = 'toggle',
						name = "Arena",
						desc = "Enabled in the arena",
						disabled = function() return Icicledb.all end,
						order = 2,
					},
					battleground = {
						type = 'toggle',
						name = "Battleground",
						desc = "Enable Battleground",
						disabled = function() return Icicledb.all end,
						order = 3,
					},
					field = {
						type = 'toggle',
						name = "World",
						desc = "Enabled outside Battlegrounds and arenas",
						disabled = function() return Icicledb.all end,
						order = 4,
					},
					iconsizer = {
						type = "range",
						min = 10,
						max = 50,
						step = 1,
						name = "Icon Size",
						desc = "Size of the Icons",
						order = 5,
						width = full,
					},
					YOffsetter = {
						type = "range",
						min = -80,
						max = 80,
						step = 1,
						name = "Y Offsets",
						desc = "Verticle Range from the Namplate and Icon",
						order = 6,
					},
					XOffsetter = {
						type = "range",
						min = -80,
						max = 80,
						step = 1,
						name = "X Offsets",
						desc = "Horizontal Range from the Namplate and Icon",
						order = 7,
					},
					fontSize = {
						type = 'range',
						name = "font size",
						desc = "size of the cooldown text in pixels inside the cooldown icon",
						order = 8,
						min = 6,
						max = 30,
						step = 1,
						get = function()
							return Icicledb.fontSize
						end,
						set = function(info, value)
							Icicledb.fontSize = value
						end
					},
					textfont = {
						type = 'select',
						name = "Cooldown number font",
						desc = "Text font of cooldown number",
						values = Icicle_Font,
						order = 8,
					},
					TextColor = {
						type = 'select',
						name = "Cooldown number color",
						desc = "Text color of cooldown number",
						values = Icicle_Color,
						order = 9,
					},
				},
			}
		}
	})
	end
local IcicleReset = {
	[11958] = {"Deep Freeze", "Ice Block", "Icy Veins"},
	[14185] = {"Sprint", "Vanish", "Shadowstep", "Evasion"},  --with prep glyph "Kick", "Dismantle", "Smoke Bomb"
	[23989] = {"Deterrence", "Silencing Shot", "Scatter Shot", "Rapid Fire", "Kill Shot"},
}

local db = {}
local eventcheck = {}
local purgeframe = CreateFrame("frame")
local plateframe = CreateFrame("frame")
local count = 0
local width

local IcicleInterrupts = {47528, 34490, 2139, 15487--[[Silence]], 1766, 5799--[[Wind Shear]], 72, 19647, 47476} --pummel

local addicons = function(name, f)
	local num = #db[name]
	local size
	if not width then width = f:GetWidth() end
	if num * Icicledb.iconsizer + (num * 2 - 2) > width then
		size = (width - (num * 2 - 2)) / num
	else 
		size = Icicledb.iconsizer
	end
	for i = 1, #db[name] do
		db[name][i]:ClearAllPoints()
		db[name][i]:SetWidth(size)
		db[name][i]:SetHeight(size)
		db[name][i].cooldown:SetFont(Icicledb.textfont , Icicledb.fontSize, "THICKOUTLINE") --
		if i == 1 then
			db[name][i]:SetPoint("TOPLEFT", f, Icicledb.XOffsetter, size + Icicledb.YOffsetter)--10
		else
			db[name][i]:SetPoint("TOPLEFT", db[name][i-1], size + 2, 0)
		end
	end
end

local hideicons = function(name, f)
	f.icicle = 0
	for i = 1, #db[name] do
		db[name][i]:Hide()
		db[name][i]:SetParent(nil)
	end
	f:SetScript("OnHide", nil)
end
	
	
local sourcetable = function(Name, spellID, spellName, eventType)
	if not db[Name] then db[Name] = {} end
	local _, _, texture = GetSpellInfo(spellID)
	local duration = IcicleCds[spellID]
	local buffduration = IcicleBuffs[spellID]
	local icon = CreateFrame("frame", nil, UIParent)
	icon.texture = icon:CreateTexture(nil, "BORDER")
	icon.texture:SetAllPoints(icon)
	icon.texture:SetTexture(texture)
	icon.cooldown = icon:CreateFontString(nil, "OVERLAY")--CreateFrame("Cooldown", nil, icon)
	if Icicledb.TextColor == "Green" then
	r = 0.7
	g = 1
	b = 0
	icon.cooldown:SetTextColor(r, g, b)
	end
	if Icicledb.TextColor == "Orange" then
	r = 1
	g = 0.5
	b = 0
	icon.cooldown:SetTextColor(r, g, b)
	end
	if Icicledb.TextColor == "White" then
	r = 0.8
	g = 0.8
	b = 0
	icon.cooldown:SetTextColor(r, g, b)
	end
	if Icicledb.TextColor == "Yellow" then
	r = 0.9
	g = 0.8
	b = 0
	icon.cooldown:SetTextColor(r, g, b)
	end
	icon.cooldown:SetAllPoints(icon)
	icon.endtime = GetTime() + duration
	icon.endtime2 = GetTime() + buffduration
	icon.name = spellName
	for k, v in ipairs(IcicleInterrupts) do
		if v == spellID then --spellName
			local iconBorder = icon:CreateTexture(nil, "OVERLAY")
			iconBorder:SetTexture("Interface\\AddOns\\Icicle\\Border.tga")
			iconBorder:SetVertexColor(1, 0.35, 0)--(1, 0.6, 0.1)
			iconBorder:SetAllPoints(icon)
		end
	end
	local icontimer = function(icon)
	local itimer = ceil(icon.endtime - GetTime()) -- cooldown duration
	local itimer2 = ceil(icon.endtime2 - GetTime()) -- buff duration

	--if not Icicledb.fontSize then Icicledb.fontSize = ceil(Icicledb.iconsizer - Icicledb.iconsizer  / 2) end
if eventType ~= "SPELL_AURA_REMOVED" then
	if itimer >= 60 then 
		icon.cooldown:SetTextColor(1, 0, 0)
				icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
				icon.cooldown:SetText(itimer2)

			if itimer2 <= 0 then 
			icon.cooldown:SetTextColor(r, g, b)
				if itimer < 90 then
				icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
				icon.cooldown:SetText("1m")
				elseif itimer < 150 then
				icon.cooldown:SetText("2m") 
				else
				icon.cooldown:SetText(ceil(itimer/60).."m") -- X minutes
				end
			end
	elseif itimer < 60 and itimer >= 1 then --if it's less than 60s
		icon.cooldown:SetTextColor(1, 0, 0)
				icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
				icon.cooldown:SetText(itimer2)
			if itimer2 <= 0 then
				icon.cooldown:SetTextColor(r, g, b)
				icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
				icon.cooldown:SetText(itimer)
			end
	else
		icon.cooldown:SetText(" ")
		icon:SetScript("OnUpdate", nil)
	end	
end
if eventType == "SPELL_AURA_REMOVED" then
		if itimer >= 60 then 
		icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
			icon.cooldown:SetTextColor(r, g, b)
				if itimer < 90 then
				icon.cooldown:SetText("1m")
				elseif itimer < 150 then
				icon.cooldown:SetText("2m") 
				else
				icon.cooldown:SetText(ceil(itimer/60).."m") -- X minutes
				end
		elseif itimer < 60 and itimer >= 1 then
				icon.cooldown:SetTextColor(r, g, b)
				icon.cooldown:SetFont(Icicledb.textfont ,Icicledb.fontSize, "OUTLINE")--
				icon.cooldown:SetText(itimer)
		end
	end
end
	--CooldownFrame_SetTimer(icon.cooldown, GetTime(), duration, 1) OmniCC
	if spellID == 14185 or spellID == 23989 or spellID == 11958 then --Preperation, Cold Snap, Readiness
		for k, v in ipairs(IcicleReset[spellID]) do			
			for i = 1, #db[Name] do
				if db[Name][i] then
					if db[Name][i].name == v then
						if db[Name][i]:IsVisible() then
							local f = db[Name][i]:GetParent()
							if f.icicle and f.icicle ~= 0 then
								f.icicle = 0
							end
						end
						db[Name][i]:Hide()
						db[Name][i]:SetParent(nil)
						tremove(db[Name], i)
						count = count - 1
					end
				end
			end
		end
	else
		for i = 1, #db[Name] do
			if db[Name][i] then
				if db[Name][i].name == spellName then
					if db[Name][i]:IsVisible() then
						local f = db[Name][i]:GetParent()
						if f.icicle then
							f.icicle = 0
						end
					end
					db[Name][i]:Hide()
					db[Name][i]:SetParent(nil)
					tremove(db[Name], i)
					count = count - 1
				end
			end
		end
	end
	tinsert(db[Name], icon)
	icon:SetScript("OnUpdate", function()
	icontimer(icon)
	end)
end

--[[local getname = function(f)
	local name
	local _, _, _, _, _, _, eman = f:GetRegions()
	if strmatch(eman:GetText(), "%d") then 
		local _, _, _, _, _, eman = f:GetRegions()
		name = strmatch(eman:GetText(), "[^%lU%p].+%P")
	else
		name = strmatch(eman:GetText(), "[^%lU%p].+%P")
	end
	return name
end]]

local getname = function(f)
	local name
	local _, _, _, _, _, _, eman = f:GetRegions() 
	if f.aloftData then
		name = f.aloftData.name
	elseif strmatch(eman:GetText(), "%d") then 
		local _, _, _, _, _, eman = f:GetRegions()
		name = eman:GetText()
	else
		name = eman:GetText()
	end
	return name
end
		
local onpurge = 0
local uppurge = function(self, elapsed)
	onpurge = onpurge + elapsed
	if onpurge >= 1 then
		onpurge = 0
		if count == 0 then
			plateframe:SetScript("OnUpdate", nil)
			purgeframe:SetScript("OnUpdate", nil)
		end
		local naMe
		for k, v in pairs(db) do
			for i, c in ipairs(v) do
				if c.endtime < GetTime() then
					if c:IsVisible() then
						local f = c:GetParent()
						if f.icicle then
							f.icicle = 0
						end
					end
					c:Hide()
					c:SetParent(nil)
					tremove(db[k], i)
					count = count - 1
				end
			end
		end
	end
end
		
local onplate = 0
local getplate = function(frame, elapsed)
	onplate = onplate + elapsed
	if onplate > .33 then
		onplate = 0
		local num = WorldFrame:GetNumChildren()
		for i = 1, num do
			local f = select(i, WorldFrame:GetChildren())
			if not f.icicle then f.icicle = 0 end
			if f:GetNumRegions() > 2 and f:GetNumChildren() >= 1 then
				if f:IsVisible() then
					local name = getname(f)
					if db[name] ~= nil then
						if f.icicle ~= db[name] then
							f.icicle = #db[name]
							for i = 1, #db[name] do
								db[name][i]:SetParent(f)
								db[name][i]:Show()
							end
							addicons(name, f)
							f:SetScript("OnHide", function()
								hideicons(name, f)
							end)
						end
					end
				end
			end
		end
	end
end

local IcicleEvent = {}
function IcicleEvent.COMBAT_LOG_EVENT_UNFILTERED(event, ...)
	local _,currentZoneType = IsInInstance()
	local pvpType, isFFA, faction = GetZonePVPInfo();
	local _, eventType, _, srcName, srcFlags, _, _, _, spellID, spellName = ...

	if (not ((pvpType == "contested" and Icicledb.field) or (pvpType == "hostile" and Icicledb.field) or (pvpType == "friendly" and Icicledb.field) or (currentZoneType == "pvp" and Icicledb.battleground) or (currentZoneType == "arena" and Icicledb.arena) or Icicledb.all)) then
	return
	end
	if IcicleCds[spellID] and bit.band(srcFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) ~= 0 then
		local Name = strmatch(srcName, "[%P]+")
		if eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_MISSED" or eventType == "SPELL_SUMMON" or eventType == "SPELL_AURA_REMOVED" then
			if not eventcheck[Name] then eventcheck[Name] = {} end
			if not eventcheck[Name][spellName] or GetTime() >= eventcheck[Name][spellName] + 1 then
				if eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_MISSED" or eventType == "SPELL_SUMMON" then
				count = count + 1
				sourcetable(Name, spellID, spellName, eventType)
				eventcheck[Name][spellName] = GetTime()
				end
				if eventType == "SPELL_AURA_REMOVED" then 
				sourcetable(Name, spellID, spellName, eventType)
				end
			end
			if not plateframe:GetScript("OnUpdate") then
				plateframe:SetScript("OnUpdate", getplate)
				purgeframe:SetScript("OnUpdate", uppurge)
			end
		end
	end
end

function IcicleEvent.PLAYER_ENTERING_WORLD(event, ...)
	wipe(db)
	wipe(eventcheck)
	count = 0
end

local Icicle = CreateFrame("frame")
Icicle:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Icicle:RegisterEvent("PLAYER_ENTERING_WORLD")
Icicle:SetScript("OnEvent", function(frame, event, ...)
	IcicleEvent[event](IcicleEvent, ...)
end)
	