local UnitEntry = 93121

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(6," Food and Water",0, 1)
    player:GossipMenuAddItem(6," Reagents",0, 2)
    player:GossipMenuAddItem(6," Currency Trader",0, 3)
    player:GossipMenuAddItem(6," Mounts",0, 4)
    player:GossipMenuAddItem(6," Toys & Others",0, 5)
    player:GossipMenuAddItem(6," Companions",0, 6)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 32334)
   end

if(intid == 2) then
   player:SendListInventory(creature, 80019)
   end

if(intid == 3) then
   player:SendListInventory(creature, 80030)
   end

if(intid == 4) then
   player:SendListInventory(creature, 80225)
   end

if(intid == 5) then
   player:SendListInventory(creature, 80288)
   end

if(intid == 6) then
   player:SendListInventory(creature, 80239)
   end


if(intid == 500) then
   player:GossipComplete()	
   end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)