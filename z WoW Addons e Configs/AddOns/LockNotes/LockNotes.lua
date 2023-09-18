function LockNotes_OnLoad()
this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
WarlockArmorActive = true;
MySpellReflected = false;
end

function LockNotes_OnEvent(event)


------------------------------------------------------------- Friendly Buffs -------------------------------------------------------------
if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg10 == "Hand of Protection") or (arg10 == "Hand of Freedom") or (arg10 == "Heroism") or (arg10 == "Aura Mastery") then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(0, 1, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\cling.wav");
		end
	end
end

if (arg2 == "SPELL_AURA_APPLIED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg10 == "Eradication") or (arg10 == "Shadow Mastery") or (arg10 == "Molten Core") or (arg10 == "Decimation") or (arg10 == "Aura Mastery") then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 2
			ZoneTextFrame.fadeOutTime = 2
			if (arg10 == "Eradication") then
				ZoneTextString:SetTextColor(0, 1, 0);
			end
			if (arg10 == "Shadow Mastery") then
				ZoneTextString:SetTextColor(1, 0, 1);
			end
			if (arg10 == "Molten Core") then
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			if (arg10 == "Decimation") then
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			if (arg10 == "Aura Mastery") then
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\bell.wav");
		end
	end
end

if (arg2 == "SPELL_AURA_APPLIED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg10 == "Shadow Trance") or (arg10 == "Backlash") then
			if (arg10 == "Shadow Trance") then
				ZoneTextString:SetText("They're dead!");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(1, 0, 1);
			end
			if (arg10 == "Backlash") then
				ZoneTextString:SetText("They're dead!");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(1, 0.5, 0);
			end
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\ding.wav");
		end
	end
end
if (arg2 == "SPELL_AURA_REMOVED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg10 == "Siphoned Power") or (arg10 == "Heroism") then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." down.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0.5, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Hostile Spells -------------------------------------------------------------
if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg5, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then -- Makes sure it's an enemy player
		if (arg10 == "Bladestorm") or (arg10 == "Cloak of Shadows") or (arg10 == "Divine Shield") or (arg10 == "Shadow Ward") or (arg10 == "Dispersion") or (arg10 == "Spell Reflection") or (arg10 == "Anti-Magic Shell") or (arg10 == "Ice Block") or (arg10 == "Lichborne") or (arg10 == "Berserker Rage") or (arg10 == "Metamorphosis") or (arg10 == "Power Word: Shield") or (arg10 == "The Beast Within") or (arg10 == "Fear Ward") or (arg10 == "Hand of Freedom") or (arg10 == "Tremor Totem") or (arg10 == "Grounding Totem") or (arg10 == "Sprint") or (arg10 == "Dash") or (arg10 == "Berserk") or (arg10 == "Aura Mastery") or (arg10 == "Deterrence") or (arg10 == "Elemental Mastery") then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." up!");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\pulse.wav");
			if (arg10 == "Spell Reflection") then
				MySpellReflected = false;
			end
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then
	if bit.band(arg8, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (arg10 == "Cloak of Shadows") or (arg10 == "Divine Shield") or (arg10 == "Shadow Ward") or (arg10 == "Dispersion") or (arg10 == "Spell Reflection") or (arg10 == "Anti-Magic Shell") or (arg10 == "Ice block") or (arg10 == "Lichborne") or (arg10 == "Berserker Rage") or (arg10 == "Metamorphosis") or (arg10 == "Power Word: Shield") or (arg10 == "The Beast Within") or (arg10 == "Fear Ward") or (arg10 == "Hand of Freedom") or (arg10 == "Tremor Totem") or (arg10 == "Grounding Totem") or (arg10 == "Sprint") or (arg10 == "Dash") or (arg10 == "Berserk") or (arg10 == "Aura Mastery") then
			SpellName = arg10
			ZoneTextString:SetText(""..SpellName.." down.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(0, 1, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then -- apply same filtering on reflecting for Shadow Ward, and for /deflect?
	if bit.band(arg8, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
		if (arg10 == "Spell Reflection") then
			if (not MySpellReflected) then
				SpellName = arg10
				ZoneTextString:SetText(""..SpellName.." down.");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(0, 1, 0);
				PVPInfoTextString:SetText("");
				ZoneTextFrame:Show()
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Other ----------------------------------------------------------------------
if (arg2 == "SPELL_AURA_DISPELLED") or (arg2 == "SPELL_AURA_STOLEN") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		if (arg13 == "Fel Armor") or (arg13 == "Demon Armor") then
			SpellName = arg13
			ZoneTextString:SetText(""..SpellName.." removed.");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 0, 0);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\buzz.wav");
			WarlockArmorActive = false;
		end
	end
end

if (arg2 == "SPELL_AURA_REMOVED") then
	if bit.band(arg8, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my buff only
		if (arg10 == "Fel Armor") or (arg10 == "Demon Armor") or (arg10 == "Soul Link") then
			if (WarlockArmorActive) then -- makes sure buff is still active as to not spam twice when dispelled, since it shows both dispelled and removed events, but the removed event .5sec slower
				SpellName = arg10
				ZoneTextString:SetText(""..SpellName.." removed.");
				ZoneTextFrame.startTime = GetTime()
				ZoneTextFrame.fadeInTime = 0
				ZoneTextFrame.holdTime = 1
				ZoneTextFrame.fadeOutTime = 2
				ZoneTextString:SetTextColor(1, 0, 0);
				PVPInfoTextString:SetText("");
				ZoneTextFrame:Show()
				PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\buzz.wav");
				WarlockArmorActive = false;
			end
		end
	end
end

if (arg2 == "SPELL_CAST_SUCCESS") then
	if bit.band(arg5, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (arg10 == "Fel Armor") or (arg10 == "Demon Armor") then
			WarlockArmorActive = true;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------- Resists --------------------------------------------------------------------
if (arg2 == "SPELL_MISSED") then -- need to add: evade, deflect (what is this?), check what happens when debuff is on an evading mob, dont want spam for each dot tick, even tho most evades remove all debuffs on them, not all
	if bit.band(arg5, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then -- Makes sure it's my own spell or my pet's spell
		if (arg10 == "Death Coil") or (arg10 == "Drain Mana") or (arg10 == "Drain Life") or (arg10 == "Corruption") or (arg10 == "Curse of Agony") or (arg10 == "Curse of Tongues") or (arg10 == "Fear") or (arg10 == "Immolate") or (arg10 == "Curse of Weakness") or (arg10 == "Unstable Affliction") or (arg10 == "Curse of Exhaustion") or (arg10 == "Curse of the Elements") or (arg10 == "Banish") or (arg10 == "Spell Lock") or (arg10 == "Seduction") then
			SpellName = arg10
			if (arg7 == "Grounding Totem") then
				ResistMethod = "Grounded"
			elseif (arg12 == "REFLECT") then
				ResistMethod = "reflected"
				MySpellReflected = true;
			elseif (arg12 == "IMMUNE") then
				ResistMethod = "failed"
			else
				ResistMethod = "resisted"
			end
			ZoneTextString:SetText(""..SpellName.." "..ResistMethod..".");
			ZoneTextFrame.startTime = GetTime()
			ZoneTextFrame.fadeInTime = 0
			ZoneTextFrame.holdTime = 1
			ZoneTextFrame.fadeOutTime = 2
			ZoneTextString:SetTextColor(1, 1, 1);
			PVPInfoTextString:SetText("");
			ZoneTextFrame:Show()
			if (ResistMethod ~= "failed") then -- only play sound file when you need to instantly recast what you just casted
				PlaySoundFile("Interface\\AddOns\\LockNotes\\Sounds\\thud.wav");
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


end