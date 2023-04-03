
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
        --{"|TInterface\\icons\\Ability_druid_aquaticform.png:29|t Aquatic", 2},
        {"|TInterface\\icons\\Ability_druid_improvedmoonkinform.png:29|t Moonkin", 5}
    },

    [3] = { -- Cat Form
        -- Night Elf
        [1] = { -- Limite = 33, mais que isso dá erro
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
        [2] = {
            -- Tauren
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
        }
    },
    [1] = { -- Bear Form
        -- Night Elf
        [1] = {
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
        [2] = {
            -- Tauren
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
        }
    },
    [2] = { -- Aquatic Form
        -- Night Elf
        [1] = {
            {"Orca", 50494},
            {"Original Aquatic", 2428}
        },
        [2] = {
            -- Tauren
            {"Orca", 50494},
            {"Original Aquatic", 2428}
        }
    },
    [5] = { -- Moonkin Form
        -- Night Elf
        [1] = {
            {"Armored Moonkin", 50503},
            {"Night Elf Moonkin", 15374}
        },
        [2] = {
            -- Tauren
            {"Armored Moonkin", 50502},
            {"Original Moonkin", 15375}
        },
    },
    [4] = { -- Travel Form
        -- Night Elf
        [1] = {
            {"Stag", 50504},
            {"Original Travel", 918}
        },
        [2] = {
            -- Tauren
            {"Stag", 50504},
            {"Original Travel", 918}
        }
    }
}

--change so name is first and id is second
local MENU_ID = 100
 
function druidMorph.menu(event, player, object)
    local race = player:GetRace()
    local class = player:GetClass()
    player:GossipClearMenu()
    for _, menuName in ipairs(druidMorph.druidMorhValid["Menu"]) do
        player:GossipMenuAddItem(10, menuName[1] .. " Form.", 0, menuName[2])
        -- print(menuName[1], menuName[2])
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
        if (player:GetRace() == 4) then
            -- Night Elf
            --set form
 
            for _, menuName in ipairs(druidMorph.druidMorhValid[1][1]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end
            
        elseif (player:GetRace() == 6) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[intid][2]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
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
         if (player:GetRace() == 4) then
            -- Night Elf
            --set form
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][1]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

                elseif (player:GetRace() == 6) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[2][2]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
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
 
        if (player:GetRace() == 4) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][1]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
            end
        elseif (player:GetRace() == 6) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[3][2]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
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
         if (player:GetRace() == 4) then
            -- Night Elf
            --set form
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][1]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

                elseif (player:GetRace() == 6) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[4][2]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
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
         if (player:GetRace() == 4) then
            -- Night Elf
            --set form
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][1]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
                -- print(menuName[1], menuName[2])
            end

                elseif (player:GetRace() == 6) then
            for _, menuName in ipairs(druidMorph.druidMorhValid[5][2]) do
                player:GossipMenuAddItem(10, menuName[1], 0, menuName[2])
            end
        end
        player:SetData("currentForm", 5)
        player:GossipSendMenu(1, player, MENU_ID)
    end
    
 
    if intid ~= 1 and intid ~= 2 and intid ~= 3 and intid ~= 4 and intid ~= 5 then
        player:SetDisplayId(intid)
 
        -- player:SetData("bearFormId", intid)
        -- player:SetData("catFormId", intid)
        -- player:SetData("aquaticFormId", intid)
        -- player:SetData("travelFormId", intid)
        -- player:SetData("moonkinFormId", intid)
 
        -- Get the current form
        local currentForm = player:GetData("currentForm")
        if currentForm == 1 then
            print("bear")
            player:SetData("bearFormId", intid)

        elseif currentForm == 3 then
            player:SetData("catFormId", intid)

        elseif currentForm == 2 then
            player:SetData("aquaticFormId", intid)

        elseif currentForm == 4 then
            player:SetData("travelFormId", intid)

        elseif currentForm == 5 then
            player:SetData("moonkinFormId", intid)
        end
 
        -- player:GossipComplete()
        -- player:GossipClearMenu()
        druidMorph.menu(event, player, object)
    end
end
 
function druidMorph.callMenu(event, player, msg, lang, type)
    if (msg:find(druidMorph.chatMsg)) then
        druidMorph.menu(event, player)
        return false
    end
end
 
function druidMorph.castDisplay(event, player, spell, skipCheck)
    -- print(spell:GetEntry())
 
    if player:HasAura(768) then
        if player:GetData("catFormId") ~= nil then
            player:SetDisplayId(player:GetData("catFormId"))
        end
    end
 
    if player:HasAura(9634) then
        if player:GetData("bearFormId") ~= nil then
            player:SetDisplayId(player:GetData("bearFormId"))
        end
    end

    if player:HasAura(1066) then
        if player:GetData("aquaticFormId") ~= nil then
            player:SetDisplayId(player:GetData("aquaticFormId"))
        end
    end

    if player:HasAura(783) then
        if player:GetData("travelFormId") ~= nil then
            player:SetDisplayId(player:GetData("travelFormId"))
        end
    end

    if player:HasAura(24858) then
        if player:GetData("moonkinFormId") ~= nil then
            player:SetDisplayId(player:GetData("moonkinFormId"))
        end
    end
    
end
 
RegisterPlayerEvent(PLAYER_EVENT_ON_SPELL_CAST, druidMorph.castDisplay)
RegisterPlayerGossipEvent(MENU_ID, GOSSIP_EVENT_ON_SELECT, druidMorph.selectionMorph)
RegisterCreatureGossipEvent(NPC_ID, GOSSIP_EVENT_ON_HELLO, druidMorph.menu)
