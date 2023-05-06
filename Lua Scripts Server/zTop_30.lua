local UnitEntry = 94148

local Team =  {
				[0] = "|TInterface\\PVPFrame\\Pvp-Currency-Alliance.png:22|t",
				[1] = "|TInterface\\PVPFrame\\Pvp-Currency-Horde.png:22|t",
};

local Classes = { 
    [1] = "|TInterface\\icons\\INV_Sword_27.png:22|t",              -- Warrior
    [2] = "|TInterface\\icons\\INV_Hammer_01.png:22|t",             -- Paladin
    [3] = "|TInterface\\icons\\INV_Weapon_Bow_07.png:22|t",          -- Hunter
    [4] = "|TInterface\\icons\\INV_ThrowingKnife_04.png:22|t",        -- Rogue
    [5] = "|TInterface\\icons\\INV_Staff_30.png:22|t",               -- Priest
    [6] = "|TInterface\\icons\\Spell_Deathknight_ClassIcon.png:22|t", -- Death Knight
    [7] = "|TInterface\\icons\\inv_jewelry_talisman_04.png:22|t",    -- Shaman
    [8] = "|TInterface\\icons\\inv_staff_13.png:22|t",                 -- Mage
    [9] = "|TInterface\\icons\\spell_nature_drowsy.png:22|t",              -- Warlock
    [10] = "",                                                            					   -- Unk
    [11] = "[|TInterface\\icons\\Ability_Druid_Maul.png:22|t",         -- Druid
};

local Class = { 
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

local Classe = { 
    [1] = "|TInterface\\icons\\inv_sword_27.png:19:19:0:2|t",
    [2] = "|TInterface\\icons\\inv_hammer_01.png:19:19:0:2|t",
    [3] = "|TInterface\\icons\\inv_weapon_bow_07.png:19:19:0:2|t",
    [4] = "|TInterface\\icons\\inv_throwingknife_04.png:19:19:0:2|t",
    [5] = "|TInterface\\icons\\inv_staff_30.png:19:19:0:2|t",
    [6] = "|TInterface\\icons\\spell_deathknight_classicon.png:19:19:0:2|t",
    [7] = "|TInterface\\icons\\inv_jewelry_talisman_04.png:19:19:0:2|t",
    [8] = "|TInterface\\icons\\inv_staff_13.png:19:19:0:2|t",
    [9] = "|TInterface\\icons\\spell_nature_drowsy.png:19:19:0:2|t",
    [11] = "|TInterface\\icons\\inv_misc_monsterclaw_04.png:19:19:0:2|t"
};

local T = {
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

local function OnStats_H(event, player, creature)
    player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\n\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Top |cff0000ffArena |cffff0000Teams\n           |cFFFF00FF• |cFF000000Top |cffff0000Killers\n           |cFFFF00FF• |cFF000000Top |cff0000ffKiller |cFF000000por |cffff0000Classe"))
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_10:30|t Top |cFFFF00FF10 |cFF000000- [|cff0000ffArena |cffff0000Teams|cFF000000]", 0, 7001)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\achievement_pvp_p_15:30|t Top |cFFFF00FF30 |cFF000000- [|cff0000ffTotal |cffff0000killers|cFF000000]", 0, 7002)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\achievement_pvp_p_14:30|t Top |cFFFF00FF30 |cFF000000- [|cff0000ffClasse |cffff0000Killers|cFF000000] ", 0, 7003)
	player:GossipMenuAddItem(6, "|TInterface\\icons\\achievement_pvp_p_11:30|t Top |cFFFF00FF30 |cFF000000- [|cFF0000FFRaça |cffff0000Killers|cFF000000]", 0, 8000)
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

RegisterCreatureGossipEvent(UnitEntry, 1, OnStats_H)

function OnStats_S(event, player, creature, sender, intid, code)

if(intid == 7527) then
    local score = CharDBQuery("SELECT name,race,totalhonorPoints,class FROM characters ORDER BY totalhonorPoints DESC LIMIT 30")
            repeat
            local playername = score:GetString(0);
            local race = score:GetUInt32(1);
            local totalhonorPoints = score:GetUInt32(2);
            local class = score:GetUInt32(3);
		player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername .." |cFFFF00FF"..totalhonorPoints.." |cFF000000Honor", 20, 1000)
        until not score:NextRow()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)  
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 7528) then
    local score = CharDBQuery("SELECT name,race,arenaPoints,class FROM characters ORDER BY arenaPoints DESC LIMIT 30")
            repeat
            local playername = score:GetString(0);
            local race = score:GetUInt32(1);
            local arenaPoints = score:GetUInt32(2);
            local class = score:GetUInt32(3);
		player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername .." |cFFFF00FF"..arenaPoints.." |cFF000000Arena Points", 20, 1000)
        until not score:NextRow()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)  
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 7525) then
    local score = CharDBQuery("SELECT COUNT(*) FROM `characters` WHERE race = 1 OR race = 3 OR race = 4 OR race = 7 OR race = 11;")
        local race = score:GetUInt32(0);		
		repeat
		player:GossipMenuAddItem(9, "Total de |cFF0000FFAliança |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7526) then
    local score = CharDBQuery("SELECT COUNT(*) FROM `characters` WHERE race = 2 OR race = 5 OR race = 6 OR race = 8 OR race = 10;")
		repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cffff0000Hordas |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 8000) then
     player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Total de |cff0000ffRaças |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total de |cff0000ffClasses |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total |cff0000ffTempo |cffff0000Jogado"))    
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_human_male:27|t |cFF0000FFHumanos |cFF000000- [|cffff0000Top Killers]", 0, 8001)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_orc_male:27|t |cFF0000FFOrcs |cFF000000- [|cffff0000Top Killers]", 0, 8002)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_dwarf_male:27|t |cFF0000FFDwarfs |cFF000000- [|cffff0000Top Killers]", 0, 8003)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_nightelf_male:27|t |cFF0000FFNightelfs |cFF000000- [|cffff0000Top Killers]", 0, 8004)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_undead_male:27|t |cFF0000FFUndeads |cFF000000- [|cffff0000Top Killers]", 0, 8005)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_tauren_male:27|t |cFF0000FFTaurens |cFF000000- [|cffff0000Top Killers]", 0, 8006)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_gnome_male:27|t |cFF0000FFGnomes |cFF000000- [|cffff0000Top Killers]", 0, 8007)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_troll_male:27|t |cFF0000FFTrolls |cFF000000- [|cffff0000Top Killers]", 0, 8008)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_bloodelf_male:27|t |cFF0000FFBloodelfs |cFF000000- [|cffff0000Top Killers]", 0, 8009)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_draenei_male:27|t |cFF0000FFDraeneis |cFF000000- [|cffff0000Top Killers]", 0, 8010)   
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end

if(intid == 8001) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=1 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8002) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=2 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8003) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=3 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8004) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=4 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8005) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=5 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8006) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=6 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8007) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=7 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8008) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=8 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8009) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=10 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 8010) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE race=11 ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,8000)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 7001) then
     player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Total de |cff0000ffRaças |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total de |cff0000ffClasses |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total |cff0000ffTempo |cffff0000Jogado"))
    player:GossipMenuAddItem(3,"|TInterface\\icons\\Achievement_arena_2v2_7:30|t Top |cFFFF00FF10 |cFF000000- |cff0000ff2|cFF000000v|cff0000ff2 |cffff0000Teams", 0, 7005)
    player:GossipMenuAddItem(3,"|TInterface\\icons\\Achievement_arena_3v3_7:30|t Top |cFFFF00FF10 |cFF000000- |cff0000ff3|cFF000000v|cff0000ff3 |cffff0000Teams", 0, 7006)
    player:GossipMenuAddItem(3,"|TInterface\\icons\\Achievement_arena_5v5_7:30|t Top |cFFFF00FF10 |cFF000000- |cff0000ff5|cFF000000v|cff0000ff5 |cffff0000Teams ", 0, 7007)  
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 7002) then
            local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters ORDER BY totalKills DESC LIMIT 30")
            repeat	
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 2, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end					
	
if(intid == 7003) then
     player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Total de |cff0000ffRaças |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total de |cff0000ffClasses |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total |cff0000ffTempo |cffff0000Jogado"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_27.png:25|t Top |cFFFF00FF30 |cff0000ffWarrior |cffff0000killers",0, 7008)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_hammer_01.png:25|t Top |cFFFF00FF30 |cff0000ffPaladin |cffff0000killers",0, 7009)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_weapon_bow_07.png:25|t Top |cFFFF00FF30 |cff0000ffHunter |cffff0000killers",0, 7010)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_throwingknife_04.png:25|t Top |cFFFF00FF30 |cff0000ffRogue |cffff0000killers",0, 7011)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_30.png:25|t Top |cFFFF00FF30 |cff0000ffPriest |cffff0000killers",0, 7012)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_deathknight_classicon.png:25|t Top |cFFFF00FF30 |cff0000ffDeath Knight |cffff0000killers",0, 7013)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_talisman_04.png:25|t Top |cFFFF00FF30 |cff0000ffShaman |cffff0000killers",0, 7014)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_13.png:25|t Top |cFFFF00FF30 |cff0000ffMage |cffff0000killers",0, 7015)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_nature_drowsy.png:25|t Top |cFFFF00FF30 |cff0000ffWarlock |cffff0000killers",0, 7016)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_monsterclaw_04.png:25|t Top |cFFFF00FF30 |cff0000ffDruid |cffff0000killers",0, 7017)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 7004) then
     local score = CharDBQuery("SELECT name,kills,heroic_creatures,points FROM guild ORDER BY points DESC LIMIT 20")
        repeat
        name = score:GetString(0);
        kills = score:GetUInt32(1);
        heroic_creatures = score:GetUInt32(2);
        points = score:GetUInt32(3);		
        player:GossipMenuAddItem(9,"|cff0000ffGuild : |r ".. name ..",                                        |cff0000ffGuild PvP: |r|cFFFF00FF" .. kills .. ", \n|cff0000ffPlayers vivos na Raid e Dungeon: |r |cFFFF00FF"..heroic_creatures..",         |cff0000ffTotal Points: |r |cFFFF00FF"..points.."", 5, 0)
        until not score:NextRow() 
        player:GossipComplete()   
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 7005) then
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=2 ORDER BY rating DESC LIMIT 20")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(2);
		seasonWins = score:GetUInt32(3);
        player:GossipMenuAddItem(9,"|cff0000ffTime : |r ".. time ..",                                                      |cff0000ffRating: |r|cFFFF00FF" .. pontos .. ",                                                       \n|cff0000ffJogos Totais: |r |cFFFF00FF"..seasonGames..",                                                       |cff0000ffVitórias: |r |cFFFF00FF"..seasonWins.."", 5, 0)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end			

if(intid == 7006) then
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=3 ORDER BY rating DESC LIMIT 20")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(3);
		seasonWins = score:GetUInt32(2);
        player:GossipMenuAddItem(9,"|cff0000ffTime : |r ".. time ..",                                                      |cff0000ffRating: |r|cFFFF00FF" .. pontos .. ",                                                       \n|cff0000ffJogos Totais: |r |cFFFF00FF"..seasonWins.."", 5, 0)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end	

if(intid == 7007) then
    local score = CharDBQuery("SELECT name,rating,seasonWins,seasonGames FROM arena_team WHERE type=5 ORDER BY rating DESC LIMIT 20")
        repeat
        time = score:GetString(0);
        pontos = score:GetUInt32(1);
	    seasonGames = score:GetUInt32(3);
		seasonWins = score:GetUInt32(2);
        player:GossipMenuAddItem(9,"|cff0000ffTime : |r ".. time ..",                                                      |cff0000ffRating: |r|cFFFF00FF" .. pontos .. ",                                                       \n|cff0000ffJogos Totais: |r |cFFFF00FF"..seasonWins.."", 5, 0)
        until not score:NextRow() 
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end	

if (intid == 7008) then
		local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=1 ORDER BY totalKills DESC LIMIT 30") -- Warrior
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 8, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7009) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=2 ORDER BY totalKills DESC LIMIT 30") -- Paladino
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 9, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7010) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=3 ORDER BY totalKills DESC LIMIT 30") -- Hunter
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 10, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7011) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=4 ORDER BY totalKills DESC LIMIT 30") -- Rogue
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 11, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7012) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=5 ORDER BY totalKills DESC LIMIT 30") -- Priest
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 12, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7013) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=6 ORDER BY totalKills DESC LIMIT 30") -- Death Knight
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 13, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7014) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=7 ORDER BY totalKills DESC LIMIT 30") -- Shaman
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 14, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7015) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=8 ORDER BY totalKills DESC LIMIT 30") -- Mage
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 15, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end
if (intid == 7016) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=9 ORDER BY totalKills DESC LIMIT 30") -- Warlock
        repeat
						local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 16, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
end
if (intid == 7017) then
        local score = CharDBQuery("SELECT name,race,totalKills,class FROM characters WHERE class=11 ORDER BY totalKills DESC LIMIT 30") -- Druid 
        repeat
			local playername = score:GetString(0);
			local race = score:GetUInt32(1);
			local kills = score:GetUInt32(2);
			local class = score:GetUInt32(3);	
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername ..", |cFF000000Total Kills: |r |cFFFF00FF" .. kills .. "", 17, 1)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7003)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)		
end

if(intid == 7500) then
     player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Total de |cff0000ffRaças |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total de |cff0000ffClasses |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total |cff0000ffTempo |cffff0000Jogado"))
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_human_male:27|t |cFF0000FFHumanos |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7503)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_orc_male:27|t |cFF0000FFOrcs |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7504)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_dwarf_male:27|t |cFF0000FFDwarfs |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7505)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_nightelf_male:27|t |cFF0000FFNightelfs |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7506)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_undead_male:27|t |cFF0000FFUndeads |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7507)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_tauren_male:27|t |cFF0000FFTaurens |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7508)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_gnome_male:27|t |cFF0000FFGnomes |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7509)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_troll_male:27|t |cFF0000FFTrolls |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7510)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_bloodelf_male:27|t |cFF0000FFBloodelfs |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7511)
    player:GossipMenuAddItem(6, "|TInterface\\icons\\Achievement_character_draenei_male:27|t |cFF0000FFDraeneis |cFF000000- [|cffff0000Total |cFF000000Criados]", 0, 7512)   
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end

if(intid == 7503) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 1")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFHumanos |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7504) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 2")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFOrcs |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7505) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 3")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFDwarfs |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7506) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 4")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFNightElfs |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7507) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 5")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFUndeads |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7508) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 6")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFTaurens |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7509) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 7")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFGnomes |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7510) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 8")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFTrolls |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7511) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 10")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFBloodelfs |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	
	
if(intid == 7512) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE race = 11")
        repeat
		local race = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFDraeneis |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7500)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end		

if(intid == 7501) then
     player:GossipSetText(string.format("                     |TInterface\\icons\\Achievement_bg_winwsg:55:55:30:0|t\nAtravés desse NPC, você pode verificar ás seguintes opções: \n\n           |cFFFF00FF• |cFF000000Total de |cff0000ffRaças |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total de |cff0000ffClasses |cffff0000Criadas\n           |cFFFF00FF• |cFF000000Total |cff0000ffTempo |cffff0000Jogado"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_27.png:27|t |cFF0000FFWarriors |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7513)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_hammer_01.png:27|t |cFF0000FFPaladins |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7514)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_weapon_bow_07.png:27|t |cFF0000FFHunters |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7515)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_throwingknife_04.png:27|t |cFF0000FFRogues |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7516)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_30.png:27|t |cFF0000FFPriests |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7517)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_deathknight_classicon.png:27|t |cFF0000FFDeath Knights |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7518)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_talisman_04.png:27|t |cFF0000FFShamans |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7519)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_13.png:27|t |cFF0000FFMages |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7520)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_nature_drowsy.png:27|t |cFF0000FFWarlocks |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7521)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_monsterclaw_04.png:27|t |cFF0000FFDruids |cFF000000- [|cffff0000Total |cFF000000Criados]",0, 7522)	
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7513) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 1")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFWarriors |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7514) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 2")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFPaladins |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7515) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 3")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFHunters |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7516) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 4")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFRogues |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7517) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 5")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFPriests |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7518) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 6")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFDeath Knights |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7519) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 7")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFShamans |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7520) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 8")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFMages |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7521) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 9")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, " Total de |cFF0000FFWarlocks |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end	

if(intid == 7522) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters WHERE class = 11")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFDruids |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,7501)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
if(intid == 7523) then
    local score = CharDBQuery("SELECT COUNT(*) FROM characters")
        repeat
		local class = score:GetUInt32(0);		
		player:GossipMenuAddItem(9, "Total de |cFF0000FFPersonagens |cFF000000Criados: |cFFFF00FF[|cffff0000"..score:GetUInt32(0).."|cFFFF00FF]|r", 6, 1)
        until not score:NextRow()		
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)		
	player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end
	
if(intid == 7524) then
    local score = CharDBQuery("SELECT name,race,money,class FROM characters ORDER BY money DESC LIMIT 30")
            repeat
            local playername = score:GetString(0);
            local race = score:GetUInt32(1);
            local money = score:GetUInt32(2);
            local class = score:GetUInt32(3);

            local gold = string.format("%02.f", math.floor(money/10000));
            player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername .." |cFFFF00FF"..gold.." |cFF000000Gold", 20, 1000)
        until not score:NextRow()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)  
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end	

if(intid == 7502) then
	
        local score = CharDBQuery("SELECT name,race,class,totaltime FROM characters ORDER BY totaltime DESC LIMIT 30")
        repeat
		local playername = score:GetString(0);
		local race = score:GetUInt32(1);
		local class = score:GetUInt32(2);
        
		local nSeconds = score:GetUInt32(3);
        nHours = string.format("%02.f", math.floor(nSeconds/3600));
        nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
        nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));			
					
        player:GossipMenuAddItem(9, " "..Team[T[race]]..""..Classe[class].."".. playername .." |cFF000000Tempo Total:|r \n|cFFFF00FF"..nHours.." |cFF000000Horas |cFFFF00FF"..nMins.." |cFF000000Minutos |cFFFF00FF"..nSecs.." |cFF000000Segundos", 20, 1000)
        until not score:NextRow()
        player:GossipComplete()
        player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)    
	    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair",0,500)	
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if (intid == 499) then
   OnStats_H(event, player, creature)
   end

if (intid == 500) then
   player:GossipComplete()	
   end		
end

RegisterCreatureGossipEvent(UnitEntry, 2, OnStats_S)
