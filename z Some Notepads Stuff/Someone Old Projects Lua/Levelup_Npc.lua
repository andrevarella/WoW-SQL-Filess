local NPCID = 190002

function On_Gossip(event, player, pUnit)
        player:GossipMenuAddItem(3,"|TInterface/ICONS/mall:35:35|tLevelup 255!",0,1)
        player:GossipMenuAddItem(3,"Nevermind",0,999)
        player:GossipSendMenu(1, pUnit)
end

function On_Select(event, player, pUnit, sender, intid, code)
if (intid == 1) then
    if(player:HasItem(90023, 25)) then
        player:RemoveItem(90023, 25)
        player:SetLevel(255) ----can change to whatever level
        player:SendBroadcastMessage("You are now level 255 !!.")
        player:GossipComplete()
    else
        player:SendBroadcastMessage("You don't have all the requeriments to use that option [Cost: (25) Blood Shards].")
        player:GossipComplete()
       end    
end    

if (intid == 999) then
    player:GossipComplete()
        end
end

RegisterCreatureGossipEvent(NPCID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPCID, 2, On_Select)