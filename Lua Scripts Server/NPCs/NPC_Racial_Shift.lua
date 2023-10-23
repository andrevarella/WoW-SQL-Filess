local UnitEntry = 80275
local cost = 0 --price is coppar

local SPELL_SHADOWMELD = 20580
local SPELL_STEALTH = 1784


-- SpellIDs para serem learned ao clickar no Gossip
local Racial = 
{
    [1] = {20598, 20597, 58985, 20864, 59752, 20599}, -- Human
    [2] = {65222, 20574, 20573}, -- Orc
    [3] = {2481, 20596, 59224, 20594, 20595}, -- Dwarf
    [4] = {21009, 20583, 20582, 58984, 20585}, -- Night Elf
    [5] = {20577, 20579, 5227, 7744}, -- Undead
    [6] = {20552, 20550, 20551, 20549}, -- Tauren
    [7] = {20592, 20593, 20589, 20591}, -- Gnome
    [8] = {20557, 26297, 26290, 58943, 20555, 20558}, -- Troll
    [10] = {28877, 822}, -- Blood Elf
    [11] = {59542, 28875, 6562, 59221} -- Draenei
}

local function UnlearnSpells(player, spells)
    for _, spellID in ipairs(spells) do
        player:RemoveSpell(spellID)
    end
end

-- Unlearned Spells OnLogin
local function OnPlayerLogin(event, player)
	local query = string.format("SELECT race FROM custom_racialshift WHERE guid = "..player:GetGUIDLow()..";")
	local race = CharDBQuery(query)

    if race then
		local raceValue = race:GetUInt32(0)
		
		-- Human
		if raceValue == 1 then      
			UnlearnSpells(player, {20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552,
			20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Orc
		elseif raceValue == 2 then 
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552, 20550,
			20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Dwarf
		elseif raceValue == 3 then
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552, 
			20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Night Elf
		elseif raceValue == 4 then
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 20577, 20579, 5227, 7744, 20552, 20550,
			20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Undead
		elseif raceValue == 5 then
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 
			20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Tauren
		elseif raceValue == 6 then
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Gnome
		elseif raceValue == 7 then
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20552, 20550, 20551, 20549, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Troll
		elseif raceValue == 8 then 
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585,
			20577, 20579, 5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 28730, 28877, 822, 25046, 50613, 28875, 59542, 6562, 59221, 59547, 59540})
		-- Blood Elf
		elseif raceValue == 10 then 
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 
			5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28875, 59542, 6562, 59221, 59547, 59540, 28875})
		-- Draenei
		elseif raceValue == 11 then 
			UnlearnSpells(player, {20599, 59752, 20864, 58985, 20597, 20598, 20574, 20572, 65222, 33702, 33697, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613})
		end
	end
end


local function OnHelloRacialSwitch(event, player, creature)
	player:GossipSetText(string.format("You can swap your racial traits and abiliest with me for a cost."))
	
    if not player:IsInCombat() and not player:HasAura(SPELL_SHADOWMELD) and not player:HasAura(SPELL_STEALTH) and not player:InBattleground() then
	
        local spellID = 83383
        local itemVIP = 83550
        local itemVIPeterno = 83555

        if player:HasSpell(spellID) and not (player:HasItem(itemVIP) or player:HasItem(itemVIPeterno)) then
            player:SendBroadcastMessage("Você precisa do Livro Vip para trocar de raça novamente")
            player:GossipComplete()
            return
        end
	
		-- Human
		if not (player:GetClass() == 3 or player:GetClass() == 11 or player:GetClass() == 7) then -- Exceção p/ Hunter, Druid e Shaman
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_human_male:20|t Resilience of the Human", 0, 1, nil, "Are you sure?", cost)
		end
		
		-- Dwarf
		if not (player:GetClass() == 7 or player:GetClass() == 8 or player:GetClass() == 9 or player:GetClass() == 11) then -- Exceção p/ Shaman, Mage, Lock, Druid
		    player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_dwarf_male:20|t Path of the Dwarf", 0, 3, nil, "Are you sure?", cost)
		end
		
		-- Night Elf
		if not (player:GetClass() == 2 or player:GetClass() == 7 or player:GetClass() == 9) then -- Exceção p/ Pala, Sham, Lock
		    player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_nightelf_female:20|t Way of the Night Elf", 0, 4, nil, "Are you sure?", cost)
		end
			
		-- Gnome
		if not (player:GetClass() == 2 or player:GetClass() == 4 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Pala, Hunter, Sham, Druid
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_gnome_male:20|t Clever of the Gnome", 0, 7, nil, "Are you sure?", cost)
		end
			
		-- Draenei
		if not (player:GetClass() == 4 or player:GetClass() == 9 or player:GetClass() == 11) then -- Exceção p/ Rogue, Lock, Druid
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_draenei_male:20|t Wisdom of the Draenei", 0, 11, nil, "Are you sure?", cost)
		end
			
		-- Orc
		if not (player:GetClass() == 2 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 11) then -- Exceção p/ Pala, Priest, Mage, Druid
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_orc_male:20|t Bravery of the Orc", 0, 2, nil, "Are you sure?", cost)
		end
		
		-- Undead
		if not (player:GetClass() == 2 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Pala, Shaman, Druid
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_undead_male:20|t Shadow of the Undead", 0, 5, nil, "Are you sure?", cost)
		end
		
		-- Tauren
		if not (player:GetClass() == 4 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 9) then -- Exceção p/ Rogue, Priest, Mage, Warlock
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_tauren_male:20|t Nature of the Tauren", 0, 6, nil, "Are you sure?", cost)
		end
		
		-- Troll
		if not (player:GetClass() == 2) then -- Exceção p/ Pala
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_troll_female:20|t Voodoo of the Troll", 0, 8, nil, "Are you sure?", cost)
		end
		
		-- Blood Elf
		if not (player:GetClass() == 1 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Warrior, Shaman, Druid
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Achievement_character_bloodelf_female:20|t Secrets of the Blood Elf", 0, 10, nil, "Are you sure?", cost)
		end
		

        --player:GossipMenuAddItem(0, "Nevermind", 0, 999)
        player:GossipSendMenu(1, creature)
    else
        player:SendBroadcastMessage("You are in Combat!")
    end
end

-- Unlearn OnClick
local Unlearn = 
{
	21563,
	20575,
	59538,
	33697,
	59544,
	59548,
	28878,
	59541,
    20598,
    20597,
    58985,
	20595,
    20864,
    59752,
    20599,
    33702,
    20573,
    65222,
    20572,
    20574,
    2481,
    20596,
    59224,
    20594,
    21009,
    20583,
    20582,
    58984, --smeld
    20585,
    20577,
    20579,
    5227,
    7744,
    20552,
    20550,
    20551,
    20549,
    20592,
    20593,
    20589,
    20591,
    20557,
    26297,
    26290,
    58943,
    20555,
    20558,
    28877,
    822,
    25046,
    28730,
    50613,
    59542,
    28875,
    6562,
    59221
}

local function OnGossipRacialSwitch(event, player, creature, sender, intid, code, menu_id)

-- Human
    if (intid == 1) then
        if not player:HasSpell(59752) then
			player:LearnSpell(83383) -- Spell Custom - para só poder trocar de raça uma vez
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for _, v in ipairs(Racial[1]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " Says: You Got The Human Traits Already")
        end
        player:GossipComplete()
    end

--orc
    if (intid == 2) then
        if not player:HasSpell(20573) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
			if player:GetClass() == 2 or player:GetClass() == 7 or player:GetClass() == 11 then -- paladin, shaman, druid
			    player:LearnSpell(33697)
			elseif player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 9 then -- priest, mage, warlock
			    player:LearnSpell(33702)
			elseif player:GetClass() == 1 or player:GetClass() == 3 or player:GetClass() == 4 or player:GetClass() == 6 then -- warrior, hunter, rogue, dk
				player:LearnSpell(20572)
			end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
            for _, v in ipairs(Racial[2]) do
                player:LearnSpell(v)
            end
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " Says: You Got The Orc Traits Already")
        end
        player:GossipComplete()
    end

--Dwarf
    if (intid == 3) then
        if not player:HasSpell(2481) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in ipairs(Racial[3]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Dwarf Traits Already")
        end
        player:GossipComplete()
    end

--Nelf
    if (intid == 4) then
        if not player:HasSpell(21009) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[4]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage(
                "|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Night Elf Traits Already"
            )
        end
        player:GossipComplete()
    end
	
--undead
    if (intid == 5) then
        if not player:HasSpell(20577) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[5]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage(
                "|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Undead Traits Already"
            )
        end
        player:GossipComplete()
    end
	
	--tauren
    if (intid == 6) then
        if not player:HasSpell(20552) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[6]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage(
                "|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Tauren Traits Already"
            )
        end
        player:GossipComplete()
    end
	
	--gnome
    if (intid == 7) then
        if not player:HasSpell(20592) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[7]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Gnome Traits Already")
        end
        player:GossipComplete()
    end
	
	--troll
    if (intid == 8) then
        if not player:HasSpell(20557) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[8]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Troll Traits Already")
        end
        player:GossipComplete()
    end
	
	--blood elf
    if (intid == 10) then
        if not player:HasSpell(28877) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            if player:GetPower(0) then     -- mana
                player:LearnSpell(28730)
            elseif player:GetPower(2) then -- energy
                player:LearnSpell(25046)
            elseif player:GetPower(6) then -- death knight
                player:LearnSpell(50613)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
            for k, v in pairs(Racial[10]) do
                player:LearnSpell(v)
            end
        else
            player:SendBroadcastMessage(
                "|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Blood Elf Traits Already"
            )
        end

        player:GossipComplete()
    end
	
	--draenei
    if (intid == 11) then
        if not player:HasSpell(59542) then
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[11]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = "..intid.." ;")
        else
            player:SendBroadcastMessage(
                "|cFFFFFF9F" .. creature:GetName() .. " Says: You Got the Draenei Traits Already"
            )
        end
        player:GossipComplete()
    end

    if (intid == 999) then
        player:GossipComplete()
    end

    return false
end



RegisterCreatureGossipEvent(UnitEntry, 1, OnHelloRacialSwitch)
RegisterCreatureGossipEvent(UnitEntry, 2, OnGossipRacialSwitch)
RegisterPlayerEvent(3, OnPlayerLogin)

	-- 1 = warrior
	-- 2 = pala
	-- 3 = hunter
	-- 4 rogue
	-- 5 priest
	-- 6 dk
	-- 7 shaman
	-- 8 mage
	-- 9 warlock
	-- 11 druid