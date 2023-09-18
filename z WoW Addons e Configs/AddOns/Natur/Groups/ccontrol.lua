
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


Natur_CCMonitoredTargets = {};

--
--	Log a cc ive cast
--
function Natur_LogCCTarget(mobsid, mobsname, casterid, castername, firetime, spellname)
	-- cleanup any old expired shit.
	Natur_CleanupCCTargets();
	Natur_DeleteCCTarget(mobsid, spellname);	-- if it exists already, delete it.
	tinsert(Natur_CCMonitoredTargets, {mobsid, mobsname, casterid, castername, firetime, spellname});
end;

--
--	Announce a target has broken
--
function Natur_AnnounceCCTarget(mobsid, spellname)
	for count,value in ipairs(Natur_CCMonitoredTargets) do
		if(value[1] == mobsid and value[6] == spellname) then
			tremove(Natur_CCMonitoredTargets, count);		-- remove it.
			Natur_SetPartyStatus();
			local msg = string.format(NATUR_BREAK_NORMAL, value[6], value[2]);
			if(not(Natur_ChatDestination == 0)) then SendChatMessage(msg, Natur_ChatDestination); end;
			if(Natur_AccountOptions[117]) then PlaySoundFile(Natur_CCBreakSound); end;
			if(Natur_AccountOptions[118]) then Natur_UIFlash(); end;
			return(true);	-- ive announced.
		end;
	end;
	return(false);			-- not found.	
end;

--
--	Remove Expired (simple cleanup if mobs out of range)
--
function Natur_CleanupCCTargets()
	for count,value in ipairs(Natur_CCMonitoredTargets) do
		local castTime = value[5];
		local timeNow = GetTime();
		local totaDur = timeNow - castTime;
		if(totaDur > 300) then		-- 5 mins.	
			tremove(Natur_CCMonitoredTargets, count);
		end;
	end;
end;

--
--	Remove a CC Entry
--
function Natur_DeleteCCTarget(mobsid, spellname)
	for count,value in ipairs(Natur_CCMonitoredTargets) do
		if(value[1] == mobsid and value[6] == spellname) then
			tremove(Natur_CCMonitoredTargets, count);
			return(true);
		end;
	end;
	return(false);
end;
