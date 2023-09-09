local UnitEntry = 80268

local function On_Top_Hello(event, player, creature)

player:GossipSetText(string.format("Utilize esse NPC para comprar o Starter Gear level 80 de PvE & PvP.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_73:25|t Set PvE T9 ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_chest_plate_23:25|t Set PvP S6\n ",0, 2)
    player:GossipMenuAddItem(6,"(Temporario) 251 T10\n",0, 30)
    player:GossipMenuAddItem(6,"(Temporario) 251 Offsets\n",0, 31)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

	if(intid == 1) then
		player:GossipSetText(string.format("T9 PvE Gear"))
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_73:25|t |cff0000ff |cFF000000Main Set ",0, 3)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_belt_52:25|t |cff0000ff |cFF000000Cinto ",0, 4)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_cloth_23:25|t |cff0000ff |cFF000000Bota ",0, 25)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_37:25|t |cff0000ff |cFF000000Bracer ",0, 26)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_necklace_47:25|t |cff0000ff |cFF000000Neck ",0, 5)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_cape_05:25|t |cff0000ff |cFF000000Cloak ",0, 20)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_ring_70:25|t |cff0000ff |cFF000000Ring ",0, 21)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_talisman_08:25|t |cff0000ff |cFF000000Trinket ",0, 22)
		player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_101:25|t Weapons\n ",0, 6)
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF800000Voltar",0,499)
		player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end


if(intid == 4) then
   player:SendListInventory(creature, 81142)
   end

if(intid == 25) then   
   player:SendListInventory(creature, 81143)
   end

if(intid == 26) then   
   player:SendListInventory(creature, 81144)
   end


if(intid == 5) then   
   player:SendListInventory(creature, 81139)
   end

if(intid == 20) then   
   player:SendListInventory(creature, 81141)
   end

if(intid == 21) then   
   player:SendListInventory(creature, 81138)
   end

if(intid == 22) then   
   player:SendListInventory(creature, 81140)
   end


if(intid == 2) then
player:GossipSetText(string.format("S6 PvP Gear"))
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_chest_plate_23:25|t |cff0000ff|cFF000000Main Set ",0, 7)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_belt_12:25|t |cff0000ff|cFF000000Off Set ",0, 8)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_cape_19:25|t |cff0000ff|cFF000000Acessories ",0, 9)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_131:25|t |cff0000ff|cFF000000Weapons\n ",0, 10)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 3) then   
   player:SendListInventory(creature, 80269)
   end


if(intid == 6) then   
   player:SendListInventory(creature, 80286)
   end

if(intid == 7) then   
   player:SendListInventory(creature, 80251)
   end

if(intid == 8) then   
   player:SendListInventory(creature, 80282)
   end

if(intid == 9) then   
   player:SendListInventory(creature, 80293)
   end

if(intid == 10) then   
   player:SendListInventory(creature, 80287)
   end

if(intid == 30) then   
   player:SendListInventory(creature, 81136)
   end

if(intid == 31) then   
   player:SendListInventory(creature, 81137)
   end

if (intid == 998) then
On_Gossip_Select(unit, player, creature)
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