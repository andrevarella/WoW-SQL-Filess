
local serverplayerguid = 503

local function countLevel80(accountID)
    local level80Chars = CharDBQuery("SELECT COUNT(*) FROM characters WHERE account = " .. accountID .. " AND level = 80")
    if level80Chars and level80Chars:GetUInt32(0) == 0 then
        return true
    else
        return false
    end
end

local function OnLevelChanged(event, player)
    local newLevel = player:GetLevel()

    if newLevel == 80 then
        local accountID = player:GetAccountId()
        if countLevel80(accountID) then
            if not player:HasItem(61000) then
                player:SendBroadcastMessage("Você recebeu o Livro VIP temporario! De uma olhada no seu mail.")
				player:SendAreaTriggerMessage("\n\n\n\nVocê recebeu o Livro VIP temporario!\nDe uma olhada no seu mail.")
                SendMail("Livro VIP Temporario", "Você recebeu o Livro VIP e riding 280% por ser o primeiro personagem de nível 80 dessa conta!\n \nO Livro e as funções vip têm algumas funções limitadas, pois serve apenas de demonstração de como funciona o sistema vip, e tem a duração de 48 horas.", player:GetGUIDLow(), serverplayerguid, 0, 0, 0, 0, 61000, 1)
			elseif not player:HasSpell(34093) then -- mount 280%
				player:LearnSpell(34093)
			end
        end
    end
end


RegisterPlayerEvent(13, OnLevelChanged)



