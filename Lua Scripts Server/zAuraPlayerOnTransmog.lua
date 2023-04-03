
-- Tabela de correspondência entre FakeEntry e Aura
local FakeEntryToAura = {
    [70002] = 82011,
    [70003] = 82001,
    [70004] = 82002,
    [70005] = 82003
}

local function GetTransmogAura(player)
    -- Substitua 'my_database' pelo nome da sua database
    local query = string.format("SELECT `FakeEntry` FROM `custom_transmogrification` WHERE `Owner` = %d", player:GetGUIDLow())

    local result = CharDBQuery(query)
    if result then
        local fakeEntry = result:GetUInt32(0)
        return FakeEntryToAura[fakeEntry]
    end

    return nil
end

local function OnLogin(event, player)
    local auraId = GetTransmogAura(player)
    if auraId then
        player:AddAura(auraId, player)
    end
end

RegisterPlayerEvent(3, OnLogin)
