local NPC_ID = 94146
local LEVEL_CAP = 255

local function OnGossipHello(event, player, object)
    player:GossipClearMenu()
    
    if player:GetLevel() < LEVEL_CAP then
        player:GossipMenuAddItem(0, "Upar para o level "..LEVEL_CAP, 0, 1)
        player:GossipSendMenu(1, object)
    else
        player:GossipComplete()
        player:SendBroadcastMessage("Você já é level "..LEVEL_CAP..".")
    end
end

local function OnGossipSelect(event, player, object, sender, intid, code)
    if intid == 1 then
        player:SetLevel(LEVEL_CAP)
        player:SendBroadcastMessage("Parabéns! Você agora é level "..LEVEL_CAP..".")
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(NPC_ID, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_ID, 2, OnGossipSelect)
