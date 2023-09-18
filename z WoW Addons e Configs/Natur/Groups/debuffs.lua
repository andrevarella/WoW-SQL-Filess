
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


--
--	Initialise Group for Target debuffs
--	
function Natur_InitialiseTargetDebuffs()
	NaturTargetDebuffsGroup = NaturLib:RegisterGroup(TF_DEBUFF_TITLE, Natur_Textures[Natur_AccountOptions[38]]);
	NaturTargetDebuffsGroup:RegisterOnMove("Natur_TargetDebuffsOnBarMove");
	NaturTargetDebuffsGroup:SetInvert(true);					
	NaturTargetDebuffsGroup:SetScale(1.0);
	NaturTargetDebuffsGroup:SetMaxBars(Natur_AccountOptions[39]);
	NaturTargetDebuffsGroup:SetWidth(Natur_AccountOptions[37]);
	NaturTargetDebuffsGroup:SetHeight(Natur_AccountOptions[36]);
	NaturTargetDebuffsGroup:SetDisplayGroup("");
	NaturTargetDebuffsGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturTargetDebuffsGroup:SetBarGrowth(Natur_AccountOptions[35]);	
	NaturTargetDebuffsGroup:SetGroupFontSize(Natur_AccountOptions[41]);	
	NaturTargetDebuffsGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[33], Natur_AccountOptions[34])
end;
-- supporting function to save position.
function Natur_TargetDebuffsOnBarMove(parent, x, y)
	Natur_AccountOptions[33] = x
	Natur_AccountOptions[34] = y
end;

--
--	Initialise Group for Players debuffs
--	
function Natur_InitialisePlayersDebuffs()
	NaturPlayersDebuffsGroup = NaturLib:RegisterGroup(PLR_DEBUFF_TITLE, Natur_Textures[Natur_AccountOptions[108]]);
	NaturPlayersDebuffsGroup:RegisterOnMove("Natur_PlayersDebuffsOnBarMove");
	NaturPlayersDebuffsGroup:SetInvert(true);					
	NaturPlayersDebuffsGroup:SetScale(1.0);
	NaturPlayersDebuffsGroup:SetMaxBars(Natur_AccountOptions[109]);
	NaturPlayersDebuffsGroup:SetWidth(Natur_AccountOptions[107]);
	NaturPlayersDebuffsGroup:SetHeight(Natur_AccountOptions[106]);
	NaturPlayersDebuffsGroup:SetDisplayGroup("");
	NaturPlayersDebuffsGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturPlayersDebuffsGroup:SetBarGrowth(Natur_AccountOptions[105]);	
	NaturPlayersDebuffsGroup:SetGroupFontSize(Natur_AccountOptions[111]);	
	NaturPlayersDebuffsGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[103], Natur_AccountOptions[104])
end;
-- supporting function to save position.
function Natur_PlayersDebuffsOnBarMove(parent, x, y)
	Natur_AccountOptions[103] = x
	Natur_AccountOptions[104] = y
end;


--
--	BUFF/DEBUFF TABLE
--	(provided so that we can easily remove in group mode)
--		
--	1..	Spell Name
--	2..	BarID
--	3..	Hostile/Friendly
--	4..	Target/Focus
--	5..	guid
--

Natur_TargetDebuffs = {};		-- store info of bars.

--
--	PUBLIC FUNCTION: Process Targets Auras (Buffs)
--
function Natur_ReadTargetDebuffs()
	-- get the guid of this target.
	local guid = UnitGUID("target");
	Natur_RemoveTargetDebuffs();
	if(guid and Natur_AccountOptions[42]) then	-- only if we have something selected and want to show them		
		-- target first
		local factionType,_ = UnitFactionGroup("target");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("target",i)
			if(isMine) then
				if(isMine == "player" or Natur_AccountOptions[130]) then
					if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
						local timeLeft = expirationTime - GetTime();
						NaturTargetDebuffsGroup:SetInvert(false);
						local numStacks = 0;
						-- got some stacks to show?
						if(count > 0) then numStacks = " ("..count..")";
						else numStacks = ""; end;
						if(Natur_AccountOptions[2]) then	-- are we split?
							-- we are split up, sent to the correct groups.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[82]) then
								NaturTargetDebuffsGroup:RegisterBar(name.."TargetDebuff", name..numStacks, timeLeft, duration, icon, Natur_FTarget); 
								tinsert(Natur_TargetDebuffs, {name, name.."TargetDebuff", "Friendly", "Target", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[42]) then
								NaturTargetDebuffsGroup:RegisterBar(name.."TargetDebuff", name..numStacks, timeLeft, duration, icon, Natur_HTarget); 
								tinsert(Natur_TargetDebuffs, {name, name.."TargetDebuff", "Hostile", "Target", guid});
							end;
						else
							-- grouped up, send to the primary group.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[82]) then
								NaturPrimaryGroup:RegisterBar(name.."TargetDebuff", name..numStacks, timeLeft, duration, icon, Natur_FTarget); 
								tinsert(Natur_TargetDebuffs, {name, name.."TargetDebuff", "Friendly", "Target", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[42]) then
								NaturPrimaryGroup:RegisterBar(name.."TargetDebuff", name..numStacks, timeLeft, duration, icon, Natur_HTarget); 
								tinsert(Natur_TargetDebuffs, {name, name.."TargetDebuff", "Hostile", "Target", guid});
							end;
						end;	-- end of else
					end;	-- end of ignore check
				end;	-- end of isMine player check
			end;	-- end of isMine
		end;	-- end of for loop
	end;
	-- now check if i have something in focus
	guid = UnitGUID("focus");
	if(guid and Natur_AccountOptions[42]) then
		local factionType,_ = UnitFactionGroup("focus");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("focus",i)
			if(isMine) then
				if(isMine == "player" or Natur_AccountOptions[130]) then
					if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
						local timeLeft = expirationTime - GetTime();
						NaturTargetDebuffsGroup:SetInvert(false);
						local numStacks = 0;
						-- got some stacks to show?
						if(count > 0) then numStacks = " ("..count..")";
						else numStacks = ""; end;
						if(Natur_AccountOptions[2]) then	-- are we split?
							-- we are split up, send to the correct groups.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[82]) then
								NaturTargetDebuffsGroup:RegisterBar(name.."FocusDebuff", name..numStacks, timeLeft, duration, icon, Natur_FFocus); 
								tinsert(Natur_TargetDebuffs, {name, name.."FocusDebuff", "Friendly", "focus", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[42]) then
								NaturTargetDebuffsGroup:RegisterBar(name.."FocusDebuff", name..numStacks, timeLeft, duration, icon, Natur_HFocus); 
								tinsert(Natur_TargetDebuffs, {name, name.."FocusDebuff", "Hostile", "focus", guid});
							end;
						else
							-- grouped up, send to the primary group.
							NaturPrimaryGroup:SetInvert(false);
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[82]) then
								NaturPrimaryGroup:RegisterBar(name.."FocusDebuff", name..numStacks, timeLeft, duration, icon, Natur_FFocus); 
								tinsert(Natur_TargetDebuffs, {name, name.."FocusDebuff", "Friendly", "focus", guid});
							elseif(Natur_AccountOptions[42]) then
								NaturPrimaryGroup:RegisterBar(name.."FocusDebuff", name..numStacks, timeLeft, duration, icon, Natur_HFocus); 
								tinsert(Natur_TargetDebuffs, {name, name.."FocusDebuff", "Hostile", "focus", guid});
							end;
						end;	-- end of else
					end;	-- end of ignore check
				end;	-- end of isMine player check
			end;	-- end of isMine
		end;	-- end of for loop
	end;	-- if guid
	
	-- we may have switched targets so update my debuffs
	Natur_ReadPlayerDebuffs();	
end;


--
--	Read players debuffs.
--
function Natur_ReadPlayerDebuffs()
	-- want to show players debuffs?
	if(Natur_AccountOptions[114]) then   
		guid = UnitGUID("player");
		local factionType,_ = UnitFactionGroup("player");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitDebuff("player",i)
			if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
				local timeLeft = expirationTime - GetTime();
				NaturTargetDebuffsGroup:SetInvert(false);
				local numStacks = 0;
				-- got some stacks to show?
				if(count >= 1) then numStacks = " ("..count..")";
				else numStacks = ""; end;
				if(Natur_AccountOptions[2]) then	-- are we split?
					-- we are split up, sent to the correct groups.
					if(Natur_AccountOptions[114]) then
						NaturPlayersDebuffsGroup:RegisterBar(name.."PlayerDebuff", name..numStacks.."  (Player)", timeLeft, duration, icon, Natur_PlayerIcon); 
						tinsert(Natur_TargetDebuffs, {name, name.."PlayerDebuff", "Friendly", "player", guid});
					end;
				else
					-- grouped up, send to the primary group.
					NaturPrimaryGroup:SetInvert(false);
					if(Natur_AccountOptions[114]) then
						NaturPrimaryGroup:RegisterBar(name.."PlayerDebuff", name..numStacks.."  (Player)", timeLeft, duration, icon, Natur_PlayerIcon); 
						tinsert(Natur_TargetDebuffs, {name, name.."PlayerDebuff", "Friendly", "player", guid});
					end;
				end;
			end;
		end;
	end;	
end;


--
--	Cycle through and remove all buffs.
--
function Natur_RemoveTargetDebuffs()
	for count,value in ipairs(Natur_TargetDebuffs) do
		if(Natur_AccountOptions[2]) then 
			NaturTargetDebuffsGroup:UnregisterBar(value[2]);
		else 
			NaturPrimaryGroup:UnregisterBar(value[2]);
		end;
	end;
	-- now clear the table.
	for i in pairs(Natur_TargetDebuffs) do Natur_TargetDebuffs[i] = nil end;
end;


--
--	DEBUG: Cycle through and list any debuffs in the table
--
function Natur_DebugTargetDebuffs()
	for count,value in ipairs(Natur_TargetDebuffs) do
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Debug : |cffffffff"..value[1]..", "..value[4]);
	end;
end;

