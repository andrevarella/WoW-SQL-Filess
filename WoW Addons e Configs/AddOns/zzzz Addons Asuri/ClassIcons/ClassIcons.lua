local AddonName, ClassIcons = ...;

local LibCreatureType = LibStub("LibBabble-CreatureType-3.0"):GetReverseLookupTable();

local Icons = {
	-- list of all icons available:
	["ABERRATION"] = "ABERRATION",
	["BEAST"] = "BEAST",
	["CRITTER"] = "CRITTER",
	["DEATHKNIGHT"] = "DEATHKNIGHT",
	["DEMON"] = "DEMON",
	["DRAGONKIN"] = "DRAGONKIN",
	["DEMONHUNTER"] = "DEMONHUNTER",
	["DRUID"] = "DRUID",
	["ELEMENTAL"] = "ELEMENTAL",
	["GIANT"] = "GIANT",
	["HUMANOID"] = "HUMANOID",
	["HUNTER"] = "HUNTER",
	["MAGE"] = "MAGE",
	["MECHANICAL"] = "MECHANICAL",
	["MONK"] = "MONK",
	["PALADIN"] = "PALADIN",
	["PRIEST"] = "PRIEST",
	["ROGUE"] = "ROGUE",
	["SAVAGEPET"] = "SAVAGEPET",
	["SHAMAN"] = "SHAMAN",
	["TOTEM"] = "TOTEM",
	["UNDEAD"] = "UNDEAD",
	["UNKNOWN"] = "UNKNOWN",
	["WARLOCK"] = "WARLOCK",
	["WARRIOR"] = "WARRIOR",

	["NON-COMBAT PET"] = "CRITTER",
	["WILD PET"] = "SAVAGEPET",
};

function ClassIcons_OnLoad(self)
	-- Set up slash commands
	SlashCmdList["CLASSICONS"] = ClassIcons_CmdHandler;
	SLASH_CLASSICONS1 = "/classicons";
	SLASH_CLASSICONS2 = "/ci";

	-- Register for events
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("PLAYER_FOCUS_CHANGED");
	self:RegisterEvent("PARTY_MEMBER_ENABLE");
end;

function ClassIcons_Print(msg, header)
	if ( msg == nil ) then
		msg = "nil";
	end;

	if ( header == nil ) then
		header = true;
	end;

	if ( header == true ) then
		msg = "[ClassIcons] "..msg;
	end;

	if ( DEFAULT_CHAT_FRAME ) then
		DEFAULT_CHAT_FRAME:AddMessage(msg, 0.5, 0.5, 1.0);
	end;
end;

function Ternary(condition, valtrue, valfalse)
	if ( condition ) then
		return valtrue;
	else
		return valfalse;
	end;
end;

function ClassIcons_CmdHandler(msg)
	msg = strlower(msg);
	local _, _, cmd, arg1, arg2 = string.find(msg, "(%w+)[ ]?(%w*)[ ]?([-%w]*)");

	if ( cmd == "on" ) then
		CLASSICONS_CONFIG.Active = true;
		ClassIcons_Print("Activated.");

		ClassIcons_UpdatePlayerFrame();
		ClassIcons_UpdateTargetFrame();
		ClassIcons_UpdateFocusFrame();
		ClassIcons_UpdatePartyFrames();

		return;
	end;

	if ( cmd == "off" ) then
		CLASSICONS_CONFIG.Active = false;
		ClassIcons_Print("Deactivated.");

		ClassIcons_UpdatePlayerFrame();
		ClassIcons_UpdateTargetFrame();
		ClassIcons_UpdateFocusFrame();
		ClassIcons_UpdatePartyFrames();

		return;
	end;

	if ( cmd == "player" ) then
		if ( arg1 == "on" ) then
			CLASSICONS_CONFIG.Player = true;
		elseif ( arg1 == "off" ) then
			CLASSICONS_CONFIG.Player = false;
		else
			CLASSICONS_CONFIG.Player = not CLASSICONS_CONFIG.Player;
		end;

		ClassIcons_Print("Player icon "..Ternary(CLASSICONS_CONFIG.Player, "on.", "off."));

		ClassIcons_UpdatePlayerFrame();

		return;
	end;

	if ( cmd == "target" ) then
		if ( arg1 == "on" ) then
			CLASSICONS_CONFIG.Target = true;
		elseif ( arg1 == "off" ) then
			CLASSICONS_CONFIG.Target = false;
		else
			CLASSICONS_CONFIG.Target = not CLASSICONS_CONFIG.Target;
		end;

		ClassIcons_Print("Target icon "..Ternary(CLASSICONS_CONFIG.Target, "on.", "off."));

		ClassIcons_UpdateTargetFrame();

		return;
	end;

	if ( cmd == "focus" ) then
		if ( arg1 == "on" ) then
			CLASSICONS_CONFIG.Focus = true;
		elseif ( arg1 == "off" ) then
			CLASSICONS_CONFIG.Focus = false;
		else
			CLASSICONS_CONFIG.Focus = not CLASSICONS_CONFIG.Focus;
		end;

		ClassIcons_Print("Focus icon "..Ternary(CLASSICONS_CONFIG.Focus, "on.", "off."));

		ClassIcons_UpdateFocusFrame();

		return;
	end;

	if ( cmd == "party" ) then
		if ( arg1 == "on" ) then
			CLASSICONS_CONFIG.Party = true;
		elseif ( arg1 == "off" ) then
			CLASSICONS_CONFIG.Party = false;
		else
			CLASSICONS_CONFIG.Party = not CLASSICONS_CONFIG.Party;
		end;

		ClassIcons_Print("Party icons "..Ternary(CLASSICONS_CONFIG.Party, "on.", "off."));

		ClassIcons_UpdatePartyFrames();

		return;
	end;

	if ( cmd == "angle" ) then
		arg2 = tonumber(arg2);

		if ( arg2 == nil ) or ( arg2 < 0 ) or ( arg2 > 359 ) then
			ClassIcons_Print("Please enter a number between 0 and 359.");
			return;
		end;

		if ( arg1 == "player" ) then
			CLASSICONS_CONFIG.PlayerAngle = arg2;
		elseif ( arg1 == "target" ) then
			CLASSICONS_CONFIG.TargetAngle = arg2;
		elseif ( arg1 == "party" ) then
			CLASSICONS_CONFIG.PartyAngle = arg2;
		elseif ( arg1 == "focus" ) then
			CLASSICONS_CONFIG.FocusAngle = arg2;
		else
			ClassIcons_Print("Please enter one of player / party / target.");
			return;
		end;

		ClassIcons_UpdateIconPositions();

		return;
	end;

	if ( cmd == "mobsuse" ) then

		if ( arg1 == "class" ) or ( arg1 == "type" ) or ( arg1 == "none" ) then
			CLASSICONS_CONFIG.MobsUse = arg1;
		else
			ClassIcons_Print("Please enter one of class, type, or none.");
			return;
		end;

		ClassIcons_Print("Mob icons set to use "..CLASSICONS_CONFIG.MobsUse);

		ClassIcons_OnEvent("PLAYER_TARGET_CHANGE");

		return;
	end;

	-- Unknown command input, print usage statement
	ClassIcons_Print("Command list: ");
	ClassIcons_Print("on/off - control all icon visibility.", false);
	ClassIcons_Print("player/party/target/focus [on/off] - control individual icon visibility.", false);
	ClassIcons_Print("angle [player/party/target/focus] [number] - control the angle icons are set to.", false);
	ClassIcons_Print("mobsuse [class/type/none] - control whether monster icons display class, type, or are hidden.", false);
end;

function ClassIcons_UpdateIcon(frame, unit, setting)
	if ( not frame ) or ( not unit ) then
		return;
	end;

	local _G = getfenv();
	local icon = _G[frame.."ClassIcon"];
	local texture = _G[frame.."ClassIconTexture"];

	if ( not icon ) or ( not texture ) then
		return;
	end;

	local UnitIsMob = not UnitIsPlayer(unit);

	if ( CLASSICONS_CONFIG.Active == false ) or ( setting == false ) or ( ( CLASSICONS_CONFIG.MobsUse == "none" ) and UnitIsMob ) then
		icon:Hide();
		return;
	end;

	local _, texturefile = UnitClass(unit);

	if ( UnitIsMob ) and ( CLASSICONS_CONFIG.MobsUse == "type" ) then
		local ct_loc = UnitCreatureType(unit);
		local ct = strupper( LibCreatureType[ct_loc] or ct_loc or "" );

		texturefile = Icons[ct];
	elseif ( not UnitIsMob ) and ( not Icons[texturefile] ) then
		-- class is not (yet) supported by this addon
		texturefile = "Not specified";
	end;

	if ( not texturefile ) or ( texturefile == "Not specified" ) then
		texturefile = "UNKNOWN";
	end;

	icon:Show();

	texture:SetTexture("Interface\\AddOns\\ClassIcons\\Icons\\"..texturefile..".blp");
end;

function ClassIcons_UpdateIconPositions()
	local x,y,r;

	--PLAYER
	r = floor(PlayerFrame.portrait:GetWidth()/1.8);
	x = ceil(r*cos(CLASSICONS_CONFIG.PlayerAngle));
	y = ceil(r*sin(CLASSICONS_CONFIG.PlayerAngle));

	PlayerFrameClassIcon:ClearAllPoints();
	PlayerFrameClassIcon:SetPoint("CENTER", PlayerFrame.portrait, "CENTER", x, y);

	--TARGET
	r = floor(TargetFrame.portrait:GetWidth()/1.8);
	x = ceil(r*cos(CLASSICONS_CONFIG.TargetAngle));
	y = ceil(r*sin(CLASSICONS_CONFIG.TargetAngle));

	TargetFrameClassIcon:ClearAllPoints();
	TargetFrameClassIcon:SetPoint("CENTER", TargetFrame.portrait, "CENTER", x, y);

	--FOCUS
	r = floor(FocusFrame.portrait:GetWidth()/1.8);
	x = ceil(r*cos(CLASSICONS_CONFIG.FocusAngle));
	y = ceil(r*sin(CLASSICONS_CONFIG.FocusAngle));

	FocusFrameClassIcon:ClearAllPoints();
	FocusFrameClassIcon:SetPoint("CENTER", FocusFrame.portrait, "CENTER", x, y);

	--PARTY
	r = floor(PartyMemberFrame1.portrait:GetWidth()/1.8);
	x = ceil(r*cos(CLASSICONS_CONFIG.PartyAngle));
	y = ceil(r*sin(CLASSICONS_CONFIG.PartyAngle));

	for i = 1, 4 do
		_G["PartyMemberFrame"..i.."ClassIcon"]:ClearAllPoints();
		_G["PartyMemberFrame"..i.."ClassIcon"]:SetPoint("CENTER", _G["PartyMemberFrame"..i].portrait, "CENTER", x, y);
	end;

end;

--if savedVar is nil or wrong type set it to a standard value
local function CheckVar(key, standard)
	if ( type(CLASSICONS_CONFIG[key]) ~= type(standard) ) then
		CLASSICONS_CONFIG[key] = standard;
	end;
end;

local DBSetup = {
	["Active"] = true;
	["Player"] = true;
	["Party"] = true;
	["Focus"] = true;
	["Target"] = true;
	["MobsUse"] = "type";
	["PlayerAngle"] = 45;
	["PartyAngle"] = 45;
	["TargetAngle"] = 135;
	["FocusAngle"] = 135;
};

function ClassIcons_OnEvent(self, event, arg1)
	if ( (event == "ADDON_LOADED") and (arg1 == AddonName) ) then
		if ( not CLASSICONS_CONFIG ) then
			CLASSICONS_CONFIG = {};
		end;

		for key, val in pairs(DBSetup) do
			CheckVar(key, val);
		end;

		ClassIcons_UpdateIconPositions();
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		ClassIcons_UpdatePlayerFrame();
	elseif ( event == "PLAYER_TARGET_CHANGED" ) then
		ClassIcons_UpdateTargetFrame();
	elseif ( event == "PLAYER_FOCUS_CHANGED" ) then
		ClassIcons_UpdateFocusFrame();
	elseif ( event == "GROUP_ROSTER_UPDATE" or event == "PARTY_MEMBER_ENABLE" ) then
		ClassIcons_UpdatePartyFrames();
	end;
end;

function ClassIcons_Icon_OnLoad(self)
	self:SetFrameLevel(self:GetFrameLevel()+2);
end;

function ClassIcons_UpdatePlayerFrame()
	ClassIcons_UpdateIcon("PlayerFrame", "player", CLASSICONS_CONFIG.Player);
end;

function ClassIcons_UpdateTargetFrame()
	ClassIcons_UpdateIcon("TargetFrame", "target", CLASSICONS_CONFIG.Target);
end;

function ClassIcons_UpdateFocusFrame()
	ClassIcons_UpdateIcon("FocusFrame", "focus", CLASSICONS_CONFIG.Focus);
end;

function ClassIcons_UpdatePartyFrames()
	ClassIcons_UpdateIcon("PartyMemberFrame1", "party1", CLASSICONS_CONFIG.Party);
	ClassIcons_UpdateIcon("PartyMemberFrame2", "party2", CLASSICONS_CONFIG.Party);
	ClassIcons_UpdateIcon("PartyMemberFrame3", "party3", CLASSICONS_CONFIG.Party);
	ClassIcons_UpdateIcon("PartyMemberFrame4", "party4", CLASSICONS_CONFIG.Party);
end;