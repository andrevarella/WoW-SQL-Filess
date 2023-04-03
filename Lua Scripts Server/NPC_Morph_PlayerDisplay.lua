local GOSSIP_EVENT_ON_HELLO = 1
local GOSSIP_EVENT_ON_SELECT = 2
local NPC_ID = 93131
local MENU_ID = 1

local function morpherMenu(event, player, object)
    player:GossipClearMenu()
    player:GossipMenuAddItem(9, "|TInterface\\icons\\Inv_bannerpvp_01:26|t Horde Races\n", 0, 6) -- |TInterface\\PVPFrame\\Pvp-Currency-Horde:28|t
    player:GossipMenuAddItem(9, "|TInterface\\icons\\Inv_bannerpvp_02:26|t Alliance Races\n", 0, 7)
    player:GossipMenuAddItem(9, "|TInterface\\icons\\Spell_shadow_raisedead:24|t Creature Displays", 0, 40)
    player:GossipMenuAddItem(7, "|TInterface\\icons\\Ability_rogue_disguise:24|t  Insert Display", 0, 2, true)
    player:GossipMenuAddItem(5, "|TInterface\\icons\\spell_holy_dispelmagic:24|t  Reset Display", 0, 5)
    player:GossipMenuAddItem(5, player:GetDisplayId() .. " <- Current Display ID\n", 0, 0)    -- tava '0, 4', mas acho que nao precisa aparecer no chat tb
    --player:GossipMenuAddItem(2, "Next DisplayID", 0, 1)
    --player:GossipMenuAddItem(2, "Previous DisplayID", 0, 3)

    player:GossipSendMenu(1, object, MENU_ID)
end

local function onSelectMorphDisplay(event, player, object, sender, intid, code, menu_id)
    if (intid == 1) then
        if (player:GetDisplayId() == false) then 
            player:SetDisplayId(1) -- not in use
        end
        player:SetDisplayId(player:GetDisplayId() + 1)

        morpherMenu(event, player, object)
    end
    if (intid == 3) then
        player:SetDisplayId(player:GetDisplayId() - 1) -- not in use
        morpherMenu(event, player, object)
    end


    if (intid == 4) then
        player:SendBroadcastMessage("Current Display ID: " .. player:GetDisplayId())
        morpherMenu(event, player, object)
    end

    if (intid == 2) then
        player:GossipComplete()
        player:SetDisplayId(code)
        morpherMenu(event, player, object)
    end

    if (intid == 5) then
        player:DeMorph()
        morpherMenu(event, player, object)
    end

    -- Creature Displays
    if (intid == 40) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Spell_shadow_raisedead:27|t Visual Morph |cff0000ffNoggenfoggen Elixir", 0, 41)
        player:GossipMenuAddItem(4, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|tBack", 0, 500)
        player:GossipSendMenu(1, object, MENU_ID)
    end
    -- Noggenfoggen Elixir
    if (intid == 41) then
        player:SetDisplayId(7550) -- Undead Male
        morpherMenu(event, player, object)
    end


    -- Horde Races
    if (intid == 6) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_undead_male:27|t Visual Morph |cff0000ffUndead Male", 0, 8)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_undead_female:27|t Visual Morph |cff0000ffUndead Female\n|cFF000000________________________________________", 0, 9)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_orc_male:27|t Visual Morph |cff0000ffOrc Male", 0, 10)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_orc_female:27|t Visual Morph |cff0000ffOrc Female\n|cFF000000________________________________________", 0, 11)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_bloodelf_male:27|t Visual Morph |cff0000ffBlood Elf Male", 0, 12)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_bloodelf_female:27|t Visual Morph |cff0000ffBlood Elf Female\n|cFF000000________________________________________", 0, 13)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_tauren_male:27|t Visual Morph |cff0000ffTauren Male", 0, 14)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_tauren_female:27|t Visual Morph |cff0000ffTauren Female\n|cFF000000________________________________________", 0, 15)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_troll_male:27|t Visual Morph |cff0000ffTroll Male", 0, 16)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_troll_female:27|t Visual Morph |cff0000ffTroll Female\n", 0, 17)
        player:GossipMenuAddItem(4, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|tBack", 0, 500)
        player:GossipSendMenu(1, object, MENU_ID)
    end
    -- Alliance Races
    if (intid == 7) then
        player:GossipClearMenu()
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_human_male:27|t Visual Morph |cff0000ffHuman Male", 0, 20)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_human_female:27|t Visual Morph |cff0000ffHuman Female\n|cFF000000________________________________________", 0, 21)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_nightelf_male:27|t Visual Morph |cff0000ffNight Elf Male", 0, 22)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_nightelf_female:27|t Visual Morph |cff0000ffNight Elf Female\n|cFF000000________________________________________", 0, 23)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_gnome_male:27|t Visual Morph |cff0000ffGnome Male", 0, 24)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_gnome_female:27|t Visual Morph |cff0000ffGnome Female\n|cFF000000________________________________________", 0, 25)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_dwarf_male:27|t Visual Morph |cff0000ffDwarf Male", 0, 26)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_dwarf_female:27|t Visual Morph |cff0000ffDwarf Female\n|cFF000000________________________________________", 0, 27)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_draenei_male:27|t Visual Morph |cff0000ffDraenei Male", 0, 28)
        player:GossipMenuAddItem(9, "|TInterface\\icons\\Achievement_character_draenei_female:27|t Visual Morph |cff0000ffDraenei Female\n", 0, 29)
        player:GossipMenuAddItem(4, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|tBack", 0, 500)
        player:GossipSendMenu(1, object, MENU_ID)
    end

    -- raças horde
    if (intid == 8) then
        player:SetDisplayId(50563) -- Undead Male
        morpherMenu(event, player, object)
    end
    if (intid == 9) then
        player:SetDisplayId(50564) -- Undead Female
        morpherMenu(event, player, object)
    end
    if (intid == 10) then
        player:SetDisplayId(50560) -- Orc Male
        morpherMenu(event, player, object)
    end
    if (intid == 11) then
        player:SetDisplayId(20316) -- Orc Female
        morpherMenu(event, player, object)
    end
    if (intid == 12) then
        player:SetDisplayId(20368) -- Belf Male
        morpherMenu(event, player, object)
    end
    if (intid == 13) then
        player:SetDisplayId(20370) -- Belf Female
        morpherMenu(event, player, object)
    end
    if (intid == 14) then
        player:SetDisplayId(20319) -- Tauren Male
        morpherMenu(event, player, object)
    end
    if (intid == 15) then
        player:SetDisplayId(20584) -- Tauren Female
        morpherMenu(event, player, object)
    end
    if (intid == 16) then
        player:SetDisplayId(20321) -- Troll Male
        morpherMenu(event, player, object)
    end
    if (intid == 17) then
        player:SetDisplayId(50562) -- Troll Female
        morpherMenu(event, player, object)
    end

    -- Raças Alliance
    if (intid == 20) then
        player:SetDisplayId(50567) -- Human Male
        morpherMenu(event, player, object)
    end
    if (intid == 21) then
        player:SetDisplayId(50568) -- Human Female
        morpherMenu(event, player, object)
    end
    if (intid == 22) then
        player:SetDisplayId(50570) -- Nelf Male
        morpherMenu(event, player, object)
    end
    if (intid == 23) then
        player:SetDisplayId(50569) -- Nelf Female
        morpherMenu(event, player, object)
    end
    if (intid == 24) then
        player:SetDisplayId(20580) -- Gnome Male
        morpherMenu(event, player, object)
    end
    if (intid == 25) then
        player:SetDisplayId(20320) -- Gnome Female
        morpherMenu(event, player, object)
    end
    if (intid == 26) then
        player:SetDisplayId(20317) -- Dwarf Male
        morpherMenu(event, player, object)
    end
    if (intid == 27) then
        player:SetDisplayId(50565) -- Dwarf Female
        morpherMenu(event, player, object)
    end
    if (intid == 28) then
        player:SetDisplayId(50566) -- Draenei Male
        morpherMenu(event, player, object)
    end
    if (intid == 29) then
        player:SetDisplayId(20323) -- Draenei Female
        morpherMenu(event, player, object)
    end


    if (intid == 500) then -- botao de Voltar
        morpherMenu(event, player, object)
    end
end


local function onGossipHello(event, player, object)
    if (object:GetEntry() == NPC_ID) then
        morpherMenu(event, player, object)
        player:GossipSendMenu(1, object, MENU_ID)
    end
end

local function onGossipSelect(event, player, object, sender, intid, code, menu_id)
    if (intid == 0) then
        player:GossipComplete()
        return
    end

    onSelectMorphDisplay(event, player, object, sender, intid, code, menu_id)
end



RegisterCreatureGossipEvent(NPC_ID, GOSSIP_EVENT_ON_HELLO, onGossipHello)
RegisterCreatureGossipEvent(NPC_ID, GOSSIP_EVENT_ON_SELECT, onGossipSelect)
