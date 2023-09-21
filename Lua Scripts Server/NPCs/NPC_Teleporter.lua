Timer = {}

function Timer.Teleport(eventid, delay, repeats, player)
    player:SendAreaTriggerMessage("Teleporting in " .. repeats .. " seconds.")
end

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
	player:GossipMenuAddItem(3, "|TInterface\\icons\\Inv_enchant_formulagood_01.png:29|t Área de Profissões", 1, 15, false, "Tem certeza que quer ir para a Área de Profissões?")
	--player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_zone_boreantundra_02:29|t Praia de Silithus ",0, 6, false, "Tem certeza que quer teleportar para a Praia de Silithus?")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_tanaris_01:29|t PvP Zones ",0, 16)
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
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2) -- Feedback em segundos, no meio da tela
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then -- Se o jogador não está em combate, teleportar
				p:Teleport(571, 2884.257568, -2674.678955, 84.674553, 2.604867)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1) -- tempo para o Teleport ocorrer
	end
	
	if (intid == 11) then -- Dalaran
		if player:IsInCombat() then
			player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
			player:GossipComplete()
			return
		end
		player:GossipComplete()
	    player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(571, 5807.512695, 589.116821, 660.939148, 1.741521)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end
	
    if (intid == 12) then -- Stormwind
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
	    player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(0, -8808.827148, 585.609863, 96.655205, 1.049635)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end
	
	if (intid == 13) then -- Orgrimmar
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(1, 1609.845215, -4252.748047, 45.741608, 5.402731)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end
	
	if (intid == 15) then -- Area de Profissao
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(0, -4014.572754, -1408.043457, 155.503952, 0.894522)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end

    if (intid == 6) then -- Silithus - Praia 
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(1, -10756.157227, 2426.182373, 5.650800, 1.523300)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end

    if (intid == 7) then -- Gurubashi Arena - Shop?
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(0, -13300.924805, 92.050522, 22.703733, 1.011899)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end
	
	-- PvP Zones Submenu:
	if(intid == 16) then --
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_tanaris_01:29|t Tanaris - |cFFFFFF00Duel Zone 1 ",0, 3, false, "Tem certeza que quer teleportar para Tanaris?")
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_nagrand_01.png:29|t Nagrand - |cFFFFFF00Duel Zone 2 ",0, 4, false, "Tem certeza que quer teleportar para Nagrand")
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 3 ",0, 5, false, "Tem certeza que quer teleportar para Winterspring")
		player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_bg_winwsg.png:29|t Gurubashi Arena ",0, 7, false, "Tem certeza que quer teleportar para Gurubashi Arena?")
		--player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 4 ",0, 8, false, "Tem certeza que quer teleportar para Winterspring")
		--player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 5 ",0, 9, false, "Tem certeza que quer teleportar para Winterspring")
		--player:GossipMenuAddItem(4,"|TInterface\\icons\\Achievement_zone_winterspring.png:29|t Winterspring - |cFFFFFF00Duel Zone 6 ",0, 10, false, "Tem certeza que quer teleportar para Winterspring")
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000TeleporterLowLvl \n      (Gossip de outro Lua)",0,498)
		--player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
	end
	
	
	if (intid == 3) then -- Tanaris
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(1, -10358.407227, -3899.151855, 0.568085, 0.317972)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end

    if (intid == 4) then -- Nagrand 
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(530, -797.414978, 6987.476074, 35.083984, 1.529986)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end

    if (intid == 5) then -- Winterspring 
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(1, 8047.419434, -3940.694580, 687.023193, 2.351905)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
	end
	
	if(intid == 499) then -- Voltar
		Teleporter_Gossip(unit, player, creature)
	end
	
	if(intid == 498) then -- Teleporter Low Lvl
		TeleporterLowLvl_Gossip(unit, player, creature)
	end
	
	if(intid == 500) then -- Sair
		player:GossipComplete()	
	end	
	
end

RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)