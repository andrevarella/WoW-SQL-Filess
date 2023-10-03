local UnitEntry = 93079

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(5,"Diminuir MMR de 2v2 ",0, 1)
	player:GossipMenuAddItem(5,"Diminuir MMR de 3v3 ",0, 2)
	player:GossipMenuAddItem(5,"Diminuir MMR de 5v5 ",0, 3)
    player:GossipMenuAddItem(5,"Diminuir MMR de 1v1 ",0, 4)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
	
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
    end
	
	if intid == 2 then   
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
    end
	
	if intid == 3 then   
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
    end
	
	if intid == 4 then   
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
   
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)
