local UnitEntry = 93062

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Utilize esse NPC para comprar o set e armas Relentless Gladiator.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_135:25|t Main Set",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_33:25|t Offset",0, 2)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_cape_16:25|t Accessories",0, 3)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\INV_Relics_LibramofHope:25|t Relics",0, 10)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_149:25|t Tier 1 Weapons",0, 4)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_104:25|t Tier 2 Weapons",0, 5)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_103:25|t Shoulder Wintergrasp",0, 6)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

if(intid == 1) then   
   player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t Main Set por Honor e Arena Points ",0, 7)
   player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_amulet_03:25|t Main Set por Mark of Honor ",0, 8)
   player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_ring_60:25|t Main Set por Token 3x3 ",0, 9)
   player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
   end

if(intid == 7) then
   player:SendListInventory(creature, 93065)
   end

if(intid == 8) then
   player:SendListInventory(creature, 80044)
   end

if(intid == 9) then
   player:SendListInventory(creature, 81110)
   end

if(intid == 10) then
   player:SendListInventory(creature, 93208)
   end
   

if(intid == 2) then
   player:SendListInventory(creature, 93064)
   end

if(intid == 3) then
   player:SendListInventory(creature, 93075)
   end

if(intid == 4) then
   player:SendListInventory(creature, 80311)
   end

if(intid == 5) then
   player:SendListInventory(creature, 80046)
   end

if(intid == 6) then
   player:SendListInventory(creature, 93077)
   end



if (intid == 499) then
   On_Top_Hello(event, player, creature)
   end

if (intid == 500) then
   player:GossipComplete()	
   end	
end

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)