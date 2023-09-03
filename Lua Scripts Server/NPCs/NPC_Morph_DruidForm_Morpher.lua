local GOSSIP_EVENT_ON_SELECT = 2
local PLAYER_EVENT_ON_SPELL_CAST = 5
local GOSSIP_EVENT_ON_HELLO = 1
local NPC_ID = 45432

local druidMorph = {}
druidMorph.druidMorhValid = {
    ["Menu"] = {
        {"|TInterface\\icons\\Ability_druid_catform.png:29|t Cat", 3},
        {"|TInterface\\icons\\Ability_racial_bearform.png:29|t Bear", 1},
        {"|TInterface\\icons\\Ability_druid_travelform.png:29|t Travel", 4},
        {"|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:29|t Moonkin", 5},
		{"|TInterface\\icons\\Ability_druid_aquaticform.png:29|t Aquatic", 2}
    },

    [3] = { -- Cat Form
        [1] = {  -- Night Elf    -  Limite = 33, mais que isso dá erro
            {"Fire Cat Armored (1)", 50207},
            {"Fire Cat (2)", 50208},
            {"Armored Cat Black (3)", 50209},
            {"Armored Cat White (4)", 50213},
            {"Armored Cat Blue (5)", 50210},
            {"Armored Cat Purple (6)", 50211},
            {"Armored Cat Pink (7)", 50212},
            {"Cat Form Challenge Blue (8)", 50227},
            {"Cat Form Challenge Red (9)", 50230},
            {"Cat Form Challenge Green (10)", 50228},
            {"Cat Form Challenge Purple (11)", 50229},
            {"Cat Form Honor Red (12)", 50244},
            {"Cat Form Honor Orange (13)", 50243},
            {"Cat Form Honor Blue (14)", 50241},
            {"Cat Form Honor Green (15)", 50242},
            {"Cat Form Artifact 4 Purple (16)", 50239},
            {"Cat Form Artifact 4 White (17)", 50240},
            {"Cat Form Artifact 4 Orange (18)", 50238},
            {"Cat Form Artifact 4 Green (19)", 50237},
            {"Cat Form Artifact 3 Purple (20)", 50235},
            {"Cat Form Artifact 3 Blue (21)", 50232},
            {"Cat Form Artifact 3 Orange (22)", 50234},
            {"Cat Form Artifact 3 Green (23)", 50233},
            {"Cat Form Artifact 1 White (24)", 50226},
            {"Cat Form Artifact 1 Blue (25)", 50225},
            {"Cat Form Artifact 1 Black (26)", 50219},
            {"Cat Form Artifact 1 Brown (27)", 50222},
            {"Owl Cat Form Black (28)", 50245},
            {"Owl Cat Form White (29)", 50246}
        },
        [2] = {  -- Tauren Cat Forms
            {"Fire Cat Armored (1)", 50207},
            {"Fire Cat (2)", 50208},
            {"Armored Cat Black (3)", 50215},
            {"Armored Cat White (4)", 50217},
            {"Armored Cat Brown (5)", 50216},
            {"Armored Cat Light Brown (6)", 50214},
            {"Armored Cat Yellow (7)", 50218},
            {"Cat Form Challenge Blue (8)", 50227},
            {"Cat Form Challenge Red (9)", 50230},
            {"Cat Form Challenge Green (10)", 50228},
            {"Cat Form Challenge Purple (11)", 50229},
            {"Cat Form Honor Red (12)", 50244},
            {"Cat Form Honor Orange (13)", 50243},
            {"Cat Form Honor Blue (14)", 50241},
            {"Cat Form Honor Green (15)", 50242},
            {"Cat Form Artifact 4 Purple (16)", 50239},
            {"Cat Form Artifact 4 White (17)", 50240},
            {"Cat Form Artifact 4 Orange (18)", 50238},
            {"Cat Form Artifact 4 Green (19)", 50237},
            {"Cat Form Artifact 3 Purple (20)", 50235},
            {"Cat Form Artifact 3 Blue (21)", 50232},
            {"Cat Form Artifact 3 Orange (22)", 50234},
            {"Cat Form Artifact 3 Green (23)", 50233},
            {"Cat Form Artifact 1 White (24)", 50226},
            {"Cat Form Artifact 1 Blue (25)", 50225},
            {"Cat Form Artifact 1 Black (26)", 50219},
            {"Cat Form Artifact 1 Brown (27)", 50222},
            {"Owl Cat Form Black (28)", 50245},
            {"Owl Cat Form White (29)", 50246}
        },
	  [3] = {  -- Troll Cat Forms
            {"Fire Cat Armored (1)", 50207},
            {"Fire Cat (2)", 50208},
            {"Armored Cat Blue (3)", 50600},
            {"Armored Cat White (4)", 50596},
            {"Armored Cat Red (5)", 50598},
            {"Armored Cat Yellow (6)", 50599},
            {"Armored Cat Green (7)", 50597},
            {"Cat Form Challenge Blue (8)", 50227},
            {"Cat Form Challenge Red (9)", 50230},
            {"Cat Form Challenge Green (10)", 50228},
            {"Cat Form Challenge Purple (11)", 50229},
            {"Cat Form Honor Red (12)", 50244},
            {"Cat Form Honor Orange (13)", 50243},
            {"Cat Form Honor Blue (14)", 50241},
            {"Cat Form Honor Green (15)", 50242},
            {"Cat Form Artifact 4 Purple (16)", 50239},
            {"Cat Form Artifact 4 White (17)", 50240},
            {"Cat Form Artifact 4 Orange (18)", 50238},
            {"Cat Form Artifact 4 Green (19)", 50237},
            {"Cat Form Artifact 3 Purple (20)", 50235},
            {"Cat Form Artifact 3 Blue (21)", 50232},
            {"Cat Form Artifact 3 Orange (22)", 50234},
            {"Cat Form Artifact 3 Green (23)", 50233},
            {"Cat Form Artifact 1 White (24)", 50226},
            {"Cat Form Artifact 1 Blue (25)", 50225},
            {"Cat Form Artifact 1 Black (26)", 50219},
            {"Cat Form Artifact 1 Brown (27)", 50222},
            {"Owl Cat Form Black (28)", 50245},
            {"Owl Cat Form White (29)", 50246}
        }
    },
    [1] = {  -- Bear Form
        [1] = {  -- Night Elf Bears
            {"Challenge Bear Red (1)", 50513},
            {"Challenge Bear Blue (2)", 50510},
            {"Challenge Bear Purple (3)", 50512},
            {"Challenge Bear Green (4)", 50511},
            {"Spiked Bear Red (5)", 50517},
            {"Spiked Bear Orange (6)", 50515},
            {"Spiked Bear Blue (7)", 50514},
            {"Spiked Bear Green (8)", 50516},
            {"Boned Bear Black (9)", 50518},
            {"Boned Bear Brown (10)", 50519},
            {"Boned Bear Orange (11)", 50520},
            {"Boned Bear White (12)", 50521},
            {"Bear Artifact Black (13)", 50495},
            {"Bear Artifact White (14)", 50493},
            {"Bear Artifact Brown (15)", 50496},
            {"Bear Artifact Blue (16)", 50492},
            {"Werebear Black (17)", 50203},
            {"Werebear White (18)", 50206},
            {"Werebear Brown (19)", 50205},
            {"Werebear Yellow (20)", 50204},
            {"Stone Bear Black (21)", 50506},
            {"Stone Bear Brown (22)", 50508},
            {"Stone Bear Purple (23)", 50509},
            {"Stone Bear Grey (24)", 50507}
        },
        [2] = {  -- Tauren Bears
            {"Challenge Bear Red (1)", 50513},
            {"Challenge Bear Blue (2)", 50510},
            {"Challenge Bear Purple (3)", 50512},
            {"Challenge Bear Green (4)", 50511},
            {"Spiked Bear Red (5)", 50517},
            {"Spiked Bear Orange (6)", 50515},
            {"Spiked Bear Blue (7)", 50514},
            {"Spiked Bear Green (8)", 50516},
            {"Boned Bear Black (9)", 50518},
            {"Boned Bear Brown (10)", 50519},
            {"Boned Bear Orange (11)", 50520},
            {"Boned Bear White (12)", 50521},
            {"Bear Artifact Black (13)", 50495},
            {"Bear Artifact White (14)", 50493},
            {"Bear Artifact Brown (15)", 50496},
            {"Bear Artifact Blue (16)", 50492},
            {"Werebear Black (17)", 50203},
            {"Werebear White (18)", 50206},
            {"Werebear Brown (19)", 50205},
            {"Werebear Yellow (20)", 50204},
            {"Stone Bear Black (21)", 50506},
            {"Stone Bear Brown (22)", 50508},
            {"Stone Bear Purple (23)", 50509},
            {"Stone Bear Grey (24)", 50507}
        },
        [3] = {  -- Troll Bears
            {"Challenge Bear Red (1)", 50513},    -- 1
            {"Challenge Bear Blue (2)", 50510},   -- 2
            {"Challenge Bear Purple (3)", 50512}, -- 3
            {"Challenge Bear Green (4)", 50511},  -- 4
            {"Spiked Bear Red (5)", 50517},       -- 5
            {"Spiked Bear Orange (6)", 50515},    -- 6
            {"Spiked Bear Blue (7)", 50514},      -- 7
            {"Spiked Bear Green (8)", 50516},     -- 8
            {"Boned Bear Black (9)", 50518},      -- 9
            {"Boned Bear Brown (10)", 50519},     -- 10
            {"Boned Bear Orange (11)", 50520},    -- 11
            {"Boned Bear White (12)", 50521},     -- 12
            {"Bear Artifact Black (13)", 50495},  -- 13
            {"Bear Artifact White (14)", 50493},  -- 14
            {"Bear Artifact Brown (15)", 50496},  -- 15
            {"Bear Artifact Blue (16)", 50492},   -- 16
            {"Werebear Black (17)", 50203},       -- 17
            {"Werebear White (18)", 50206},       -- 18
            {"Werebear Brown (19)", 50205},       -- 19
            {"Werebear Yellow (20)", 50204},      -- 20
            {"Stone Bear Black (21)", 50506},     -- 21
            {"Stone Bear Brown (22)", 50508},     -- 22
            {"Stone Bear Purple (23)", 50509},    -- 23
            {"Stone Bear Grey (24)", 50507},
            {"Armored Bear White (25)", 50588},
            {"Armored Bear Blue (26)", 50585},
            {"Armored Bear Red (27)", 50587},
            {"Armored Bear Purple (28)", 50586},
            {"Armored Bear Yellow (29)", 50589}
        }
    },
    [2] = {
        [1] = {  -- Night Elf - Aquatic Form
            {"Orca", 50494},
            {"Original Aquatic", 2428}
        },
        [2] = {  -- Tauren - Aquatic Form
            {"Orca", 50494},
            {"Original Aquatic", 2428}
        },
        [3] = {  -- Troll - Aquatic Form
            {"Orca", 50494},
            {"Original Aquatic", 2428}
        }
    },
    [5] = {
        [1] = {   -- Night Elf Moonkin
            {"Armored Moonkin", 50503},
            {"Night Elf Moonkin", 15374}
        },
        [2] = {   -- Tauren Moonkin
            {"Armored Moonkin", 50502},
            {"Original Moonkin", 15375}
        },
        [3] = {   -- Troll Moonkin
            {"Armored Moonkin", 50502},
            {"Original Moonkin", 50590}
        }
    },
    [4] = {
        [1] = { -- Night Elf - Travel Form
            {"Stag", 50504},
            {"Original Travel", 918}
        },
        [2] = { -- Tauren - Travel Form
            {"Stag", 50504},
            {"Original Travel", 918}
        },
        [3] = { -- Troll - Travel Form
            {"Stag", 50504},
            {"Original Travel", 918}
        }
    }
}

local MENU_ID = 100  -- change so name is first and id is second
 
function druidMorph.menu(event, player, object)
    local race = player:GetRace()
    local class = player:GetClass()
    player:GossipClearMenu()
    for _, menuName in ipairs(druidMorph.druidMorhValid["Menu"]) do
        player:GossipMenuAddItem(3, menuName[1] .. " Form.", 0, menuName[2])   -- print(menuName[1], menuName[2])
    end
    player:GossipSendMenu(1, player, MENU_ID)
end


function druidMorph.selectionMorph(event, player, object, sender, intid, code, menu_id)

    -- BEAR
    if intid == 1 then
        -- print("Bear")
        player:GossipClearMenu()
        if not player:HasAura(9634 or 5487) then
            player:SendBroadcastMessage("You are not in bear form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then   -- Night Elf Bear
        -- set form
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
        -- print(menuName[1], menuName[2])
            end
            
        elseif (player:GetRace() == 6) then   -- Tauren Bear
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then   -- troll Bear
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 1)
        player:GossipSendMenu(1, player, MENU_ID)


    -- AQUATIC
    elseif intid == 2 then
        -- print("Aquatic")
        player:GossipClearMenu()
        if not player:HasAura(1066) then
            player:SendBroadcastMessage("You are not in Aquatic form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then -- Night Elf Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then -- Tauren Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then -- Troll Aquatic
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][3]) do
            player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 2)
        player:GossipSendMenu(1, player, MENU_ID)

    -- CAT
    elseif intid == 3 then
        player:GossipClearMenu()
        -- print("Cat")
        if not player:HasAura(768) then
            player:SendBroadcastMessage("You are not in Cat form")
            return druidMorph.menu(event, player, object)
        end
 
        if (player:GetRace() == 4) then -- Nelf Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then -- Tauren Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then -- Troll Cat Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 3)
        player:GossipSendMenu(1, player, MENU_ID)

    -- Travel 
    elseif intid == 4 then
        -- print("Travel")
        player:GossipClearMenu()
        if not player:HasAura(783) then
            player:SendBroadcastMessage("You are not in Travel form.")
            return druidMorph.menu(event, player, object)
        end

         if (player:GetRace() == 4) then   -- Night Elf Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][1]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 6) then   -- Tauren Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        
        elseif (player:GetRace() == 8) then   -- Troll Travel Form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 4)
        player:GossipSendMenu(1, player, MENU_ID)

    -- Moonkin Form
    elseif intid == 5 then
        -- print("Moonkin")
        player:GossipClearMenu()
        if not player:HasAura(24858) then
            player:SendBroadcastMessage("You are not in Moonkin form.")
            return druidMorph.menu(event, player, object)
        end

        if (player:GetRace() == 4) then   -- Night Elf Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][1]) do          -- set form
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

        elseif (player:GetRace() == 6) then   -- Tauren Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][2]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end

        elseif (player:GetRace() == 8) then   -- Troll Moonkin
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][3]) do
                player:GossipMenuAddItem(2, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 5)
        player:GossipSendMenu(1, player, MENU_ID)
    end
	
    
 
    if intid ~= 1 and intid ~= 2 and intid ~= 3 and intid ~= 4 and intid ~= 5 then
        player:SetDisplayId(intid)
 
        local currentForm = player:GetData("currentForm")
        local formName
        if currentForm == 1 then
            formName = "DisplayBearForm"
            player:SaveToDB() 
		elseif currentForm == 2 then
            formName = "DisplayAquaticForm"
            player:SaveToDB() 
        elseif currentForm == 3 then
            formName = "DisplayCatForm"
            player:SaveToDB() 
        elseif currentForm == 4 then
            formName = "DisplayTravelForm"
            player:SaveToDB() 
        elseif currentForm == 5 then
            formName = "DisplayMoonkinForm"
            player:SaveToDB() 
        end
        CharDBExecute("INSERT INTO custom_druid_form_display (player_guid, "..formName..") VALUES ("..player:GetGUIDLow()..","..intid..") ON DUPLICATE KEY UPDATE "..formName.."="..intid)
 
        druidMorph.menu(event, player, object)
    end
end


function druidMorph.castDisplay(event, player, spell, skipCheck)

    local LuaIsNull = function(val, default)
	if val ~= nil and val ~= 0 then
		return val
	else
		return default
		end
	end
	

    local Query = CharDBQuery("SELECT * FROM custom_druid_form_display WHERE player_guid = "..player:GetGUIDLow())
    
    if(Query) then
        local DisplayCatForm = LuaIsNull(Query:GetUInt32(1), nil)
        local DisplayBearForm = LuaIsNull(Query:GetUInt32(2), nil)
		local DisplayTravelForm = LuaIsNull(Query:GetUInt32(3), nil)
		local DisplayMoonkinForm = LuaIsNull(Query:GetUInt32(4), nil)
        local DisplayAquaticForm = LuaIsNull(Query:GetUInt32(5), nil)

        
        -- Checa a raça para determinar qual será o DisplayID padrão
        local race = player:GetRace()
        local defaultCatForm
        local defaultBearForm
        local defaultMoonkinForm
        local defaultAquaticForm
        local defaultTravelForm

        if race == 4 then -- Night Elf
            defaultCatForm = 29406
            defaultBearForm = 29417
            defaultMoonkinForm = 15374
            defaultAquaticForm = 2428
            defaultTravelForm = 918
        elseif race == 6 then -- Tauren
            defaultCatForm = 29411
            defaultBearForm = 29420
            defaultMoonkinForm = 15375
            defaultAquaticForm = 2428
            defaultTravelForm = 918
        elseif race == 8 then -- Troll
            defaultCatForm = 50595
            defaultBearForm = 50580
            defaultMoonkinForm = 50590
            defaultAquaticForm = 2428
            defaultTravelForm = 918
        end

        if player:HasAura(768) then   -- Cat Form
            player:SetDisplayId(DisplayCatForm or defaultCatForm)
        end
        if player:HasAura(9634) then  -- Bear Form
            player:SetDisplayId(DisplayBearForm or defaultBearForm)
        end
        if player:HasAura(24858) then -- Moonkin Form
            player:SetDisplayId(DisplayMoonkinForm or defaultMoonkinForm)
        end
        if player:HasAura(1066) then  -- Aquatic Form
            player:SetDisplayId(DisplayAquaticForm or defaultAquaticForm)
        end
        if player:HasAura(783) then   -- Travel Form
            player:SetDisplayId(DisplayTravelForm or defaultTravelForm)
        end
    end
end


-- fix, não aplicava o customdisplay ao logar, tinha que renovar a forma
function druidMorph.applyCatFormOnLogin(event, player)
    if player:GetClass() == 11 then -- Druids Only
        if player:HasAura(768) then -- Cat Form
            player:RemoveAura(768) --
            player:AddAura(768, player)
        elseif player:HasAura(9634) then -- Bear
            player:RemoveAura(9634)
            player:AddAura(9634, player)
        elseif player:HasAura(783) then -- Travel
            player:RemoveAura(783)
            player:AddAura(783, player)
        elseif player:HasAura(24858) then -- Moonkin
            player:RemoveAura(24858)
            player:AddAura(24858, player)
        elseif player:HasAura(1066) then -- Aquatic
            player:RemoveAura(1066)
            player:AddAura(1066, player)
        end
    end
end
 
RegisterPlayerEvent(PLAYER_EVENT_ON_SPELL_CAST, druidMorph.castDisplay)
RegisterPlayerGossipEvent(MENU_ID, GOSSIP_EVENT_ON_SELECT, druidMorph.selectionMorph)
RegisterCreatureGossipEvent(NPC_ID, GOSSIP_EVENT_ON_HELLO, druidMorph.menu)
RegisterPlayerEvent(3, druidMorph.applyCatFormOnLogin)