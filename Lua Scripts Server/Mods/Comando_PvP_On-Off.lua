local function SavePvPState(player, state)
    local query = string.format("INSERT INTO player_pvp (guid, state) VALUES (%d, %d) ON DUPLICATE KEY UPDATE state=%d", player:GetGUIDLow(), state, state)
    CharDBQuery(query)
end

local function GetPvPState(player)
    local query = string.format("SELECT state FROM player_pvp WHERE guid = %d", player:GetGUIDLow())
    local result = CharDBQuery(query)
    if result then
        return result:GetUInt32(0)
    else
        return 0
    end
end

local function HandlePvPCommand(event, player, command)
	local playerArea = player:GetAreaId()
    if (player:GetLevel() < 80) then
	
        if not (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			if playerArea ~= 2177 then -- Battle Ring (Stranglethorn)
				if command == "pvp on" then
					player:SetPvP(true)
					player:SendBroadcastMessage("PvP Ativado. É necessário relogar.")
					SavePvPState(player, 1)
				elseif command == "pvp off" then
					player:SetSanctuary(true)
					player:SendBroadcastMessage("PvP Desativado.")
					SavePvPState(player, 0)
				end
			else
				player:SendBroadcastMessage("Você está em Combat, Battleground ou em Arena.")
			end
			
        else
            player:SendBroadcastMessage("Você está em Combat, Battleground ou em Arena.")
        end
    else
        player:SendBroadcastMessage("Você precisa estar abaixo do nível 80 para usar este comando.")
    end
    return false
end

local function DisablePvPOnMapChange(event, player, newMapId)
    local state = GetPvPState(player)
	local newArea = player:GetAreaId()
	
    if (player:GetLevel() < 80) then
        if not (player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
            if state == 1 then
                player:SetPvP(true)
            else
				if newArea ~= 2177 then -- Battle Ring (Stranglethorn)
					player:SetSanctuary(true)
				end
            end
        end
    end
end

--[[
local function DisablePvPOnLogin(event, player)
    local state = GetPvPState(player)
	local playerArea = player:GetAreaId()

    if state == 1 then
        player:SetPvP(true)
    else
		if not (player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
			if playerArea ~= 2177 then
				player:SetSanctuary(true)
			end
		end
    end
end--]]


RegisterPlayerEvent(27, DisablePvPOnMapChange)
RegisterPlayerEvent(42, HandlePvPCommand)
--RegisterPlayerEvent(3, DisablePvPOnLogin)
