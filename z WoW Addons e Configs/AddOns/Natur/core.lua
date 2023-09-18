

--[[

		$title:			Natur Enemy Castbar
		$author:		Michael Boyle (Softrix)
		$email:			michael.boyle@softrix.co.uk
		$website:		www.softrix.co.uk
		
		$credits:		This Natur Enemy Castbar is a complete rewrite based on the 
						excellent discontinued addon by Naturfreund.
																		
						A big thank you goes to Krycek for his additional work on the 
						spells which left me to concentrate on the addon programming 
						side bringing you more features and quicker bug tracking  =D
						
						Krycek's Wowinterface profile and contact information can be 
						found on wowinterface.com's website at:
						
						http://www.wowinterface.com/forums/member.php?userid=33413
						
						Credits also go to Shadowed who is the author of the GTB bar 
						library which I	have modified for this addon.  The original 
						unmodified GTB library for the purpose of these credits is at:
						
						http://www.wowinterface.com/downloads/info10204-GTB-1.0.html
						
						I was going to write my own bar routines until i came across
						his excellent library.. why re-invent the wheel as they say!
		
]]--

-- fixed annoying vanishing target cooldowns issue finally!
-- added paladin shields to target cooldown monitoring.
-- added boss name and shame, i.e. when people dont avoid Flame Tsunami in OS10/25.


-- Version Details.
NATUR_VERSION = "081209-R1";
NATUR_VERDATE = "9/12/2009";

-- Natur Saved Options for across characters.       
Natur_AccountOptions = {
	true,											-- bar anchors shown?
	true,											-- split bar groups?
	10, 300, "UP", 15, 250, 4, 10, 1, 9, true,		-- 3x, y, dir, height, width, texture, max bars, font, font size, on?		[PRIMARY GROUP] 
	10, 330, "UP", 15, 250, 4, 10, 1, 9, true,		-- 13x, y, dir, height, width, texture, max bars, font, font size, on?		[HOSTILE CASTS] 	
	10, 360, "UP", 15, 250, 4, 10, 1, 9, true,		-- 23x, y, dir, height, width, texture, max bars, font, font size, on?		[TARGET GAINS] 
	10, 390, "UP", 15, 250, 4, 10, 1, 9, true,		-- 33x, y, dir, height, width, texture, max bars, font, font size, on?		[TARGET DEBUFFS] 
	10, 620, "UP", 15, 250, 4, 10, 1, 9, true,		-- 43x, y, dir, height, width, texture, max bars, font, font size, on?		---- future use ----
	10, 420, "UP", 15, 250, 4, 10, 1, 9, true,		-- 53x, y, dir, height, width, texture, max bars, font, font size, on?		[FRIENDLY CASTS] 
	10, 450, "UP", 15, 250, 4, 10, 1, 9, true,		-- 63x, y, dir, height, width, texture, max bars, font, font size, on?		[COOLDOWNS] 
	10, 480, "UP", 15, 250, 4, 10, 1, 9, true,		-- 73x, y, dir, height, width, texture, max bars, font, font size, on?		[CROWD CONTROLS]  -- future --
	10, 510, "UP", 15, 250, 4, 10, 1, 9, true,		-- 83x, y, dir, height, width, texture, max bars, font, font size, on?		[DIMINISH RETURNS]
	10, 540, "UP", 15, 250, 4, 10, 1, 9, true,		-- 93x, y, dir, height, width, texture, max bars, font, font size, on?		[MY GAINS]
	10, 570, "UP", 15, 250, 4, 10, 1, 9, true,		-- 103x, y, dir, height, width, texture, max bars, font, font size, on?		[MY DEBUFFS]
	false,											-- show all casts around me (or just T/F).					[113]
	false,											-- show spells/debuffs i put on myself (or others who have)						[114]
	true, true, true, true,							-- if its my cc then announce?  announce on break?, sound on break, flash ui on break
	true, true, true,								-- if my spell missed, announce?  sound?  flash ui?
	false,											-- show everyones DR's around me.							[122]
	true,											-- turn on spell monitoring?								[123]
	true, true, true,								-- Rogue Warning?   Sound?   FlashUI						[124/125/126]
	true, "Male", false,							-- PvP sounds?  Sex?  Include NPC?							[127/128/129]
	true,											-- Show everyones buffs/debuffs on target (not just mine).	[130]
	true,											-- Auto Reputation bar.										[131]
	true, true,										-- dk death grip sound?, play on all mobs?					[132/133]
	true, false,									-- finish him/her sound,  play on all mobs?					[134/135]				
	true,											-- show my cooldowns										[136]
	true,											-- show targets cooldowns									[137]
	
	-- RESERVED FOR FUTURE BAR COLOURING.
	-- Friendly buffs, hostile buffs, 
	-- friendly debuffs, hostile debuffs,
	-- hostile diminish, friendly diminish,
	-- friendly cooldown, hostile cooldown,
	-- my cooldowns, friendly cast, hostile cast.
	
	false,											-- use custom colours for timers.							[137]
	"","","","","","","","","","",""
	
};

-- Natur Saved Options (Per Character)
Natur_PerCharOptions = {
	true,										-- Is Natur Enabled
	false										-- debug mode on?
};

-- Textures used by Natur
Natur_Textures = {
	-- bar textures.
	"Interface\\Addons\\Natur\\Textures\\bantobar.tga",			-- [1]
	"Interface\\Addons\\Natur\\Textures\\charcoal.tga",			-- [2]
	"Interface\\Addons\\Natur\\Textures\\otravi.tga",			-- [3]
	"Interface\\Addons\\Natur\\Textures\\perl.tga",				-- [4]
	"Interface\\Addons\\Natur\\Textures\\smooth.tga",			-- [5]
	"Interface\\Addons\\Natur\\Textures\\smudge.tga",			-- [6]
	"Interface\\Addons\\Natur\\Textures\\striped.tga"			-- [7]
};

-- small icon to the right of the bars indication
-- where a cast is coming from or if its a DR
Natur_HTarget = "Interface\\Addons\\Natur\\Graphics\\Natur_HTarget.tga";
Natur_FTarget = "Interface\\Addons\\Natur\\Graphics\\Natur_FTarget.tga";
Natur_HFocus = "Interface\\Addons\\Natur\\Graphics\\Natur_HFocus.tga";
Natur_FFocus = "Interface\\Addons\\Natur\\Graphics\\Natur_FFocus.tga";
Natur_PlayerIcon = "Interface\\Addons\\Natur\\Graphics\\Natur_Player.tga";
Natur_DRFriendly = "Interface\\Addons\\Natur\\Graphics\\Natur_DRFriendly.tga";
Natur_DRHostile = "Interface\\Addons\\Natur\\Graphics\\Natur_DRHostile.tga";

-- local variables.
Natur_ChatDestination = 0;										-- where announces are sent.
Natur_PlayerInPvP = false;										-- PvP BG status.
Natur_PlayersFaction = 0;										-- will hold faction of player.
Natur_PlayerCombos = 0;											-- holds number of combos on target
Natur_ToggleDGSnd = 0;											-- for Deathgrip toggle.
Natur_IsPlayerInArena = false;									-- set to true by addon if player is in a arena

-- when a target is selected then his/her unique guid is
-- stored here and used by the addon.
targetsGUID = 0;												-- holds targets guid.
previousGUID = 1;												-- used by target cooldowns

--
--	OnLoad Function
--
function Natur_OnLoad()
	-- Register the events im interested in.
	this:RegisterEvent("ADDON_LOADED");	
	this:RegisterEvent("PLAYER_REGEN_DISABLED");				-- entered combat
	this:RegisterEvent("PLAYER_REGEN_ENABLED");					-- out of combat
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("UNIT_COMBO_POINTS");
	this:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	this:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE");
	-- initialise command line
	SlashCmdList["NATUR"] = Natur_Commandline;
	SLASH_NATUR1="/natur";	
end;

--
--	OnUpdate Function
--
function Natur_OnUpdate()
end;

--
--	Command Line Parser for options
--
function Natur_Commandline(args)
	local lowerargs = strlower(args);				
	if(lowerargs == "anchor") then	
		if(Natur_AccountOptions[1]) then Natur_AccountOptions[1] = false;
		elseif(not(Natur_AccountOptions[1])) then Natur_AccountOptions[1] = true; end;
		Natur_SetAnchor(Natur_AccountOptions[1]);	
	-- show version
	elseif(lowerargs == "about") then	
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Enemy Castbar (r"..NATUR_VERSION..") - Programmed by Michael Boyle c/o Softrix Studios @ www.softrix.co.uk.  You can email me direct on michael.boyle@softrix.co.uk or use the Curse or Wowinterface pages.");
	-- show test naxx dispell messages.
	elseif(lowerargs == "naxx") then	
		if(Natur_DispellSetting) then 
			Natur_DispellSetting = false;
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffNaxxramas Dispell Monitoring OFF!");
		else 
			Natur_DispellSetting = true;
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffNaxxramas Dispell Monitoring ON!");
		end;
	-- switch on/off boss failures.
	elseif(lowerargs == "fail") then	
		if(Natur_MonitorPlayerFailures) then 
			Natur_MonitorPlayerFailures = false;
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffBoss Failure Monitoring OFF!");
		else 
			Natur_MonitorPlayerFailures = true;
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffBoss Failure Monitoring ON!");
		end;
	else
		Process_AllCheckboxes();
		MainOptionsFrame:Show();
	end;
end;

--
--	Initialise Function
--
function Natur_Initialise()
	-- wheres this client then?
	local client_area = GetLocale();		
	if(client_area == "enUS") then 
		Natur_Local_enUS();
	elseif(client_area == "frFR") then 
		Natur_Local_frFR();
	elseif(client_area == "deDE") then 
		Natur_Local_deDE();
	elseif(client_area == "koKR") then 
		Natur_Local_koKR();
	elseif(client_area == "zhCN") then 
		Natur_Local_zhCN();
	elseif(client_area == "zhTW") then 
		Natur_Local_zhTW();
	elseif(client_area == "ruRU") then 
		Natur_Local_ruRU();
	elseif(client_area == "esES") then 
		Natur_Local_enUS();
	elseif(client_area == "esMX") then 
		Natur_Local_esMX(); 
	end;
	-- grab the modified GTB Library
	NaturLib = LibStub:GetLibrary("Softrix-1.0");
	-- init the groups.
	Natur_InitialiseHostileCasts();
	Natur_InitialiseFriendlyCasts();
	Natur_InitialisePrimaryGroup();
	Natur_InitialiseTargetBuffs();
	Natur_InitialiseTargetDebuffs();
	Natur_InitialisePlayersBuffs();
	Natur_InitialisePlayersDebuffs();
	Natur_InitialisePlayerCooldowns();
	Natur_InitialiseDiminishGroup();
	Natur_SetAnchor(Natur_AccountOptions[1]);	-- set anchors as per settings.
	DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Enemy Castbar (r"..NATUR_VERSION..") loaded! Type /natur for options.|cffffffff - Programmed by Michael Boyle c/o Softrix Studios @ www.softrix.co.uk.  You can email me direct on michael.boyle@softrix.co.uk or use the Curse or Wowinterface pages.");
	NATUR_PROCESS_SLIDERS = true;
end;

--
--	Debug Message Function
--
function Natur_DebugTrace(msg, event)
	if(Natur_PerCharOptions[2]) then DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Debug : |cffffffff["..event.."] - "..msg); end;
end;

-- 
--	Set Anchors
--
function Natur_SetAnchor(setting)
	-- are we split?
	if(Natur_AccountOptions[2]) then
		-- yes we are split up. Turn off the primary group and take a look to
		-- see what other groups we have turned on and show their anchors.
		NaturPrimaryGroup:SetAnchorVisible(false);	-- we are off in split mode.
		-- hostile casts
		if(Natur_AccountOptions[22]) then NaturHostileCastGroup:SetAnchorVisible(setting);
		else NaturHostileCastGroup:SetAnchorVisible(false); end;
		-- friendly casts
		if(Natur_AccountOptions[62]) then NaturFriendlyCastGroup:SetAnchorVisible(setting);
		else NaturFriendlyCastGroup:SetAnchorVisible(false); end;
		-- targets buffs (gains)
		if(Natur_AccountOptions[32]) then NaturTargetBuffsGroup:SetAnchorVisible(setting);
		else NaturTargetBuffsGroup:SetAnchorVisible(false); end;
		-- target debuffs
		if(Natur_AccountOptions[42]) then NaturTargetDebuffsGroup:SetAnchorVisible(setting);
		else NaturTargetDebuffsGroup:SetAnchorVisible(false); end;
		-- player cooldowns/target cooldowns
		if(Natur_AccountOptions[72] or Natur_AccountOptions[136] or Natur_AccountOptions[137]) then NaturMyCooldownsGroup:SetAnchorVisible(setting);
		else NaturMyCooldownsGroup:SetAnchorVisible(false); end;
		-- diminish returns
		if(Natur_AccountOptions[92]) then NaturDiminishGroup:SetAnchorVisible(setting);
		else NaturDiminishGroup:SetAnchorVisible(false); end;
		-- player buffs/debuffs
		if(Natur_AccountOptions[114]) then 
			NaturPlayersBuffsGroup:SetAnchorVisible(setting);
			NaturPlayersDebuffsGroup:SetAnchorVisible(setting);
		else 
			NaturPlayersBuffsGroup:SetAnchorVisible(false); 
			NaturPlayersDebuffsGroup:SetAnchorVisible(false); 
		end;
		
	else
		-- we are in group mode where all timer groups are sent to the
		-- primary group instead of seperate groups. We need to make
		-- sure the other groups are hidden regardless of the anchor
		-- setting in the options.
		NaturPrimaryGroup:SetAnchorVisible(setting);	-- we are on when not in split mode.
		NaturHostileCastGroup:SetAnchorVisible(false);
		NaturFriendlyCastGroup:SetAnchorVisible(false);
		NaturTargetBuffsGroup:SetAnchorVisible(false);
		NaturTargetDebuffsGroup:SetAnchorVisible(false);
		NaturMyCooldownsGroup:SetAnchorVisible(false);
		NaturDiminishGroup:SetAnchorVisible(false);
		NaturPlayersBuffsGroup:SetAnchorVisible(false); 
		NaturPlayersDebuffsGroup:SetAnchorVisible(false); 
	end;	
end;

-- 
--	Setup where we will be announcing!
--
function Natur_SetPartyStatus()
	local playerInstance, instanceType = IsInInstance();
	if(instanceType == "arena") then	-- ive left out the normal bg (pvp) to stop random spam
		Natur_IsPlayerInArena = true;	-- flag arena wide hostile cooldowns.
		Natur_ChatDestination = "BATTLEGROUND";
	elseif (GetPartyMember(1)) then	
		Natur_IsPlayerInArena = false;
		Natur_ChatDestination = "PARTY"; 			-- we are in a party
		if (GetNumRaidMembers() > 0) then 
			Natur_ChatDestination = "RAID";			-- in a raid
		end;
	else
		-- not in any group so im playing solo. 
		Natur_IsPlayerInArena = false;
		Natur_ChatDestination = 0;
	end;
	-- lets see if we are in arena or battleground etc
	if(playerInstance) then		-- im in an instance, what is it?
		if(instanceType == "arena" or instanceType == "pvp") then
			Natur_PlayerInPvP = true;	-- im in the battlegrounds
		else
			Natur_PlayerInPvP = false;	-- im not in the battlegrounds and can be in a instance still!
		end;
	end;
	
end;

--
--	Event Handler Function
--
function Natur_EventHandler(event,...)
	-- check to see if Natur has loaded so that
	-- I can intialise stuff which is needed.
	if(event == "ADDON_LOADED") then
		if(arg1 == "Natur") then
			Natur_Initialise();			
		end;	
	end;

	if(event == "PLAYER_ENTERING_WORLD") then
		-- need to grab my faction here so that we can check
		-- if a target is hostile to me when dealing with
		-- targets buffs and debuffs.
		Natur_PlayersFaction,_ = UnitFactionGroup("player");
		-- wheres my character then?
		Natur_SetPartyStatus();	
		-- clear any in-progress DR's since ive left bg?
		if(Natur_AccountOptions[2]) then	-- we are split
			NaturDiminishGroup:UnregisterAllBars();
		else
			NaturPrimaryGroup:UnregisterAllBars();
		end;
	end;
	
	if(event == "ACTIONBAR_UPDATE_COOLDOWN") then
		Natur_ReadPlayerCooldowns();	-- update my cooldowns				
	end;
	
	if(event == "UNIT_COMBO_POINTS") then
		-- check combo points and if max, do we want a finishing move sound?
		Natur_ProcessCombo();
	end;
	
	if(event == "PLAYER_TARGET_CHANGED" and Natur_PerCharOptions[1]) then
		targetsGUID = UnitGUID("target");
		Natur_ReadTargetBuffs();					-- read target/focus buffs.
		Natur_ReadTargetDebuffs();					-- read target/focus debuffs
		Natur_ShowCastTracking(targetsGUID);		-- show any "in process" casts
		if(not(previousGUID == targetsGUID)) then	-- bug trap for vanishing bars.
			previousGUID = targetsGUID;				
			if(not(Natur_IsPlayerInArena)) then Natur_ShowTargetCooldowns(targetsGUID);	end;	-- show any cooldowns for this target.
		end;
	end;
		
	-- for auto reputation bar
	if(event == "CHAT_MSG_COMBAT_FACTION_CHANGE" and Natur_PerCharOptions[1]) then
		if(Natur_AccountOptions[131]) then Natur_AutoChangeRepBar(); end;
	end;
	
	-- ive entered combat, clear the player failure lists.
	if(event == "PLAYER_REGEN_DISABLED") then
		Natur_PlayersFailed = {};	-- clear it baby!
	end;
	
	-- ive come out of combat, show the player failure list.
	if(event == "PLAYER_REGEN_ENABLED") then
		NaturShowPlayersFailed();
	end;
	
	-- check for combat related stuff.
	if(event == "COMBAT_LOG_EVENT_UNFILTERED" and Natur_PerCharOptions[1]) then

		-- A player or npc has started casting a spell.
		if(arg2 == "SPELL_CAST_START") then
			-- dont want to see anything cast by me.
			if(not(arg3 == UnitGUID("player")) and arg3) then
				-- got a cast, its not mine and could be a mob around
				-- me so i need to save the infomation incase i select
				-- him - this allows me to see the remaining time left on
				-- any casts he has started.
				local tftablestat = nil;
				if(arg3 == UnitGUID("target")) then tftablestat = "target";
				elseif(arg3 == UnitGUID("focus")) then tftablestat = "focus"; end;
				local icon, castdur, isHostile = Natur_AddCastTracking(GetTime(), arg3, Natur_StripServer(arg4), arg5, arg9, arg10, arg9..arg3.."Casting", tftablestat);
				-- cast has been saved, if this is something i currently have
				-- selected or is my focus target then we need to show it here.
				-- first check we actually have something worth showing!				
				if(castdur) then					
					-- this cast still has a duration so lets see if its
					-- coming from my target or focus and setup the correct
					-- icon for the timers.
					local targetFocus = nil;
					if(arg3 == UnitGUID("target")) then 
						if(isHostile) then targetFocus = Natur_HTarget;
						else targetFocus = Natur_FTarget; end;
					elseif(arg3 == UnitGUID("focus")) then 
						if(isHostile) then targetFocus = Natur_HFocus; 
						else targetFocus = Natur_FFocus; end; 
					end;														
					-- want to show all casts or just target/focus?
					if(targetFocus or Natur_AccountOptions[113]) then
						-- is this a hostile or friendly cast, and where
						-- are we sending these timers because we could 
						-- be in either split or group mode.
						if(Natur_AccountOptions[2]) then	-- we are split mode.
							if(isHostile) then
								if(Natur_AccountOptions[22]) then	-- do we have the hostile casts on?
									NaturHostileCastGroup:SetInvert(true);
									if(targetFocus == Natur_FFocus or targetFocus == Natur_HFocus) then	-- its a focus, include his name
										NaturHostileCastGroup:RegisterBar(arg9..arg3.."Casting", arg10.." ("..Natur_StripServer(arg4)..")", castdur, castdur, icon, targetFocus);
									else
										NaturHostileCastGroup:RegisterBar(arg9..arg3.."Casting", arg10, castdur, castdur, icon, targetFocus);
									end;
								end;
							else   
								if(Natur_AccountOptions[62]) then	-- do we have the friendly casts on?
									NaturFriendlyCastGroup:SetInvert(true);
									if(targetFocus == Natur_FFocus or targetFocus == Natur_HFocus) then
										NaturFriendlyCastGroup:RegisterBar(arg9..arg3.."Casting", arg10.." ("..Natur_StripServer(arg4)..")", castdur, castdur, icon, targetFocus);
									else
										NaturFriendlyCastGroup:RegisterBar(arg9..arg3.."Casting", arg10, castdur, castdur, icon, targetFocus);
									end;
								end;
							end;
						else
							-- grouped up so send to our primary group
							NaturPrimaryGroup:SetInvert(true);
							if(isHostile and Natur_AccountOptions[22]) then
								if(targetFocus == Natur_FFocus or targetFocus == Natur_HFocus) then
									NaturPrimaryGroup:RegisterBar(arg9..arg3.."Casting", arg10.." ("..Natur_StripServer(arg4)..")", castdur, castdur, icon, targetFocus);
								else
									NaturPrimaryGroup:RegisterBar(arg9..arg3.."Casting", arg10, castdur, castdur, icon, targetFocus);
								end;
							elseif(not(isHostile) and Natur_AccountOptions[62]) then
								if(targetFocus == Natur_FFocus or targetFocus == Natur_HFocus) then
									NaturPrimaryGroup:RegisterBar(arg9..arg3.."Casting", arg10.." ("..Natur_StripServer(arg4)..")", castdur, castdur, icon, targetFocus);
								else
									NaturPrimaryGroup:RegisterBar(arg9..arg3.."Casting", arg10, castdur, castdur, icon, targetFocus);
								end;	
							end;
						end;
					end;					
				end;								
				-- for debugging purposes.
				Natur_DebugTrace(arg10.." fired.", arg2);
			end;
		
		-- fired on an instant cast spell.
		elseif(arg2 == "SPELL_CAST_SUCCESS" and arg7) then
			-- do we have additional info for this spell fired?
			local spellsid, cooldown, glyph, cc, dr, warn, icon = Natur_ProcessAbilityFired(arg9, arg6);
			-- process anything that ive cast which needs extra attention
			-- such as the fun deathgrip sound :D
			if(arg3 == UnitGUID("player")) then
				-- i cast it, update cooldowns incase one of my abilities
				-- has updated any global ones.
				Natur_ReadPlayerCooldowns();
				if(Natur_AccountOptions[132]) then 
					-- this is a instant cast ive made.  was it the
					-- dk death grip so we can play our sound?
					if(arg9 == 49576) then
						-- do i want this only when figting players or all mobs?
						if(UnitIsPlayer("target") or Natur_AccountOptions[133]) then
							-- simple toggle to change sound
							if(Natur_ToggleDGSnd == 0) then 
								Natur_ToggleDGSnd = 1; 
								PlaySoundFile(Natur_GetOverHere);
							elseif(Natur_ToggleDGSnd == 1) then 
								Natur_ToggleDGSnd = 0; 
								PlaySoundFile(Natur_ComeHere); 
							end;
						end;
					end;
				end;
				if(cc and Natur_AccountOptions[115]) then
					-- its my cc, track it.
					if(Natur_AccountOptions[116]) then Natur_LogCCTarget(arg6, arg7, arg3, arg4, arg1, arg10); end;
					-- this is a cc ive cast, do i want to announce?
					Natur_SetPartyStatus();		-- this should already be set but do again just incase.
					local msg = string.format(NATUR_APPLIED_SPELL, arg10, arg7);
					if(not(Natur_ChatDestination == 0)) then SendChatMessage(msg, Natur_ChatDestination); end;
				end;
			end;
			-- is this a hostile spell not by me BUT i have a cooldown for it?
			if(not(arg3 == UnitGUID("player")) and cooldown and Natur_AccountOptions[137]) then
				-- ive got a cooldown, was it from my target or focus?
				if(Natur_IsUnitHostile(arg5)) then
					Natur_TrackCooldown(arg3, arg4, arg9, arg10, GetTime(), cooldown, arg3..arg9.."MobCD", icon, Natur_HTarget);
				else
					Natur_TrackCooldown(arg3, arg4, arg9, arg10, GetTime(), cooldown, arg3..arg9.."MobCD", icon, Natur_FTarget);
				end;

				-- if its my target, run the cooldown check
				if(arg3 == UnitGUID("target") and not(Natur_IsPlayerInArena) and previousGUID == targetsGUID) then 
					Natur_ShowTargetCooldowns(arg3); 
				elseif(Natur_IsPlayerInArena) then
					-- we are in a arena, arena wide cooldowns mode!
					Natur_ShowTargetCooldowns(arg3);
				end;
			end;
			-- was this spell/ability from a sneaky rogue  :D
			if(warn and Natur_IsUnitHostile(arg5) and Natur_AccountOptions[124]) then		-- hostile rogue spell, warn me?
				Natur_AddDetectedRogue(arg4, arg10);
			end;
			-- does this cast have a diminish return we are interested in?    
			if(dr and Natur_IsUnitPlayer(arg6) and arg3 == UnitGUID("player") and not(arg6 == UnitGUID("player")) or dr and not(arg3 == UnitGUID("player")) and Natur_IsUnitPlayer(arg6) and Natur_AccountOptions[122]) then
				if(Natur_IsUnitHostile(arg5)) then	-- this is for a hostile target.
					Natur_TrackDR(arg6, Natur_StripServer(arg7), icon, "Hostile", Natur_StripServer(arg4), arg9, arg10);
				else
					Natur_TrackDR(arg6, Natur_StripServer(arg7), icon, "Friendly", Natur_StripServer(arg4), arg9, arg10);
				end;
			end;

			-- for debugging purposes.
			Natur_DebugTrace(arg10.." fired.", arg2);
			
		-- a cast was interrupted.
		elseif(arg2 == "SPELL_INTERRUPT") then
			if(Natur_AccountOptions[2]) then
				-- dont really need to check if its friendly/hostile since
				-- the gtb library will simply ignore the unregister call
				-- if no such bar exists.  Just clear any possible bars.
				NaturFriendlyCastGroup:UnregisterBar(arg12..arg6.."Casting");
				NaturHostileCastGroup:UnregisterBar(arg12..arg6.."Casting");
			else
				-- grouped up so this timer will be on the primary group.
				NaturPrimaryGroup:UnregisterBar(arg12..arg6.."Casting");
			end;
			-- for debugging purposes.
			Natur_DebugTrace(arg10.." fired.", arg2);

		-- a cast has failed.
		elseif(arg2 == "SPELL_CAST_FAILED") then
			if(Natur_AccountOptions[2]) then
				-- dont really need to check if its friendly/hostile since
				-- the gtb library will simply ignore the unregister call
				-- if no such bar exists.  Just clear any possible bars.
				NaturFriendlyCastGroup:UnregisterBar(arg9..arg3.."Casting");
				NaturHostileCastGroup:UnregisterBar(arg9..arg3.."Casting");
			else
				-- grouped up so this timer will be on the primary group.
				NaturPrimaryGroup:UnregisterBar(arg9..arg3.."Casting");
			end;
			-- for debugging purposes.
			Natur_DebugTrace(arg10.." fired.", arg2);
		
		-- an aura has been applied.
		elseif(arg2 == "SPELL_AURA_APPLIED") then
			-- grab any information for this spell
			local _, cooldown, _, cc, dr, warn, icon = Natur_ProcessAbilityFired(arg9, arg6);
			-- process buffs/debuffs on target/focus
			if(arg6 == UnitGUID("target") or arg6 == UnitGUID("focus")) then
				Natur_ReadTargetBuffs();
				Natur_ReadPlayerBuffs();
				Natur_ReadTargetDebuffs();
				-- for debugging purposes.
				Natur_DebugTrace(arg10.." fired.", arg2);
			elseif(arg6 == UnitGUID("player")) then 
				Natur_ReadPlayerBuffs();
				Natur_ReadPlayerDebuffs();
			end;
			-- is this a hostile spell not by me BUT i have a cooldown for it?
			if(not(arg3 == UnitGUID("player")) and cooldown and Natur_AccountOptions[137]) then
				-- ive got a cooldown, was it from my target or focus?
				if(Natur_IsUnitHostile(arg5)) then
					Natur_TrackCooldown(arg3, arg4, arg9, arg10, GetTime(), cooldown, arg3..arg9.."MobCD", icon, Natur_HTarget);
				else
					Natur_TrackCooldown(arg3, arg4, arg9, arg10, GetTime(), cooldown, arg3..arg9.."MobCD", icon, Natur_FTarget);
				end;				
				-- if its my target, run the cooldown check
				if(arg3 == UnitGUID("target") and not(Natur_IsPlayerInArena) and previousGUID == targetsGUID) then 
					Natur_ShowTargetCooldowns(arg3); 
				elseif(Natur_IsPlayerInArena) then
					-- we are in a arena, arena wide cooldowns mode!
					Natur_ShowTargetCooldowns(arg3);
				end;				
			end;
			-- have i cast a crowd control?
			if(arg3 == UnitGUID("player") and not(arg6 == UnitGUID("player")) and cc and Natur_AccountOptions[115]) then
				-- its my cc, track it.
				if(Natur_AccountOptions[116]) then Natur_LogCCTarget(arg6, arg7, arg3, arg4, arg1, arg10); end;
				-- this is a cc ive cast, do i want to announce?
				Natur_SetPartyStatus();		-- this should already be set but do again just incase.
				local msg = string.format(NATUR_APPLIED_SPELL, arg10, arg7);
				if(not(Natur_ChatDestination == 0)) then SendChatMessage(msg, Natur_ChatDestination); end;
			end;
			-- was this a rogue, do i want to warn?
			if(warn and Natur_IsUnitHostile(arg5) and Natur_AccountOptions[124]) then		-- hostile rogue spell, warn me?
				Natur_AddDetectedRogue(arg4, arg10);
			end;  
			-- does this cast have a diminish return we are interested in?
			if(dr and Natur_IsUnitPlayer(arg6) and arg3 == UnitGUID("player") and not(arg6 == UnitGUID("player")) or dr and not(arg3 == UnitGUID("player")) and Natur_IsUnitPlayer(arg6) and Natur_AccountOptions[122]) then
				if(Natur_IsUnitHostile(arg5)) then	-- this is for a hostile player target.
					Natur_TrackDR(arg6, Natur_StripServer(arg7), icon, "Hostile", Natur_StripServer(arg4), arg9, arg10);
				else
					Natur_TrackDR(arg6, Natur_StripServer(arg7), icon, "Friendly", Natur_StripServer(arg4), arg9, arg10);
				end;
			end;
			-- if ive used a ability which has altered any other cooldowns
			-- then i need to check cooldowns again.
			if(arg3 == UnitGUID("player")) then Natur_ReadPlayerCooldowns(); end;
			-- is this a boss spell i want to announce?
			if(arg7 and arg10) then Natur_CheckDispell(arg9, arg10, arg7); end;

			-- someone failed?
			if(arg7 and arg10 and Natur_MonitorPlayerFailures) then Natur_CheckRaidFailure(arg9, arg7, arg1); end;

		-- a aura stack has updated.
		elseif(arg2 == "SPELL_AURA_APPLIED_DOSE") then
			if(arg6 == UnitGUID("target") or arg6 == UnitGUID("focus")) then
				Natur_ReadTargetBuffs();
				Natur_ReadTargetDebuffs();
				-- for debugging purposes.
				Natur_DebugTrace(arg10.." fired.", arg2);
			elseif(arg6 == UnitGUID("player")) then 
				Natur_ReadPlayerBuffs();
				Natur_ReadPlayerDebuffs();
			end;

		-- a aura has been refreshed.
		elseif(arg2 == "SPELL_AURA_REFRESH") then
			if(arg6 == UnitGUID("target") or arg6 == UnitGUID("focus")) then
				Natur_ReadTargetBuffs();
				Natur_ReadTargetDebuffs();
				-- for debugging purposes.
				Natur_DebugTrace(arg10.." fired.", arg2);
			elseif(arg6 == UnitGUID("player")) then 
				Natur_ReadPlayerBuffs();
				Natur_ReadPlayerDebuffs();
			end;

		-- an aura was removed or dispelled.
		elseif(arg2 == "SPELL_AURA_REMOVED" or arg2 == "SPELL_AURA_DISPELLED") then
			-- grab any information for this spell
			local _, _, _, cc, _, _, _ = Natur_ProcessAbilityFired(arg9, arg6);
			-- process any diminish returns.
			Natur_StartExpireTimer(arg6);
			if(arg6 == UnitGUID("target") or arg6 == UnitGUID("focus") or arg6 == UnitGUID("player")) then
				Natur_ReadTargetBuffs();
				Natur_ReadTargetDebuffs();
				Natur_ReadPlayerBuffs();
				Natur_ReadPlayerDebuffs();
			end;
			-- this was a buff fading from me.
			if(arg6 == UnitGUID("player")) then
				if(Natur_CheckMonitoredAbility(arg10)) then
					-- this is a spell i want notified about.
					local msg = string.format(NATUR_SPELL_FADED, arg10);
					--UIErrorsFrame:AddMessage(msg, 0, 1.0, 0, 10);			-- green
					DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00"..msg);
					PlaySoundFile(Natur_PlayerBuffLost);
				end;
			end;
			-- if this was a cc, was it mine and do i need a announce?
			if(cc and Natur_AccountOptions[116]) then
				Natur_AnnounceCCTarget(arg6, arg10);
			end;
			
			Natur_DebugTrace(arg10.." fired.", arg2);
			
		-- tried a spell which missed.
		elseif(arg2 == "SPELL_MISSED") then
			-- grab some information about this spell.
			local _, _, _, cc, _, _, _ = Natur_ProcessAbilityFired(arg9, arg6);
			-- was this my miss on a cc spell?
			if(arg4 == UnitName("player") and cc) then
				-- its mine, it missed therefore it could be a immune or
				-- resist fired.  Here we are only interested in "immune"
				-- for the DR stuff but can be easily added in the future.
				if(arg12 == "IMMUNE" and Natur_AccountOptions[119]) then
					-- warn my party or raid that this target is immune.
					Natur_SetPartyStatus();		-- this should already be set but double check anyway.
					local msg = string.format(NATUR_SPELL_MISSED1, Natur_StripServer(arg7), arg12, arg10);
					if(Natur_AccountOptions[120]) then PlaySoundFile(Natur_SpellImmuneSND); end;
					if(Natur_AccountOptions[121]) then Natur_UIFlash(); end;
					if(not(Natur_ChatDestination == 0)) then SendChatMessage(msg, Natur_ChatDestination); end;
				end;
			end;

			Natur_DebugTrace(arg10.." fired.", arg2);

		
		-- a mob just died.
		elseif(arg2 == "UNIT_DIED") then
			-- not really usefull in pvp to accuracy 
			-- issues but monitor it anyway. Need to
			-- renew any buffs/debuffs here also.
			Natur_RemoveDeadDR(arg6);
			Natur_ReadTargetBuffs();
			Natur_ReadTargetDebuffs();
			Natur_RemoveDeadCasts(arg6);
			Natur_DeleteDeadCooldowns(arg6);
			-- for debugging purposes.
			Natur_DebugTrace(arg7.." died.", arg2);
		
		-- a mob just died.
		elseif(arg2 == "PARTY_KILL") then
			-- check if this is my kill and play
			-- a cool quake pvp sound. Also renew
			-- any buffs/debuffs.
			Natur_RemoveDeadDR(arg6); 
			Natur_ReadTargetBuffs();
			Natur_ReadTargetDebuffs();
			Natur_RemoveDeadCasts(arg6);
			Natur_DeleteDeadCooldowns(arg6);
			-- my kill, and do i want unreal sounds?
			if(arg3 == UnitGUID("player")) then Natur_QuakeSounds(arg6); end;
			-- for debugging purposes.
			Natur_DebugTrace(arg7.." died.", arg2);
		end;		
	end;
	
end;

--
--	Function to auto change reputation bar to the
--	faction ive just gained rep with.
--
function Natur_AutoChangeRepBar()
	local s,newFaction,factionName,isHeader,curRepBar;
	s,_,newFaction = string.find(arg1, NATUR_REPUTATION_PARSE_TXT);
	curRepBar = GetWatchedFactionInfo();
	if(s and newFaction ~= curRepBar) then
		for i = 1, GetNumFactions() do
			factionName,_,_,_,_,_,_,_,isHeader = GetFactionInfo(i);
			if(isHeader == nil and factionName == newFaction) then
				SetWatchedFactionIndex(i);
				UIErrorsFrame:AddMessage(NATUR_AUTOREPBAR.." "..newFaction..".", 0, 1.0, 0, 10)
				DEFAULT_CHAT_FRAME:AddMessage(NATUR_AUTOREPBAR..newFaction..".", 0,1.0,0,10);
				return;
			end;
		end;			
	end;	
end;

--
--	Strip server name from player.
--
function Natur_StripServer(name)
	name = string.match(name, "[^-]*");
	return(name);
end

--
--	Function to return True if a given
--	guid is hostile (or an NPC if req)
--
function Natur_IsUnitHostile(mob_flags)
	if (CombatLog_Object_IsA(mob_flags, COMBATLOG_FILTER_HOSTILE_PLAYERS) or CombatLog_Object_IsA(mob_flags, COMBATLOG_FILTER_HOSTILE_UNITS)) then 
		return(true);
	else 
		return(false); 
	end;
end;

--
--	Function to return "true" if a guid belongs
--	to a player and not a npc.
--
function Natur_IsUnitPlayer(guid)
	local guid = strsub(guid, 1 ,5);
	if(bit.band(guid, 0x00F) == 0) then return(true); end;
	return(false);
end;


-- ***************************************************** --
-- **             ROGUE DETECTION FUNCTIONS           ** --
-- ***************************************************** --

-- 1 Rogue Name
-- 2 Time

-- storage for rogues detected around me
Natur_DetectedRogues = {};

-- 
--	Add a rogue to the detected list.
--
function Natur_AddDetectedRogue(name, spell)
	Natur_RemoveExpiredRogue();					-- delete old rogues over 2 minutes.
	if(not(Natur_PastDetectedRogue(name))) then
		tinsert(Natur_DetectedRogues, {Natur_StripServer(name), GetTime()}); 
		if(Natur_AccountOptions[125]) then PlaySoundFile(Natur_RogueWarnSound); end;
		if(Natur_AccountOptions[126]) then Natur_UIFlash(); end;
		local msg = string.format(NATUR_ROGUE_WARNING, Natur_StripServer(name), spell);
		DEFAULT_CHAT_FRAME:AddMessage("|cffff1010"..msg);
	end;
end;

--
--	Check and see if we already detected this rogue
--
function Natur_PastDetectedRogue(name)
	for count,value in ipairs(Natur_DetectedRogues) do
		if(value[1] == Natur_StripServer(name)) then
			return(true);
		end;
	end;
	return(false);
end;

--
--	Remove a rogue from the list after 2 minutes.
--
function Natur_RemoveExpiredRogue()
	for count,value in ipairs(Natur_DetectedRogues) do
		local detectionTime = value[2];
		local duration = GetTime() - detectionTime;
		if(duration > 120) then
			tremove(Natur_DetectedRogues, count);
		end;
	end;
end;
