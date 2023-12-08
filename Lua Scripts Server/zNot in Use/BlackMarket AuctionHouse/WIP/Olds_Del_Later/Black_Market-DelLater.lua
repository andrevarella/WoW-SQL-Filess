--[[
local npcID = 941477
local fileName = "lastTime.txt"

local gapTime = 2 -- dias até o reset
--local realTime = gapTime * 24 * 60 * 60 * 1000
local realTime = 4000

local function UpdateAH()
    VendorRemoveAllItems(npcID)
	--AddVendorItem(npcID, 20880, 1, 9000, 0) -- Futuro token - criar novo ExtendedCost, e modificar o custo p 100k, e cada item custa 1~5 token (100~500k)
    local Q = CharDBQuery("SELECT item, count, incrtime, extended FROM custom_black_market_vendor ORDER BY RAND() LIMIT 3")
    if Q then
        repeat
            local item, count, incrtime, extended = Q:GetUInt32(0), Q:GetUInt32(1), Q:GetUInt32(2), Q:GetUInt32(3)
            AddVendorItem(npcID, item, count, incrtime, extended)
        until not Q:NextRow()
    end 
end



local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local function onUpdate(eventid, delay, repeats)
	--UpdateAH()
	--SendWorldMessage("Teste onUpdate")

    local file = ""
    if file_exists(fileName) then
        file = io.open(fileName, "r")
        io.input(file)
        if tonumber(io.read()) < GetCurrTime() then
            io.close(file)
            file = io.open(fileName, "w")
            file:write(GetCurrTime() + realTime)
            file:close()
            UpdateAH()
			SendWorldMessage("Teste onUpdate Success")
        else
            io.close(file)
        end
    else
        file = io.open(fileName, "w")
        file:write(GetCurrTime() + realTime)
        file:close()
		SendWorldMessage("Teste onUpdate Else")
    end
end


CreateLuaEvent(onUpdate, 7000, 0)
--]]



--local function PeriodicUpdateBlackMarketVendor(event, delay, repeats)
--  UpdateAH()
--  SendWorldMessage("|cFFFF4500[Black Market Vendor]:|r Novos items foram adicionados!")
--end
--CreateLuaEvent(PeriodicUpdateBlackMarketVendor, 7000, 0)

