local npc = 94126
local Cost = 50000000 -- Custo da mudança de gênero (50000000 = 5000g)
local itemVIP = 61000
local itemVIPeterno = 61001


local function OnGossipHello(event, player, object)
	if (player:HasItem(itemVIP) == false and player:HasItem(itemVIPeterno) == false) then
		player:SendBroadcastMessage("Você precisa do Livro Vip para usar esse npc.")
		player:GossipComplete()
	else
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_hunter_beastwithin.png:27|t Trocar Sexo (Custo: |cffffff005000g|cFF000000)", 0, 1, false, "Tem certeza? essa função custará 5000 de gold")
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	end
end


local function OnGossipSelect(event, player, object, sender, intid, code)
	if (intid == 1) then
		if player:GetCoinage() >= Cost then
			local gender = player:GetGender()
			
			if (gender == 0) then
				player:SetGender(1)
			else
				player:SetGender(0)
			end
			player:SetCoinage(player:GetCoinage() - Cost) -- Subtrai o custo da mudança de gênero das moedas do jogador
			player:SendAreaTriggerMessage("You feel a change.")
			player:SendAreaTriggerMessage("5000 gold been taken")
			player:GossipComplete()
		else
			player:SendAreaTriggerMessage("You need 5000 gold")
			player:GossipComplete()
		end
	end
end

RegisterCreatureGossipEvent(npc, 1, OnGossipHello)
RegisterCreatureGossipEvent(npc, 2, OnGossipSelect)


