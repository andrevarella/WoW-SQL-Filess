local UnitEntry = 94150

function TeleporterLow_Gossip(unit, player, creature)
	player:GossipSetText(string.format("Escolha o level que quiser!\n\nPerfeito para quem gosta de ter um personagem twink ou para quem não gosta de upar. Mas também opcional para quem curte upar ;)"))
    player:GossipMenuAddItem(6," Comprar Heirlooms |TInterface\\icons\\inv_chest_cloth_49:24|t", 0, 10)
	
	-- Alliance Races
    if (player:GetRace()) == 1 then -- Human
		player:GossipMenuAddItem(2, "Quero ir para (Human)", 1, 13, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 3 then -- Dwarf
		player:GossipMenuAddItem(2, "Quero ir para (Dwarf)", 1, 14, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 4 then -- Night Elf
		player:GossipMenuAddItem(2, "Quero ir para (Nelf)", 1, 15, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 7 then -- Gnome
		player:GossipMenuAddItem(2, "Quero ir para (Gnome)", 1, 16, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 11 then -- Draenei
		player:GossipMenuAddItem(2, "Quero ir para (Draenei)", 1, 17, false, "Você será teleportado para X tem certeza?")
	
	-- Horde Races
	elseif (player:GetRace()) == 2 then -- Orc
		player:GossipMenuAddItem(2, "Quero ir para (Orc)", 1, 18, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 5 then -- Undead
		player:GossipMenuAddItem(2, "Quero ir para (undead)", 1, 19, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 6 then -- Tauren
		player:GossipMenuAddItem(2, "Quero ir para (tauren)", 1, 20, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 8 then -- Troll
		player:GossipMenuAddItem(2, "Quero ir para (troll)", 1, 21, false, "Você será teleportado para X tem certeza?")
	elseif (player:GetRace()) == 10 then -- Blood Elf
		player:GossipMenuAddItem(2, "Quero ir para (blood elf)", 1, 22, false, "Você será teleportado para X tem certeza?")
	end
	
    if (player:IsAlliance()) then
		player:GossipMenuAddItem(2, "Quero upar para o level 20  |TInterface\\icons\\Achievement_zone_redridgemountains.png:24|t", 1, 1, false, "Você será teleportado para Redridge Mountains, tem certeza que quer upar para o level 20?")
		player:GossipMenuAddItem(2, "Quero upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:24|t", 1, 3, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	elseif (player:IsHorde()) then
		player:GossipMenuAddItem(2, "Quero upar para o level 20  |TInterface\\icons\\Achievement_zone_stonetalon_01.png:24|t", 1, 2, false, "Você será teleportado para Stonetalon Mountain, tem certeza que quer upar para o level 20?")
		player:GossipMenuAddItem(2, "Quero upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:24|t", 1, 4, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	end
	
	-- Gossip para ambas Facções:
	player:GossipMenuAddItem(2, "Quero upar para o level 40  |TInterface\\icons\\Achievement_zone_tanaris_01.png:24|t", 1, 5, false, "Você será teleportado para Tanaris, tem certeza que quer upar para o level 40?")
	player:GossipMenuAddItem(2, "Quero upar para o level 50  |TInterface\\icons\\Achievement_zone_ungorocrater_01.png:24|t", 1, 6, false, "Você será teleportado para Un'Goro, tem certeza que quer upar para o level 50?")
	player:GossipMenuAddItem(2, "Quero upar para o level 60  |TInterface\\icons\\Achievement_zone_blastedlands_01.png:24|t", 1, 7, false, "Você será teleportado para o Dark Portal, tem certeza que quer upar para o level 60?")
	player:GossipMenuAddItem(2, "Quero upar para o level 70  |TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:24|t", 1, 8, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 70?")
	player:GossipMenuAddItem(4, "Quero upar para o level 80 (Fase de teste)", 1, 9, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 80?")
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