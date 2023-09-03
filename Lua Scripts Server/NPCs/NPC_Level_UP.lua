local UnitEntry = 94150

function Teleporter_Gossip(unit, player, creature)
	player:GossipSetText(string.format("Aqui você pode escolher o level que quiser!\n\nPerfeito para quem gosta de ter um personagem twink ou para quem não gosta de upar. Mas também opcional para quem curte upar ;)"))
    player:GossipMenuAddItem(6," Comprar Heirlooms |TInterface\\icons\\inv_chest_cloth_49:25|t", 0, 10)
	player:GossipMenuAddItem(6," Comprar Armas Heirlooms |TInterface\\icons\\inv_sword_43:25|t", 0, 11)
    if (player:GetFaction() == 1) then -- Alliance Gossips only:
    player:GossipMenuAddItem(2, "Quero upar para o level 20  |TInterface\\icons\\Achievement_zone_redridgemountains.png:29|t", 1, 1, false, "Você será teleportado para Redridge Mountains, tem certeza que quer upar para o level 20?")
	player:GossipMenuAddItem(2, "Quero upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:29|t", 1, 3, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	else -- Horde Gossips only:
	player:GossipMenuAddItem(2, "Quero upar para o level 20  |TInterface\\icons\\Achievement_zone_stonetalon_01.png:29|t", 1, 2, false, "Você será teleportado para Stonetalon Mountain, tem certeza que quer upar para o level 20?")
	player:GossipMenuAddItem(2, "Quero upar para o level 30  |TInterface\\icons\\Achievement_zone_stranglethorn_01.png:29|t", 1, 4, false, "Você será teleportado para Stranglethorn(North), tem certeza que quer upar para o level 30?")
	end -- Gossip para ambas Facções:
	player:GossipMenuAddItem(2, "Quero upar para o level 40  |TInterface\\icons\\Achievement_zone_tanaris_01.png:29|t", 1, 5, false, "Você será teleportado para Tanaris, tem certeza que quer upar para o level 40?")
	player:GossipMenuAddItem(2, "Quero upar para o level 50  |TInterface\\icons\\Achievement_zone_ungorocrater_01.png:29|t", 1, 6, false, "Você será teleportado para Un'Goro, tem certeza que quer upar para o level 50?")
	player:GossipMenuAddItem(2, "Quero upar para o level 60  |TInterface\\icons\\Achievement_zone_blastedlands_01.png:29|t", 1, 7, false, "Você será teleportado para o Dark Portal, tem certeza que quer upar para o level 60?")
	player:GossipMenuAddItem(2, "Quero upar para o level 70  |TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:29|t", 1, 8, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 70?")
	player:GossipMenuAddItem(4, "Quero upar para o level 80 (Fase de teste)", 1, 9, false, "Você será teleportado para Northrend, tem certeza que quer upar para o level 80?")
    player:GossipSendMenu(0x7FFFFFFF, creature, menuid)
end

RegisterCreatureGossipEvent(UnitEntry, 1, Teleporter_Gossip)

function Teleporter_Event(event, player, creature, sender, intid, code)
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
	
	-- heirloom
	if(intid == 10) then   
   player:SendListInventory(creature, 80049)
   end
   
   -- heirloom armas
   if(intid == 11) then   
   player:SendListInventory(creature, 80271)
   end
	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)