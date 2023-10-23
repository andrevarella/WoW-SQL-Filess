--[[

local function SHIRT_OnEquip(event, player, item, bag, slot)
    local shirtSlot = player:GetEquippedItemBySlot(3)

    if (shirtSlot and shirtSlot:GetEntry() == item:GetEntry()) then
        local itemEntry = item:GetEntry()
        local query = CharDBQuery("SELECT guid, owner_guid FROM item_instance WHERE itemEntry = " .. itemEntry)
        if query then
            local itemGuid = query:GetUInt32(0)
            local ownerGuid = query:GetUInt32(1)
            local query2 = CharDBQuery("SELECT FakeEntry FROM custom_transmogrification WHERE GUID = " .. itemGuid)
            if query2 then
                local fakeEntry = query2:GetUInt32(0)
                local query3 = CharDBQuery("SELECT itemguid, humanAura, dwarfAura, nightElfAura, gnomeAura, draeneiAura, orcAura, undeadAura, taurenAura, trollAura, bloodelfAura" .. " FROM custom_transmog_collection_auras WHERE itemguid = " .. fakeEntry)
										   
			    local race = player:GetRace()
                local raceAura
                if race == 1 then
                      raceAura = query3:GetUInt32(1) -- humanAura column
					  player:RemoveAura(82029)
                elseif race == 3 then
                      raceAura = query3:GetUInt32(2) -- dwarfAura column
                elseif race == 4 then
                      raceAura = query3:GetUInt32(3) -- Night Elf column
                elseif race == 7 then
                      raceAura = query3:GetUInt32(4) -- Gnome column
                elseif race == 11 then
                      raceAura = query3:GetUInt32(5) -- Draenei column
                elseif race == 2 then
                      raceAura = query3:GetUInt32(6) -- Orc column
                elseif race == 5 then
                      raceAura = query3:GetUInt32(7) -- Undead column
                elseif race == 6 then
                      raceAura = query3:GetUInt32(8) -- Tauren column
                elseif race == 8 then
                      raceAura = query3:GetUInt32(9) -- Troll column
                elseif race == 10 then
                      raceAura = query3:GetUInt32(10) -- BELF column
                end
				
				player:AddAura(raceAura, player)  -- Adiciona a nova aura
            end
        end
    end
end

RegisterPlayerEvent(29, SHIRT_OnEquip)


--]]