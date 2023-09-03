local UnitEntry = 80200

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Utilize esse NPC para comprar items PvE e PvP através Honor, Arena Point, Mark of Honor e Token 3x3.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_trinket_04:25|t |cff0000ffPvE |cFF000000Trinkets",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\item_icecrownringb:25|t |cff0000ffPvE |cFF000000Acessories ",0, 2)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_plate_13:25|t |cff0000ffPvE|cFF000000 Offsets ",0, 3)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_153:25|t |cff0000ffPvE & PvP|cFF000000 Weapons ",0, 4)	
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_114:25|t |cff0000ffPvE |cFF000000Shoulders",0, 29)	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

if(intid == 1) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_rune_10:25|t |cff0000ff213 |cFF000000Trinkets [|cffff0000Honor|cFF000000] ",0, 6)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_holy_summonlightwell:25|t |cff0000ff219 |cFF000000Trinkets [|cFFFFFF001400+ Rating|cFF000000] ",0, 7)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_trinket_04:25|t |cff0000ff264 |cFF000000Trinkets [|cFFFFFF001800 Rating|cFF000000]\n ",0, 8)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end

if(intid == 6) then
   player:SendListInventory(creature, 80208)
   end

if(intid == 7) then
   player:SendListInventory(creature, 80211)
   end

if(intid == 8) then
   player:SendListInventory(creature, 80210)
   end

if(intid == 2) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_jewelry_necklace_ahnqiraj_02:25|t |cff0000ffPvE |cFF000000Acessorios 245 [|cffff0000Honor|cFF000000]",0, 9)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\item_icecrownnecklaced:25|t |cff0000ffPvE |cFF000000Necks 264 [|cFFFFFF001800 Rating|cFF000000]",0, 10)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\item_icecrowncloak:25|t |cff0000ffPvE |cFF000000Cloaks 264 [|cFFFFFF001800 Rating|cFF000000]",0, 11)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\item_icecrownringb:25|t |cff0000ffPvE |cFF000000Rings 264 [|cFFFFFF001800 Rating|cFF000000]\n",0, 12)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end

if(intid == 9) then
   player:SendListInventory(creature, 80205)
   end

if(intid == 10) then
   player:SendListInventory(creature, 80260)
   end

if(intid == 11) then
   player:SendListInventory(creature, 80261)
   end

if(intid == 12) then
   player:SendListInventory(creature, 80264)
   end

if(intid == 3) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_leather_02:25|t Bota 245 [|cffff0000Honor|cFF000000]",0, 13)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_23b:25|t Bracer 245 [|cffff0000Honor|cFF000000]",0, 14)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_belt_37:25|t Cinto 245 [|cffff0000Honor|cFF000000]",0, 15)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_cloth_23:25|t Bota 258 [|cFFFFFF001600 Rating|cFF000000]",0, 16)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_37:25|t Bracer 258 [|cFFFFFF001600 Rating|cFF000000]",0, 17)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_belt_52:25|t Cinto 258 [|cFFFFFF001600 Rating|cFF000000]",0, 18)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_plate_13:25|t Bota 264 [|cFFFFFF001800 Rating|cFF000000]",0, 19)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_43:25|t Bracer 264 [|cFFFFFF001800 Rating|cFF000000]",0, 20)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_belt_63:25|t Cinto 264 [|cFFFFFF001800 Rating|cFF000000]\n",0, 21)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
        player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 13) then
   player:SendListInventory(creature, 80302)
   end

if(intid == 14) then
   player:SendListInventory(creature, 80303)
   end

if(intid == 15) then
   player:SendListInventory(creature, 80301)
   end

if(intid == 16) then
   player:SendListInventory(creature, 80048)
   end

if(intid == 17) then
   player:SendListInventory(creature, 80050)
   end

if(intid == 18) then
   player:SendListInventory(creature, 80267)
   end

if(intid == 19) then
   player:SendListInventory(creature, 80250)
   end

if(intid == 20) then
   player:SendListInventory(creature, 80262)
   end

if(intid == 21) then
   player:SendListInventory(creature, 80263)
   end



if(intid == 4) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_shortblade_99:25|t |cff0000ffPvE |cFF000000245 Weapons [|cffff0000Honor|cFF000000]",0, 23)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_102:25|t |cff0000ffPvE |cFF000000258 Weapons [|cFFFFFF001750 Rating|cFF000000]",0, 24)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_axe_120:25|t |cff0000ffPvE |cFF000000264 Weapons [|cFFFFFF001800 Rating|cFF000000]",0, 25)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_weapon_staff_109:25|t |cff0000ffPvE |cFF000000271 Weapons [|cFFFFFF002050 Rating|cFF000000]\n",0, 26)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end


if(intid == 23) then
   player:SendListInventory(creature, 80054)
   end

if(intid == 24) then
   player:SendListInventory(creature, 80051)
   end

if(intid == 25) then
   player:SendListInventory(creature, 80202)
   end

if(intid == 26) then
   player:SendListInventory(creature, 80201)
   end


if(intid == 29) then
   player:SendListInventory(creature, 80315)
   end


if(intid == 35) then
   player:SendListInventory(creature, 81110)
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