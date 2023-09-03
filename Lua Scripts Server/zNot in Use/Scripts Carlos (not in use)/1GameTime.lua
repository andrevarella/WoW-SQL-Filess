local Timer = 10000 -- Tempo em milisegundos

timedRewards = { -- Não há necessidade de indexar explicitamente, pois por padrão uma tabela em lua já começa no índice 1
  49426,	-- Emblem of Frost
  47241, 	-- Emblem of Triumph
  45624,	-- Emblem of Conquest
  40752,	-- Emblem of Heroism
  40753		-- Emblem of Valor
}

local lastBonusMap = {}
 
local function Player_Onlinetime(event, delay, repeats, player)
    if not player:IsAFK() then
            player:AddItem(timedRewards[math.random(1, #timedRewards)]);
            player:ModifyMoney(1000)
		    player:CastSpell(player, 11544, false)
			lastBonusMap[player:GetGUIDLow()] = GetCurrTime()
    else   
		   player:SendBroadcastMessage("|TInterface\\icons\\Achievement_bg_winav_underxminutes:15:15:0:0|t|cffff0000 Server System |cffffff00|TInterface\\icons\\Achievement_bg_winav_underxminutes:15:15:0:0|t: |cFFFF00FF"..player:GetName().." |cffffff00você está |cffff0000AFK|cffffff00, então, sua recompensa por tempo online não será enviada, fique ativo da próxima vez, para receber sua premiação.")
	end
	if (repeats == 1) then
		player:RegisterEvent(Player_Onlinetime, Timer, 0)
	end
end	
 
local function Online(event, player)
	local lastBonus = lastBonusMap[player:GetGUIDLow()]
	if (lastBonus ~= nil) then
		local timeDiff = GetTimeDiff(lastBonus)
		if (timeDiff < Timer) then
			player:RegisterEvent(Player_Onlinetime, (Timer - timeDiff), 1)
		else
			player:RegisterEvent(Player_Onlinetime, 0, 1)
		end
	else
		player:RegisterEvent(Player_Onlinetime, Timer, 0)
	end
end

local function resetOnLogout(event, player)
	lastBonusMap[player:GetGUIDLow()] = nil
end


RegisterPlayerEvent(28, Online)
RegisterPlayerEvent(4, resetOnLogout)