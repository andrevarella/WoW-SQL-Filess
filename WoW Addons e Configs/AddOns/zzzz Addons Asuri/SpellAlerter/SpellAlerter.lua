local addon = LibStub("AceAddon-3.0"):NewAddon("SpellAlerter","AceEvent-3.0","AceConsole-3.0")
local	L, SM = LibStub("AceLocale-3.0"):GetLocale("SpellAlerter", true), LibStub("LibSharedMedia-3.0")
local LDB = LibStub("LibDataBroker-1.1",true)
local LDBIcon = LibStub("LibDBIcon-1.0",true)

_G.SpellAlerter = addon

do
	local function AddSound(soundName,soundFile) SM:Register("Sound",soundName,soundFile) end
	AddSound("Bell Toll Alliance", "Sound\\Doodad\\BellTollAlliance.wav") 
	AddSound("Bell Toll Horde", "Sound\\Doodad\\BellTollHorde.wav")
	AddSound("Rubber Ducky", "Sound\\Doodad\\Goblin_Lottery_Open01.wav")
	AddSound("Cartoon FX", "Sound\\Doodad\\Goblin_Lottery_Open03.wav")
	AddSound("Explosion", "Sound\\Doodad\\Hellfire_Raid_FX_Explosion05.wav")
	AddSound("Shing!", "Sound\\Doodad\\PortcullisActive_Closed.wav")
	AddSound("Wham!", "Sound\\Doodad\\PVP_Lordaeron_Door_Open.wav")
	AddSound("Simon Chime", "Sound\\Doodad\\SimonGame_LargeBlueTree.wav")
	AddSound("War Drums", "Sound\\Event Sounds\\Event_wardrum_ogre.wav")
	AddSound("Cheer", "Sound\\Event Sounds\\OgreEventCheerUnique.wav")
	AddSound("Humm", "Sound\\Spells\\SimonGame_Visual_GameStart.wav")
	AddSound("Short Circuit", "Sound\\Spells\\SimonGame_Visual_BadPress.wav")
	AddSound("Fel Portal", "Sound\\Spells\\Sunwell_Fel_PortalStand.wav")
	AddSound("Fel Nova", "Sound\\Spells\\SeepingGaseous_Fel_Nova.wav")
	AddSound("You Will Die!", "Sound\\Creature\\CThun\\CThunYouWillDIe.wav")
end

function SA_AddSound(soundName,soundFile)
	assert(type(soundName) == "string","Bad argument #1. Expected a string")
	assert(type(soundFile) == "string","Bad argument #2. Expected a string")
	SM:Register("sound",soundName,"Interface\\Addons\\SpellAlerter\\sounds\\"..soundFile) 
end 

local alert
local gbl,pfl
local SpellCasts, EnemyBuffs, FriendlyDebuffs, Ignores
local PGUID,PNAME

local SPELLCASTS = "spellcasts"
local ENEMYBUFFS = "enemybuffs"
local FRIENDLYDEBUFFS = "friendlydebuffs"

local ListSelect, ListSelect2

local GetSpellInfo = GetSpellInfo
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitName = UnitName
local UnitGUID = UnitGUID
local UnitClass = UnitClass
local PlaySoundFile = PlaySoundFile
local pairs = pairs
local ipairs = ipairs
local unpack = unpack
local select = select
local match = string.match
local wipe = table.wipe
local UNKNOWN = "UNKNOWN"

local ClassColors = {}
local function UpdateClassHexes()
	for class,color in pairs(CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS) do
		ClassColors[class] = ("|cff%02x%02x%02x"):format(color.r * 255, color.g * 255, color.b * 255)
	end
end
UpdateClassHexes()
if CUSTOM_CLASS_COLORS then CUSTOM_CLASS_COLORS:RegisterCallback(UpdateClassHexes) end

local ColorName = setmetatable({}, {__index =
	function(t, unit)
		local class = select(2,UnitClass(unit))
		if not class then return false end
		local name = UnitName(unit)
		local prev = rawget(t,name)
		if prev then return prev end
		t[name] = ClassColors[class]..name.."|r"
		return t[name]
	end,
})

local Icons = setmetatable({}, {
	__index = function(t,spellid)
		local icon = select(3,GetSpellInfo(spellid))
		t[spellid] = icon
		return icon
	end,
})

local Defaults = {
	global = {
		Enabled = true,
		Lock = true,
		Minimap = {},
	},
	profile = {
		Positions = { SpellAlerterFrameAnchor =  {"CENTER",nil,"CENTER",0,190} },
		CategorySelect = "SpellCasts",
		ShowIcon = true,
		ShowCaster = false,
		SpellNames = false,
		ClassColored = true,
		TargetGraphic = "arrow",
		HoldTime = 1,
		IconSize = 40,
		Font = SM:GetDefault("font"),
		FontSize = 40,
		YouText = " ",
		ShowTarget = false,
		TargetOnly = false,
		Filters = { 
			["*"] = {
				Players = true,
				NPCs = true,
				TargetIsSelf = false,
			},
		},
	},
}

local CategoryValues = {
	SpellCasts = L["Spell Casts"],
	EnemyBuffs = L["Enemy Buffs"],
	FriendlyDebuffs = L["Friendly Debuffs"]
}

local colors = {
	YELLOW = {1,1,0},
	PINK = {1,0,1},
	GREEN = {0,1,0},
	RED = {1,0,0},
	WHITE = {1,1,1},
	VIOLET = {0.55,0,1},
	TAN = {0.82,0.71,0.55},
	TEAL = {0,0.5,0.5},
	TURQUOISE = {0.19,0.84,0.78},
	PEACH = {1,0.9,0.71},
	INDIGO = {0,0.25,0.71},
	GREY = {0.5,0.5,0.5},
	AQUA = {0,1,1},
	ORANGE = {1,0.65,0},
	BLUE = {0,0,1},
}

local colorHexes = {
	YELLOW =	   "|cffffff00"..L["Yellow"].."|r",
	PINK = 		"|cffff00ff"..L["Pink"].."|r",
	GREEN = 		"|cff00ff00"..L["Green"].."|r",
	RED = 		"|cffff0000"..L["Red"].."|r",
	WHITE = 		"|cffffffff"..L["White"].."|r",
	VIOLET = 	"|cff8b00ff"..L["Violet"].."|r",
	TAN = 		"|cffd2b48c"..L["Tan"].."|r",
	TEAL = 		"|cff008080"..L["Teal"].."|r",
	TURQUOISE = "|cff30d5c8"..L["Turquoise"].."|r",
	PEACH = 	   "|cffffe5b4"..L["Peach"].."|r",
	INDIGO =    "|cff00416a"..L["Indigo"].."|r",
	GREY =      "|cff808080"..L["Grey"].."|r",
	AQUA =      "|cff00ffff"..L["Aqua"].."|r",
	ORANGE =    "|cffffa500"..L["Orange"].."|r",
	BLUE =      "|cff0000ff"..L["Blue"].."|r",
}

local function AddSpellInfo(list,keyiskey)
	local temp = {}
	for spellid,data in pairs(list) do 
		local spellName = GetSpellInfo(spellid)
		if spellName then temp[spellName] = keyiskey and spellName or data end
	end
	wipe(list)
	for spellName,data in pairs(temp) do list[spellName] = data end
end

function addon:AddDefaultSpells()
	if not pfl.Ignores then
		pfl.Ignores =  {
		-- Heals
			-------------------------------------
				[26983] = true, -- Tranquility

		-- CC
			-------------------------------------
				-- Hunter
				[14311] = true, -- Freezing Trap
				[13809] = true, -- Frost Trap
				[34600] = true, -- Snake Trap
				-- Warlock
				[17928] = true, -- Howl of Terror
				-- Warrior
				[23920] = true, -- Spell Reflection
				
		-- Destroyable
			-------------------------------------
				[16190] = true, -- Mana Tide Totem
				[8177] = true,  -- Grounding Totem
				[61657] = true, -- Fire Nova Totem
				[8143] = true,  -- Tremor Totem
				
		-- Damage
			-------------------------------------

		-- Ressurects/Summons
			-------------------------------------
			-- Hunter
				[982] = true,   -- Revive Pet
			-- Warlock
				[712] = true,   -- Summon Succubus
				[30146] = true, -- Summon Felguard
				[691] = true,   -- Summon Felhunter
				[697] = true,   -- Summon Voidwalker
		}
		AddSpellInfo(pfl.Ignores,true)
	end
	
	if not pfl.SpellCasts then
		pfl.SpellCasts =  {
			-- Heals
			-------------------------------------
				-- Priests
				[25235] = {Color = "YELLOW"}, -- Flash Heal
				[25213] = {Color = "YELLOW"}, -- Greater Heal
				[32546] = {Color = "YELLOW"}, -- Binding Heal
				-- Druid
				[26979] = {Color = "YELLOW"}, -- Healing Touch
				[26980] = {Color = "YELLOW"}, -- Regrowth
				[26983] = {Color = "YELLOW"}, -- Tranquility
				-- Shaman 
				[25396] = {Color = "YELLOW"}, -- Healing Wave
				[25420] = {Color = "YELLOW"}, -- Lesser Healing Wave
				-- Paladin
				[27137] = {Color = "YELLOW"}, -- Flash of Light
				[27136] = {Color = "YELLOW"}, -- Holy Light
			-- CC
			-------------------------------------
				-- Priest
				[605] =   {Color = "PINK"},   -- Mind Control
				
				-- Druid
				[26989] = {Color = "PINK"},   -- Entangling Roots
				[33786] = {Color = "PINK"},   -- Cyclone
				[18658] = {Color = "PINK"}, 	-- Hibernate
				
				-- Hunter
				[14311] = {Color = "PINK"},   -- Freezing Trap
				[13809] = {Color = "PINK"},   -- Frost Trap
				[34600] = {Color = "PINK"},   -- Snake Trap
				-- Mage
				[12826] = {Color = "PINK"},   -- Polymorph
				
				-- Warlock
				[6215] =  {Color = "PINK"},   -- Fear
				
				[17928] = {Color = "PINK"},   -- Howl of Terror
				-- Warrior
				[23920] = {Color = "PINK"},   -- Spell Reflection
				
				-- Shaman
				[51514] = {Color = "PINK"},   -- Hex
				
			-- Destroyable
			-------------------------------------
				[16190] = {Color = "GREEN"},  -- Mana Tide Totem
				[8177] =  {Color = "GREEN"},  -- Grounding Totem
				[61657] = {Color = "GREEN"},  -- Fire Nova Totem
				[8143] = {Color = "GREEN"},   -- Tremor Totem
				
			-- Damage
			-------------------------------------
			    -- Druid
			    [50334]  = {Color = "RED"},   -- Berserk
				
				-- Priest
				[8129]  = {Color = "RED"}, 	  -- Mana Burn
				[48123] = {Color = "RED"},    -- Smite
				[48135] = {Color = "RED"},    -- Holy Fire
				[48127] = {Color = "RED"},    -- Mind Blast
				[48156] = {Color = "RED"},    -- Mind Flay
				[48160] = {Color = "RED"},    -- Vampiric Touch
				
				-- Mage
				[38697] = {Color = "RED"},    -- Frostbolt
				[38692] = {Color = "RED"},    -- Fireball
				[33938] = {Color = "RED"},    -- Pyroblast
				
				-- Rogue
				[51713] = {Color = "RED"},    -- Shadow Dance
				
				-- Shaman
				[25449] = {Color = "RED"},    -- Lightning Bolt
				[25442] = {Color = "RED"},    -- Chain Lightning
				[60043] = {Color = "RED"},    -- Lava Burst
				
				-- Warlock
				[47810] = {Color = "RED"},    -- Immolate
				[27209] = {Color = "RED"},    -- Shadow Bolt
				[30545] = {Color = "RED"},    -- Soul Fire
				[59164] = {Color = "RED"},    -- Haunt
				[47843] = {Color = "RED"},    -- Unstable Affliction
				[59172] = {Color = "RED"},    -- Chaos Bolt
				
				-- Warrior
				[75456] = {Color = "RED"},    -- Piercing Twilight
				[71558] = {Color = "RED"},    -- Power of the Taunka
				[46924] = {Color = "RED"},    -- Bladestorm
				
		-- Ressurects/Summons
		-------------------------------------
			-- Druid
				[50763] = {Color = "GREY"},   -- Revive
				
			-- Paladin
				[48950] = {Color = "GREY"},   -- Redemption
				
			-- Priest
				[48171] = {Color = "GREY"},   -- Resurrect
				
			-- Hunter
				[982] =   {Color = "GREY"},   -- Revive Pet
				
			-- Warlock
				[712] =   {Color = "GREY"},   -- Summon Succubus
				[30146] = {Color = "GREY"},   -- Summon Felguard
				[691] =   {Color = "GREY"},   -- Summon Felhunter
				[697] =   {Color = "GREY"},   -- Summon Voidwalker
				
			-- Shaman
				[49277] = {Color = "GREY"},   -- Ancestral Spirit
		}
		AddSpellInfo(pfl.SpellCasts)
	end
	if not pfl.EnemyBuffs then
		pfl.EnemyBuffs = {
			-- Clearable
			-------------------------------------
				-- Druid
				[29166] = {Color = "PEACH"},  -- Innervate
				[17116] = {Color = "PEACH"},  -- Nature's Swiftness
				
				-- Shaman
				[32594] = {Color = "PEACH"},  -- Earth Shield
				
				-- Paladin
				[1044] =  {Color = "VIOLET"}, -- Hand of Freedom
				[10278] = {Color = "VIOLET"}, -- Hand of Protection
				[6940] =  {Color = "VIOLET"}, -- Hand of Sacrifice
				
				-- Priest
				[10060] = {Color = "PEACH"},  -- Power Infusion
				
				-- Mage 
				[12051] = {Color = "PEACH"},  -- Evocation
				
				-- Warlock
				[18708] = {Color = "PEACH"},  -- Fel Domination
				
				-- Paladin
				[53654] = {Color = "PEACH"},  -- Beacon of Light
		}
		AddSpellInfo(pfl.EnemyBuffs)
	end
	if not pfl.FriendlyDebuffs then
		pfl.FriendlyDebuffs = {
			-- Clearable
			-------------------------------------
				[3034] = {Color = "AQUA"},    -- Viper Sting
		}
		AddSpellInfo(pfl.FriendlyDebuffs)
	end
end

function addon:ProfileChanged()
	pfl = self.db.profile
	self:AddDefaultSpells()
	ListSelect,ListSelect2 = nil,nil
	SpellCasts = pfl.SpellCasts
	FriendlyDebuffs = pfl.FriendlyDebuffs
	EnemyBuffs = pfl.EnemyBuffs
	Ignores = pfl.Ignores
end

function addon:OpenConfig()
	if not addon.options then
		addon.options = addon:GetOptions()
		addon.options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(addon.db)
		addon.options.args.profile.order = 500
		LibStub("AceConfig-3.0"):RegisterOptionsTable("SpellAlerter", addon.options)
		addon.GetOptions = nil
	end
	LibStub("AceConfigDialog-3.0"):Open("SpellAlerter")
end

function addon:OnInitialize()
	self.frame = CreateFrame("Frame","SpellAlerterFrame",UIParent)
	self.db = LibStub("AceDB-3.0"):New("SpellAlerterDB",Defaults,"Default")
	gbl = self.db.global
	self:ProfileChanged()

	self:RegisterChatCommand("sa",self.OpenConfig)
	self:RegisterChatCommand("spellalerter",self.OpenConfig)

	self.db.RegisterCallback(self, "OnProfileChanged", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "ProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "ProfileChanged")

	if LDB then
		self.Launcher = LDB:NewDataObject("SpellAlerter", 
		{
			type = "launcher",
			icon = "Interface\\Icons\\Spell_Fire_Flare",
			OnClick = function(_, button)
				addon.OpenConfig()
			end,
			OnTooltipShow = function(tooltip)
				tooltip:AddLine("Spell Alerter")
				tooltip:AddLine(L["|cff99ff33Click|r to open the config"])
			end,
		})
		if LDBIcon then LDBIcon:Register("SpellAlerter",self.Launcher,self.db.global.Minimap) end
	end

	self:SetEnabledState(self.db.global.Enabled)
end

function addon:OnEnable()
	self.frame:Show()
	alert = alert or self:CreateAlert()
	self:ApplySettings()
	self:ApplyLock()
	self:LoadPositions()
	self:UpdateFilters()
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	PGUID = PGUID or UnitGUID("player")
	PNAME = UnitName("player")
end

function addon:OnDisable()
	if LDBIcon then LDBIcon:Hide("SpellAlerter") end
	self.frame:Hide()
end

function addon:SavePosition(anchor)
	pfl.Positions[anchor:GetName()] = {anchor:GetPoint()}
end

function addon:LoadPositions()
	for name,pos in pairs(pfl.Positions) do
		local f = _G[name]
		if f then f:ClearAllPoints() f:SetPoint(unpack(pos)) end
	end
end

function addon:GetAnchor()
	local anchor = CreateFrame("Frame",self.frame:GetName().."Anchor",self.frame)
	anchor:SetWidth(100)
	anchor:SetHeight(15)
	anchor.bg = anchor:CreateTexture(nil,"BACKGROUND")
	anchor.bg:SetTexture(SM:Fetch("background","Solid"))
	anchor.bg:SetAllPoints(true)
	anchor.bg:SetVertexColor(0,0,0,0.33)
	anchor.text = anchor:CreateFontString(nil,"ARTWORK")
	anchor.text:SetFont(SM:Fetch("font"),8)
	anchor.text:SetText("Spell Alerter Anchor")
	anchor.text:SetPoint("CENTER")
	anchor:SetMovable(true)
	anchor:EnableMouse(true)
	anchor:SetScript("OnMouseDown",function(self) self:StartMoving() end)
	anchor:SetScript("OnMouseUp",function(self) self:StopMovingOrSizing() addon:SavePosition(self) end)
	return anchor
end

function addon:CreateAlert()
	alert = CreateFrame("Frame","SpellAlerterFrameAlert",self.frame)
	alert.anchor = self:GetAnchor()
	alert:SetWidth(1); alert:SetHeight(1)
	alert:SetPoint("CENTER",alert.anchor,"CENTER")
	alert:SetFrameLevel(alert.anchor:GetFrameLevel()+1)
	alert.text = alert:CreateFontString(nil,"ARTWORK")
	alert.text2 = alert:CreateFontString(nil,"ARTWORK")
	alert.icon = alert:CreateTexture(nil,"ARTWORK")
	alert.icon:SetTexCoord(0.07,0.93,0.07,0.93)
	alert.icon:SetPoint("RIGHT",alert.text,"LEFT")
	alert.arrow = alert:CreateTexture(nil,"ARTWORK")
	alert.arrow:SetTexture("Interface\\Addons\\SpellAlerter\\Arrow")
	alert.arrow:SetHeight(0.2)
	alert.arrow:SetWidth(0.2)
	alert:Hide()
	alert:SetScript("OnUpdate",function(self,elapsed)
		self.elapsed = self.elapsed + elapsed
		if self.elapsed <= 0.1 then
			self:SetAlpha(1-((0.1-self.elapsed)/0.1))
		elseif self.elapsed <= 0.1 + pfl.HoldTime then
			self:SetAlpha(1)
		elseif self.elapsed <= 0.2 + pfl.HoldTime then
			self:SetAlpha((pfl.HoldTime + 0.2 - self.elapsed)/0.1)
		else
			self:SetAlpha(0)
			self:Hide()
		end
	end)
	return alert
end

function addon:ApplyLock()
	if self.db.global.Lock then
		alert.anchor:Hide()
	else
		alert.anchor:Show()
	end
end

function addon:ApplyMinimap()
	if LDBIcon then LDBIcon[self.db.global.Minimap.hide and "Hide" or "Show"](LDBIcon, "SpellAlerter") end
end

local function FixPoints(self,dstName,same)
	alert.text:ClearAllPoints()
	alert.text2:ClearAllPoints()
	alert.arrow:ClearAllPoints()
	if same then
		alert.text:SetPoint("CENTER",alert.anchor,"CENTER")
		alert.arrow:SetPoint("LEFT",alert.text,"RIGHT")
		alert.text2:Hide()
		alert.arrow:SetTexCoord(0.01,(512/9.1)/512,((512/12)*2.9)/512,((512/12)*3.9)/512)
		alert.arrow:Show()
	elseif dstName then
		alert.arrow:SetPoint("CENTER",alert.anchor,"CENTER")
		alert.text:SetPoint("RIGHT",alert.arrow,"LEFT")
		alert.text2:SetPoint("LEFT",alert.arrow,"RIGHT")
		alert.arrow:SetTexCoord(0,0.109375,0.73828125,0.8203125)
		alert.arrow:Show()
		alert.text2:Show()
	else
		alert.text:SetPoint("CENTER",alert.anchor,"CENTER")
		alert.arrow:Hide()
		alert.text2:Hide()
	end
end


function addon:ApplySettings()
	alert.text:SetFont(SM:Fetch("font",pfl.Font),pfl.FontSize,"THICKOUTLINE")
	alert.text2:SetFont(SM:Fetch("font",pfl.Font),pfl.FontSize,"THICKOUTLINE")
	alert.icon:SetWidth(pfl.IconSize)
	alert.icon:SetHeight(pfl.IconSize)

	alert.text:ClearAllPoints()
	alert.text:SetPoint("CENTER",alert.anchor,"CENTER")
	alert.text2:Hide()
	alert.arrow:Hide()
	if pfl.ShowIcon then alert.icon:Show() else alert.icon:Hide() end
	if pfl.ShowTarget and pfl.TargetGraphic == "arrow" then
		alert.FixPoints = FixPoints
	else
		alert.FixPoints = nil
	end
end


do
	local unitlist = {}
	local unit_to_unittarget = {}
	local levels = 3
	local END = ""

	local function addids(uid,lower,upper)
		if lower and upper then
			for i=lower,upper do
				unitlist[#unitlist+1] = uid..i
			end
		else
			unitlist[#unitlist+1] = uid
		end
	end
	
	addids("target")
	addids("arena",1,5)
	addids("focus")
	addids("party",1,4)
	addids("pettarget")
	addids("partypet",1,4)
	addids("raid",1,40)

	local function reset()
		wipe(unit_to_unittarget)
		for k,v in ipairs(unitlist) do unit_to_unittarget[k] = v end
	end

	reset()

	local targetof = setmetatable({},{
		__index = function(t,k)
			if type(k) ~= "string" then return end
			t[k] = k.."target"
			return t[k]
		end
	})

	function addon:FindTargetInfo(srcGUID)
		for i=1,levels do
			for k,id in ipairs(unit_to_unittarget) do
				if id ~= END and UnitExists(id) then 
					local nextid = targetof[id]
					if UnitGUID(id) == srcGUID then
						reset()
						return id,nextid,UnitExists(nextid)
					else
						unit_to_unittarget[k] = nextid
					end
				else
					unit_to_unittarget[k] = END
				end
			end
		end
		reset()
	end
end

function addon:FormatInfo(srcName,srcGUID,spellName,icon,sound,cat,color,forcedDst)
	local srcUnit,dstUnit,dstExists = self:FindTargetInfo(srcGUID)
	local valid = cat == SPELLCASTS and not Ignores[spellName] and dstExists
	local dstName
	if valid then dstName = PGUID == UnitGUID(dstUnit) and pfl.YouText or UnitName(dstUnit) end
	if forcedDst then dstName = forcedDst end


	local targetself = pfl.Filters[cat].TargetIsSelf
	if cat == SPELLCASTS and targetself and dstName ~= PNAME then return
	elseif cat == FRIENDLYDEBUFFS and targetself and srcName ~= PNAME then return end

	if sound then PlaySoundFile(SM:Fetch("sound",sound)) end
	local r,g,b = unpack(color)

	local same = srcName == dstName

	if pfl.ClassColored then
		if srcUnit then srcName = ColorName[srcUnit] or srcName end
		if valid then dstName = ColorName[dstUnit] or dstName end
	end

	if not pfl.ShowCaster and cat == SPELLCASTS then
		srcName = ""
	end

	if pfl.SpellNames then
		srcName = srcName ~= "" and srcName .. " - "..spellName or spellName
	end

	if pfl.ShowTarget and pfl.TargetGraphic == "text" then
		if same then 
			alert.text:SetText(srcName.." <")
		else 
			alert.text:SetText((dstExists and dstName) and srcName.." > "..dstName or srcName) 
		end
	else 
		alert.text:SetText(srcName) 
	end

	alert.text2:SetText(dstName)
	alert.icon:SetTexture(icon)
	alert.text:SetVertexColor(r,g,b)
	alert.text2:SetVertexColor(r,g,b)
	alert.arrow:SetVertexColor(r,g,b)
	if alert.FixPoints then alert:FixPoints(dstName,same) end
	alert.elapsed = 0
	alert:Show()
end

local COMBATLOG_TARGET	= COMBATLOG_OBJECT_TARGET
local COMBATLOG_FRIENDLY = COMBATLOG_OBJECT_REACTION_FRIENDLY
local COMBATLOG_HOSTILE = COMBATLOG_OBJECT_REACTION_HOSTILE
local COMBATLOG_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER

local SpellCastEvents = {
	SPELL_CAST_START = 1,
	SPELL_CAST_SUCCESS = 1,
	SPELL_CREATE = 1,
}

local StrippedName = setmetatable({},{
	__index = function(t,k)
		if not k then return end
		local stripped = match(k,"[^-]*")
		t[k] = stripped
		return t[k]
	end,
})

local SPELLCASTS_FILTER
local ENEMYBUFFS_FILTER
local FRIENDLYDEBUFFS_FILTER
local bor = bit.bor
function addon:UpdateFilters()
	local Filters = pfl.Filters
	SPELLCASTS_FILTER = bor(
		Filters.SpellCasts.Players and COMBATLOG_OBJECT_TYPE_PLAYER or 0,
		Filters.SpellCasts.NPCs and COMBATLOG_OBJECT_TYPE_NPC or 0
	)
	ENEMYBUFFS_FILTER = bor(
		Filters.EnemyBuffs.Players and COMBATLOG_OBJECT_TYPE_PLAYER or 0,
		Filters.EnemyBuffs.NPCs and COMBATLOG_OBJECT_TYPE_NPC or 0
	)
	FRIENDLYDEBUFFS_FILTER = bor(
		Filters.FriendlyDebuffs.Players and COMBATLOG_OBJECT_TYPE_PLAYER or 0,
		Filters.FriendlyDebuffs.NPCs and COMBATLOG_OBJECT_TYPE_NPC or 0
	)
end

local band = bit.band
function addon:COMBAT_LOG_EVENT_UNFILTERED(_, _, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellID, spellName, _, auraType)
	if not spellID then return end
	if SpellCastEvents[eventtype] and band(srcFlags, COMBATLOG_HOSTILE) == COMBATLOG_HOSTILE and SpellCasts[spellName] then
		if pfl.TargetOnly and band(srcFlags) ~= COMBATLOG_TARGET then return end
		if band(SPELLCASTS_FILTER,srcFlags) == 0 then return end
		self:FormatInfo(StrippedName[srcName],srcGUID,spellName,Icons[spellID],SpellCasts[spellName].Sound,SPELLCASTS,colors[SpellCasts[spellName].Color])
	elseif eventtype == "SPELL_AURA_APPLIED" then
		if pfl.TargetOnly and band(dstFlags) ~= COMBATLOG_TARGET then return end
		if auraType == "BUFF" and band(dstFlags,COMBATLOG_HOSTILE) == COMBATLOG_HOSTILE and EnemyBuffs[spellName] and band(ENEMYBUFFS_FILTER,dstFlags) > 0 then
			self:FormatInfo(StrippedName[dstName],dstGUID,spellName,Icons[spellID],EnemyBuffs[spellName].Sound,ENEMYBUFFS,colors[EnemyBuffs[spellName].Color])
		elseif auraType == "DEBUFF" and band(dstFlags,COMBATLOG_FRIENDLY) == COMBATLOG_FRIENDLY and FriendlyDebuffs[spellName] and band(FRIENDLYDEBUFFS_FILTER) > 0 then
			self:FormatInfo(StrippedName[dstName],dstGUID,spellName,Icons[spellID],FriendlyDebuffs[spellName].Sound,FRIENDLYDEBUFFS,colors[FriendlyDebuffs[spellName].Color])
		end
	end
end

local function IsDisabled()
	return not addon.db.global.Enabled
end

function addon:GetOptions()
	return {
		type = "group",
		name = L["Spell Alerter"],
		order = 100,
		args = {
			About = {
				type = "group",
				name = L["About"],
				order = -1,
				args = {
					author = {
						type = "description",
						name = "Author: |cffffd200Kollektiv|r\
\
Website: |cffffd200http://wow.curse.com/downloads/wow-addons/details/spell-alerter.aspx|r",
						order = 100,
					},
				},
			},
			Enabled = {
				type = "toggle",
				name = L["Enabled"],
				order = 25,
				get = function() return self.db.global.Enabled end,
				set = function(info,value) self.db.global.Enabled = value; self:SetEnabledState(value); if value then self:Enable() else self:Disable() end end,
				width = "half",
			},
			Lock = {
				type = "toggle",
				name = L["Lock"],
				set = function(info,value) self.db.global.Lock = value; self:ApplyLock() end,
				get = function(info) return self.db.global.Lock end,
				order = 55,
				disabled = IsDisabled,
				width = "half",
			},
			ShowMinimap = {
				type = "toggle",
				name = L["Minimap"],
				set = function(info,value) self.db.global.Minimap.hide = not value; self:ApplyMinimap() end,
				get = function(info) return not self.db.global.Minimap.hide end,
				order = 56,
				disabled = IsDisabled,
				width = "half",
			},
			Test = {
				type = "execute",
				name = L["Test"],
				order = 60,
				func = function() self:FormatInfo(UnitName("player"),UnitGUID("player"),"Earth Shield","Interface\\Icons\\Spell_Nature_SkinofEarth","Bell Toll Alliance",SPELLCASTS,colors.YELLOW,"Kollektor") end,
				width = "half",
				disabled = IsDisabled,
			},
			Version = {
				type = "description",
				name = "|cff00ff00"..L["Version"].."|r: "..GetAddOnMetadata("SpellAlerter","Version"),
				order = 80,
			},
			
			Settings_Group = {
				type = "group",
				name = L["Settings"],
				order = 100,
				get = function(info) return pfl[info[#info]] end,
				set = function(info,value) pfl[info[#info]] = value; self:ApplySettings() end,
				disabled = IsDisabled,
				args = {
					Toggles_Group = {
						type = "group",
						name = L["Toggles"],
						order = 100,
						inline = true,
						args = {
							General_Group = {
								type = "group",
								name = L["General"],
								order = 100,
								args = {
									ShowIcon = {
										type = "toggle",
										name = L["Show icon"],
										order = 200,
									},
									SpellNames = {
										type = "toggle",
										name = L["Show spell names"],
										order = 300,
									},
									TargetOnly = {
										type = "toggle",
										name = L["Targeted unit only"],
										desc = L["Show alerts only on your targeted unit"],
										order = 350,
									},
									ClassColored = {
										type = "toggle",
										name = L["Class colored"],
										desc = L["Is not 100% reliable outside of arena. Overrides colors in Spell List"],
										order = 400,
									},
								},
							},
							Filters_Group = {
								type = "group",
								name = L["Filters"],
								order = 150,
								inline = true,
								get = function(info) return pfl.Filters[info[#info-1]][info[#info]] end,
								set = function(info,v) pfl.Filters[info[#info-1]][info[#info]] = v; addon:UpdateFilters() end,
								args = {
									SpellCasts = {
										type = "group",
										name = L["Spell Casts"],
										order = 100,
										args = {
											Players = {
												type = "toggle",
												name = L["Players"],
												order = 100,
											},
											NPCs = {
												type = "toggle",
												name = L["NPCs"],
												order = 200,
											},
											TargetIsSelf = {
												type = "toggle",
												name = L["Target is YOU"],
												desc = L["Show alerts only if the spell is going to affect you. Not 100% reliable outside of arena"],
												order = 300,
											},
										},
									},
									EnemyBuffs = {
										type = "group",
										name = L["Enemy Buffs"],
										order = 200,
										args = {
											Players = {
												type = "toggle",
												name = L["Players"],
												order = 100,
											},
											NPCs = {
												type = "toggle",
												name = L["NPCs"],
												order = 200,
											},
										},
									},
									FriendlyDebuffs = {
										type = "group",
										name = L["Friendly Debuffs"],
										order = 300,
										args = {
											Players = {
												type = "toggle",
												name = L["Players"],
												order = 100,
											},
											NPCs = {
												type = "toggle",
												name = L["NPCs"],
												order = 200,
											},
											TargetIsSelf = {
												type = "toggle",
												name = L["Target is YOU"],
												desc = L["Show alerts only if the spell is going to affect you. Not 100% reliable outside of arena"],
												order = 300,
											},
										},
									},
								},
							},
						},
					},
					
					Sliders_Group = {
						type = "group",
						name = L["Sliders"],
						order = 200,
						inline = true,
						args = {
							HoldTime = {
								type = "range",
								name = L["Hold time"],
								order = 400,
								min = 0.5,
								max = 5,
								step = 0.1,
							},
							IconSize = {
								type = "range",
								name = L["Icon size"],
								order = 500,
								min = 10,
								max = 100,
								step = 1,
							},
							FontSize = {
								type = "range",
								name = L["Font size"],
								order = 600,
								min = 10,
								max = 40,
								step = 1,
							},
						},
					},
					LookAndFeel_Group = {
						type = "group",
						name = L["Look and feel"],
						order = 300,
						inline = true,
						args = {
							Font = {
								type = "select",
								name = L["Font"],
								order = 100,
								values = function()
									self.fonts = self.fonts or {}
									wipe(self.fonts)
									for _, name in pairs(SM:List("font")) do self.fonts[name] = name end
									return self.fonts
								end,
							},
							YouText = {
								type = "input",
								name = L["Replace player name with..."],
								order = 200,
							},
						},
					},
					ShowTarget = {
						type = "toggle",
						name = L["Show target"],
						order = 350,
					},
					Target_Group = {
						type = "group",
						name = L["Targets"],
						order = 400,
						disabled = function() return not pfl.ShowTarget or IsDisabled() end,
						inline = true,
						args = {
							TargetGraphic = {
								type = "select",
								name = L["Target graphic"],
								order = 900,
								values = {
									arrow = L["Arrow"],
									text = L["Text"],
								},
							},
						},
					},
				},
			},
			Spell_List_Group = {
				type = "group",
				name = L["Spell List"],
				order = 200,
				disabled = IsDisabled,
				args = {
					CategorySelect = {
						type = "select",
						name = L["Category"],
						order = 50,
						set = function(info,value) ListSelect = nil; pfl.CategorySelect = value end,
						get = function() return pfl.CategorySelect end,
						values = CategoryValues,
					},
					Category_Header = {
						type = "header",
						name = "",
						order = 60,
					},
					Add_Desc = {
						type = "description",
						name = L["Enter a spell name and select one. IMPORTANT: It is case sensitive"],
						order = 70,
					},
					Add_Editbox = {
						type = "input",
						name = L["Add"],
						get = function() return "" end,
						set = function(info,value)
							pfl[pfl.CategorySelect][value] = {Color = "RED"}
							ListSelect = value
						end,
						dialogControl = "Spell_EditBox",
						order = 120,
					},
					Blank1 = {
						type = "description",
						name = "",
						order = 130,
					},
					List_Select_Group = {
						type = "group",
						name = function() return CategoryValues[pfl.CategorySelect].." "..L["List"] end,
						order = 140,
						inline = true,
						args = {
							List_Select = {
								type = "select",
								name = "",
								order = 140,
								get = function() return ListSelect end,
								set = function(info,value) ListSelect = value end,
								values = function() 
									self.listTemp = self.listTemp or {}
									wipe(self.listTemp)
									for k,v in pairs(pfl[pfl.CategorySelect]) do
										self.listTemp[k] = colorHexes[v.Color]:sub(1,10)..k.."|r"
									end
									return self.listTemp
								end,
								dialogControl = "SA_FauxScrollFrame",
							},
							Delete = {
								type = "execute",
								name = L["Delete"],
								order = 145,
								func = function()
									pfl[pfl.CategorySelect][ListSelect] = nil
									ListSelect = nil
								end,
								disabled = function() return not ListSelect or IsDisabled() end,
								width = "half",
							},
							Attributes_Group = {
								type = "group",
								name = function()
									if not ListSelect then
										return L["Attributes"] 
									else
										return L["Attributes"] .." of "..ListSelect
									end
								end,
								order = 250,
								inline = true,
								set = function(info,value)
									if not ListSelect then return end
									pfl[pfl.CategorySelect][ListSelect][info[#info]] = value
								end,
								get = function(info)
									if not ListSelect then return end
									return pfl[pfl.CategorySelect][ListSelect][info[#info]]
								end,
								disabled = function() return not ListSelect or IsDisabled() end,
								args = {
									Color = {
										type = "select",
										name = L["Color"],
										order = 250,
										values = colorHexes,
									},
									Sound = {
										type = "select",
										name = L["Sound"],
										order = 300,
										values = function()
											self.sounds = self.sounds or {}
											wipe(self.sounds)
											for _, name in pairs(SM:List("sound")) do self.sounds[name] = name end
											return self.sounds	
										end,
										dialogControl = "LSM30_Sound",
									},
								},
							},
						},
					},
				},
			},
			Target_Ignore_Group = {
				type = "group",
				name = L["Ignores"],
				order = 300,
				disabled = IsDisabled,
				args = {
					desc1 = {
						type = "description",
						name = L["These are Spell Casts that won't show targets\n"],
						order = 100,
					},
					Add_Desc = {
						type = "description",
						name = L["Enter a spell name and select one. IMPORTANT: It is case sensitive"],
						order = 150,
					},
					Add_Editbox = {
						type = "input",
						name = L["Add"],
						get = function() return "" end,
						set = function(info,value)
							Ignores[value] = value
							ListSelect2 = value
						end,
						dialogControl = "Spell_EditBox",
						order = 175,
					},
					blank = { type = "description", name = "", order = 190},
					List_Select2 = {
						type = "select",
						name = "",
						order = 200,
						get = function() return ListSelect2 end,
						set = function(info,value) ListSelect2 = value end,
						values = function() return Ignores end,
						dialogControl = "SA_FauxScrollFrame",
					},
					Delete = {
						type = "execute",
						name = L["Delete"],
						order = 250,
						func = function()
							pfl.Ignores[ListSelect2] = nil
							ListSelect2 = nil
						end,
						disabled = function() return not ListSelect2 or IsDisabled() end,
						width = "half",
					},
				},
			},
		},
	}
end

