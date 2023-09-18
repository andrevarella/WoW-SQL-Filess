
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



Natur_QuakeSND = {
	-- Male
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\dominating.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\firstblood.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\godlike.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\killingspree.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\monsterkill.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Male\\unstoppable.mp3",
	-- Female
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\dominating.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\firstblood.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\godlike.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\killingspree.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\monsterkill.mp3",
	"Interface\\AddOns\\Natur\\Sounds\\Quake\\Female\\unstoppable.mp3"
};

-- other sounds.    
Natur_SpellImmuneSND = "Interface\\AddOns\\Natur\\Sounds\\Other\\immune.mp3";
Natur_CCBreakSound = "Interface\\AddOns\\Natur\\Sounds\\Other\\ccbreak.mp3";
Natur_MenuClickSound = "Interface\\AddOns\\Natur\\Sounds\\Other\\menuclick.mp3";
Natur_RogueWarnSound = "Interface\\AddOns\\Natur\\Sounds\\Other\\rogue.mp3";				
Natur_FinishHim = "Interface\\AddOns\\Natur\\Sounds\\Other\\finish-him.mp3";				
Natur_FinishHer = "Interface\\AddOns\\Natur\\Sounds\\Other\\finish-her.mp3";
Natur_GetOverHere = "Interface\\AddOns\\Natur\\Sounds\\Other\\getoverhere.mp3";
Natur_ComeHere = "Interface\\AddOns\\Natur\\Sounds\\Other\\comehere.mp3";
Natur_PlayerBuffLost = "Interface\\AddOns\\Natur\\Sounds\\Other\\bufflost.mp3";
				
--Natur_PaladinBubble = "Interface\\AddOns\\Natur\\Sounds\\Other\\laugh.mp3";					-- future use


--
--		$title:			Natur_FunPVPSounds()
--		$purpose:		Play a fun quake sound depending on duration
--						of your last kill(s).
--		$args:			guid of mob im attacking
--		$returns:		None
--
function Natur_QuakeSounds(guid)
	-- male or female?
	if(Natur_AccountOptions[128] == "Female") then Natur_SndOffset = 6; 
	else Natur_SndOffset = 0; end;
	-- check if its mine, trivial (ie. gives me honor or xp) and is a player
	-- unless we want to play sounds on normal mobs.  Sounds will advance if
	-- i kill a second target within a 60 sec time period.
	if(UnitGUID("target") == guid and not UnitIsTrivial("target") and UnitIsPlayer("target") and Natur_AccountOptions[127]
	or UnitGUID("target") == guid and not UnitIsTrivial("target") and Natur_AccountOptions[117] and Natur_AccountOptions[129]) then
		if (not Natur_killing_timer or (GetTime() - Natur_killing_timer >= 60) ) then
			PlaySoundFile(Natur_QuakeSND[2+Natur_SndOffset]);
			Natur_killing_counter = 0;
		else
			Natur_killing_counter = Natur_killing_counter + 1;
			if (Natur_killing_counter == 1) then
				PlaySoundFile(Natur_QuakeSND[1+Natur_SndOffset]);
			elseif (Natur_killing_counter == 2) then
				PlaySoundFile(Natur_QuakeSND[4+Natur_SndOffset]);
			elseif (Natur_killing_counter == 3) then
				PlaySoundFile(Natur_QuakeSND[6+Natur_SndOffset]);
			elseif (Natur_killing_counter == 4) then
				PlaySoundFile(Natur_QuakeSND[5+Natur_SndOffset]);
			elseif (Natur_killing_counter > 4) then
				PlaySoundFile(Natur_QuakeSND[3+Natur_SndOffset]);
			end;		
		end;
		Natur_killing_timer = GetTime();
	end;
end;


--
--		$title:			Natur_ProcessCombo()
--		$purpose:		Play a fun mortal kombat 'finish him/her' sound
--						on 5/5 combo points.
--		$args:			None
--		$returns:		None
--
Natur_LastFinishSnd = nil;
function Natur_ProcessCombo()
	-- read combo points on player (always for other parts of the addon).
	Natur_PlayerCombos = GetComboPoints("player");
	if(Natur_AccountOptions[134]) then	-- want the sound when i get max combo?
		-- only play if my target is a player?
		if(UnitIsPlayer("target") or Natur_AccountOptions[135]) then
			if(Natur_PlayerCombos == 5 and not(Natur_LastFinishSnd)) then
				-- we've got full combo points on this target.
				Natur_LastFinishSnd = UnitGUID("target");
				-- need to check sex here and play correct sound
				local targetSex = UnitSex("target");
				if(targetSex == 3) then		-- is target a female?
					PlaySoundFile(Natur_FinishHer);
				else						-- nope male or unknown
					PlaySoundFile(Natur_FinishHim);
				end;
			else
				Natur_LastFinishSnd = nil;
			end;
		end;
	end;
end;
