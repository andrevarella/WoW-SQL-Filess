local UnitEntry = 99999

local Team =  {
				[0] = "|TInterface\\PVPFrame\\Pvp-Currency-Alliance.png:20|t",
				[1] = "|TInterface\\PVPFrame\\Pvp-Currency-Horde.png:20|t",
};

local T = {
    [1] = 0, -- Human
    [2] = 1, -- Orc
    [3] = 0, -- Dwarf
    [4] = 0, -- Night Elf
    [5] = 1, -- Undead
    [6] = 1, -- Tauren
    [7] = 0, -- Gnome
    [8] = 1, -- Troll
    [10] = 1, -- Blood Elf
    [11] = 0, -- Draenei
};	

local R = {
    [1] = 1, -- Human
    [2] = 2, -- Orc
    [3] = 3, -- Dwarf
    [4] = 4, -- Night Elf
    [5] = 5, -- Undead
    [6] = 6, -- Tauren
    [7] = 7, -- Gnome
    [8] = 8, -- Troll
    [10] = 10, -- Blood Elf
    [11] = 11, -- Draenei
};	

local Raca = { 
    [1] = "|TInterface\\icons\\Achievement_character_human_female:20|t",
    [2] = "|TInterface\\icons\\Achievement_character_orc_male:20|t",
    [3] = "|TInterface\\icons\\Achievement_character_dwarf_male:20|t",
    [4] = "|TInterface\\icons\\Achievement_character_nightelf_female:20|t",
    [5] = "|TInterface\\icons\\Achievement_character_undead_male:20|t",
    [6] = "|TInterface\\icons\\Achievement_character_tauren_male:20|t",
    [7] = "|TInterface\\icons\\Achievement_character_gnome_female:20|t",
    [8] = "|TInterface\\icons\\Achievement_character_troll_male:20|t",
    [10] = "|TInterface\\icons\\Achievement_character_bloodelf_female:20|t",
    [11] = "|TInterface\\icons\\Achievement_character_draenei_female:20|t",
};

local Class = { 
    [1] = "|cFF000000", -- Warrior
    [2] = "|cFF000000", -- Paladin
    [3] = "|cFF000000", -- Hunter
    [4] = "|cFF000000", -- Rogue
    [5] = "|cFF000000", -- Priest
    [6] = "|cFF000000", -- Death Knight
    [7] = "|cFF000000", -- Shaman
    [8] = "|cFF000000", -- Mage
    [9] = "|cFF000000", -- Warlock
    [11] = "|cFF000000" -- Druid
};

local Classe = { 
    [1] = "|TInterface\\icons\\inv_sword_27.png:20|t",
    [2] = "|TInterface\\icons\\inv_hammer_01.png:20|t",
    [3] = "|TInterface\\icons\\inv_weapon_bow_07.png:20|t",
    [4] = "|TInterface\\icons\\inv_throwingknife_04.png:20|t",
    [5] = "|TInterface\\icons\\inv_staff_30.png:20|t",
    [6] = "|TInterface\\icons\\spell_deathknight_classicon.png:20|t",
    [7] = "|TInterface\\icons\\inv_jewelry_talisman_04.png:20|t",
    [8] = "|TInterface\\icons\\inv_staff_13.png:20|t",
    [9] = "|TInterface\\icons\\spell_nature_drowsy.png:20|t",
    [11] = "|TInterface\\icons\\inv_misc_monsterclaw_04.png:20|t"
};



local function On_Top_Hello(event, player, creature)
    player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_killxenemies_generalsroom:30|t Top 10 Killers |cFF000000- [Each Class] \n", 0, 3)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_kill_flag_carrier:30|t Top 10 Killers |cFF000000- [All]\n", 0, 2)
      -- player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_10:30|t Top 10 |cFF000000- [Arena Rating]", 0, 1)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then
    player:GossipSetText(string.format("\n"))
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_7:30|t Top 10 - 2v2 |cFF000000Teams\n", 0, 5)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_3v3_7:30|t Top 10 - 3v3 |cFF000000Teams\n", 0, 6)
    --player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_5v5_7:30|t Top 10 - 5v5 |cFF000000Teams\n ", 0, 7)  
    player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 2) then
    player:GossipSetText(string.format("Aqui estão os tops 10 jogadores com mais Honorable Kills do servidor:")) -- TOP KILLS
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters ORDER BY totalKills DESC LIMIT 10")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, ""..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills:|r |cffffff00" .. kills .. "", 2, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end					


if(intid == 3) then
    player:GossipSetText(string.format("\nAqui estão os top 10 Killers de cada Classe do servidor:"))  -- TOP CLASSES
	
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_sword_27.png:25|t Top 10 |cFF8B4513Warrior |cFF000000Killers",0, 8)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_hammer_01.png:25|t Top 10 |cffff00ffPaladin |cFF000000Killers",0, 9)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_weapon_bow_07.png:25|t Top 10 |cFF228B22Hunter |cFF000000Killers",0, 10)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_throwingknife_04.png:25|t Top 10 Rogue |cFF000000Killers",0, 11)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_30.png:25|t Top 10 |cFFFFFFFFPriest |cFF000000Killers",0, 12)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_deathknight_classicon.png:25|t Top 10 |cFF8B0000Death Knight |cFF000000Killers",0, 13)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_jewelry_talisman_04.png:25|t Top 10 |cff0000ffShaman |cFF000000Killers",0, 14)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_13.png:25|t Top 10 |cFF00BFFFMage |cFF000000Killers",0, 15)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_nature_drowsy.png:25|t Top 10 |cFF800080Warlock |cFF000000Killers",0, 16)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_misc_monsterclaw_04.png:25|t Top 10 |cFFFF4500Druid |cFF000000Killers",0, 17)
    player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
    player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end



---- CLASSES ----

if (intid == 8) then
		local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=1 ORDER BY totalKills DESC LIMIT 10") -- Warrior
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. " ", 8, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 9) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=2 ORDER BY totalKills DESC LIMIT 10") -- Paladino
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 9, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 10) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=3 ORDER BY totalKills DESC LIMIT 10") -- Hunter
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 10, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 11) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=4 ORDER BY totalKills DESC LIMIT 10") -- Rogue
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 11, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 12) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=5 ORDER BY totalKills DESC LIMIT 10") -- Priest
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 12, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 13) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=6 ORDER BY totalKills DESC LIMIT 10") -- Death Knight
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 13, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 14) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=7 ORDER BY totalKills DESC LIMIT 10") -- Shaman
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 14, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 15) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=8 ORDER BY totalKills DESC LIMIT 10") -- Mage
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 15, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if (intid == 16) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=9 ORDER BY totalKills DESC LIMIT 10") -- Warlock
        repeat
						local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 16, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
end
if (intid == 17) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=11 ORDER BY totalKills DESC LIMIT 10") -- Druid 
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 17, 30)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end


---- CLASSES FINAL----

---- PRA BAIXO = ARENA TEAM ----


if(intid == 5) then
    player:GossipSetText(string.format("\n Aqui estão os top 10 times de arena 2v2."))
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=2 ORDER BY rating DESC LIMIT 10")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(3);
		seasonWins = score:GetUInt32(2);
        player:GossipMenuAddItem(9,"|cFF000000Time : |r |cff0000ff".. time ..",  |cFF8B4513Rating: |r|cffffff00" .. pontos .. ", \n|cFF000000Jogos Totais: |r "..seasonGames..", Vitórias: |r |cFFFFDEAD"..seasonWins.."", 5, 1)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Inicio",0,499)    
	    player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end			

if(intid == 6) then
    player:GossipSetText(string.format("\n Aqui estão os top 10 times de arena 3v3."))
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=3 ORDER BY rating DESC LIMIT 10")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(3);
        player:GossipMenuAddItem(9,"|cFF000000Time : |r |cff0000ff".. time ..",  |cFF8B4513Rating: |r|cffffff00" .. pontos .. ", \n|cFF000000Jogos Totais: |r |cffffff00"..seasonGames..", Vitórias: |r |cFFFFDEAD"..seasonWins.."", 5, 1)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Inicio",0,499)    
	    player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end	

if(intid == 7) then
    player:GossipSetText(string.format("\n Aqui estão os top 10 times de arena 5v5."))
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=5 ORDER BY rating DESC LIMIT 10")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(3);
		seasonWins = score:GetUInt32(2);
        player:GossipMenuAddItem(9,"|cFF000000Time : |r |cff0000ff".. time ..",  |cFF8B4513Rating: |r|cffffff00" .. pontos .. ", \n|cFF000000Jogos Totais: |r |cffffff00"..seasonGames..", Vitórias: |r |cFFFFDEAD"..seasonWins.."", 5, 1)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Inicio",0,499)    
	    player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end	




if (intid == 499) then
   On_Top_Hello(event, player, creature)
   end

if (intid == 500) then
   player:GossipComplete()	
   end	
end

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)