local UnitEntry = 93080


local function On_Top_Hello(event, player, creature)
    player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_killxenemies_generalsroom:25|t Battleground Queues ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_arena_2v2_7:25|t Rated Arena Queues ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_arena_2v2_2:25|t Skirmish Arena Queues ",0, 1)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


function On_Top_Select(event, player, creature, sender, intid, code)

if(intid == 1) then   
   player:SendListInventory(creature, 80271)
   end


if(intid == 499) then
   On_Top_Hello(event, player, creature)
   end

if(intid == 500) then
   player:GossipComplete()	
   end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)