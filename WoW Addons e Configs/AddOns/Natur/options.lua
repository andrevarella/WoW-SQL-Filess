	

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

-- give checkboxes correct values as per saved variables.
function Process_AllCheckboxes()

	-- checkboxes
	if(Natur_PerCharOptions[1]) then EnableAddonCheck:SetChecked(true); end;
	if(Natur_AccountOptions[2]) then GroupUpTimersCheck:SetChecked(true); end;
	if(Natur_AccountOptions[62]) then ShowFriendlyCastsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[114]) then ShowMyBuffsDebuffsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[22]) then ShowHostileCastsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[136]) then ShowPlayerCooldowns:SetChecked(true); end;
	if(Natur_AccountOptions[130]) then ShowOnlyMyTargetsSpells:SetChecked(true); end;
	if(Natur_AccountOptions[137]) then ShowHostileCooldownsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[92]) then ShowDiminishReturnsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[131]) then AutoReputationBarChange:SetChecked(true); end;
	if(Natur_AccountOptions[134]) then MaxCombosFinishHimSound:SetChecked(true); end;
	if(Natur_AccountOptions[135]) then PlayFinishHimOnNPC:SetChecked(true); end;
	if(Natur_AccountOptions[127]) then PlayUnrealPvPSounds:SetChecked(true); end;
	if(Natur_AccountOptions[128] == "Male") then UseMaleUnrealSounds:SetChecked(true); end;
	if(Natur_AccountOptions[129]) then PlayUnrealPvPOnNPC:SetChecked(true); end;
	if(Natur_AccountOptions[124]) then ShowRogueWarning:SetChecked(true); end;
	if(Natur_AccountOptions[125]) then PlayRogueSound:SetChecked(true); end;
	if(Natur_AccountOptions[126]) then RogueFlashGUI:SetChecked(true); end;
	if(Natur_AccountOptions[132]) then DKDeathGripSound:SetChecked(true); end;
	if(Natur_AccountOptions[113]) then ShowCastsWithoutTF:SetChecked(true); end;
	if(Natur_AccountOptions[119]) then AnnounceSpellMisses:SetChecked(true); end;
	if(Natur_AccountOptions[120]) then SpellMissPlaySound:SetChecked(true); end;
	if(Natur_AccountOptions[121]) then SpellMissFlashGUI:SetChecked(true); end;
	if(Natur_AccountOptions[115]) then AnnounceAppliedCC:SetChecked(true); end;
	if(Natur_AccountOptions[116]) then AnnounceOnCCBreaks:SetChecked(true); end;
	if(Natur_AccountOptions[117]) then PlaySoundOnCCBreak:SetChecked(true); end;
	if(Natur_AccountOptions[118]) then FlashUIOnCCBreak:SetChecked(true); end;
	if(Natur_AccountOptions[42]) then ShowTargetDebuffsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[32]) then ShowTargetGainsCheck:SetChecked(true); end;
	if(Natur_AccountOptions[122]) then ShowAllDRAroundMe:SetChecked(true); end;
	if(Natur_AccountOptions[123]) then SpellMonitoringCheck:SetChecked(true); end;

end;

-- close options
function OptionsCloseButton_OnClick()
	MainOptionsFrame:Hide();
end

-- enable addon
function Process_EnableAddon()
	local CheckboxEnabled = EnableAddonCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_PerCharOptions[1] = true 
	else Natur_PerCharOptions[1] = false end;
end

-- group up timers.
function GroupUpTimersCheck_OnClick()
	local CheckboxEnabled = GroupUpTimersCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[2] = true 
	else Natur_AccountOptions[2] = false end;
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
	-- redo the timers.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();
end

-- friendly casts
function ShowFriendlyCastsCheck_OnClick()
	local CheckboxEnabled = ShowFriendlyCastsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[62] = true 
	else Natur_AccountOptions[62] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
end

-- show my buffs/debuffs
function ShowMyBuffsDebuffsCheck_OnClick()
	local CheckboxEnabled = ShowMyBuffsDebuffsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[114] = true 
	else Natur_AccountOptions[114] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
	-- redo the timers.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();
end

-- Hostile Casts
function ShowHostileCastsCheck_OnClick()
	local CheckboxEnabled = ShowHostileCastsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[22] = true 
	else Natur_AccountOptions[22] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
end

function ShowPlayerCooldowns_OnClick()
	local CheckboxEnabled = ShowPlayerCooldowns:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[136] = true 
	else Natur_AccountOptions[136] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
end

function ShowOnlyMyTargetsSpells_OnClick()
	local CheckboxEnabled = ShowOnlyMyTargetsSpells:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[130] = true 
	else Natur_AccountOptions[130] = false end;		
	-- redo the timers.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();			
end


function ShowHostileCooldownsCheck_OnClick()
	local CheckboxEnabled = ShowHostileCooldownsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[137] = true 
	else Natur_AccountOptions[137] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
end

function ShowDiminishReturnsCheck_OnClick()
	local CheckboxEnabled = ShowDiminishReturnsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[92] = true 
	else Natur_AccountOptions[92] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
end

function AutoReputationBarChange_OnClick()
	local CheckboxEnabled = AutoReputationBarChange:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[131] = true 
	else Natur_AccountOptions[131] = false end;		
end

function MaxCombosFinishHimSound_OnClick()
	local CheckboxEnabled = MaxCombosFinishHimSound:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[134] = true 
	else Natur_AccountOptions[134] = false end;		
end


function PlayFinishHimOnNPC_OnClick()
	local CheckboxEnabled = PlayFinishHimOnNPC:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[135] = true 
	else Natur_AccountOptions[135] = false end;		
end

function PlayUnrealPvPSounds_OnClick()
	local CheckboxEnabled = PlayUnrealPvPSounds:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[127] = true 
	else Natur_AccountOptions[127] = false end;		
end

function UseMaleUnrealSounds_OnClick()
	local CheckboxEnabled = UseMaleUnrealSounds:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[128] = "Male" 
	else Natur_AccountOptions[128] = "Female" end;		
end

function PlayUnrealPvPOnNPC_OnClick()
	local CheckboxEnabled = PlayUnrealPvPOnNPC:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[129] = true 
	else Natur_AccountOptions[129] = false end;		
end

function DKDeathGripSound_OnClick()
	local CheckboxEnabled = DKDeathGripSound:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[132] = true 
	else Natur_AccountOptions[132] = false end;			
end

function ShowRogueWarning_OnClick()
	local CheckboxEnabled = ShowRogueWarning:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[124] = true 
	else Natur_AccountOptions[124] = false end;			
end


function PlayRogueSound_OnClick()
	local CheckboxEnabled = PlayRogueSound:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[125] = true 
	else Natur_AccountOptions[125] = false end;				
end

function RogueFlashGUI_OnClick()
	local CheckboxEnabled = RogueFlashGUI:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[126] = true 
	else Natur_AccountOptions[126] = false end;				
end

function ShowCastsWithoutTF_OnClick()
	local CheckboxEnabled = ShowCastsWithoutTF:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[113] = true 
	else Natur_AccountOptions[113] = false end;				
end

function AnnounceSpellMisses_OnClick()
	local CheckboxEnabled = AnnounceSpellMisses:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[119] = true 
	else Natur_AccountOptions[119] = false end;				
end

function SpellMissPlaySound_OnClick()
	local CheckboxEnabled = SpellMissPlaySound:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[120] = true 
	else Natur_AccountOptions[120] = false end;				
end

function SpellMissFlashGUI_OnClick()
	local CheckboxEnabled = SpellMissFlashGUI:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[121] = true 
	else Natur_AccountOptions[121] = false end;				
end

function AnnounceAppliedCC_OnClick()
	local CheckboxEnabled = AnnounceAppliedCC:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[115] = true 
	else Natur_AccountOptions[115] = false end;				
end

function AnnounceOnCCBreaks_OnClick()
	local CheckboxEnabled = AnnounceOnCCBreaks:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[116] = true 
	else Natur_AccountOptions[116] = false end;				
end

function PlaySoundOnCCBreak_OnClick()
	local CheckboxEnabled = PlaySoundOnCCBreak:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[117] = true 
	else Natur_AccountOptions[117] = false end;				
end

function FlashUIOnCCBreak_OnClick()
	local CheckboxEnabled = FlashUIOnCCBreak:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[118] = true 
	else Natur_AccountOptions[118] = false end;				
end

function ShowTargetDebuffsCheck_OnClick()
	local CheckboxEnabled = ShowTargetDebuffsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[42] = true 
	else Natur_AccountOptions[42] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
	-- redo the timers.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();			
end

function ShowTargetGainsCheck_OnClick()
	local CheckboxEnabled = ShowTargetGainsCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[32] = true 
	else Natur_AccountOptions[32] = false end;	
	-- update the groups
	Natur_SetAnchor(Natur_AccountOptions[1]);
	-- redo the timers.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();			
end


function ShowAllDRAroundMe_OnClick()
	local CheckboxEnabled = ShowAllDRAroundMe:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[122] = true 
	else Natur_AccountOptions[122] = false end;	
end


function SpellMonitoringCheck_OnClick()
	local CheckboxEnabled = SpellMonitoringCheck:GetChecked();
	if(CheckboxEnabled == 1) then Natur_AccountOptions[123] = true 
	else Natur_AccountOptions[123] = false end;				
end


function BarSettingsButton_OnClick()
	-- open up the bar settings.
	Natur_ProcessBarSettings();
	MainOptionsFrame:Hide();
	BarSettingsFrame:Show();
end

function Button1_OnClick()
	-- open ignore frame.
	MainOptionsFrame:Hide();
	TimerIgnoreFrame:Show();
end

--
--	Credits.
--
function AboutAddonButton_OnClick()
	MainOptionsFrame:Hide();
	NaturCreditsFrame:Show();	
end

-- 
--	Monitor a spell/Ability
--
function MonitorSpellSettingsButton_OnClick()
	MainOptionsFrame:Hide();
	MonitorAbilityInformFrame:Show();		
end


