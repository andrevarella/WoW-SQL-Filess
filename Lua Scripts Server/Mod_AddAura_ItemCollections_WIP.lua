
--[[

local function SHIRT_OnEquip(event, player, item, bag, slot)

	 -- Shirt - Remove todas auras da tabela de acordo com a Raça (se for human, ao equipar uma Shirt remove todas as auras da coluna humanAura)
     if slot == 3 then
        local race = player:GetRace()
        local raceAurasQuery = CharDBQuery("SELECT humanAura, dwarfAura, nightElfAura, gnomeAura, draeneiAura, orcAura, undeadAura, taurenAura, trollAura, bloodelfAura FROM custom_transmog_collection_auras")
        if raceAurasQuery then
            for i = 0, raceAurasQuery:GetRowCount() - 1 do
                local humanAura = raceAurasQuery:GetUInt32(0)
                local dwarfAura = raceAurasQuery:GetUInt32(1)
                local nightElfAura = raceAurasQuery:GetUInt32(2)
                local gnomeAura = raceAurasQuery:GetUInt32(3)
                local draeneiAura = raceAurasQuery:GetUInt32(4)
                local orcAura = raceAurasQuery:GetUInt32(5)
                local undeadAura = raceAurasQuery:GetUInt32(6)
                local taurenAura = raceAurasQuery:GetUInt32(7)
                local trollAura = raceAurasQuery:GetUInt32(8)
                local bloodelfAura = raceAurasQuery:GetUInt32(9)
                
                local auraToRemove = nil
                if race == 1 then
                    auraToRemove = humanAura
                elseif race == 3 then
                    auraToRemove = dwarfAura
                elseif race == 4 then
                    auraToRemove = nightElfAura
                elseif race == 7 then
                    auraToRemove = gnomeAura
                elseif race == 11 then
                    auraToRemove = draeneiAura
                elseif race == 2 then
                    auraToRemove = orcAura
                elseif race == 5 then
                    auraToRemove = undeadAura
                elseif race == 6 then
                    auraToRemove = taurenAura
                elseif race == 8 then
                    auraToRemove = trollAura
                elseif race == 10 then
                    auraToRemove = bloodelfAura
                end
                
                if auraToRemove then
                    player:RemoveAura(auraToRemove, player)
                end
                
                raceAurasQuery:NextRow()
            end
        end
    end

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
                      raceAura = query3:GetUInt32(1)  -- humanAura column
                elseif race == 3 then
                      raceAura = query3:GetUInt32(2)  -- dwarfAura column
                elseif race == 4 then
                      raceAura = query3:GetUInt32(3)  -- Night Elf column
                elseif race == 7 then
                      raceAura = query3:GetUInt32(4)  -- Gnome column
                elseif race == 11 then
                      raceAura = query3:GetUInt32(5)  -- Draenei column
                elseif race == 2 then
                      raceAura = query3:GetUInt32(6)  -- Orc column
                elseif race == 5 then
                      raceAura = query3:GetUInt32(7)  -- Undead column
                elseif race == 6 then
                      raceAura = query3:GetUInt32(8)  -- Tauren column
                elseif race == 8 then
                      raceAura = query3:GetUInt32(9)  -- Troll column
                elseif race == 10 then
                      raceAura = query3:GetUInt32(10) -- BELF column
                end
				player:AddAura(raceAura, player)
            end
        end
    end
end


local function SHIRT_OnUnEquip(event, player, item, slot)
	if slot == 3 then
        local race = player:GetRace()
        local raceAurasQuery = CharDBQuery("SELECT humanAura, dwarfAura, nightElfAura, gnomeAura, draeneiAura, orcAura, undeadAura, taurenAura, trollAura, bloodelfAura FROM custom_transmog_collection_auras")
        if raceAurasQuery then
            for i = 0, raceAurasQuery:GetRowCount() - 1 do
                local humanAura = raceAurasQuery:GetUInt32(0)
                local dwarfAura = raceAurasQuery:GetUInt32(1)
                local nightElfAura = raceAurasQuery:GetUInt32(2)
                local gnomeAura = raceAurasQuery:GetUInt32(3)
                local draeneiAura = raceAurasQuery:GetUInt32(4)
                local orcAura = raceAurasQuery:GetUInt32(5)
                local undeadAura = raceAurasQuery:GetUInt32(6)
                local taurenAura = raceAurasQuery:GetUInt32(7)
                local trollAura = raceAurasQuery:GetUInt32(8)
                local bloodelfAura = raceAurasQuery:GetUInt32(9)
                
                local auraToRemove = nil
                if race == 1 then
                    auraToRemove = humanAura
                elseif race == 3 then
                    auraToRemove = dwarfAura
                elseif race == 4 then
                    auraToRemove = nightElfAura
                elseif race == 7 then
                    auraToRemove = gnomeAura
                elseif race == 11 then
                    auraToRemove = draeneiAura
                elseif race == 2 then
                    auraToRemove = orcAura
                elseif race == 5 then
                    auraToRemove = undeadAura
                elseif race == 6 then
                    auraToRemove = taurenAura
                elseif race == 8 then
                    auraToRemove = trollAura
                elseif race == 10 then
                    auraToRemove = bloodelfAura
                end
                
                if auraToRemove then
                    player:RemoveAura(auraToRemove, player)
                end
                
                raceAurasQuery:NextRow()
            end
        end
    end
end

--RegisterPlayerEvent(29, SHIRT_OnEquip)
--RegisterPlayerEvent(58, SHIRT_OnUnEquip)






--]]









-- Old Script (outro arquivo):


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
-- 6 = chest?
-- 8 = ?
-- 9 = ?
-- 1

-- player:SendBroadcastMessage("Teste sucedido")




--[[

TO DO:

1. hora q o player colocar um transmog novo entao da save, ou casta uma spell,

Unholy Shield = 8909

OnSpellCast = 5

2. hora que o player salva, remover auras e dps adicionar aura de acordo com item equipado?

3. hora que o player desequipa um item, remover auras

----------
1. Ao transmogar um item, casta spell X, entao check a tabela de transmog, se tiver um FakeEntry com o msm id do item da tabela, entao adiciona a aura no player (mas antes disso, remove ela do player)
2. Ao equipar um item
3. Ao desequipar um item

----------

Ao colocar um transmog novo, por exemplo, em um head:

Colocar uma spell pra cada slot, e, ao castar a spell do slot:
head - spell 1234

no lua:

spell 1234 para head, OnCast vai checkar item_instance 

--]]



--[[
local function OnCast(event, player, spell)
	local spellID = spell:GetEntry()

    if spellId == 132 then
        print("Spell called")
    end
end


-- ISSO AQUI FUNCIONA! testado 14/03/2024
function OnCast(event, player, spell)
	if spell:GetEntry() == 43017 then -- Amplify magic
		SendWorldMessage("[TEST]")
	end
end
RegisterPlayerEvent(5, OnCast)
--]]















-- onEquip:
	--[[
    if slot == 3 then
        print("Player " .. player:GetName() .. " desequipou um item do slot shirt.")
	elseif slot ~= 3 then
		local itemType = item:GetEntry()
		print("Player " .. player:GetName() .. " desequipou um item do slot " .. itemType)
		print("Player " .. player:GetName() .. " desequipou um item do slot que nao eh shirt. Slot: " .. slot)
	end

	-- Shirts
	if slot == 3 then
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
                    raceAura = query3:GetUInt32(1)  -- humanAura column
                elseif race == 3 then
                    raceAura = query3:GetUInt32(2)  -- dwarfAura column
                elseif race == 4 then
                    raceAura = query3:GetUInt32(3)  -- Night Elf column
                elseif race == 7 then
                    raceAura = query3:GetUInt32(4)  -- Gnome column
                elseif race == 11 then
                    raceAura = query3:GetUInt32(5)  -- Draenei column
                elseif race == 2 then
                    raceAura = query3:GetUInt32(6)  -- Orc column
                elseif race == 5 then
                    raceAura = query3:GetUInt32(7)  -- Undead column
                elseif race == 6 then
                    raceAura = query3:GetUInt32(8)  -- Tauren column
                elseif race == 8 then
                    raceAura = query3:GetUInt32(9)  -- Troll column
                elseif race == 10 then
                    raceAura = query3:GetUInt32(10) -- BELF column
                end
                
                player:RemoveAura(raceAura, player)  -- Remove a aura correspondente
            end
        end
    end
	--]]