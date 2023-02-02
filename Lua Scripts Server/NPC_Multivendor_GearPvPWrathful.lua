local UnitEntry = 93063

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Utilize esse NPC para comprar o set e armas Wrathful Gladiator.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_165:25|t Main Set",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_plate_12:25|t Offset",0, 2)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_cape_16:25|t Acessorios",0, 3)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_157:25|t Armas Tier 1 ",0, 4)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_115:25|t Armas Tier 2 ",0, 5)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 93068)
   end

if(intid == 2) then
   player:SendListInventory(creature, 93067)
   end
   
if(intid == 3) then   
   player:SendListInventory(creature, 93076)
   end

if(intid == 4) then   
   player:SendListInventory(creature, 93069)
   end

if(intid == 5) then
   player:SendListInventory(creature, 34095)
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