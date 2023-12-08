--[[

GetCaster

GetStackAmount
SetStackAmount

GetAuraId
GetOwner



local function ResetPlayerCooldowns(player)
    player:ResetAllCooldowns() -- pra resetar do pet tambem precisa mudar no eluna PlayerMethods.h "RemoveAllSpellCooldown" para "ResetPlayerCDonDeath" - é um void custom
    player:RemoveAura(57724) -- Sated
    player:RemoveAura(57723) -- Exhaustion
    player:RemoveAura(41425) -- Hipothermia
	player:RemoveAura(66233) -- Ardent Defender
    player:RemoveAura(25771) -- Forbearance
	player:RemoveAura(61987) -- Avenging Wrath Marker
	player:RemoveAura(79503) -- Custom - Reincarnation
	player:RemoveAura(79500) -- Custom - Cheated Death
	player:RemoveAura(79502) -- Custom - Nature's Guardian
	player:RemoveAura(79501) -- Custom - Forbearance
	
    local petguid = player:GetPetGUID()
    if (petguid) then
        local pet = player:GetMap():GetWorldObject(petguid)
        if (pet) then
            pet:RemoveAura(57723)
			pet:RemoveAura(57724)
        end
    end
	
end

local function ResetNearbyPlayersCooldowns(player)
    local playersInRange = player:GetPlayersInRange(250) -- Pega todos os jogadores em um raio de 250 jardas
    for _, nearbyPlayer in pairs(playersInRange) do
        ResetPlayerCooldowns(nearbyPlayer)
    end
end

local function CreatureOnDeath(event, creature, killer)
    if killer:IsPlayer() then
        --print("CreatureOnDeath called")
        ResetPlayerCooldowns(killer)
        ResetNearbyPlayersCooldowns(killer)
	-- Pet has killed the creature
    else
        --print("CreatureOnDeath Fail called")
        ResetNearbyPlayersCooldowns(killer)
    end
end


for _, entry in pairs(creatures_entry) do
    RegisterCreatureEvent(entry, 4, CreatureOnDeath)
end


--]]