
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
--	Initialise Group for Buffs (gains)
--	
function Natur_InitialiseTargetBuffs()
	-- initialise the castbar group
	NaturTargetBuffsGroup = NaturLib:RegisterGroup(TF_GAINS_TITLE, Natur_Textures[Natur_AccountOptions[28]]);
	NaturTargetBuffsGroup:RegisterOnMove("Natur_TargetBuffsOnBarMove");
	NaturTargetBuffsGroup:SetInvert(true);					
	NaturTargetBuffsGroup:SetScale(1.0);
	NaturTargetBuffsGroup:SetMaxBars(Natur_AccountOptions[29]);
	NaturTargetBuffsGroup:SetWidth(Natur_AccountOptions[27]);
	NaturTargetBuffsGroup:SetHeight(Natur_AccountOptions[26]);
	NaturTargetBuffsGroup:SetDisplayGroup("");
	NaturTargetBuffsGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturTargetBuffsGroup:SetBarGrowth(Natur_AccountOptions[25]);	
	NaturTargetBuffsGroup:SetGroupFontSize(Natur_AccountOptions[31]);	
	NaturTargetBuffsGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[23], Natur_AccountOptions[24])
end;
-- supporting function to save position.
function Natur_TargetBuffsOnBarMove(parent, x, y)
	Natur_AccountOptions[23] = x
	Natur_AccountOptions[24] = y
end;


--
--	Initialise Group for Player Buffs (gains)
--	
function Natur_InitialisePlayersBuffs()
	-- initialise the castbar group
	NaturPlayersBuffsGroup = NaturLib:RegisterGroup(PLR_GAINS_TITLE, Natur_Textures[Natur_AccountOptions[98]]);
	NaturPlayersBuffsGroup:RegisterOnMove("Natur_PlayerBuffsOnBarMove");
	NaturPlayersBuffsGroup:SetInvert(true);					
	NaturPlayersBuffsGroup:SetScale(1.0);
	NaturPlayersBuffsGroup:SetMaxBars(Natur_AccountOptions[99]);
	NaturPlayersBuffsGroup:SetWidth(Natur_AccountOptions[97]);
	NaturPlayersBuffsGroup:SetHeight(Natur_AccountOptions[96]);
	NaturPlayersBuffsGroup:SetDisplayGroup("");
	NaturPlayersBuffsGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturPlayersBuffsGroup:SetBarGrowth(Natur_AccountOptions[95]);	
	NaturPlayersBuffsGroup:SetGroupFontSize(Natur_AccountOptions[101]);	
	NaturPlayersBuffsGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[93], Natur_AccountOptions[94])
end;
-- supporting function to save position.
function Natur_PlayerBuffsOnBarMove(parent, x, y)
	Natur_AccountOptions[93] = x
	Natur_AccountOptions[94] = y
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

Natur_TargetBuffs = {};		-- store info of bars.

--
--	PUBLIC FUNCTION: Process Targets Auras (Buffs)
--
function Natur_ReadTargetBuffs()
	-- get the guid of this target.
	local guid = UnitGUID("target");
	Natur_RemoveTargetBuffs();
	if(guid and Natur_AccountOptions[32]) then	-- only if we have something selected and want to show them		
		-- target first
		local factionType,_ = UnitFactionGroup("target");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitBuff("target",i)
			if(isMine) then
				if(isMine == "player" or Natur_AccountOptions[130]) then
					if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
						-- do i only want to buffs by me?
						local timeLeft = expirationTime - GetTime();
						NaturTargetBuffsGroup:SetInvert(false);
						local numStacks = 0;
						-- got some stacks to show?
						if(count >= 1) then numStacks = " ("..count..")";
						else numStacks = ""; end;
						if(Natur_AccountOptions[2]) then	-- are we split?
							-- we are split up, sent to the correct groups.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[72]) then
								NaturTargetBuffsGroup:RegisterBar(name.."TargetBuff", name..numStacks, timeLeft, duration, icon, Natur_FTarget); 
								tinsert(Natur_TargetBuffs, {name, name.."TargetBuff", "Friendly", "Target", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[32]) then
								NaturTargetBuffsGroup:RegisterBar(name.."TargetBuff", name..numStacks, timeLeft, duration, icon, Natur_HTarget); 
								tinsert(Natur_TargetBuffs, {name, name.."TargetBuff", "Hostile", "Target", guid});
							end;
						else						
							-- grouped up, send to the primary group.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[72]) then
								NaturPrimaryGroup:RegisterBar(name.."TargetBuff", name..numStacks, timeLeft, duration, icon, Natur_FTarget); 
								tinsert(Natur_TargetBuffs, {name, name.."TargetBuff", "Friendly", "Target", guid});
							elseif(Natur_AccountOptions[32]) then
								NaturPrimaryGroup:RegisterBar(name.."TargetBuff", name..numStacks, timeLeft, duration, icon, Natur_HTarget); 
								tinsert(Natur_TargetBuffs, {name, name.."TargetBuff", "Hostile", "Target", guid});
							end;
						end;	-- end of else
					end;	-- end of ignore check
				end;	-- end of isMine (my cast check)
			end;	-- end of IsMine nil check
		end;	-- end of for loop
	end;	-- end guid check
	
	-- now check if i have something in focus
	guid = UnitGUID("focus");
	if(guid and Natur_AccountOptions[32]) then	-- only if we have something selected and want to show them		
		local factionType,_ = UnitFactionGroup("focus");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitBuff("focus",i)
			if(isMine) then
				if(isMine == "player" or Natur_AccountOptions[130]) then
					if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
						local timeLeft = expirationTime - GetTime();
						NaturTargetBuffsGroup:SetInvert(false);
						local numStacks = 0;
						-- got some stacks to show?
						if(count >= 1) then numStacks = " ("..count..")";
						else numStacks = ""; end;
						if(Natur_AccountOptions[2]) then	-- are we split?
							-- we are split up, sent to the correct groups.
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[72]) then
								NaturTargetBuffsGroup:RegisterBar(name.."FocusBuff", name..numStacks, timeLeft, duration, icon, Natur_FFocus); 
								tinsert(Natur_TargetBuffs, {name, name.."FocusBuff", "Friendly", "focus", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[32]) then
								NaturTargetBuffsGroup:RegisterBar(name.."FocusBuff", name..numStacks, timeLeft, duration, icon, Natur_HFocus); 
								tinsert(Natur_TargetBuffs, {name, name.."FocusBuff", "Hostile", "focus", guid});
							end;
						else
							-- grouped up, send to the primary group.
							NaturPrimaryGroup:SetInvert(false);
							if(factionType == Natur_PlayersFaction and Natur_AccountOptions[72]) then
								NaturPrimaryGroup:RegisterBar(name.."FocusBuff", name..numStacks, timeLeft, duration, icon, Natur_FFocus); 
								tinsert(Natur_TargetBuffs, {name, name.."FocusBuff", "Friendly", "focus", guid});
							elseif(not(factionType == Natur_PlayersFaction) and Natur_AccountOptions[32]) then
								NaturPrimaryGroup:RegisterBar(name.."FocusBuff", name..numStacks, timeLeft, duration, icon, Natur_HFocus); 
								tinsert(Natur_TargetBuffs, {name, name.."FocusBuff", "Hostile", "focus", guid});
							end;
						end;	-- end of else
					end;	-- end of ignore check	
				end;	-- end of isMine player check.
			end;	-- end of IsMine nil
		end;	-- end of for
	end;	-- end of guid check
	
	-- because its possible ive switched targets then i need
	-- to re-read my player buffs if its switched on!
	Natur_ReadPlayerBuffs();	
end;


--
--	Read players buffs.
--
function Natur_ReadPlayerBuffs()
	-- want to show players buffs?
	if(Natur_AccountOptions[114]) then   
		guid = UnitGUID("player");
		local factionType,_ = UnitFactionGroup("player");
		for i=1,40 do 
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitBuff("player",i)
			if(isMine) then
				if(isMine == "player" or Natur_AccountOptions[130]) then
					if(name and duration > 0 and not(Natur_CheckIgnoredAbility(name))) then
						local timeLeft = expirationTime - GetTime();
						NaturTargetBuffsGroup:SetInvert(false);
						local numStacks = 0;
						-- got some stacks to show?
						if(count >= 1) then numStacks = " ("..count..")";
						else numStacks = ""; end;
						if(Natur_AccountOptions[2]) then	-- are we split?
							-- we are split up, sent to the correct groups.
							if(Natur_AccountOptions[114]) then
								NaturPlayersBuffsGroup:RegisterBar(name.."PlayerBuff", name..numStacks.."  (Player)", timeLeft, duration, icon, Natur_PlayerIcon); 
								tinsert(Natur_TargetBuffs, {name, name.."PlayerBuff", "Friendly", "player", guid});
							end;
						else
							-- grouped up, send to the primary group.
							NaturPrimaryGroup:SetInvert(false);
							if(Natur_AccountOptions[114]) then
								NaturPrimaryGroup:RegisterBar(name.."PlayerBuff", name..numStacks.."  (Player)", timeLeft, duration, icon, Natur_PlayerIcon); 
								tinsert(Natur_TargetBuffs, {name, name.."PlayerBuff", "Friendly", "player", guid});
							end;
						end;	-- end of else
					end;	-- end of ignore test
				end;	-- isMine player check.
			end;	-- end of isMine
		end;	-- end of loop
	end;	-- end of if test
end;

--
--	Cycle through and remove all buffs.
--
function Natur_RemoveTargetBuffs()
	-- clear the bars.
	for count,value in ipairs(Natur_TargetBuffs) do
		if(Natur_AccountOptions[2]) then 
			NaturTargetBuffsGroup:UnregisterBar(value[2]);
		else NaturPrimaryGroup:UnregisterBar(value[2]); end;
	end;
	-- now remove the entries.
	for i in pairs(Natur_TargetBuffs) do Natur_TargetBuffs[i] = nil end;
end;


--
--	DEBUG: Cycle through and list any buffs in the table
--
function Natur_DebugTargetBuffs()
	for count,value in ipairs(Natur_TargetBuffs) do
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Debug : |cffffffff"..value[1]..", "..value[4]);
	end;
end;