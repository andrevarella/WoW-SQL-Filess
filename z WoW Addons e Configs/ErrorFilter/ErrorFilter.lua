--------------------------------------------------------------------------------------------------------
--                                        ErrorFilter variables                                       --
--------------------------------------------------------------------------------------------------------
local ErrorFilter_Options = 
{
	isEnabled = true,
	isShown = true,
}

local ErrorFilter_Filters = 
{
	"your target is dead",
	"there is nothing to attack",
	"not enough rage",
	"not enough energy",
	"that ability requires combo points",
	"not enough runic power",
	"not enough runes",
	"you have no target",
	"invalid target",
	"you cannot attack that target",
	"spell is not ready yet",
	"ability is not ready yet",
	"you can't do that yet",
	"you are too far away",
	"out of range",
	"another action is in progress",
	"not enough mana",
	"not enough focus",
}

--------------------------------------------------------------------------------------------------------
--                                          ErrorFilter Init                                          --
--------------------------------------------------------------------------------------------------------
-- Initializing
EFframe = CreateFrame("Frame", "EFframe")
EFframe:SetScript("OnEvent", function(self, event, ...)
	if self[event] then
		return self[event](self, event, ...)
	end
end)

-- Replace old error handler
local old = UIErrorsFrame:GetScript('OnEvent')
UIErrorsFrame:SetScript('OnEvent', function(self, event, ...)
	if self[event] then
		return self[event](self, event, ...)
	else
		return old(self, event, ...)
	end
end)

-- Register events
EFframe:RegisterEvent("ADDON_LOADED")
UIErrorsFrame:RegisterEvent("UI_ERROR_MESSAGE")


function EFframe:ADDON_LOADED(event, name)
	if (name ~= "ErrorFilter") then return end
	self:UnregisterEvent("ADDON_LOADED")
	
	-- Create slash commands
	SLASH_ErrorFilter1 = "/erf"
	SLASH_ErrorFilter2 = "/errorfilter"
	SlashCmdList[name] = EF_interact
	
	-- Load variables
	DB_Options = DB_Options or {}
	DB_Filters = DB_Filters or {}
	for k, v in pairs(ErrorFilter_Options) do
		if DB_Options[k] == nil then
			DB_Options[k] = v
		end
	end
	if (not DB_Filters[1]) then
		for k, v in pairs(ErrorFilter_Filters) do
			DB_Filters[k] = v
		end
	end
	
	-- Show / hide the errorframe
	if (DB_Options.isShown == true) then
		UIErrorsFrame:Show()
	else
		UIErrorsFrame:Hide()
	end

	--print(DB_Options.isEnabled,DB_Options.isShown)
end

--------------------------------------------------------------------------------------------------------
--                                        ErrorFilter functions                                       --
--------------------------------------------------------------------------------------------------------
-- Error handler
function UIErrorsFrame:UI_ERROR_MESSAGE(event, name, ...)
	if (DB_Options.isEnabled and DB_Options.isShown and DB_Filters[1]) then
		for k, v in next, DB_Filters do
			if( string.find( string.lower(name), v ) ) then
				--print("found: ", name)
				return
			end
		end
	end
	return old(self, event, name, ...)
end


-- Print help
function EF_PrintHelp()
	DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter commands:|r")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  show / hide|r: Used to enable or disable the blizzard UIErrorFrame.")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  enable / disable|r: Used to enable or disable message filtering by ErrorFilter.")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  reset|r: Resets to default.")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  clear|r: Clears all filters (note that if no filter is present when the game starts, the defaults will be used).")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  list|r: Shows a list of all the filters currently used.")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  add filter|r: Adds a new filter (ex: |cff00ff00 /erf add there is nothing to attack|r)")
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  del number|r: Removes a filter from the database. (do |cff00ff00 /erf list|r first and replace number with the index of the message you want to delete)")
end


-- Slash commands handler
function EF_interact(input)
	if (input) then
		input = string.lower(input)
		local a, b = string.find(input," ")
		if (input == "help") then
			EF_PrintHelp()
		elseif input  == "status" then
			print("Filter enabled:", DB_Options.isEnabled)
			print("Frame enabled:", DB_Options.isShown)
		elseif (input == "enable" or input == "disable") then
			if (DB_Options.isEnabled == false) then
				DB_Options.isEnabled = true
				DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00ErrorFilter enabled.|r")
			else
				DB_Options.isEnabled = false
				DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter disabled.|r")
			end
		elseif (input == "hide" or input == "show") then
			if (DB_Options.isShown == true) then
				DB_Options.isShown = false
				UIErrorsFrame:Hide()
				DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter hides error frame.|r")
			else
				DB_Options.isShown = true
				UIErrorsFrame:Show()
				DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00ErrorFilter shows error frame.|r")
			end
		elseif (input == "reset") then
			DB_Filters = {}
			for k, v in pairs(ErrorFilter_Filters) do
				DB_Filters[k] = v
			end
			for k, v in pairs(ErrorFilter_Options) do
				DB_Options[k] = v
			end
			DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter database resetted.|r")
		elseif (input == "clear") then
			DB_Filters = {}
			DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter database cleared.|r")
		elseif (input == "list") then
			if ( DB_Filters[1] ) then
				DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00ErrorFilter Database:|r")
				local i = 0;
				for k, v in pairs(DB_Filters) do
					i = i+1
					if i > 9 then
						DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00 "..i..". \"|r"..DB_Filters[k].."|cff00ff00\"|r")
					else
						DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00  "..i..". \"|r"..DB_Filters[k].."|cff00ff00\"|r")
					end
				end
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter database is empty.|r")
			end
		elseif a then
			first = string.sub(input,1,a-1)
			second = string.sub(input,a+1)
			if (first == "add") then
				tinsert(DB_Filters, second)
				DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00ErrorFilter added filter \"|r"..second.."|cff00ff00\"|r")
			elseif (first == "del") then
				local n = tonumber(second)
				if (n and 0<n and n<=#DB_Filters) then
					second = DB_Filters[n]
					tremove(DB_Filters, n)
					DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter removed filter \"|r"..second.."|cff00ff00\"|r")
				else
					DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter wrong filter number.|r")
				end
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter unknown command. Try|r |cff00ff00 /erf help|r")
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ErrorFilter unknown command. Try|r |cff00ff00 /erf help|r")
		end
	end
end
