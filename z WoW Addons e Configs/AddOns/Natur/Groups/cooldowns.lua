
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


-- mob cooldown tracking.
Natur_CooldownTracking = {};

--
--	Initialise Player Cooldowns
--
function Natur_InitialisePlayerCooldowns()
	-- initialise the castbar group
	NaturMyCooldownsGroup = NaturLib:RegisterGroup(PLAYER_COOLDOWN_TITLE, Natur_Textures[Natur_AccountOptions[68]]);
	NaturMyCooldownsGroup:RegisterOnMove("Natur_PlayerCooldownsOnBarMove");
	NaturMyCooldownsGroup:SetInvert(true);					
	NaturMyCooldownsGroup:SetScale(1.0);
	NaturMyCooldownsGroup:SetMaxBars(Natur_AccountOptions[69]);
	NaturMyCooldownsGroup:SetWidth(Natur_AccountOptions[67]);
	NaturMyCooldownsGroup:SetHeight(Natur_AccountOptions[66]);
	NaturMyCooldownsGroup:SetDisplayGroup("");
	NaturMyCooldownsGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturMyCooldownsGroup:SetBarGrowth(Natur_AccountOptions[65]);	
	NaturMyCooldownsGroup:SetGroupFontSize(Natur_AccountOptions[71]);	
	NaturMyCooldownsGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[63], Natur_AccountOptions[64])
end;
-- supporting function to save position.
function Natur_PlayerCooldownsOnBarMove(parent, x, y)
	Natur_AccountOptions[63] = x
	Natur_AccountOptions[64] = y
end;


--
--	Process my cooldowns
--
function Natur_ReadPlayerCooldowns()
	if(Natur_AccountOptions[136]) then	-- do we want to show my cooldowns?
		for i=1,120 do
			-- we have a texture in this slot so theres a spell here.
			local start,duration,enable = GetActionCooldown(i)
			if(start > 0 and duration > 0 and enable == 1) then
				local actiontype, id, subtype = GetActionInfo(i);
				local name;
				if(id > 0) then	-- ignore anything thats invalid
					if actiontype == "spell" then 
						name = GetSpellName(id, "spell");
					elseif actiontype == "item" then 
						name = GetItemInfo(id); 
					elseif actiontype == "macro" then		-- bugfix Dogtem, 7/5/2009
						name = GetMacroSpell(id);
					end;
					if(name) then							-- bugfix 18/5/2009
						local timeLeft = math.floor((start + duration) - GetTime());
						local spellTexture = GetActionTexture(i);	-- grab the icon
						if(timeLeft) then
							if(timeLeft >= 6) then	-- not bothered about anything 6 sec or below
								if(not(Natur_CheckIgnoredAbility(name))) then	-- ignored?
									if(Natur_AccountOptions[2]) then	-- are we split?
										NaturMyCooldownsGroup:SetInvert(false);
										NaturMyCooldownsGroup:RegisterBar(name, name.." (CD)", timeLeft, duration, spellTexture, Natur_PlayerIcon);
									else
										-- we are grouped up
										NaturPrimaryGroup:SetInvert(false);
										NaturPrimaryGroup:RegisterBar(name, name.." (CD)", timeLeft, duration, spellTexture, Natur_PlayerIcon);
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;


--
--	Add cooldown entry
--
function Natur_TrackCooldown(caster_id, caster_name, spell_id, spell_name, fire_time, duration, bar_id, icon, faction)
	tinsert(Natur_CooldownTracking, {caster_id, caster_name, spell_id, spell_name, fire_time, duration, bar_id, icon, faction});
end;

--
--	Clear out expired cooldowns.
--
function Natur_RemoveExpiredCooldown()
	for count,value in ipairs(Natur_CooldownTracking) do
		local castTime = value[5];
		local timeNow = GetTime();
		local totaDur = timeNow - castTime;
		if(totaDur > value[6]) then		-- remove anything after its expired.
			tremove(Natur_CooldownTracking, count);
		end;
	end;
end;

--
--	Show any cooldowns on selected target!
--
function Natur_ShowTargetCooldowns(caster_id)
	Natur_RemoveExpiredCooldown();	-- clear out anything old.
	if(Natur_AccountOptions[137]) then
		for count,value in ipairs(Natur_CooldownTracking) do
			if(value[1] == caster_id and value[1] == UnitGUID("target") or value[1] == caster_id and Natur_IsPlayerInArena) then
				local remainingTime = tonumber(value[6]) - (GetTime() - tonumber(value[5]));
				if(Natur_AccountOptions[2]) then
					-- we are in our own group
					NaturMyCooldownsGroup:SetInvert(false);
					NaturMyCooldownsGroup:RegisterBar(value[7], value[4].." ("..value[2].."'s CD)", remainingTime, remainingTime, value[8], value[9]);	
				else
					-- grouped up so send it to the cast group
					NaturPrimaryGroup:SetInvert(false);
					NaturPrimaryGroup:RegisterBar(value[7], value[4].." ("..value[2].."'s CD)", remainingTime, remainingTime, value[8], value[9]);
				end;
			else
				if(Natur_AccountOptions[2]) then NaturMyCooldownsGroup:UnregisterBar(value[7]);
				else NaturPrimaryGroup:UnregisterBar(value[7]); end; 
			end;
		end;
	end;
end;


--
--	Clear out any cooldowns for a dead mob
--
function Natur_DeleteDeadCooldowns(caster_id)
	for count,value in ipairs(Natur_CooldownTracking) do
		if(value[1] == caster_id) then
			if(Natur_AccountOptions[2]) then NaturMyCooldownsGroup:UnregisterBar(value[7]);
			else NaturPrimaryGroup:UnregisterBar(value[7]); end;
			-- kill the bar
			tremove(Natur_CooldownTracking, count);					-- delete the entry
		end;
	end;
end;