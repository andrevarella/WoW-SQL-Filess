local UnitEntry = 45432
local itemVIP = 61000
local itemVIPeterno = 61001

local function druidMorphHello2(event, player, creature)
    player:GossipSetText(string.format(" "))
    if (player:HasItem(itemVIP) == false and player:HasItem(itemVIPeterno) == false) then
		player:SendBroadcastMessage("Você precisa do Livro Vip para usar esse NPC.")
		return player:GossipComplete()
	else
		player:LearnSpell(83384) -- Spell necessaria para poder castar RemoveAura/AddAura OnLogin (só pessoas com o livro VIP)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:29|t Cat Form", 0, 1)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:29|t Bear Form", 0, 2)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:29|t Travel Form", 0, 3)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:29|t Moonkin Form", 0, 4)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:29|t Aquatic Form", 0, 5)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:29|t Tree Form", 0, 6)
		--player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:29|t Flight Form", 0, 7)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_WhiteDireWolf.png:29|t Ghost Wolf", 0, 8)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
end

function druidMorph_Select(event, player, creature, sender, intid, code)

	-- Cat Form
    if(intid == 1) then
        player:GossipSetText(string.format(" "))
        if not player:HasAura(768) then
            player:SendBroadcastMessage("You are not in Cat form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Fire Cat", 0, 50208)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat", 0, 50207)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat HD", 0, 50774)
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Night Elf - Cat Forms", 0, 29)
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Night Elf - Armored Cat Forms", 0, 30)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Fangs of Ashamane Cat Forms", 0, 23)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Ghost of the Pridemother Cat Forms", 0, 24)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Nature's Fury Cat Forms", 0, 25)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Primal Stalker Cat Forms", 0, 26)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Incarnation of Nightmare Cat Forms", 0, 27)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Moonspirit Cat Forms", 0, 28)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		
        elseif (player:GetRace()) == 6 then -- Tauren
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Fire Cat", 0, 50208)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat", 0, 50207)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat HD", 0, 50774)
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Tauren - Cat Forms", 0, 31)
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Tauren - Armored Cat Forms", 0, 32)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Fangs of Ashamane Cat Forms", 0, 23)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Ghost of the Pridemother Cat Forms", 0, 24)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Nature's Fury Cat Forms", 0, 25)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Primal Stalker Cat Forms", 0, 26)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Incarnation of Nightmare Cat Forms", 0, 27)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Moonspirit Cat Forms", 0, 28)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		
		elseif (player:GetRace()) == 8 then -- Troll
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Fire Cat", 0, 50208)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat", 0, 50207)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_warlock_fireAndBrimstone.png:20|t Armored Fire Cat HD", 0, 50774)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Troll - Cat Forms", 0, 33)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Troll - Armored Cat Forms", 0, 34)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Fangs of Ashamane Cat Forms", 0, 23)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Ghost of the Pridemother Cat Forms", 0, 24)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Nature's Fury Cat Forms", 0, 25)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Primal Stalker Cat Forms", 0, 26)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Incarnation of Nightmare Cat Forms", 0, 27)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_druid_catform.png:20|t Moonspirit Cat Forms", 0, 28)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 29) then -- Cat Forms - Night Elf
        player:GossipSetText(string.format("Night Elf Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Black", 0, 892)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Violet", 0, 29405)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Purple", 0, 29406)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Dark Blue", 0, 29407)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin White", 0, 29408)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 30) then -- Armored Cat Forms - Night Elf
        player:GossipSetText(string.format("Night Elf Armored Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Black", 0, 50209)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin White", 0, 50213)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Blue", 0, 50210)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Purple", 0, 50211)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Pink", 0, 50212)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 31) then -- Cat Forms - Tauren
        player:GossipSetText(string.format("Tauren Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Brown", 0, 8571)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin White", 0, 29409)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Yellow", 0, 29410)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Red", 0, 29411)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Black", 0, 29412)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 32) then -- Armored Cat Forms - Tauren
        player:GossipSetText(string.format("Tauren Armored Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Black", 0, 50215)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin White", 0, 50217)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Brown", 0, 50216)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Light Brown", 0, 50214)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Yellow", 0, 50218)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
		
   elseif(intid == 33) then -- Cat Forms - Troll
        player:GossipSetText(string.format("Troll Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Black", 0, 50591)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Green", 0, 50592)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Red", 0, 50593)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin White", 0, 50594)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Cat Form Skin Blue", 0, 50595)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
    elseif(intid == 34) then -- Armored Cat Forms - Troll
        player:GossipSetText(string.format("Troll Armored Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Blue", 0, 50600)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin White", 0, 50596)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Red", 0, 50598)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Yellow", 0, 50599)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Armored Cat Form Skin Green", 0, 50597)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
	-- Artifact Cat Forms
    elseif(intid == 23) then -- Artifact Cat Forms 1 - Fangs of Ashamane Cat Forms
        player:GossipSetText(string.format("Fangs of Ashamane Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t White", 0, 50226)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Black", 0, 50219)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Brown", 0, 50221)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Blue", 0, 50225)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Purple", 0, 50220)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Red", 0, 50224)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Greybrown", 0, 50223)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Lightbrown", 0, 50222)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 24) then -- Artifact Cat Forms 2 - Ghost of the Pridemother Cat Forms
        player:GossipSetText(string.format("Ghost of the Pridemother Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Blue", 0, 50227)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Red", 0, 50230)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Green", 0, 50228)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Purple", 0, 50229)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 25) then -- Artifact Cat Forms 3 - Nature's Fury Cat Forms
        player:GossipSetText(string.format("Nature's Fury Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Purple", 0, 50235)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Blue", 0, 50232)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Orange", 0, 50234)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Green", 0, 50233)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 26) then -- Artifact Cat Forms 4 - Primal Stalker Cat Forms
        player:GossipSetText(string.format("Primal Stalker Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Purple", 0, 50239)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t White", 0, 50240)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Orange", 0, 50238)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Green", 0, 50237)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 27) then -- Artifact Cat Forms 5 - Incarnation of Nightmare Cat Forms
        player:GossipSetText(string.format("Incarnation of Nightmare Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Red", 0, 50244)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Orange", 0, 50243)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Blue", 0, 50241)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Green", 0, 50242)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 28) then -- Artifact Cat Forms 6 - Moonspirit Cat Forms
        player:GossipSetText(string.format("Moonspirit Cat Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Black", 0, 50245)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t White", 0, 50246)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Brown", 0, 50248)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_catform.png:20|t Orange", 0, 50247)
		player:GossipMenuAddItem(5, " ",0, 1)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_druid_catform.png:20|t Voltar",0,1)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
    end
	
	-- Bear Forms Gossips/Menus (Night Elf/Tauren/Troll/Artifact)
	if(intid == 2) then
        player:GossipSetText(string.format(" "))
        if not (player:HasAura(9634) or player:HasAura(5487)) then
            player:SendBroadcastMessage("You are not in Bear form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Forms - Night Elf", 0, 17)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Forms - Night Elf", 0, 18)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Claws of Ursoc Bear Forms", 0, 11)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Stonepaw Bear Forms", 0, 12)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Avatar of Ursol Bear Forms", 0, 13)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Fallen to Nightmare Bear Forms", 0, 14)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Guardian of the Glade Bear Forms", 0, 15)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Might of the Grizzlemaw Bear Forms", 0, 16)
			
			player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        
        elseif (player:GetRace()) == 6 then -- Tauren
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Forms - Tauren", 0, 19)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Forms - Tauren", 0, 20)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Claws of Ursoc Bear Forms", 0, 11)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Stonepaw Bear Forms", 0, 12)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Avatar of Ursol Bear Forms", 0, 13)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Fallen to Nightmare Bear Forms", 0, 14)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Guardian of the Glade Bear Forms", 0, 15)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Might of the Grizzlemaw Bear Forms", 0, 16)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		elseif (player:GetRace()) == 8 then -- Troll
            player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Forms - Troll", 0, 21)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Troll" - Tauren, 0, 22)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Claws of Ursoc Bear Forms", 0, 11)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Stonepaw Bear Forms", 0, 12)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Avatar of Ursol Bear Forms", 0, 13)
			player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Fallen to Nightmare Bear Forms", 0, 14)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Guardian of the Glade Bear Forms", 0, 15)
		    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Might of the Grizzlemaw Bear Forms", 0, 16)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	
    elseif(intid == 17) then -- Bear Forms - Night Elf
        player:GossipSetText(string.format("Night Elf Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Purple", 0, 29413)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Black", 0, 29414)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Blue", 0, 29415)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin White", 0, 29416)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Red", 0, 29417)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 18) then -- Armored Bear Forms - Night Elf
        player:GossipSetText(string.format("Night Elf Armored Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Purple", 0, 50627)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Black", 0, 50625)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Blue", 0, 50626)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin White", 0, 50629)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Red", 0, 50628)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 19) then -- Bear Forms - Tauren
        player:GossipSetText(string.format("Tauren Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Brown", 0, 2289)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Black", 0, 29418)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Silver", 0, 29419)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Yellow", 0, 29420)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin White", 0, 29421)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 20) then -- Armored Bear Forms - Tauren
        player:GossipSetText(string.format("Tauren Armored Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Brown", 0, 50631)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Black", 0, 50630)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Silver", 0, 50632)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Yellow", 0, 50634)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin White", 0, 50633)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 21) then -- Bear Forms - Troll
        player:GossipSetText(string.format("Troll Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Blue", 0, 50580)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Purple", 0, 50581)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Red", 0, 50582)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin White", 0, 50583)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Bear Form Skin Yellow", 0, 50584)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
    elseif(intid == 22) then -- Armored Bear Forms - Troll
        player:GossipSetText(string.format("Troll Armored Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Blue", 0, 50589)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Purple", 0, 50586)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Red", 0, 50587)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin White", 0, 50586)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Armored Bear Form Skin Green", 0, 50585)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 11) then -- Artifact Bear Forms 1 (Comuns)
        player:GossipSetText(string.format("Claws of Ursoc Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Black", 0, 50495)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t White", 0, 50493)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Brown", 0, 50496)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Gold", 0, 50498)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Purple", 0, 50492)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Blue", 0, 50499)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Burgundy", 0, 50501)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 12) then -- Artifact Bear Forms 2 (Stone)
        player:GossipSetText(string.format("Stonepaw Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Black", 0, 50506)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Brown", 0, 50508)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Purple", 0, 50509)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Grey", 0, 50507)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 13) then -- Artifact Bear Forms 3 (Mage Tower)
        player:GossipSetText(string.format("Avatar of Ursol Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Blue", 0, 50510)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Green", 0, 50511)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Purple", 0, 50512)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Red", 0, 50513)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 14) then -- Artifact Bear Forms 4 (Spiked)
        player:GossipSetText(string.format("Fallen to Nightmare Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Red", 0, 50517)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Orange", 0, 50515)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Blue", 0, 50514)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Green", 0, 50516)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 15) then -- Artifact Bear Forms 5 (Boned)
        player:GossipSetText(string.format("Guardian of the Glade Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Black", 0, 50518)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Brown", 0, 50519)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Orange", 0, 50520)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t White", 0, 50521)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
	
    elseif(intid == 16) then -- Artifact Bear Forms 6 (Werebear)
        player:GossipSetText(string.format("Might of the Grizzlemaw Bear Forms"))
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Werebear Black", 0, 50203)
	    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Werebear White", 0, 50206)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Werebear Brown", 0, 50205)
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Werebear Yellow", 0, 50204)
		player:GossipMenuAddItem(5, " ",0, 2)
	    player:GossipMenuAddItem(5, "|TInterface\\icons\\Ability_racial_bearform.png:20|t Voltar",0,2)
	    player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id) 
    end
	
	-- Travel Form Gossips/Menus
	if(intid == 3) then
        player:GossipSetText(string.format(" "))
        if not player:HasAura(783) then
            player:SendBroadcastMessage("You are not in Travel form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Night Elf Stag", 0, 50504)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Default Travel Form", 0, 918)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        
        elseif (player:GetRace()) == 6 then -- Tauren
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Tauren Stag", 0, 50505)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Highmountain Tauren Stag", 0, 50676)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Default Travel Form", 0, 918)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		elseif (player:GetRace()) == 8 then -- Troll
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Zandalari Raptor", 0, 50677)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_travelform.png:20|t Default Travel Form", 0, 918)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
		
	-- Moonkin Form Gossips/Menus
	if(intid == 4) then
        player:GossipSetText(string.format(" "))
        if not player:HasAura(24858) then
            player:SendBroadcastMessage("You are not in Moonkin form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Armored Moonkin Form", 0, 50503)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Default Moonkin Form", 0, 15374)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        
        elseif (player:GetRace()) == 6 then -- Tauren
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Armored Moonkin Form", 0, 50502)
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Default Moonkin Form", 0, 15375)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		elseif (player:GetRace()) == 8 then -- Troll
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Armored Moonkin Form", 0, 50502)
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:20|t Default Moonkin Form", 0, 50590)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end
	
	-- Aquatic Form Gossips/Menus
	if(intid == 5) then
        player:GossipSetText(string.format(" "))
		if (player:GetClass()) == 11 then
			if (player:GetRace()) == 4 then -- Night Elf
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|t Orca", 0, 50494)
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|tDefault Aquatic Form", 0, 2428)
				player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        
			elseif (player:GetRace()) == 6 then -- Tauren
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|tOrca", 0, 50494)
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|tDefault Aquatic Form", 0, 2428)
				player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
			elseif (player:GetRace()) == 8 then -- Troll
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|tOrca", 0, 50494)
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_aquaticform.png:20|tDefault Aquatic Form", 0, 2428)
				player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
			end
			player:GossipComplete()
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
		else
			player:SendBroadcastMessage("Você precisa ser Druid para acessar essa opção.")
			return druidMorphHello2(event, player, creature)
		end
	end
	
	-- Tree Form Gossips/Menus
	if(intid == 6) then
        player:GossipSetText(string.format(" "))
        if not player:HasAura(33891) then
            player:SendBroadcastMessage("You are not in Tree form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Default Tree Form", 0, 864)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Green)", 0, 50672)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Orange)", 0, 50673)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Purple)", 0, 50674)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Red)", 0, 50675)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        
        elseif (player:GetRace()) == 6 then -- Tauren
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Default Tree Form", 0, 864)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Green)", 0, 50672)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Orange)", 0, 50673)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Purple)", 0, 50674)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Red)", 0, 50675)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
	    elseif (player:GetRace()) == 8 then -- Troll
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Default Tree Form", 0, 864)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Green)", 0, 50672)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Orange)", 0, 50673)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Purple)", 0, 50674)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_druid_TreeofLife.png:20|t Cataclysm Tree Form (Red)", 0, 50675)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end
	
    -- Flight Form Gossips/Menus
	if(intid == 7) then
        player:GossipSetText(string.format(" "))
        if not (player:HasAura(33943) or player:HasAura(40120)) then
            player:SendBroadcastMessage("You are not in Flight form")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 4 then -- Night Elf
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Stormpike Owl", 0, 10828)
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Night Elf Swift Flight Form", 0, 21243)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
            --player:GossipMenuAddItem(2, "Night Elf Flight Form", 0, 20857)
        elseif (player:GetRace()) == 6 then -- Tauren
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Stormpike Owl", 0, 10828)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Tauren Swift Flight Form", 0, 21244)
            --player:GossipMenuAddItem(2, "Tauren Flight Form", 0, 20872)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
	    elseif (player:GetRace()) == 8 then -- Troll
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Stormpike Owl", 0, 10828)
            player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Druid_FlightForm.png:20|t Troll Swift Flight Form", 0, 50601)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end
	
	-- Ghost Wolf Gossips/Menus
	if(intid == 8) then
        player:GossipSetText(string.format(" "))
        if not player:HasAura(2645) then
            player:SendBroadcastMessage("You are not in Ghost Wolf")
			return druidMorphHello2(event, player, creature)
        end
        if (player:GetRace()) == 11 then -- Draenei
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_shaman_feralspirit.png:29|t Spirit Ghost Wolf", 0, 2446)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_BlackDireWolf.png:29|t Black Ghost Wolf", 0, 27311)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_mount_whitedirewolf.png:29|t Arctic Ghost Wolf", 0, 27312)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_nature_spiritwolf.png:29|t Default Ghost Wolf", 0, 4613)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		--elseif (player:GetRace()) == 3 then -- Dwarf
			--player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_shaman_feralspirit.png:29|t Spirit Ghost Wolf", 0, 2446)
		    --player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_BlackDireWolf.png:29|t Black Ghost Wolf", 0, 27311)
			--player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_mount_whitedirewolf.png:29|t Arctic Ghost Wolf", 0, 27312)
			--player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_nature_spiritwolf.png:29|t Default Ghost Wolf", 0, 4613)
			--player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
		
		elseif (player:GetRace()) == 2 then -- Orc
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_shaman_feralspirit.png:29|t Spirit Ghost Wolf", 0, 2446)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_BlackDireWolf.png:29|t Black Ghost Wolf", 0, 27311)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_mount_whitedirewolf.png:29|t Arctic Ghost Wolf", 0, 27312)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_nature_spiritwolf.png:29|t Default Ghost Wolf", 0, 4613)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
			
		elseif (player:GetRace()) == 6 then -- Tauren
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_shaman_feralspirit.png:29|t Spirit Ghost Wolf", 0, 2446)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_BlackDireWolf.png:29|t Black Ghost Wolf", 0, 27311)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_mount_whitedirewolf.png:29|t Arctic Ghost Wolf", 0, 27312)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_nature_spiritwolf.png:29|t Default Ghost Wolf", 0, 4613)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)

        elseif (player:GetRace()) == 8 then -- Troll
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_shaman_feralspirit.png:29|t Spirit Ghost Wolf", 0, 2446)
		    player:GossipMenuAddItem(2, "|TInterface\\icons\\Ability_Mount_BlackDireWolf.png:29|t Black Ghost Wolf", 0, 27311)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\ability_mount_whitedirewolf.png:29|t Arctic Ghost Wolf", 0, 27312)
			player:GossipMenuAddItem(2, "|TInterface\\icons\\spell_nature_spiritwolf.png:29|t Default Ghost Wolf", 0, 4613)
			player:GossipMenuAddItem(5, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Inicio",0,10)
        end
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
	
	-- #############################################
	-- Entries:     ################################
    -- #############################################
	
	-- Cat Form DisplayIDs/Entries:
	if(intid == 50207) then -- Cat Form Fire Cat Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 1, code) -- 1 is the IntId for Cat Form menu
		    --druidMorphHello2(event, player, creature)                 -- Mostra o Menu Principal
		
	elseif(intid == 50208) then -- Cat Form Fire Cat
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 1, code)
		
	elseif(intid == 50774) then -- Cat Form Fire Cat
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 1, code)
		
	-- Cat Forms Night Elf
	elseif(intid == 892) then -- Cat Form Nelf Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 29, code)
		
	elseif(intid == 29405) then -- Cat Form Nelf Violet
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 29, code)
		
	elseif(intid == 29406) then -- Cat Form Nelf Purple
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 29, code)
		
	elseif(intid == 29407) then -- Cat Form Nelf Dark Blue
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 29, code)
		
	elseif(intid == 29408) then -- Cat Form Nelf White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 29, code)
		
	-- Cat Forms Night Elf Armored
	elseif(intid == 50209) then -- Cat Form Armored Nelf Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 30, code)
	elseif(intid == 50213) then -- Cat Form Armored Nelf White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 30, code)
	elseif(intid == 50210) then -- Cat Form Armored Nelf Blue
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 30, code)
	elseif(intid == 50211) then -- Cat Form Armored Nelf Purple
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 30, code)
	elseif(intid == 50212) then -- Cat Form Armored Nelf Pink 
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 30, code)
	
	-- Cat Forms Tauren
	elseif(intid == 8571) then -- Cat Form Tauren Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 31, code)
		
	elseif(intid == 29409) then -- Cat Form Tauren White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 31, code)
		
	elseif(intid == 29410) then -- Cat Form Tauren Yellow
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 31, code)
		
	elseif(intid == 29411) then -- Cat Form Tauren Red
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 31, code)
		
	elseif(intid == 29412) then -- Cat Form Tauren Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 31, code)
		
	-- Cat Forms Tauren Armored
	elseif(intid == 50215) then -- Cat Form Tauren Black Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 32, code)
			
	elseif(intid == 50217) then -- Cat Form Tauren White Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 32, code)
			
	elseif(intid == 50216) then -- Cat Form Tauren Brown Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 32, code)
			
	elseif(intid == 50214) then -- Cat Form Tauren LightBrown Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 32, code)
			
	elseif(intid == 50218) then -- Cat Form Tauren Yellow Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 32, code)
		
	-- Cat Forms Troll
	elseif(intid == 50591) then -- Cat Form Troll Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 33, code)
		
	elseif(intid == 50592) then -- Cat Form Troll Green
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 33, code)
		
	elseif(intid == 50593) then -- Cat Form Troll Red
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 33, code)
		
	elseif(intid == 50594) then -- Cat Form Troll White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 33, code)
		
	elseif(intid == 50595) then -- Cat Form Troll Blue
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 33, code)
		
	-- Cat Forms Troll Armored
	elseif(intid == 50600) then -- Cat Form Troll Blue Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 34, code)
		
	elseif(intid == 50596) then -- Cat Form Troll White Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 34, code)
		
	elseif(intid == 50598) then -- Cat Form Troll Red Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 34, code)
		
	elseif(intid == 50599) then -- Cat Form Troll Yellow Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 34, code)
		
	elseif(intid == 50597) then -- Cat Form Troll Green Armored
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 34, code)
		
	-- Cat Forms Artifact 1
	elseif(intid == 50226) then -- Cat Form Artifact 1 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50219) then -- Cat Form Artifact 1 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50221) then -- Cat Form Artifact 1 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50225) then -- Cat Form Artifact 1 Blue
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50220) then -- Cat Form Artifact 1 Purple
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50224) then -- Cat Form Artifact 1 Red
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50223) then -- Cat Form Artifact 1 Greybrown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
			
	elseif(intid == 50222) then -- Cat Form Artifact 1 Lightbrown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 23, code)
		
	-- Cat Forms Artifact 2
	elseif(intid == 50227) then -- Cat Form Artifact 2 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 24, code)
		
	elseif(intid == 50230) then -- Cat Form Artifact 2 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 24, code)
		
	elseif(intid == 50228) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 24, code)
		
	elseif(intid == 50229) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 24, code)
		
	-- Cat Forms Artifact 3
	elseif(intid == 50235) then -- Cat Form Artifact 2 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 25, code)
	elseif(intid == 50232) then -- Cat Form Artifact 2 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 25, code)
	elseif(intid == 50234) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 25, code)
	elseif(intid == 50233) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 25, code)
		
	-- Cat Forms Artifact 4
	elseif(intid == 50239) then -- Cat Form Artifact 2 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 26, code)
		
	elseif(intid == 50240) then -- Cat Form Artifact 2 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 26, code)
		
	elseif(intid == 50238) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 26, code)
		
	elseif(intid == 50237) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 26, code)

	-- Cat Forms Artifact 5
	elseif(intid == 50244) then -- Cat Form Artifact 2 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 27, code)
		
	elseif(intid == 50243) then -- Cat Form Artifact 2 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 27, code)
		
	elseif(intid == 50241) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 27, code)
		
	elseif(intid == 50242) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 27, code)
		
		
	-- Cat Forms Artifact 6
	elseif(intid == 50245) then -- Cat Form Artifact 2 White
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 28, code)
			
	elseif(intid == 50246) then -- Cat Form Artifact 2 Black
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 28, code)
			
	elseif(intid == 50248) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
			druidMorph_Select(event, player, creature, sender, 28, code)
			
	elseif(intid == 50247) then -- Cat Form Artifact 2 Brown
		player:SetData("currentForm", 1)
		if not player:HasAura(768) then player:AddAura(768, player) end
		druidMorph_Select(event, player, creature, sender, 28, code)
	end

	-- Bear Forms DisplayIDS/Entries:
    if(intid == 29413) then -- Bear Form Night Elf - Purple 	-- Night Elf Bear Forms:
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 17, code)
		
    elseif(intid == 29414) then -- Bear Form Night Elf - Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 17, code)
		
    elseif(intid == 29415) then -- Bear Form Night Elf - Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 17, code)
		
    elseif(intid == 29416) then -- Bear Form Night Elf - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 17, code)
		
    elseif(intid == 29417) then -- Bear Form Night Elf - Red
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 17, code)
		
	-- Armored Bear Form - Night Elf
    elseif(intid == 50627) then -- Bear Form Night Elf Armored - Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 18, code)
    elseif(intid == 50625) then -- Bear Form Night Elf Armored - Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 18, code)
    elseif(intid == 50626) then -- Bear Form Night Elf Armored - Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 18, code)
    elseif(intid == 50629) then -- Bear Form Night Elf Armored - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 18, code)
    elseif(intid == 50628) then -- Bear Form Night Elf Armored - Red
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 18, code)
		
	-- Tauren Bear Forms
	elseif(intid == 2289) then -- Bear Form Tauren - Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 19, code)
			
	elseif(intid == 29418) then -- Bear Form Tauren - Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 19, code)
			
	elseif(intid == 29419) then -- Bear Form Tauren - Silver
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 19, code)
			
	elseif(intid == 29420) then -- Bear Form Tauren - Yellow
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 19, code)
	elseif(intid == 29421) then -- Bear Form Tauren - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 19, code)
		
	-- Tauren Armored Bear Forms
	elseif(intid == 50631) then -- Armored Bear Form Tauren - Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 20, code)
	elseif(intid == 50630) then -- Armored Bear Form Tauren - Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 20, code)
	elseif(intid == 50632) then -- Armored Bear Form Tauren - Silver
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 20, code)
	elseif(intid == 50634) then -- Armored Bear Form Tauren - Yellow
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 20, code)
	elseif(intid == 50633) then -- Armored Bear Form Tauren - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 20, code)
		
	-- Troll Bear Forms
	elseif(intid == 50580) then -- Bear Form Troll - Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 21, code)
			
	elseif(intid == 50581) then -- Bear Form Troll - Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 21, code)
		
	elseif(intid == 50582) then -- Bear Form Troll - Red
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 21, code)
		
	elseif(intid == 50583) then -- Bear Form Troll - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 21, code)
		
	elseif(intid == 50584) then -- Bear Form Troll - Yellow
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 21, code)
		
		
	-- Troll Armored Bear Forms
	elseif(intid == 50589) then -- Armored Bear Form Troll - Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 22, code)
		
	elseif(intid == 50586) then -- Armored Bear Form Troll - Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 22, code)
		
	elseif(intid == 50587) then -- Armored Bear Form Troll - Red
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 22, code)
		
	elseif(intid == 50586) then -- Armored Bear Form Troll - White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 22, code)
		
	elseif(intid == 50585) then -- Armored Bear Form Troll - Green
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 22, code)
		
	-- Artifact Bear Forms 1
	elseif(intid == 50495) then	-- Artifact Bear Forms 1 Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50493) then	-- Artifact Bear Forms 1 White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50496) then	-- Artifact Bear Forms 1 Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50498) then	-- Artifact Bear Forms 1 Gold
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50492) then	-- Artifact Bear Forms 1 Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50499) then	-- Artifact Bear Forms 1 Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
	elseif(intid == 50501) then	-- Artifact Bear Forms 1 Burgundy
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 11, code)
		
		
	-- Artifact Bear Forms 2
	elseif(intid == 50506) then	-- Artifact Bear Forms 2 Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 12, code)
	elseif(intid == 50508) then	-- Artifact Bear Forms 2 Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 12, code)
	elseif(intid == 50509) then	-- Artifact Bear Forms 2 Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 12, code)
	elseif(intid == 50507) then	-- Artifact Bear Forms 2 Grey
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 12, code)
		
	-- Artifact Bear Forms 3
	elseif(intid == 50510) then	-- Artifact Bear Forms 3 Blue
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 13, code)
	elseif(intid == 50511) then	-- Artifact Bear Forms 3 Green
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 13, code)
	elseif(intid == 50512) then	-- Artifact Bear Forms 3 Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 13, code)
	elseif(intid == 50513) then	-- Artifact Bear Forms 3 Red
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 13, code)
		
	-- Artifact Bear Forms 4
	elseif(intid == 50517) then	-- Artifact Bear Forms 4 Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 14, code)
	elseif(intid == 50515) then	-- Artifact Bear Forms 4 Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 14, code)
	elseif(intid == 50514) then	-- Artifact Bear Forms 4 Purple
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 14, code)
	elseif(intid == 50516) then	-- Artifact Bear Forms 4 Grey
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 14, code)
		
	-- Artifact Bear Forms 5
	elseif(intid == 50518) then	-- Artifact Bear Forms 5 Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 15, code)
	elseif(intid == 50519) then	-- Artifact Bear Forms 5 Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 15, code)
	elseif(intid == 50520) then	-- Artifact Bear Forms 5 Orange
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 15, code)
	elseif(intid == 50521) then	-- Artifact Bear Forms 5 White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 15, code)
		
	-- Artifact Bear Forms 6
	elseif(intid == 50203) then	-- Artifact Bear Forms 6 Black
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 16, code)
	elseif(intid == 50206) then	-- Artifact Bear Forms 6 White
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 16, code)
	elseif(intid == 50205) then	-- Artifact Bear Forms 6 Brown
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
			druidMorph_Select(event, player, creature, sender, 16, code)
	elseif(intid == 50204) then	-- Artifact Bear Forms 6 Yellow
		player:SetData("currentForm", 2)
		if not player:HasAura(9634 or 5487) then player:AddAura(9634, player) end
		druidMorph_Select(event, player, creature, sender, 16, code)
	end
		
	-- Travel Forms DisplayIDS/Entries:
	if(intid == 918) then -- Default Travel Form (Night Elf / Tauren / Troll)
		player:SetData("currentForm", 3)
		if not player:HasAura(783) then player:AddAura(783, player) end
			druidMorph_Select(event, player, creature, sender, 3, code)
	elseif(intid == 50504) then -- Stag Night Elf
		player:SetData("currentForm", 3)
		if not player:HasAura(783) then player:AddAura(783, player) end
			druidMorph_Select(event, player, creature, sender, 3, code)
	elseif(intid == 50505) then -- Stag Tauren
		player:SetData("currentForm", 3)
		if not player:HasAura(783) then player:AddAura(783, player) end
			druidMorph_Select(event, player, creature, sender, 3, code)
	elseif(intid == 50676) then -- Stag Highmountain Tauren
		player:SetData("currentForm", 3)
		if not player:HasAura(783) then player:AddAura(783, player) end
			druidMorph_Select(event, player, creature, sender, 3, code)
	elseif(intid == 50677) then -- Stag Zandalari Troll
		player:SetData("currentForm", 3)
		if not player:HasAura(783) then player:AddAura(783, player) end
		druidMorph_Select(event, player, creature, sender, 3, code)
	end
	
	-- Moonkin Forms DisplayIDS/Entries:
	if(intid == 50503) then -- Armored Moonkin Form - Night Elf
		player:SetData("currentForm", 4)
		if not player:HasAura(24858) then player:AddAura(24858, player) end
			druidMorph_Select(event, player, creature, sender, 4, code)
	elseif(intid == 15374) then -- Default Moonkin Form - Night Elf
		player:SetData("currentForm", 4)
		if not player:HasAura(24858) then player:AddAura(24858, player) end
			druidMorph_Select(event, player, creature, sender, 4, code)
	elseif(intid == 50502) then -- Armored Moonkin Form - Tauren
		player:SetData("currentForm", 4)
		if not player:HasAura(24858) then player:AddAura(24858, player) end
			druidMorph_Select(event, player, creature, sender, 4, code)
	elseif(intid == 15375) then -- Default Moonkin Form - Tauren
		player:SetData("currentForm", 4)
		if not player:HasAura(24858) then player:AddAura(24858, player) end
			druidMorph_Select(event, player, creature, sender, 4, code)
	elseif(intid == 50590) then -- Default Moonkin Form - Troll
		player:SetData("currentForm", 4)
		if not player:HasAura(24858) then player:AddAura(24858, player) end
		druidMorph_Select(event, player, creature, sender, 4, code)
	end
	
	-- Aquatic Forms DisplayIDS/Entries:
	if(intid == 50494) then                -- Orca
		player:SetData("currentForm", 5)
		player:RemoveAura(1066) player:AddAura(1066, player)
		druidMorph_Select(event, player, creature, sender, 5, code)
	elseif(intid == 2428) then             -- Default Aquatic Form
		player:SetData("currentForm", 5)
		player:RemoveAura(1066) player:AddAura(1066, player)
		druidMorph_Select(event, player, creature, sender, 5, code)
    end
	
	-- Tree Forms DisplayIDS/Entries:
	if(intid == 864) then -- Default Tree Form
		player:SetData("currentForm", 6)
		if not player:HasAura(33891) then player:AddAura(33891, player) end
			druidMorph_Select(event, player, creature, sender, 6, code)
		
	elseif(intid == 50672) then -- Cataclysm Tree Form (Green)
		player:SetData("currentForm", 6)
		if not player:HasAura(33891) then player:AddAura(33891, player) end
			druidMorph_Select(event, player, creature, sender, 6, code)
		
	elseif(intid == 50673) then -- Cataclysm Tree Form (Orange)
		player:SetData("currentForm", 6)
		if not player:HasAura(33891) then player:AddAura(33891, player) end
			druidMorph_Select(event, player, creature, sender, 6, code)
		
	elseif(intid == 50674) then -- Cataclysm Tree Form (Purple)
		player:SetData("currentForm", 6)
		if not player:HasAura(33891) then player:AddAura(33891, player) end
			druidMorph_Select(event, player, creature, sender, 6, code)
		
	elseif(intid == 50675) then -- Cataclysm Tree Form (Red)
		player:SetData("currentForm", 6)
		if not player:HasAura(33891) then player:AddAura(33891, player) end
			druidMorph_Select(event, player, creature, sender, 6, code)
	end
		
	-- Flight Forms DisplayIDS/Entries:
	if(intid == 10828) then -- Stormpike Owl
		player:SetData("currentForm", 7)
		if player:HasAura(33943) then
			player:RemoveAura(33943)
			player:AddAura(33943, player)
		elseif player:HasAura(40120) then
			player:RemoveAura(40120)
			player:AddAura(40120, player)
		end
		druidMorph_Select(event, player, creature, sender, 7, code)
		
	elseif(intid == 21243) then -- Swift Flight Form - Night Elf
		player:SetData("currentForm", 7)
		if player:HasAura(33943) then
			player:RemoveAura(33943)
			player:AddAura(33943, player)
		elseif player:HasAura(40120) then
			player:RemoveAura(40120)
			player:AddAura(40120, player)
		end
        druidMorph_Select(event, player, creature, sender, 7, code)
		
	elseif(intid == 21244) then -- Swift Flight Form - Tauren
		player:SetData("currentForm", 7)
		if player:HasAura(33943) then
			player:RemoveAura(33943)
			player:AddAura(33943, player)
		elseif player:HasAura(40120) then
			player:RemoveAura(40120)
			player:AddAura(40120, player)
		end
        druidMorph_Select(event, player, creature, sender, 7, code)
		
	elseif(intid == 50601) then -- Swift Flight Form - Troll
		player:SetData("currentForm", 7)
		if player:HasAura(33943) then
			player:RemoveAura(33943)
			player:AddAura(33943, player)
		elseif player:HasAura(40120) then
			player:RemoveAura(40120)
			player:AddAura(40120, player)
		end
        druidMorph_Select(event, player, creature, sender, 7, code)
	end
	
	-- Ghost Wolfs DisplayIDS/Entries:
    if(intid == 2446) then -- Spirit Ghost Wolf
		player:SetData("currentForm", 8)
		if not player:HasAura(2645) then player:AddAura(2645, player) end
			druidMorph_Select(event, player, creature, sender, 8, code)
		
	elseif(intid == 27311) then -- Black Ghost Wolf
		player:SetData("currentForm", 8)
		if not player:HasAura(2645) then player:AddAura(2645, player) end
			druidMorph_Select(event, player, creature, sender, 8, code)
		
	elseif(intid == 27312) then -- Arctic Ghost Wolf
		player:SetData("currentForm", 8)
		if not player:HasAura(2645) then player:AddAura(2645, player) end
			druidMorph_Select(event, player, creature, sender, 8, code)
		
	elseif(intid == 4613) then -- Default Ghost Wolf
		player:SetData("currentForm", 8)
		if not player:HasAura(2645) then player:AddAura(2645, player) end
		druidMorph_Select(event, player, creature, sender, 8, code)
	end
		
	if (intid == 0) then -- Sair
		player:GossipComplete()	
		
	elseif (intid == 10) then -- Inicio
		druidMorphHello2(event, player, creature)
    end
	
	if intid > 40 then -- aplica DisplayID dos entries acima de 40
        player:SetDisplayId(intid)
		
	    local currentForm = player:GetData("currentForm")
        local formName
        if currentForm == 1 then
            formName = "DisplayCatForm"
			player:SaveToDB() 
		elseif currentForm == 2 then
            formName = "DisplayBearForm"
			player:SaveToDB() 
        elseif currentForm == 3 then
            formName = "DisplayTravelForm"
			player:SaveToDB() 
        elseif currentForm == 4 then
            formName = "DisplayMoonkinForm"
			player:SaveToDB() 
        elseif currentForm == 5 then
            formName = "DisplayAquaticForm"
			player:SaveToDB() 
		elseif currentForm == 6 then
            formName = "DisplayTreeForm"
            player:SaveToDB() 
		elseif currentForm == 7 then
            formName = "DisplayFlightForm"
            player:SaveToDB() 
		elseif currentForm == 8 then
            formName = "DisplayGhostWolfForm"
            player:SaveToDB() 
        end
        CharDBExecute("INSERT INTO custom_druid_form_display (player_guid, "..formName..") VALUES ("..player:GetGUIDLow()..","..intid..") ON DUPLICATE KEY UPDATE "..formName.."="..intid)
	end
end

function druidMorph_OnCast(event, player, spell, skipCheck)

	local LuaIsNull = function(val, default)
		if val ~= nil and val ~= 0 then
			return val
		end
	end

	local Query = CharDBQuery("SELECT * FROM custom_druid_form_display WHERE player_guid = "..player:GetGUIDLow())

	if(Query) then
		local DisplayCatForm = LuaIsNull(Query:GetUInt32(1), nil)
		local DisplayBearForm = LuaIsNull(Query:GetUInt32(2), nil)
		local DisplayTravelForm = LuaIsNull(Query:GetUInt32(3), nil)
		local DisplayMoonkinForm = LuaIsNull(Query:GetUInt32(4), nil)
		local DisplayAquaticForm = LuaIsNull(Query:GetUInt32(5), nil)
		local DisplayTreeForm = LuaIsNull(Query:GetUInt32(6), nil)
		local DisplayFlightForm = LuaIsNull(Query:GetUInt32(7), nil)
		local DisplayGhostWolfForm = LuaIsNull(Query:GetUInt32(8), nil)

		--if (player:HasItem(itemVIP) or player:HasItem(itemVIPeterno)) then
			if player:HasAura(768) and DisplayCatForm then                    -- Cat Form
				player:SetDisplayId(DisplayCatForm)
			elseif player:HasAura(9634 or 5487) and DisplayBearForm then      -- Bear Form
				player:SetDisplayId(DisplayBearForm)
			elseif player:HasAura(783) and DisplayTravelForm  then            -- Travel Form
				player:SetDisplayId(DisplayTravelForm)
			elseif player:HasAura(24858) and DisplayMoonkinForm then          -- Moonkin Form
				player:SetDisplayId(DisplayMoonkinForm)
			elseif player:HasAura(1066) and DisplayAquaticForm then           -- Aquatic Form
				player:SetDisplayId(DisplayAquaticForm)
			elseif player:HasAura(33891) and DisplayTreeForm then             -- Tree Form
				player:SetDisplayId(DisplayTreeForm)
			elseif player:HasAura(33943 or 40120) and DisplayFlightForm then  -- Flight Form
				player:SetDisplayId(DisplayFlightForm)
			elseif player:HasAura(2645) and DisplayGhostWolfForm then         -- Ghost Wolf
				player:SetDisplayId(DisplayGhostWolfForm)
			end
		--end
	end
end

function ApplyMorphOnLoguin(event, player) -- fix, não aplicava o CustomDisplay ao logar, sem OnLoguin, tem que renovar a forma ao logar
    if player:HasSpell(83384) then -- Só casta a Spell dnv se o player tiver a aura 83384 (Passive Spell)
		if player:GetClass() == 11 then -- Druids Only
			if player:HasAura(768) and DisplayCatForm then -- Cat Form
				player:RemoveAura(768)
				player:AddAura(768, player)
				player:AddAura(53307, player)
			elseif player:HasAura(9634) then -- Dire Bear
				player:RemoveAura(9634)
				player:AddAura(9634, player)
			elseif player:HasAura(5487) then -- Bear
				player:RemoveAura(5487)
				player:AddAura(5487, player)
			elseif player:HasAura(783) then -- Travel
				player:RemoveAura(783)
				player:AddAura(783, player)
			elseif player:HasAura(24858) then -- Moonkin
				player:RemoveAura(24858)
				player:AddAura(24858, player)
			elseif player:HasAura(1066) then -- Aquatic
				player:RemoveAura(1066)
				player:AddAura(1066, player)
			elseif player:HasAura(33891) then -- Tree
				player:RemoveAura(33891)
				player:AddAura(33891, player)
			elseif player:HasAura(40120) then -- Swift Flight Form
				player:RemoveAura(40120)
				player:AddAura(40120, player)
			elseif player:HasAura(33943) then -- Flight Form
				player:RemoveAura(33943)
				player:AddAura(33943, player)
			end
		elseif player:GetClass() == 7 then -- Shaman
			if player:HasAura(2645) then -- Ghost Wolf
				player:RemoveAura(2645) --
				player:AddAura(2645, player)
			end
		end
	end
end

RegisterCreatureGossipEvent(UnitEntry, 1, druidMorphHello2)
RegisterCreatureGossipEvent(UnitEntry, 2, druidMorph_Select)
RegisterPlayerEvent(5, druidMorph_OnCast)
RegisterPlayerEvent(3, ApplyMorphOnLoguin)


return druidMorph