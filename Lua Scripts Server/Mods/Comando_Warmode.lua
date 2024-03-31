local PLAYER_EVENT_ON_LOGOUT = 4
local pvp_states = {}

local function SavePvPState(player, state)
    local query = string.format("INSERT INTO custom_character_warmode (guid, state) VALUES (%d, %d) ON DUPLICATE KEY UPDATE state=%d", player:GetGUIDLow(), state, state)
    CharDBQuery(query)
end

local function GetPvPState(player)
    local query = string.format("SELECT state FROM custom_character_warmode WHERE guid = %d", player:GetGUIDLow())
    local result = CharDBQuery(query)
    if result then
        return result:GetUInt32(0)
    else
        return 1
    end
end

local function GetPvPStatus(player)
    local state = GetPvPState(player)
    local status = state == 1 and "Ativado" or "Desativado"
    return status
end

-- Ativa o module após deslogar (apos digitar o comando)
local function HandleLogoutEvent(event, player)
    if pvp_states[player:GetGUIDLow()] then
        SavePvPState(player, pvp_states[player:GetGUIDLow()])
    end
end

local function HandlePvPCommand(event, player, command)

    local playerArea = player:GetAreaId()
    if (player:GetLevel() < 80) then
        if not (player:IsInCombat() or player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
		
			-- 2177 = Gurubashi. add Wintergrasp, Nagrand Arena, Blade Edge Arena. (Talvez algumas zonas especificas, tipo em Hellfire zona PvP, etc)
            if playerArea ~= 2177 then
                if command == "pvp on" or command == "warmode on" then
                    pvp_states[player:GetGUIDLow()] = 1
                    player:SendBroadcastMessage("O War Mode será Ativado após relogar.")
					
                elseif command == "pvp off" or command == "warmode off" then
                    pvp_states[player:GetGUIDLow()] = 0
                    player:SendBroadcastMessage("O War Mode será Desativado após relogar.")
					
                elseif command == "pvp" or command == "warmode" then
                    local status = GetPvPStatus(player)
                    player:SendBroadcastMessage("O War Mode está " .. status)
                end
            else
                player:SendBroadcastMessage("Você está em Combat, Battleground ou Arena.")
            end
			
        else
            player:SendBroadcastMessage("Você está em Combat, Battleground ou Arena.")
        end
		
    elseif command == "pvp on" or command == "pvp off" or command == "warmode" or command == "warmode off" or command == "warmode on" then
        player:SendBroadcastMessage("Você precisa estar abaixo do nível 80 para usar este comando.")
    end
    return false
end


-- Ativado OnLogin e OnUpdateZone
local function ApplyPvPState(event, player)
    local state = GetPvPState(player)
    local playerArea = player:GetAreaId()
    
    if (player:GetLevel() < 80) then
	
		-- PvP ativado
        if state == 1 then
            player:SetPvP(true)
            player:AddAura(83389, player)
			
		-- PvP desativado
        elseif state == 0 then
            player:RemoveAura(83389)
            if not (player:GetMap():IsArena() or player:GetMap():IsBattleground()) then
				-- Gurubashi eu acho
                if playerArea ~= 2177 then
                    player:SetSanctuary(true)
                end
            end
        end

    end
end

-- remove enlisted buff after getting level 80
local function OnLevelChanged(event, player, oldLevel, newLevel)
	local newLevel = player:GetLevel()
	local state = GetPvPState(player)
	
    if newLevel == 80 then
        player:RemoveAura(83389) -- Remove Enlisted
		
		if state == 0 then
			player:SetPvP(true)
			player:SendBroadcastMessage("Seu PvP agora está on. \nA desativação do Warmode só funciona para players abaixo do level 80.")
		end
	end
end

--     local query = string.format("INSERT INTO custom_character_warmode (guid, state) VALUES (%d, %d) ON DUPLICATE KEY UPDATE state=%d", player:GetGUIDLow(), state, state)
--    CharDBQuery(query)

-- add Warmode +10% XP Buff on char create
local function OnFirstLogin(event, player)
	player:AddAura(83389, player)
end


RegisterPlayerEvent(27, ApplyPvPState) -- OnUpdateZone
RegisterPlayerEvent(42, HandlePvPCommand)
RegisterPlayerEvent(3, ApplyPvPState)  -- OnLogin
RegisterPlayerEvent(PLAYER_EVENT_ON_LOGOUT, HandleLogoutEvent)
RegisterPlayerEvent(13, OnLevelChanged)
RegisterPlayerEvent(30, OnFirstLogin)