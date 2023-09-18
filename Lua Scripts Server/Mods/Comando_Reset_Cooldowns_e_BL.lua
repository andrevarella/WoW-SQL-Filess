-- Comando Para GMs testarem Raids - reseta o cooldown de players proximos e remove alguns debuffs

local SPELLS_TO_CAST = {48469, 53307}

local function ResetPlayerCooldowns(player)
    for _, spellID in ipairs(SPELLS_TO_CAST) do
        player:CastSpell(player, spellID, true)
    end

    player:ResetAllCooldowns()
    player:RemoveAura(57724) -- Sated
    player:RemoveAura(57723) -- Exhaustion
    player:RemoveAura(26013) -- Deserter
end

local function ResetNearbyPlayersCooldowns(player)
    local playersInRange = player:GetPlayersInRange(275)

    for _, nearbyPlayer in pairs(playersInRange) do
        ResetPlayerCooldowns(nearbyPlayer)
    end
end

local function HandleResetCommand(event, player, command)
    if player:GetGMRank() > 2 and command:lower() == "cd" then
        ResetPlayerCooldowns(player)
        ResetNearbyPlayersCooldowns(player)
        player:SendBroadcastMessage("Cooldowns resetados.")
        return false
    end
end

RegisterPlayerEvent(42, HandleResetCommand) -- Registro do evento para comandos personalizados
