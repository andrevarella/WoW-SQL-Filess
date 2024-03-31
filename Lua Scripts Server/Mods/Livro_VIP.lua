local ItemEntry = 61000
local ItemEntryEterno = 61001
local MenuId = 123

local druidMorph     = require("NPC_Morph_DruidForm_Morpher")

Timer = {}

function Timer.Teleport(eventid, delay, repeats, player)
    player:SendAreaTriggerMessage("Teleporting in " .. repeats .. " seconds.")
end

-- function TeleporterItem_Gossip(unit, player, object)
function TeleporterItem_Gossip(event, player, object)
    player:GossipSetText(string.format(" "))

	player:GossipMenuAddItem(2," |TInterface/Icons/Spell_Arcane_TeleportDalaran:28|t |cFF0000FFTeleports", 0, 1)
	player:GossipMenuAddItem(2," |TInterface/Icons/Inv_letter_09.png:28|t |cFF0000FFMail",0, 5)
    player:GossipMenuAddItem(6," |TInterface/Icons/Inv_misc_coin_02.png:28|t |cFF0000FFAuction House", 0, 2)
    player:GossipMenuAddItem(1," |TInterface/Icons/Inv_misc_enggizmos_17.png:28|t |cFF0000FFBank", 0, 3)
	player:GossipMenuAddItem(8," |TInterface/Icons/Inv_misc_enggizmos_17.png:28|t |cFF0000FFSummon Guild Vault", 0, 4)
	player:GossipMenuAddItem(3," |TInterface/Icons/INV_Misc_Book_04.png:28|t |cFF0000FFSummon Talent Archivist", 0, 52)
	--player:GossipMenuAddItem(3," |TInterface\\icons\\Ability_marksmanship:28|t |cFF0000FFResetar Talents", 0, 7, false, "Tem certeza que quer resetar os Talents?")
	player:GossipMenuAddItem(4," |TInterface\\icons\\inv_pet_lilsmoky.png:28|t |cFF0000FFSumonar Npcs Temporariamente ->|r", 0, 6)
	
	--if player:GetClass() == 11 then 
	--	player:GossipMenuAddItem(3," |TInterface\\icons\\Ability_druid_healinginstincts:27|t |cFF0000FFDruid Form Customizer", 0, 750)
	--end
	--player:GossipMenuAddItem(3," |TInterface\\icons\\Inv_sword_01:29|t |cFF0000FFTransmog Weapon|r |cFFFF00FFEnchant (Gossip)", 0, 50) -- nao funciona ATM
	--player:GossipMenuAddItem(3," |TInterface/Icons/Ability_rogue_disguise.png:29|t |cFF0000FFMorph (Gossip)", 0, 51) -- n funciona
    if player:GetClass() == 3 then  -- Hunter
		player:GossipMenuAddItem(4," |TInterface\\icons\\ability_hunter_beasttraining.png:28|t |cFF228B22[Hunters apenas]|r |cFF0000FFFeed Pet", 0, 753)
	end

	if player:IsGMVisible() then -- Disponivel apenas para GMs
		player:GossipMenuAddItem(5, "\n\n |TInterface\\icons\\Achievement_BG_winWSG:25|t Change Faction |cFF0000FF(Apenas p/ GM)", 0, 9, false, "Tem certeza que quer trocar a Facção do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\Ability_Rogue_Disguise:25|t Change Race |cFF0000FF(Apenas p/ GM)", 0, 10, false, "Tem certeza que quer trocar a Raça do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\INV_Letter_18:25|t Change Name |cFF0000FF(Apenas p/ GM)", 0, 11, false, "Tem certeza que quer trocar o Nome do Personagem?")
		player:GossipMenuAddItem(5, " |TInterface\\icons\\INV_Misc_GroupLooking:25|t Change Appearance |cFF0000FF(Apenas p/ GM)", 0, 12, false, "Tem certeza que quer trocar a Aparencia do Personagem?")
	end
	
    player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end



function Teleporter_Event(event, player, object, sender, intid, code, menuid)

	-- Teleports Submenu
	if(intid == 1) then
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode Teleportar enquanto estiver em Combat ou em Battlegrounds.")
		else
			player:GossipSetText(string.format(" "))
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_zone_grizzlyhills_01.png:29|t |cFF0000FFTeleport para o Mall", 0, 35, false, "Tem certeza que quer ir para o Mall?")
			if (player:IsAlliance()) then
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportStormWind:29.png:27|t |cFF0000FFTeleport para Stormwind", 0, 30, false, "Tem certeza que quer ir para Stormwind?")
			elseif (player:IsHorde()) then
				player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportOrgrimmar:29|t |cFF0000FFTeleport para Orgrimmar", 0, 31, false, "Tem certeza que quer ir para Orgrimmar?")
			end
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportDalaran:29|t |cFF0000FFTeleport para Dalaran", 0, 32, false, "Tem certeza que quer ir para Dalaran?")
			player:GossipMenuAddItem(2, "|TInterface\\icons\\Spell_Arcane_TeleportShattrath:29|t |cFF0000FFTeleport para Shattrath", 0, 33, false, "Tem certeza que quer ir para Shattrath?")
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Inv_enchant_formulagood_01.png:29|t |cFF0000FFÁrea de Profissões", 1, 36, false, "Tem certeza que quer ir para a Área de Profissões?")
			--player:GossipMenuAddItem(2, "|TInterface\\icons\\Achievement_bg_masterofallbgs.png:29|t |cFF0000FFTeleport para Area Vip", 0, 34, false, "Tem certeza que quer ir para Area Vip?")
			player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)		
			player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
		end
	end
	
	if(intid == 30) then -- Teleport Stormwind  
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
		end, 1800, 1) -- tempo para o Teleport ocorrer
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
		end, 1800, 1)
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
		end, 1800, 1)
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
		end, 1800, 1)
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
		end, 1800, 1) -- tempo para o Teleport ocorrer
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
		end, 1800, 1) -- tempo para o Teleport ocorrer
	end
    if(intid == 36) then -- Teleport Area Profissao
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
				p:Teleport(0, -4014.572754, -1408.043457, 155.503952, 0.894522)
			else
				p:SendAreaTriggerMessage("Teleporte cancelado, você entrou em combate.")
			end
		end, 1800, 1)
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
		local cooldownGuildVault = 8 -- o cooldown em segundos
		local currtimeGV = os.time() -- pega a hora atual do servidor
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode sumonar o Guild Vault enquanto estiver em Combat ou em Battlegrounds.")
			return TeleporterItem_Gossip(unit, player, object)
		elseif playerArea ~= 4197 then    -- Wintergrasp
			if player:HasAura(74411) then -- Battleground - Dampening (Wintergrasp ativa apenas)
				player:SendBroadcastMessage("Você não pode summonar o Guild Vault após a Wintergrasp começar.")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		
		local lastUsedGV = player:GetData("lastGuildVault") -- get the last time the player used this submenu
		local timeLeftGV
		if lastUsedGV then
			timeLeftGV = cooldownGuildVault - (currtimeGV - lastUsedGV)
			if timeLeftGV > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o Guild Vault em "..timeLeftGV.." segundos. \n(Proteção contra Spam)") -- display remaining cooldown time
				return
			end
		end
		player:CastSpell(player, 83344, true)
		player:SendBroadcastMessage("Você sumonou um Guild Vault por 30 segundos.")
		player:SetData("lastGuildVault", currtimeGV)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O Guild Vault irá sumir em 10 segundos.")
		end, 20000, 1)
		return TeleporterItem_Gossip(unit, player, object)
	end
	if(intid == 52) then -- Summon Talent Saver
		local cooldownTalentArchivist = 5 -- o cooldown em segundos
		local currtimeTS = os.time() -- pega a hora atual do servidor
		if (player:IsInCombat() or player:GetMap():IsArena()) then
			player:SendBroadcastMessage("Você não pode summonar o Talent Archivist enquanto estiver em combate.")
			return TeleporterItem_Gossip(unit, player, object)
			
		elseif player:GetMap():IsBattleground() then
			local hasAura = player:HasAura(44521) -- Battleground Preparation (antes de abrir a porta)
			if not hasAura then
				player:SendBroadcastMessage("Você não pode summonar o Talent Archivist após a Battleground começar.")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		if player:HasAura(74411) then -- Battleground - Dampening (Wintergrasp ativa apenas)
			player:SendBroadcastMessage("Você não pode summonar o Talent Archivist após a Wintergrasp começar.")
			return TeleporterItem_Gossip(unit, player, object)
		end
		local lastUsedTS = player:GetData("lastTS") -- get the last time the player used this submenu
		local timeLeftTS
		if lastUsedTS then
			timeLeftTS = cooldownTalentArchivist - (currtimeTS - lastUsedTS)
			if timeLeftTS > 0 then 
				player:SendAreaTriggerMessage("Você poderá summonar o Talent Archivist em "..timeLeftTS.." segundos. \n(Proteção contra Spam)") -- display remaining cooldown time
				return
			end
		end
		player:CastSpell(player, 83388, true)
		player:SendBroadcastMessage("Você summonou o Talent Archivist por 30 segundos.")
		player:SetData("lastTS", currtimeTS)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O Talent Archivist irá sumir em 10 segundos.")
		end, 20000, 1)
		player:GossipComplete()	
	end


	if(intid == 5) then -- Usar Mail
        player:SendShowMailBox(player:GetGUID())
		player:GossipComplete()	
	end
	if(intid == 7) then -- Reset Talents
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode resetar os Talents enquanto estiver em Combat ou em Battlegrounds.")
			return TeleporterItem_Gossip(unit, player, object)
		else
			player:ResetTalents()
			player:RemoveSpell(43039) -- Ice Barrier
			player:SendBroadcastMessage("Seus talentos foram resetados.")	
			return TeleporterItem_Gossip(unit, player, object)
		end
	end
	if(intid == 750) then -- Mod Druid Form Customizer NPC Lua
		druidMorphHello2(event, player, object)
		--druidMorph.menu(event, player, object) -- Druid Morph OLD
	end
	if(intid == 50) then -- Weapon Enchant NPC Lua
		OpenEnchantTransmog(unit, player, object)
	end
	if(intid == 51) then -- Morph NPC Lua
		morpherMenu(event, player, object)
	end
	if(intid == 753) then -- Happiness Pet (hunter only)
		local petguid = player:GetPetGUID()
		if (petguid) then
			local pet = player:GetMap():GetWorldObject(petguid)
			if (pet) then
				pet:ToUnit()
				pet:SetPower(50000000, 4)
				player:SendAreaTriggerMessage("Your pet's happiness has been set to 100.")
			end
		end
		--player:GossipComplete()
		TeleporterItem_Gossip(unit, player, object)
	end


	
	if(intid == 6) then -- Submenu Summon Npcs
		if (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			player:SendBroadcastMessage("Você não pode sumonar Npcs enquanto estiver em Combat ou em Battlegrounds.")
			return TeleporterItem_Gossip(unit, player, object)
		end
		if player:HasAura(74411) then -- Battleground - Dampening (Wintergrasp ativa apenas)
			player:SendBroadcastMessage("Você não pode summonar npcs após a Wintergrasp começar.")
			return TeleporterItem_Gossip(unit, player, object)
		end

		player:GossipSetText(string.format("Os npcs são sumonados por 20 segundos."))
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
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	end

	local cooldown = 6          -- o cooldown em segundos
	local currtime = os.time()  -- pega a hora atual do servidor

	if(intid == 40) then -- Jeeves
	    local lastUsed = player:GetData("lastMenu41") -- get data
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)") -- display remaining cooldown time
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		player:CastSpell(player, 83394, true) -- Summon Jeeves spell
		player:SetData("lastMenu41", currtime) -- record current time as the last time this menu was used
		TeleporterItem_Gossip(unit, player, object)
		
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O Jeeves irá sumir em 10 segundos.")
		end, 10000, 1)
	end
	if(intid == 41) then -- Repair Gear
        player:DurabilityRepairAll(100,100)
	    player:SendBroadcastMessage("Seus items foram reparados.")
	    player:GossipComplete()		
	end
	if(intid == 42) then -- Npc Bank - Desativado Indefinitivamente
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local BankNPC = PerformIngameSpawn(1, 30604, mapId, 0, x, y, z, o, false, 20000, 2) -- 20.000 = duraçao
		if (BankNPC) then
			player:SetData("lastMenu41", currtime)
		    TeleporterItem_Gossip(unit, player, object)
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O NPC Banco irá sumir em 10 segundos.")
			end, 10000, 1)
		end	
	end
	if(intid == 43) then -- Npc Auction House - Desativado Indefinitivamente
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local AuctionerNPC = PerformIngameSpawn(1, 93060, mapId, 0, x, y, z, o, false, 20000, 2)
		if (AuctionerNPC) then
			player:SetData("lastMenu41", currtime)
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O Auctioneer irá sumir em 10 segundos.")
			end, 10000, 1)
			TeleporterItem_Gossip(unit, player, object)
		end	
	end
	if(intid == 44) then -- Summon Mail - DESATIVADO
        player:CastSpell(player, 83345, true)
		player:SendBroadcastMessage("Você sumonou um Mail por 30 segundos.")
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O Mail irá sumir em 10 segundos.")
			end, 20000, 1)
			TeleporterItem_Gossip(unit, player, object)
	end
	if(intid == 45) then -- Npc Join Arena		
		if (player:GetMap():IsRaid() or player:GetMap():IsDungeon()) then
			player:SendBroadcastMessage("Você não pode summonar o NPC de Joinar Arena dentro de raids ou dungeons.")
			return TeleporterItem_Gossip(unit, player, object)
		end
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local NpcArenaJoin = PerformIngameSpawn(1, 32330, mapId, 0, x, y, z, o, false, 20000, 2)
		if (NpcArenaJoin) then
			NpcArenaJoin:MoveFollow(player)
			player:SetData("lastMenu41", currtime)
			TeleporterItem_Gossip(unit, player, object)
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O npc de Joinar Arena irá sumir em 10 segundos.")
			end, 10000, 1)
		end	
	end
	if(intid == 46) then -- Npc Create Arena Team
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		player:CastSpell(player, 83396, true)
		player:SetData("lastMenu41", currtime)
		TeleporterItem_Gossip(unit, player, object)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O npc de Criar time de Arena irá sumir em 10 segundos.")
		end, 10000, 1)
	end
	if(intid == 47) then -- NPC Transmog
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		player:CastSpell(player, 83397, true)
		player:SetData("lastMenu41", currtime)
		TeleporterItem_Gossip(unit, player, object)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O npc de Transmog irá sumir em 10 segundos.")
		end, 10000, 1)
	end
	if(intid == 48) then -- Npc Weapon Enchant
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		player:CastSpell(player, 83398, true)
		player:SetData("lastMenu41", currtime)
		TeleporterItem_Gossip(unit, player, object)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O npc Transmog de Enchant irá sumir em 10 segundos.")
		end, 10000, 1)
	end
	if(intid == 49) then -- Npc Player Morpher - DESATIVADO
	    local lastUsed = player:GetData("lastMenu41")
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)")
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		player:CastSpell(player, 83399, true)
		player:SetData("lastMenu41", currtime)
		TeleporterItem_Gossip(unit, player, object)
		player:RegisterEvent(function(e, d, r, p)
			p:SendBroadcastMessage("O npc Morpher irá sumir em 10 segundos.")
		end, 10000, 1)
	end
	

	-- GM Stuff (change race, name etc)
	if (intid == 9) then -- Trocar Facção
		player:SetAtLoginFlag(64) player:SendAreaTriggerMessage("Relogue para alterar sua facção.")
		player:GossipComplete()
	elseif (intid == 10) then -- Alterar Raça
		player:SetAtLoginFlag(128) player:SendAreaTriggerMessage("Relogue para alterar sua raça.")
		player:GossipComplete()
	elseif (intid == 11) then -- Alterar Nome
		player:SetAtLoginFlag(1) player:SendAreaTriggerMessage("Relogue para alterar seu nome.")
		player:GossipComplete()
	elseif (intid == 12) then -- Alterar Aparência
		player:SetAtLoginFlag(8) player:SendAreaTriggerMessage("Relogue para alterar sua aparência.")
		player:GossipComplete()
	end

	if(intid == 499) then -- Voltar
		TeleporterItem_Gossip(unit, player, object)
	end
end	
	


RegisterItemGossipEvent(ItemEntry, 1, TeleporterItem_Gossip)
RegisterItemGossipEvent(ItemEntryEterno, 1, TeleporterItem_Gossip)
RegisterItemGossipEvent(ItemEntry, 2, Teleporter_Event)
RegisterItemGossipEvent(ItemEntryEterno, 2, Teleporter_Event)
RegisterPlayerGossipEvent(MenuId, 2, Teleporter_Event)










--[[

	if(intid == 40) then -- Jeeves
	    local lastUsed = player:GetData("lastMenu41") -- get data
		local timeLeft
		if lastUsed then
			timeLeft = cooldown - (currtime - lastUsed)
			if timeLeft > 0 then 
				player:SendAreaTriggerMessage("Você poderá sumonar o NPC em "..timeLeft.." segundos. \n(Proteção contra Spam)") -- display remaining cooldown time
				return TeleporterItem_Gossip(unit, player, object)
			end
		end
		
		local x, y, z, o = player:GetLocation()
		local mapId = player:GetMapId()
		local spawnduration = 10000
		--local Jeeves = PerformIngameSpawn(1, 35642, mapId, 2, x, y, z, o, false, spawnduration, 2) -- 2 (mapid) = da pra usar em raid(na vdd nao, talvez quando eu tinha testado dava, agr nao da mais)
		local Jeeves = PerformIngameSpawn(1, 35642, mapId, 0, x, y, z, o, false, spawnduration, 2)
		if (Jeeves) then
			--Jeeves:MoveFollow(player)
			--Jeeves:DespawnOrUnsummon(20000)
			--player:CastSpell(player, 83394, true) -- Summon Jeeves spell
			player:SetData("lastMenu41", currtime) -- record current time as the last time this menu was used
			TeleporterItem_Gossip(unit, player, object)
			
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O Jeeves irá sumir em 10 segundos.")
			end, 10000, 1)
			player:RegisterEvent(function(e, d, r, p)
				p:SendBroadcastMessage("O Jeeves irá sumir em 5 segundos.")
			end, 15000, 1) -- 15 segundos depois do início do summon
		end
	end
	
--]]



