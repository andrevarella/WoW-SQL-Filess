-- local UnitEntry = 93026
local GameObjectEntry = 3501008

function On_Top_HelloArenaHallofFame(event, player, gameobject)
	local evento_data = os.time{year=2024, month=05, day=05} -- Data do Reset (ano, mês, dia)
    local hoje_data = os.time(os.date("*t")) -- Data atual
    local diferenca_dias = math.floor((evento_data - hoje_data) / (24 * 60 * 60))
	player:GossipSetText(string.format("\n\n   |TInterface\\icons\\Achievement_featsofstrength_gladiator_01:25|t Season 1 - Termina dia 05/05/24\n                               (Faltam %d dias) \n\n   |TInterface\\icons\\Achievement_featsofstrength_gladiator_02:25|t Season 2 - Começa dia ??/2023", diferenca_dias))

    player:GossipMenuAddItem(11," |TInterface\\icons\\Achievement_bg_killflagcarriers_grabflag_capit:25|tRegras e Season Cutoffs\n",0, 1)
    player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_quests_completed_08:25|t Gladiators de Seasons Anteriores\n",0, 2)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
end

function On_Top_SelectArenaHallofFame(event, player, gameobject, sender, intid, code)
if(intid == 1) then
player:GossipSetText(string.format("- Maximo de distancia entre Personal e Team Rating = 100.\n \n- Wintrade = time desqualificado + suspensão.\n \n- Premiações apenas para 2x2 e 3x3. \n\n|TInterface\\icons\\Achievement_bg_winwsg:25|t Season Cutoffs: "))
    player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_7:22|t Rank 1 - Season Gladiator \n |TInterface\\icons\\Achievement_arena_2v2_6:22|t Rank 2 e 3 - Gladiator \n |TInterface\\icons\\Achievement_arena_2v2_4:22|t Rank 4 e 5 - Duelist \n |TInterface\\icons\\Achievement_arena_2v2_1:22|t Rank 6 e 7 - Rival \n |TInterface\\icons\\Achievement_arena_2v2_1:22|t Rank 8, 9 e 10 - Challenger",0,998)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t Voltar",0,998)
    --player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:20:20:0:0|t |cFF8B0000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
end

if(intid == 2) then -- Gladiators de Seasons Anteriores
player:GossipSetText(string.format("\nGladiators das Seasons Anteriores"))
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_01:22|t Season 1 Teste (Encerrado 03/2023)",0, 3)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_02:22|t Season 2 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_04:22|t Season 3 (Encerrado ??/2023)",0, 997)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_07:22|t Season 4 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_06:22|t Season 5 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_03:22|t Season 6 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_09:22|t Season 7 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Achievement_featsofstrength_gladiator_08:22|t Season 8 (Encerrado ??/2023)",0, 997)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_inscription_parchment:20|t Proxima Página ",0, 11)
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t Voltar",0,998)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
    end

if(intid == 3) then -- Season 1 - Merciless Gladiator 
	player:GossipSetText(string.format("   2x2:"))
        player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_7:25|t Rank 1 (Merciless Gladiator)\n Teste |cffffff002720 Rating |cFF000000305 - 20",0, 12)
	player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_6:25|t Rank 2 (Gladiator)\nTeam Teste2 |cffffff002720 Rating |cFF000000305 - 20",0, 13)
	player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_4:25|t Rank 3 (Gladiator)\nTeam Teste3 |cffffff002720 Rating |cFF000000305 - 20",0, 14)
	player:GossipMenuAddItem(9," 3x3: \n",0, 0)
	player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_7:25|t Rank 1 (Merciless Gladiator)\nTeam Teste4 |cffffff002720 Rating |cFF000000305 - 20",0, 15)
	player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_6:25|t Rank 2 (Gladiator)\nTeam Teste5 |cffffff002720 Rating |cFF000000305 - 20",0, 16)
	player:GossipMenuAddItem(9," |TInterface\\icons\\Achievement_arena_2v2_4:25|t Rank 3 (Gladiator)\nTeam Teste6 |cffffff002720 Rating |cFF000000305 - 20",0, 17)
	player:GossipMenuAddItem(4," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t Voltar",0,2)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
end

if(intid == 12) then -- Rank 1 2v2 do Season 1
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
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t Voltar",0,3)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
end

if(intid == 999987) then -- Template dos integrantes dos times
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
	player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t Voltar",0,3)
    player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
end





if (intid == 997) then
   On_Top_SelectArenaHallofFame(event, player, gameobject, sender, 2, code)
   end


if (intid == 998) then
   On_Top_HelloArenaHallofFame(event, player, gameobject)
   end

if (intid == 999) then
   player:GossipComplete()	
   end	
end

RegisterGameObjectGossipEvent(GameObjectEntry, 1, On_Top_HelloArenaHallofFame)
RegisterGameObjectGossipEvent(GameObjectEntry, 2, On_Top_SelectArenaHallofFame)