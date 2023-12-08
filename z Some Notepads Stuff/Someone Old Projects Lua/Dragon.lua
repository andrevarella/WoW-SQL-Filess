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

local mapId = 0
local xCoord = 4529.258301
local yCoord = -1973.316650
local zCoord = 220.741730
local orientation = 0.436635


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
    if command == 'mall' then
        if player == nil then
            player:SendBroadcastMessage('mall can not be used from the console.')
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
            player:SendBroadcastMessage("Teleporting to the mall is not possible here.")
        end
        return false
    end
end

RegisterPlayerEvent(42, summonAll)