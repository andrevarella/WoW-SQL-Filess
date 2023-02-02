local UnitEntry = 93109

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(6," Food and Water",0, 1)
    player:GossipMenuAddItem(6," Reagents",0, 2)
    player:GossipMenuAddItem(6," Poison Supplies",0, 3)
    player:GossipMenuAddItem(6," Profession Necessities",0, 4)
    --player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_gizmo_khoriumpowercore:25|t Acessorios\n ",0, 5)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 29547)
   end

if(intid == 2) then
   player:SendListInventory(creature, 29636)
   end

if(intid == 3) then
   player:SendListInventory(creature, 3090)
   end

if(intid == 4) then
   player:SendListInventory(creature, 80238)
   end


if(intid == 500) then
   player:GossipComplete()	
   end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)