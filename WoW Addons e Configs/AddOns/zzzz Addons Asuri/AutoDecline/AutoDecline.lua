-- *:***************************************************************
-- AutoDecline
-- Automatically decline guild/party/duel invites

local _APP_VERSION = "1.5"
local _APP_INTERFACE = "30000"
local _APP_BETA = ""
local _APP_KEY = "AUTODECLINE"

local _APP_PDLIB_DEPENDENCY = "1.2"


--[[
-- ------------------------------------------------
-- Revisions

-- v1.5.30200 ** 08-13-2008
-- 	-Cleaned up some erroneous code in the xml files that was causing entries in the error logs
-- 	-Updated version number to 3.2

-- v1.5.30000 ** 12-18-2008
-- 	 -Fixed issue with Blizzard renaming the EnableButton function
--   -Re-organized the options screen as the text suddenly didn't fit any more
--   -Added new functionality to do a /who on the player sending the invite or request

-- v1.4c.20100 ** 06-26-2007
--   -Fixed issue where guild invites were not being declined.

-- v1.4b.20100 ** 06-16-2007
--   -Wouldn't you know it, moments after I uploaded 1.4a someone hit me with a guild charter and I found where I forgot to rename a function...  fixed!


-- v1.4a.20100 ** 06-16-2007
--   -Fixed issue where PD_Persistent_Debug was not getting initialized properly.
--   -Removed /ad as a slash command as it was conflicting with other mods

-- v1.4.20100 ** 06-14-2007
--   -Added new functionality to allow duel requests from friends, guild members, or whispers
--   -Added new functionality to allow party and duel requests from people you send a whisper to
--   -Added new functionality to allow party requests in battlegrounds
--   -Fixed lua issue that was causing whispers not to register as allowed
--   -Halfway fixed issue where sometimes guild members would be declined when they shouldn't be.  This issue involves loading guild information, which the client doesn't do immedately and easilly.  At some point the info will load, but until then guild members will be declined.

-- v1.3a.20003 ** 03-04-2007
--   -They changed the petition type from "charter" to "guild" which broke the guild charter functionality

-- v1.3.20003 ** 02-27-2007
--   -Fixed to work in latest version of WoW

-- v1.3.1600 ** 08-14-05
--   -Added functionality to always allow invites from your guild
--   -Moved text from configuration screen into the localization.lua file
--   -Made a change to the options screen to better indicate that checking party/guild/duel/charter meant that those types of requests would be declined
--   -Added new option to use the same settings for all characters
--   -Fixed a bug where not including on or off for an option was supposed to toggle that option, but it was not.
--   -Added functionality to perform a list of command line actions when doing a decline
--   -Lenghened last whisper history to include the last 5 names
--   -Changed party list commands
--   -Added new command to add the last player to send a party invite to the allowed list

-- v1.2.1600 ** 07/14/05
--   -Updated interface number to 1600 in .toc file.
--   -Added functionality to always allow invites from names in the friends list
--   -Added new checkbox to settings window to turn allowing invites from friends on and off
--   -Added new toggle command line option partyfriends {on|off}
--   -Added functionality to always allow invites from last player to send a whisper
--   -Added new checkbox to settings window to turn allowing invites from last whisper on and off
--   -Added new toggle command line option partywhisper {on|off}
--   -Removed DEFAULTS button from settings screen

-- v1.1.1300 ** 03/30/05 (not released)
--   -Added functionality to always allow invites from a specified list of names
--   -Added command line commands partyadd, partyremove, and partylist.

-- v1.0.1300 ** 03/23/05
--   -Updated interface number to 1300 in .toc file.
--   -Changed version numbering to include interface number

-- v1.0 ** 03/17/2005
--   -Initial Release

-- ------------------------------------------------
-- Commands
--    party/guild/duel/charter/partyfriends/partywhisper on/off - turn on or off
--    status - show status
--    /autod, or /autodecline to bring up options window

--    partyplayer add - add a name to always allow party invites list
--    partyplayer remove - remove a name from always allow party invites list
--    partyplayer list - list names to always allow party invites from
--    partyguild add - add a guild name to always allow party invites list
--    partyguild remove - remove a guild name from always allow party invites list
--    partyguild list - list guild names to always allow party invites from

-- ------------------------------------------------
-- Features in Beta
--
-- ------------------------------------------------
-- Features to add at a future date:
--    GUI list of names to always allow invites from (way low on list of things to do)

-- ------------------------------------------------
-- Global Variables

-- AutoDeclineConfig : General configuration
-- AutoDeclinePartyAllow : List of names to always allow party invites from
-- AutoDeclinePartyGuildAllow : Not used
-- AutoDeclineActions : List of actions for all decline types
-- debugMode : True if showing debug statements

--* In Development *
-- AutoDeclineDuelAllow : List of names to always allow duel challenges from

-- lastInvite
-- lastDuel
--]]


-- *:***************************************************************

-- Initialize local variables
playerName = nil
playerID = nil
localPlayerID = nil
realmID = nil
showAlert = true
AutoDeclineFriends = {}
whisperNames = {}
whisperNamesTo = {}
whisperLimit = 5
ADdebugMode = nil
optionsFrame = nil
lastInvite = nil
cancelFriendList = nil
variablesLoaded = nil
dataLoaded = nil
adCheckingGuild = nil
adLoopStop = nil
guildRosterLoaded = false
adShowWho = true

-- *:***************************************************************
-- *: AutoDecline_OnLoad
-- *: Executes when the OnLoad event occurs
-- *:***************************************************************
function AutoDecline_OnLoad()
--[[
-- *: Moved these to the AutoDecline.toc file
--   RegisterForSave("AutoDeclineConfig")
--   RegisterForSave("AutoDeclinePartyAllow")
--   RegisterForSave("AutoDeclinePartyGuildAllow")
--   RegisterForSave("AutoDeclineActions")
--   RegisterForSave("persistentDebug")
--]]

   this:RegisterEvent("VARIABLES_LOADED")
   this:RegisterEvent("GUILD_INVITE_REQUEST")
   this:RegisterEvent("PARTY_INVITE_REQUEST")
   this:RegisterEvent("DUEL_REQUESTED")
   this:RegisterEvent("PETITION_SHOW")
   this:RegisterEvent("PLAYER_ENTERING_WORLD")
   this:RegisterEvent("UNIT_NAME_UPDATE")
   this:RegisterEvent("FRIENDLIST_UPDATE")
   this:RegisterEvent("CHAT_MSG_WHISPER")
   this:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
   this:RegisterEvent("FRIENDLIST_SHOW")
   this:RegisterEvent("WHO_LIST_UPDATE")
   this:RegisterEvent("GUILD_ROSTER_UPDATE")
--   this:RegisterEvent("ARENA_TEAM_INVITE_REQUEST")

   if IsInGuild() then
      SetGuildRosterSelection(0);
	    local CURRENT_GUILD_MOTD = GetGuildRosterMOTD();
	 end
end

-- *:***************************************************************
function AutoDecline_LoadPlayerInfo()
  if not playerID then
    local tempName = UnitName("player")
    AutoDecline_Debug("Initializing playerID to " .. PDFormatOutput(tempName) )
    if tempName and (tempName ~= "Unknown Entity") then
      playerName = tempName
    end
  end
  if (variablesLoaded) and (not dataLoaded) and playerName then
    AutoDecline_LoadData();
	end

  AutoDecline_GetGuildRoster()
end

-- *:***************************************************************
function AutoDecline_OnEvent(event)
   AutoDecline_Debug(format("%s firing", event) )
   if (event == "VARIABLES_LOADED") then
--     AutoDecline_Debug(format("%s firing", event) )
     variablesLoaded = true
     AutoDecline_Init()
   end

   if (event == "PLAYER_ENTERING_WORLD") then
     PDCheckVersion( _APP_PDLIB_DEPENDENCY, AutoDecline_Display )
   end

   if (event == "PLAYER_ENTERING_WORLD") or (event == "VARIABLES_LOADED") or (event == "UNIT_NAME_UPDATE") then
--     AutoDecline_Debug(format("%s firing", event) )
     AutoDecline_LoadPlayerInfo()
   end

   if dataLoaded then

--   if (event == "ARENA_TEAM_INVITE_REQUEST") then
--     AutoDecline_ArenaTeam(arg1, arg2)
--   end

   if (event == "GUILD_INVITE_REQUEST") then
     AutoDecline_Guild(arg1, arg2)
   end

   if (event == "PARTY_INVITE_REQUEST") then
     AutoDecline_Party(arg1)
   end

   if (event == "PETITION_SHOW") then
     AutoDecline_Charter()
   end

   if (event == "DUEL_REQUESTED") then
     AutoDecline_Duel(arg1)
   end

   if (event == "FRIENDLIST_UPDATE" ) then
     AutoDecline_LoadFriendsList()
   end

   if (event == "GUILD_ROSTER_UPDATE" ) then
     AutoDecline_GuildRosterLoaded()
   end

   if (event == "CHAT_MSG_WHISPER" )then
     AutoDecline_SetLastWhisper(arg2, "from")
   end

   if (event == "CHAT_MSG_WHISPER_INFORM") then
     AutoDecline_SetLastWhisper(arg2, "to")
   end

   if (event == "FRIENDLIST_SHOW") then
      AutoDecline_Debug("cancelFriendList = " .. PDFormatOutput(cancelFriendList))
      if cancelFriendList then
        AutoDecline_HideWindow("FriendsFrame")
        cancelFriendList = nil
      end
   end

   if (event == "WHO_LIST_UPDATE") then
   end

   end
end

-- *:***************************************************************
function AutoDecline_Init()
  AutoDecline_Debug("AutoDecline_Init() firing")

  SlashCmdList["AUTOD"] = AutoDecline_Commands
  SLASH_AUTOD1 = "/autodecline"
  SLASH_AUTOD2 = "/autod"
-- Too terse, can conflict with other mods
--  SLASH_AUTOD3 = "/ad"
end

-- *:***************************************************************
function AutoDecline_LoadData()
 AutoDecline_Debug("AutoDecline_LoadData() firing")
 AutoDecline_Debug("variablesLoaded = " .. PDFormatOutput(variablesLoaded) )

-- if (playerName ~= nil and playerName ~= "Unknown Entity") and variablesLoaded then
 if (type(playerName) == "string" and playerName ~= "Unknown Entity") and variablesLoaded then
  dataLoaded = true
  realmID = GetCVar("realmName")
  playerID = playerName .. "@" .. realmID
  localPlayerID = playerID

  AutoDecline_Debug("Setting playerID to " .. playerID )
  AutoDecline_LoadFriendsList()

  if PD_Persistent_Debug == nil then
     PD_Persistent_Debug = {}
  end

  if PD_Persistent_Debug[_APP_KEY] == nil then
     PD_Persistent_Debug[_APP_KEY] = false
  end

  ADdebugMode = PD_Persistent_Debug[_APP_KEY]
  optionsFrame = getglobal("ADOptionsFrame")

  -- Initialize configuration
  -- If this has been populated before, then it was loaded in the OnEvent
  -- subroutine.  Otherwise, we need to initialize it.

  if (not AutoDeclineConfig) then
    AutoDecline_Debug("Initializing AutoDeclineConfig")
    AutoDeclineConfig = {}
  end

  if AutoDeclineConfig["allChars"] then
     playerID = "allChars"
--     playerID = AutoDeclineConfig["allChars"]
--     AutoDecline_Debug( "AutoDeclineConfig['allChars'] = " .. PDFormatOutput(AutoDeclineConfig["allChars"]) )
--     AutoDecline_Debug( "playerID = " .. PDFormatOutput(playerID) )
  end

  if (not AutoDeclineConfig[playerID]) then
    AutoDecline_Debug(format("Initializing AutoDeclineConfig[%s]",playerID))
    AutoDeclineConfig[playerID] = {}
  end

  if AutoDeclineConfig["allChars"] then
     AutoDeclineConfig[localPlayerID] = AutoDeclineConfig[playerID]
  end

  if (not AutoDeclinePartyAllow) then
    AutoDecline_Debug("Initializing AutoDeclinePartyAllow")
    AutoDeclinePartyAllow = {}
  end
  if (not AutoDeclinePartyAllow[realmID]) then
    AutoDecline_Debug(format("Initializing AutoDeclinePartyAllow[%s]",realmID))
    AutoDeclinePartyAllow[realmID] = {}
  end

if (not AutoDeclineDuelAllow) then
   AutoDecline_Debug("Initializing AutoDeclineDuelAllow")
   AutoDeclineDuelAllow = {}
end

if (not AutoDeclineDuelAllow[realmID]) then
  AutoDecline_Debug(format("Initializing AutoDeclineDuelAllow[%s]",realmID))
  AutoDeclineDuelAllow[realmID] = {}
end

--[[
-- *: This functionality does not work.  See notes (way) below
--  if (not AutoDeclinePartyGuildAllow) then
--    AutoDecline_Debug("Initializing AutoDeclinePartyGuildAllow")
--    AutoDeclinePartyGuildAllow = {}
--  end
--  if (not AutoDeclinePartyGuildAllow[realmID]) then
--    AutoDecline_Debug(format("Initializing AutoDeclinePartyGuildAllow[%s]",realmID))
--    AutoDeclinePartyGuildAllow[realmID] = {}
--  end
--]]

  if (not AutoDeclineActions) then
    AutoDecline_Debug("Initializing AutoDeclineActions")
    AutoDeclineActions = {}
  end

  -- set the defaults
  -- default all to be on (decline)
  if (AutoDeclineConfig[playerID].guildToggle == nil) then
    AutoDeclineConfig[playerID].guildToggle = true
  end
  if (AutoDeclineConfig[playerID].partyToggle == nil) then
    AutoDeclineConfig[playerID].partyToggle = true
  end
  if (AutoDeclineConfig[playerID].duelToggle == nil) then
    AutoDeclineConfig[playerID].duelToggle = true
  end
  if (AutoDeclineConfig[playerID].charterToggle == nil) then
    AutoDeclineConfig[playerID].charterToggle = true
  end
--  if (AutoDeclineConfig[playerID].arenaTeamToggle == nil) then
--    AutoDeclineConfig[playerID].arenaTeamToggle = true
--  end
--  if (AutoDeclineConfig[playerID].arenaCharterToggle == nil) then
--    AutoDeclineConfig[playerID].arenaCharterToggle = true
--  end

  -- default showAlert to be on (display message when an auto decline occurs)
  if (AutoDeclineConfig[playerID].showAlert == nil) then
    AutoDeclineConfig[playerID].showAlert = true
  end

  -- default partyFriends to true (allow from friends)
  if (AutoDeclineConfig[playerID].partyFriends == nil) then
    AutoDeclineConfig[playerID].partyFriends = true
  end

  -- default partyFriends to true (allow from friends)
  if (AutoDeclineConfig[playerID].partyGuild == nil) then
    AutoDeclineConfig[playerID].partyGuild = true
  end


  -- default partyWhisper to false (don't allow from last whisper)
  if (AutoDeclineConfig[playerID].partyWhisper == nil) then
    AutoDeclineConfig[playerID].partyWhisper = false
  end
  if (AutoDeclineConfig[playerID].partyWhisperTo == nil) then
    AutoDeclineConfig[playerID].partyWhisperTo = false
  end

  --display AddOn loaded message at startup
  AutoDecline_Display(format(_PDLIB_LOAD_MSG, _APP_VERSION, _APP_INTERFACE, _APP_BETA))

 end

 if not(guildRosterLoaded) then
   AutoDecline_GetGuildRoster()
 end

end

-- *:***************************************************************
function AutoDecline_Unload()
   this:UnregisterEvent("VARIABLES_LOADED")
   this:UnregisterEvent("GUILD_INVITE_REQUEST")
   this:UnregisterEvent("PARTY_INVITE_REQUEST")
   this:UnregisterEvent("DUEL_REQUESTED")
   this:UnregisterEvent("PETITION_SHOW")
   this:UnregisterEvent("PLAYER_ENTERING_WORLD")
   this:UnregisterEvent("UNIT_NAME_UPDATE")
   this:UnregisterEvent("FRIENDLIST_UPDATE")
   this:UnregisterEvent("CHAT_MSG_WHISPER")
   this:UnregisterEvent("FRIENDLIST_SHOW")
   this:UnregisterEvent("WHO_LIST_UPDATE")
--   this:UnregisterEvent("ARENA_TEAM_INVITE_REQUEST")

   SlashCmdList["AUTOD"] = nil
end

-- *:***************************************************************
function AutoDecline_Commands(commandLine)

  local commandLineProcessed = false
  commandLine = PDTrimSpace(commandLine)

  actionVerb, argArray, argString = PDGetCommand(commandLine, ",")
  argArray = (argArray or {})

  if (actionVerb == _PDLIB_CMD_DEBUG) then
    if argArray[1] == nil then
      argArray[1] = not(ADdebugMode)
    end
    ADdebugMode = PDSetDebug(argArray[1], AutoDecline_Display, _APP_KEY)
  else

  if not playerID then
    AutoDecline_LoadPlayerInfo()
  end

  if playerID then
-- *: I can't think of any reason where this would be useful as a command line option,
-- *: so I'm going to leave it as a GUI check box only.
--  elseif actionVerb == "allchars" then

  if (actionVerb == _PDLIB_CMD_ABOUT) then
    AutoDecline_Display(format(_PDLIB_VERSION_INFO, _APP_VERSION, _APP_INTERFACE, _APP_BETA))
    AutoDecline_Display(_PDLIB_BYLINE)

  elseif (commandLine == "") or (actionVerb == AD_OPTIONS) then
    if not optionsFrame:IsVisible() then
        optionsFrame:Show();
    else
        optionsFrame:Hide();
    end

  elseif (actionVerb == AD_CMD_STATUS) or (actionVerb == "s") then
    AutoDecline_ShowStatus()

  elseif (actionVerb == AD_CMD_ALERT) or (actionVerb == "a") then
    AutoDeclineConfig[playerID].showAlert = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].showAlert)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].showAlert, AD_ALERT_ON, AD_ALERT_OFF))

  elseif (actionVerb == AD_CMD_GUILD) or (actionVerb == "g") then
    AutoDeclineConfig[playerID].guildToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].guildToggle)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].guildToggle, AD_GUILD_ON, AD_GUILD_OFF))

--  elseif (actionVerb == AD_CMD_ARENATEAM) or (actionVerb == "at") then
--    AutoDeclineConfig[playerID].arenaTeamToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].arenaTeamToggle)
--    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].arenaTeamToggle, AD_ARENATEAM_ON, AD_ARENATEAM_OFF))

--  elseif (actionVerb == AD_CMD_ARENACHARTER) or (actionVerb == "ac") then
--    AutoDeclineConfig[playerID].arenaCharterToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].arenaCharterToggle)
--    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].arenaCharterToggle, AD_ARENACHARTER_ON, AD_ARENACHARTER_OFF))

  elseif (actionVerb == AD_CMD_PARTY) or (actionVerb == "p") then
    AutoDeclineConfig[playerID].partyToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyToggle)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyToggle, AD_PARTY_ON, AD_PARTY_OFF))

  elseif (actionVerb == AD_CMD_DUEL) or (actionVerb == "d") then
    AutoDeclineConfig[playerID].duelToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].duelToggle)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].duelToggle, AD_DUEL_ON, AD_DUEL_OFF))

  elseif (actionVerb == AD_CMD_CHARTER) or (actionVerb == "c") then
    AutoDeclineConfig[playerID].charterToggle = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].charterToggle)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].charterToggle, AD_CHARTER_ON, AD_CHARTER_OFF))

  elseif (actionVerb == AD_CMD_DUELWHISPER) or (actionVerb == "pw") then
    AutoDeclineConfig[playerID].duelWhisper = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].duelWhisper)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].duelWhisper, AD_DUELWHISPER_ON, AD_DUELWHISPER_OFF))

  elseif (actionVerb == AD_CMD_DUELWHISPERTO) or (actionVerb == "pwt") then
    AutoDeclineConfig[playerID].duelWhisperTo = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].duelWhisperTo)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].duelWhisperTo, AD_DUELWHISPERTO_ON, AD_DUELWHISPERTO_OFF))

  elseif (actionVerb == AD_CMD_PARTYWHISPER) or (actionVerb == "pw") then
    AutoDeclineConfig[playerID].partyWhisper = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyWhisper)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyWhisper, AD_PARTYWHISPER_ON, AD_PARTYWHISPER_OFF))

  elseif (actionVerb == AD_CMD_PARTYWHISPERTO) or (actionVerb == "pwt") then
    AutoDeclineConfig[playerID].partyWhisperTo = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyWhisperTo)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyWhisperTo, AD_PARTYWHISPERTO_ON, AD_PARTYWHISPERTO_OFF))

  elseif (actionVerb == AD_CMD_PARTYBATTLEFIELD) or (actionVerb == "pbf") then
    AutoDeclineConfig[playerID].partyBattlefield = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyBattlefield)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyBattlefield, AD_PARTYBATTLEFIELD_ON, AD_PARTYBATTLEFIELD_OFF))

  elseif (actionVerb == AD_CMD_PARTYFRIENDS) or (actionVerb == "pf") then
    AutoDeclineConfig[playerID].partyFriends = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyFriends)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyFriends, AD_PARTYFRIENDS_ON, AD_PARTYFRIENDS_OFF))

  elseif (actionVerb == AD_CMD_CLEARWHISPER) or (actionVerb == "cw") then
    whisperNames = {}
    AutoDecline_Display( AD_MSG_CLEARWHISPER )

  elseif (actionVerb == AD_CMD_CLEARWHISPERTO) or (actionVerb == "cwt") then
    whisperNamesTo = {}
    AutoDecline_Display( AD_MSG_CLEARWHISPERTO )

  elseif (actionVerb == AD_CMD_ADDLASTINVITE) or (actionVerb == "ali") then
    if lastInvite then
      AutoDecline_AddList(AutoDeclinePartyAllow, { lastInvite }, AD_LASTINVITE_ADD)
    else
      AutoDecline_Display( AD_LASTINVITE_NONE )
    end

  elseif (actionVerb == AD_CMD_PARTYPLAYER) or (actionVerb == "pp") then
     subVerb, argArray, argString = PDGetCommand(argString, ",")
     if (subVerb == _PDLIB_CMD_ADD) or (subVerb == "a")then
       AutoDecline_AddList(AutoDeclinePartyAllow, argArray, AD_PARTYPLAYER_ADD)
     elseif (subVerb == _PDLIB_CMD_REMOVE) or (subVerb == "r") then
       for argIndex,argValue in pairs(argArray) do
         if (type(argValue) == "string") and (string.len(argValue) > 0) then
           AutoDeclinePartyAllow[realmID][string.lower(argValue)] = false
           AutoDecline_Display(format(AD_PARTYPLAYER_REMOVE, argValue))
         end
       end
     elseif (subVerb == _PDLIB_CMD_LIST) or (subVerb == "l") then
       AutoDecline_Display(AD_PARTYPLAYER_LIST)
       for personName in pairs(AutoDeclinePartyAllow[realmID]) do
         if AutoDeclinePartyAllow[realmID][personName] then
           AutoDecline_Display("  " .. personName)
         end
       end
     elseif (subVerb == _PDLIB_CMD_CLEAR) or (subVerb == "c") then
       AutoDeclinePartyAllow[realmID] = {}
       AutoDecline_Display(AD_PARTYPLAYER_CLEAR)
     end

  elseif (actionVerb == AD_CMD_PARTYGUILD) or (actionVerb == "pg") then
    AutoDeclineConfig[playerID].partyGuild = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].partyGuild)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].partyGuild, AD_PARTYGUILD_ON, AD_PARTYGUILD_OFF))

  elseif (actionVerb == AD_CMD_DUELFRIENDS) or (actionVerb == "df") then
    AutoDeclineConfig[playerID].duelFriends = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].duelFriends)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].duelFriends, AD_DUELFRIENDS_ON, AD_DUELFRIENDS_OFF))

  elseif (actionVerb == AD_CMD_ADDLASTDUEL) or (actionVerb == "ald") then
    if lastDuel then
      AutoDecline_AddList(AutoDeclineDuelAllow, { lastDuel }, AD_LASTDUEL_ADD)
    else
      AutoDecline_Display( AD_LASTDUEL_NONE )
    end

  elseif (actionVerb == AD_CMD_DUELPLAYER) or (actionVerb == "dp") then
     subVerb, argArray, argString = PDGetCommand(argString, ",")
     if (subVerb == _PDLIB_CMD_ADD) or (subVerb == "a")then
       AutoDecline_AddList(AutoDeclineDuelAllow, argArray, AD_DUELPLAYER_ADD)
     elseif (subVerb == _PDLIB_CMD_REMOVE) or (subVerb == "r") then
       for argIndex,argValue in pairs(argArray) do
         if (type(argValue) == "string") and (string.len(argValue) > 0) then
           AutoDeclineDuelAllow[realmID][string.lower(argValue)] = false
           AutoDecline_Display(format(AD_DUELPLAYER_REMOVE, argValue))
         end
       end
     elseif (subVerb == _PDLIB_CMD_LIST) or (subVerb == "l") then
       AutoDecline_Display(AD_DUELPLAYER_LIST)
       for personName in pairs(AutoDeclineDuelAllow[realmID]) do
         if AutoDeclineDuelAllow[realmID][personName] then
           AutoDecline_Display("  " .. personName)
         end
       end
     elseif (subVerb == _PDLIB_CMD_CLEAR) or (subVerb == "c") then
       AutoDeclineDuelAllow[realmID] = {}
       AutoDecline_Display(AD_DUELPLAYER_CLEAR)
     end

  elseif (actionVerb == AD_CMD_DUELGUILD) or (actionVerb == "dg") then
    AutoDeclineConfig[playerID].duelGuild = AutoDecline_SetStatus(argArray[1], AutoDeclineConfig[playerID].duelGuild)
    AutoDecline_Display(PDiif(AutoDeclineConfig[playerID].duelGuild, AD_DUELGUILD_ON, AD_DUELGUILD_OFF))


--[[
-- This doesn't work, the WoW AI currently does not support a good way of
-- getting the guild name of a player given the players name.  This will have
-- to wait until some future time when and if they do support that.
     subVerb, argArray, argString = PDGetCommand(argString, ",")
     if (subVerb == "add") or (subVerb == "a") then
       AutoDecline_AddList(AutoDeclinePartyGuildAllow, argArray, AD_PARTYGUILD_ADD )
     elseif (subVerb == "remove") or (subVerb == "r") then
       for argIndex,argValue in pairs(argArray) do
         if (type(argValue) == "string") and (string.len(argValue) > 0) then
           AutoDecline_Debug("argValue = >" .. argValue .. "<")
           AutoDecline_Debug("string.len(argValue) = " .. string.len(argValue))
           AutoDeclinePartyGuildAllow[realmID][string.lower(argValue)] = false
           AutoDecline_Display(format(AD_PARTYGUILD_REMOVE, argValue))
         end
       end
     elseif (subVerb == "list") or (subVerb == "l") then
       AutoDecline_Display(AD_PARTYGUILD_LIST)
       for guildName in pairs(AutoDeclinePartyGuildAllow[realmID]) do
         if AutoDeclinePartyGuildAllow[realmID][guildName] then
          AutoDecline_Display("  " .. guildName)
         end
       end
     elseif (subVerb == "clear") or (subVerb == "c") then
       AutoDeclinePartyAllow[realmID] = {}
       AutoDecline_Display(AD_PARTYGUILD_CLEAR)
     end
--]]

    elseif (actionVerb == AD_CMD_PARTYACTION) or (actionVerb == "pa") then
       AutoDecline_AddAction("PARTY", argString)
    elseif (actionVerb == AD_CMD_DUELACTION) or (actionVerb == "da") then
       AutoDecline_AddAction("DUEL", argString)
    elseif (actionVerb == AD_CMD_GUILDACTION) or (actionVerb == "ga") then
       AutoDecline_AddAction("GUILD", argString)
    elseif (actionVerb == AD_CMD_CHARTERACTION) or (actionVerb == "ca") then
       AutoDecline_AddAction("CHARTER", argString)

--    elseif (actionVerb == AD_CMD_ARENATEAMACTION) or (actionVerb == "ata") then
--       AutoDecline_AddAction("ARENATEAM", argString)

--    elseif (actionVerb == AD_CMD_ARENACHARTERACTION) or (actionVerb == "aca") then
--       AutoDecline_AddAction("ARENACHARTER", argString)

-- Debugging commands only
  elseif (actionVerb == "listfriends") and ADdebugMode then
     AutoDecline_Debug("List of friends")
     for personName in pairs(AutoDeclineFriends[realmID]) do
        AutoDecline_Debug("  " .. personName)
     end

-- *: Manually perform actions for testing
  elseif (actionVerb == "doaction") and ADdebugMode then
     if (argArray[1] == "charter") then
        AutoDecline_DoAction( AutoDeclineActions["CHARTER"], {player=argArray[2],guild=argArray[3]} )
     elseif (argArray[1] == "party") then
        AutoDecline_DoAction( AutoDeclineActions["PARTY"], {player=argArray[2],guild=""} )
     elseif (argArray[1] == "guild") then
        AutoDecline_DoAction( AutoDeclineActions["GUILD"], {player=argArray[2],guild=argArray[3]} )
     elseif (argArray[1] == "duel") then
        AutoDecline_DoAction( AutoDeclineActions["DUEL"], {player=argArray[2],guild=""} )

--     elseif (argArray[1] == "arenateam") then
--        AutoDecline_DoAction( AutoDeclineActions["ARENATEAM"], {player=argArray[2],guild=argArray[3]} )
--     elseif (argArray[1] == "arenacharter") then
--        AutoDecline_DoAction( AutoDeclineActions["ARENACHARTER"], {player=argArray[2],guild=argArray[3]} )

     else
        AutoDecline_Debug( "Unknown action:  " .. PDFormatOutput(argArray[1]) )
     end

  elseif (actionVerb == "listwindows") and ADdebugMode then
     AutoDecline_ListWindows()

  elseif (actionVerb == "hidewin") and ADdebugMode then
    AutoDecline_Debug(format("Hiding window %s", argString))
    AutoDecline_HideWindow(argString)

  elseif (actionVerb == "charinfo") and ADdebugMode then
--    SetWhoToUI(1)
--    SendWho( argArray[1] )
    AutoDecline_Debug("AutoDecline_CheckGuild(" .. argArray[1] .. ") = " .. PDFormatOutput(AutoDecline_CheckGuild(argArray[1])))

  elseif (actionVerb == "showvars") and ADdebugMode then
    AutoDecline_ShowVars()

  else
    AutoDecline_Display(AD_SYNTAX)
  end
 else
   AutoDecline_Display(AD_NAME_NOT_FOUND)
   AutoDecline_Unload()
 end

 end

end

-- *:***************************************************************
function AutoDecline_Charter()

    AutoDecline_Debug("playerID: " .. PDFormatOutput(playerID) )
    AutoDecline_Debug("AutoDeclineConfig[playerID].charterToggle: " .. PDFormatOutput(AutoDeclineConfig[playerID].charterToggle) )
--    AutoDecline_Debug("AutoDeclineConfig[playerID].arenaCharterToggle: " .. PDFormatOutput(AutoDeclineConfig[playerID].arenaCharterToggle) )

    local petitionType, title, bodyText, maxSignatures, originatorName, isOriginator = GetPetitionInfo();

    if (petitionType == "guild") and (AutoDeclineConfig[playerID].charterToggle) then
      ClosePetition()
      AutoDecline_Display(format(AD_PETITION_REQUEST, originatorName, title))
      if AutoDeclineActions["CHARTER"] then
         AutoDecline_DoAction( AutoDeclineActions["CHARTER"], {player=originatorName, guild=title} )
      end

--    elseif (petitionType == "arena") and (AutoDeclineConfig[playerID].arenaCharterToggle) then
--      ClosePetition()
--      AutoDecline_Display(format(AD_ARENA_CHARTER, originatorName, title))
--      if AutoDeclineActions["ARENACHARTER"] then
--         AutoDecline_DoAction( AutoDeclineActions["ARENACHARTER"], {player=originatorName, team=title} )
--      end
    end

    AutoDecline_Debug("Petition Info")
    AutoDecline_Debug("petitionType = " .. petitionType)
    AutoDecline_Debug("title = " .. title )
    AutoDecline_Debug("bodyText = " .. bodyText )
    AutoDecline_Debug("originatorName = " .. originatorName )
end


-- *:***************************************************************
function AutoDecline_Duel(player)
  local playerCheck = string.lower(player)

  lastDuel = playerCheck

  if ADdebugMode then
    AutoDecline_Debug( format("AutoDeclineDuelAllow[%s][%s] = %s", realmID, playerCheck, PDFormatOutput(AutoDeclineDuelAllow[realmID][playerCheck])) )
    AutoDecline_Debug( format("playerCheck = %s", PDFormatOutput(playerCheck) ))
    AutoDecline_Debug( format("AutoDeclineConfig[%s].duelToggle = %s",playerID, PDFormatOutput(AutoDeclineConfig[playerID].duelToggle) ))
  end
  bypassCheck = AutoDeclineDuelAllow[realmID][playerCheck]

-- Check if the player is a friend and friends are allowed to invite
  if ADdebugMode then
    AutoDecline_Debug( format("AutoDeclineConfig[%s].duelFriends = %s", playerID, PDFormatOutput(AutoDeclineConfig[playerID].duelFriends) ))
    AutoDecline_Debug( format("AutoDeclineFriends[%s][%s] = %s", realmID, playerCheck, PDFormatOutput(AutoDeclineFriends[realmID][playerCheck]) ))
  end
  if AutoDeclineConfig[playerID].duelFriends and (not bypassCheck) then
    bypassCheck = bypassCheck or AutoDeclineFriends[realmID][playerCheck]
  end

-- *: Check if the player is a guild member
  AutoDecline_Debug( format("AutoDeclineConfig[%s].duelGuild = %s", playerID, PDFormatOutput(AutoDeclineConfig[playerID].duelGuild) ))

  if AutoDeclineConfig[playerID].duelGuild and (not bypassCheck) then
    local checkGuild = AutoDecline_CheckGuild(playerCheck)
    AutoDecline_Debug( format("AutoDecline_CheckGuild(%s) = %s", playerCheck, PDFormatOutput(checkGuild)) )
    bypassCheck = bypassCheck or checkGuild
  end

if (not bypassCheck) then
  local inWhisperList = table.foreach(whisperNames, function (index,value)
                                      if (playerCheck == value) then return index end
                                    end)
  local inWhisperToList = table.foreach(whisperNamesTo, function (index,value)
                                      if (playerCheck == value) then return index end
                                    end)

  AutoDecline_Debug( format("inWhisperList = %s", PDFormatOutput(inWhisperList) ))
  AutoDecline_Debug( format("inWhisperListTo = %s", PDFormatOutput(inWhisperListTo) ))

  if AutoDeclineConfig[playerID].duelWhisper and inWhisperList and (not bypassCheck) then
    bypassCheck = true
  end

-- *: Check if the player was in the last to whisper to list
  AutoDecline_Debug( "WhisperNamesTo = " .. PDFormatOutput(whisperNamesTo) )
  AutoDecline_Debug( "AutoDeclineConfig[playerID].duelWhisperTo = " .. PDFormatOutput(AutoDeclineConfig[playerID].duelWhisperTo) )

  if AutoDeclineConfig[playerID].duelWhisperTo and inWhisperToList and (not bypassCheck) then
    bypassCheck = true
  end
end

  AutoDecline_Debug( "bypassCheck = " .. PDFormatOutput(bypassCheck) )


--  bypassCheck = False

  if AutoDeclineConfig[playerID].duelToggle and (not bypassCheck) then
    CancelDuel()
    AutoDecline_Display(format(AD_DUEL_REQUEST, player))
    AutoDecline_HideWindow("DUEL_REQUESTED")
    if AutoDeclineActions["DUEL"] then
       AutoDecline_DoAction( AutoDeclineActions["DUEL"], {player=player, guild=""} )
    end
  end
end

-- *:***************************************************************
function AutoDecline_Guild(player,guild)
  AutoDecline_Debug( "IsInGuild() = " .. PDFormatOutput(IsInGuild()) )
  if AutoDeclineConfig[playerID].guildToggle then
    DeclineGuild()
    AutoDecline_Display(format(AD_GUILD_INVITE, player, guild))
    AutoDecline_HideWindow("GUILD_INVITE")
    if AutoDeclineActions["GUILD"] then
       AutoDecline_DoAction( AutoDeclineActions["GUILD"], {player=player, guild=guild} )
    end
  end
end

-- *:***************************************************************
--function AutoDecline_ArenaTeam(player,team)
--  AutoDecline_Debug( format("Declining arena team: player = %s, team = %s", player, team) )
--  if AutoDeclineConfig[playerID].arenaToggle then
--     HideUIPanel(StaticPopup1)
-- 	   DeclineArenaTeam()
--	   AutoDecline_Display(format(AD_ARENA_REQUEST, player, team))
--	   if AutoDeclineActions["ARENATEAM"] then
--	      AutoDecline_DoAction( AutoDeclineActions["ARENATEAM"], {player=player,team=team} )
--	   end
--  end
--end

-- *:***************************************************************
function AutoDecline_Party(player)
  local playerCheck = string.lower(player)
  lastInvite = playerCheck

-- *: This doesn't work, GetGuildInfo doesn't take a player name, it takes a key value.
--  guildName, guildRankName, guildRankIndex = GetGuildInfo(player);

-- *: Check if the player is in the list of allowed names
  AutoDecline_Debug( format("AutoDeclinePartyAllow[%s][%s] = %s", realmID, playerCheck, PDFormatOutput(AutoDeclinePartyAllow[realmID][playerCheck])) )
  AutoDecline_Debug( format("playerCheck = %s", PDFormatOutput(playerCheck) ))
  AutoDecline_Debug( format("AutoDeclineConfig[%s].partyToggle = %s",playerID, PDFormatOutput(AutoDeclineConfig[playerID].partyToggle) ))

  bypassCheck = AutoDeclinePartyAllow[realmID][playerCheck]

-- Check if the player is a friend and friends are allowed to invite
  AutoDecline_Debug( format("AutoDeclineConfig[%s].partyFriends = %s", playerID, PDFormatOutput(AutoDeclineConfig[playerID].partyFriends) ))
  AutoDecline_Debug( format("AutoDeclineFriends[%s][%s] = %s", realmID, playerCheck, PDFormatOutput(AutoDeclineFriends[realmID][playerCheck]) ))

  if AutoDeclineConfig[playerID].partyFriends and (not bypassCheck) then
    bypassCheck = bypassCheck or AutoDeclineFriends[realmID][playerCheck]
  end

-- *: Check if the player was in the last to whisper list
  AutoDecline_Debug( format("AutoDeclineConfig[%s].partyWhisper = %s",playerID, PDFormatOutput(AutoDeclineConfig[playerID].partyWhisper) ))
  AutoDecline_Debug( format("whisperNames = %s", PDFormatOutput(whisperNames) ))
  AutoDecline_Debug( format("whisperNames[%s] = %s", playerCheck, PDFormatOutput(whisperNames[playerCheck]) ))

  local inWhisperList = table.foreach(whisperNames, function (index,value)
                                      if (playerCheck == value) then return index end
                                    end)
  local inWhisperToList = table.foreach(whisperNamesTo, function (index,value)
                                      if (playerCheck == value) then return index end
                                    end)

  AutoDecline_Debug( format("inWhisperList = %s", PDFormatOutput(inWhisperList) ))
  AutoDecline_Debug( format("inWhisperListTo = %s", PDFormatOutput(inWhisperListTo) ))

--  if AutoDeclineConfig[playerID].partyWhisper and whisperNames[playerCheck] and (not bypassCheck) then
  if AutoDeclineConfig[playerID].partyWhisper and inWhisperList and (not bypassCheck) then
    bypassCheck = true
  end

-- *: Check if the player was in the last to whisper to list
  AutoDecline_Debug( "WhisperNamesTo = " .. PDFormatOutput(whisperNamesTo) )
  AutoDecline_Debug( "AutoDeclineConfig[playerID].partyWhisperTo = " .. PDFormatOutput(AutoDeclineConfig[playerID].partyWhisperTo) )

--  if AutoDeclineConfig[playerID].partyWhisperTo and whisperNamesTo[playerCheck] and (not bypassCheck) then
  if AutoDeclineConfig[playerID].partyWhisperTo and inWhisperToList and (not bypassCheck) then
    bypassCheck = true
  end

-- *: Check if the player is a guild member
  AutoDecline_Debug( format("AutoDeclineConfig[%s].partyGuild = %s", playerID, PDFormatOutput(AutoDeclineConfig[playerID].partyGuild) ))

  if AutoDeclineConfig[playerID].partyGuild and (not bypassCheck) then
    local checkGuild = AutoDecline_CheckGuild(playerCheck)
    AutoDecline_Debug( format("AutoDecline_CheckGuild(%s) = %s", playerCheck, PDFormatOutput(checkGuild)) )
    bypassCheck = bypassCheck or checkGuild
  end
-- bypassCheck or AutoDeclinePartyGuildAllow[realmID][guildName]

-- *: Check if the player is in an active battlefield
  AutoDecline_Debug( "AutoDeclineConfig[" .. PDFormatOutput(playerID) .. "].partyBattlefield = " .. PDFormatOutput(AutoDeclineConfig[playerID].partyBattlefield) )
  if AutoDeclineConfig[playerID].partyBattlefield and (not bypassCheck) then
    local BGstatus, BGmapName, BGinstanceID = GetBattlefieldStatus(1)
    AutoDecline_Debug("BG status      = " .. PDFormatOutput(BGstatus) )
    AutoDecline_Debug("BG mapName     = " .. PDFormatOutput(BGmapName) )
    AutoDecline_Debug("BG instanceID  = " .. PDFormatOutput(BGinstanceID) )
    if (BGstatus == "active") then
       bypassCheck = true
    end
  end

  AutoDecline_Debug( "bypassCheck = " .. PDFormatOutput(bypassCheck) )

  if AutoDeclineConfig[playerID].partyToggle and (not bypassCheck) then
    DeclineGroup();
    AutoDecline_Display(format(AD_PARTY_INVITE, player))
    AutoDecline_HideWindow("PARTY_INVITE")
    if AutoDeclineActions["PARTY"] then
       AutoDecline_DoAction( AutoDeclineActions["PARTY"], {player=player, guild=""} )
    end
  end

  AutoDecline_ShowWho(player)
end

-- *:***************************************************************
function AutoDecline_Display(displayText)
  PDDisplay(displayText, AD_TAG)
end

-- *:***************************************************************
function AutoDecline_ShowAlert(alertMessage)
  if AutoDeclineConfig[playerID].showAlert then
     AutoDecline_Display(alertMessage)
  end
end

-- *:***************************************************************
function AutoDecline_ListWindows()
  AutoDecline_Display("Listing open windows:")
  for windowIndex = 1,STATICPOPUP_NUMDIALOGS do
    local currentFrame = getglobal("StaticPopup" .. windowIndex)
    if currentFrame:IsVisible() then
       isVisible = ""
    else
       isVisible = " (invisible)"
    end
    AutoDecline_Display("   " .. PDFormatOutput(currentFrame.which) .. isVisible )
  end
end

-- *:***************************************************************
function AutoDecline_HideWindow(windowToHide)
  local windowIndex, hidWindow
  hidWindow = nil
  for windowIndex = 1, STATICPOPUP_NUMDIALOGS do
    local currentFrame = getglobal("StaticPopup" .. windowIndex)
    if currentFrame:IsVisible() and (currentFrame.which == windowToHide) then
      currentFrame:Hide()
      hidWindow = true
    end
  end

  if (not hidWindow) then
    local currentFrame = getglobal(windowToHide)
    if currentFrame and currentFrame:IsVisible() then
      currentFrame:Hide()
      hidWindow = true
    else
      if (not currentFrame) then
        AutoDecline_Debug(format("Frame %s not found.", windowToHide))
      else
        AutoDecline_Debug(format("Frame %s found, but it is hidden already.", windowToHide))
      end
    end
  end

  if not hidWindow then
    AutoDecline_Debug(format("Window %s not found.", windowToHide))
  end
end

-- *:***************************************************************
function AutoDecline_ShowToggle(toggleValue)
  return PDShowToggle(toggleValue)end

-- *:***************************************************************
function AutoDecline_SetStatus(statusString, origValue)
   returnResult = origValue
   statusString = (statusString or "")
   statusString = string.lower(statusString)

   if statusString == "on" then
      returnResult = true
   elseif statusString == "off" then
      returnResult = false
   elseif statusString == "" then
      returnResult = not returnResult
   end
   return returnResult
end

-- *:***************************************************************
function AutoDecline_GetValue(valueKey)
   returnValue = ""
   if not playerID then
      AutoDecline_Display("GetValue ERROR: Invalid playerID = " .. PDFormatOutput(playerID))
   elseif not valueKey then
      AutoDecline_Display("GetValue ERROR: Invalid valueKey = " .. PDFormatOutput(valueKey))
   else
     if valueKey == "allChars" then
       returnValue = AutoDeclineConfig[valueKey]
     else
       returnValue = AutoDeclineConfig[playerID][valueKey]
     end
   end
--   end
   return returnValue
end

-- *:***************************************************************
function AutoDecline_SetValue(valueKey, newValue)
   if valueKey == "allChars" then
     if playerID ~= "allChars" then
       AutoDeclineConfig["allChars"] = AutoDeclineConfig[playerID]
     end
   else
   if not playerID then
      AutoDecline_Display("SetValue ERROR: Invalid playerID = " .. PDFormatOutput(playerID))
   elseif not valueKey then
      AutoDecline_Display("SetValue ERROR: Invalid valueKey = " .. PDFormatOutput(valueKey))
   else
      AutoDeclineConfig[playerID][valueKey] = newValue
   end
   end
end

-- *:***************************************************************
function AutoDecline_SetAllChars()
   if playerID ~= "allChars" then
     AutoDecline_Debug( "Setting AllChars")
     AutoDeclineConfig["allChars"] = AutoDeclineConfig[playerID]
     playerID = "allChars"
   end
end

-- *:***************************************************************
function AutoDecline_SetLocalChars()
   if playerID ~= localPlayerID then
     AutoDecline_Debug( "Restoring local character settings")
     playerID = localPlayerID
     AutoDeclineConfig[playerID] = AutoDeclineConfig["allChars"]
     AutoDeclineConfig["allChars"] = nil
   end
end

-- *:***************************************************************
function AutoDecline_LoadFriendsList()
   if realmID then
      AutoDeclineFriends[realmID] = {}
      numberOfFriends = GetNumFriends()
      for friendIndex = 1, numberOfFriends do
         friendName, friendLevel, friendClass, friendArea, friendConnected = GetFriendInfo(friendIndex)
         if friendName then
           friendName = string.lower(friendName)
           AutoDeclineFriends[realmID][friendName] = true
         end
      end
   end
end

-- *:***************************************************************
function AutoDecline_SetLastWhisper(playerName, toFrom)
   local newName = string.lower(playerName)
   local nameList = {}

   AutoDecline_Debug( "Entering SetLastWhisper("..PDFormatOutput(playerName)..","..PDFormatOutput(toFrom)..")" )

   if toFrom == "from" then
      nameList = whisperNames
   else
     nameList = whisperNamesTo
   end

   if not nameList then
     nameList = {}
   end
   local inList = table.foreach(nameList, function (index,value)
                                      if (newName == value) then return index end
                                    end)
   if (not inList) then
     table.insert(nameList, newName)
     AutoDecline_Debug(format("Adding %s to whisperNames.", newName))
     if table.getn(nameList) > whisperLimit then
        AutoDecline_Debug(format("Removing %s from whisperNames.", nameList[1]))
        table.remove(nameList, 1)
     end
   end

   if toFrom == "from" then
     whisperName = nameList
   else
     whisperNamesTo = nameList
   end
end

-- *:***************************************************************
function AutoDecline_CheckGuild(playerName)
   local returnValue = nil

   local guildCount = GetNumGuildMembers()
   AutoDecline_Debug("GetNumGuildMembers() = %s", guildCount)

   if (IsInGuild()) and (guildCount < 1) then
      AutoDecline_Display("Guild information not loaded from server, guild accepts will not work until it is.")
      AutoDecline_Display("Attempting to load information now, but it may take a few seconds.")
      AutoDecline_GetGuildRoster()
      guildCount = GetNumGuildMembers()
   end

   for guildIndex = 1,guildCount do
     memberName, _, _, _, _, _, _, _, _, _ = GetGuildRosterInfo(guildIndex)
     AutoDecline_Debug(format("  %s == %s => %s", playerName, string.lower(memberName), PDFormatOutput(playerName == string.lower(memberName))))
     if string.lower(playerName) == string.lower(memberName) then
       returnValue = true
       break
     end
   end

--[[
-- This doesn't work, to be implemented in the future when WoW supports a good way
-- to get the guild name given a players name.
   adCheckingGuild = true

--   SetWhoToUI(1)
--   SendWho( playerName )

   AutoDecline_Debug( "Waiting for FriendsFrame to be visible." )
   friendsFrame = getglobal( "FriendsFrame" )

--   while friendsFrame and (not friendsFrame:IsVisible()) and (not adLoopStop) do
--   end

   if adLoopStop then
     AutoDecline_Debug( "Waiting for FriendsFrame to be visible." )
   else
     if friendsFrame then
       AutoDecline_Debug( "FriendsFrame is visible!" )
       AutoDecline_HideWindow( "FriendsFrame" )
     else
       AutoDecline_Debug( "FriendsFrame not found." )
     end
   end

   whoCount = GetNumWhoResults()
   AutoDecline_Debug( "Got " .. whoCount .. " who results back." )
   for whoIndex = 1,whoCount do
     whoName, guildName, playerLevel, playerRace, playerClass, playerZone, unknown = GetWhoInfo( whoIndex );

     AutoDecline_Debug( "whoName = " .. PDFormatOutput(whoName) )
     AutoDecline_Debug( "guildName = " .. PDFormatOutput(guildName) )
     AutoDecline_Debug( "playerLevel = " .. PDFormatOutput(playerLevel) )
     AutoDecline_Debug( "playerRace = " .. PDFormatOutput(playerRace) )
     AutoDecline_Debug( "playerClass = " .. PDFormatOutput(playerClass) )
     AutoDecline_Debug( "playerZone = " .. PDFormatOutput(playerZone) )
     AutoDecline_Debug( "unknown = " .. PDFormatOutput(unknown) )

     if string.lower( whoName ) == playerName then
       whoIndex = whoCount
     else
       guildName = nil
     end
   end

   if guildName then
     returnValue = AutoDeclinePartyGuildAllow[realmID][string.lower(guildName)]
   else
     returnValue = ""
   end

   AutoDecline_HideWindow( "FriendsFrame" )
   cancelFriendList = true
--]]

   return returnValue
end

-- *:***************************************************************
function AutoDecline_ShowStatus()
    AutoDecline_Display("Status")

--Maziel
--    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].arenaToggle, AD_ARENA_ON, AD_ARENA_OFF))

    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].guildToggle, AD_GUILD_ON, AD_GUILD_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyToggle, AD_PARTY_ON, AD_PARTY_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].duelToggle, AD_DUEL_ON, AD_DUEL_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].charterToggle, AD_CHARTER_ON, AD_CHARTER_OFF))

    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyFriends, AD_PARTYFRIENDS_ON, AD_PARTYFRIENDS_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyGuild, AD_PARTYGUILD_ON, AD_PARTYGUILD_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyWhisper, AD_PARTYWHISPER_ON, AD_PARTYWHISPER_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyWhisperTo, AD_PARTYWHISPERTO_ON, AD_PARTYWHISPERTO_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].partyBattlefield, AD_PARTYBATTLEFIELD_ON, AD_PARTYBATTLEFIELD_OFF))
    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].showAlert, AD_ALERT_ON, AD_ALERT_OFF))

-- *: In Development
--    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].duelFriends, AD_DUELFRIENDS_ON, AD_DUELFRIENDS_OFF))
--    AutoDecline_Display("   " .. PDiif(AutoDeclineConfig[playerID].duelGuild, AD_DUELGUILD_ON, AD_DUELGUILD_OFF))

    if AUTODECLINE_DEBUG then
      AutoDecline_Display("   ** Persistant debug mode is ON")
    end
    if ADdebugMode then
      AutoDecline_Display("   ** Debug mode is ON")
    end

    AutoDecline_Display("")
    AutoDecline_DisplayActions("PARTY")
    AutoDecline_DisplayActions("DUEL")
    AutoDecline_DisplayActions("CHARTER")
    AutoDecline_DisplayActions("GUILD")
end

-- *:***************************************************************
function AutoDecline_DisplayActions(declineType)
  if AutoDeclineActions[declineType] then
    AutoDecline_Display(format(AD_DISPLAYACTION_HEADER, declineType))
    for actionIndex,eachAction in pairs(AutoDeclineActions[declineType]) do
      AutoDecline_Display(format("%4s",actionIndex) .. ": " .. eachAction)
    end
  else
    AutoDecline_Display(format(AD_DISPLAYACTION_NONE, declineType))
  end
end

--[[
*:***************************************************************
*: AutoDecline_DoAction
*:   Perform the list of actions when a decline is triggered
*:
*: Parameters
*:   actionList ........ : The list of actions to perform
*:   argList ........... : List of substitutions.
*:                           argList["player"] - Players name
*:                           argList["guild"] - Guild name
*:***************************************************************
--]]
function AutoDecline_DoAction( actionList, argList )
  if ADdebugMode then
    AutoDecline_Debug("actionList: " .. table.concat(actionList,"::") or "(nil)")
  end

  argList = (argList or {})

  if actionList then
    for actionIndex,eachAction in pairs(actionList) do

-- This substitutes all occurances of $player and $guild with the names of the player
-- and guild respectively.
-- Ex: AutoDecline_DoAction( AutoDeclineActions["CHARTER"], {player=argArray[2],guild=argArray[3]} )
      eachAction = string.gsub(eachAction, "%$(%w+)", function (actionType)
                                                        return argList[actionType]
                                                      end)
      AutoDecline_Debug( "Performing action " .. eachAction )
      chatFrame = DEFAULT_CHAT_FRAME
      chatFrame.editBox:SetText( eachAction )
  		ChatEdit_SendText(chatFrame.editBox)
	  	ChatEdit_OnEscapePressed(chatFrame.editBox)
    end
  end
end

-- *:***************************************************************
-- *: Adds an action to the list of actions for the specified
-- *: decline type (duel/party/guild/charter/arenateam/arenacharter).
-- *:***************************************************************
function AutoDecline_AddAction(declineType, actionText)
  local removedAction = nil

  if actionText then
    actionText = PDTrimSpace(actionText)
    subAction, actionValue = PDGetCommand(string.lower(actionText))

    if string.sub(actionText,1,1) == "/" then
      if type(AutoDeclineActions[declineType]) == "table" then
        table.insert( AutoDeclineActions[declineType], actionText )
      else
        AutoDeclineActions[declineType] = { actionText }
      end
      AutoDecline_Display(format(AD_ADDACTION_ADD, declineType))
      AutoDecline_Display("  " .. actionText)

    elseif subAction == _PDLIB_CMD_CLEAR then
      AutoDecline_Display(format(AD_ADDACTION_CLEAR, declineType))
      AutoDeclineActions[declineType] = nil

    elseif subAction == _PDLIB_CMD_LIST then
      AutoDecline_DisplayActions(declineType)

    elseif subAction == _PDLIB_CMD_REMOVE then
      if AutoDeclineActions[declineType] then
        actionValue = tonumber(actionValue)
        if actionValue and actionValue <= table.getn(AutoDeclineActions[declineType]) then
          AutoDecline_Display(format(AD_ADDACTION_REMOVE, declineType))
          AutoDecline_Display("  " .. AutoDeclineActions[declineType][actionValue])
          table.remove(AutoDeclineActions[declineType], actionValue)
        end
      end

    else
--      if actionText == "" then
--        actionText = AD_NONE_SPECIFIED
--      end
      AutoDecline_Display(format(AD_ADDACTION_ERROR, actionText))

    end
  end
end

-- *:***************************************************************
function AutoDecline_Debug(displayText)
  if ADdebugMode then
     PDDebug(displayText, AD_DEBUG_TAG)
  end
end

-- *:***************************************************************
-- *: Adds an item to an array
-- *:***************************************************************
function AutoDecline_AddList( listArray, argArray, messageText )
  for argIndex,argValue in pairs(argArray) do
    if (type(argValue) == "string") and (string.len(argValue) > 0) then
      listArray[realmID][string.lower(argValue)] = true
      AutoDecline_Display(format(messageText, argValue))
    end
  end
end


-- *:***************************************************************
function AutoDecline_ShowWho( player )
  if adShowWho then
     AutoDecline_Display( "The following player has sent you an invite:" )

     eachAction = "/who " .. player

     chatFrame = DEFAULT_CHAT_FRAME
     chatFrame.editBox:SetText( eachAction )
     ChatEdit_SendText(chatFrame.editBox)
	   ChatEdit_OnEscapePressed(chatFrame.editBox)

  end
end

-- *:***************************************************************
function AutoDecline_GuildRosterLoaded()
  if not(guildRosterLoaded) and IsInGuild() then
    guildRosterLoaded = (GetNumGuildMembers() > 0)
    if guildRosterLoaded then
       AutoDecline_Debug( "Guild information loaded." )
    end
  end
end

-- *:***************************************************************
function AutoDecline_GetGuildRoster()
  if not(guildRosterLoaded) and IsInGuild() then
     GuildRoster()
     SetGuildRosterSelection(0);
	   local CURRENT_GUILD_MOTD = GetGuildRosterMOTD();
     local guildName, title, rank = GetGuildInfo("player");

     AutoDecline_Debug("Calling GuildRoster() to load guild information.")
     AutoDecline_Debug("IsInGuild() = " .. PDFormatOutput(IsInGuild()))
     AutoDecline_Debug("MOTD = " .. CURRENT_GUILD_MOTD)
  end
end