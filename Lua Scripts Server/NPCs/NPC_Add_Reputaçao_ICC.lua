local unitEntry = 94125

local function OnGossipHello(event, player, object)
    player:GossipClearMenu()
    player:GossipMenuAddItem(0, "Exalted em Ashen Verdict", 0, 1)
    player:GossipSendMenu(1, object)
end

-- Sua reputação atual com Ashen Verdict é acima de Honored.
-- Você já é honored com Ashen Verdict.

-- 3000 = Friendly
-- 9000 = Honored
-- 21000 = Revered
-- 42000 = Exalted

local function OnGossipSelect(event, player, object, sender, intid, code)
    if (intid == 1) then
        local currentReputation = player:GetReputation(1156)
        local reputationToAdd = 42000

        if currentReputation < reputationToAdd then
            player:SetReputation(1156, reputationToAdd)
            player:GossipComplete()
        else
            player:SendBroadcastMessage("Você já é exalted com Ashen Verdict.")
        end
    end
end

RegisterCreatureGossipEvent(unitEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(unitEntry, 2, OnGossipSelect)


