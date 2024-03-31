
local serverplayerguid = 503

local function countLevel80(accountID)
    local level80Chars = CharDBQuery("SELECT COUNT(*) FROM characters WHERE account = " .. accountID .. " AND level = 80")
    if level80Chars and level80Chars:GetUInt32(0) == 0 then
        return true
    else
        return false
    end
end

local function delayedRewardOnLevelUp(player)
    local accountID = player:GetAccountId()
	
    if countLevel80(accountID) then
        if not player:HasItem(61000) then
            player:SendBroadcastMessage("Você recebeu o Livro VIP temporário! Dê uma olhada no seu mail.")
            player:SendAreaTriggerMessage("\n\n\n\nVocê recebeu o Livro VIP temporário!\nDê uma olhada no seu mail.")
            SendMail("Livro VIP Temporário", "Você recebeu o Livro VIP e riding 280% por ser o primeiro personagem de nível 80 dessa conta!\n \nO Livro e as funções vip têm algumas funções limitadas, pois servem apenas de demonstração de como funciona o sistema VIP, e têm a duração de 48 horas.", player:GetGUIDLow(), serverplayerguid, 0, 0, 0, 0, 61000, 1)
        elseif not player:HasSpell(34093) then -- mount 280%
            player:LearnSpell(34093)
        end
    end
end

local function OnLevelChanged(event, player)
    local newLevel = player:GetLevel()

    if newLevel == 80 then
        local playerGUID = player:GetGUIDLow() -- Obtendo o GUID do jogador
        CreateLuaEvent(function() 
            local updatedPlayer = GetPlayerByGUID(playerGUID) -- Recuperando o objeto do jogador atualizado
            if updatedPlayer then -- Verificando se o jogador ainda existe
                delayedRewardOnLevelUp(updatedPlayer) -- Chamando a função delayedRewardOnLevelUp com o jogador atualizado
            end
        end, 4000, 1)
    end
end

RegisterPlayerEvent(13, OnLevelChanged)




--[[

outro lua que faz a mesma coisa:

local function countLevel80(accountID)
    local level80Chars = CharDBQuery("SELECT COUNT(*) FROM characters WHERE account = " .. accountID .. " AND level = 80")
    if level80Chars and level80Chars:GetUInt32(0) == 0 then
        return true
    else
        return false
    end
end

local function EnviarItemViaCorreio(player, itemID, quantidade)
    local senderGUID = "1" -- Substitua pelo GUID do remetente
    local recipientName = player:GetName()
    local recipientGUID = player:GetGUID()

    local subject = "Assunto do Email test"
    local message = "Mensagem do Email test"

    local senderItem = CreateItem(itemID, quantidade, 0)

    player:SendMail(subject, message, senderGUID, senderItem, recipientName, recipientGUID)
end

-- ao upar para o 0, vai procurar na acc se tem outro char 80, se nao tiver, manda livro VIP pelo mail
local function OnLevelChanged(event, player)
    local newLevel = player:GetLevel()

    if newLevel == 80 then
        local accountID = player:GetAccountId()
        if countLevel80(accountID) then
            if not player:HasItem(83550) then
                player:AddItem(83550, 1)
                player:SendBroadcastMessage("Você recebeu o Livro VIP por ser o primeiro personagem de nível 80 nesta conta!\n \nO Livro e as funções vip têm algumas funções limitadas, pois serve apenas de demonstração de como funciona o sistema vip, e tem a duração de 48 horas.")

                -- Agora vamos enviar o item 83550 via correio
                EnviarItemViaCorreio(player, 83550, 1) -- Substitua pelo ID do item que você deseja enviar
            end
        end
    end
end

RegisterPlayerEvent(13, OnLevelChanged)



SendMail("Outbided", string.format("You have been outbid on %s. \nHere's your gold.", itemname), playerguid, BlackMarketPlayerGuid, 0, 0, currentbidprice * 10000, 0, 9311, 1)


--]]
