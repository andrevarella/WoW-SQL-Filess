
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