


local T = 
{
--  [classId] = {item1, item2, item3m, ...}
	[0] = {},
	-- Warrior
    [1] = {42943, 48718, 42991, 48716, 42949, 48685, 50255, 51980, 51978, 51982, 51981}, 
	
	 -- Paladin
    [2] = {44100, 48685, 44092, 42992, 50255, 48716, 51980, 51978, 51982, 51981},   
	
	-- Hunter
    [3] = {42946, 50255, 48677, 42991, 42950, 42944, 51965, 51964, 51963, 51962}, 
	
	-- Rogue
    [4] = {42944, 48689, 42952, 42991, 50255, 51965, 51964, 51963, 51962}, 
	
	-- Priest
    [5] = {42947, 48691, 44107, 42992, 50255, 51973, 51968, 51967, 51972}, 
	
	-- Death Knight
    [6] = {42943, 48685, 42949, 42991, 50255}, 
	
	-- Shaman
    [7] = {48716, 48716, 42992, 48677, 42950, 42951, 48683, 50255, 51965, 51964, 51963, 51962}, 
	
	-- Mage
    [8] = {42947, 48691, 44107, 42992, 50255, 51973, 51968, 51967, 51972}, 
	
	-- Warlock
    [9] = {42947, 48691, 44107, 42992, 50255, 51973, 51968, 51967, 51972}, 
	
	-- Druid
    [11] = {42947, 48718, 42952, 42991, 44107, 48691, 48689, 50255, 51965, 51964, 51963, 51962}, 

}

local function OnFirstLogin(event, player)
	local class = player:GetClass()
	local level = player:GetLevel()
	
	if class == 3 then     -- Hunter, deleta Light Quiver
		player:RemoveItem(2101, 1)
	elseif class == 6 then -- DK, deleta 1 Deathweave Bag
		player:RemoveItem(38145, 1)
	end
	
	local bag1 = player:GetItemByPos(255, 19)
	local bag2 = player:GetItemByPos(255, 20)
	local bag3 = player:GetItemByPos(255, 21)
	local bag4 = player:GetItemByPos(255, 22)
	
	if bag1 == nil then
		player:EquipItem(43345, 19)
	else
		player:AddItem(43345, 1)
	end
	if bag2 == nil then
		player:EquipItem(38145, 20)
	else
		player:AddItem(38145, 1)
	end
	if bag3 == nil then
		player:EquipItem(38145, 21)
	else
		player:AddItem(38145, 1)
	end
	if bag4 == nil then
		player:EquipItem(38145, 22)
	else
		player:AddItem(38145, 1)
	end
		
		
	--[[
	-- da item de acordo com a classe
	for _, v in ipairs(T[class]) do
		player:AddItem(v, 1)
	end
	--]]
	
end

RegisterPlayerEvent(30, OnFirstLogin)


-- Deleta items OnFirstLogin (items brancos da gear acho, n sei se conta da bag)
--[[
local function RemoveEquippedItems(event, player)
    if event == 30 then
        -- Delete all equiped items from new character
        for slot = 0, 19 do
            local itemGuid = player:GetEquippedItemBySlot(slot)
            if itemGuid then
                player:RemoveItem(itemGuid, 1)
            end
        end
    end
end

RegisterPlayerEvent(30, RemoveEquippedItems)
--]]

