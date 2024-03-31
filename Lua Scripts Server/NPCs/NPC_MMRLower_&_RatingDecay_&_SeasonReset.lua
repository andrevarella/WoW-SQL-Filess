local UnitEntry = 93079

--local PeriodicUpdateArenaLog = 7000
local PeriodicUpdateArenaLog = 18000000 -- 5 Horas


local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(9," Diminuir MMR de 2v2 ",0, 1)
	player:GossipMenuAddItem(9," Diminuir MMR de 3v3 ",0, 2)
	player:GossipMenuAddItem(9," Diminuir MMR de 5v5 ",0, 3)
    player:GossipMenuAddItem(9," Diminuir MMR de 1v1 ",0, 4)
	if player:GetGMRank() > 2 then
		player:GossipMenuAddItem(9, " Season Reset", 0, 5, true, "Digite a Senha") -- senha = SeasonReset
		player:GossipMenuAddItem(9, " Rating Decay", 0, 6, true, "Digite a Senha") -- senha = RatingDecay
		player:GossipMenuAddItem(9, " Arena Log", 0, 7, true, "Digite a Senha") -- senha = ArenaLog
		player:GossipMenuAddItem(9," Rating Decay WIP (falta personal e MMR)",0, 8)
	end
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
		
	-- Diminuir MMR de 2v2 (+3v3/5v5/1v1)
	if intid == 1 then   
        local guid = player:GetGUIDLow() -- Obtém o GUID do jogador
        local mmr = CharDBQuery("SELECT matchMakerRating FROM character_arena_stats WHERE guid = " .. guid .. " AND slot = 2;")
        
        if mmr then
            local currentMMR = mmr:GetUInt32(0)
            if currentMMR > 1700 then
                local query = CharDBQuery("UPDATE character_arena_stats SET matchMakerRating = matchMakerRating - 200 WHERE guid = " .. guid .. " AND slot = 2;")
                if query then
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                else
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!") -- era Erro ao diminuir o MMR. mas dá isso mesmo se diminuir
					player:GossipComplete()	
                end
            else
                player:SendBroadcastMessage("Seu MMR é menor ou igual a 1700, não é possível diminuir.")
				player:GossipComplete()	
            end
        else
            player:SendBroadcastMessage("Erro ao obter o MMR.")
			player:GossipComplete()	
        end
	
	-- Diminuir MMR de 3v3
	elseif intid == 2 then   
        local guid = player:GetGUIDLow()
        local mmr = CharDBQuery("SELECT matchMakerRating FROM character_arena_stats WHERE guid = " .. guid .. " AND slot = 3;")
        
        if mmr then
            local currentMMR = mmr:GetUInt32(0)
            if currentMMR > 1700 then
                local query = CharDBQuery("UPDATE character_arena_stats SET matchMakerRating = matchMakerRating - 200 WHERE guid = " .. guid .. " AND slot = 3;")
                if query then
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                else
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                end
            else
                player:SendBroadcastMessage("Seu MMR é menor ou igual a 1700, não é possível diminuir.")
				player:GossipComplete()	
            end
        else
            player:SendBroadcastMessage("Erro ao obter o MMR.")
			player:GossipComplete()	
        end
	
	-- Diminuir MMR de 5v5
	elseif intid == 3 then   
        local guid = player:GetGUIDLow()
        local mmr = CharDBQuery("SELECT matchMakerRating FROM character_arena_stats WHERE guid = " .. guid .. " AND slot = 5;")
        
        if mmr then
            local currentMMR = mmr:GetUInt32(0)
            if currentMMR > 1700 then
                local query = CharDBQuery("UPDATE character_arena_stats SET matchMakerRating = matchMakerRating - 200 WHERE guid = " .. guid .. " AND slot = 5;")
                if query then
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                else
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                end
            else
                player:SendBroadcastMessage("Seu MMR é menor ou igual a 1700, não é possível diminuir.")
				player:GossipComplete()	
            end
        else
            player:SendBroadcastMessage("Erro ao obter o MMR.")
			player:GossipComplete()	
        end
	
	-- Diminuir MMR de 1v1
	elseif intid == 4 then   
        local guid = player:GetGUIDLow()
        local mmr = CharDBQuery("SELECT matchMakerRating FROM character_arena_stats WHERE guid = " .. guid .. " AND slot = 1;")
        
        if mmr then
            local currentMMR = mmr:GetUInt32(0)
            if currentMMR > 1700 then
                local query = CharDBQuery("UPDATE character_arena_stats SET matchMakerRating = matchMakerRating - 200 WHERE guid = " .. guid .. " AND slot = 1;")
                if query then
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                else
                    player:SendBroadcastMessage("MMR diminuído em 200 pontos!")
					player:GossipComplete()	
                end
            else
                player:SendBroadcastMessage("Seu MMR é menor ou igual a 1700, não é possível diminuir.")
				player:GossipComplete()	
            end
        else
            player:SendBroadcastMessage("Erro ao obter o MMR")
			player:GossipComplete()	
        end
    end
	
	-- Season Reset
	if (intid == 5) then
		local senha = code
		if senha == "SeasonReset" then
			local arenaStats = CharDBExecute("UPDATE character_arena_stats SET matchMakerRating = 1500, maxMMR = 1500;")
			local arenaTeam = CharDBExecute("UPDATE arena_team SET rating = 1000, seasonGames = 0, seasonWins = 0, weekGames = 0, weekWins = 0, rank = 0;")
			local arenaTeamMember = CharDBExecute("UPDATE arena_team_member SET weekGames = 0, weekWins = 0, seasonGames = 0, seasonWins = 0, personalRating = 1000;")
			local LogArenaFights = CharDBExecute("DELETE FROM log_arena_fights;")
			local LogArenaMemberstat = CharDBExecute("DELETE FROM log_arena_memberstats;")
			--local ArenaLog = CharDBExecute("DELETE FROM custom_arena_log;")
    
			if arenaStats and arenaTeam and arenaTeamMember and LogArenaFights and LogArenaMemberstat then
				player:SendBroadcastMessage("MMR, Rating e Games de todos os jogadores resetados para o Default.")
			else
				player:SendBroadcastMessage("MMR, Rating e Games de todos os jogadores resetados para o Default.") -- era "Erro ao alterar o MMR", mas dá o erro mesmo ao Resetar o MMR
			end
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Senha Errada")
			player:GossipComplete()
		end
	end
	
	-- Arena Decay
	if (intid == 6) then
		local senha = code
		if senha == "RatingDecay" then
			
		else
			player:SendBroadcastMessage("Senha Errada")
			player:GossipComplete()
		end
	end
	
	-- Arena Log - Soma colunas de 4 tabelas (log_arena_memberstats, Log_Arena_Fights, arena_team_member, character_arena_stats)
	if (intid == 7) then
		local senha = code	
		if senha == "ArenaLog" then
		
			local query = 
			[[
				SELECT
					log_arena_memberstats.member_id AS posmatch,
					log_arena_memberstats.name AS playername,
					log_arena_memberstats.guid AS playerguid,
					log_arena_memberstats.team AS resultado,
					log_arena_memberstats.account,
					log_arena_memberstats.ip,
					log_arena_memberstats.damage,
					log_arena_memberstats.heal,
					log_arena_memberstats.kblows,
					log_arena_fights.fight_id,
					log_arena_fights.time AS date,
					log_arena_fights.duration,
					log_arena_fights.winner AS teamwinnerID,
					log_arena_fights.loser AS teamloserID,
					CONCAT(log_arena_fights.winner_tr, ' (+', log_arena_fights.winner_tr_change, ')') AS teamwinner,
					CONCAT(log_arena_fights.loser_tr, ' (', log_arena_fights.loser_tr_change, ')') AS teamloser,

					log_arena_fights.type AS arenatype,
					IFNULL(at_member.personalRating, 0) AS personalRating,
					IFNULL(character_arena_stats.matchMakerRating, 0) AS personalMMR
				FROM
					log_arena_memberstats
				JOIN
					log_arena_fights ON log_arena_memberstats.fight_id = log_arena_fights.fight_id
				LEFT JOIN
					arena_team_member at_member ON log_arena_memberstats.guid = at_member.guid
				LEFT JOIN
					character_arena_stats ON log_arena_memberstats.guid = character_arena_stats.guid AND (character_arena_stats.slot+2) = log_arena_fights.type 
			]]

			local result = CharDBQuery(query)
			if result then
				repeat
					local posmatch = result:GetUInt32(0)
					local playername = result:GetString(1)
					local playerguid = result:GetUInt32(2)
					local resultado = result:GetUInt32(3) 
					local account = result:GetUInt32(4)
					local IP = result:GetString(5)
					local damage = result:GetUInt32(6)
					local heal = result:GetUInt32(7)
					local kblows = result:GetUInt32(8)
					local fight_id = result:GetUInt32(9)
					local date = result:GetString(10)
					local duration = result:GetUInt32(11)
					local teamwinnerID = result:GetUInt32(12)
					local teamloserID = result:GetUInt32(13)
					local teamwinner = result:GetString(14)
					local teamloser = result:GetString(15)

					local arenatype = result:GetUInt32(16)
					local personalRating = result:GetUInt32(17)
					local personalMMR = result:GetFloat(18)
						
					local resultado_texto = ""  -- Inicialize a variável resultado_texto como uma string vazia
					if resultado == teamwinnerID then
						resultado_texto = "Won"
					elseif resultado == teamloserID then
						resultado_texto = "Lost"
					end
					
					local arenatype_text = ""
					if arenatype == 5 then               -- 3v3 SoloQueue (Slot do 5v5)
						arenatype_text = "3v3 Solo Queue"
					else
						arenatype_text = arenatype .. "v" .. arenatype
					end

					local insert_query = string.format
					(
						[[INSERT IGNORE INTO custom_arena_log 
						(fight_id, account, IP, date, arenatype, duration, playername, playerguid, resultado, teamwinnerID, teamloserID, teamwinner, teamloser, personalRating, personalMMR, damage, heal, kblows, posmatch)
						VALUES
						(%d,      '%d',    '%s','%s',    '%s',      %d,       '%s',        %d,        '%s',         %d,           %d,        '%s',       '%s',         %d,            %d,       %d,    %d,    %d,      %d)]],
						fight_id, account, IP, date, arenatype_text, duration, playername, playerguid, resultado_texto, teamwinnerID, teamloserID, teamwinner, teamloser, personalRating, personalMMR, damage, heal, kblows, posmatch)
						
					CharDBQuery(insert_query)
				until not result:NextRow()
				print("Arena Log: Novos registros adicionados.")
			else 
				print("Arena Log: Não foram encontrados registros na consulta.")
			end
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Senha Errada")
			player:GossipComplete()
		end

		-- utilizando as tabelas 4 tabelas: 
		-- log_arena_memberstats  (fight_id, account, guid, playerName, teamID, IP, member_id, damage, heal, kblows)                         [faltou nada acho]
		-- Log_Arena_Fights       (data, duration, type, teamWinnerID, teamloserID, winner_tr, loser_tr, winner_tr_change, loser_tr_change)  [faltou winner_mmr, loser_mmr, currOnline]
		-- arena_team_member      (personalRating)                                                                                           [faltou weekGames, weekWins, seasonGames, seasonWins]
		-- character_arena_stats  (matchMakerRating)                                                                                         [faltou maxMMR] 
	end
	
	
	if (intid == 8) then
		local currentTime = os.time() -- Pega o horário atual do servidor
		local twoDaysSeconds = 2 * 24 * 60 * 60 -- Representa dois dias em segundos

		local querySelect = 
		[[
			SELECT DISTINCT teamwinnerID, teamloserID, MAX(date) AS lastMatchDate
			FROM custom_arena_log
			WHERE (teamwinner LIKE '%(+%' AND CAST(SUBSTRING_INDEX(teamwinner, ' ', 1) AS UNSIGNED) >= 2000)
			OR (teamloser LIKE '%(+%' AND CAST(SUBSTRING_INDEX(teamloser, ' ', 1) AS UNSIGNED) >= 2000)
			GROUP BY teamwinnerID, teamloserID
		]]

		local resultSelect = CharDBQuery(querySelect)
		if resultSelect then
			repeat
				local teamwinnerID = resultSelect:GetUInt32(0)
				local teamloserID = resultSelect:GetUInt32(1)
				local lastMatchDateStr = resultSelect:GetString(2)

				-- Converter a última data da partida para um timestamp
				local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
				local year, month, day, hour, min, sec = lastMatchDateStr:match(pattern)
				local lastMatchTime = os.time({year=year, month=month, day=day, hour=hour, min=min, sec=sec})

				-- Verificar se desde a última partida passaram mais de 2 dias
				if (currentTime - lastMatchTime) > twoDaysSeconds then
					local updateQueryTemplate = 
					[[
						UPDATE arena_team SET rating = rating * 0.9 WHERE arenaTeamId = %d
					]]

					CharDBQuery(string.format(updateQueryTemplate, teamwinnerID))
					CharDBQuery(string.format(updateQueryTemplate, teamloserID))
				end
			until not resultSelect:NextRow()
			print("Arena Decay: Ratings ajustados para equipes inativas.")
		else
			print("Arena Decay: Não foram encontradas equipes para ajuste.")
		end
		player:GossipComplete()
	end




	--[[
	DECAY ideas:
	
	.incluir decay nos integranets dos times (incluindo personal e mmr), talvez apenas se o player tiver perto da rating do time?
	
	. Apos rodar o script (diminuir rating da galera), então deleta todos os entries? ou só os afetados? ou nenhum dos 2?
	
	. Só 1 jogo a cada ~14 dias é suficiente pra nao contar o Decay? talvez tem q jogar pelo menos 5~10 jogos?

	.Se pa eh melhor rodar o script manualmente antes de dar restart ? 
	
	. module decay arena rating se ficar X dias sem fazer arena (1~2 vez por mes ?) - apenas para os tops X / top 50 ou algo assim 

	. 3. Quantos games tem que jogar na semana ou cada 2 dias p nao tomar Decay?
	
	--]]



	
	
	
	if intid == 88 then
        if Data_Fim_da_Season then
            -- Faça o que quiser com a data do evento aqui
            player:SendBroadcastMessage("O dia do Season Reset é: " .. os.date("%d/%m/%Y", Data_Fim_da_Season))
        else
			player:SendBroadcastMessage("O dia do Season Reset não está definido.")
        end
        player:GossipComplete()
	end

	

end	   


-- Cria novos rows na tabela Custom de Log de Arena
function HandleArenaLogQuery(eventid, delay, repeats)

	local query = 
	[[
		SELECT
			log_arena_memberstats.member_id AS posmatch,
			log_arena_memberstats.name AS playername,
			log_arena_memberstats.guid AS playerguid,
			log_arena_memberstats.team AS resultado,
			log_arena_memberstats.account,
			log_arena_memberstats.ip,
			log_arena_memberstats.damage,
			log_arena_memberstats.heal,
			log_arena_memberstats.kblows,
			log_arena_fights.fight_id,
			log_arena_fights.time AS date,
			log_arena_fights.duration,
			log_arena_fights.winner AS teamwinnerID,
			log_arena_fights.loser AS teamloserID,
			CONCAT(log_arena_fights.winner_tr, ' (+', log_arena_fights.winner_tr_change, ')') AS teamwinner,
			CONCAT(log_arena_fights.loser_tr, ' (', log_arena_fights.loser_tr_change, ')') AS teamloser,

			log_arena_fights.type AS arenatype,
			IFNULL(at_member.personalRating, 0) AS personalRating,
			IFNULL(character_arena_stats.matchMakerRating, 0) AS personalMMR
		FROM
			log_arena_memberstats
		JOIN
			log_arena_fights ON log_arena_memberstats.fight_id = log_arena_fights.fight_id
		LEFT JOIN
			arena_team_member at_member ON log_arena_memberstats.guid = at_member.guid
		LEFT JOIN
			character_arena_stats ON log_arena_memberstats.guid = character_arena_stats.guid AND (character_arena_stats.slot+2) = log_arena_fights.type 
	]]

	local result = CharDBQuery(query)
	if result then
		repeat
			local posmatch = result:GetUInt32(0)
			local playername = result:GetString(1)
			local playerguid = result:GetUInt32(2)
			local resultado = result:GetUInt32(3) 
			local account = result:GetUInt32(4)
			local IP = result:GetString(5)
			local damage = result:GetUInt32(6)
			local heal = result:GetUInt32(7)
			local kblows = result:GetUInt32(8)
			local fight_id = result:GetUInt32(9)
			local date = result:GetString(10)
			local duration = result:GetUInt32(11)
			local teamwinnerID = result:GetUInt32(12)
			local teamloserID = result:GetUInt32(13)
			local teamwinner = result:GetString(14)
			local teamloser = result:GetString(15)

			local arenatype = result:GetUInt32(16)
			local personalRating = result:GetUInt32(17)
			local personalMMR = result:GetFloat(18)
				
			local resultado_texto = ""  -- Inicialize a variável resultado_texto como uma string vazia
			if resultado == teamwinnerID then
				resultado_texto = "Won"
			elseif resultado == teamloserID then
				resultado_texto = "Lost"
			end
			
			local arenatype_text = ""
			if arenatype == 5 then               -- 3v3 SoloQueue (Slot do 5v5)
				arenatype_text = "3v3 Solo Queue"
			else
				arenatype_text = arenatype .. "v" .. arenatype
			end

			local insert_query = string.format
			(
				[[INSERT IGNORE INTO custom_arena_log 
				(fight_id, account, IP, date, arenatype, duration, playername, playerguid, resultado, teamwinnerID, teamloserID, teamwinner, teamloser, personalRating, personalMMR, damage, heal, kblows, posmatch)
				VALUES
				(%d,      '%d',    '%s','%s',    '%s',      %d,       '%s',        %d,        '%s',         %d,           %d,        '%s',       '%s',         %d,            %d,       %d,    %d,    %d,      %d)]],
				fight_id, account, IP, date, arenatype_text, duration, playername, playerguid, resultado_texto, teamwinnerID, teamloserID, teamwinner, teamloser, personalRating, personalMMR, damage, heal, kblows, posmatch)
			CharDBQuery(insert_query)
		until not result:NextRow()
		print("Arena Log: Novos registros adicionados.")
	else 
		print("Arena Log: Não foram encontrados registros na consulta.")
	end
end



RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)
CreateLuaEvent(HandleArenaLogQuery, PeriodicUpdateArenaLog, 0)










--[[
	--player:GossipMenuAddItem(9, " Teste", 0, 99876, true) -- aparece o code gossip para digitar
	
	-- Teste - gossip com Senha
	if (intid == 99876) then
		local text = code
		if text == "Teste" then
			player:CastSpell(player, 47436, true)
			player:GossipComplete()	
		else
			player:SendBroadcastMessage("Senha Errada")
			player:GossipComplete()
		end
	end

--]]