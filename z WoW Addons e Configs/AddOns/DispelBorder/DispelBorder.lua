--DispelBorder v1.4.0

--v1.4.0
-- * Now checks UID in UnitBuff/UnitAura hooks to prevent filter logic from happening unneccesarily. Should prevent many strange things with other addons
--v1.3.9
-- * Fixed bug with alternate UnitBuff/UnitAura signatures not working (unit, spellname, spellrank, filter)
-- * Fixed bug with highlighting Enrage buffs on focus target
--v1.3.8
-- * Fixed bug where buffs on friendly focus targets would be given borders
--v1.3.7
-- * Added support for focus frame buffs, reorganized options
--v1.3.6
-- * Removed friendly dispel border
-- * Removed UnitDebuff hook and ignores UnitAura with HARMFUL filter
--v1.3.5
-- * Added support for new UnitAura/Buff/Debuff parameters
--v1.3.4
-- * Bumped TOC for 3.3.0
--v1.3.3
-- * Fixed bug with classes that can dispel enrages
--v1.3.2
-- * Fixed bug with missing nil check in DispelBorder_UnitAura
--v1.3.1
-- * Fixed bug with "L" on line 71/72
--v1.3
-- * Removed old method code (hooking TargetFrame_UpdateAuras)
-- * Added option to enlarge dispellable enemy buffs
-- * Added option to enlarge dispellable friendly debuffs
-- * Added option to enlarge spellstealable buffs
-- * Removed custom Stealable frame on debuffs, now utilizes standard debuff border
-- * Cleaned up UnitBuff/UnitDebuff/UnitAura hooks
-- * Changed default options
--v1.2
-- * Now hooks UnitBuff/UnitAura and modifies isStealable return value
--   Should allow at least enemy buff borders to work on all unitframe addons
--   Old method still available as an option
-- * Added changelog to lua
--v1.1
-- * Fixed bug where debuff borders weren't always hidden
--v1.0
-- * Added support for showing borders around dispellable debuffs on friendly targets
-- * Added Ace3 config stuff
--v0.1
-- * Initial release


--This is where I can easily add localization for tooltip reading
--05/04/10: apparently this is not neccesary as the tooltip shows "Enrage" in all languages...going to keep it though
local ENRAGE_STRING
if (GetLocale() == "enUS") then
	ENRAGE_STRING = "Enrage"
else
	ENRAGE_STRING = "Enrage"
end


DispelBorder = LibStub("AceAddon-3.0"):NewAddon("DispelBorder", "AceConsole-3.0")
DispelBorder.version = "1.4.0"
DispelBorder.date = "2010-05-03"


-- our tooltip frame so we can look for enrage buffs
local DBT = CreateFrame("GameTooltip","DispelBorderTooltip", nil, "GameTooltipTemplate")
local function ResetTooltip()
	DBT:Hide()
	DBT:SetOwner(WorldFrame, "ANCHOR_NONE")
	DBT:ClearLines()
end


-- class name storage
local _, eclass = UnitClass("player")


-- original versions of API calls
local old_UnitBuff = UnitBuff
local old_UnitAura = UnitAura


-- AceConfig options tree
local options = {
	name = "DispelBorder",
	type = "group",
	get = function(info) return DispelBorder.db.profile[info[#info]] end,
	set = function(info, value) DispelBorder.db.profile[info[#info]] = value end,

	args = {
		General = {
			order = 1,
			type = "group",
			name = "General Settings",
			desc = "General Settings",
			args = {
				desc = {
					type = "description",
					order = 1,
					name = "Addon that shows the same border around dispellable buffs that appears around spellstealable buffs",
				},
				hdr1 = {
					type = "header",
					name = "Dispellable Enemy Buffs on Target Frame",
					order = 2,
				},
				enabletarget = {
					type = "toggle",
					order = 3,
--					width = "double",
					name = "Enabled",
					desc = "Enables/disables border around dispellable buffs",
				},
				enlargetarget = {
					type = "toggle",
					order = 4,
					width = "double",
					name = "Enlarge Dispellable Enemy Buffs",
					desc = "Shows the dispellable buff as enlarged, as if you had casted it. Will work similarly with any unitframe addon that distinguishes buffs you casted.",
				},
				enlargesstarget = {
					type = "toggle",
					order = 5,
					width = "double",
					name = "Enlarge Spellstealable Buffs",
					desc = "Enlarges buffs that are actually spellstealable for a mage (mage only)",
				},
				hdr2 = {
					type = "header",
					name = "Dispellable Enemy Buffs on Focus Frame",
					order = 6,
				},
				enablefocus = {
					type = "toggle",
					order = 7,
--					width = "double",
					name = "Enabled",
					desc = "Enables/disables border around dispellable buffs",
				},
				enlargefocus = {
					type = "toggle",
					order = 8,
					width = "double",
					name = "Enlarge Dispellable Enemy Buffs",
					desc = "Shows the dispellable buff as enlarged, as if you had casted it. Will work similarly with any unitframe addon that distinguishes buffs you casted.",
				},
				enlargessfocus = {
					type = "toggle",
					order = 9,
					width = "double",
					name = "Enlarge Spellstealable Buffs",
					desc = "Enlarges buffs that are actually spellstealable for a mage (mage only)",
				},
			},
		},
	},
}
DispelBorder.Options = options
local defaults = {
	profile =  {
		enabletarget = true,
		enlargetarget = false,
		enlargesstarget = false,

		enablefocus = true,
		enlargefocus = false,
		enlargessfocus = false,
	},
}


function DispelBorder:OnInitialize()
	self.OptionsFrames = {}
	
	self.db = LibStub("AceDB-3.0"):New("DispelBorderDB", defaults, "Default")
	options.args.Profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.args.Profiles.cmdHidden = true
	options.args.Profiles.order = -1
	
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("DispelBorder", options)
	
	self.OptionsFrames.General = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DispelBorder", nil, nil, "General")
	self.OptionsFrames.Profiles = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DispelBorder", "Profiles", "DispelBorder", "Profiles")
	
	self:RegisterChatCommand("dispelborder", "SlashCmd")
	self:RegisterChatCommand("disb", "SlashCmd")
end


function DispelBorder:SlashCmd(s)
	s = s:trim()
	s = s:lower()
	if (s == "show") then
		InterfaceOptionsFrame_OpenToCategory(self.OptionsFrames.Profiles)
		InterfaceOptionsFrame_OpenToCategory(self.OptionsFrames.General)
	else
		LibStub("AceConfigCmd-3.0").HandleCommand(DispelBorder, "disb", "DispelBorder", s)
	end
end


-- new method hooks UnitAura and UnitBuff, this does the work for both function hooks
-- for buffs, returns a modified isStealable flag directly to the UI
-- also optionally modifies the "unitCaster" return value to make stealable/dispellable buffs appear larger
-- also debuffType could be modified (set to "Enrage" if the buff is actually an enrage buff, instead of blank string)
function DispelBorder_CheckBuff(name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID, ...)
	-- this is the only one we need specifically, but all may be needed by Enrage-checking code below
	local uid = select(1,...)
	
	-- if unitbuff/unitaura is being called on a unit that isn't target or focus, ignore it and return default data
	if (uid ~= "target" and uid ~= "focus") then
		return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
	end

	-- if buff is actually stealable (we are a mage) and we should enlarge it
	if (isStealable and ((uid == "target" and DispelBorder.db.profile.enlargesstarget) or (uid == "focus" and DispelBorder.db.profile.enlargessfocus))) then
		unitCaster = "player"

	-- if we have borders enabled for this unit type, this class can dispel enemy buffs in general, and the unit is an enemy
	elseif (((uid == "target" and DispelBorder.db.profile.enabletarget) or (uid == "focus" and DispelBorder.db.profile.enablefocus)) and DispelBorder_CanDispelEnemy() and UnitIsEnemy("player", uid)) then
		-- check for valid dispellable buff
		
		-- check for Enrage buffs (but only if there is no "known" type and the player can even dispel them)
		-- if it is, change the "debuffType" so 1) our type-checking code is simpler 2) other addons could potentially get this info (?)
		if (debuffType == "" and DispelBorder_CanDispelEnemyType("Enrage")) then
			ResetTooltip()
			DBT:SetUnitBuff(...) -- pass exact UnitBuff/UnitAura parameters to SetUnitBuff to make things easier
			if (DispelBorderTooltipTextRight1:GetText() == ENRAGE_STRING) then
				debuffType = "Enrage"
			end
		end

		-- if we can dispel it
		if (DispelBorder_CanDispelEnemyType(debuffType)) then
			-- give it a border
			isStealable = 1
			
			-- should we enlarge it?
			if ((uid == "target" and DispelBorder.db.profile.enlargetarget) or (uid == "focus" and DispelBorder.db.profile.enlargefocus)) then
				unitCaster = "player"
			end
		end
	end

	-- return all parameters (debuffType, unitCaster, and isStealable are potentially modified)
	return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
end

-- API hook
-- modified in 1.3.9 to work with (unit, spellname, spellrank, filter)
-- in addition to (unit, index, filter)
function DispelBorder_UnitBuff(...)
	-- get default stuff
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID  = old_UnitBuff(...)

	-- if unitbuff is being called on a unit that isn't target or focus, ignore it and return default data
	local uid = select(1,...)
	if (uid ~= "target" and uid ~= "focus") then
		return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
	end

	-- check actual buff info and return potentially modified info based on if we can dispel or not
	return DispelBorder_CheckBuff(name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID, ...)
end

-- API hook
-- modified in 1.3.9 to work with (unit, spellname, spellrank, filter)
-- in addition to (unit, index, filter)
function DispelBorder_UnitAura(...)
	local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = old_UnitAura(...)
	
	-- if unitaura is being called on a unit that isn't target or focus, ignore it and return default data
	local uid = select(1,...)
	if (uid ~= "target" and uid ~= "focus") then
		return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
	end
	
	-- get filter from the vararg list (can be 3 or 4 or non-existant) to see if we want buffs or debuffs
	local filter = nil
	local argc = select('#',...)
	-- if there are 3 args and it is (unit, index, filter)
	if (argc == 3 and type(select(2,...)) == "number") then
		filter = select(3,...)
	-- if there are 4 args
	elseif (argc == 4) then
		filter = select(4,...)
	end
	
	-- are we looking for a debuff?
	if (filter and filter:upper():find("HARMFUL")) then
		-- removed debuff check, but the if-block logic we have now works fine so this is still here
		return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID		
	-- or a buff? (UnitAura defaults to a "HELPFUL" filter)
	else
		-- check actual buff info and return potentially modified info based on if we can dispel or not
		return DispelBorder_CheckBuff(name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID, ...)
	end
	
	-- should never get here but better safe than sorry
	return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
end
-- hook functions
UnitBuff = DispelBorder_UnitBuff
UnitAura = DispelBorder_UnitAura


-- just some helper functions to check dispel type logic

-- can this class dispel enemy buffs at all?
function DispelBorder_CanDispelEnemy()
	-- technically mages can also dispel enemy buffs, but only spellstealable ones and they get the border by default so ignore them
	-- if we include them, they would incorrectly get borders around all magic buffs, even ones they cannot actually spellsteal
	if (eclass == "HUNTER" or eclass == "PRIEST" or eclass == "SHAMAN" or eclass == "WARLOCK" or eclass == "WARRIOR" or eclass == "ROGUE") then
		return true
	end
	
	return false
end

-- can this class dispel specific enemy buffs (of type t)?
function DispelBorder_CanDispelEnemyType(t)
	if (t == "Magic") then
		-- once again ignoring mages
		if (eclass == "HUNTER" or eclass == "PRIEST" or eclass == "SHAMAN" or eclass == "WARLOCK" or eclass == "WARRIOR") then
			return true
		end
	elseif (t == "Enrage") then
		if (eclass == "HUNTER" or eclass == "ROGUE") then
			return true
		end
	end
	
	return false
end
