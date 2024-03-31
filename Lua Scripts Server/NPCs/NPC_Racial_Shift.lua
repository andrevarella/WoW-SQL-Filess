local UnitEntry = 80275
local cost = 0 -- price is copper

local SPELL_SHADOWMELD = 20580
local SPELL_STEALTH = 1784


-- SpellIDs para serem learned ao clickar no Gossip
local Racial = 
{
    [1] = {20598, 20597, 58985, 20864, 59752, 20599}, -- Human
    [2] = {20574, 20573},                             -- Orc ( axe spec, hardiness )
    [3] = {2481, 20596, 59224, 20594, 20595},         -- Dwarf
    [4] = {21009, 20583, 20582, 58984, 20585},        -- Night Elf
    [5] = {20577, 20579, 5227, 7744},                 -- Undead
    [6] = {20552, 20550, 20551, 20549},               -- Tauren
    [7] = {20592, 20593, 20589, 20591},               -- Gnome
    [8] = {20557, 26297, 26290, 58943, 20555, 20558}, -- Troll
    [10] = {28877, 822},                              -- Blood Elf ( Arcane Affinity, Magic Resistance )
    [11] = {28875}                                    -- Draenei ( Gemcutting )
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
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552,
			20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Orc
		elseif raceValue == 2 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, -- Draenei Spells + Arcane Torrent
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552, 20550,
			20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Dwarf
		elseif raceValue == 3 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20599, 59752, 20864, 58985, 20597, 20598, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 5227, 7744, 20552, 
			20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Night Elf
		elseif raceValue == 4 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 20577, 20579, 5227, 7744, 20552, 20550,
			20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Undead
		elseif raceValue == 5 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 
			20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Tauren
		elseif raceValue == 6 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Gnome
		elseif raceValue == 7 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20552, 20550, 20551, 20549, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		-- Troll
		elseif raceValue == 8 then 
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585,
			20577, 20579, 5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 28730, 28877, 822, 25046, 50613 })
		-- Blood Elf
		elseif raceValue == 10 then
			UnlearnSpells(player, { 6562, 28878, 28875, 28880, 59542, 59543, 59544, 59545, 59547, 59548, 59221, 59535, 59536, 59538, 59539, 59540, 59541, 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Draenei Spells + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 20579, 
			5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558 })
		-- Draenei
		elseif raceValue == 11 then
			UnlearnSpells(player, { 21563, 20575, 54562, 20576, 65222, 20573, 20574, 20572, 33702, 33697, -- Arcane Torrent + Orc
			20595, 20599, 59752, 20864, 58985, 20597, 20598, 2481, 20596, 59224, 20594, 21009, 20583, 20582, 58984, 20585, 20577, 
			20579, 5227, 7744, 20552, 20550, 20551, 20549, 20592, 20593, 20589, 20591, 20557, 26297, 26290, 58943, 20555, 20558, 28730, 28877, 822, 25046, 50613 })
		end
	end
end

local function OnHelloRacialSwitch(event, player, creature)
	player:GossipSetText(string.format(" Voce pode mudar suas habilidades raciais, porem apenas |cFFFF0000uma vez|r.\n |cFFFFFF00Pense bem antes de mudar.|r\n\nPlayers|cff00ccff VIP|r tem trocas raciais ilimitadas. \n\n\n |cFF0000FFEscolha as habilidades de uma raça:|r"))

    if not player:IsInCombat() and not player:HasAura(SPELL_SHADOWMELD) and not player:HasAura(SPELL_STEALTH) and not player:InBattleground() then
	
        local spellID = 83383
        local itemVIP = 61000
        local itemVIPeterno = 61001

        if player:HasSpell(spellID) and not (player:HasItem(itemVIP) or player:HasItem(itemVIPeterno)) then
            player:SendBroadcastMessage("Você precisa do Livro Vip para trocar de raça novamente")
            player:GossipComplete()
            return
        end
			
		-- Human
		if not (player:GetClass() == 3 or player:GetClass() == 11 or player:GetClass() == 7) then -- Exceção p/ Hunter, Druid e Shaman
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_human_male:20|t Resilience of the |cFF0000FFHuman|r", 0, 21)
		end
	
		-- Dwarf
		if not (player:GetClass() == 7 or player:GetClass() == 8 or player:GetClass() == 9 or player:GetClass() == 11) then -- Exceção p/ Shaman, Mage, Lock, Druid
		    player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_dwarf_male:20|t Path of the |cFF0000FFDwarf|r", 0, 23)
		end
		
		-- Night Elf
		if not (player:GetClass() == 2 or player:GetClass() == 7 or player:GetClass() == 9) then -- Exceção p/ Pala, Sham, Lock
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_nightelf_female:20|t Way of the |cFF0000FFNight Elf|r", 0, 24)
		end
			
		-- Gnome
		if not (player:GetClass() == 2 or player:GetClass() == 4 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Pala, Hunter, Sham, Druid
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_gnome_male:20|t Clever of the |cFF0000FFGnome|r", 0, 27)
		end
			
		-- Draenei
		if not (player:GetClass() == 4 or player:GetClass() == 9 or player:GetClass() == 11) then -- Exceção p/ Rogue, Lock, Druid
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_draenei_male:20|t Wisdom of the |cFF0000FFDraenei|r", 0, 30)
		end
			
		-- Orc
		if not (player:GetClass() == 2 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 11) then -- Exceção p/ Pala, Priest, Mage, Druid
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_orc_male:20|t Bravery of the |cFF0000FFOrc|r", 0, 22)
		end
		
		-- Undead
		if not (player:GetClass() == 2 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Pala, Shaman, Druid
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_undead_male:20|t Shadow of the |cFF0000FFUndead|r", 0, 25)
		end
		
		-- Tauren
		if not (player:GetClass() == 4 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 9) then -- Exceção p/ Rogue, Priest, Mage, Warlock
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_tauren_male:20|t Nature of the |cFF0000FFTauren|r", 0, 26)
		end
		
		-- Troll
		if not (player:GetClass() == 2) then -- Exceção p/ Pala
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_troll_female:20|t Voodoo of the |cFF0000FFTroll|r", 0, 28)
		end
		
		-- Blood Elf
		if not (player:GetClass() == 1 or player:GetClass() == 7 or player:GetClass() == 11) then -- Exceção p/ Warrior, Shaman, Druid
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_character_bloodelf_female:20|t Secrets of the |cFF0000FFBlood Elf|r", 0, 29)
		end
		
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
    else
        player:SendBroadcastMessage("You are in Combat!")
    end
end

-- Unlearn OnClick (unlearn previous racial before learning new one)
local Unlearn = 
{
	-- Orc
	20573, 20574,                      -- Hardiness, Axe Spec
	20575, 20576, 21563, 54562, 65222, -- Command
	20572, 33702, 33697,               -- Blood Fury (AP), Blood Fury(SP), Blood Fury (AP/SP)

	-- Human
	20598, 20597, 58985, 59752, 20599, 20864, -- The Human Spirit, Sword Specialization, Perception, Every Man for Himself, Diplomacy, Mace Specialization

	-- Dwarf
	20595, 2481, 20596, 20594, 59224, -- Gun Specialization, Find Treasure, Frost Resistance (dwarf), Stoneform (tem outro id 65116), Mace Specialization (dwarf?)
	
	-- Gnome
	20592, 20593, 20589, 20591, -- Arcane Resistance, Engineering Specialization, Escape Artist, Expansive Mind (gnome 5% intelect)
	
	-- Night Elf
	21009, 20582, 58984, 20585, 20583, -- Elusiveness, Quickness, Shadowmeld, Wisp Spirit, Nature Resistance

	-- Undead
	7744, 20577, 5227, 20579,  --  Will of the Forsaken, Cannibalize, Underwater Breathing, Shadow Resistance 

	-- Tauren
	20549, 20552, 20550, 20551, -- War Stomp (tem outra tbm id 46026), Cultivation, Endurance, Nature Resistance

	-- Troll
	26297, 20557, 26290, 58943, 20555, 20558,  -- Berserking (soh existe 1), Beast Slaying, Bow Specialization, Da Voodoo Shuffle, Regeneration, Throwing Specialization
	
	-- Blood Elf
	822, 28877, -- Magic Resistance, Arcane Affinity
    28730,      -- Arcane Torrent (pal/hunter/priest/mage/lock)
	25046,      -- Arcane Torrent (rogue)
	50613,      -- Arcane Torrent (DK)
	
	-- Draenei
	6562,  -- Heroic Presence (warr/pal/hunter/dk)
	28878, -- Heroic Presence (priest/sham/mage)
	28875, -- Gemcutting
	28880, -- Gift of the Naaru (Warrior)
	59542, -- Gift of the Naaru (Paladin)
	59543, -- Gift of the Naaru (Hunter)
	59544, -- Gift of the Naaru (Priest)
	59545, -- Gift of the Naaru (DK)
	59547, -- Gift of the Naaru (Shaman)
	59548, -- Gift of the Naaru (Mage)
	59221, -- Shadow Resistance Warr Draenei
	59535, -- Shadow Resistance Paladin Draenei
	59536, -- Shadow Resistance Hunter Draenei - fix na dbc! (p reduzir dmg)
	59538, -- Shadow Resistance Priest Draenei
	59539, -- Shadow Resistance DK Draenei
	59540, -- Shadow Resistance Shaman Draenei
	59541  -- Shadow Resistance Mage Draenei
}

local function OnGossipRacialSwitch(event, player, creature, sender, intid, code, menu_id)

	-- Human Submenu
	if (intid == 21) then
		player:GossipSetText(string.format("\n As raciais de Human |TInterface\\icons\\Achievement_character_human_male:20|t são: \n\n - Every Man for Himself \n - Perception \n - The Human Spirit \n - Sword Specialization \n - Mace Specialization \n - Diplomacy\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 500)
		player:GossipMenuAddItem(3," \nObter Raciais de Human |TInterface\\icons\\Achievement_character_human_male:20|t\n_______________________________________", 0, 1, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5,"\n |TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 500) then -- Linkar Raciais de Human no Chat
		local StoneformLink = "|Hspell:59752|h[Every Man for Himself]|h|r"
		local FrostResistanceLink = "|Hspell:58985|h[Perception]|h|r"
		local GunSpecializationLink = "|Hspell:20598|h[The Human Spirit]|h|r"
		local FindTreasureLink = "|Hspell:20597|h[Sword Specialization]|h|r"
		local Find2TreasureLink = "|Hspell:20864|h[Mace Specialization]|h|r"
		local Find3TreasureLink = "|Hspell:20599|h[Diplomacy].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Human são: \n %s \n %s, %s, %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink, Find2TreasureLink, Find3TreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 21, code)
	end
	
	-- Orc Submenu
	if (intid == 22) then
		player:GossipSetText(string.format("\n As raciais de Orc |TInterface\\icons\\Achievement_character_orc_male:20|t são: \n\n - Blood Fury \n - Hardiness \n - Command \n - Axe Specialization\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 501)
		player:GossipMenuAddItem(3," \nObter Raciais de Orc |TInterface\\icons\\Achievement_character_orc_male:20|t\n_______________________________________", 0, 2, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 501) then -- Linkar Raciais de Orc no Chat
		local StoneformLink = "|Hspell:33697|h[Blood Fury]|h|r"
		local FrostResistanceLink = "|Hspell:20573|h[Hardiness]|h|r"
		local GunSpecializationLink = "|Hspell:21563|h[Command]|h|r"
		local FindTreasureLink = "|Hspell:20574|h[Axe Specialization].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Orc são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 22, code)
	end
	
	-- Dwarf Submenu
	if (intid == 23) then
		player:GossipSetText(string.format("\n As raciais de Dwarf |TInterface\\icons\\Achievement_character_dwarf_male:20|t são: \n\n - Stoneform \n - Frost Resistance \n - Gun Specialization \n - Find Treasure\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 502)
		player:GossipMenuAddItem(3," \nObter Raciais de Dwarf |TInterface\\icons\\Achievement_character_dwarf_male:20|t\n_______________________________________", 0, 3, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 502) then -- Linkar Raciais de Dwarf no Chat
		local StoneformLink = "|Hspell:20594|h[Stoneform]|h|r"
		local FrostResistanceLink = "|Hspell:20596|h[Frost Resistance]|h|r"
		local GunSpecializationLink = "|Hspell:20595|h[Gun Specialization]|h|r"
		local FindTreasureLink = "|Hspell:2481|h[Find Treasure].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Dwarf são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 23, code)
	end

	-- Night Elf Submenu
	if (intid == 24) then
		player:GossipSetText(string.format("\n As raciais de Night Elf  |TInterface\\icons\\Achievement_character_nightelf_female:20|t são: \n\n - Shadowmeld \n - Quickness \n - Nature Resistance \n - Elusiveness \n - Wisp Spirit\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________\n", 0, 503)
		player:GossipMenuAddItem(3," \nObter Raciais de Night Elf |TInterface\\icons\\Achievement_character_nightelf_female:20|t\n_______________________________________", 0, 4, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 503) then -- Linkar Raciais de Night Elf no Chat
		local shadowmeldLink = "|Hspell:58984|h[Shadowmeld]|h|r"
		local quicknessLink = "|Hspell:20582|h[Quickness]|h|r"
		local elusivenessLink = "|Hspell:21009|h[Elusiveness]|h|r"
		local wispspiritLink = "|Hspell:20585|h[Wisp Spirit].|h|r"
		local natureresistanceLink = "|Hspell:20583|h[Nature Resistance]|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Night Elf são: \n %s \n %s, %s, %s, %s ", shadowmeldLink, quicknessLink, natureresistanceLink, elusivenessLink, wispspiritLink))
		OnGossipRacialSwitch(event, player, creature, sender, 24, code)
	end
	
	-- Undead Submenu
	if (intid == 25) then
		player:GossipSetText(string.format("\n As raciais de Undead |TInterface\\icons\\Achievement_character_undead_male:20|t são: \n\n - Will of the Forsaken: \n - Cannibalize \n - Shadow Resistance \n - Underwater Breathing\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 504)
		player:GossipMenuAddItem(3," \nObter Raciais de Undead |TInterface\\icons\\Achievement_character_undead_male:20|t\n_______________________________________", 0, 5, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 504) then -- Linkar Raciais de Undead no Chat
		local StoneformLink = "|Hspell:7744|h[Will of the Forsaken]|h|r"
		local FrostResistanceLink = "|Hspell:20577|h[Cannibalize]|h|r"
		local GunSpecializationLink = "|Hspell:20579|h[Shadow Resistance]|h|r"
		local FindTreasureLink = "|Hspell:5227|h[Underwater Breathing].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Undead são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 25, code)
	end
	
	-- Tauren Submenu
	if (intid == 26) then
		player:GossipSetText(string.format("\n As raciais de Tauren |TInterface\\icons\\Achievement_character_tauren_male:20|t são: \n\n - War Stomp \n - Endurance \n - Nature Resistance \n - Cultivation\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 505)
		player:GossipMenuAddItem(3," \nObter Raciais de Tauren |TInterface\\icons\\Achievement_character_tauren_male:20|t\n_______________________________________", 0, 6, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 505) then -- Linkar Raciais de Tauren no Chat
		local StoneformLink = "|Hspell:20549|h[War Stomp]|h|r"
		local FrostResistanceLink = "|Hspell:20550|h[Endurance]|h|r"
		local GunSpecializationLink = "|Hspell:20551|h[Nature Resistance]|h|r"
		local FindTreasureLink = "|Hspell:20552|h[Cultivation].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Tauren são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 26, code)
	end
	
	-- Gnome Submenu
	if (intid == 27) then
		player:GossipSetText(string.format("\n As raciais de Gnome |TInterface\\icons\\Achievement_character_gnome_male:20|t são: \n\n - Escape Artist \n - Expansive Mind \n - Arcane Resistance \n - Engineering Specialization\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 506)
		player:GossipMenuAddItem(3," \nObter Raciais de Gnome |TInterface\\icons\\Achievement_character_gnome_male:20|t\n_______________________________________", 0, 7, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 506) then -- Linkar Raciais de Gnome no Chat
		local StoneformLink = "|Hspell:20589|h[Escape Artist]|h|r"
		local FrostResistanceLink = "|Hspell:20591|h[Expansive Mind]|h|r"
		local GunSpecializationLink = "|Hspell:20592|h[Arcane Resistance]|h|r"
		local FindTreasureLink = "|Hspell:20593|h[Engineering Specialization].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Gnome são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink))
		OnGossipRacialSwitch(event, player, creature, sender, 27, code)
	end
	
	-- Troll Submenu
	if (intid == 28) then
		player:GossipSetText(string.format("\n As raciais de Troll |TInterface\\icons\\Achievement_character_troll_female:20|t são: \n\n - Berserking \n - Da Voodo Shuffle \n - Bow Specialization \n - Throwing Specialization \n - Beast Slaying \n - Regeneration\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 507)
		player:GossipMenuAddItem(3," \nObter Raciais de Troll |TInterface\\icons\\Achievement_character_troll_female:20|t\n_______________________________________", 0, 8, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 507) then -- Linkar Raciais de Troll no Chat
		local StoneformLink = "|Hspell:26297|h[Berserking]|h|r"
		local FrostResistanceLink = "|Hspell:58943|h[Da Voodo Shuffle]|h|r"
		local GunSpecializationLink = "|Hspell:26290|h[Bow Specialization]|h|r"
		local FindTreasureLink = "|Hspell:20558|h[Throwing Specialization]|h|r\n"
		local FindTreasure2Link = "|Hspell:20557|h[Beast Slaying]|h|r"
		local FindTreasure3Link = "|Hspell:20555|h[Regeneration].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Troll são: \n %s \n %s, %s, %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, FindTreasureLink, FindTreasure2Link, FindTreasure3Link))
		OnGossipRacialSwitch(event, player, creature, sender, 28, code)
	end
	
	-- Blood Elf Submenu
	if (intid == 29) then
		player:GossipSetText(string.format("\n As raciais de Blood Elf |TInterface\\icons\\Achievement_character_bloodelf_female:20|t são: \n\n - Arcane Torrent \n - Magic Resistance \n - Arcane Affinity\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________", 0, 508)
		player:GossipMenuAddItem(3," \nObter Raciais de Blood Elf |TInterface\\icons\\Achievement_character_bloodelf_female:20|t\n_______________________________________", 0, 10, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 508) then -- Linkar Raciais de Blood Elf no Chat
		local StoneformLink = "|Hspell:28730|h[Arcane Torrent]|h|r"
		local FrostResistanceLink = "|Hspell:822|h[Magic Resistance]|h|r"
		local GunSpecializationLink = "|Hspell:28877|h[Arcane Affinity].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Blood Elf são: \n %s \n %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink))
		OnGossipRacialSwitch(event, player, creature, sender, 29, code)
	end
	
	-- Draenei Submenu
	if (intid == 30) then
		player:GossipSetText(string.format("\n As raciais de Draenei |TInterface\\icons\\Achievement_character_draenei_male:20|t são: \n\n - Gift of the Naaru\n - Heroic Presence \n - Shadow Resistance \n - Gemcutting\n   _______________________________________"))
		player:GossipMenuAddItem(7,"\n|cFFFFFF00 Clique para linkar as Raciais no chat.|r\n_______________________________________\n", 0, 509)
		player:GossipMenuAddItem(3," \nObter Raciais de Draenei |TInterface\\icons\\Achievement_character_draenei_male:20|t\n_______________________________________", 0, 11, nil, "Tem certeza? Você só poderá trocar de Racial novamente se for VIP.", cost)
		player:GossipMenuAddItem(5," \n|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 899)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	if (intid == 509) then -- Linkar Raciais de Draenei no Chat
		local StoneformLink = "|Hspell:59542|h[Gift of the Naaru]|h|r"
		local FrostResistanceLink = "|Hspell:6562|h[Heroic Presence]|h|r"
		local GunSpecializationLink = "|Hspell:59535|h[Shadow Resistance]|h|r"
		local GunSpecialization2Link = "|Hspell:28875|h[Gemcuttinge].|h|r"
		player:SendBroadcastMessage(string.format(" \n As raciais de Draenei são: \n %s \n %s, %s, %s", StoneformLink, FrostResistanceLink, GunSpecializationLink, GunSpecialization2Link))
		OnGossipRacialSwitch(event, player, creature, sender, 30, code)
	end


	-- Human
    if (intid == 1) then
        if not player:HasSpell(59752) then -- Every Man for Himself (soh tem 1)
			player:LearnSpell(83383)       -- Spell Custom - para só poder trocar de raça uma vez
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for _, v in ipairs(Racial[1]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 1) ON DUPLICATE KEY UPDATE race = 1 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got The Human traits already.")
        end
        player:GossipComplete()
    end

	-- Orc
    if (intid == 2) then
        if not player:HasSpell(20573) then -- Hardiness (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
			
			-- Warrior & Rogue
			if player:GetClass() == 1 or player:GetClass() == 4 then
				player:LearnSpell(21563) -- Command
				player:LearnSpell(20572) -- Blood Fury (aumenta AP)
			-- Hunter
			elseif player:GetClass() == 3 then
				player:LearnSpell(20576) -- Command
				player:LearnSpell(20572) -- Blood Fury
			-- Death Knight
			elseif player:GetClass() == 6 then
				player:LearnSpell(54562) -- Command
				player:LearnSpell(20572) -- Blood Fury
			-- Shaman
			elseif player:GetClass() == 7 then
				player:LearnSpell(65222) -- Command
				player:LearnSpell(33697) -- Blood Fury
			-- Warlock
			elseif player:GetClass() == 9 then
				player:LearnSpell(20575) -- Command
				player:LearnSpell(33702) -- Blood Fury (aumenta SP)
			-- Paladin, Priest, Mage, Druid 
			elseif player:GetClass() == 2 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 11 then
				player:LearnSpell(65222) -- Command
				player:LearnSpell(33697) -- Blood Fury (aumenta AP e SP)
			end
			
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 2) ON DUPLICATE KEY UPDATE race = 2 ;")
            for _, v in ipairs(Racial[2]) do
                player:LearnSpell(v)
            end
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got The Orc traits already.")
        end
        player:GossipComplete()
    end

	-- Dwarf
    if (intid == 3) then
        if not player:HasSpell(2481) then -- Find Treasure (Soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in ipairs(Racial[3]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 3) ON DUPLICATE KEY UPDATE race = 3 ;")

        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Dwarf traits already.")
        end
        player:GossipComplete()
    end
	
	-- Nelf
    if (intid == 4) then
        if not player:HasSpell(21009) then -- Elusiveness (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[4]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 4) ON DUPLICATE KEY UPDATE race = 4 ;")

        else
            player:SendBroadcastMessage( "|cFFFFFF9F" .. creature:GetName() .. " says: You got the Night Elf traits already." )
        end
        player:GossipComplete()
    end
	
	-- undead
    if (intid == 5) then
        if not player:HasSpell(20577) then -- Cannibalize (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[5]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 5) ON DUPLICATE KEY UPDATE race = 5 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Undead traits already.")
        end
        player:GossipComplete()
    end
	
	-- tauren
    if (intid == 6) then
        if not player:HasSpell(20552) then -- Cultivation (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[6]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 6) ON DUPLICATE KEY UPDATE race = 6 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Tauren traits already.")
        end
        player:GossipComplete()
    end
	
	-- gnome
    if (intid == 7) then
        if not player:HasSpell(20592) then -- Arcane Resistance (Racial Passive) (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[7]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 7) ON DUPLICATE KEY UPDATE race = 7 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Gnome traits already.")
        end
        player:GossipComplete()
    end
	
	-- Troll
    if (intid == 8) then
        if not player:HasSpell(20557) then -- Beast Slaying
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
            for k, v in pairs(Racial[8]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 8) ON DUPLICATE KEY UPDATE race = 8 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Troll traits already.")
        end
        player:GossipComplete()
    end
	
	-- Blood Elf
    if (intid == 10) then
        if not player:HasSpell(28877) then -- Arcane Affinity (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
			
			--[[
            if player:GetPower(0) then     -- mana
                player:LearnSpell(28730)
            elseif player:GetPower(2) then -- energy
                player:LearnSpell(25046)
            elseif player:GetPower(6) then -- death knight
                player:LearnSpell(50613)
            end--]]
			
			-- Rogue (Warrior n pode aprender atm)
			if player:GetClass() == 1 or player:GetClass() == 4 then
				player:LearnSpell(25046) -- Arcane Torrent (Energy)
			-- Death Knight
			elseif player:GetClass() == 6 then
				player:LearnSpell(50613) -- Arcane Torrent (runic power)
			-- Hunter, Priest, Mage, Warlock (+ Druid, Shaman q n podem obter atm) 
			--                       hunter                     priest                     mage                    warlock                       paladin                     druid                    shaman
			elseif player:GetClass() == 3 or player:GetClass() == 5 or player:GetClass() == 8 or player:GetClass() == 9 or player:GetClass() == 2 or player:GetClass() == 11 or player:GetClass() == 7  then
				player:LearnSpell(28730) -- Arcane Torrent (6% Mana)
			end
			
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 10) ON DUPLICATE KEY UPDATE race = 10 ;")
            for k, v in pairs(Racial[10]) do
                player:LearnSpell(v)
            end
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Blood Elf traits already.")
        end

        player:GossipComplete()
    end
	
	-- Draenei
    if (intid == 11) then
        if not player:HasSpell(28875) then -- Gemcutting (soh tem 1)
			player:LearnSpell(83383)
            for _, v in ipairs(Unlearn) do
                player:RemoveSpell(v)
            end
			
			-- Warrior
			if player:GetClass() == 1 then
				player:LearnSpell(6562)  -- Heroic Presence
				player:LearnSpell(28880) -- Gift of the Naaru (Warrior)
				player:LearnSpell(59221) -- Shadow Resistance (Warrior)

			-- Paladin
			elseif player:GetClass() == 2 then
				player:LearnSpell(6562)  -- Heroic Presence
				player:LearnSpell(28880) -- Gift of the Naaru (Paladin)
				player:LearnSpell(59221) -- Shadow Resistance (Paladin)
				
			-- Hunter
			elseif player:GetClass() == 3 then
				player:LearnSpell(6562)  -- Heroic Presence
				player:LearnSpell(59543) -- Gift of the Naaru (Hunter)
				player:LearnSpell(59536) -- Shadow Resistance (Hunter)
				
			-- Priest
			elseif player:GetClass() == 5 then
				player:LearnSpell(28878) -- Heroic Presence
				player:LearnSpell(59544) -- Gift of the Naaru (Priest)
				player:LearnSpell(59538) -- Shadow Resistance (Priest)
				
			-- Death Knight
			elseif player:GetClass() == 6 then
				player:LearnSpell(6562)  -- Heroic Presence
				player:LearnSpell(59545) -- Gift of the Naaru (DK)
				player:LearnSpell(59539) -- Shadow Resistance (DK)
				
			-- Shaman
			elseif player:GetClass() == 7 then
				player:LearnSpell(28878) -- Heroic Presence
				player:LearnSpell(59547) -- Gift of the Naaru (Shaman)
				player:LearnSpell(59540) -- Shadow Resistance (Shaman)
				
			-- Mage
			elseif player:GetClass() == 7 then
				player:LearnSpell(28878) -- Heroic Presence
				player:LearnSpell(59548) -- Gift of the Naaru (Mage)
				player:LearnSpell(59541) -- Shadow Resistance (Mage)
				
			-- Rogue, Warlock, Druid (Não podem ser criados)
			elseif player:GetClass() == 4 or player:GetClass() == 9 or player:GetClass() == 11 then
				player:LearnSpell(6562)  -- Heroic Presence
				player:LearnSpell(59548) -- Gift of the Naaru (AP/SP)
				player:LearnSpell(59541) -- Shadow Resistance
			end
			
            for k, v in pairs(Racial[11]) do
                player:LearnSpell(v)
            end
			CharDBExecute("INSERT INTO custom_racialshift (guid, race) VALUES ("..player:GetGUIDLow()..", 11) ON DUPLICATE KEY UPDATE race = 11 ;")
        else
            player:SendBroadcastMessage("|cFFFFFF9F" .. creature:GetName() .. " says: You got the Draenei traits already.")
        end
        player:GossipComplete()
    end

	-- sair
    if (intid == 999) then
        player:GossipComplete()
    end
	-- voltar
	if (intid == 899) then
		OnHelloRacialSwitch(event, player, creature)
	end
	
	
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