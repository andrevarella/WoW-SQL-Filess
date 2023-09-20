local NPC_ID = 94169

-- |TInterface\\icons\\achievement_zone_durotar.png:29|t |cFF0000FF

	--player:PlayDirectSound(888, player) -- Som de Level Up
	--player:PlayDirectSound(619, player) -- Som de Quest Completed
	--player:PlayDirectSound(120, player) -- Som de compra
	--player:CastSpell(player, 47292)

function TokenExchanger(unit, player, creature)
	player:GossipSetText(string.format("Nesse npc você pode trocar Arena Token (3x3) por level de Profissão.\n\n 1 Token = 1 level"))
    player:GossipMenuAddItem(6, " |cFF0000FFUpar 1 level\n", 0, 1)
    --player:GossipMenuAddItem(6, " |cFF0000FFUpar 2 levels\n", 0, 2)
    --player:GossipMenuAddItem(6, " |cFF0000FFUpar 5 levels\n", 0, 5)
	player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Sair\n",0,500)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menuid)
end

function TokenExchangerSelect(event, player, object, sender, intid, code)

	local Profissoes = {129, 185, 356, 164, 165, 171, 197, 202, 333, 393, 755, 773, 182, 186}
	

	if(intid == 1) then -- 1 por 1

		if player:HasItem(20560, 1) then
				player:RemoveItem(20560, 1)
				player:SendBroadcastMessage("Você trocou um Token 3x3.")
				player:CastSpell(player, 47292) -- Som/Animação de Level Up
			for i, skill in ipairs(Profissoes) do
				if player:HasSkill(skill) then 
					player:AdvanceSkill(skill, 1)
					player:GossipComplete()
				end
			end  
		else
			player:SendBroadcastMessage("Você não tem o item necessário para a troca.")
		end
	end
	
	if(intid == 2) then

		if player:HasItem(20560, 2) then
				player:RemoveItem(20560, 2)
				player:SendBroadcastMessage("Você trocou dois Token 3x3.")
				player:CastSpell(player, 47292)
			for i, skill in ipairs(Profissoes) do
				if player:HasSkill(skill) then 
					player:AdvanceSkill(skill, 2)
					player:GossipComplete()
				end
			end  
		else
			player:SendBroadcastMessage("Você não tem o item necessário para a troca.")
		end
	end
	if(intid == 5) then

		if player:HasItem(20560, 5) then
				player:RemoveItem(20560, 5)
				player:SendBroadcastMessage("Você trocou cinco Token 3x3.")
				player:CastSpell(player, 47292)
			for i, skill in ipairs(Profissoes) do
				if player:HasSkill(skill) then 
					player:AdvanceSkill(skill, 5)
					player:GossipComplete()
				end
			end  
		else
			player:SendBroadcastMessage("Você não tem o item necessário para a troca.")
		end
	end
	
   if (intid == 500) then
	player:GossipComplete()	
   end	
	
end

RegisterCreatureGossipEvent(NPC_ID, 1, TokenExchanger)
RegisterCreatureGossipEvent(NPC_ID, 2, TokenExchangerSelect)