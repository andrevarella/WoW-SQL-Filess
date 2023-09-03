local UnitEntry = 80247

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Utilize esse NPC para comprar Transmogs atraves de Transmog Token e 3x3 Token.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_22:25|t |cff0000ff |cFF000000Gladiator [|cFFFFFF001800 Rating|cFF000000] ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_08:25|t |cff0000ff |cFF000000Merciless Gladiator [|cFFFFFF002050 Rating|cFF000000] ",0, 2)	
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_97:25|t |cff0000ff |cFF000000Vengeful Gladitor [|cFFFFFF002000 3x3 Rating|cFF000000]",0, 3)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_127:25|t |cff0000ff |cFF000000Brutal Gladiator [|cFFFFFF002200 3x3 Rating|cFF000000] ",0, 4)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_68:25|t Weapons & Armor ",0, 17)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_134:25|t Full Sets ",0, 19)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_tournaments_tabard_bloodelf:25|t Tabards ",0, 205)
    --player:GossipMenuAddItem(6,"|TInterface\\icons\\Ability_mount_nightmarehorse:25|t Mounts ",0, 250)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)


if(intid == 205) then
   player:SendListInventory(creature, 80227)
   end

if(intid == 250) then
   player:SendListInventory(creature, 80225)
   end

if(intid == 17) then
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_96:25|t Helmets and Armor",0, 50)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_08:25|t Legacy Weapons",0, 51)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_staff_53:25|t Staff",0, 52)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_halberd17:25|t Polearms",0, 53)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_49:25|t Two Hand Mace",0, 54)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_73:25|t Two Hand Axe",0, 55)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_69:25|t Two Hand Sword",0, 56)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_82:25|t One Hand Mace",0, 57)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_62:25|t One Hand Axe",0, 58)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_05:25|t One Hand Sword",0, 59)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_hand_14:25|t Fist Weapon",0, 60)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_shortblade_59:25|t Daggers",0, 61)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shield_31:25|t Shields",0, 62)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_offhand_hyjal_d_01:25|t Off Hand & Wand",0, 63)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_bow_09:25|t Bow, Crossbow, Gun & Thrown",0, 64)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 50) then
   player:SendListInventory(creature, 80072)
   end

if(intid == 51) then
   player:SendListInventory(creature, 81101)
   end

if(intid == 52) then
   player:SendListInventory(creature, 81159)
   end

if(intid == 53) then
   player:SendListInventory(creature, 81158)
   end

if(intid == 54) then
   player:SendListInventory(creature, 81166)
   end

if(intid == 55) then
   player:SendListInventory(creature, 81168)
   end

if(intid == 56) then
   player:SendListInventory(creature, 81164)
   end

if(intid == 57) then
   player:SendListInventory(creature, 81150)
   end

if(intid == 58) then
   player:SendListInventory(creature, 81147)
   end

if(intid == 59) then
   player:SendListInventory(creature, 81145)
   end

if(intid == 60) then
   player:SendListInventory(creature, 81152)
   end

if(intid == 61) then
   player:SendListInventory(creature, 81154)
   end

if(intid == 62) then
   player:SendListInventory(creature, 81148)
   end

if(intid == 63) then
   player:SendListInventory(creature, 81162)
   end

if(intid == 64) then
   player:SendListInventory(creature, 81156)
   end


if(intid == 19) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_inscription_parchment:25|t Next Page (1/2)",0, 90)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_crown_01:25|t Legacy Set ",0, 89)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_06:25|t Ahn'Qiraj ",0, 34)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Ability_vanish:25|t Invisible ",0, 93)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_07:25|t Tier 1 ",0, 91)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_09:25|t Tier 2 ",0, 92)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_14:25|t Tier 4 ",0, 94)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_43:25|t Tier 5 ",0, 95)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_68:25|t Tier 6 ",0, 96)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_plate02:25|t Tier 7 ",0, 97)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_58:25|t Tier 8 ",0, 98)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_cape_18:25|t Bloodlust",0, 99)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_20:25|t Glorious ",0, 100)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_36:25|t Imperial",0, 101)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_plate16:25|t Hyperion",0, 102)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_plate03:25|t Lightforge ",0, 103)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_30:25|t Valor ",0, 104)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_16:25|t Valor (Recolor) ",0, 105)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_17:25|t Bluefang Armor (Recolor) ",0, 106)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_74:25|t Judgement (Recolor) ",0, 107)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_07:25|t Mageweave (Recolor) ",0, 108)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_18:25|t Nemesis Raiment (Recolor) ",0, 109)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 89) then
   player:SendListInventory(creature, 81100)
   end
if(intid == 34) then
   player:SendListInventory(creature, 80076)
   end
if(intid == 93) then
   player:SendListInventory(creature, 81122)
   end

if(intid == 91) then
   player:SendListInventory(creature, 81165)
   end
if(intid == 92) then
   player:SendListInventory(creature, 81157)
   end
if(intid == 94) then
   player:SendListInventory(creature, 81105)
   end
if(intid == 95) then
   player:SendListInventory(creature, 81106)
   end
if(intid == 96) then
   player:SendListInventory(creature, 81107)
   end
if(intid == 97) then
   player:SendListInventory(creature, 81108)
   end
if(intid == 98) then
   player:SendListInventory(creature, 81109)
   end

if(intid == 99) then
   player:SendListInventory(creature, 81102)
   end
if(intid == 100) then
   player:SendListInventory(creature, 81111)
   end
if(intid == 101) then
   player:SendListInventory(creature, 81124)
   end
if(intid == 102) then
   player:SendListInventory(creature, 81121)
   end
if(intid == 103) then
   player:SendListInventory(creature, 81123)
   end
if(intid == 104) then
   player:SendListInventory(creature, 81129)
   end
if(intid == 105) then
   player:SendListInventory(creature, 81113)
   end

if(intid == 106) then
   player:SendListInventory(creature, 81103)
   end
if(intid == 107) then
   player:SendListInventory(creature, 81125)
   end
if(intid == 108) then
   player:SendListInventory(creature, 81114)
   end
if(intid == 109) then
   player:SendListInventory(creature, 81126)
   end



if(intid == 90) then
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,19)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_23:25|t Blue Magician",0, 110)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_cloth_17:25|t Purple Wizard ",0, 31)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_36:25|t Pirate",0, 32)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_14:25|t Bone Hunter",0, 111)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_chain:25|t Dark Hunter",0, 112)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_belt_14:25|t Ulduar Transmog",0, 113)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_129:25|t Black & Gold",0, 114)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_crown_01:25|t Wonder Woman ",0, 24)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_107:25|t Batman ",0, 25)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_cape_08:25|t Superman ",0, 26)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_12:25|t Iron Man ",0, 27)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_134:25|t Captain America",0, 28)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_shirt_red_01:25|t Mario & Luigi ",0, 29)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_32:25|t Peter Pan ",0, 30)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\achievement_profession_chefhat:25|t Chef ",0, 33)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Inicio",0,499)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 110) then
   player:SendListInventory(creature, 81112)
   end

if(intid == 111) then
   player:SendListInventory(creature, 81130)
   end

if(intid == 112) then
   player:SendListInventory(creature, 81118)
   end

if(intid == 113) then
   player:SendListInventory(creature, 81120)
   end

if(intid == 114) then
   player:SendListInventory(creature, 81119)
   end



if(intid == 24) then
   player:SendListInventory(creature, 80064)
   end

if(intid == 25) then
   player:SendListInventory(creature, 80060)
   end

if(intid == 26) then
   player:SendListInventory(creature, 80061)
   end

if(intid == 27) then
   player:SendListInventory(creature, 80062)
   end

if(intid == 28) then
   player:SendListInventory(creature, 80063)
   end

if(intid == 29) then
   player:SendListInventory(creature, 80067)
   end

if(intid == 30) then
   player:SendListInventory(creature, 80069)
   end

if(intid == 31) then
   player:SendListInventory(creature, 80065)
   end

if(intid == 32) then
   player:SendListInventory(creature, 80066)
   end

if(intid == 33) then
   player:SendListInventory(creature, 80070)
   end











if(intid == 1) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_30:25|t |cff0000ff |cFF000000Gladiator Set \n",0, 5)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_belt_12:25|t |cff0000ff |cFF000000Gladiator Offset \n ",0, 6)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_shortblade_45:25|t |cff0000ff |cFF000000Gladiator Weapons \n ",0, 7)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 2) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_chest_chain_11:25|t |cFF000000Merciless Gladiator Set \n",0, 8)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_bracer_09:25|t |cff0000ff |cFF000000Merciless Gladiator Offset \n",0, 9)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_36:25|t |cff0000ff |cFF000000Merciless Gladiator Weapons \n",0, 10)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 3) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_103:25|t |cff0000ff |cFF000000Vengeful Gladiator Set\n",0, 11)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_plate_08:25|t |cff0000ff |cFF000000Vengeful Gladiator Offset\n ",0, 12)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_84:25|t |cff0000ff |cFF000000Vengeful Gladiator Weapons \n",0, 13)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 4) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet128:25|t |cff0000ff |cFF000000Brutal Gladiator Set\n",0, 14)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_cloth_12:25|t |cff0000ff |cFF000000Brutal Gladiator Offset\n",0, 15)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_114:25|t |cff0000ff |cFF000000Brutal Gladiator Weapons\n",0, 16)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,499)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end


if(intid == 5) then
   player:SendListInventory(creature, 80221)
   end
   
if(intid == 6) then   
   player:SendListInventory(creature, 80222)
   end

if(intid == 7) then   
   player:SendListInventory(creature, 80223)
   end

if(intid == 8) then   
   player:SendListInventory(creature, 80218)
   end

if(intid == 9) then   
   player:SendListInventory(creature, 80219)
   end

if(intid == 10) then   
   player:SendListInventory(creature, 80220)
   end

if(intid == 11) then   
   player:SendListInventory(creature, 80215)
   end

if(intid == 12) then   
   player:SendListInventory(creature, 80216)
   end

if(intid == 13) then   
   player:SendListInventory(creature, 80217)
   end

if(intid == 14) then   
   player:SendListInventory(creature, 80212)
   end

if(intid == 15) then   
   player:SendListInventory(creature, 80214)
   end

if(intid == 16) then   
   player:SendListInventory(creature, 80213)
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