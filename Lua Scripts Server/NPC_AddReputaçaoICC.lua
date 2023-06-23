local unitEntry = 94125

local function OnGossipHello(event, player, object)
    player:GossipClearMenu()
    player:GossipMenuAddItem(0, "Exalted em Ashen Verdict", 0, 1)
    player:GossipSendMenu(1, object)
end

-- 3000 = Friendly
-- 9000 = Honored
-- 21000 = Revered
-- 42000 = Exalted

local function OnGossipSelect(event, player, object, sender, intid, code)
    if (intid == 1) then
        player:SetReputation(1156, 9000)
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(unitEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(unitEntry, 2, OnGossipSelect)