-- localization.lua
-- localization file for AutoDecline

AD_TAG = "AutoDecline:"
AD_DEBUG_TAG = "AD:DEBUG:"

-- AD_SYNTAX = "Syntax: /ad [guild {on|off}|party {on|off}|duel {on|off}|charter {on|off}|alert {on|off}|partyplayer {add||remove} {name}|partyplayer list|partyguild {on|off}|partyfriends {on|off}|partywhisper {on|off}|{partyaction|guildaction|duelaction|charteraction} {action||remove action#|list}|addlastinvite|options|status|about]"

AD_SYNTAX = { 
   "AutoDecline Syntax:",
   "/autod {guild||party||duel||charter||alert} {on||off}",   
   "/autod partyplayer {{add||remove} {name}}||list}",
   "/autod {partyguild||partyfriends||partywhisper} {on||off}",
   "/autod {partyaction||guildaction||duelaction||charteraction} {action||remove action#||list}",
   "/autod {addlastinvite||options||status||about}"
}

AD_HELP = "/ad, /autod, or /autodecline to bring up options window"
AD_PARTY_INVITE = "Party invite from %s was declined."
AD_GUILD_INVITE = "Guild invite from %s to guild %s was declined."
AD_DUEL_REQUEST = "Duel challenge from %s was declined."
AD_PETITION_REQUEST = "Charter request from %s for %s was denied."
AD_ARENATEAM_REQUEST = "Arena Team Invite from %s was declined."
AD_ARENACHARTER_REQUEST = "Arena Team Charter from %s for team %s was declined."

-- This is no longer used
-- AD_STATUS = "Status - Party: %s, Guild: %s, Duel: %s, Charter: %s, Party Friends: %s, Alert: %s"

AD_ALERT_ON = "Alerts are being displayed"
AD_ALERT_OFF = "Alerts are not being displayed"
AD_DUEL_OFF = "Accepting duel challenges"
AD_DUEL_ON = "Declining duel challenges"
AD_PARTY_OFF = "Accepting party invites"
AD_PARTY_ON = "Declining party invites"
AD_GUILD_OFF = "Accepting guild invites"
AD_GUILD_ON = "Declining guild invites"
AD_CHARTER_OFF = "Accepting guild charters"
AD_CHARTER_ON = "Declining guild charters"

AD_ARENATEAM_ON = "Declining arena team invites"
AD_ARENATEAM_OFF = "Allowing arena team invites"

AD_ARENACHARTER_ON = "Declining arena team charters"
AD_ARENACHARTER_OFF = "Allowing arena team charters"

AD_PARTYFRIENDS_ON = "Allowing party invites from friends"
AD_PARTYFRIENDS_OFF = "Not allowing party invites from friends"
AD_DUELFRIENDS_ON = "Allowing duel challenges from friends"
AD_DUELFRIENDS_OFF = "Not allowing duel challenges from friends"

AD_PARTYWHISPER_ON = "Allowing party invites from last player to whisper"
AD_PARTYWHISPER_OFF = "Not allowing party invites from last player to whisper"

AD_PARTYWHISPERTO_ON = "Allowing party invites from last player whispered to"
AD_PARTYWHISPERTO_OFF = "Not allowing party invites from last player whispered to"

AD_ALLCHARS_OFF = "Using the current settings for all characters"
AD_ALLCHARS_ON = "No longer using the current settings for all characters"

AD_NAME_NOT_FOUND = "ERROR: Your player name was not found, AutoDecline not loading"

AD_PARTYPLAYER_ADD = "Always allowing party invites from player '%s'."
AD_PARTYPLAYER_REMOVE = "No longer always allowing party invites from player '%s'."
AD_PARTYPLAYER_LIST = "Party invites are allowed from the following people:"
AD_PARTYPLAYER_CLEAR = "The list of players to allow party invites from has been cleared."

AD_DUELPLAYER_ADD = "Always allowing duel challenges from player '%s'."
AD_DUELPLAYER_REMOVE = "No longer always allowing duel challenges from player '%s'."
AD_DUELPLAYER_LIST = "Duel challenges are allowed from the following people:"
AD_DUELPLAYER_CLEAR = "The list of players to allow duel challenges from has been cleared."

-- *: Currently not used as the intended functionality is not possible
-- AD_PARTYGUILD_ADD = "Always allowing party invites from guild '%s'."
-- AD_PARTYGUILD_REMOVE = "No longer always allowing party invites from guild '%s'."
-- AD_PARTYGUILD_LIST = "Invites are allowed from the following guilds:"
-- AD_PARTYGUILD_CLEAR = "The list of guilds to allow party invites from has been cleared."

AD_CHECK_GUILD = "Autodecline Guild Invites"
AD_CHECK_PARTY = "Autodecline Party Invites"
AD_CHECK_DUEL = "Autodecline Duel Challenges"
AD_CHECK_CHARTER = "Autodecline Guild Charter Requests"
AD_CHECK_DECLINEARENATEAM = "Autodecline Arena Team Invites"
AD_CHECK_DECLINEARENACHARTER = "Autodecline Arena Team Charters"

AD_TIP_CHARTER = "Check to automatically close all guild charters"
AD_TIP_GUILD = "Check to automatically decline all guild invites"
AD_TIP_PARTY = "Check to automatically decline all party invites"
AD_TIP_DUEL = "Check to automatically decline all duel challenges"
AD_TIP_DECLINEARENATEAM = "Check to automatically decline requests to join arena teams"
AD_TIP_DECLINEARENACHARTER = "Check to automatically decline all arena team charters"

-- Changed to shorten
AD_CHECK_ALLOWPARTYFRIEND = "Party Invites From Friends"
AD_CHECK_ALLOWPARTYWHISPER = "Party Invites From Last Whisperer"
AD_CHECK_ALLOWPARTYWHISPERTO = "Party Invites From Last Whisper To"

AD_TIP_ALLOWPARTYFRIEND = "Check to always allow party invites from friends on the friends list."
AD_TIP_ALLOWPARTYWHISPER = "Check to always allow party invites from the last 5 people to whisper you."
AD_TIP_ALLOWPARTYWHISPERTO = "Check to always allow party invites from the last 5 people you sent a whisper to."

AD_CHECK_ALLOWDUELFRIEND = "Duel Challenges From Friends"
AD_CHECK_ALLOWDUELGUILD = "Duel Challenges From Guild Members"
AD_CHECK_ALLOWDUELWHISPER = "Duel Challenges From Last Whisperer"
AD_CHECK_ALLOWDUELWHISPERTO = "Duel Challenges From Last Whisper To"

AD_TIP_ALLOWDUELFRIEND = "Check to always allow duel challenges from friends on the friends list."
AD_TIP_ALLOWDUELGUILD = "Check to always allow duel challenges from Guild members."
AD_TIP_ALLOWDUELWHISPER = "Check to always allow duel challenges from the last 5 people to whisper you."
AD_TIP_ALLOWDUELWHISPERTO = "Check to always allow duel challenges from the last 5 people you sent a whisper to."

AD_CHECK_SHOWALERTS = "Show Alerts"
AD_TIP_SHOWALERT = "Check to show an alert when something is automatically declined"

AD_DIALOG_HEADER = "AutoDecline Options"
AD_DIALOG_CHECKHEADER = "AutoDecline the following"

AD_BUTTON_CANCEL = "Cancel"
AD_BUTTON_OKAY = "Save"

AD_CHECK_ALLCHARS = "Use these settings for all characters"
AD_TIP_ALLCHARS = "Check to use the current toggle settings for all characters on this account."

AD_DISPLAYACTION_NONE = "No actions defined for decline type %s."
AD_DISPLAYACTION_HEADER = "Current actions for decline type %s:"

AD_ADDACTION = " actions for decline type %s:"
AD_ADDACTION_REMOVE = "Removing" .. AD_ADDACTION
AD_ADDACTION_ADD = "Adding" .. AD_ADDACTION
AD_ADDACTION_CLEAR = "Clearing all" .. AD_ADDACTION

AD_ADDACTION_ERROR = "Unknown action command: %s"

AD_LASTINVITE_ADD = "Now allowing party invites from %s."
AD_LASTINVITE_NONE = "You have received no party invites this session."

AD_LASTDUEL_ADD = "Now allowing duel challenges from %s."
AD_LASTDUEL_NONE = "You have received no duel challenges this session."

AD_PARTYGUILD_ON = "Allowing party invites from guild members"
AD_PARTYGUILD_OFF = "Not allowing party invites from guild members"

AD_CHECK_ALLOWPARTYGUILD = "Party Invites From Guild Members"
AD_TIP_ALLOWPARTYGUILD = "Check to always allow party invites from guild members."

AD_DUELGUILD_ON = "Allowing duel challenges from guild members"
AD_DUELGUILD_OFF = "Not allowing duel challenges from guild members"

AD_PARTYBATTLEFIELD_ON = "Allowing party invites on battlefields"
AD_PARTYBATTLEFIELD_OFF = "Not allowing party invites on battlefields"

AD_CHECK_ALLOWPARTYBATTLEFIELD = "All party invites on battlefields."
AD_TIP_ALLOWPARTYBATTLEFIELD = "Check to always allow party invites when on a battlefield."

AD_NONE_SPECIFIED = "(none specified)"

AD_MSG_CLEARWHISPER = "Whisper from names have been cleared."
AD_MSG_CLEARWHISPERTO = "Whisper to names have been cleared."

-- Commands
AD_CMD_OPTIONS = "options"
AD_CMD_STATUS = "status"
AD_CMD_ALERT = "alert"
AD_CMD_GUILD = "guild"
AD_CMD_PARTY = "party"
AD_CMD_DUEL = "duel"
AD_CMD_CHARTER = "charter"
AD_CMD_ARENA_TEAM = "arenat"
AD_CMD_ARENA_CHART = "arenac"

AD_CMD_PARTYWHISPER = "partywhisper"
AD_CMD_PARTYWHISPERTO = "partywhisperto"
AD_CMD_PARTYFRIENDS = "partyfriends"
AD_CMD_DUELFRIENDS = "duelfriends"
AD_CMD_ADDLASTPARTY = "addlastparty"
AD_CMD_ADDLASTDUEL = "addlastduel"
AD_CMD_PARTYPLAYER = "partyplayer"
AD_CMD_DUELPLAYER = "duelplayer"
AD_CMD_PARTYGUILD = "partyguild"
AD_CMD_DUELGUILD = "duelguild"
AD_CMD_PARTYBATTLEFIELD = "partybattlefield"

AD_CMD_PARTYACTION = "partyaction"
AD_CMD_DUELACTION = "duelaction"
AD_CMD_GUILDACTION = "guildaction"
AD_CMD_CHARTERACTION = "charteraction"
AD_CMD_ARENATEAMACTION = "areanteamaction"
AD_CMD_AREANCHARTERACTION = "arenacharteraction"

AD_CMD_CLEARWHISPER = "clearwhisper"
AD_CMD_CLEARWHISPERTO = "clearwhisperto"


