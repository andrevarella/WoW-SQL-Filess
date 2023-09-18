local ZAF = Zed_ArenaFrames
local addon = "Zed_ArenaFrames"


local UnitExists = UnitExists
local UnitName = UnitName 
local UnitHealth, UnitHealthMax=UnitHealth, UnitHealthMax
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax
local UnitCastingInfo = UnitCastingInfo  
local UnitChannelInfo = UnitChannelInfo 
local UnitClass = UnitClass
local UnitGUID = UnitGUID 
local select = select 
local ipairs = ipairs  
local unpack = unpack 
local pairs = pairs 
local _G = _G 
local stringsub = string.sub 
local stringmatch = string.match
local tinsert = table.insert 
local floor = math.floor 

ZAF.Cooldowns = CreateFrame("Frame")
ZAF.Cooldowns.GUID = {}
ZAF.NameGUIDs = {}
local CooldownModule = ZAF.Cooldowns 


local latency_modifier = 0.05 -- not used currently

local CooldownByGUID = {}


-- GetSpellInfo(NUMBER) returns localized name of spell, english strings of the spells do not work on non english clients
ZAF.spell_cooldown = {	
 -- General
["PvP Trinket"] = 120,
["Every Man for Himself"] = 120,

-- Mage
[GetSpellInfo(2139)] 	= 24, -- counterspell
[GetSpellInfo(44572)] = 30, -- deep freeze
[GetSpellInfo(1953)] = 15, -- blink,

-- Warlock
[GetSpellInfo(17928)] = 40, -- Howl of Terror
[GetSpellInfo(30283)] = 20, -- Shadowfury
[GetSpellInfo(48020)] = 30, -- Demonic Circle: Teleport,

-- DK
[GetSpellInfo(48707)] = 45, 	-- AMS
[GetSpellInfo(49576)] = 25, -- grip,

-- Hunter
[GetSpellInfo(60192)] = 28,	-- freezing arrow
[GetSpellInfo(14311)] = 28,	-- freezing trap
[GetSpellInfo(19503)] = 30,	-- scatter,

-- Rogue
[GetSpellInfo(31224)] = 60, -- cloak
[GetSpellInfo(8643)]  = 20, -- kidney
[GetSpellInfo(36554)] = 20, -- step
[GetSpellInfo(51713)] = 60, -- sdance,

-- Warrior
[GetSpellInfo(23920)] = 10, -- spell reflection
[GetSpellInfo(46924)] = 75, -- bstorm,

-- Paladin
[GetSpellInfo(10308)] = 40,	-- hoj
[GetSpellInfo(642)]   = 300,	-- bubble,

-- Priest
[GetSpellInfo(10890)] = 27, -- psychic scream,

-- Shaman
[GetSpellInfo(51514)] = 45, -- hex
[GetSpellInfo(8177)] = 13, -- grounding totem,

-- Druid 
[GetSpellInfo(22812)] = 60,	-- barkskin
}

ZAF.Cooldowns.Shared_Cooldowns = {
["Shield Bash"] = {GetSpellInfo(6552)},
["Pummel"] = {GetSpellInfo(72)},
["Freezing Arrow"] = {GetSpellInfo(60192)},
["Freezing Trap"] = {GetSpellInfo(14311)},
["PvP Trinket"] = { GetSpellInfo(59752)},
["Every Man For Himself"] = {"PvP Trinket", nil, "Interface\\Icons\\INV_Jewelry_TrinketPVP_02" },
}




local resetCooldowns = {
["Preparation"] = {
	["Vanish"] = true,
	["Shadowstep"] = true,
	["Kick"] = true,
	["Sprint"] = true,
 },
["Cold Snap"] = {
	["Deep Freeze"] = true,
	["Ice Block"] = true,
	["Frost Nova"] = true,
	["Ice Barrier"] = true,
},
["Readiness"] = {
	["Scatter Shot"] = true,
	["Freezing Arrow"] = true,
	["Freezing Trap"] = true,

}, -- readiness 23989

}

function GetCooldownByGUID(guid)
local cooldown = not CooldownModule.GUID[guid] and 0 or not CooldownModule.GUID[guid][spell] and 0 or CooldownModule.GUID[guid][spell] 
return cooldown 
end 



local exceptions = {	-- spell icon table 
["Penance"] = select(3,GetSpellInfo(53007)),
}

local guidDB = ZAF.NameGUIDs

function CooldownModule:COMBAT_LOG_EVENT_UNFILTERED(event,...)
local _ , subType, sourceGUID, sourceName = ...
if subType == "SPELL_CAST_SUCCESS" then 
	local spellID = select(9,...)
	local spell,_,icon = GetSpellInfo(spellID)

	--local sourceGUID = select(3,...)
	--local sourceName = select(4,...)
	

	if ZAF.spell_cooldown[spell] then 
	local start = GetTime()
	local currentTime = start 
	local iconTexture = exceptions[spell] or icon
	if not self.GUID[sourceGUID] then 
		self.GUID[sourceGUID] = {}
	end 
	
	if not CooldownByGUID[sourceGUID] then 
		CooldownByGUID[sourceGUID] = {}

	end 	
	if not CooldownByGUID[sourceGUID][spell]  then 
	CooldownByGUID[sourceGUID][spell] = ZAF.spell_cooldown[spell] 
	end 
	if self.GUID[sourceGUID][spell] 
	and currentTime <= self.GUID[sourceGUID][spell].finish then -- Cooldown did not expire yet and this GUID used it; it's shorter
	local differenceInOldNew = self.GUID[sourceGUID][spell].finish - currentTime 
		CooldownByGUID[sourceGUID][spell] = CooldownByGUID[sourceGUID][spell] - differenceInOldNew
	end 
	
	
	
	
		local finish = start + 	CooldownByGUID[sourceGUID][spell]	--ZAF.spell_cooldown[spell]
		local shared_cd_spell = self.Shared_Cooldowns[spell]
		
			self.GUID[sourceGUID][spell] = {
			start = start,
			finish = finish,
			icon = icon,		
			}
			
	if shared_cd_spell then 
			local finish = start + ZAF.spell_cooldown[spell]
			local icon = shared_cd_spell[3]
			self.GUID[sourceGUID][shared_cd_spell[1]] = {
			start = start,
			finish = finish,
			icon = icon,		
			}
	self:Callbacks(sourceGUID, shared_cd_spell[1], start, finish, icon)
	end 

	self:Callbacks(sourceGUID, spell, start, finish, icon)
	end 

	
end 

if sourceName and sourceGUID then 
guidDB[sourceName] = sourceGUID  -- update guid in data base for improved nameplate functionality


end 
end 

function CooldownModule:UNIT_SPELLCAST_SUCCEEDED(event,...)
local unit, spell = ...
if exceptions[spell] and  ZAF.spell_cooldown[spell] then -- bugged icon, change it 
	local sourceGUID = UnitGUID(unit)
	if not self.GUID[sourceGUID] then 
	self.GUID[sourceGUID] = {}	
	end 
	
	local start = GetTime()
	local finish = GetTime()+ ZAF.spell_cooldown[spell]
	local icon = exceptions[spell]
	ZAF.Cooldowns.GUID[sourceGUID][spell] = {
												start =start,
												finish = finish,
												icon = icon,		
											}
	self:Callbacks(sourceGUID, spell, start, finish, icon)

end 
if resetCooldowns[spell] then 
	local sourceGUID = UnitGUID(unit) 
	if ZAF.Cooldowns.GUID[sourceGUID] then 
	for cd,_ in pairs(ZAF.Cooldowns.GUID[sourceGUID]) do 

		if resetCooldowns[spell][cd] then 
		ZAF.Cooldowns.GUID[sourceGUID][cd] = nil 
		self:Callbacks(sourceGUID, cd, GetTime(), GetTime(), nil)

		end 
	end 
	end 

end 
end 
CooldownModule.Registered = {}
function CooldownModule:Callbacks(sourceGUID, spell, start, finish, icon)
for frame, val in pairs(self.Registered) do 
frame:Callback(sourceGUID, spell, start, finish, icon)
end 
end 
function CooldownModule:Register(frame,val)
self.Registered[frame] = true
end 
function CooldownModule:PLAYER_LEAVING_WORLD()
wipe(self.GUID) -- reset GUIDs 
wipe(ZAF.NameGUIDs)
end 

function CooldownModule:CHAT_MSG_SYSTEM(event,arg1)
if arg1:match("Replay") then 
wipe(self.GUID) -- reset GUIDs 
wipe(ZAF.NameGUIDs)
end 
end 


local function eventHandler(self, event,...)
self[event](self,event,...)
end 

local function DeleteExpiredCooldowns(self, elapsed)
local GUID_cooldowns = self.GUID 
for guid, GUID_table in pairs(GUID_cooldowns) do 
	for spell, spell_table in pairs(GUID_table) do 
		if GetTime() >= spell_table.finish then 
			self.GUID[guid][spell] = nil 
		end 
	end 
end 
end 


function ZAF:GetUnitCooldowns(unit)
local unitID = UnitGUID(unit)
local cds = {}
local hasCooldown 
if self.Cooldowns.GUID[unitID] then 
for spell, spellTable in pairs(self.Cooldowns.GUID[unitID]) do 
	if spell then 
	hasCooldown = true 
	cds[spell]= spellTable
	end 
end 
end 
if hasCooldown then return cds end 
end 

function ZAF:GetUnitSpellCD(unit,arg)
local unitID = UnitGUID(unit)
if self.Cooldowns.GUID[unitID] then 
for spell, spellTable in pairs(self.Cooldowns.GUID[unitID]) do 
	if spell == arg then 
	return spellTable
	end 
end 
end 
end 



function ZAF:Init_Cooldowns()
ZAF.Cooldowns:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
ZAF.Cooldowns:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
ZAF.Cooldowns:RegisterEvent("PLAYER_LEAVING_WORLD")
ZAF.Cooldowns:RegisterEvent("CHAT_MSG_SYSTEM")
ZAF.Cooldowns:SetScript("OnEvent", eventHandler)
ZAF.Cooldowns:SetScript("OnUpdate", DeleteExpiredCooldowns)
 
end 

function CooldownModule:Disable()
ZAF.Cooldowns:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
ZAF.Cooldowns:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
ZAF.Cooldowns:SetScript("OnUpdate", nil)
end 

function CooldownModule:Enable()
ZAF.Cooldowns:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
ZAF.Cooldowns:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
ZAF.Cooldowns:SetScript("OnUpdate", DeleteExpiredCooldowns)
end 
ZAF:Init_Cooldowns()
