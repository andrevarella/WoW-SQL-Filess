--[[

local function SHIRT_OnEquip(event, player, item, bag, slot)

    local shirtSlot = player:GetEquippedItemBySlot(3)
	
    if (shirtSlot and shirtSlot:GetEntry() == item:GetEntry()) then
        local itemEntry = item:GetEntry() -- usa o itemEntry de item_instance (entry do item_template)
        local query = CharDBQuery("SELECT guid, owner_guid FROM item_instance WHERE itemEntry = " .. itemEntry)
        if query then
            local itemGuid = query:GetUInt32(0)
            local ownerGuid = query:GetUInt32(1)
            query = CharDBQuery("SELECT FakeEntry FROM custom_transmogrification WHERE GUID = " .. itemGuid)
            if query then
                local fakeEntry = query:GetUInt32(0)
                query = WorldDBQuery("SELECT spellid_1 FROM item_template WHERE entry = " .. fakeEntry)
                if query then
                    local spellid1 = query:GetUInt32(0)
                    player:AddAura(spellid1, player)
                end
            end
        end
    end
end

RegisterPlayerEvent(29, SHIRT_OnEquip)


--]]

-- 0 =
-- 1 =
-- 2 =
-- 3 = Shirt
-- 4 =
-- 5 = belt

-- player:SendBroadcastMessage("Teste sucedido")

