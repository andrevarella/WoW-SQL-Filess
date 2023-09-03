-- Comando Para GMs testarem Raids - reseta o cooldown de players proximos e remove alguns debuffs

local SPELLS_TO_CAST = {48469, 53307} -- Lista de IDs das magias que você deseja lançar

local function ResetPlayerCooldowns(player)
    for _, spellID in ipairs(SPELLS_TO_CAST) do
        player:CastSpell(player, spellID, true) -- Lança a magia no próprio jogador
    end

    player:ResetAllCooldowns() -- Reseta todos os cooldowns do jogador
    player:RemoveAura(57724) -- Sated
    player:RemoveAura(57723) -- Exhaustion
    player:RemoveAura(26013) -- Deserter
end

local function ResetNearbyPlayersCooldowns(player)
    local playersInRange = player:GetPlayersInRange(275) -- Pega todos os jogadores em um raio de 50 jardas

    for _, nearbyPlayer in pairs(playersInRange) do
        ResetPlayerCooldowns(nearbyPlayer) -- Reseta cooldowns e auras dos jogadores próximos
    end
end

local function HandleResetCommand(event, player, command)
    if player:GetGMRank() > 2 and command:lower() == "cd" then
        ResetPlayerCooldowns(player) -- Reseta cooldowns e auras do jogador que digitou o comando
        ResetNearbyPlayersCooldowns(player) -- Reseta cooldowns e auras dos jogadores próximos
        player:SendBroadcastMessage("Cooldowns resetados.") -- Envia uma mensagem para o jogador
        return false -- Impede que a mensagem padrão de comando não encontrado seja exibida
    end
end

RegisterPlayerEvent(42, HandleResetCommand) -- Registro do evento para comandos personalizados
