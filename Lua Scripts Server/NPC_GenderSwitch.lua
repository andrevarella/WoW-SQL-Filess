local npc = 94126
local Cost = 50000000 -- Custo da mudança de gênero

local function OnGossipHello(event, player, object)
player:GossipMenuAddItem(0, "Mudar de gênero (Custo: 5000g)", 0, 1)
player:GossipSendMenu(1, object)
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