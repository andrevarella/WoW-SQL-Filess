local UnitEntry = 93026

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format("\n\n|TInterface\\icons\\Achievement_featsofstrength_gladiator_01:25|t Season 1 - Termina 03/2023\n\n|TInterface\\icons\\Achievement_featsofstrength_gladiator_02:25|t Season 2 - Começa ??/2023"))

    player:GossipMenuAddItem(11,"|TInterface\\icons\\Achievement_bg_killflagcarriers_grabflag_capit:25|tRegras e Season Cutoffs\n",0, 1)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_quests_completed_08:25|t Gladiators de Seasons Anteriores\n",0, 2)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then
player:GossipSetText(string.format("Maximo de distancia entre Personal e Team Rating = 100.\n \nWintrade = time desqualificado + suspensão.\n \nPremiações apenas para 2x2 e 3x3. \n\n\n |TInterface\\icons\\Achievement_bg_winwsg:30|t Season Cutoffs: \n\n |TInterface\\icons\\Achievement_arena_2v2_7:25|t Rank 1 - Season Gladiator \n |TInterface\\icons\\Achievement_arena_2v2_6:25|t Rank 2 e 3 - Gladiator \n |TInterface\\icons\\Achievement_arena_2v2_4:25|t Rank 4 e 5 - Duelist \n |TInterface\\icons\\Achievement_arena_2v2_1:25|t Rank 6 e 7 - Rival \n |TInterface\\icons\\Achievement_arena_2v2_1:25|t Rank 8, 9 e 10 - Challenger"))
    player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 2) then
player:GossipSetText(string.format("\nGladiators das Seasons Anteriores"))
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_01:25|t Season 1 Teste (Encerrado 03/2023)",0, 3)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_02:25|t Season 2 (Encerrado ??/2023)",0, 4)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_04:25|t Season 3 (Encerrado ??/2023)",0, 5)
        player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_07:25|t Season 4 (Encerrado ??/2023)",0, 6)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_06:25|t Season 5 (Encerrado ??/2023)",0, 7)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_03:25|t Season 6 (Encerrado ??/2023)",0, 8)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_09:25|t Season 7 (Encerrado ??/2023)",0, 9)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_08:25|t Season 8 (Encerrado ??/2023)",0, 10)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_inscription_parchment:25|t Proxima Página ",0, 11)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    end

if(intid == 3) then
	player:GossipSetText(string.format("   2x2:"))
        player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_7:25|t Rank 1 (Merciless Gladiator)\n Teste |cffffff002720 Rating |cFF000000305 - 20",0, 12)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_6:25|t Rank 2 (Gladiator)\nTeam Teste2 |cffffff002720 Rating |cFF000000305 - 20",0, 13)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_4:25|t Rank 3 (Gladiator)\nTeam Teste3 |cffffff002720 Rating |cFF000000305 - 20",0, 14)
	player:GossipMenuAddItem(9," 3x3: \n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_7:25|t Rank 1 (Merciless Gladiator)\nTeam Teste4 |cffffff002720 Rating |cFF000000305 - 20",0, 15)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_6:25|t Rank 2 (Gladiator)\nTeam Teste5 |cffffff002720 Rating |cFF000000305 - 20",0, 16)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_arena_2v2_4:25|t Rank 3 (Gladiator)\nTeam Teste6 |cffffff002720 Rating |cFF000000305 - 20",0, 17)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 12) then
	player:GossipSetText(string.format("|TInterface\\icons\\Achievement_pvp_h_h:25|t horda e ally =  |TInterface\\icons\\Achievement_pvp_a_16:25|t "))
        player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_sword_27:25|t |TInterface\\icons\\Achievement_pvp_h_h:25|t |cFF8B4513Warrteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_hammer_01:25|t |cffff00ffPalateste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_deathknight_classicon:25|t |cFF8B0000Dkteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_weapon_bow_07.png:25|t |cFF228B22Hunterteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_jewelry_talisman_04:25|t |cff0000ffShamanteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_misc_monsterclaw_04:25|t |cFFFF4500Druidteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_throwingknife_04:25|t |cffffff00Rogueteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_13:25|t |cFF00BFFFMageteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_30:25|t |cFFFFFFFFPriestteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_nature_drowsy:25|t |cFF800080Warlockteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,3)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 999987) then
	player:GossipSetText(string.format("|TInterface\\icons\\Achievement_pvp_h_h:25|t horda e ally =  |TInterface\\icons\\Achievement_pvp_a_16:25|t "))
      player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_sword_27:25|t |cFF8B4513Warrteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_hammer_01:25|t |cffff00ffPalateste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_deathknight_classicon:25|t |cFF8B0000Dkteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_weapon_bow_07.png:25|t |cFF228B22Hunterteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_jewelry_talisman_04:25|t |cff0000ffShamanteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_misc_monsterclaw_04:25|t |cFFFF4500Druidteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_throwingknife_04:25|t |cffffff00Rogueteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_13:25|t |cFF00BFFFMageteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\inv_staff_30:25|t |cFFFFFFFFPriestteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_nature_drowsy:25|t |cFF800080Warlockteste |cffffff002750 |cFF000000Personal Rating (150-15)\n",0, 0)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,3)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end





if (intid == 998) then
   On_Top_Hello(event, player, creature)
   end

if (intid == 999) then
   player:GossipComplete()	
   end	
end

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)