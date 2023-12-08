-- funciona em kill de mob, quest, kill player e objetivos em BG (talvez com discovery de mapa tbm) - e tambem com custom rate mod x2 XP weekend em bg - nao funciona com XP de ganhar skirmish

local DEFAULT_XP_RATE = 1
local MAX_XP_BONUS = 0.3     -- 30% Bonus maximo de XP
local LVL_80_XP_BONUS = 0.15 -- 15% Bonus XP por char level 80

function countLevel80(accountID)
    local level80Chars = CharDBQuery("SELECT COUNT(*) FROM characters WHERE account = " .. accountID .. " AND level = 80")
    local countLevel80 = 0
    if level80Chars ~= nil then
        countLevel80 = level80Chars:GetUInt32(0)
    end
    return countLevel80
end

function getXpRate(player)
    local bonusEnabled = CharDBQuery("SELECT bonus_enabled FROM custom_bonusxp WHERE guid = " .. player:GetGUIDLow())

    if bonusEnabled then
        if bonusEnabled:GetUInt32(0) == 2 then
            return DEFAULT_XP_RATE
        end
    end

    local accountID = player:GetAccountId()
    local countLevel80 = countLevel80(accountID)

    local xpBonus = countLevel80 * LVL_80_XP_BONUS
    if xpBonus > MAX_XP_BONUS then
        xpBonus = MAX_XP_BONUS
    end

    return DEFAULT_XP_RATE + xpBonus
end

function xpMultiplier(event, player, amount, victim)
    if player:GetLevel() < 80 then
        local xpRate = getXpRate(player)
        amount = amount * xpRate
        return amount
    end
end


function SendXPMessage(player)
    local accountID = player:GetAccountId()
    local countLevel80 = countLevel80(accountID)
    local xpBonus = countLevel80 * LVL_80_XP_BONUS
    if xpBonus > MAX_XP_BONUS then
        xpBonus = MAX_XP_BONUS
    end
    local xpPercentage = xpBonus * 100
	player:SendBroadcastMessage("  Seu ganho de XP está sendo aumentado em |cFF00FF00" .. xpPercentage .. "%|r. \n (+" .. (LVL_80_XP_BONUS * 100) .. "% por cada personagem level 80 da sua conta, maximo de " .. (MAX_XP_BONUS * 100) .. "%).")
end

function handleXpCommand(player, state)
    local query = "REPLACE INTO custom_bonusxp (guid, bonus_enabled) VALUES (" .. player:GetGUIDLow() .. ", " .. state .. ")"
    CharDBQuery(query)
end

function HandleCommand(event, player, command)
    if command:find("xp off") then
        handleXpCommand(player, 2)
		player:SendBroadcastMessage("O bonus de XP foi desativado no seu personagem atual.")
        return false
    elseif command:find("xp on") then
        handleXpCommand(player, 1)
		player:SendBroadcastMessage("O bonus de XP foi ativado no seu personagem atual.")
        return false
    elseif command:find("xp") then
        SendXPMessage(player)
        return false
    end
    return true  
end

RegisterPlayerEvent(12, xpMultiplier)
RegisterPlayerEvent(42, HandleCommand)

--CharDBQuery("INSERT IGNORE INTO custom_bonusxp(guid, bonus_enabled) SELECT guid, 1 FROM characters")