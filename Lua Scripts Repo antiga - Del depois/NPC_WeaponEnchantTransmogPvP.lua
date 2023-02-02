local NpcId = 93078;
 
local EQUIPMENT_SLOT_MAINHAND = 15
local EQUIPMENT_SLOT_OFFHAND = 16
local PLAYER_VISIBLE_ITEM_1_ENCHANTMENT = 284
local PERM_ENCHANTMENT_SLOT = 1
local DD = {}
 
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
 
local function On_Gossip_Select(unit, player, creature)
player:GossipSetText(string.format("NPC para customizar o seu personagem mudando o visual do |cff0000ffEnchant |cFF000000da sua arma. \nNecessita de 3x3 Team Rating 2000.\n\n"))

player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_01:27|t Main Hand |cff0000ffWeapon Enchant\n",0, 300)
player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_sword_67:27|t Off Hand |cff0000ffWeapon Enchant\n",0, 302)

--player:GossipMenuAddItem(6,"|TInterface\\icons\\Spell_shadow_shadowpact:27|t |cff0000ffCharacter Morph",0, 34)
--player:GossipMenuAddItem(6,"|TInterface\\icons\\Spell_shadow_shadesofdarkness:27|t |cff0000ffCharacter Aura",0, 35)
--player:GossipMenuAddItem(6,"|TInterface\\icons\\Spell_deathknight_scourgestrike:27|t Visual Vip System - Weapons - apagar",0, 33)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 

local function On_Gossip_Open(event, player, creature, sender, intid, code)
if(intid ==33) then
player:GossipSetText(string.format("carlin deleta isso aqui pfv"))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF800000Voltar",0,3)
player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
 
 
if(intid == 300) then
player:GossipSetText(string.format("Main-Hand Enchantments."))

player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (2000 3x3 Rating)",0, 472, false, "")
player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2000 3x3 Rating)",0, 482, false, "")
player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)\n",0, 1003)
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if(intid == 472) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4012)
player:GossipComplete()
end
end

if(intid == 482) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4013)
player:GossipComplete()
end
end

if(intid == 1003) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 0)
player:GossipComplete()
end
end


if(intid == 302) then
player:GossipSetText(string.format("Off-Hand Enchantments."))

player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny (2000 3x3 Rating)",0, 538, false, "")
player:GossipMenuAddItem(6,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny (2000 3x3 Rating)",0, 552, false, "")
player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)\n",0, 1002)
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if(intid == 538) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4012)
player:GossipComplete()
end
end

if(intid == 552) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4013)
player:GossipComplete()
end
end

if(intid == 1002) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 0)
player:GossipComplete()
end
end


if(intid ==34) then
player:GossipSetText(string.format(" "))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF800000Voltar",0,998)
player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t |cFF800000Remover Morph",0, 1000)

player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_character_bloodelf_male:27|t Visual Morph |cff0000ffBlood Elf Male",0, 90, false, "")

player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
if (intid == 90) then
if not (player:IsInCombat() or player:GetMap():IsArena()) then
player:SetDisplayId(20368)
player:SetScale(1)
player:GossipComplete()
end
end

if(intid ==35) then
player:GossipSetText(string.format(" "))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF800000Voltar",0,998)
player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_holy_dispelmagic:27|t |cFF800000Remover Auras",0, 1001)
player:GossipMenuAddItem(3,"|TInterface\\icons\\spell_nature_lightning:27|t Visual Aura - |cff0000ffEmpower",0, 104, false, "")
player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
if(intid == 104) then
player:CastSpell(player, 49411, true)
player:GossipComplete()
end

 
if (intid == 1001) then
player:RemoveAura(49411)
player:RemoveAura(51589)
player:RemoveAura(51394)
player:RemoveAura(51194)
player:RemoveAura(61392)
player:RemoveAura(72100)
player:RemoveAura(47840)
player:RemoveAura(52855)
player:RemoveAura(52952)
player:RemoveAura(55474)
player:RemoveAura(46679)
player:SendNotification("Auras removidas com sucesso..")
player:GossipComplete()
end
 
if (intid == 998) then
On_Gossip_Select(unit, player, creature)
end
 
if (intid == 999) then
player:GossipComplete()
end
 
if(intid == 1000) then
player:DeMorph()
player:SetScale(1)
player:SendBroadcastMessage("Seu morph foi removido, voltou a sua forma original..")
player:GossipComplete()
end
end
 
RegisterCreatureGossipEvent(NpcId, 1, On_Gossip_Select)
RegisterCreatureGossipEvent(NpcId, 2, On_Gossip_Open)