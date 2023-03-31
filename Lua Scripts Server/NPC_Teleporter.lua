local UnitEntry = 92500

function Teleporter_Gossip(unit, player, creature)
player:GossipSetText(string.format("Utilize esse |cff0000ffNPC|cFF000000 para teleportar para o Mall e outros lugares."))
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:29|t Voldrune - |cFFF0F8FFMall",0, 1, false, "Tem certeza que quer teleportar para o Mall?")
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_tanaris_01:29|t Tanaris - |cFFFFFF00Duel Zone 1 ",0, 3, false, "Tem certeza que quer teleportar para Tanaris?")
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_nagrand_01.png:29|t Nagrand - |cFFFFFF00Duel Zone 2 ",0, 4, false, "Tem certeza que quer teleportar para Nagrand")
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 3 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 4 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 5 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
    --player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 6 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_boreantundra_02:29|t Praia de Silithus ",0, 6, false, "Tem certeza que quer teleportar para a Praia de Silithus?")
    player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_bg_winwsg.png:29|t Gurubashi Arena ",0, 7, false, "Tem certeza que quer teleportar para Gurubashi Arena?")
    player:GossipSendMenu(0x7FFFFFFF, creature, menuid)
end

RegisterCreatureGossipEvent(UnitEntry, 1, Teleporter_Gossip)

function Teleporter_Event(event, player, creature, sender, intid, code)

    if (intid == 1) then
	    player:Teleport(571, 2888.393555, -2670.472412, 84.677917, 1.587770)
	end	

    if (intid == 3) then
	    player:Teleport(1, -10358.407227, -3899.151855, 0.568085, 0.317972)
	end	

    if (intid == 4) then
	    player:Teleport(530, -797.414978, 6987.476074, 35.083984, 1.529986)
	end	

    if (intid == 5) then
	    player:Teleport(1, 8047.419434, -3940.694580, 687.023193, 2.351905)
	end	

    if (intid == 6) then
	    player:Teleport(1, -10756.157227, 2426.182373, 5.650800, 1.523300)
	end	

    if (intid == 7) then
	    player:Teleport(0, -13300.924805, 92.050522, 22.703733, 1.011899)
	end	

    if (intid == 500) then
        player:GossipComplete()
    end	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)


