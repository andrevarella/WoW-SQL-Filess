local UnitEntry = 92500

function Teleporter_Gossip(unit, player, creature)
    player:GossipSetText(string.format("Utilize esse |cff0000ffNPC|cFF000000 para teleportar para o Mall e outros lugares."))
    player:GossipMenuAddItem(2,"|TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:29|t Voldrune - |cFFF0F8FFMall",0, 1, false, "Tem certeza que quer teleportar para o Mall?")
	player:GossipMenuAddItem(2,"|TInterface\\icons\\Spell_Arcane_TeleportDalaran:29|t Dalaran",0, 11, false, "Tem certeza que quer teleportar para Dalaran?")
	if (player:IsAlliance()) then
		player:GossipMenuAddItem(2,"|TInterface\\icons\\Spell_Arcane_TeleportStormWind:29|t Stormwind",0, 12, false, "Tem certeza que quer teleportar para Stormwind?")
	elseif (player:IsHorde()) then
	player:GossipMenuAddItem(2,"|TInterface\\icons\\Spell_Arcane_TeleportOrgrimmar:29|t Orgrimmar",0, 13, false, "Tem certeza que quer teleportar para Orgrimmar?")
	end
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_tanaris_01:29|t Tanaris - |cFFFFFF00Duel Zone 1 ",0, 3, false, "Tem certeza que quer teleportar para Tanaris?")
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_nagrand_01.png:29|t Nagrand - |cFFFFFF00Duel Zone 2 ",0, 4, false, "Tem certeza que quer teleportar para Nagrand")
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 3 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 4 ",0, 8, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 5 ",0, 9, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 6 ",0, 10, false, "Tem certeza que quer teleportar para Winterspring")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_winwsg.png:29|t Gurubashi Arena ",0, 7, false, "Tem certeza que quer teleportar para Gurubashi Arena?")
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_zone_boreantundra_02:29|t Praia de Silithus ",0, 6, false, "Tem certeza que quer teleportar para a Praia de Silithus?")

    player:GossipSendMenu(0x7FFFFFFF, creature, menuid)
end

RegisterCreatureGossipEvent(UnitEntry, 1, Teleporter_Gossip)

function Teleporter_Event(event, player, creature, sender, intid, code)

    if (intid == 1) then -- Mall
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	--if(player:GetLevel() >= 68) then
	    player:Teleport(571, 2888.393555, -2670.472412, 84.677917, 1.587770)
    --else
	    --player:SendBroadcastMessage("Você precisa ser pelo menos level 68 para teleportar para o Mall (em Grizzly Hills).")
	end	
	
	if (intid == 11) then -- Dalaran
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(571, 5807.512695, 589.116821, 660.939148, 1.741521)
	end	
	
    if (intid == 12) then -- Stormwind
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(0, -8808.827148, 585.609863, 96.655205, 1.049635)
	end	
	
	if (intid == 13) then -- Orgrimmar
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(1, 1609.845215, -4252.748047, 45.741608, 5.402731)
	end	

    if (intid == 3) then -- Tanaris
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(1, -10358.407227, -3899.151855, 0.568085, 0.317972)
	end	

    if (intid == 4) then -- Nagrand
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(530, -797.414978, 6987.476074, 35.083984, 1.529986)
	end	

    if (intid == 5) then -- Winterspring
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(1, 8047.419434, -3940.694580, 687.023193, 2.351905)
	end	

    if (intid == 6) then -- Silithus - Praia
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(1, -10756.157227, 2426.182373, 5.650800, 1.523300)
	end	

    if (intid == 7) then -- Gurubashi Arena - Shop?
			if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
	    player:Teleport(0, -13300.924805, 92.050522, 22.703733, 1.011899)
	end	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)


