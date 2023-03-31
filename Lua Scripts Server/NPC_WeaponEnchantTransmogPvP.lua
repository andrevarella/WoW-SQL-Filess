local NpcId = 93078;
 
local EQUIPMENT_SLOT_MAINHAND = 15
local EQUIPMENT_SLOT_OFFHAND = 16
local PLAYER_VISIBLE_ITEM_1_ENCHANTMENT = 284
local PERM_ENCHANTMENT_SLOT = 1
local DD = {}

-- achievements de arena:
-- 401   = 2000 2v2
-- 1159  = 2200 2v2
-- 10036 = 2400 2v2
-- 10037 = 2700 2v2
-- 10046 = 3000 2v2

-- 405   = 2000 3v3
-- 1160  = 2200 3v3
-- 10038 = 2400 3v3
-- 13039 = 2700 3v3
-- 10047 = 3000 3v3
 
function setVisual(player, item, display)
    if(not player or not item or not item:IsEquipped()) then return false end
    local iguid = item:GetGUIDLow()
    if(not display) then
        if(not DD[iguid]) then return false end
        display = DD[iguid]
    elseif(display ~= 0) then
        CharDBExecute("REPLACE INTO custom_item_enchant_visuals (iguid, display) VALUES ("..iguid..", "..display..")")
        DD[iguid] = display
    end
    if(display == 0) then
        display = item:GetEnchantmentId(PERM_ENCHANTMENT_SLOT) or 0
        if(DD[iguid]) then
            CharDBExecute("DELETE FROM custom_item_enchant_visuals WHERE iguid = "..iguid)
            DD[iguid] = nil
        end
    end
    player:SetUInt16Value(PLAYER_VISIBLE_ITEM_1_ENCHANTMENT + (item:GetSlot() * 2), 0, display)
    return true
end
 
function applyVisuals(player)
    if(not player) then return end
    for i = EQUIPMENT_SLOT_MAINHAND, EQUIPMENT_SLOT_OFFHAND do
        setVisual(player, player:GetItemByPos(255, i))
    end
end
 
function LOGIN(event, player)
    applyVisuals(player)
end
 
RegisterPlayerEvent(3, LOGIN)
RegisterPlayerEvent(29, function(e,p,i,b,s) setVisual(p, i) end)


-- Gossip Principal
local function On_Gossip_Select(unit, player, creature)
    player:GossipSetText(string.format("NPC para customizar o visual do |cff0000ffEnchant |cFF000000da sua arma. \n\nNecessita do achievement de 2000 Rating em 2v2 ou 3v3.\n\n"))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_01:27|t Main Hand |cff0000ffWeapon Enchant\n",0, 300)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_67:27|t Off Hand |cff0000ffWeapon Enchant\n",0, 302)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
local function On_Gossip_Open(event, player, creature, sender, intid, code)
    if(intid == 33) then
end
 

-- MAIN Hand Gossip 
if(intid == 300) then
    player:GossipSetText(string.format("Main-Hand Enchantments."))
    -- Verifica se o jogador possui a conquista ID 401
    if(player:HasAchieved(401)) then
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2x2 2000 Rating)",0, 482, false, "")
    else
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2x2 2000 Rating)", 0, 0, false, "Você não possui a conquista necessária.")
end
    -- Verifica se o jogador possui a conquista ID 405
    if(player:HasAchieved(405)) then
        player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (3x3 2000 Rating)",0, 472, false, "")
else
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (3x3 2000 Rating)", 0, 0, false, "Você não possui a conquista necessária.")
end
    player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)\n",0, 1003)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- OFF Hand Gossip
if(intid == 302) then
    player:GossipSetText(string.format("Off-Hand Enchantments."))
    -- Verifica se o jogador possui a conquista ID 401
    if(player:HasAchieved(401)) then
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2000 3x3 Rating)",0, 552, false, "")
else
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2000 2x2 Rating)", 0, 0, false, "Você não possui a conquista necessária.")
end
    -- Verifica se o jogador possui a conquista ID 405
    if(player:HasAchieved(405)) then
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (2000 3x3 Rating)",0, 538, false, "")
else
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (2000 3x3 Rating)", 0, 0, false, "Você não possui a conquista necessária.")
end
    player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)\n",0, 1002)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


-- Glorious Tiranny Main Hand
if(intid == 472) then
    local item = player:GetEquippedItemBySlot(15)
    if(player:GetEquippedItemBySlot(15)) then
    setVisual(player, item, 4012)
    player:GossipComplete()
    end
end
-- Demonic Tiranny Main Hand
    if(intid == 482) then
    local item = player:GetEquippedItemBySlot(15)
    if(player:GetEquippedItemBySlot(15)) then
    setVisual(player, item, 4013)
    player:GossipComplete()
    end
end
    
-- Glorious Tiranny Off Hand
    if(intid == 538) then
    local item = player:GetEquippedItemBySlot(16)
    if(player:GetEquippedItemBySlot(16)) then
    setVisual(player, item, 4012)
    player:GossipComplete()
    end
end
-- Demonic Tiranny Off Hand
    if(intid == 552) then
    local item = player:GetEquippedItemBySlot(16)
    if(player:GetEquippedItemBySlot(16)) then
    setVisual(player, item, 4013)
    player:GossipComplete()
    end
end

-- REMOVER Enchant Main Hand
if(intid == 1003) then
    local item = player:GetEquippedItemBySlot(15)
    if(player:GetEquippedItemBySlot(15)) then
    setVisual(player, item, 0)
    player:GossipComplete()
    end
end
-- Remover Enchant Off hand
    if(intid == 1002) then
    local item = player:GetEquippedItemBySlot(16)
    if(player:GetEquippedItemBySlot(16)) then
    setVisual(player, item, 0)
    player:GossipComplete()
    end
end


if (intid == 998) then
    On_Gossip_Select(unit, player, creature)
end
 
if (intid == 999) then
    player:GossipComplete()
    end
end
 
RegisterCreatureGossipEvent(NpcId, 1, On_Gossip_Select)
RegisterCreatureGossipEvent(NpcId, 2, On_Gossip_Open)