--[[

local npcID = 94147
local lastGeneratedGuid = 0
local lastGeneratedAuctionId = 0

local function GetLastGuidInTable(tableName, columnName)
  local query = string.format("SELECT MAX(%s) FROM %s;", columnName, tableName)
  local result = CharDBQuery(query)
  if result then
    return result:GetUInt32(0)
  else
    return 0
  end
end

-- Adicionando lógica para manter o tempo mesmo após o servidor ser desligado
local function GetTimeFromFile()
  local file = io.open("black_market_time.txt", "r")
  if file then
    local time = tonumber(file:read("*all"))
    file:close()
    return time
  else
    return 0
  end
end

local function SaveTimeToFile(time)
  local file = io.open("black_market_time.txt", "w")
  if file then
    file:write(tostring(time))
    file:close()
  end
end

local function GetRandomItemsFromTable()
  local query = "SELECT itemID, Buyoutprice, startBid, comment FROM custom_black_market_AH_WIP ORDER BY RAND() LIMIT 5;"
  local result = CharDBQuery(query)

  local items = {}
  if result then
    while result:NextRow() do
      local itemID = result:GetUInt32(0)
      local buyoutPrice = result:GetUInt32(1)
      local startBid = result:GetUInt32(2)
      local comment = result:GetString(3)
      table.insert(items, {itemID = itemID, buyoutPrice = buyoutPrice, startBid = startBid, comment = comment})
    end
  end

  return items
end

local function GenerateUniqueGuid()
  lastGeneratedGuid = lastGeneratedGuid + 1
  return lastGeneratedGuid
end

local function GenerateUniqueAuctionId()
  lastGeneratedAuctionId = lastGeneratedAuctionId + 1
  return lastGeneratedAuctionId
end

local function AddNewItemInstance(playerGuid, itemEntry, comment)
  local newGuid = GenerateUniqueGuid()

  local query = string.format("INSERT INTO item_instance (guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text) VALUES (%d, %u, %u, 0, 0, 1, 0, '-1 0 0 0 0 ', 0, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', 0, 100, 0, '%s');", newGuid, itemEntry, playerGuid, comment)

  CharDBExecute(query)
  return newGuid
end

local function AddNewAuctionItem(itemGuid, itemOwner, buyoutPrice, startBid)
  local newAuctionId = GenerateUniqueAuctionId()

  local query = string.format("INSERT INTO auctionhouse (id, houseid, itemguid, itemowner, buyoutprice, time, buyguid, lastbid, startbid, deposit) VALUES (%d, 7, %u, %u, %u, 1698909635, 0, 0, %u, 50);", newAuctionId, itemGuid, itemOwner, buyoutPrice, startBid)

  CharDBExecute(query)
end

local function PeriodicCreateItems(player)
  local items = GetRandomItemsFromTable()
  for _, item in ipairs(items) do
    local itemGuid = AddNewItemInstance(player:GetGUIDLow(), item.itemID, item.comment)
    AddNewAuctionItem(itemGuid, player:GetGUIDLow(), item.buyoutPrice, item.startBid)
  end

  SendWorldMessage("|cFFFF4500[Black Market Auctioneer]:|r Novos items serão adicionados na Auction House após o proximo restart.")
end

local function PeriodicAddAuctionsAH(event, delay, repeats)  
  local players = GetPlayersInWorld()
  for _, player in ipairs(players) do
    if player:GetGUIDLow() == 107 then -- Character entry 107 (Black Market)
      lastGeneratedGuid = GetLastGuidInTable("item_instance", "guid") -- Atualiza lastGeneratedGuid com o último GUID na tabela item_instance
      lastGeneratedAuctionId = GetLastGuidInTable("auctionhouse", "id") -- Atualiza lastGeneratedAuctionId com o último ID na tabela auctionhouse
      PeriodicCreateItems(player)
    end
  end
end

-- Npc Vendor
local function UpdateBlackMarketNPC()
    VendorRemoveAllItems(npcID)
	AddVendorItem(npcID, 20880, 1, 9000, 0) -- Futuro token - criar novo ExtendedCost, e modificar o custo p 100k, e cada item custa 1~5 token (100~500k)
    local Q = CharDBQuery("SELECT item, count, incrtime, extended FROM custom_black_market_vendor ORDER BY RAND() LIMIT 5")
    if Q then
        repeat
            local item, count, incrtime, extended = Q:GetUInt32(0), Q:GetUInt32(1), Q:GetUInt32(2), Q:GetUInt32(3)
            AddVendorItem(npcID, item, count, incrtime, extended)
        until not Q:NextRow()
    end 
end

local function PeriodicUpdateBlackMarketVendor(event, delay, repeats)
  UpdateBlackMarketNPC()
  SendWorldMessage("|cFFFF4500[Black Market Vendor]:|r Novos items foram adicionados!")
end


CreateLuaEvent(PeriodicAddAuctionsAH, 259200000, 0) -- 72H
--CreateLuaEvent(PeriodicUpdateBlackMarketVendor, 259200000, 0)


--CreateLuaEvent(PeriodicAddAuctionsAH, 5000, 0)
CreateLuaEvent(PeriodicUpdateBlackMarketVendor, 5000, 0)--]]


--]]


--[[


720.0000 = 2 horas

259.200.000 = 72 horas

add OnShutdown p add items na AH? mas dai teria q mudar o restart tbm, tem que ter o mesmo tempo, 24h restart e 24h buyout time ou 48 ou 72h

--]]


