local UnitEntry = 93057

function TeleporterLowLvl_Gossip(unit, player, creature)
    player:GossipSetText(string.format("Zonas de Upar (Level 68)"))

    if (player:IsAlliance()) then -- só ally:
        player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_boreantundra_05.png:29|t |cFF0000FFBorean Tundra|r - |cFF0000FFAlliance", 1, 3, false, "Tem certeza que quer ir para Borean Tundra - Valliance Keep?")
        player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_howlingfjord_08.png:29|t |cFF0000FFHowling Fjord|r - |cFF0000FFAlliance", 1, 4, false, "Tem certeza que quer ir para Howling Fjord - Valgarde")
		
		
    elseif (player:IsHorde()) then -- só horda:
        player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_boreantundra_05.png:29|t |cFF0000FFBorean Tundra|r - |cffff0000Horde", 1, 1, false, "Tem certeza que quer ir para Borean Tundra - Warsong Hold?")
        player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_howlingfjord_08.png:29|t |cFF0000FFHowling Fjord|r - |cffff0000Horde", 1, 2, false, "Tem certeza que quer ir para Howling Fjord - Vengeance Landing?")
    end -- ambas facções:
    player:GossipMenuAddItem(3, "|TInterface\\icons\\Inv_enchant_formulagood_01.png:29|t |cFF0000FFÁrea de Profissões", 1, 5, false, "Tem certeza que quer ir para a Área de Profissões?")
	player:GossipSendMenu(0x7FFFFFFF, creature)
end

RegisterCreatureGossipEvent(UnitEntry, 1, TeleporterLowLvl_Gossip)

function Teleporter_Event(event, player, creature, sender, intid, code)

	
	-- level 68 >= - Borean Tundra [Horda] - Warsong Hold
	if(intid == 1) then
        if(player:GetLevel() >= 68) then
            player:Teleport(571, 2828.513405, 6177.758301, 121.981171, 3.906299)
        else
            player:SendBroadcastMessage("Você precisa ser pelo menos level 68 para teleportar para Borean Tundra.")
        end
        player:GossipComplete()
    end
	
    -- level 68 >= - Howling Fjord [Horda] - Vengeance Landing
	if(intid == 2) then
        if(player:GetLevel() >= 68) then
            player:Teleport(571, 1941.481934, -6166.558594, 23.700552, 2.775326)
        else
            player:SendBroadcastMessage("Você precisa ser pelo menos level 68 para teleportar para Howling Fjord.")
        end
        player:GossipComplete()
    end
	
	-- Alliance:
	
    -- level 68 >= - Borean Tundra [Alliance] - Valliance Keep
	if(intid == 3) then
        if(player:GetLevel() >= 68) then
            player:Teleport(571, 2248.938965, 5178.341797, 11.770901, 1.169194)
        else
            player:SendBroadcastMessage("Você precisa ser pelo menos level 68 para teleportar para Borean Tundra.")
        end
        player:GossipComplete()
    end
	
	-- level 68 >= - Howling Fjord [Alliance] - Valgarde
	if(intid == 4) then
        if(player:GetLevel() >= 68) then
            player:Teleport(571, 592.201111, -5090.629883, 5.63201, 1.326926)
        else
            player:SendBroadcastMessage("Você precisa ser pelo menos level 68 para teleportar para Howling Fjord.")
        end
        player:GossipComplete()
    end
	
	-- Area de Profissões:
	if(intid == 5) then
		player:Teleport(0, -4014.572754, -1408.043457, 155.503952, 0.894522)
    end
	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)