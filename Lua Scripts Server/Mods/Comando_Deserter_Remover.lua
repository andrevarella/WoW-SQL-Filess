local function RemoveDeserterAura(event, player, command)
    -- Verifica se o comando digitado é .des
    if command:lower() == "des" then
        -- Verifica se o jogador é um GM e tem nível maior que 2
        if player:GetGMRank() > 2 then
            -- Remove a aura 26013 do jogador
            player:RemoveAura(26013)
            
            -- Verifica se há um alvo selecionado
            local target = player:GetSelection()
            if target and target:IsPlayer() then
                -- Remove a aura 26013 do alvo
                target:RemoveAura(26013)
                player:SendBroadcastMessage("Aura 26013 removida do alvo.")
            else
                player:SendBroadcastMessage("Nenhum alvo válido selecionado.")
            end
        end
    end
end

RegisterPlayerEvent(42, RemoveDeserterAura)
