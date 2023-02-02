local MSG_GEN = "#gender"
local Cost = 50000000 --This is in copper so the value that is now 5000g so 50000000c

local function SwitchGender(event, player, msg, Type, lang)
    
    
        local gmRank = player:GetGMRank()
        if (gmRank >= 0) then -- change number (0-3) 0 - to all  1,2,3 GM with rank
            if (msg:find(MSG_GEN)) then
                if player:IsInCombat() then
                    player:SendBroadcastMessage("You are in combat!")
                    return false
                else
                if player:GetCoinage() >= Cost then
                else
                    player:SendAreaTriggerMessage("You need 5000 gold")
                    return false
                end
                player:SetCoinage(player:GetCoinage() - Cost)
                player:SendAreaTriggerMessage("You feel a change.")
                player:SendAreaTriggerMessage("5000 gold been taken")

                if player:GetGender() == 0 then
                    player:SetGender(1)
                    return false
                end

                if player:GetGender() == 1 then
                    player:SetGender(0)
                    return false
                end
            end
        end
    end
end

RegisterPlayerEvent(18, SwitchGender)