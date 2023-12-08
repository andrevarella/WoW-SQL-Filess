--
-- Created by 55Honey

maps = {}

-- Teleporting to the mall allowed on the maps listed below. You can add more by providing
-- the related map id in its own line. Find map ids e.g. in ./data/map.dbc

-- Eastern kingdoms
table.insert(maps, 0)
-- Kalimdor
table.insert(maps, 1)
-- Outland
table.insert(maps, 530)
-- Northrend
table.insert(maps, 571)

local mapId = 1
local xCoord = 4637.063965
local yCoord = -3817.660645
local zCoord = 942.795593
local orientation = 1.260630


------------------------------------------
-- NO ADJUSTMENTS REQUIRED BELOW THIS LINE
------------------------------------------

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local function summonAll(event, player, command, chatHandler)
    if command == 'lvl' then
        if player == nil then
            player:SendBroadcastMessage('lvl can not be used from the console.')
      return false
        end
        CurrentmapId = player:GetMapId()
        --allow to proceed if the player is on one of the maps listed above
        if has_value(maps, CurrentmapId) then
            --allow to proceed if the player is not in combat
            if not player:IsInCombat() then
              player:Teleport( mapId, xCoord, yCoord, zCoord, orientation )
            else
                player:SendBroadcastMessage("Teleporting is not possible in combat.")
            end
            return false
        else
            player:SendBroadcastMessage("Teleporting to the lvl Zone is not possible here.")
        end
        return false
    end
end

RegisterPlayerEvent(42, summonAll)