local NPC_ID = 94130 -- substitua pelo ID do seu NPC
local MAX_PROFILES = 3 -- substitua pelo número máximo de perfis permitidos
local CONFIRM_TEXT = "Deseja salvar seus talentos atuais neste perfil?"

local function saveTalents(player, profile)
    local spec = player:GetSpecialization()
    local talents = {}
    for tier = 1, MAX_TALENT_TIERS do
        for column = 1, MAX_TALENT_COLUMNS do
            local talentID, _, _, selected, _, spellID = GetTalentInfo(tier, column, spec)
            if selected then
                table.insert(talents, spellID)
            end
        end
    end
    local talentString = table.concat(talents, ",")
    player:SendBroadcastMessage(CONFIRM_TEXT)
    player:GossipCreateMenu("Salvar talentos em perfil " .. profile .. "?", 0, 0)
    player:GossipMenuAddItem(0, "Sim", 1, profile)
    player:GossipMenuAddItem(0, "Não", 2, 0)
    player:GossipSendMenu(1, player, 0)
    return false
end

local function loadTalents(player, profile)
    local query = WorldDBQuery("SELECT talents FROM character_talent WHERE guid = " .. player:GetGUIDLow() .. " AND profile = " .. profile)
    if query then
        local talents = query:GetString(0)
        local talentTable = {}
        for talentID in string.gmatch(talents, "%d+") do
            table.insert(talentTable, tonumber(talentID))
        end
        for _, spellID in ipairs(talentTable) do
            player:LearnSpell(spellID)
        end
        player:SendBroadcastMessage("Talentos carregados do perfil " .. profile .. ".")
    else
        player:SendBroadcastMessage("Perfil " .. profile .. " não encontrado.")
    end
    return false
end

function onGossipHello(event, player, unit)
    player:GossipMenuAddItem(0, "Salvar talentos atuais em um perfil:", 0, 0, true, "Escolha um perfil:")
    for i = 1, MAX_PROFILES do
        player:GossipMenuAddItem(0, "Perfil " .. i, 2, i)
    end
    player:GossipMenuAddItem(0, "Voltar", 6, 0)
    player:GossipSendMenu(NPC_ID, unit)
end

function onGossipSelect(event, player, unit, sender, intid, code)
    if intid == 2 then
        player:GossipMenuAddItem(0, "Sim", 4, code)
        player:GossipMenuAddItem(0, "Não", 3, code)
        player:GossipSendMenu(NPC_ID, player)
    elseif intid == 3 then
        player:GossipComplete()
    elseif intid == 4 then
        local talentString = GetTalentString(player)
        WorldDBExecute("REPLACE INTO character_talent (guid, profile, talents) VALUES (" .. player:GetGUIDLow() .. ", " .. code .. ", '" .. talentString .. "')")
        player:SendBroadcastMessage("Talentos salvos no perfil " .. code .. ".")
        player:GossipComplete()
    elseif intid == 5 then
        loadTalents(player, code)
        player:GossipComplete()
    elseif intid == 6 then
        onGossipHello(event, player, unit)
    end
    return false
end

RegisterCreatureGossipEvent(NPC_ID, 1, onGossipHello)
RegisterCreatureGossipEvent(NPC_ID, 2, onGossipSelect)

