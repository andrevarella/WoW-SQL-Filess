-----------------------------------------------------------------------------------|
-----------------------------|Created by Syn|-------------------------------|
-----------------------------------------------------------------------------------|
	--  Parangon Sorts {7464, 7471, 7477, 7468}







function OnDuelReset(event, player1, player2)
   -- OnDuelReset - player1
   player1:ResetAllCooldowns()                 -- Remove all cooldowns.
   player1:SetHealth(player1:GetMaxHealth())   -- Set player1 health to maximum. (100%)
   player1:RemoveAura(7464)
   player1:RemoveAura(7471)
   player1:RemoveAura(7477)
   player1:RemoveAura(7468)
   player1:SetPower(player1:GetMaxPower(), 0)  -- Set player1 mana to maximum.   (100%)
   player1:SetPower(0, 1)                      -- Set player1 rage to minimum.     (0%)
   player1:SetPower(player1:GetMaxPower(), 3)  -- Set player1 energy to maximum. (100%)

   -- OnDuelReset - player2
   player2:ResetAllCooldowns()                 -- Remove all cooldowns.
   player2:SetHealth(player2:GetMaxHealth())   -- Set player2 health to maximum. (100%)
   player2:RemoveAura(7464)
   player2:RemoveAura(7471)
   player2:RemoveAura(7477)
   player2:RemoveAura(7468)
   player2:SetPower(player2:GetMaxPower(), 0)  -- Set player2 mana to maximum.   (100%)
   player2:SetPower(0, 1)                      -- Set player2 rage to minimum.     (0%)
   player2:SetPower(player2:GetMaxPower(), 3)  -- Set player2 energy to maximum. (100%)
end


RegisterPlayerEvent(10, OnDuelReset)           -- PLAYER_EVENT_ON_DUEL_START
RegisterPlayerEvent(11, OnDuelReset)           -- PLAYER_EVENT_ON_DUEL_END