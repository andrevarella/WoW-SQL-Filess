
Timer = {}

function Timer.Teleport(eventid, delay, repeats, player)
    player:SendAreaTriggerMessage("Teleporting in " .. repeats .. " seconds.")
end

local ItemEntry = 83550
local ItemEntryEterno = 83555
--local NPC_ID = 45432

local GOSSIP_EVENT_ON_SELECT = 2
local PLAYER_EVENT_ON_SPELL_CAST = 5
local GOSSIP_EVENT_ON_HELLO = 1

local druidMorph = {}
druidMorph.druidMorhValid = {
    ["Menu"] = {
        {"|TInterface\\icons\\Ability_druid_catform.png:29|t Cat", 3},
        {"|TInterface\\icons\\Ability_racial_bearform.png:29|t Bear", 1},
        {"|TInterface\\icons\\Ability_druid_travelform.png:29|t Travel", 4},
        {"|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:29|t Moonkin", 5},
		{"|TInterface\\icons\\Ability_druid_aquaticform.png:29|t Aquatic", 2},
		{"|TInterface\\icons\\Ability_druid_TreeofLife.png:29|t Tree", 6}

    },

    [3] = { -- Cat Form
        [1] = {  -- Night Elf    -  Limite = 33, mais que isso dá erro
            {"Fire Cat Armored", 50207},
			{"Fire Cat", 50208},
			{"Armored Cat Black", 50209},
			{"Armored Cat White", 50213},
			{"Armored Cat Blue", 50210},
			{"Armored Cat Purple", 50211},
			{"Armored Cat Pink", 50212},
			{"Cat Form Challenge Blue", 50227},
			{"Cat Form Challenge Red", 50230},
			{"Cat Form Challenge Green", 50228},
			{"Cat Form Challenge Purple", 50229},
			{"Cat Form Honor Red", 50244},
			{"Cat Form Honor Orange", 50243},
			{"Cat Form Honor Blue", 50241},
			{"Cat Form Honor Green", 50242},
			{"Cat Form Artifact 4 Purple", 50239},
			{"Cat Form Artifact 4 White", 50240},
			{"Cat Form Artifact 4 Orange", 50238},
			{"Cat Form Artifact 4 Green", 50237},
			{"Cat Form Artifact 3 Purple", 50235},
			{"Cat Form Artifact 3 Blue", 50232},
			{"Cat Form Artifact 3 Orange", 50234},
			{"Cat Form Artifact 3 Green", 50233},
			{"Cat Form Artifact 1 White", 50226},
			{"Cat Form Artifact 1 Blue", 50225},
			{"Cat Form Artifact 1 Black", 50219},
			{"Cat Form Artifact 1 Brown", 50222},
			{"Owl Cat Form Black", 50245},
			{"Owl Cat Form White", 50246}
        },
        [2] = {  -- Tauren Cat Forms
             {"Fire Cat Armored", 50207},
			{"Fire Cat", 50208},
			{"Armored Cat Black", 50215},
			{"Armored Cat White", 50217},
			{"Armored Cat Brown", 50216},
			{"Armored Cat Light Brown", 50214},
			{"Armored Cat Yellow", 50218},
			{"Cat Form Challenge Blue", 50227},
			{"Cat Form Challenge Red", 50230},
			{"Cat Form Challenge Green", 50228},
			{"Cat Form Challenge Purple", 50229},
			{"Cat Form Honor Red", 50244},
 			{"Cat Form Honor Orange", 50243},
 			{"Cat Form Honor Blue", 50241},
 			{"Cat Form Honor Green", 50242},
 			{"Cat Form Artifact 4 Purple", 50239},
 			{"Cat Form Artifact 4 White", 50240},
 			{"Cat Form Artifact 4 Orange", 50238},
 			{"Cat Form Artifact 4 Green", 50237},
 			{"Cat Form Artifact 3 Purple", 50235},
 			{"Cat Form Artifact 3 Blue", 50232},
 			{"Cat Form Artifact 3 Orange", 50234},
 			{"Cat Form Artifact 3 Green", 50233},
			{"Cat Form Artifact 1 White", 50226},
		    {"Cat Form Artifact 1 Blue", 50225},
 			{"Cat Form Artifact 1 Black", 50219},
 			{"Cat Form Artifact 1 Brown", 50222},
 			{"Owl Cat Form Black", 50245},
		    {"Owl Cat Form White", 50246}
        },
	  [3] = {  -- Troll Cat Forms
            {"Fire Cat Armored", 50207},
            {"Fire Cat", 50208},
            {"Armored Cat Blue", 50600},
            {"Armored Cat White", 50596},
            {"Armored Cat Red", 50598},
            {"Armored Cat Yellow", 50599},
            {"Armored Cat Green", 50597},
            {"Cat Form Challenge Blue", 50227},
            {"Cat Form Challenge Red", 50230},
            {"Cat Form Challenge Green", 50228},
            {"Cat Form Challenge Purple", 50229},
            {"Cat Form Honor Red", 50244},
            {"Cat Form Honor Orange", 50243},
            {"Cat Form Honor Blue", 50241},
            {"Cat Form Honor Green", 50242},
            {"Cat Form Artifact 4 Purple", 50239},
            {"Cat Form Artifact 4 White", 50240},
            {"Cat Form Artifact 4 Orange", 50238},
            {"Cat Form Artifact 4 Green", 50237},
            {"Cat Form Artifact 3 Purple", 50235},
            {"Cat Form Artifact 3 Blue", 50232},
            {"Cat Form Artifact 3 Orange", 50234},
            {"Cat Form Artifact 3 Green", 50233},
            {"Cat Form Artifact 1 White", 50226},
            {"Cat Form Artifact 1 Blue", 50225},
            {"Cat Form Artifact 1 Black", 50219},
            {"Cat Form Artifact 1 Brown", 50222},
            {"Owl Cat Form Black", 50245},
            {"Owl Cat Form White", 50246}
        }
    },
    [1] = {  -- Bear Form
        [1] = {  -- Night Elf Bears
            {"Challenge Bear Red", 50513},
            {"Challenge Bear Blue", 50510},
            {"Challenge Bear Purple", 50512},
            {"Challenge Bear Green", 50511},
            {"Spiked Bear Red", 50517},
            {"Spiked Bear Orange", 50515},
            {"Spiked Bear Blue", 50514},
            {"Spiked Bear Green", 50516},
            {"Boned Bear Black", 50518},
            {"Boned Bear Brown", 50519},
            {"Boned Bear Orange", 50520},
            {"Boned Bear White", 50521},
            {"Bear Artifact Black", 50495},
            {"Bear Artifact White", 50493},
            {"Bear Artifact Brown", 50496},
            {"Bear Artifact Blue", 50492},
            {"Werebear Black", 50203},
            {"Werebear White", 50206},
            {"Werebear Brown", 50205},
            {"Werebear Yellow", 50204},
            {"Stone Bear Black", 50506},
            {"Stone Bear Brown", 50508},
            {"Stone Bear Purple", 50509},
            {"Stone Bear Grey", 50507}
        },
        [2] = {  -- Tauren Bears
            {"Challenge Bear Red", 50513},
            {"Challenge Bear Blue", 50510},
            {"Challenge Bear Purple", 50512},
            {"Challenge Bear Green", 50511},
            {"Spiked Bear Red", 50517},
            {"Spiked Bear Orange", 50515},
            {"Spiked Bear Blue", 50514},
            {"Spiked Bear Green", 50516},
            {"Boned Bear Black", 50518},
            {"Boned Bear Brown", 50519},
            {"Boned Bear Orange", 50520},
            {"Boned Bear White", 50521},
            {"Bear Artifact Black", 50495},
            {"Bear Artifact White", 50493},
            {"Bear Artifact Brown", 50496},
            {"Bear Artifact Blue", 50492},
            {"Werebear Black", 50203},
            {"Werebear White", 50206},
            {"Werebear Brown", 50205},
            {"Werebear Yellow", 50204},
            {"Stone Bear Black", 50506},
            {"Stone Bear Brown", 50508},
            {"Stone Bear Purple", 50509},
            {"Stone Bear Grey", 50507}
        },
        [3] = {  -- Troll Bears
            {"Challenge Bear Red", 50513},
            {"Challenge Bear Blue", 50510},
            {"Challenge Bear Purple", 50512},
            {"Challenge Bear Green", 50511},
            {"Spiked Bear Red", 50517},
            {"Spiked Bear Orange", 50515},
            {"Spiked Bear Blue", 50514},
            {"Spiked Bear Green", 50516},
            {"Boned Bear Black", 50518},
            {"Boned Bear Brown", 50519},
            {"Boned Bear Orange", 50520},
            {"Boned Bear White", 50521},
            {"Bear Artifact Black", 50495},
            {"Bear Artifact White", 50493},
            {"Bear Artifact Brown", 50496},
            {"Bear Artifact Blue", 50492},
            {"Werebear Black", 50203},
            {"Werebear White", 50206},
            {"Werebear Brown", 50205},
            {"Werebear Yellow", 50204},
            {"Stone Bear Black", 50506},
            {"Stone Bear Brown", 50508},
            {"Stone Bear Purple", 50509},
            {"Stone Bear Grey", 50507},
            {"Armored Bear White", 50588},
            {"Armored Bear Blue", 50585},
            {"Armored Bear Red", 50587},
            {"Armored Bear Purple", 50586},
            {"Armored Bear Yellow", 50589}
        }
    },
    [2] = {
        [1] = {  -- Night Elf - Aquatic Form
            {"Orca", 50494},
            {"Default Aquatic Form", 2428}
        },
        [2] = {  -- Tauren - Aquatic Form
            {"Orca", 50494},
            {"Default Aquatic Form", 2428}
        },
        [3] = {  -- Troll - Aquatic Form
            {"Orca", 50494},
            {"Default Aquatic Form", 2428}
        }
    },
    [5] = {
        [1] = {   -- Night Elf Moonkin
            {"Armored Moonkin", 50503},
            {"Default Moonkin", 15374}
        },
        [2] = {   -- Tauren Moonkin
            {"Armored Moonkin", 50502},
            {"Default Moonkin", 15375}
        },
        [3] = {   -- Troll Moonkin
            {"Armored Moonkin", 50502},
            {"Default Moonkin", 50590}
        }
    },
	[6] = {
	    [1] = {  -- Night Elf - Tree Form
            {"Cataclysm Tree Form (Green)", 50672},
			{"Cataclysm Tree Form (Orange)", 50673},
			{"Cataclysm Tree Form (Purple)", 50674},
		    {"Cataclysm Tree Form (Red)", 50675},
            {"Default Tree Form", 864}
        },
        [2] = {  -- Tauren - Tree Form
            {"Cataclysm Tree Form (Green)", 50672},
			{"Cataclysm Tree Form (Orange)", 50673},
			{"Cataclysm Tree Form (Purple)", 50674},
		    {"Cataclysm Tree Form (Red)", 50675},
            {"Default Tree Form", 864}
        },
        [3] = {  -- Troll - Tree Form
            {"Cataclysm Tree Form (Green)", 50672},
			{"Cataclysm Tree Form (Orange)", 50673},
			{"Cataclysm Tree Form (Purple)", 50674},
		    {"Cataclysm Tree Form (Red)", 50675},
            {"Default Tree Form", 864}
        }
	},
    [4] = {
        [1] = { -- Night Elf - Travel Form
            {"Night Elf Stag", 50504},
            {"Default Travel", 918}
        },
        [2] = { -- Tauren - Travel Form
            {"Tauren Stag", 50505},
			{"Highmountain Tauren Stag", 50676},
            {"Default Travel Form", 918}
        },
        [3] = { -- Troll - Travel Form
            {"Zandalari Raptor", 50677},
            {"Default Travel", 918}
        }
    }
}

local MENU_ID = 100

function TeleporterItem_Gossip(unit, player, creature)
    player:GossipSetText(string.format(" "))

	player:GossipMenuAddItem(2," |TInterface/Icons/Spell_Arcane_TeleportDalaran:28|t |cFF0000FFTeleports", 0, 1)
    player:GossipMenuAddItem(6," |TInterface/Icons/Inv_misc_coin_02.png:28|t |cFF0000FFAuction House", 0, 2)
    player:GossipMenuAddItem(1," |TInterface/Icons/Inv_misc_enggizmos_17.png:28|t |cFF0000FFBank", 0, 3)
	player:GossipMenuAddItem(8," |TInterface/Icons/Inv_misc_enggizmos_17.png:28|t |cFF0000FFSummon Guild Vault", 0, 4)
	player:GossipMenuAddItem(2," |TInterface/Icons/Inv_letter_09.png:28|t |cFF0000FFMail",0, 5)
	player:GossipMenuAddItem(4," |TInterface\\icons\\inv_pet_lilsmoky.png:28|t |cFF0000FFSumonar Npcs Temporariamente|r", 0, 6)
	player:GossipMenuAddItem(3," |TInterface\\icons\\Ability_marksmanship:28|t |cFF0000FFResetar Talents", 0, 7, false, "Tem certeza que quer resetar os Talents?")
	if player:GetClass() == 11 then 
		player:GossipMenuAddItem(3," |TInterface\\icons\\Ability_druid_healinginstincts:27|t |cFF0000FFDruid Form Customizer", 0, 8)
	end

	if player:IsGMVisible() then -- Disponivel apenas para GMs
		player:GossipMenuAddItem(5, "\n\n |TInterface\\icons\\Achievement_BG_winWSG:25|t Change Faction |cFF0000FF(Apenas p/ GM)", 0, 9, false, "Tem certeza que quer trocar a Facção do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\Ability_Rogue_Disguise:25|t Change Race |cFF0000FF(Apenas p/ GM)", 0, 10, false, "Tem certeza que quer trocar a Raça do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\INV_Letter_18:25|t Change Name |cFF0000FF(Apenas p/ GM)", 0, 11, false, "Tem certeza que quer trocar o Nome do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\INV_Misc_GroupLooking:25|t Change Appearance |cFF0000FF(Apenas p/ GM)", 0, 12, false, "Tem certeza que quer trocar a Aparencia do Personagem?")
	end
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

RegisterItemGossipEvent(ItemEntry, 1, TeleporterItem_Gossip)
RegisterItemGossipEvent(ItemEntryEterno, 1, TeleporterItem_Gossip)


function Teleporter_Event(event, player, creature, sender, intid, code, menu_id)

	local JeevesID = 35642 
	local BankNPCID = 30604
	local AuctioneerID = 93060
	local NpcArenaJoinID = 32330
	local NpcArenaTeamID = 93072
	local NpcTransmogID = 94132
    local NpcWeaponEnchantID = 94164

	if(intid == 1) then
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode Teleportar enquanto estiver em Combat ou em Battlegrounds.")
		else
			player:GossipSetText(string.format(" "))
			if (player:IsAlliance()) then
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportStormWind:29.png:27|t |cFF0000FFTeleport para Stormwind", 0, 30, false, "Tem certeza que quer ir para Stormwind?")
			elseif (player:IsHorde()) then
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportOrgrimmar:29|t |cFF0000FFTeleport para Orgrimmar", 0, 31, false, "Tem certeza que quer ir para Orgrimmar?")
			end
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportDalaran:29|t |cFF0000FFTeleport para Dalaran", 0, 32, false, "Tem certeza que quer ir para Dalaran?")
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportShattrath:29|t |cFF0000FFTeleport para Shattrath", 0, 33, false, "Tem certeza que quer ir para Shattrath?")
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:29|t |cFF0000FFTeleport para o Mall (Grizzly Hills)", 0, 35, false, "Tem certeza que quer ir para o Mall?")
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_bg_masterofallbgs.png:29|t |cFF0000FFTeleport para Area Vip", 0, 34, false, "Tem certeza que quer ir para Area Vip?")
			player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)		
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
		end
	end
	
	
	if (intid == 30) then -- Teleport Stormwind  
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2) -- Feedback em segundos, no meio da tela
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(0, -8808.827148, 585.609863, 96.655205, 1.049635)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1) -- tempo para o Teleport ocorrer
	end
	
	
	if(intid == 31) then -- Teleport Orgrimmar 
		if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(1, 1609.845215, -4252.748047, 45.741608, 5.402731)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1)
	end
	
	
	if(intid == 32) then -- Teleport Dalaran 
        if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(571, 5807.512695, 589.116821, 660.939148, 1.741521)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1)
	end
	
	
	if(intid == 33) then -- Teleport Shattrath 
        if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2)
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then
				p:Teleport(530, -1879.896973, 5382.599121, -12.428157, 1.283299)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1)
	end
	
	
	if(intid == 34) then -- Teleport Area Vip
	    if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2) -- Feedback em segundos, no meio da tela
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then -- Se o jogador não está em combate, teleportar
				p:Teleport(1, 5459.22980, -3722.648438, 1593.443726, 3.032393)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1) -- tempo para o Teleport ocorrer
	end
    if(intid == 35) then -- Teleport Mall
	    if player:IsInCombat() then
            player:SendBroadcastMessage("Você não pode usar o teleporte enquanto estiver em combate.")
            player:GossipComplete()
            return
		end
		player:GossipComplete()
		player:SendAreaTriggerMessage("Teleporting in 3 seconds.")
		player:RegisterEvent(Timer.Teleport, 1000, 2) -- Feedback em segundos, no meio da tela
        player:RegisterEvent(function(e, d, r, p)
			if not p:IsInCombat() then -- Se o jogador não está em combate, teleportar
				p:Teleport(571, 2884.257568, -2674.678955, 84.674553, 2.604867)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 2000, 1) -- tempo para o Teleport ocorrer
	end
	
    if(intid == 2) then -- Usar Auction House
		player:SendAuctionMenu(player)
		player:GossipComplete()
	end
	if(intid == 3) then -- Usar Banco
        player:SendShowBank(player)
        player:GossipComplete()	
	end
	if(intid == 4) then -- Summon Guild Bank
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode sumonar o Guild Vault enquanto estiver em Combat ou em Battlegrounds.")
		else
			player:CastSpell(player, 83344, true)
			player:GossipComplete()
			player:SendBroadcastMessage("Você sumonou um Guild Vault por 30 segundos.")
		end
	end
	if(intid == 5) then -- Usar Mail
        player:SendShowMailBox(player:GetGUID())
		player:GossipComplete()	
	end
	
	if(intid == 6) then -- Submenu Summon Npcs
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode sumonar Npcs enquanto estiver em Combat ou em Battlegrounds.")
		else
			player:GossipSetText(string.format("Os npcs são sumonados por 15 segundos."))
			player:GossipMenuAddItem(1," |TInterface\\icons\\inv_pet_lilsmoky.png:29|t |cFF0000FFJeeves", 0, 40)
			--player:GossipMenuAddItem(6," |TInterface\\icons\\ability_repair:27|t |cFF0000FFReparar Equipamentos", 0, 41)	
			--player:GossipMenuAddItem(1," |TInterface/Icons/Inv_misc_enggizmos_17.png:28|t |cFF0000FFBank", 0, 42)
			--player:GossipMenuAddItem(6," |TInterface/Icons/Inv_misc_coin_02.png:28|t |cFF0000FFAuction House", 0, 43)
			--player:GossipMenuAddItem(2," |TInterface/Icons/Inv_letter_09.png:28|t |cFF0000FFMail", 0, 44)
			player:GossipMenuAddItem(9," |TInterface/Icons/Achievement_arena_2v2_7.png:29|t |cFF0000FFJoinar Arena", 0, 45)
			player:GossipMenuAddItem(9," |TInterface/Icons/Inv_scroll_11.png:29|t |cFF0000FFCriar Time de Arena", 0, 46)
			player:GossipMenuAddItem(9," |TInterface/Icons/Achievement_boss_nexus_prince_shaffar.png:29|t |cFF0000FFTransmogrification", 0, 47)
			player:GossipMenuAddItem(9," |TInterface\\icons\\Inv_sword_01:29|t |cFF0000FFTransmog Weapon|r |cFFFF00FFEnchant", 0, 48)	
			--player:GossipMenuAddItem(5," |TInterface/Icons/Ability_rogue_disguise.png:29|t |cFF0000FFMorph", 1, 49)
			player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)		
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
		end
	end
	
	if(intid == 7) then -- Reset Talents
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode resetar os Talents enquanto estiver em Combat ou em Battlegrounds.")
		else
			player:ResetTalents()
			player:RemoveSpell(43039)
			player:GossipComplete()
			player:SendBroadcastMessage("Seus talentos foram resetados.")	
		end
	end
	if(intid == 8) then -- Mod Druid Form Customizer
	    druidMorph.menu(event, player, object)
    end
	if(intid == 40) then -- Jeeves
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local Jeeves = PerformIngameSpawn(1, JeevesID, mapId, 0, x, y, z, o, false, 0, 2)
		if (Jeeves) then
			Jeeves:MoveFollow(player)
			Jeeves:SetSpeed(0, 50000)
			Jeeves:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end
	end
	if(intid == 41) then -- Repair Gear
        player:DurabilityRepairAll(100,100)
	    player:SendBroadcastMessage("Seus items foram reparados.")
	    player:GossipComplete()		
	end
	if(intid == 42) then -- Npc Bank - Desativado Indefinitivamente
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local BankNPC = PerformIngameSpawn(1, BankNPCID, mapId, 0, x, y, z, o, false, 0, 2)
		if (BankNPC) then
			BankNPC:MoveFollow(player)
			BankNPC:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end	
	end
	
	if(intid == 43) then -- Npc Auction House - Desativado Indefinitivamente
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local AuctionerNPC = PerformIngameSpawn(1, AuctioneerID, mapId, 0, x, y, z, o, false, 0, 2)
		
		if (AuctionerNPC) then
			AuctionerNPC:MoveFollow(player)
			AuctionerNPC:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end	
	end
	if(intid == 44) then -- Summon Mail - DESATIVADO
        player:CastSpell(player, 83345, true)
		player:SendBroadcastMessage("Você sumonou um Mail por 30 segundos.")
        player:GossipComplete()	
	end
	if(intid == 45) then -- Npc Join Arena		
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local NpcArenaJoin = PerformIngameSpawn(1, NpcArenaJoinID, mapId, 0, x, y, z, o, false, 0, 2)
		if (NpcArenaJoin) then
			NpcArenaJoin:MoveFollow(player)
			NpcArenaJoin:DespawnOrUnsummon(15000)
		    player:GossipComplete()
		end	
	end
	if(intid == 46) then -- Npc Create Arena Team
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local NpcArenaTeam = PerformIngameSpawn(1, NpcArenaTeamID, mapId, 0, x, y, z, o, false, 0, 2)
		if (NpcArenaTeam) then
			NpcArenaTeam:MoveFollow(player)
			NpcArenaTeam:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end	
	end
	if(intid == 47) then -- Npc Transmog
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local NpcTransmog = PerformIngameSpawn(1, NpcTransmogID, mapId, 0, x, y, z, o, false, 0, 2)
		if (NpcTransmog) then
			NpcTransmog:MoveFollow(player)
			NpcTransmog:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end	
	end
	if(intid == 48) then -- Npc Weapon Enchant
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local NpcWeaponEnchant = PerformIngameSpawn(1, NpcWeaponEnchantID, mapId, 0, x, y, z, o, false, 0, 2)
		if (NpcWeaponEnchant) then
			NpcWeaponEnchant:MoveFollow(player)
			NpcWeaponEnchant:DespawnOrUnsummon(15000)
		    player:GossipComplete()
		end	
	end
	if(intid == 49) then -- Npc Player Morpher - DESATIVADO
		local NpcMorpherID = 93131
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local MorpherNPC = PerformIngameSpawn(1, NpcMorpherID, mapId, 0, x, y, z, o, false, 0, 2)
		if (MorpherNPC) then
			MorpherNPC:MoveFollow(player)
			MorpherNPC:DespawnOrUnsummon(15000)
		    player:GossipComplete()		
		end	
	end
	if (intid == 9) then -- Trocar Facção (GM Only)
		player:SetAtLoginFlag(64) player:SendAreaTriggerMessage("Relogue para alterar sua facção.")
		player:GossipComplete()
	end
	if (intid == 10) then -- Alterar Raça (GM Only)
		player:SetAtLoginFlag(128) player:SendAreaTriggerMessage("Relogue para alterar sua raça.")
		player:GossipComplete()
	end
	if (intid == 11) then -- Alterar Nome (GM Only)
		player:SetAtLoginFlag(1) player:SendAreaTriggerMessage("Relogue para alterar seu nome.")
		player:GossipComplete()
	end
	if (intid == 12) then -- Alterar Aparência (GM Only)
		player:SetAtLoginFlag(8) player:SendAreaTriggerMessage("Relogue para alterar sua aparência.")
		player:GossipComplete()
	end
	
	if(intid == 499) then -- Voltar
   TeleporterItem_Gossip(unit, player, creature)
   end
end	
	
RegisterItemGossipEvent(ItemEntry, 2, Teleporter_Event)
RegisterItemGossipEvent(ItemEntryEterno, 2, Teleporter_Event)

function druidMorph.menu(event, player, object)
    local race = player:GetRace()
    local class = player:GetClass()
    player:GossipClearMenu()
    for _, menuName in ipairs(druidMorph.druidMorhValid["Menu"]) do
        player:GossipMenuAddItem(3, menuName[1] .. " Form.", 0, menuName[2])   -- print(menuName[1], menuName[2])
    end
    player:GossipSendMenu(1, player, MENU_ID)
end


function druidMorph.selectionMorph(event, player, object, sender, intid, code, menu_id)
local formName = ""  -- Inicializa formName como uma string vazia


    -- BEAR
    if intid == 1 then
        -- print("Bear")
        player:GossipClearMenu()
        if not player:HasAura(9634 or 5487) then
            player:SendBroadcastMessage("You are not in bear form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then   -- Night Elf Bear
        -- set form
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
        -- print(menuName[1], menuName[2])
            end
            
        elseif (player:GetRace() == 6) then   -- Tauren Bear
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then   -- troll Bear
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 1)
        player:GossipSendMenu(1, player, MENU_ID)


    -- AQUATIC
    elseif intid == 2 then
        -- print("Aquatic")
        player:GossipClearMenu()
        if not player:HasAura(1066) then
            player:SendBroadcastMessage("You are not in Aquatic form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then -- Night Elf Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then -- Tauren Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then -- Troll Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][3]) do
            player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 2)
        player:GossipSendMenu(1, player, MENU_ID)

    -- CAT
    elseif intid == 3 then
        player:GossipClearMenu()
        -- print("Cat")
        if not player:HasAura(768) then
            player:SendBroadcastMessage("You are not in Cat form")
            return druidMorph.menu(event, player, object)
        end
 
        if (player:GetRace() == 4) then -- Nelf Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then -- Tauren Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then -- Troll Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 3)
        player:GossipSendMenu(1, player, MENU_ID)

    -- Travel 
    elseif intid == 4 then
        -- print("Travel")
        player:GossipClearMenu()
        if not player:HasAura(783) then
            player:SendBroadcastMessage("You are not in Travel form.")
            return druidMorph.menu(event, player, object)
        end

         if (player:GetRace() == 4) then   -- Night Elf Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then   -- Tauren Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        
        elseif (player:GetRace() == 8) then   -- Troll Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 4)
        player:GossipSendMenu(1, player, MENU_ID)

    -- Moonkin Form
    elseif intid == 5 then
        -- print("Moonkin")
        player:GossipClearMenu()
        if not player:HasAura(24858) then
            player:SendBroadcastMessage("You are not in Moonkin form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then   -- Night Elf Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][1]) do          -- set form
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

        elseif (player:GetRace() == 6) then   -- Tauren Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then   -- Troll Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 5)
        player:GossipSendMenu(1, player, MENU_ID)
	-- Tree Form
	elseif intid == 6 then
        -- print("Tree")
        player:GossipClearMenu()
        if not player:HasAura(33891) then
            player:SendBroadcastMessage("You are not in Tree form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then   -- Night Elf Tree Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[6][1]) do          -- set form
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

        elseif (player:GetRace() == 6) then   -- Tauren Tree Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[6][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then   -- Troll Tree Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[6][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 6)
        player:GossipSendMenu(1, player, MENU_ID)
    end
	
    
 
    if intid ~= 1 and intid ~= 2 and intid ~= 3 and intid ~= 4 and intid ~= 5 and intid ~= 6 then
        player:SetDisplayId(intid)
 
        local currentForm = player:GetData("currentForm")
        local formName
        if currentForm == 1 then
            formName = "DisplayBearForm"
            player:SaveToDB() 
		elseif currentForm == 2 then
            formName = "DisplayAquaticForm"
            player:SaveToDB() 
        elseif currentForm == 3 then
            formName = "DisplayCatForm"
            player:SaveToDB() 
        elseif currentForm == 4 then
            formName = "DisplayTravelForm"
            player:SaveToDB() 
        elseif currentForm == 5 then
            formName = "DisplayMoonkinForm"
            player:SaveToDB() 
		elseif currentForm == 6 then
            formName = "DisplayTreeForm"
            player:SaveToDB() 
        end
        CharDBExecute("INSERT INTO custom_druid_form_display (player_guid, "..formName..") VALUES ("..player:GetGUIDLow()..","..intid..") ON DUPLICATE KEY UPDATE "..formName.."="..intid)
		
 
        druidMorph.menu(event, player, object)
    end
end


function druidMorph.castDisplay2(event, player, spell, skipCheck)

    local LuaIsNull = function(val, default)
	if val ~= nil and val ~= 0 then
		return val
	else
		return default
		end
	end
	

    local Query = CharDBQuery("SELECT * FROM custom_druid_form_display WHERE player_guid = "..player:GetGUIDLow())
    
    if(Query) then
        local DisplayCatForm = LuaIsNull(Query:GetUInt32(1), nil)
        local DisplayBearForm = LuaIsNull(Query:GetUInt32(2), nil)
		local DisplayTravelForm = LuaIsNull(Query:GetUInt32(3), nil)
		local DisplayMoonkinForm = LuaIsNull(Query:GetUInt32(4), nil)
        local DisplayAquaticForm = LuaIsNull(Query:GetUInt32(5), nil)
		local DisplayTreeForm = LuaIsNull(Query:GetUInt32(6), nil)

        
        -- Checa a raça para determinar qual será o DisplayID padrão
        local race = player:GetRace()
        local defaultCatForm
        local defaultBearForm
	    local defaultTravelForm
        local defaultMoonkinForm
        local defaultAquaticForm
		local defaultTreeForm

        if race == 4 then -- Night Elf
            defaultCatForm = 29406
            defaultBearForm = 29417
			defaultTravelForm = 918
            defaultMoonkinForm = 15374
            defaultAquaticForm = 2428
			defaultTreeForm = 864
        elseif race == 6 then -- Tauren
            defaultCatForm = 29411
            defaultBearForm = 29420
			defaultTravelForm = 918
            defaultMoonkinForm = 15375
            defaultAquaticForm = 2428
			defaultTreeForm = 864
        elseif race == 8 then -- Troll
            defaultCatForm = 50595
            defaultBearForm = 50580
		    defaultTravelForm = 918
            defaultMoonkinForm = 50590
            defaultAquaticForm = 2428
			defaultTreeForm = 864
        end

        if player:HasAura(768) then   -- Cat Form
            player:SetDisplayId(DisplayCatForm or defaultCatForm)
        end
        if player:HasAura(9634) then  -- Bear Form
            player:SetDisplayId(DisplayBearForm or defaultBearForm)
        end
		if player:HasAura(783) then   -- Travel Form
            player:SetDisplayId(DisplayTravelForm or defaultTravelForm)
        end
        if player:HasAura(24858) then -- Moonkin Form
            player:SetDisplayId(DisplayMoonkinForm or defaultMoonkinForm)
        end
        if player:HasAura(1066) then  -- Aquatic Form
            player:SetDisplayId(DisplayAquaticForm or defaultAquaticForm)
        end
		if player:HasAura(33891) then   -- Tree Form
            player:SetDisplayId(DisplayTreeForm or defaultTreeForm)
        end
    end
end


-- fix, não aplicava o customdisplay ao logar, tinha que renovar a forma
function druidMorph.applyCatFormOnLogin(event, player)
    if player:GetClass() == 11 then -- Druids Only
        if player:HasAura(768) then -- Cat Form
            player:RemoveAura(768) --
            player:AddAura(768, player)
        elseif player:HasAura(9634) then -- Bear
            player:RemoveAura(9634)
            player:AddAura(9634, player)
        elseif player:HasAura(783) then -- Travel
            player:RemoveAura(783)
            player:AddAura(783, player)
        elseif player:HasAura(24858) then -- Moonkin
            player:RemoveAura(24858)
            player:AddAura(24858, player)
        elseif player:HasAura(1066) then -- Aquatic
            player:RemoveAura(1066)
            player:AddAura(1066, player)
		elseif player:HasAura(33891) then -- Tree
            player:RemoveAura(33891)
            player:AddAura(33891, player)
        end
    end
end
 
RegisterPlayerEvent(PLAYER_EVENT_ON_SPELL_CAST, druidMorph.castDisplay2)
RegisterPlayerGossipEvent(MENU_ID, GOSSIP_EVENT_ON_SELECT, druidMorph.selectionMorph)
--RegisterCreatureGossipEventVip(NPC_ID, GOSSIP_EVENT_ON_HELLO, druidMorph.menu)
RegisterPlayerEvent(3, druidMorph.applyCatFormOnLogin)