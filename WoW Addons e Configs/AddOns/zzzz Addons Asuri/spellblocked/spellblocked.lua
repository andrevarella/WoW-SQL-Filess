local format = string.format
local CombatLog_Object_IsA = CombatLog_Object_IsA

local REFLECT = REFLECT
local COMBATLOG_FILTER_ME = COMBATLOG_FILTER_ME


local combatText_AddMessage = CombatText_AddMessage

-- prevent standard reflect combat message showing
function CombatText_AddMessage(message, ...)
	if message ~= REFLECT then
		combatText_AddMessage(message, ...)
	end
end

local addon = CreateFrame("Frame")
addon:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
addon:SetScript("OnEvent", function(self, event, timestamp, combatEvent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool, missType)
	if CombatLog_Object_IsA(destFlags, COMBATLOG_FILTER_ME) and combatEvent == "SPELL_MISSED" and missType == "REFLECT" and SHOW_COMBAT_TEXT == "1" then
		-- print our own combat message with the spell name included
		CombatText_AddMessage(format("%s (%s)", REFLECT, spellName), COMBAT_TEXT_SCROLL_FUNCTION, 1, 1, 1)
	end
end)