local UnitEntry = 93057



local T = {
	[1] = { "|TInterface\\PVPFrame\\Pvp-Currency-horde.png:30|t Horde Leveling Zones", 1,
		{"|TInterface\\icons\\Achievement_zone_nagrand_01.png:29|t |cFFFFFF00Warsong Hold - Borean Tundra\n", 571, 2829.520752, 6178.302246, 121.982933, 3.937730},
		--{"Undercity", 0, 1831, 238.5, 61.6, 0},
	},
	[2] = { "|TInterface\\PVPFrame\\Pvp-Currency-alliance.png:30|t Alliance Leveling Zones", 0,
		{"Westguard Keep - Howling Fjord", 571, 1347.383179, -3431.647949, 178.253769, 5.250053},
		--{"Ironforge", 0, -4795, -1117, 499, 0},
	},
}

-- CODE STUFFS! DO NOT EDIT BELOW
-- UNLESS YOU KNOW WHAT YOU'RE DOING!

local function OnGossipHello(event, player, unit)

    -- Show main menu
    for i, v in ipairs(T) do
        if (v[2] == 2 or v[2] == player:GetTeam()) then
            player:GossipMenuAddItem(0, v[1], i, 0)

        end
    end

	
	player:GossipMenuAddItem(3,"|TInterface\\icons\\Inv_enchant_formulagood_01.png:29|t  Profession Zone",0, 25) 
    player:GossipSendMenu(1, unit)
end	

local function OnGossipSelect(event, player, unit, sender, intid, code)
    if (sender == 0) then
        -- return to main menu
        OnGossipHello(event, player, unit)
        return
    end

    if player:GetLevel() >= 80 then
        player:SendAreaTriggerMessage("Indisponivel para personagens level 80.")
        return
    end

    if (intid == 0) then
        -- Show teleport menu

        for i, v in ipairs(T[sender]) do
            if (i > 2) then
                player:GossipMenuAddItem(0, v[1], sender, i)
            end
        end
        player:GossipMenuAddItem(0, "Back", 0, 0)
        player:GossipSendMenu(1, unit)
        return
    else
        -- teleport
        local name, map, x, y, z, o = table.unpack(T[sender][intid])
        player:Teleport(map, x, y, z, o)
    end
    
    player:GossipComplete()
end

function Teleporter_Event(event, player, creature, sender, intid, code)
    if (intid == 25) then
	    player:Teleport(1, 5459.22980, -3722.648438, 1593.443726, 3.032393)
	end	

end


RegisterCreatureGossipEvent(UnitEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(UnitEntry, 2, OnGossipSelect)
RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)
