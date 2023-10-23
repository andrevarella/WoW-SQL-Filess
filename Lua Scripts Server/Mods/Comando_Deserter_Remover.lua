local function RemoveDeserterAura(event, player, command)

    if command:lower() == "des" then
        if player:GetGMRank() > 2 then
            player:RemoveAura(26013)
            
            local target = player:GetSelection()
            if target and target:IsPlayer() then
                target:RemoveAura(26013)
                player:SendBroadcastMessage("Aura 26013 removida do alvo.")
            else
                player:SendBroadcastMessage("Nenhum alvo válido selecionado.")
            end
        end
    end
end

RegisterPlayerEvent(42, RemoveDeserterAura)
