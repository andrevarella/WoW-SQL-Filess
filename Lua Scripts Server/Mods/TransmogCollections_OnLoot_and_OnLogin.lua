

local validInventoryTypes = 
{
    [1] = true,  -- Head
    [3] = true,  -- Shoulder
    [4] = true,  -- Shirt
    [5] = true,  -- Chest
    [6] = true,  -- Belt
    [7] = true,  -- Legs
    [8] = true,  -- Boots
    [9] = true,  -- Bracers
    [10] = true, -- Gloves
    [13] = true, -- One-hand weapons
    [14] = true, -- Shield / Off-hand
    [15] = true, -- Bow
    [16] = true, -- Cloak
    [17] = true, -- Two-hand weapons (staff, etc.)
    [19] = true, -- Tabard
    [20] = true, -- Chest (again)
    [21] = true, -- Main hand (1h)
    [22] = true, -- Off-hand (1h)
    [23] = true, -- Off-hand (books)
    [25] = true, -- Thrown
    [26] = true, -- Wand
	
--[[ 2 = neck
	 11 = rings
	 12 = trinket
	 18 = bags
	 28 = relics --]]
}



-- Items comprados no NPC com a flag 4097 e sem flag item_refund, caso o Id do item não tenha em custom_unlocked_appearances
local function OnPlayerLoginFlag4097(event, player)
    local playerguid = player:GetGUIDLow()
    
    local item_instanceQuery = CharDBQuery("SELECT itemEntry, guid FROM item_instance WHERE owner_guid = " .. playerguid .. " AND flags = 4097") -- apenas items comprados de NPC que não estão com flag Refund
    
    if item_instanceQuery then
        local addedItems = {}
        
        repeat
            local itemEntry = item_instanceQuery:GetUInt32(0)
            local iGuid = item_instanceQuery:GetUInt32(1)
            local item_templateQuery = WorldDBQuery("SELECT inventoryType FROM item_template WHERE entry = " .. itemEntry)

            if item_templateQuery then
                local inventoryType = item_templateQuery:GetUInt32(0)
                
                if validInventoryTypes[inventoryType] then
                    local name, quality = GetItemNameAndQuality(itemEntry)
                    local color = GetItemColor(quality)
                    local itemString = "|cff" .. color .. "[" .. name .. "]|r"
                    
                    if not addedItems[iGuid] then
                        local checkQuery = CharDBQuery("SELECT COUNT(*) FROM custom_unlocked_appearances WHERE account_id = " .. playerguid .. " AND item_template_id = " .. itemEntry)
                        
                        if checkQuery and checkQuery:GetUInt32(0) == 0 then
                            local soulboundDataQuery = CharDBQuery("SELECT item_Guid FROM item_refund_instance WHERE item_Guid = " .. iGuid)
                            if not soulboundDataQuery then
                                CharDBExecute("INSERT INTO custom_unlocked_appearances (account_id, item_template_id) VALUES (" .. playerguid .. ", " .. itemEntry .. ")")
                                player:SendBroadcastMessage(itemString .. " has been added to your appearance collection 4097.")
                                addedItems[iGuid] = true
                            end
                        end
                    end
                end
            end
        until not item_instanceQuery:NextRow()
    end
end



-- dá appearance de items com flag = 1 (Soulbound) ao Logar, caso o Id do item não tenha em custom_unlocked_appearances
local function OnPlayerLoginFlag1(event, player)
    local playerguid = player:GetGUIDLow()
    
    local item_instanceQuery = CharDBQuery("SELECT itemEntry FROM item_instance WHERE owner_guid = " .. playerguid .. " AND flags = 1") -- apenas itens Soulbound (Flag 1)
    
    if item_instanceQuery then
        local addedItems = {}
        
        repeat
            local itemEntry = item_instanceQuery:GetUInt32(0)
            local item_templateQuery = WorldDBQuery("SELECT inventoryType FROM item_template WHERE entry = " .. itemEntry)

            if item_templateQuery then
                local inventoryType = item_templateQuery:GetUInt32(0)
                
                if validInventoryTypes[inventoryType] then
                    local name, quality = GetItemNameAndQuality(itemEntry)
                    local color = GetItemColor(quality)
                    local itemString = "|cff" .. color .. "[" .. name .. "]|r"
                    
                    if not addedItems[itemEntry] then
                        local checkQuery = CharDBQuery("SELECT COUNT(*) FROM custom_unlocked_appearances WHERE account_id = " .. playerguid .. " AND item_template_id = " .. itemEntry)
                        
                        if checkQuery and checkQuery:GetUInt32(0) == 0 then
                            CharDBExecute("INSERT INTO custom_unlocked_appearances (account_id, item_template_id) VALUES (" .. playerguid .. ", " .. itemEntry .. ")")
                            player:SendBroadcastMessage(itemString .. " has been added to your appearance collection.")
                            addedItems[itemEntry] = true
                        end
                    end
                end
            end
        until not item_instanceQuery:NextRow()
    end
end



-- transmog Collection só coleta se o player tiver sozinho em raid (nao tem flag tradeable), mas se tiver em raid/grupo então precisa desse script para dar o Collect após sair o Soulbound em um item

-- Free For All/Master loot/Group Loot/Need Before Greed - não funciona com items Traded entre players ou items comprados
function OnStoreNewItem(event, player, item, count)
    local playerGuid = player:GetGUIDLow()
    local itemEntry = item:GetEntry()

    local function DelayedFunction()
        local player = GetPlayerByGUID(playerGuid)

        if player then
            local item_instanceQuery = CharDBQuery("SELECT itemEntry FROM item_instance WHERE owner_guid = " .. playerGuid .. " AND flags = 1 AND itemEntry = " .. itemEntry)

            if item_instanceQuery then
                local alreadyUnlockedQuery = CharDBQuery("SELECT * FROM custom_unlocked_appearances WHERE account_id = " .. playerGuid .. " AND item_template_id = " .. itemEntry)

                if not alreadyUnlockedQuery then
                    CharDBQuery("INSERT INTO custom_unlocked_appearances (account_id, item_template_id) VALUES (" .. playerGuid .. ", " .. itemEntry .. ")")

                    local item_templateQuery = WorldDBQuery("SELECT name, Quality FROM item_template WHERE entry = " .. itemEntry)

                    if item_templateQuery then
                        local name = item_templateQuery:GetString(0)
                        local quality = item_templateQuery:GetUInt32(1)
                        local color = GetItemColor(quality)
                        local itemString = "|cff" .. color .. "[" .. name .. "]|r"
                        player:SendBroadcastMessage(itemString .. " has been added to your appearance collection.")
                    end
                end
            end
        end
    end

    --player:RegisterEvent(DelayedFunction, 5000, 1)
	player:RegisterEvent(DelayedFunction, 7202000, 1) -- = 2 horas, 2 segundos) 
end



function GetItemNameAndQuality(itemEntry)
    local query = WorldDBQuery("SELECT name, Quality FROM item_template WHERE entry = " .. itemEntry)
    if query then
        local name = query:GetString(0)
        local quality = query:GetUInt32(1)
        return name, quality
    else
        return nil
    end
end
function GetItemColor(quality)
    local color = ""
    if quality == 0 then     -- Poor (Gray)
        color = "9d9d9d"
    elseif quality == 1 then -- Common (White)
        color = "ffffff"
    elseif quality == 2 then -- Incommon (Green)
        color = "1eff00"
    elseif quality == 3 then -- Rare (Blue)
        color = "0070dd"
    elseif quality == 4 then -- Epic (Purple)
        color = "a335ee"
    elseif quality == 5 then -- Legendary (Orange)
        color = "ff8000"
    elseif quality == 6 then -- Artifact (Gold)
        color = "e6cc80"
    end
    return color
end

RegisterPlayerEvent(3, OnPlayerLoginFlag1)
RegisterPlayerEvent(3, OnPlayerLoginFlag4097)
RegisterPlayerEvent(53, OnStoreNewItem)


--[[ -- nao funciona os gossips quando invocado por comando
local UnitEntry = 94149
local function GossipAddTransmog(event, player, creature)	
    player:GossipClearMenu()
    player:GossipMenuAddItem(1, "Obter Transmog de um item\nBind when Equiped", 0, 100, false, "Digite o ID do item BoP que você deseja coletar o Transmog")
	player:GossipMenuAddItem(6," test ",0, 500)
    player:GossipSendMenu(0x7FFFFFFF, creature, 100)
	--player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end  

function On_Top_Selecttt(event, player, creature, sender, intid, code)
    if (intid == 100) then
        local text = code
		player:CastSpell(player, 59547, true)
        player:GossipComplete()	
    end
	
	if (intid == 100) then
		local text = code
		if text == "test" then
			player:CastSpell(player, 47436, true)
			player:GossipComplete()	
		else
			player:SendBroadcastMessage("Senha Errada")
			player:GossipComplete()
		end
	end
	
	if(intid == 500) then
		player:GossipComplete()	
	end	
end
function CommandAddCollection(event, player, command)
    if command == "transmogadd" then
        GossipAddTransmog(event, player, player)
    end
end
RegisterCreatureGossipEvent(UnitEntry, 1, GossipAddTransmog)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Selecttt)
RegisterPlayerEvent(42, CommandAddCollection)--]]







--[[
	IsSoulBound
	OnPlayerUpdate
	int IsSoulBound(lua_State* L, Item* item)
	int IsNotBoundToPlayer(lua_State* L, Item* item)
	int CanBeTraded(lua_State* L, Item* item)
	int IsInBag(lua_State* L, Item* item)

--]]