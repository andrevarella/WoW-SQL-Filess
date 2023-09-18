--[[

local function OnPlayerLogin(event, player)
    -- Get player's account ID
    local accountID = player:GetAccountId()

    -- Execute SQL Query to fetch level 80 characters
    local level80Chars = CharDBQuery("SELECT COUNT(*) FROM characters WHERE account = " .. accountID .. " AND level = 80")

    if level80Chars ~= nil then
        -- Retrieve the count of level 80 characters
        local countLevel80 = level80Chars:GetUInt32(0)

        -- Calculate XP Rate with respect to the level 80 characters
        local xpRate = 1.0 + (countLevel80 * 0.5)

        -- Supposedly, change player's XP rate here
        -- Depending on your specific modules, this might be different
        player:SetXPRate(xpRate)
    end
end

RegisterPlayerEvent(3, OnPlayerLogin)
]]