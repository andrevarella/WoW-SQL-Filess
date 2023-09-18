

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
--	Initialise the Primary Group.  This group is used when not in split
--	mode and has all the different timers grouped together.
--	
function Natur_InitialisePrimaryGroup()
	-- initialise the castbar group
	NaturPrimaryGroup = NaturLib:RegisterGroup(PRIMARY_GROUP_TITLE, Natur_Textures[Natur_AccountOptions[8]]);
	NaturPrimaryGroup:RegisterOnMove("Natur_PrimaryOnBarMove");
	NaturPrimaryGroup:SetInvert(true);					
	NaturPrimaryGroup:SetScale(1.0);
	NaturPrimaryGroup:SetMaxBars(Natur_AccountOptions[9]);
	NaturPrimaryGroup:SetWidth(Natur_AccountOptions[7]);
	NaturPrimaryGroup:SetHeight(Natur_AccountOptions[6]);
	NaturPrimaryGroup:SetDisplayGroup("");
	NaturPrimaryGroup:SetAnchorVisible(Natur_AccountOptions[1]);
	NaturPrimaryGroup:SetBarGrowth(Natur_AccountOptions[5]);	
	NaturPrimaryGroup:SetGroupFontSize(Natur_AccountOptions[11]);	
	NaturPrimaryGroup:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Natur_AccountOptions[3], Natur_AccountOptions[4])
end;
-- supporting function to save position.
function Natur_PrimaryOnBarMove(parent, x, y)
	Natur_AccountOptions[3] = x
	Natur_AccountOptions[4] = y
end;