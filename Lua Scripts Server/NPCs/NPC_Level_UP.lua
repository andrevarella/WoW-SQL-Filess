local UnitEntry = 94150

function TeleporterLow_Gossip(unit, player, creature)
	player:GossipSetText(string.format("Escolha o level que quiser!\n\nPerfeito para quem gosta de ter um personagem twink ou para quem não gosta de upar. Mas também opcional para quem curte upar ;)"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_chest_cloth_49:30|t Comprar Heirlooms", 0, 10)
	
	-- Alliance Races
    if (player:GetRace()) == 1 then -- Human
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_elwynnforest.png:29|t Ir para Goldshire (Elwynn Forest)", 1, 13, false, "Você será teleportado para Elwynn Forest, tem certeza?")
	elseif (player:GetRace()) == 3 then -- Dwarf
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_elwynnforest.png:29|t Ir para Goldshire (Elwynn Forest)", 1, 14, false, "Você será teleportado para Elwynn Forest, tem certeza?")
	elseif (player:GetRace()) == 4 then -- Night Elf
		player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_darnassus.png:29|t Ir para Dolanaar (Teldrassil)", 1, 15, false, "Você será teleportado para Dolanaar, tem certeza?")
	elseif (player:GetRace()) == 7 then -- Gnome
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_elwynnforest.png:29|t Ir para Goldshire (Elwynn Forest)", 1, 16, false, "Você será teleportado para Elwynn Forest, tem certeza?")
	elseif (player:GetRace()) == 11 then -- Draenei
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_azuremystisle_01.png:30|t Ir para Azure Watch (Azuremyst Isle)", 1, 17, false, "Você será teleportado para Azure Watch, tem certeza?")
	
	-- Horde Races
	elseif (player:GetRace()) == 2 then -- Orc
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_durotar.png:29|t Ir para Sen'jin Village (Durotar)", 1, 18, false, "Você será teleportado para Sen'jin Village, tem certeza?")
	elseif (player:GetRace()) == 5 then -- Undead
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_tirisfalglades_01.png:29|t Ir para Brill (Tirisfal Glades)", 1, 19, false, "Você será teleportado para Brill, tem certeza?")
	elseif (player:GetRace()) == 6 then -- Tauren
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_mulgore_01.png:29|t Ir para Bloodhoof Village (Mulgore)", 1, 20, false, "Você será teleportado para Bloodhoof Village, tem certeza?")
	elseif (player:GetRace()) == 8 then -- Troll
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_durotar.png:29|t Ir para Sen'jin Village (Durotar)", 1, 21, false, "Você será teleportado para Sen'jin Village, tem certeza?")
	elseif (player:GetRace()) == 10 then -- Blood Elf
		player:GossipMenuAddItem(2, "|TInterface\\icons\\achievement_zone_ghostlands.png:29|t Ir para Tranquillien (Ghostlands) ", 1, 22, false, "Você será teleportado para Ghostlands, tem certeza?")
	end
	
    if (player:IsAlliance()) then
		player:GossipMenuAddItem(2, "Upar para o level 20  |TInterface\\icons\\Achievement_zone_redridgemountains.png:24|t", 1, 1, false, "Você será teleportado para Redridge Mountains, tem certeza que quer upar para o level 20?")
		player:GossipMenuAddItem(2, "Upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:24|t", 1, 3, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	elseif (player:IsHorde()) then
		player:GossipMenuAddItem(2, "Upar para o level 20  |TInterface\\icons\\Achievement_zone_stonetalon_01.png:24|t", 1, 2, false, "Você será teleportado para Stonetalon Mountain, tem certeza que quer upar para o level 20?")
		player:GossipMenuAddItem(2, "Upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:24|t", 1, 4, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	end
	
	-- Gossip para ambas Facções:
	player:GossipMenuAddItem(2, "Upar para o level 40  |TInterface\\icons\\Achievement_zone_tanaris_01.png:24|t", 1, 5, false, "Você será teleportado para Tanaris, tem certeza que quer upar para o level 40?")
	player:GossipMenuAddItem(2, "Upar para o level 50  |TInterface\\icons\\Achievement_zone_ungorocrater_01.png:24|t", 1, 6, false, "Você será teleportado para Un'Goro, tem certeza que quer upar para o level 50?")
	player:GossipMenuAddItem(2, "Upar para o level 60  |TInterface\\icons\\Achievement_zone_blastedlands_01.png:24|t", 1, 7, false, "Você será teleportado para o Dark Portal, tem certeza que quer upar para o level 60?")
	player:GossipMenuAddItem(2, "Upar para o level 70  |TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:24|t", 1, 8, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 70?")
	player:GossipMenuAddItem(4, "Upar para o level 80 (Fase de Teste)", 1, 9, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 80?")
    player:GossipSendMenu(0x7FFFFFFF, creature, menuid)
end

RegisterCreatureGossipEvent(UnitEntry, 1, TeleporterLow_Gossip)

function Teleporter_Event(event, player, creature, sender, intid, code)
	
   if(intid == 10) then
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_chest_cloth_49:28|t Set Heirloom ",0, 11)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_43:28|t Armas Heirloom ",0, 12)
		player:GossipMenuAddItem(2,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
   end
	
   if(intid == 11) then -- Heirloom Set
   player:SendListInventory(creature, 80049)
   end
   if(intid == 12) then -- Heirloom Armas
   player:SendListInventory(creature, 80271)
   end
   
   
    -- Alliance Level 10
   	-- Human - Goldshire
	if(intid == 13) then
        player:Teleport(0, -9457.064453, 62.235569, 55.807610, 3.047343)
        player:GossipComplete()
    end
	-- Dwarf - Goldshire
	if(intid == 14) then
        player:Teleport(0, -9457.064453, 62.235569, 55.807610, 3.047343)
        player:GossipComplete()
    end
	-- Night Elf
	if(intid == 15) then
        player:Teleport(1, 9854.443359, 958.822266, 1306.381714, 2.004915)
        player:GossipComplete()
    end
	-- Gnome
	if(intid == 16) then
        player:Teleport(0, -9457.064453, 62.235569, 55.807610, 3.047343)
        player:GossipComplete()
    end
	-- Draenei
	if(intid == 17) then
        player:Teleport(530, -4199.590332, -12492.487305, 44.977177, 0.913398)
        player:GossipComplete()
    end
	
	-- Hordes level 10
	-- Orc
	if(intid == 18) then
        player:Teleport(1, -832.231567, -4919.145020, 19.976885, 0.471228)
        player:GossipComplete()
    end
	-- undead
	if(intid == 19) then
        player:Teleport(0, 2255.717041, 292.238892, 34.241997, 0.286228)
        player:GossipComplete()
    end
	-- Tauren
	if(intid == 20) then
        player:Teleport(1, -2323.035645, -369.353821, -9.037930, 4.963684)
        player:GossipComplete()
    end
	-- Troll
	if(intid == 21) then
        player:Teleport(1, -832.231567, -4919.145020, 19.976885, 0.471228)
        player:GossipComplete()
    end
	-- Blood Elf
	if(intid == 22) then
        player:Teleport(530, 7584.564941, -6836.606445, 88.912804, 3.336861)
        player:GossipComplete()
    end


	-- level 20 (Redridge Mountains) Alliance
	if(intid == 1) then
        if(player:GetLevel() < 20) then
            player:SetLevel(20)
            player:Teleport(0, -9614.198242, -1893.209106, 58.8900377, 4.968749)
        else
            player:SendBroadcastMessage("Você já é level 20 ou maior.")
        end
        player:GossipComplete()
    end
	
	
	-- level 20 (Stonetalon Mountain) Horde
	if(intid == 2) then
        if(player:GetLevel() < 20) then
            player:SetLevel(20)
            player:Teleport(1, 957.639771, 940.579590, 104.646469, 3.844471)
        else
            player:SendBroadcastMessage("Você já é level 20 ou maior.")
        end
        player:GossipComplete()
    end
	
    -- level 30 (Stranglethorn North) Alliance
	if(intid == 3) then
        if(player:GetLevel() < 30) then
            player:SetLevel(30)
            player:Teleport(0, -11322.040039, -198.108765, 75.936325, 5.893143)
        else
            player:SendBroadcastMessage("Você já é level 30 ou maior.")
        end
        player:GossipComplete()
    end
	
    -- level 30 (Stranglethorn North) Horde
	if(intid == 4) then
        if(player:GetLevel() < 30) then
            player:SetLevel(30)
            player:Teleport(0, -12366.157227, 183.224411, 2.950227, 4.815650)
        else
            player:SendBroadcastMessage("Você já é level 30 ou maior.")
        end
        player:GossipComplete()
    end
	
    -- level 40 (Tanaris) Ally/Horde
		if(intid == 5) then
        if(player:GetLevel() < 40) then
            player:SetLevel(40)
            player:Teleport(1, -7168.699219, -3802.841797, 8.408584, 2.558025)
        else
            player:SendBroadcastMessage("Você já é level 40 ou maior.")
        end
        player:GossipComplete()
    end
	
	-- level 50 (Un'Goro) Ally/Horde
	if(intid == 6) then
        if(player:GetLevel() < 50) then
            player:SetLevel(50)
            player:Teleport(1, -7859.723145, -2101.572266, -265.623047, 0.150812)
        else
            player:SendBroadcastMessage("Você já é level 50 ou maior.")
        end
        player:GossipComplete()
    end

    -- level 60 (Dark Portal) Ally/Horde
    if(intid == 7) then
        if(player:GetLevel() < 60) then
            player:SetLevel(60)
            player:Teleport(0, -11808.083984, -3203.471924, -29.097700, 3.011407)
        else
            player:SendBroadcastMessage("Você já é level 60 ou maior.")
        end
        player:GossipComplete()
    end
	
	-- level 70 (Voldrune/Mall) Ally/Horde
	if(intid == 8) then
        if(player:GetLevel() < 70) then
            player:SetLevel(70)
            player:Teleport(571, 2787.870117, -2732.060059, 89.669998, 0.410000)
        else
            player:SendBroadcastMessage("Você já é level 70 ou maior.")
        end
        player:GossipComplete()
    end
	
	-- level 80 (Voldrune/Mall) Ally/Horde
	if(intid == 9) then
        if(player:GetLevel() < 80) then
            player:SetLevel(80)
            player:Teleport(571, 2787.870117, -2732.060059, 89.669998, 0.410000)
        else
            player:SendBroadcastMessage("Você já é level 80 ou maior.")
        end
        player:GossipComplete()
    end

	if(intid == 499) then -- Voltar
		TeleporterLow_Gossip(event, player, creature)
	end
	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)