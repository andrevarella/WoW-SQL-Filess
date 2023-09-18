

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



function Natur_InitialiseDiminishGroup()
	-- initialise the castbar group
	NaturDiminishGroup = NaturLib:RegisterGroup(DIMINISH_RETURNS_TITLE, Natur_Textures[Natur_AccountOptions[88]]);
	NaturDiminishGroup:RegisterOnMove("Natur_DiminishOnBarMove");
	NaturDiminishGroup:SetInvert(true);					
	NaturDiminishGroup:SetScale(1.0);
	NaturDiminishGroup:SetMaxBars(Natur_AccountOptions[89]);
	NaturDiminishGroup:SetWidth(Natur_AccountOptions[87]);
	NaturDiminishGroup:SetHeight(Natur_AccountOptions[86]);
	NaturDiminishGroup:SetDisplayGroup("");
	NaturDiminishGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturDiminishGroup:SetBarGrowth(Natur_AccountOptions[85]);	
	NaturDiminishGroup:SetGroupFontSize(Natur_AccountOptions[91]);	
	NaturDiminishGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[83], Natur_AccountOptions[84])
end;
-- supporting function to save position.
function Natur_DiminishOnBarMove(parent, x, y)
	Natur_AccountOptions[83] = x
	Natur_AccountOptions[84] = y
end;


-- ================================================= --
-- ===        DIMINISH RETURNS FUNCTIONS         === --
-- ================================================= --

-- Diminish returns functions calculate duration of
-- a cc spell such as polymorph on a player in pvp..
-- for example, in a 18 sec period if you sheep the
-- following applies:

-- First:		10 sec.
-- Second:		5 sec
-- Third:		2.5 sec
-- Fourth:		Immune.

-- DR TABLE
--
--	1..	mobs_id
--	2..	mobs_name
--	3..	fire_time
--	4..	icon
--	5..	faction (horde/alliance)
--	6..	caster
--	7.. spell_id
--	8..	spell_name

-- mobs_id, mobs_name, fire_time, duration, icon
Natur_DRTracking = {};	-- mobs tracked for DR


--
--	Add/Modify an existing DR
--
function Natur_TrackDR(mobs_id, mobs_name, icon, faction, caster, spellid, spellname)
	if(not(Natur_DoesDRExist(mobs_id, spellid))) then
		tinsert(Natur_DRTracking, {mobs_id, mobs_name, GetTime(), icon, faction, caster, spellid, spellname});
	end;
	return(duration);
end;


--
--	Show a DR expire timer.
--
function Natur_StartExpireTimer(mobs_id)
	for count,value in ipairs(Natur_DRTracking) do
		if(value[1]==mobs_id) then
			-- this is in my DR list so create a DR expire timer.
			value[3] = GetTime();				-- update its time of dr fire
			if(Natur_AccountOptions[92]) then	-- do we want these dr timers shown?
				-- where are we sending the timer?
				if(Natur_AccountOptions[2]) then
					-- we are split so send to its own group.
					NaturDiminishGroup:SetInvert(false);
					if(value[5] == "Hostile") then
						NaturDiminishGroup:RegisterBar(value[1], value[6].."->"..value[2].." ("..value[8]..")", 18, 18, value[4], Natur_DRHostile);
					elseif(value[5] == "Friendly") then
						NaturDiminishGroup:RegisterBar(value[1], value[6].."->"..value[2].." ("..value[8]..")", 18, 18, value[4], Natur_DRFriendly);
					end;
					-- its fired, remove it.
					tremove(Natur_DRTracking, count);
				else
					-- we are grouped up into the primary group.
					NaturPrimaryGroup:SetInvert(false);
					if(value[5] == "Hostile") then
						NaturPrimaryGroup:RegisterBar(value[1], value[6].."->"..value[2].." ("..value[8]..")", 18, 18, value[4], Natur_DRHostile);
					elseif(value[5] == "Friendly") then
						NaturPrimaryGroup:RegisterBar(value[1], value[6].."->"..value[2].." ("..value[8]..")", 18, 18, value[4], Natur_DRFriendly);
					end;	
					-- its fired, remove it.
					tremove(Natur_DRTracking, count);				
				end;
			end;
		end;
	end;
end;

--
--	Remove a DR for something that dies, just keeps things tidy  =p
--
function Natur_RemoveDeadDR(mobs_id)
	for count,value in ipairs(Natur_DRTracking) do
		if(value[1]==mobs_id) then
			if(Natur_AccountOptions[2]) then	-- are we split up?
				-- yes we are on our own bar.
				NaturDiminishGroup:UnregisterBar(mobs_id);
			else
				-- on primary group so remove it from here.
				NaturPrimaryGroup:UnregisterBar(mobs_id);
			end;
			tremove(Natur_DRTracking, count);
		end;
	end;
end;


--
--	Does a DR already exist and being tracked.
--
function Natur_DoesDRExist(mobsid, spellid)
	for count,value in ipairs(Natur_DRTracking) do
		if(value[1]==mobsid and value[7] == spellid) then
			return(true);
		end;
	end;
	return(false);
end;