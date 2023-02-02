local PLAYER_EVENT_ON_CHAT = 18
local GOSSIP_EVENT_ON_SELECT = 2
local PLAYER_EVENT_ON_SPELL_CAST = 5


local druidMorph = {}
druidMorph.chatMsg = "#cat"
druidMorph.druidMorhValid = {
    ["Menu"] = {
        {"Cat", 3},
        {"(Indisponível ainda) Bear", 1},
        {"(Indisponível ainda) Travel", 4},
        {"(Indisponível ainda) Aquatic", 2},
        -- {"Flight", 5}
    },
    [1] = {
    },
    [3] = {
        -- Night Elf
        [1] = {
            {"Fire Cat", 50208},
            {"Fire Cat Armored", 50207},
            {"Night Elf Incarnation (Black)", 50209},
            {"Night Elf Incarnation (White)", 50213},
            {"Night Elf Incarnation (Dark Blue)", 50210},
            {"Night Elf Incarnation (Purple)", 50211},
            {"Night Elf Incarnation (Violet)", 50212},
            {"Legion Artifact 1 (White)", 50226},
            {"Legion Artifact 1 (Brown)", 50222},
            {"Legion Artifact 1 (Black)", 50219},
            {"Legion Artifact 2 (Blue)", 50227},
            {"Legion Artifact 2 (Green)", 50228},
            {"Legion Artifact 2 (Purple)", 50229},
            {"Legion Artifact 2 (Orange)", 50230},
            {"Legion Artifact 3 (Purple)", 50235},
            {"Legion Artifact 4 (White)", 50240},
            {"Legion Artifact 5 (Red)", 50244},
            {"Legion Artifact 5 (Orange)", 50243},
            {"Legion Artifact 6 (White)", 50246},
            {"Night Elf Cat Form (Black)", 892},
            {"Night Elf Cat Form (Violet)", 29405},
            {"Night Elf Cat Form (Purple)", 29406},
            {"Night Elf Cat Form (Dark Blue)", 29407},
            {"Night Elf Cat Form (White)", 29408},
            {"White Striped Tiger", 9956},
            {"Red Tiger", 320},
            {"Black Tiger", 599}
            --{"Myonix", 50014}, (muito grande)
            --{"Xuen", 50302}, (muito grande)
            --{"Winterspring Frostsaber", 9954}, (muito grande)
            --{"White Tiger Nostripe", 11444}, (muito grande)
        },
        [2] = {
            -- Tauren
            {"Tauren Cat Form (White)", 29409},
            {"Tauren Cat Form (Yellow)", 29410},
            {"Tauren Cat Form (Red)", 29411},
            {"Tauren Cat Form (Black)", 29412},
            {"Tauren Cat Form (Brown)", 8571},
            {"Tauren Incarnation (Brown)", 50214},
            {"Tauren Incarnation (Black)", 50215},
            {"Tauren Incarnation (Red)", 50216},
            {"Tauren Incarnation (White)", 50217},
            {"Tauren Incarnation (Yellow)", 50218},
            {"Legion Artifact 1 (White)", 50226},
            {"Legion Artifact 1 (Brown)", 50222},
            {"Legion Artifact 1 (Black)", 50219},
            {"Legion Artifact 2 (Blue)", 50227},
            {"Legion Artifact 2 (Green)", 50228},
            {"Legion Artifact 2 (Purple)", 50229},
            {"Legion Artifact 2 (Orange)", 50230},
            {"Legion Artifact 3 (Purple)", 50235},
            {"Legion Artifact 4 (White)", 50240},
            {"Legion Artifact 5 (Red)", 50244},
            {"Legion Artifact 5 (Orange)", 50243},
            {"Legion Artifact 6 (White)", 50246}
            --{"Myonix", 50014}, (muito grande)
            --{"Xuen", 50302}, (muito grande)
            --{"Winterspring Frostsaber", 9954}, (muito grande)
            --{"White Tiger Nostripe", 11444},
            --{"Red Tiger", 320},
            --{"White Striped Tiger", 9956},
            --{"Fire Cat", 50208},
            --{"Black Tiger", 599}
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
    elseif intid == 2 then
        -- print("Aquatic")
        player:GossipClearMenu()
        if not player:HasAura(1066) then
            player:SendBroadcastMessage("You are not in Aquatic form.")
            return druidMorph.menu(event, player, object)
        end
        player:SetData("currentForm", 2)
    elseif intid == 3 then
        player:GossipClearMenu()
        -- print(" Cat")
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
    elseif intid == 4 then
        if not player:HasAura(783) then
            player:SendBroadcastMessage("You are not in Travel form.")
            return druidMorph.menu(event, player, object)
        end
 
        -- print("Travel"
 
        player:GossipClearMenu()
        player:SetData("currentForm", 4)
        player:GossipSendMenu(1, player, MENU_ID)
    elseif intid == 5 then
        if not player:HasAura(33943) then
            player:SendBroadcastMessage("You are not in Flight form.")
            return druidMorph.menu(event, player, object)
        end
 
        -- print("Flight")
        player:SetData("currentForm", 5)
        player:GossipComplete()
    end
 
    if intid ~= 1 and intid ~= 2 and intid ~= 3 and intid ~= 4 and intid ~= 5 then
        player:SetDisplayId(intid)
 
        -- player:SetData("bearFormId", intid)
        -- player:SetData("catFormId", intid)
        -- player:SetData("aquaticFormId", intid)
        -- player:SetData("travelFormId", intid)
        -- player:SetData("flightFormId", intid)
 
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
            player:SetData("flightFormId", intid)
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
 
    -- if (spell:GetEntry() == 9634 or 9635 or 21178 or 62600) then -- bear
    --     local bearId = player:GetData("bearFormId")
    --     player:SetDisplayId(bearId)
    -- end
 
    -- if (spell:GetEntry() == 768 or 3025 or 17099 or 20719 or 5225) then -- cat
    --     local catId = player:GetData("catFormId")
    --     player:SendBroadcastMessage("CAT FORM ENGAGE")
    --     player:SetDisplayId(catId)
    -- end
 
    -- if (spell:GetEntry() == 783 or 5419 or 66530) then -- travel
    --     local travelId = player:GetData("travelFormId")
    --     player:SetDisplayId(travelId)
    -- end
end
 
RegisterPlayerEvent(PLAYER_EVENT_ON_SPELL_CAST, druidMorph.castDisplay)
 
RegisterPlayerEvent(PLAYER_EVENT_ON_CHAT, druidMorph.callMenu)
RegisterPlayerGossipEvent(MENU_ID, GOSSIP_EVENT_ON_SELECT, druidMorph.selectionMorph)