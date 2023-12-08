-----------------------------------------------------------------------------------|
-----------------------------|Created by Syn|-------------------------------|
-----------------------------------------------------------------------------------|

	--	Script Name:			Creature Arena points On Kill
	--	Script Description:		Adds or removes arena points from a player when they kill a creature.
	--  Script local ArenaPoints = -20 to remove 20 points
	
-----------------------------------------------------------------------------------|
---------------------------------|Configuration|-----------------------------------|
-----------------------------------------------------------------------------------|
local creatures_entry = {94, 31015, 12342, 31746, 12344}
local ArenaPoints = 1

-----------------------------------------------------------------------------------|
--------------------------------|Script Functions|---------------------------------|
-----------------------------------------------------------------------------------|

local function CreatureOnDeath(event, creature, killer)
    killer:ModifyArenaPoints( ArenaPoints )
    killer:SendBroadcastMessage("You got "..ArenaPoints.." Arena Points.")
end

for _, entry in pairs(creatures_entry) do
  RegisterCreatureEvent( entry, 4, CreatureOnDeath )
end