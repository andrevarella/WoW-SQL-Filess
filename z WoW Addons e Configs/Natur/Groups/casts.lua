
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
--	Initialise Group for Hostile Casts.  This group is used to show
--	the remaining duration on enemy casts such as frost bolt.
--	
function Natur_InitialiseHostileCasts()
	-- initialise the castbar group
	NaturHostileCastGroup = NaturLib:RegisterGroup(HOSTILE_CASTS_TITLE, Natur_Textures[Natur_AccountOptions[18]]);
	NaturHostileCastGroup:RegisterOnMove("Natur_HostileCastsOnBarMove");
	NaturHostileCastGroup:SetInvert(true);					
	NaturHostileCastGroup:SetScale(1.0);
	NaturHostileCastGroup:SetMaxBars(Natur_AccountOptions[19]);
	NaturHostileCastGroup:SetWidth(Natur_AccountOptions[17]);
	NaturHostileCastGroup:SetHeight(Natur_AccountOptions[16]);
	NaturHostileCastGroup:SetDisplayGroup("");
	NaturHostileCastGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturHostileCastGroup:SetBarGrowth(Natur_AccountOptions[15]);	
	NaturHostileCastGroup:SetGroupFontSize(Natur_AccountOptions[21]);	
	NaturHostileCastGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[13], Natur_AccountOptions[14])
end;
-- supporting function to save position.
function Natur_HostileCastsOnBarMove(parent, x, y)
	Natur_AccountOptions[13] = x
	Natur_AccountOptions[14] = y
end;


--
--	Initialise Group for Friendly Casts.  This group is used to show
--	the remaining duration on friendly casts such as frost bolt.
--	
function Natur_InitialiseFriendlyCasts()
	-- initialise the castbar group
	NaturFriendlyCastGroup = NaturLib:RegisterGroup(FRIENDLY_CASTS_TITLE, Natur_Textures[Natur_AccountOptions[58]]);
	NaturFriendlyCastGroup:RegisterOnMove("Natur_FriendlyCastsOnBarMove");
	NaturFriendlyCastGroup:SetInvert(true);					
	NaturFriendlyCastGroup:SetScale(1.0);
	NaturFriendlyCastGroup:SetMaxBars(Natur_AccountOptions[59]);
	NaturFriendlyCastGroup:SetWidth(Natur_AccountOptions[57]);
	NaturFriendlyCastGroup:SetHeight(Natur_AccountOptions[56]);
	NaturFriendlyCastGroup:SetDisplayGroup("");
	NaturFriendlyCastGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturFriendlyCastGroup:SetBarGrowth(Natur_AccountOptions[55]);	
	NaturFriendlyCastGroup:SetGroupFontSize(Natur_AccountOptions[61]);	
	NaturFriendlyCastGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[53], Natur_AccountOptions[54])
end;
-- supporting function to save position.
function Natur_FriendlyCastsOnBarMove(parent, x, y)
	Natur_AccountOptions[53] = x
	Natur_AccountOptions[54] = y
end;



-- ========================================= --
-- ===      CAST TRACKING FUNCTIONS      === --
-- ========================================= --

--
--	TABLE DETAILS
-- 
--	1..		fired time
--	2..		casters guid
--	3..		casters name
--	4..		spells id
--	5..		spells name
--	6..		spells icon
--	7..		duration of cast
--	8..		barid
--	9..		hostile?
--	10..	target/focus
--

-- Casting targets storage.
Natur_CastingMobs = {};


--
--	Add Cast for tracking.
--
function Natur_AddCastTracking(fire_time, caster_id, caster_name, caster_flags, spell_id, spell_name, bar_id, target)
	-- remove anything that was expired.
	Natur_RemoveExpiredCasts();
	if(caster_name) then caster_name = Natur_StripServer(caster_name); end;
	local _,_, icon,_,_,_, castTime,_,_ = GetSpellInfo(spell_id);
	local isHostile = false;
	if (CombatLog_Object_IsA(caster_flags, COMBATLOG_FILTER_HOSTILE_PLAYERS) or CombatLog_Object_IsA(caster_flags, COMBATLOG_FILTER_HOSTILE_UNITS)) then isHostile = true;
	else isHostile = false; end;
	tinsert(Natur_CastingMobs, {fire_time, caster_id, caster_name, spell_id, spell_name, icon, castTime/1000, bar_id, isHostile, target});
	return icon, castTime/1000, isHostile;
end;

--
--	Show a tracked cast (called by target change)
--
function Natur_ShowCastTracking(caster_id)
	-- clear out any old shit
	Natur_RemoveExpiredCasts();
	if(caster_id) then
		for count,value in ipairs(Natur_CastingMobs) do
			if(value[2] == caster_id) then
				-- calculate time remaining since it was fired =p
				-- show the timer and the target icon since im obviously have it
				-- as my target or i wouldnt be here  =p
				local remainingTime = tonumber(value[7]) - (GetTime() - tonumber(value[1]));
				-- where we sending this bar?
				if(Natur_AccountOptions[2]) then	-- we are split mode.
					if(value[9]) then	-- im hostile!
						if(Natur_AccountOptions[22]) then NaturHostileCastGroup:RegisterBar(value[8], value[5].." ("..value[3]..")", remainingTime, tonumber(value[7]), value[6], Natur_HTarget);	end;
					else				
						if(Natur_AccountOptions[62]) then NaturFriendlyCastGroup:RegisterBar(value[8], value[5].." ("..value[3]..")", remainingTime, tonumber(value[7]), value[6], Natur_FTarget); end;	
					end;
				else
					-- group mode so we need to send these bars to the primary group only.
					if(value[9]) then	-- im hostile
						if(Natur_AccountOptions[22]) then NaturPrimaryGroup:RegisterBar(value[8], value[5].." ("..value[3]..")", remainingTime, tonumber(value[7]), value[6], Natur_HTarget); end;
					else
						if(Natur_AccountOptions[62]) then NaturPrimaryGroup:RegisterBar(value[8], value[5].." ("..value[3]..")", remainingTime, tonumber(value[7]), value[6], Natur_FTarget); end;
					end;
				end;
			else
				-- not the one i want therefore it shouldnt be shown. clear it.
				if(Natur_AccountOptions[2]) then	-- we are split mode.
					-- split mode.
					if(Natur_AccountOptions[22]) then NaturHostileCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
					if(Natur_AccountOptions[62]) then NaturFriendlyCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
				else
					-- grouped up so we only need to worry about the primary
					-- group when removing any unwanted bars.
					NaturPrimaryGroup:UnregisterBar(value[8]);
				end;
			end;
		end;
	else
		-- caster id was nil... i.e. im not selecting nothing therefore
		-- remove any "in progress" casts.
		Natur_RemoveAllCasts();
	end;
end;

--
--	Cycle through and delete any expired casts
--
function Natur_RemoveExpiredCasts()
	for count,value in ipairs(Natur_CastingMobs) do
		local castTime = value[1];
		local timeNow = GetTime();
		local totaDur = timeNow - castTime;
		if(totaDur > (value[7]+2)) then	
			tremove(Natur_CastingMobs, count);
		end;
	end;
end;


--
--	Remove casts for a dead target. i.e. in middle of casting
--	and i pwned their arse.
--
function Natur_RemoveDeadCasts(mobsid)
	for count,value in ipairs(Natur_CastingMobs) do
		if(value[2] == mobsid) then
			if(Natur_AccountOptions[2]) then	-- we are split mode.
				-- split mode.
				if(Natur_AccountOptions[22]) then NaturHostileCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
				if(Natur_AccountOptions[62]) then NaturFriendlyCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
			else
				-- grouped up so we only need to worry about the primary
				-- group when removing any unwanted bars.
				NaturPrimaryGroup:UnregisterBar(value[8]);
			end;
			tremove(Natur_CastingMobs, count);
		end;
	end;
end;

--
--	Remove any casting bars 
--	Called by Natur_ShowCastTracking() when no target is selected
--
function Natur_RemoveAllCasts()
	for count,value in ipairs(Natur_CastingMobs) do
		-- just want to remove the bar, and not the entry
		-- incase we go back to that mob who is still doing
		-- a cast.  =p
		if(Natur_AccountOptions[2]) then	-- we are split mode.
			-- split mode.
			if(Natur_AccountOptions[22]) then NaturHostileCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
			if(Natur_AccountOptions[62]) then NaturFriendlyCastGroup:UnregisterBar(value[8]); end;		-- bugfix 11jan08 mik
		else
			-- grouped up so we only need to worry about the primary
			-- group when removing any unwanted bars.
			NaturPrimaryGroup:UnregisterBar(value[8]);
		end;
	end;
end;

--
--	DEBUG: Cycle through and list any casts in the table
--
function Natur_DebugTargetCasts()
	for count,value in ipairs(Natur_CastingMobs) do
		DEFAULT_CHAT_FRAME:AddMessage("|cff00e0ffNatur Debug : |cffffffff"..value[3]..", "..value[5]);
	end;
end;