local PLAYER_EVENT_ON_CHAT = 18
local GOSSIP_EVENT_ON_SELECT = 2
local PLAYER_EVENT_ON_SPELL_CAST = 5


local druidMorph = {}
druidMorph.chatMsg = "#kat"
druidMorph.druidMorhValid = {
    ["Menu"] = {
        {"|TInterface\\icons\\Ability_druid_catform.png:29|t Cat", 3},
        {"|TInterface\\icons\\Ability_racial_bearform.png:29|t Bear", 1}
    },

    [3] = { -- Cat Form
        -- Night Elf
        [1] = {
            {"Fire Cat Armored (1)", 50207},
            {"Owl Cat Form White (29)", 50246}
        },
        [2] = {
            -- Tauren
            {"Fire Cat Armored (1)", 50207},
            {"Owl Cat Form White (29)", 50246}
        }
    },
    [1] = { -- Bear Form
            -- Night Elf
        [1] = {
            {"Challenge Bear Red (1)", 50513},
            {"Stone Bear Grey (24)", 50507}
        },
        [2] = {
            -- Tauren
            {"Challenge Bear Red (1)", 50513},
            {"Stone Bear Grey (24)", 50507}
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
    end
    
 
    if intid ~= 1 and intid ~= 3 and intid ~= 4 then
        player:SetDisplayId(intid)
 
        -- player:SetData("bearFormId", intid)
        -- player:SetData("catFormId", intid)
 
        -- Get the current form
        local currentForm = player:GetData("currentForm")
        if currentForm == 1 then
            print("bear")
            player:SetData("bearFormId", intid)

        elseif currentForm == 3 then
            player:SetData("catFormId", intid)
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
end
 
RegisterPlayerEvent(PLAYER_EVENT_ON_SPELL_CAST, druidMorph.castDisplay)
 
RegisterPlayerEvent(PLAYER_EVENT_ON_CHAT, druidMorph.callMenu)
RegisterPlayerGossipEvent(MENU_ID, GOSSIP_EVENT_ON_SELECT, druidMorph.selectionMorph)