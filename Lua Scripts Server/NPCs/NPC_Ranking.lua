local UnitEntry = 99999 -- tava 99999

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
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_10:30|t Top 10 |cFF000000[Arena Rating]", 0, 1)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_killxenemies_generalsroom:30|t Top 10 Killers|cFF000000 [Por Classe]", 0, 3)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_kill_flag_carrier:30|t Top 10 Killers |cFF000000[Total]\n", 0, 2)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
	if(intid == 1) then
		player:GossipSetText(string.format("\n"))
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_7:30|t Top 10 - 2v2 |cFF000000Teams\n", 0, 5)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_3v3_7:30|t Top 10 - 3v3 |cFF000000Teams\n", 0, 6)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_5v5_7:30|t Top 10 - 5v5 |cFF000000Teams\n ", 0, 7)
		player:GossipMenuAddItem(9," |TInterface/Icons/Achievement_bg_trueavshutout:30|t Top 10 - 1v1 teams", 0, 20)
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
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
				player:GossipMenuAddItem(9, ""..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills:|r |cffffff00" .. kills .. "", 2, 98)
			until not score:NextRow()
		player:GossipComplete()
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
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
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
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
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. " ", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 9) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=2 ORDER BY totalKills DESC LIMIT 10") -- Paladino
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 10) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=3 ORDER BY totalKills DESC LIMIT 10") -- Hunter
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 11) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=4 ORDER BY totalKills DESC LIMIT 10") -- Rogue
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 12) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=5 ORDER BY totalKills DESC LIMIT 10") -- Priest
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 13) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=6 ORDER BY totalKills DESC LIMIT 10") -- Death Knight
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 14) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=7 ORDER BY totalKills DESC LIMIT 10") -- Shaman
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 15) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=8 ORDER BY totalKills DESC LIMIT 10") -- Mage
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end

	if (intid == 16) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=9 ORDER BY totalKills DESC LIMIT 10") -- Warlock
        repeat
						local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
	end
	if (intid == 17) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=11 ORDER BY totalKills DESC LIMIT 10") -- Druid 
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." "..Class[class].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end


	-- Arena Ranking
	-- 2v2
	if(intid == 5) then
        player:GossipSetText("Aqui estão os top 10 times de arena 2v2.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=2 ORDER BY rating DESC LIMIT 10")
		if score then
            repeat
                local Team = score:GetString(0);
                local TRating = score:GetUInt32(1);
                local seasonGames = score:GetUInt32(3);
                local seasonWins = score:GetUInt32(2);
                local teamID = score:GetUInt32(4);
				local weekWins = score:GetUInt32(5);
				local weekGames = score:GetUInt32(6);
				local teamRank = score:GetUInt32(7);
				local Seasonderrotas = seasonGames - seasonWins;
				local Weekderrotas = weekGames - weekWins;
				local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
				local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
				player:GossipMenuAddItem(9,"Time: |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] " \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 2v2 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 1)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 1)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	-- 3v3
	if(intid == 6) then
        player:GossipSetText("Aqui estão os top 10 times de arena 3v3.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=3 ORDER BY rating DESC LIMIT 10")
		if score then
            repeat
                local Team = score:GetString(0);
                local TRating = score:GetUInt32(1);
                local seasonGames = score:GetUInt32(3);
                local seasonWins = score:GetUInt32(2);
                local teamID = score:GetUInt32(4);
				local weekWins = score:GetUInt32(5);
				local weekGames = score:GetUInt32(6);
				local teamRank = score:GetUInt32(7);
				local Seasonderrotas = seasonGames - seasonWins;
				local Weekderrotas = weekGames - weekWins;
				local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
				local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
				player:GossipMenuAddItem(9,"Time: |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] " \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 3v3 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 1)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 1)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	-- 5v5
	if(intid == 7) then
        player:GossipSetText("Aqui estão os top 10 times de arena 5v5.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=5 ORDER BY rating DESC LIMIT 10")
		if score then
            repeat
                local Team = score:GetString(0);
                local TRating = score:GetUInt32(1);
                local seasonGames = score:GetUInt32(3);
                local seasonWins = score:GetUInt32(2);
                local teamID = score:GetUInt32(4);
				local weekWins = score:GetUInt32(5);
				local weekGames = score:GetUInt32(6);
				local teamRank = score:GetUInt32(7);
				local Seasonderrotas = seasonGames - seasonWins;
				local Weekderrotas = weekGames - weekWins;
				local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
				local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
				player:GossipMenuAddItem(9,"Time: |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] " \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 5v5 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 1)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 1)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
	-- 1v1
	if(intid == 20) then
        player:GossipSetText("Aqui estão os top 10 times de arena 1v1.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=1 ORDER BY rating DESC LIMIT 10")
		if score then
            repeat
                local Team = score:GetString(0);
                local TRating = score:GetUInt32(1);
                local seasonGames = score:GetUInt32(3);
                local seasonWins = score:GetUInt32(2);
                local teamID = score:GetUInt32(4);
				local weekWins = score:GetUInt32(5);
				local weekGames = score:GetUInt32(6);
				local teamRank = score:GetUInt32(7);
				local Seasonderrotas = seasonGames - seasonWins;
				local Weekderrotas = weekGames - weekWins;
				local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
				local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
				player:GossipMenuAddItem(9,"Time: |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] " \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 1v1 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 1)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 1)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
	-- intid é o id de times do arena_team - fazer algo parecido, com a tabela de salvar talent?: ex: criou nome para tabela, e o nome do gossip aparece com base no valor do intid do sql
	if(intid >= 100) then -- apenas times ArenaTeamID maior que 100, pra nao conflitar com outros intiId
		selectedTeamID = intid
		--local teamRank = 1
		--player:GossipSetText(string.format("Aqui está os membros do time de arena " .. teamRank))
		player:GossipSetText("Aqui está as informações do time de arena selecionado.")
		local teamInfoQuery = CharDBQuery("SELECT name, rating, `rank`, type, weekWins, seasonWins, weekGames, seasonGames FROM arena_team WHERE arenaTeamId = " .. selectedTeamID)
		if teamInfoQuery then
			local teamName = teamInfoQuery:GetString(0)
			local teamRating = teamInfoQuery:GetUInt32(1)
			local teamRank = teamInfoQuery:GetUInt32(2)
			local teamType = teamInfoQuery:GetUInt32(3)
			local weekWins = teamInfoQuery:GetUInt32(4);
			local seasonWins = teamInfoQuery:GetUInt32(5);
			local weekGames = teamInfoQuery:GetUInt32(6);
			local seasonGames = teamInfoQuery:GetUInt32(7);
			local Seasonderrotas = seasonGames - seasonWins;
			local Weekderrotas = weekGames - weekWins;
			local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
			local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
			player:GossipMenuAddItem(9, " Time:    |cFF4B0082" .. teamName .. "|r\n Rating: |cffffff00" .. teamRating .. "|r (Rank: " .. teamRank .. " in " .. teamType .. "v" .. teamType .. ")" .. "\n Season: |cFF228B22" .. seasonWins .. "|r - " .. "|cFFFF6347" .. Seasonderrotas .. "|r (" .. SeasonWinrate .. " WR)" .. "\n Week:   |cFF228B22" .. weekWins .. "|r - " .. "|cFFFF6347" .. Weekderrotas .. "|r (" ..WeekWinrate .. " WR)", 0, 1)
			player:GossipMenuAddItem(9, " Membros: "  .. "\n", 0, 1)
		end
		
		local playersQuery = CharDBQuery("SELECT c.name, c.race, c.class, atm.personalrating, atm.seasonWins, atm.seasonGames, atm.weekWins, atm.weekGames FROM characters c JOIN arena_team_member atm ON c.guid = atm.guid WHERE atm.arenaTeamId = " .. selectedTeamID)
		if playersQuery then
			repeat
				local playerName = playersQuery:GetString(0)
				local playerRace = playersQuery:GetUInt8(1)
				local playerClass = playersQuery:GetUInt8(2)
				local personalRating = playersQuery:GetUInt32(3)
				local seasonWins = playersQuery:GetUInt32(4);
				local seasonGames = playersQuery:GetUInt32(5);
				local weekWins = playersQuery:GetUInt32(6);
				local weekGames = playersQuery:GetUInt32(7);
				local Seasonderrotas = seasonGames - seasonWins;
			    local Weekderrotas = weekGames - weekWins;
				local SeasonWinrate = getWinPercent(seasonWins, Seasonderrotas)
				local WeekWinrate = getWinPercent(weekWins, Weekderrotas)
				player:GossipMenuAddItem(9, Classe[playerClass] .. Raca[playerRace]  .. "|cFF4B0082 " .. playerName .. "|r | Rating: |cffffff00" .. personalRating .. "|r" .. "\n           Season: |cFF228B22" .. seasonWins .. "|r - |cFFFF6347" .. Seasonderrotas .. "|r (" .. SeasonWinrate .. " winrate)" .. "\n           Week:   |cFF228B22" .. weekWins .. "|r  - " .. "|cFFFF6347" .. Weekderrotas .. "|r (" .. WeekWinrate .. " winrate)", 0, 1)
			until not playersQuery:NextRow()
			player:GossipMenuAddItem(9,"Inicio", 0, 98)
		end
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end


	if (intid == 98) then -- Inicio
		On_Top_Hello(event, player, creature)
	end

	if (intid == 90) then -- Sair
		player:GossipComplete()	
	end	
	
end


function getWinPercent(wins, losses)
    local totalGames = wins + losses
    if totalGames == 0 then
        return "0%"
    end

    local percentage = (wins * 100) / totalGames
    return string.format("%d%%", percentage)
end


RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)



--[[

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
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Inicio",0,98)    
	    player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
	
--]]