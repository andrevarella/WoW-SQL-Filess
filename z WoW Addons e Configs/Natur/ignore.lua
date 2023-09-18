


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

-- storage for ignored spells/abilities.  Anything saved in this table
-- will be ignored and not shown as a timer on your screen if your 
-- target or focus has them applied.
Natur_IgnoredTimers = {
	
	-- default pre-ignored spells and abilities.
	
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
	"arcane intellect", 
	-- global
	"well fed",
	"pirate costume"
};


--
--	OnClick() - add spell or ability to the ignore list
--
function AddSpellButton_OnClick()
	-- add a spell or ability to be ignored.
	Natur_AddIgnoredAbility(SpellNameEditBox:GetText());
	-- update any timers running from target.
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();
end

--
--	OnClick() - remove spell or ability from the ignore list
--

function RemoveSpellButton_OnClick()
	-- remove a ability or spell from ignore.
	Natur_RemoveIgnoredAbility(SpellNameEditBox:GetText());
	SpellNameEditBox:SetText("");	-- clear it	
	-- update any timers on mob
	Natur_ReadTargetBuffs();
	Natur_ReadTargetDebuffs();
	Natur_ReadPlayerBuffs();
	Natur_ReadPlayerDebuffs();
end

--
--	OnClick() - Close Timer Ignore dialog
--
function BarSettingsClose_OnClick()
	-- close the bar settings page.  
	IgnoreStatusText:SetText("");	-- clear it.
	SpellNameEditBox:SetText("");	-- clear it.
	TimerIgnoreFrame:Hide();
	MainOptionsFrame:Show();
end;


-- 
--	Add Ignored Spell
--
function Natur_AddIgnoredAbility(spellname)
	local lowerspell = strlower(spellname);
	if(not(Natur_CheckIgnoredAbility(spellname))) then		
		tinsert(Natur_IgnoredTimers, lowerspell);
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffAdded ["..lowerspell.."] to timer ignore list.");
		IgnoreStatusText:SetText(SpellNameEditBox:GetText().." is now being ignored.");
		SpellNameEditBox:SetText("");	-- clear it.
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffff["..lowerspell.."] is already ignored.");
		IgnoreStatusText:SetText(SpellNameEditBox:GetText().." is already ignored.");
		SpellNameEditBox:SetText("");	-- clear it	
	end;
end;


--
--	Check If Spell is Ignored
--
function Natur_CheckIgnoredAbility(spellname)
	if(spellname) then	-- bug fix 1/5/09, trinkets dont supply spell name causing lua error
		local lowerspell = strlower(spellname);
		for count,value in ipairs(Natur_IgnoredTimers) do 
			if(value == lowerspell) then 
				return(true);			-- its found so i want this ignored. 
			end; 
		end;
	end;
	return(false);	-- didnt find the spell, return false and show the timer.
end;


--
--	Remove Ignored Spell
--
function Natur_RemoveIgnoredAbility(spellname)
	local lowerspell = strlower(spellname);
	for count,value in ipairs(Natur_IgnoredTimers) do 
		if(value == lowerspell) then 
			DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur : |cffffffffDeleted ["..value.."] from timer ignore list.");
			tremove(Natur_IgnoredTimers, count);
			IgnoreStatusText:SetText(SpellNameEditBox:GetText().." is now longer ignored.");
			return(true);			-- we deleted it. 
		end; 
	end;
	IgnoreStatusText:SetText(SpellNameEditBox:GetText().." was not found.");
	return(false);
end;


