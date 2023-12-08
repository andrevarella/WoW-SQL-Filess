--[[ 

	 Poisoner
	¯¯¯¯¯¯¯¯¯¯
	> Options

]]


PoisonerOptions = {};
PoisonerOptions.needUpdate = false;

-- UI labels
PoisonerOptions_SETTINGS = "Settings";
PoisonerOptions_SETTINGS1 = "Options";
PoisonerOptions_SETTINGS2 = "A/C/M-P";
PoisonerOptions_SETTINGS3 = "D-P";
PoisonerOptions_SETTINGS4 = "I-P";
PoisonerOptions_SETTINGS5 = "W-P";
PoisonerOptions_SETTINGS_CLOSE = "Close";

PoisonerOptions_SETTINGS_APtitle = GetItemInfo(21835);
PoisonerOptions_SETTINGS_CPtitle = GetItemInfo(3775);
PoisonerOptions_SETTINGS_MPtitle = GetItemInfo(5237);
PoisonerOptions_SETTINGS_DPtitle = GetItemInfo(2892);
PoisonerOptions_SETTINGS_IPtitle = GetItemInfo(6947);
PoisonerOptions_SETTINGS_WPtitle = GetItemInfo(10918);


-- load current profile onto settings
function PoisonerOptions_LoadSettings()
	-- none, settings loaded via PoisonerOptionsTab_OnClick(index)
end

-- save current profile settings
function PoisonerOptions_SaveSettings()
	-- none so far
end

function PoisonerOptions_ToggleSettings()
  if not InCombatLockdown() then -- not in combat
  	if ( PoisonerOptions_SettingsFrame:IsVisible() ) then
  		PoisonerOptions_SaveSettings();
  		PoisonerOptions_SettingsFrame:Hide();
  	else
  		PoisonerOptionsTab_OnClick(1);
  		PoisonerOptions_LoadSettings();
  		PoisonerOptions_SettingsFrame:Show();
  	end
  end
end

function PoisonerOptions_CallUpdate()
	PoisonerOptions.needUpdate = true;
end

function PoisonerOptionsScaleSlider_OnValueChanged(value)
	PoisonerOptions_CONFIG.Scale = value;
	PoisonerOptions_MainFrame:SetScale(PoisonerOptions_CONFIGScale);
end

function PoisonerOptionsAlphaSlider_OnValueChanged(value)
	PoisonerOptions_CONFIG.Alpha = value;
	PoisonerOptions_MainFrame:SetAlpha(PoisonerOptions_CONFIGAlpha);
end

function PoisonerOptionsTab_OnClick(index)
	if ( not index ) then
		index = this:GetID();
	end

	if ( PoisonerOptions_SettingsFrame.numTabs == nil) then
		PanelTemplates_SetNumTabs(PoisonerOptions_SettingsFrame, 5);
	end

	PanelTemplates_SetTab(PoisonerOptions_SettingsFrame, index);
	PoisonerOptions_HideAllSettingFrames();
	if ( index == 1 ) then
		PoisonerOptions_SettingsFrame1:Show();
	elseif ( index == 2 ) then
		PoisonerOptions_SettingsFrame2:Show();
	elseif ( index == 3 ) then
		PoisonerOptions_SettingsFrame3:Show();
	elseif ( index == 4 ) then
		PoisonerOptions_SettingsFrame4:Show();
	elseif ( index == 5 ) then
		PoisonerOptions_SettingsFrame5:Show();
	end
end

function PoisonerOptions_HideAllSettingFrames()
		PoisonerOptions_SettingsFrame1:Hide();
		PoisonerOptions_SettingsFrame2:Hide();
		PoisonerOptions_SettingsFrame3:Hide();
		PoisonerOptions_SettingsFrame4:Hide();
		PoisonerOptions_SettingsFrame5:Hide();
end

-- Move Handler

function PoisonerOptions_MoveSettingsHandler_OnMouseDown(arg1)
	if (arg1 == "LeftButton") then
		PoisonerOptions_SettingsFrame:StartMoving();
	end
end

function PoisonerOptions_MoveSettingsHandler_OnMouseUp(arg1)
	if (arg1 == "LeftButton") then
		PoisonerOptions_SettingsFrame:StopMovingOrSizing();
	end
end
