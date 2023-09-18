
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


-- storage for monitored spells/abilities.  Anything saved in this table
-- will be monitored and a prompt will be shown when the spell fades from
-- me due to an expire or dispell.

Natur_MonitoredSpells = {

	-- default pre-monitored spells and abilities.
	
	-- priest
	"power word: fortitude",
	"prayer of fortitude",
	"prayer of spirit",
	"divine spirit",
	"prayer of shadow protection",
	"shadow protection",
	"inner fire",
	-- druid
	"mark of the wild",
	"gift of the wild",
	"thorns",
	-- Paladin
	"seal of righteousness", 
	"blessing of might",
	"greater blessing of might",
	"blessing of sanctuary",
	"greater blessing of sanctuary", 
	"blessing of kings",
	"greater blessing of kings", 
	-- Mage
	"arcane intellect",
	"arcane brilliance"
	
};


--
--	OnClick() - add spell or ability to the monitored list
--
function AddMonitoredSpellButton_OnClick()
	-- add a spell or ability to be monitored.
	Natur_AddMonitoredAbility(SpellNameMonitoredEditBox:GetText());
end

--
--	OnClick() - remove spell or ability from the Monitored list
--

function RemoveMonitoredSpellButton_OnClick()
	-- remove a ability or spell from Monitored.
	Natur_RemoveMonitoredAbility(SpellNameMonitoredEditBox:GetText());
	SpellNameMonitoredEditBox:SetText("");	-- clear it	

end

--
--	OnClick() - Close Monitored dialog
--
function CloseWarnMeFrame_OnClick()
	-- close the bar settings page.
	MonitoredStatusText:SetText("");	-- clear it.
	SpellNameMonitoredEditBox:SetText("");	-- clear it.
	MonitorAbilityInformFrame:Hide();
	MainOptionsFrame:Show();
end

-- 
--	Add Monitored Spell
--
function Natur_AddMonitoredAbility(spellname)
	local lowerspell = strlower(spellname);
	if(not(Natur_CheckMonitoredAbility(spellname))) then		
		tinsert(Natur_MonitoredSpells, lowerspell);
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffAdded ["..lowerspell.."] to monitor list.");
		MonitoredStatusText:SetText(SpellNameMonitoredEditBox:GetText().." is now being monitored.");
		SpellNameEditBox:SetText("");	-- clear it.
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffff["..lowerspell.."] is already monitored.");
		MonitoredStatusText:SetText(SpellNameMonitoredEditBox:GetText().." is already monitored.");
		SpellNameEditBox:SetText("");	-- clear it	
	end;
end;


--
--	Check If Spell is Monitored
--
function Natur_CheckMonitoredAbility(spellname)
	if(spellname and Natur_AccountOptions[123]) then
		local lowerspell = strlower(spellname);
		for count,value in ipairs(Natur_MonitoredSpells) do 
			if(value == lowerspell) then 
				return(true);			-- its found so i want this Monitored. 
			end; 
		end;
	end;
	return(false);	-- didnt find the spell, return false.
end;


--
--	Remove Monitored Spell
--
function Natur_RemoveMonitoredAbility(spellname)
	local lowerspell = strlower(spellname);
	for count,value in ipairs(Natur_MonitoredSpells) do 
		if(value == lowerspell) then 
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffDeleted ["..value.."] from monitored list.");
			tremove(Natur_MonitoredSpells, count);
			MonitoredStatusText:SetText(SpellNameMonitoredEditBox:GetText().." is now longer monitored.");
			return(true);			-- we deleted it. 
		end; 
	end;
	MonitoredStatusText:SetText(SpellNameMonitoredEditBox:GetText().." was not found.");
	return(false);
end;


