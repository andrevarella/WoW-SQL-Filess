-- PDLibMain.lua
-- Library of common functions used by mods created by Pacer Dawn

local _APP_VERSION = "1.2"
local _APP_INTERFACE = "20100"
local _APP_BETA = ""
local _APP_KEY = "PDLIB"

local PDdebugOutputWindow = nil

-- *:***************************************************************
function PDLib_OnLoad()
  this:RegisterEvent("VARIABLES_LOADED")
end

-- *:***************************************************************
function PDLib_OnEvent(event)
   if (event == "VARIABLES_LOADED") then
      PDDisplay( format(_PDLIB_LOAD_MSG, _APP_VERSION, _APP_INTERFACE, _APP_BETA) , "PDLib" )
      PDdebugOutputWindow = DEFAULT_CHAT_FRAME
      PD_Persistent_Debug = (PD_Persistent_Debug or {})
   end
end

-- *:***************************************************************
-- *: Trims leading and trailing spaces from a string, and collapses
-- *: groups of spaces into a single space.
function PDTrimSpace(paramString)
   return string.gsub(string.gsub((paramString or ""), "^%s*(.-)%s*$", "%1"), "%s+"," ")
end

-- *:***************************************************************
-- *: Returns the action verb and arguments from a command line
-- *:
-- *: Parameters:
-- *: commandLine - the command line
-- *: argSeperator - seperator for each argument.  if nil, all arguments
-- *:    are passed back as a single string.  Also, if a seperator
-- *:    is declared, all arguments are lower cased.
-- *:
-- *: Returns:
-- *: actionVerb - The action verb
-- *: parmsResult - The parameters, as a string or array depending
-- *:    if sep was declared.
-- *:***************************************************************
function PDGetCommand(commandLine, argSeperator)
   actionVerb = nil
   parmsResult = nil
   argString = nil

   commandLine = PDTrimSpace(commandLine)
   regexString = "^%s*(%w+)%s*(.-)$"
   _, _, actionVerb, argString = string.find(commandLine, regexString)

   if argString and argSeperator then
      parmsResult = {}
      for eachArgument in string.gmatch(argString .. argSeperator,"(.-)" .. argSeperator) do
         eachArgument = PDTrimSpace(string.lower(eachArgument))
         if eachArgument == "" then
           eachArgument = nil
         end
         table.insert(parmsResult, eachArgument)
      end
   else
      parmsResult = argString
   end

   if actionVerb then
      actionVerb = string.lower(actionVerb)
   end
   return actionVerb, parmsResult, argString
end

-- *:***************************************************************
function PDiif( ifCondition, thenResult, elseResult )
   if ifCondition then
      return thenResult
   else
      return elseResult
   end
end

-- *:***************************************************************
-- *: If passed data is a table, this function will display the 
-- *: data in the table.  Otherwise, it will convert the input to
-- *: a string.
-- *:***************************************************************
function PDFormatOutput( outputToFormat )
  local returnResult = ""

  if type(outputToFormat) == "table" then
    returnResult = table.concat(outputToFormat, "::")
  else
    returnResult = tostring(outputToFormat)
  end

  return returnResult
end

-- *:***************************************************************
-- *: Set the default window for debug output
-- *:***************************************************************
function PDSetDebugWindow( debugWindow )
  if debugWindow ~= nil then
    PDdebugOutputWindow = debugWindow
  end
end

-- *:***************************************************************
-- *: Basic function for displaying debug text
-- *:***************************************************************
function PDDebug( displayText, displayTag )
   if PDdebugOutputWindow == nil then
      PDdebugOutputWindow = DEFAULT_CHAT_FRAME
   end
   PDDisplay( displayText, displayTag, PDdebugOutputWindow )
end

-- *:***************************************************************
-- *: Set debug mode
-- *: Setmode can be "on", "off", or true/false
-- *:***************************************************************
function PDSetDebug( setMode, displayFunction, persistentKey )
  local returnResult = nil
  
  if (setMode == nil) or (setMode == true) then
    setMode = "on"
  elseif setMode == false then
    setMode = "off"
  elseif type("setMode") == "string" then
    setMode = string.lower(setMode)
  end
  displayFunction = (displayFunction or PDDisplay)
  persistentKey = (persistentKey or _PDLIB_KEY)
   
  if (setMode == "on") or (setMode == true) then
    displayFunction( "Debug mode ON" )
    returnResult = true
  elseif (setMode == "persistent") then
    PDDisplay( "persistentKey = " .. PDFormatOutput(persistentKey) )
    PD_Persistent_Debug[persistentKey] = (not PD_Persistent_Debug[persistentKey])
    if PD_Persistent_Debug[persistentKey] then
      displayFunction( "Persistent debug mode ON" )
    else
      displayFunction( "Persistent debug mode OFF" )
    end
    returnResult = PD_Persistent_Debug[persistentKey]
  else
    displayFunction( "Debug mode OFF" )
    returnResult = false
  end

  return returnResult
end

-- *:***************************************************************
-- *: Get persistent debug mode
-- *:***************************************************************
function PDGetDebug( persistentKey )
  PD_Persistent_Debug = (PD_Persistent_Debug or {})
  persistentKey = (persistentKey or _PDLIB_KEY)

  return (PD_Persistent_Debug[persistentKey] or false)
end

-- *:***************************************************************
-- *: Searches a table/list for a value and returns the index, or 
-- *: nil if not found.
-- *:***************************************************************
function PDInList( searchList, searchItem )
  return table.foreach(searchList, function (index,value)
                                     if (actionVerb == value) then return index end
                                   end)
end

-- *:***************************************************************
-- *: Set a value to true or false, or toggle it based on input
-- *: of on/off or null
-- *:***************************************************************
function PDSetOption(setOption, origValue)
   local returnResult = nil
   setOption = string.lower(setOption)

   if setOption == _PDLIB_ON then
      returnResult = true
   elseif setOption == _PDLIB_OFF then
      returnResult = false
   elseif setOption == "" then
      returnResult = not origValue
   end
   return returnResult
end

-- *:***************************************************************
function PDShowToggle(toggleValue)
   local toggleResult
   if toggleValue then
     toggleResult = _PDLIB_ON
   else
     toggleResult = _PDLIB_OFF
   end
   return toggleResult
end

-- *:***************************************************************
function PDCheckVersion( appDependency, appDisplay )
  appDisplay = (appDisplay or PDDisplay)
  local returnResult = (_APP_VERSION == appDependency)
  
  if not returnResult then
    appDisplay( format(_PDLIB_INVALID, _APP_VERSION, appDependency) )
    appDisplay( _PDLIB_UPDATE_MESSAGE )
  end

  return returnResult
end

-- *:***************************************************************
-- *: Basic function for displaying text
-- *:***************************************************************
function PDDisplay( displayText, displayTag, chatFrame )
  if chatFrame == nil then
     chatFrame = DEFAULT_CHAT_FRAME
  end
  if displayTag == nil then
     displayTag = ""
  else
     displayTag = displayTag .. " "
  end
  if chatFrame and displayText then
     if type(displayText) ~= "table" then
        displayText = {displayText}
     end
     for eachIndex, eachValue in pairs(displayText) do
        chatFrame:AddMessage(displayTag .. eachValue)
     end
  end
end

