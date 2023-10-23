local UnitEntry = 80265

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Utilize esse NPC para comprar o Starter Gear level 70.\n\nBoa sorte!"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_chest_cloth_49:25|t Set Heirloom ",0, 5)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_gauntlets_21:25|t Head, Hand & Legs ",0, 4)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_boots_chain_06:25|t Offsets ",0, 2)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_43:25|t Armas Heirloom & PvE ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_gizmo_khoriumpowercore:25|t Acessorios\n ",0, 3)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 80271)
   end

if(intid == 2) then
   player:SendListInventory(creature, 80270)
   end
   
if(intid == 3) then   
   player:SendListInventory(creature, 80283)
   end

if(intid == 4) then   
   player:SendListInventory(creature, 80284)
   end

if(intid == 5) then   
   player:SendListInventory(creature, 80049)
   end
   
if(intid == 499) then
   MultiVendor_Open(unit, player, creature)
   end

	if(intid == 500) then
		player:GossipComplete()	
	end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)