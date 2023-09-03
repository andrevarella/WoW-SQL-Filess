local UnitEntry = 93027

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("Para poder ver esses itens, é necessário ter o patch de itens do servidor, disponível para download no discord.\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_helmet_134:25|t Full Sets ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_08:25|t Heads ",0, 2)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shoulder_91:25|t Shoulders ",0, 3)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_112:25|t Weapons ",0, 4)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_1h_blacksmithing_03:25|t Legion Artifact Weapons ",0, 5)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Ability_druid_flightform:25|t Wings ",0, 6)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_boots_plate_18:25|t Offsets ",0, 7)
    --player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_coin_19:25|t Event Coin - Weapons (Temporario) ",0, 8)
    --player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_misc_coin_19:25|t Event Coin - Armors (Temporario)",0, 9)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

if(intid == 2) then
   player:SendListInventory(creature, 93014)
   end

if(intid == 3) then
   player:SendListInventory(creature, 93015)
   end
   
if(intid == 6) then
   player:SendListInventory(creature, 80279)
   end

if(intid == 7) then
   player:SendListInventory(creature, 93016)
   end

if(intid == 8) then
   player:SendListInventory(creature, 93050)
   end

if(intid == 9) then
   player:SendListInventory(creature, 93051)
   end

if(intid == 1) then
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_helmet_06:25|t Sanctum of Domination Plate Set\n",0, 20)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_deathknight_classicon:25|t Death Knight |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 21)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_deathknight_classicon:25|t Death Knight |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 22)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_27:25|t Warrior |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 23)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_sword_27:25|t Warrior |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 24)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_hammer_01:25|t Paladin |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 25)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_hammer_01:25|t Paladin |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 26)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_weapon_bow_07:25|t Hunter |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 27)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_weapon_bow_07:25|t Hunter |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 28)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_talisman_04:25|t Shaman |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 29)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_jewelry_talisman_04:25|t Shaman |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 30)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_monsterclaw_04:25|t Druid |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 31)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_misc_monsterclaw_04:25|t Druid |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 32)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_throwingknife_04:25|t Rogue |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 33)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_throwingknife_04:25|t Rogue |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 34)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_nature_drowsy:25|t Warlock |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 35)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\spell_nature_drowsy:25|t Warlock |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 36)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_13:25|t Mage |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 37)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_13:25|t Mage |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 38)
	
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_30:25|t Priest |cffffff00PvP |cFF000000Set  |TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t",0, 39)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\inv_staff_30:25|t Priest |cff0000ffPvE |cFF000000Set  |TInterface\\icons\\INV_Misc_Coin_09:25|t\n",0, 40)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,998)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 20) then
   player:SendListInventory(creature, 93017)
   end
if(intid == 21) then
   player:SendListInventory(creature, 90048)
   end
if(intid == 22) then
   player:SendListInventory(creature, 90049)
   end
if(intid == 23) then
   player:SendListInventory(creature, 90044)
   end
if(intid == 24) then
   player:SendListInventory(creature, 90045)
   end
if(intid == 25) then
   player:SendListInventory(creature, 90046)
   end
if(intid == 26) then
   player:SendListInventory(creature, 90047)
   end
if(intid == 27) then
   player:SendListInventory(creature, 90040)
   end
if(intid == 28) then
   player:SendListInventory(creature, 90041)
   end
if(intid == 29) then
   player:SendListInventory(creature, 90042)
   end
if(intid == 30) then
   player:SendListInventory(creature, 90043)
   end
if(intid == 31) then
   player:SendListInventory(creature, 90036)
   end
if(intid == 32) then
   player:SendListInventory(creature, 90037)
   end
if(intid == 33) then
   player:SendListInventory(creature, 90038)
   end
if(intid == 34) then
   player:SendListInventory(creature, 90039)
   end
if(intid == 35) then
   player:SendListInventory(creature, 90030)
   end
if(intid == 36) then
   player:SendListInventory(creature, 90031)
   end
if(intid == 37) then
   player:SendListInventory(creature, 90032)
   end
if(intid == 38) then
   player:SendListInventory(creature, 90033)
   end
if(intid == 39) then
   player:SendListInventory(creature, 90034)
   end
if(intid == 40) then
   player:SendListInventory(creature, 90035)
   end
   
if(intid == 4) then
player:GossipSetText(string.format("Armas de varias expansões do WoW Retail. \n\nObs: Para poder ver esses itens, é necessário ter o patch de item do servidor, disponível para download no discord."))
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_staff_draenei_a_03:25|t Staff",0, 50)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_halberd_08:25|t Polearms",0, 51)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_83:25|t Two Hand Mace",0, 52)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_60:25|t Two Hand Axe",0, 53)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_69:25|t Two Hand Sword",0, 54)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_35:25|t One Hand Mace",0, 55)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_62:25|t One Hand Axe",0, 56)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_05:25|t One Hand Sword",0, 57)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\INV_Weapon_Glave_01:25|t Warglaives",0, 90)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_hand_08:25|t Fist Weapon",0, 58)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_shortblade_61:25|t Daggers",0, 59)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shield_63:25|t Shields",0, 60)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_offhand_dalaran_d_01:25|t Off Hand & Wand",0, 61)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_bow_39:25|t Bow, Crossbow, Gun & Thrown",0, 62)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,998)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 50) then
   player:SendListInventory(creature, 93001)
   end
if(intid == 51) then
   player:SendListInventory(creature, 93000)
   end
if(intid == 52) then
   player:SendListInventory(creature, 93004)
   end
if(intid == 53) then
   player:SendListInventory(creature, 93003)
   end
if(intid == 54) then
   player:SendListInventory(creature, 93002)
   end
if(intid == 55) then
   player:SendListInventory(creature, 93013)
   end
if(intid == 56) then
   player:SendListInventory(creature, 93011)
   end
if(intid == 57) then
   player:SendListInventory(creature, 93012)
   end
if(intid == 58) then
   player:SendListInventory(creature, 93009)
   end
if(intid == 59) then
   player:SendListInventory(creature, 93008)
   end
if(intid == 60) then
   player:SendListInventory(creature, 93005)
   end
if(intid == 61) then
   player:SendListInventory(creature, 93006)
   end
if(intid == 62) then
   player:SendListInventory(creature, 93007)
   end
if(intid == 90) then
   player:SendListInventory(creature, 93010)
   end


if(intid == 5) then
player:GossipSetText(string.format("Armas de Artifact da expansão Legion. \n\nObs: Para poder ver esses itens, é necessário ter o patch de item do servidor, disponível para download no discord."))
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,998)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_staff_53:25|t Staff",0, 70)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_staff_92:25|t Staff II",0, 71)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_halberd17:25|t Polearms",0, 72)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_49:25|t Two Hand Mace",0, 73)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_73:25|t Two Hand Axe",0, 74)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_69:25|t Two Hand Sword",0, 75)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_mace_82:25|t One Hand Mace",0, 76)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_axe_62:25|t One Hand Axe",0, 77)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_05:25|t One Hand Sword",0, 78)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\INV_Weapon_Glave_01:25|t Warglaives",0, 79)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_hand_14:25|t Fist Weapon",0, 80)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_shortblade_59:25|t Daggers",0, 81)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_shield_31:25|t Shields",0, 82)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_offhand_hyjal_d_01:25|t Off Hand",0, 83)
	player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_weapon_bow_09:25|t Bow, Crossbow & Gun",0, 84)
	player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t |cFF8B0000Voltar",0,998)	
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 70) then
   player:SendListInventory(creature, 90010)
   end
   
if(intid == 71) then
   player:SendListInventory(creature, 90009)
   end
   
if(intid == 72) then
   player:SendListInventory(creature, 90007)
   end
   
if(intid == 73) then
   player:SendListInventory(creature, 90021)
   end
   
if(intid == 74) then
   player:SendListInventory(creature, 90022)
   end
   
if(intid == 75) then
   player:SendListInventory(creature, 90012)
   end
   
if(intid == 76) then
   player:SendListInventory(creature, 90019)
   end

if(intid == 77) then
   player:SendListInventory(creature, 90023)
   end
   
if(intid == 78) then
   player:SendListInventory(creature, 90013)
   end
   
if(intid == 79) then
   player:SendListInventory(creature, 90004)
   end
   
if(intid == 80) then
   player:SendListInventory(creature, 90024)
   end
   
if(intid == 81) then
   player:SendListInventory(creature, 90015)
   end
   
if(intid == 82) then
   player:SendListInventory(creature, 90002)
   end
   
if(intid == 83) then
   player:SendListInventory(creature, 90017)
   end
   
if(intid == 84) then
   player:SendListInventory(creature, 90006)
   end
   
   

if(intid == 998) then
   On_Top_Hello(event, player, creature)
   end

if(intid == 999) then
   player:GossipComplete()	
   end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)