--local UnitEntry = 94147
local UnitEntry = 99999

local Team =  
{
	[0] = "|TInterface\\PVPFrame\\Pvp-Currency-Alliance.png:20|t",
	[1] = "|TInterface\\PVPFrame\\Pvp-Currency-Horde.png:20|t",
};

local T = 
{
    [1] = 0, -- Human
    [2] = 1, -- orc
    [3] = 0, -- Dwarf
    [4] = 0, -- Night Elf
    [5] = 1, -- Undead
    [6] = 1, -- Tauren
    [7] = 0, -- Gnome
    [8] = 1, -- Troll
    [10] = 1, -- Blood Elf
    [11] = 0, -- Draenei
};	

local R = 
{
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

local Raca = 
{ 
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



local Class = 
{ 
    [1] = "|cFF000000 Warrior", -- Warrior
    [2] = "|cFF000000 Paladin", -- Paladin
    [3] = "|cFF000000 Hunter", -- Hunter
    [4] = "|cFF000000 Rogue", -- Rogue
    [5] = "|cFF000000 Priest", -- Priest
    [6] = "|cFF000000 Dk", -- Death Knight
    [7] = "|cFF000000 Shaman", -- Shaman
    [8] = "|cFF000000 Mage", -- Mage
    [9] = "|cFF000000 Warlock", -- Warlock
    [11] = "|cFF000000 Druid" -- Druid
};

--[[
local Class = 
{ 
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
--]]

local Classe = 
{ 
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


local function On_Top_Hello2(event, player, creature)
    player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_10:25|t Top |cFF0000FF10|r Arena Ladder", 0, 300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_killxenemies_generalsroom:25|t Top |cFF0000FF10|r Killers|cFF000000 [|cffff0000Por Classe|r]", 0, 3)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_kill_flag_carrier:25|t Top |cFF0000FF10|r Killers |cFF000000[|cffff0000Total|r]", 0, 2)
	--player:GossipMenuAddItem(9, "|TInterface\\icons\\achievement_bg_winwsg:27|t |cFF000000Personagens |cFF000000- [|cFF0000FFTotal |cffff0000Criados|cFF000000]", 0, 203) -- personagems total criados
	player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_bg_3flagcap_nodeaths:25|t |cFF000000Classes |cFF000000- [|cFF0000FFTotal |cffff0000Criadas|cFF000000]", 0, 202) -- classes total criadas
	player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_bg_overcome500disadvantage:25|t |cFF000000Raças |cFF000000- [|cFF0000FFTotal |cffff0000Criadas|cFF000000]", 0, 201) -- Raças total criadas
	
    player:GossipMenuAddItem(9, "|TInterface\\icons\\inv_bannerpvp_02:25|t Total de |cFF0000FFAlliance |cFF000000Criados: [|cffff0000" .. GetAllianceTotal() .. "|r]", 0, 98) -- alliance total criados
    player:GossipMenuAddItem(9, "|TInterface\\icons\\inv_bannerpvp_01:25|t Total de |cffff0000Horde |cFF000000Criados: [|cffff0000" .. GetHordeTotal() .. "|r]", 0, 98) -- horde total criados
	
	
	player:GossipMenuAddItem(9, "|TInterface\\icons\\achievement_bg_grab_cap_flagunderxseconds:25|t Top |cFF0000FF30 |cFF000000- [|cff0000ffPlayed |cffff0000Time|cFF000000]", 0, 206) -- top 30 played time
	--player:GossipMenuAddItem(9, "|TInterface\\icons\\Inv_misc_coin_02:25|t |cFF000000Top |cFF0000FF20 |cFF000000- [|cff0000ffGold |cffff0000Rich|cFF000000]", 0, 207) -- top 20 gold rich
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function GetAllianceTotal()
    local score = CharDBQuery("SELECT COUNT(*) FROM `characters` WHERE race = 1 OR race = 3 OR race = 4 OR race = 7 OR race = 11;")
    return tostring(score:GetUInt32(0))
end

function GetHordeTotal()
    local score = CharDBQuery("SELECT COUNT(*) FROM `characters` WHERE race = 2 OR race = 5 OR race = 6 OR race = 8 OR race = 10;")
    return tostring(score:GetUInt32(0))
end

function On_Top_Select2(event, player, creature, sender, intid, code)
	if(intid >= 1) then -- apenas times ArenaTeamID igual ou maior que 1
		selectedTeamID = intid
		player:GossipSetText(" ")
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
			player:GossipMenuAddItem(9, " Time:    |cFF4B0082" .. teamName .. "|r\n Rating: |cffffff00" .. teamRating .. "|r  (Rank: " .. teamRank .. " in " .. teamType .. "v" .. teamType .. ")" .. "\n \n Season: |cFF228B22" .. seasonWins .. "|r - " .. "|cFFFF6347" .. Seasonderrotas .. "|r (" .. SeasonWinrate .. " WR)" .. "\n Week:   |cFF228B22" .. weekWins .. "|r - " .. "|cFFFF6347" .. Weekderrotas .. "|r (" ..WeekWinrate .. " WR)", 0, 1)
			player:GossipMenuAddItem(8, " Membros: "  .. "\n", 0, 1)
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
				player:GossipMenuAddItem(9, " " .. Classe[playerClass] .. Raca[playerRace]  .. "|cFF4B0082 " .. playerName .. "|r | Rating: |cffffff00" .. personalRating .. "|r" .. "\n              Season: |cFF228B22" .. seasonWins .. "|r - |cFFFF6347" .. Seasonderrotas .. "|r (" .. SeasonWinrate .. " winrate)" .. "\n              Week:   |cFF228B22" .. weekWins .. "|r - " .. "|cFFFF6347" .. Weekderrotas .. "|r (" .. WeekWinrate .. " winrate)\n-----------------------------------------------", 0, 1)
			until not playersQuery:NextRow()
			player:GossipMenuAddItem(9," Voltar para o Top |cFF0000FF15|r - 2v2  |TInterface\\icons\\Achievement_arena_2v2_7:20|t", 0, 5)
			player:GossipMenuAddItem(9," Voltar para o Top |cFF0000FF15|r - 3v3  |TInterface\\icons\\Achievement_arena_3v3_7:20|t", 0, 6)
			player:GossipMenuAddItem(9," Voltar para o Top |cFF0000FF15|r - 5v5  |TInterface\\icons\\Achievement_arena_5v5_7:20|t", 0, 7)
			player:GossipMenuAddItem(9," |TInterface/PaperDollInfoFrame/UI-GearManager-Undo:18:18:0:0|t Inicio", 0, 98)
		end
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end

	if(intid == 300) then -- Arena Ladder (Top 15 2v2/3v3/5v5/1v1)
	player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_7:27|t 2v2 |cFF000000Teams - Top |cFF0000FF15|r", 0, 5)
		player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_3v3_7:27|t 3v3 |cFF000000Teams - Top |cFF0000FF15|r", 0, 6)
		player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_5v5_7:27|t 5v5 |cFF000000Teams - Top |cFF0000FF15|r", 0, 7)
		player:GossipMenuAddItem(9," |TInterface/Icons/Achievement_bg_trueavshutout:27|t 1v1 |cFF000000Teams - Top |cFF0000FF15|r", 0, 20)
		player:GossipMenuAddItem(5," |TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end

	if(intid == 2) then -- TOP KILLS Total
	player:GossipSetText(string.format("Aqui estão os tops 10 jogadores com mais Honorable Kills do servidor:"))
			local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters ORDER BY totalKills DESC LIMIT 10")
				repeat	
				local playername = score:GetString(0);
				local race = score:GetUInt32(1);
				local kills = score:GetUInt32(2);
				local class = score:GetUInt32(3);	
				player:GossipMenuAddItem(9, ""..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills:|r |cffffff00" .. kills .. "", 2, 98)
			until not score:NextRow()
		player:GossipComplete()
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end					

	
	if(intid == 3) then	-- TOP CLASSES
	player:GossipSetText(string.format("\nAqui estão os top 10 Killers de cada Classe do servidor:"))
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_sword_27.png:20|t Top 10 |cFF8B4513Warrior |cFF000000Killers",0, 8)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_hammer_01.png:20|t Top 10 |cffff00ffPaladin |cFF000000Killers",0, 9)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_weapon_bow_07.png:20|t Top 10 |cFF228B22Hunter |cFF000000Killers",0, 10)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_throwingknife_04.png:20|t Top 10 Rogue |cFF000000Killers",0, 11)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_30.png:20|t Top 10 |cFFFFFFFFPriest |cFF000000Killers",0, 12)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_deathknight_classicon.png:20|t Top 10 |cFF8B0000Death Knight |cFF000000Killers",0, 13)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_jewelry_talisman_04.png:20|t Top 10 |cff0000ffShaman |cFF000000Killers",0, 14)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_13.png:20|t Top 10 |cFF00BFFFMage |cFF000000Killers",0, 15)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_nature_drowsy.png:20|t Top 10 |cFF800080Warlock |cFF000000Killers",0, 16)
		player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_misc_monsterclaw_04.png:20|t Top 10 |cFFFF4500Druid |cFF000000Killers",0, 17)
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF8B0000Voltar",0,98)    
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end

	-- Arena Ranking
	if(intid == 5) then -- 2v2
    player:GossipSetText("Aqui estão os top 15 times de arena 2v2.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=2 ORDER BY rating DESC LIMIT 15")
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
				player:GossipMenuAddItem(9, " Time #" .. teamRank .. ": |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] "|r \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)\n_______________________________________", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 2v2 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 300)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 300)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	-- 3v3
	if(intid == 6) then
    player:GossipSetText("Aqui estão os top 15 times de arena 3v3.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=3 ORDER BY rating DESC LIMIT 15")
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
				player:GossipMenuAddItem(9, " Time #" .. teamRank .. ": |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] "|r \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)\n_______________________________________", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 3v3 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 300)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 300)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	-- 5v5
	if(intid == 7) then
    player:GossipSetText("Aqui estão os top 15 times de arena 5v5.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=5 ORDER BY rating DESC LIMIT 15")
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
				player:GossipMenuAddItem(9, " Time #" .. teamRank .. ": |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] "|r \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)\n_______________________________________", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 5v5 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 300)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 300)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
	-- 1v1
	if(intid == 20) then
    player:GossipSetText("Aqui estão os top 15 players de arena 1v1.")
        local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames,arenaTeamId,weekWins,weekGames, `rank` FROM arena_team WHERE type=1 ORDER BY rating DESC LIMIT 15")
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
				player:GossipMenuAddItem(9, " Player rank #" .. teamRank .. ": |cFF4B0082".. Team .."|r  -  Rating: |cffffff00" .. TRating .. --[["|r  Rank: " .. teamRank ..--]] "|r \n   Season: |cFF228B22" --[[Vitórias--]] ..seasonWins.."|r - |cFFFF6347"--[[Derrotas--]] .. Seasonderrotas .. "|r  (" .. SeasonWinrate .. " Winrate)\n   Week:   |cFF228B22".. weekGames .. "|r - |cFFFF6347" .. Weekderrotas .. "|r  (" .. WeekWinrate .. " WR)\n_______________________________________", 0, teamID)
			until not score:NextRow() 
        else
			player:GossipSetText("Não há times de arena 1v1 disponíveis.")
			player:GossipMenuAddItem(9,"Voltar", 0, 300)
			player:GossipMenuAddItem(9,"Sair", 0, 90)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
			return
		end
		player:GossipMenuAddItem(9,"Voltar", 0, 300)
        player:GossipComplete()
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	



	---- Top Kill por CLASSE----
	if (intid == 8) then -- Warrior
		player:GossipSetText(string.format(" "))
		local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=1 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. " ", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	elseif (intid == 9) then -- Paladino
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=2 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 10) then -- Hunter
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=3 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 11) then -- Rogue
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=4 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 12) then -- Priest
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=5 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 13) then -- Death Knight
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=6 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 14) then -- Shaman
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=7 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 15) then -- Mage
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=8 ORDER BY totalKills DESC LIMIT 10")
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end
	if (intid == 16) then -- Warlock
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=9 ORDER BY totalKills DESC LIMIT 10") 
        repeat
						local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
	end
	if (intid == 17) then -- Druid
		player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=11 ORDER BY totalKills DESC LIMIT 10")  
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Classe[class].." "..Raca[R[race]].." "..Team[T[race]].." ".. playername ..", |cFF000000Total Kills: |r |cffffff00" .. kills .. "", 0, 3)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,3)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
	end




	if(intid == 201) then -- Raças total criadas
	player:GossipSetText(string.format("Em ordem decrescente:"))
		local races = {
        [1] = {name = "Humans", icon = "Interface\\icons\\Achievement_character_human_male:20"},
        [2] = {name = "Orcs", icon = "Interface\\icons\\Achievement_character_orc_male:20"},
        [3] = {name = "Dwarfs", icon = "Interface\\icons\\Achievement_character_dwarf_male:20"},
        [4] = {name = "Night Elfs", icon = "Interface\\icons\\Achievement_character_nightelf_male:20"},
        [5] = {name = "Undeads", icon = "Interface\\icons\\Achievement_character_undead_male:20"},
        [6] = {name = "Taurens", icon = "Interface\\icons\\Achievement_character_tauren_male:20"},
        [7] = {name = "Gnomes", icon = "Interface\\icons\\Achievement_character_gnome_male:20"},
        [8] = {name = "Trolls", icon = "Interface\\icons\\Achievement_character_troll_male:20"},
        [10] = {name = "Blood Elfs", icon = "Interface\\icons\\Achievement_character_bloodelf_male:20"},
        [11] = {name = "Draeneis", icon = "Interface\\icons\\Achievement_character_draenei_male:20"}
		}

		local raceTotals = {}
		for race, data in pairs(races) do
			local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = "..race)
			local total = score:GetUInt32(0)
			table.insert(raceTotals, {name = data.name, icon = data.icon, total = total})
		end

		-- Ordena a tabela com base no número total de jogadores
		table.sort(raceTotals, function(a, b) return a.total > b.total end)

		for _, data in ipairs(raceTotals) do
			player:GossipMenuAddItem(9, string.format("|T%s|t Total de |cFF0000FF%s |cFF000000Criados: |cFF0000FF[|cffff0000%d|cFF0000FF]|r", data.icon, data.name, data.total), 6, 201)
		end
    
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF8B0000Voltar",0,98)        
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	elseif(intid >= 208 and intid <= 217) then -- Raças totais
		local race = intid - 200
		player:GossipSetText(string.format(" "))
		local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = "..race)
		local total = score:GetUInt32(0)
		local raceName = races[race].name
		player:GossipMenuAddItem(9, string.format("Total de |cFF0000FF%s |cFF000000Criados: |cFF0000FF[|cffff0000%d|cFF0000FF]|r", raceName, total), 6, 201)
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,201)            
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end



	if(intid == 202) then -- classes total criadas
    player:GossipSetText(string.format("Em ordem decrescente:"))
		local classes = {
        [1] = {name = "Warriors", icon = "Interface\\icons\\inv_sword_27.png"},
        [2] = {name = "Paladins", icon = "Interface\\icons\\inv_hammer_01.png"},
        [3] = {name = "Hunters", icon = "Interface\\icons\\inv_weapon_bow_07.png"},
        [4] = {name = "Rogues", icon = "Interface\\icons\\inv_throwingknife_04.png"},
        [5] = {name = "Priests", icon = "Interface\\icons\\inv_staff_30.png"},
        [6] = {name = "Death Knights", icon = "Interface\\icons\\spell_deathknight_classicon.png"},
        [7] = {name = "Shamans", icon = "Interface\\icons\\inv_jewelry_talisman_04.png"},
        [8] = {name = "Mages", icon = "Interface\\icons\\inv_staff_13.png"},
        [9] = {name = "Warlocks", icon = "Interface\\icons\\spell_nature_drowsy.png"},
        [11] = {name = "Druids", icon = "Interface\\icons\\inv_misc_monsterclaw_04.png"}
		}
    
		local classTotals = {}
		for class, data in pairs(classes) do
			local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = "..class)
			local total = score:GetUInt32(0)
			classTotals[class] = {name = data.name, icon = data.icon, total = total}
		end

		-- Ordena a tabela com base no número total de jogadores
		table.sort(classTotals, function(a, b) return a.total > b.total end)

		for _, data in ipairs(classTotals) do
			player:GossipMenuAddItem(9, string.format("|T%s:20|t Total de |cFF0000FF%s |cFF000000Criados: |cFF0000FF[|cffff0000%d|cFF0000FF]|r", data.icon, data.name, data.total), 6, 202)
		end
    
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)            
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end


	
	if(intid == 203) then -- personagens total criados
	player:GossipSetText(string.format(" "))
		local score = CharDBQuery("SELECT COUNT(*) FROM characters")
        repeat
		local class = score:GetUInt32(0);
		player:GossipMenuAddItem(9, "Total de |cFF0000FFPersonagens |cFF000000Criados: |cFF0000FF[|cffff0000"..score:GetUInt32(0).."|cFF0000FF]|r", 6, 98)
        until not score:NextRow()		
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)		
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
	if(intid == 207) then -- Gold Rich
	player:GossipSetText(string.format(" "))
		local score = CharDBQuery("SELECT name,race,money,class FROM characters ORDER BY money DESC LIMIT 30")
            repeat
            local playername = score:GetString(0);
            local race = score:GetUInt32(1);
            local money = score:GetUInt32(2);
            local class = score:GetUInt32(3);

            local gold = string.format("%02.f", math.floor(money/10000));
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername .." |cFF0000FF"..gold.." |cFF000000Gold", 20, 98)
        until not score:NextRow()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end	

	if(intid == 206) then -- Played Time
	player:GossipSetText(string.format(" "))
        local score = CharDBQuery("SELECT name,race,class,totaltime FROM characters ORDER BY totaltime DESC LIMIT 30")
        repeat
		local playername = score:GetString(0);
		local race = score:GetUInt32(1);
		local class = score:GetUInt32(2);
        
		local nSeconds = score:GetUInt32(3);
        nHours = string.format("%02.f", math.floor(nSeconds/3600));
        nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
        nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));			
					
        player:GossipMenuAddItem(9, ""..Team[T[race]]..""..Classe[class].." ".. playername .." |cFF000000| Played:|r |cFF0000FF"..nHours.." |cFF000000Horas", 20, 98)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,98)    
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

	if (intid == 98) then -- Inicio
		On_Top_Hello2(event, player, creature)
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

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello2)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select2)
