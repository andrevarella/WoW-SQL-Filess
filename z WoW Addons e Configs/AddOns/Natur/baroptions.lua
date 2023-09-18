

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


NATUR_PROCESS_SLIDERS = false;

Natur_GroupDescriptions = {
	"Primary Group",
	"Hostile Casts",
	"Target Buffs",
	"Target Debuffs",
	"Cooldowns",
	"Friendly Casts",
	"Crowd Controls (Not Implimented Yet)",
	"Diminish Returns",
	"Player Buffs",
	"Player Debuffs"
};

local Natur_BarSettingSelected = 1;
local Natur_TestBarsStatus = 0;

--
--	Close Options
--
function BarSettingsFinishedButton_OnClick()
	-- clear test bars (if any)
	Natur_TestBarsStatus = 0;
	NaturTargetBuffsGroup:UnregisterAllBars();
	NaturHostileCastGroup:UnregisterAllBars();
	NaturFriendlyCastGroup:UnregisterAllBars();
	NaturMyCooldownsGroup:UnregisterAllBars();
	NaturTargetDebuffsGroup:UnregisterAllBars();
	NaturDiminishGroup:UnregisterAllBars();
	NaturPrimaryGroup:UnregisterAllBars();
	-- close the settings screen.
	BarSettingsFrame:Hide();
	MainOptionsFrame:Show();
end

--
--	Process Settings Selection
--
--	Responsible for setting the initial values when user changes
--	which groups to alter.
--
function Natur_ProcessBarSettings()
	-- set text
	BarGroupsTitle:SetText(Natur_BarSettingSelected..":   "..Natur_GroupDescriptions[Natur_BarSettingSelected]);
	if(Natur_BarSettingSelected == 1) then				-- Primary Group
		HeightSlider:SetValue(Natur_AccountOptions[6]);
		HeightText:SetText(Natur_AccountOptions[6]);
		WidthSlider:SetValue(Natur_AccountOptions[7]);
		WidthText:SetText(Natur_AccountOptions[7]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[9]);
		MaxBarText:SetText(Natur_AccountOptions[9]);
		FontSizeSlider:SetValue(Natur_AccountOptions[11]);
		FontSizeText:SetText(Natur_AccountOptions[11]);
		TextureSlider:SetValue(Natur_AccountOptions[8]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[8]]);
		if(Natur_AccountOptions[5] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
		HeightSlider:SetValue(Natur_AccountOptions[16]);
		HeightText:SetText(Natur_AccountOptions[16]);
		WidthSlider:SetValue(Natur_AccountOptions[17]);
		WidthText:SetText(Natur_AccountOptions[17]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[19]);
		MaxBarText:SetText(Natur_AccountOptions[19]);
		FontSizeSlider:SetValue(Natur_AccountOptions[21]);
		FontSizeText:SetText(Natur_AccountOptions[21]);
		TextureSlider:SetValue(Natur_AccountOptions[18]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[18]]);
		if(Natur_AccountOptions[15] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
		HeightSlider:SetValue(Natur_AccountOptions[26]);
		HeightText:SetText(Natur_AccountOptions[26]);
		WidthSlider:SetValue(Natur_AccountOptions[27]);
		WidthText:SetText(Natur_AccountOptions[27]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[29]);
		MaxBarText:SetText(Natur_AccountOptions[29]);
		FontSizeSlider:SetValue(Natur_AccountOptions[31]);
		FontSizeText:SetText(Natur_AccountOptions[31]);
		TextureSlider:SetValue(Natur_AccountOptions[28]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[28]]);
		if(Natur_AccountOptions[25] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
		HeightSlider:SetValue(Natur_AccountOptions[36]);
		HeightText:SetText(Natur_AccountOptions[36]);
		WidthSlider:SetValue(Natur_AccountOptions[37]);
		WidthText:SetText(Natur_AccountOptions[37]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[39]);
		MaxBarText:SetText(Natur_AccountOptions[39]);
		FontSizeSlider:SetValue(Natur_AccountOptions[41]);
		FontSizeText:SetText(Natur_AccountOptions[41]);
		TextureSlider:SetValue(Natur_AccountOptions[38]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[38]]);
		if(Natur_AccountOptions[35] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
		HeightSlider:SetValue(Natur_AccountOptions[66]);
		HeightText:SetText(Natur_AccountOptions[66]);
		WidthSlider:SetValue(Natur_AccountOptions[67]);
		WidthText:SetText(Natur_AccountOptions[67]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[69]);
		MaxBarText:SetText(Natur_AccountOptions[69]);
		FontSizeSlider:SetValue(Natur_AccountOptions[71]);
		FontSizeText:SetText(Natur_AccountOptions[71]);
		TextureSlider:SetValue(Natur_AccountOptions[68]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[68]]);
		if(Natur_AccountOptions[65] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
		HeightSlider:SetValue(Natur_AccountOptions[56]);
		HeightText:SetText(Natur_AccountOptions[56]);
		WidthSlider:SetValue(Natur_AccountOptions[57]);
		WidthText:SetText(Natur_AccountOptions[57]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[59]);
		MaxBarText:SetText(Natur_AccountOptions[59]);
		FontSizeSlider:SetValue(Natur_AccountOptions[61]);
		FontSizeText:SetText(Natur_AccountOptions[61]);
		TextureSlider:SetValue(Natur_AccountOptions[58]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[58]]);
		if(Natur_AccountOptions[55] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
		HeightSlider:SetValue(Natur_AccountOptions[76]);
		HeightText:SetText(Natur_AccountOptions[76]);
		WidthSlider:SetValue(Natur_AccountOptions[77]);
		WidthText:SetText(Natur_AccountOptions[77]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[79]);
		MaxBarText:SetText(Natur_AccountOptions[79]);
		FontSizeSlider:SetValue(Natur_AccountOptions[81]);
		FontSizeText:SetText(Natur_AccountOptions[81]);
		TextureSlider:SetValue(Natur_AccountOptions[78]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[78]]);
		if(Natur_AccountOptions[75] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
		HeightSlider:SetValue(Natur_AccountOptions[86]);
		HeightText:SetText(Natur_AccountOptions[86]);
		WidthSlider:SetValue(Natur_AccountOptions[87]);
		WidthText:SetText(Natur_AccountOptions[87]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[89]);
		MaxBarText:SetText(Natur_AccountOptions[89]);
		FontSizeSlider:SetValue(Natur_AccountOptions[91]);
		FontSizeText:SetText(Natur_AccountOptions[91]);
		TextureSlider:SetValue(Natur_AccountOptions[88]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[88]]);
		if(Natur_AccountOptions[85] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;		
	elseif(Natur_BarSettingSelected == 9) then			-- Player Gains
		HeightSlider:SetValue(Natur_AccountOptions[96]);
		HeightText:SetText(Natur_AccountOptions[96]);
		WidthSlider:SetValue(Natur_AccountOptions[97]);
		WidthText:SetText(Natur_AccountOptions[97]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[99]);
		MaxBarText:SetText(Natur_AccountOptions[99]);
		FontSizeSlider:SetValue(Natur_AccountOptions[101]);
		FontSizeText:SetText(Natur_AccountOptions[101]);
		TextureSlider:SetValue(Natur_AccountOptions[98]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[98]]);
		if(Natur_AccountOptions[95] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
		HeightSlider:SetValue(Natur_AccountOptions[106]);
		HeightText:SetText(Natur_AccountOptions[106]);
		WidthSlider:SetValue(Natur_AccountOptions[107]);
		WidthText:SetText(Natur_AccountOptions[107]);
		MaxBarsSlider:SetValue(Natur_AccountOptions[109]);
		MaxBarText:SetText(Natur_AccountOptions[109]);
		FontSizeSlider:SetValue(Natur_AccountOptions[111]);
		FontSizeText:SetText(Natur_AccountOptions[111]);
		TextureSlider:SetValue(Natur_AccountOptions[108]);
		GroupTexture:SetTexture(Natur_Textures[Natur_AccountOptions[108]]);
		if(Natur_AccountOptions[105] == "UP") then 
			BarDirectionCheckbox:SetChecked(true); 
		else
			BarDirectionCheckbox:SetChecked(false); 
		end;	
	end;
end;

--
--	Back Button
--
function SettingsBackButton_OnClick()
		Natur_BarSettingSelected = Natur_BarSettingSelected - 1;
		if(Natur_BarSettingSelected < 1) then
			Natur_BarSettingSelected = 10;
		end;
		Natur_ProcessBarSettings();
end;

--
--	Forward Button
--
function SettingsForwardButton_OnClick()
	Natur_BarSettingSelected = Natur_BarSettingSelected + 1;	
	if(Natur_BarSettingSelected > 10) then
			Natur_BarSettingSelected = 1;
	end;
	Natur_ProcessBarSettings();
end


-- ******************************************************************
-- ***********************  SLIDER ROUTINES *************************
-- ******************************************************************


--
--	Height OnValueChanged
--
function HeightSlider_OnValueChanged()
	if(NATUR_PROCESS_SLIDERS) then
		local value = HeightSlider:GetValue();
		if(Natur_BarSettingSelected == 1) then				-- Primary Group	
			Natur_AccountOptions[6] = value;
			NaturPrimaryGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
			Natur_AccountOptions[16] = value;
			NaturHostileCastGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
			Natur_AccountOptions[26] = value;
			NaturTargetBuffsGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
			Natur_AccountOptions[36] = value;
			NaturTargetDebuffsGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
			Natur_AccountOptions[66] = value;
			NaturMyCooldownsGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
			Natur_AccountOptions[56] = value;
			NaturFriendlyCastGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
			Natur_AccountOptions[76] = value;
			-- no group used for crowd control timers yet.
		elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
			Natur_AccountOptions[86] = value;
			NaturDiminishGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
			Natur_AccountOptions[96] = value;
			NaturPlayersBuffsGroup:SetHeight(value);
		elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
			Natur_AccountOptions[106] = value;
			NaturPlayersDebuffsGroup:SetHeight(value);
		end;
		-- set text
		HeightText:SetText(value);
	end;
end

--
--	Width Slider
--
function WidthSlider_OnValueChanged()
	if(NATUR_PROCESS_SLIDERS) then
		local value = WidthSlider:GetValue();
		if(Natur_BarSettingSelected == 1) then				-- Primary Group
			Natur_AccountOptions[7] = value;
			NaturPrimaryGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
			Natur_AccountOptions[17] = value;
			NaturHostileCastGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
			Natur_AccountOptions[27] = value;
			NaturTargetBuffsGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
			Natur_AccountOptions[37] = value;
			NaturTargetDebuffsGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
			Natur_AccountOptions[67] = value;
			NaturMyCooldownsGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
			Natur_AccountOptions[57] = value;
			NaturFriendlyCastGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
			Natur_AccountOptions[77] = value;
			-- no group for cc's
		elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
			Natur_AccountOptions[87] = value;
			NaturDiminishGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
			Natur_AccountOptions[97] = value;
			NaturPlayersBuffsGroup:SetWidth(value);	
		elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
			Natur_AccountOptions[107] = value;
			NaturPlayersDebuffsGroup:SetWidth(value);	
		end;
		-- set text
		WidthText:SetText(value);	
	end;
end

--
--	Max Bars Slider
--
function MaxBarsSlider_OnValueChanged()
	if(NATUR_PROCESS_SLIDERS) then
		local value = MaxBarsSlider:GetValue();
		if(Natur_BarSettingSelected == 1) then				-- Primary Group
			Natur_AccountOptions[9] = value;	
			NaturPrimaryGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
			Natur_AccountOptions[19] = value;
			NaturHostileCastGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
			Natur_AccountOptions[29] = value;
			NaturTargetBuffsGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
			Natur_AccountOptions[39] = value;
			NaturTargetDebuffsGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
			Natur_AccountOptions[69] = value;
			NaturMyCooldownsGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
			Natur_AccountOptions[59] = value;
			NaturFriendlyCastGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
			Natur_AccountOptions[79] = value;
			-- no cc group in yet.
		elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
			Natur_AccountOptions[89] = value;
			NaturDiminishGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
			Natur_AccountOptions[99] = value;
			NaturPlayersBuffsGroup:SetMaxBars(value);
		elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
			Natur_AccountOptions[109] = value;
			NaturPlayersDebuffsGroup:SetMaxBars(value);
		end;
		-- set text
		MaxBarText:SetText(value);	
	end;
end

--
--	Font Size
--
function FontSizeSlider_OnValueChanged()
	if(NATUR_PROCESS_SLIDERS) then
		local value = FontSizeSlider:GetValue();
		if(Natur_BarSettingSelected == 1) then				-- Primary Group	
			Natur_AccountOptions[11] = value;
			NaturPrimaryGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
			Natur_AccountOptions[21] = value;
			NaturHostileCastGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
			Natur_AccountOptions[31] = value;
			NaturTargetBuffsGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
			Natur_AccountOptions[41] = value;
			NaturTargetDebuffsGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
			Natur_AccountOptions[71] = value;
			NaturMyCooldownsGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
			Natur_AccountOptions[61] = value;
			NaturFriendlyCastGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
			Natur_AccountOptions[81] = value;
		elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
			Natur_AccountOptions[91] = value;
			NaturDiminishGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
			Natur_AccountOptions[101] = value;
			NaturPlayersBuffsGroup:SetGroupFontSize(value);
		elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
			Natur_AccountOptions[111] = value;
			NaturPlayersDebuffsGroup:SetGroupFontSize(value);
		end;
		-- set text
		FontSizeText:SetText(value);	
	end;
end

--
--	Texture
--
function TextureSlider_OnValueChanged()
	if(NATUR_PROCESS_SLIDERS) then
		local value = TextureSlider:GetValue();
		if(Natur_BarSettingSelected == 1) then				-- Primary Group
			Natur_AccountOptions[8] = value;	
			NaturPrimaryGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
			Natur_AccountOptions[18] = value;	
			NaturHostileCastGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
			Natur_AccountOptions[28] = value;	
			NaturTargetBuffsGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
			Natur_AccountOptions[38] = value;	
			NaturTargetDebuffsGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
			Natur_AccountOptions[68] = value;	
			NaturMyCooldownsGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
			Natur_AccountOptions[58] = value;	
			NaturFriendlyCastGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
			Natur_AccountOptions[78] = value;	
		elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
			Natur_AccountOptions[88] = value;	
			NaturDiminishGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
			Natur_AccountOptions[98] = value;	
			NaturPlayersBuffsGroup:SetTexture(Natur_Textures[value]);
		elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
			Natur_AccountOptions[108] = value;	
			NaturPlayersDebuffsGroup:SetTexture(Natur_Textures[value]);
		end;
		-- set texture
		GroupTexture:SetTexture(Natur_Textures[value]);
	end;
end


-- ******************************************************************
-- *********************  CHECKBOX ROUTINES *************************
-- ******************************************************************

function BarDirectionCheckbox_OnClick()
	local CheckboxEnabled = BarDirectionCheckbox:GetChecked();
	if(CheckboxEnabled == 1) then CheckboxEnabled = "UP";
	else CheckboxEnabled = "DOWN"; end;
	if(Natur_BarSettingSelected == 1) then				-- Primary Group
		Natur_AccountOptions[5] = CheckboxEnabled;
		NaturPrimaryGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 2) then			-- Hostile Casts
		Natur_AccountOptions[15] = CheckboxEnabled;
		NaturHostileCastGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 3) then			-- Target Gains
		Natur_AccountOptions[25] = CheckboxEnabled;
		NaturTargetBuffsGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 4) then			-- Target Debuffs
		Natur_AccountOptions[35] = CheckboxEnabled;
		NaturTargetDebuffsGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 5) then			-- Cooldowns
		Natur_AccountOptions[65] = CheckboxEnabled;
		NaturMyCooldownsGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 6) then			-- Friendly Casts
		Natur_AccountOptions[55] = CheckboxEnabled;
		NaturFriendlyCastGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 7) then			-- Crowd Controls
		Natur_AccountOptions[75] = CheckboxEnabled;
	elseif(Natur_BarSettingSelected == 8) then			-- Diminish Returns
		Natur_AccountOptions[85] = CheckboxEnabled;
		NaturDiminishGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 9) then			-- Player Buffs
		Natur_AccountOptions[95] = CheckboxEnabled;
		NaturPlayersBuffsGroup:SetBarGrowth(CheckboxEnabled);
	elseif(Natur_BarSettingSelected == 10) then			-- Player Debuffs
		Natur_AccountOptions[105] = CheckboxEnabled;
		NaturPlayersDebuffsGroup:SetBarGrowth(CheckboxEnabled);
	end;	
end

--
--	Toggle Anchors 
--
function ToggleAnchorsButton_OnClick()
	if(Natur_AccountOptions[1] == true) then
		Natur_AccountOptions[1] = false;
	else
		Natur_AccountOptions[1] = true;
	end;
	Natur_SetAnchor(Natur_AccountOptions[1]);
end


--
--	Toggle Test Bars.
--
function ToggleTestBars_OnClick()
	if(Natur_TestBarsStatus == 0) then
		Natur_TestBarsStatus = 1;
		if(Natur_AccountOptions[32]) then 
			NaturTargetBuffsGroup:RegisterBar("Testing1", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing2", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing3", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing4", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing5", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing6", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing7", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing8", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing9", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetBuffsGroup:RegisterBar("Testing10", "Beneficial Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[22]) then 
			NaturHostileCastGroup:RegisterBar("Testing11", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing12", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing13", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing14", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing15", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing16", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing17", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing18", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing19", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturHostileCastGroup:RegisterBar("Testing20", "Hostile Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[62]) then 
			NaturFriendlyCastGroup:RegisterBar("Testing21", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing22", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing23", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing24", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing25", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing26", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing27", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing28", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing29", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturFriendlyCastGroup:RegisterBar("Testing30", "Friendly Casts", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[72] or Natur_AccountOptions[136] or Natur_AccountOptions[137]) then 
			NaturMyCooldownsGroup:RegisterBar("Testing31", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing32", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing33", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing34", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing35", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing36", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing37", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing38", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing39", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturMyCooldownsGroup:RegisterBar("Testing40", "Cooldowns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[42]) then 
			NaturTargetDebuffsGroup:RegisterBar("Testing41", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing42", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing43", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing44", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing45", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing46", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing47", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing48", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing49", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturTargetDebuffsGroup:RegisterBar("Testing50", "Targets Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[92]) then 
			NaturDiminishGroup:RegisterBar("Testing51", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing52", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing53", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing54", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing55", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing56", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing57", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing58", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing59", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturDiminishGroup:RegisterBar("Testing60", "Diminish Returns", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(not(Natur_AccountOptions[2])) then
			NaturPrimaryGroup:RegisterBar("Testing61", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing62", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing63", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing63", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing64", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing66", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing67", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing68", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing69", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPrimaryGroup:RegisterBar("Testing70", "Primary (Grouped up)", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
		if(Natur_AccountOptions[114]) then	-- only if we have these groups on.
			NaturPlayersBuffsGroup:RegisterBar("Testing71", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing72", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing73", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing73", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing74", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing76", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing77", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing78", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing79", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersBuffsGroup:RegisterBar("Testing80", "Player Buffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing81", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing82", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing83", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing83", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing84", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing86", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing87", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing88", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing89", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
			NaturPlayersDebuffsGroup:RegisterBar("Testing90", "Player Debuffs", 300, 300, Natur_PlayerIcon, Natur_HTarget);
		end;
	else
		Natur_TestBarsStatus = 0;
		NaturTargetBuffsGroup:UnregisterAllBars();
		NaturHostileCastGroup:UnregisterAllBars();
		NaturFriendlyCastGroup:UnregisterAllBars();
		NaturMyCooldownsGroup:UnregisterAllBars();
		NaturTargetDebuffsGroup:UnregisterAllBars();
		NaturDiminishGroup:UnregisterAllBars();
		NaturPrimaryGroup:UnregisterAllBars();
		NaturPlayersBuffsGroup:UnregisterAllBars();
		NaturPlayersDebuffsGroup:UnregisterAllBars();
	end;
end
