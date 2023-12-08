local ADOptionsFrameCheckButtons = {}
local allChars = nil

ADOptionsFrameCheckButtons[AD_CHECK_PARTY]   = { index = 1, tooltipText = AD_TIP_PARTY,   ADVar = "partyToggle" }
ADOptionsFrameCheckButtons[AD_CHECK_GUILD]   = { index = 2, tooltipText = AD_TIP_GUILD,   ADVar = "guildToggle" }
ADOptionsFrameCheckButtons[AD_CHECK_DUEL]    = { index = 3, tooltipText = AD_TIP_DUEL,    ADVar = "duelToggle" }
ADOptionsFrameCheckButtons[AD_CHECK_CHARTER] = { index = 4, tooltipText = AD_TIP_CHARTER, ADVar = "charterToggle" }

-- Forthcoming
--ADOptionsFrameCheckButtons[AD_CHECK_DECLINEARENATEAM] = { index = 5, tooltipText = AD_TIP_DECLINEARENATEAM, ADVar = "arenaTeamToggle" }
--ADOptionsFrameCheckButtons[AD_CHECK_DECLINEARENACHARTER] = { index = 6, tooltipText = AD_TIP_DECLINEARENACHARTER, ADVar = "arenaCharterToggle" }

ADOptionsFrameCheckButtons[AD_CHECK_ALLOWPARTYFRIEND]    = { index = 7, tooltipText = AD_TIP_ALLOWPARTYFRIEND,  ADVar = "partyFriends" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWPARTYGUILD]     = { index = 8, tooltipText = AD_TIP_ALLOWPARTYGUILD,   ADVar = "partyGuild" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWPARTYWHISPER]   = { index = 9, tooltipText = AD_TIP_ALLOWPARTYWHISPER, ADVar = "partyWhisper" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWPARTYWHISPERTO] = { index = 10, tooltipText = AD_TIP_ALLOWPARTYWHISPER, ADVar = "partyWhisperTo" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWPARTYBATTLEFIELD] = { index = 11, tooltipText = AD_TIP_ALLOWPARTYBATTLEFIELD,  ADVar = "partyBattlefield" }

ADOptionsFrameCheckButtons[AD_CHECK_ALLOWDUELFRIEND]    = { index = 12, tooltipText = AD_TIP_ALLOWDUELFRIEND,  ADVar = "duelFriends" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWDUELGUILD]     = { index = 13, tooltipText = AD_TIP_ALLOWDUELGUILD,   ADVar = "duelGuild" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWDUELWHISPER]   = { index = 14, tooltipText = AD_TIP_ALLOWDUELWHISPER, ADVar = "duelWhisper" }
ADOptionsFrameCheckButtons[AD_CHECK_ALLOWDUELWHISPERTO] = { index = 15, tooltipText = AD_TIP_ALLOWDUELWHISPER, ADVar = "duelWhisperTo" }

ADOptionsFrameCheckButtons[AD_CHECK_ALLCHARS]   = { index = 16,  tooltipText = AD_TIP_ALLCHARS,  ADVar = "allChars" }
ADOptionsFrameCheckButtons[AD_CHECK_SHOWALERTS] = { index = 17, tooltipText = AD_TIP_SHOWALERT, ADVar = "showAlert" }


-- *:***************************************************************
function ADOptionsFrame_OnLoad()
-- nut 'n honey
end

-- *:***************************************************************
function ADOptionsFrame_OnShow()
	local button, string, checked;

	for key, value in pairs(ADOptionsFrameCheckButtons) do
		button = getglobal("ADOptionsFrame_CheckButton"..value.index);
		string = getglobal("ADOptionsFrame_CheckButton"..value.index.."Text");
		checked = nil;
		button.disabled = nil;

  	if ( AutoDecline_GetValue(value.ADVar) ) then
				checked = 1;
			else
				checked = nil;
		end

-- Blizzard change the naming conventions on me.
--		OptionsFrame_EnableCheckBox(button);
		BlizzardOptionsPanel_CheckButton_Enable(button);
		
		button:SetChecked(checked);
		string:SetText(key);
		button.tooltipText = value.tooltipText;
	end
end

-- *:***************************************************************
function ADOptionsFrame_SaveOptions()
	local button,frame,text
	local allChars = nil

	for key, value in pairs(ADOptionsFrameCheckButtons) do
		button = getglobal("ADOptionsFrame_CheckButton"..value.index)
		if value.ADVar == "allChars" then
		  allChars = button:GetChecked()
		else
		  if ( button:GetChecked() ) then
  			AutoDecline_SetValue(value.ADVar,true)
		  else
  			AutoDecline_SetValue(value.ADVar,false)
		  end
		end
	end

  if allChars then
     AutoDecline_SetAllChars()
  else
     AutoDecline_SetLocalChars()
  end
end

-- *:***************************************************************
function ADOptionsFrame_OnClick()
-- Future Code here if necessary
end

-- *:***************************************************************
function ADOptionsFrame_GetDefaults()
	local button, string, checked;
	for key, value in pairs(ADOptionsFrameCheckButtons) do
		button = getglobal("ADOptionsFrame_CheckButton"..value.index);
		string = getglobal("ADOptionsFrame_CheckButton"..value.index.."Text");
		checked = nil;
		button.disabled = nil;
		if value.ADVar then
			if value.ADVar == "guildToggle" then
				checked = 1
			elseif value.ADVar == "partyToggle" then
				checked = nil
			elseif value.ADVar == "duelToggle" then
				checked = 1
			elseif value.ADVar == "charterToggle" then
				checked = 1
			elseif value.ADVar == "showAlert" then
				checked = 1
			elseif value.ADVar == "partyFriends" then
				checked = 1
			elseif value.ADVar == "partyGuild" then
				checked = 1
			elseif value.ADVar == "partyWhisper" then
				checked = nil
			elseif value.ADVar == "partyWhisperTo" then
				checked = nil
			elseif value.ADVar == "partyBattlefield" then
			  checked = 1

--			elseif value.ADVar == "arenaTeamToggle" then
--				checked = 1
--			elseif value.ADVar == "arenaCharterToggle" then
--				checked = 1

			else
				checked = nil
			end
			button:SetChecked(checked);
		end
	end
end

-- *:***************************************************************
function AD_Display(msg)
  if DEFAULT_CHAT_FRAME then
    DEFAULT_CHAT_FRAME:AddMessage("ADOptions: " ..  msg)
  end
end
