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
