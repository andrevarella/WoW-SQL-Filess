local NpcId = 190065;
 
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
player:GossipSetText(string.format("Sistema vip para customizar o visual do |cff0000ffenchant |cFF000000da sua arma."))
player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_01:27|t Main Hand |cff0000ffWeapon Enchant",0, 300)
player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_67:27|t Off Hand |cff0000ffWeapon Enchant",0, 302)
player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
 
local function On_Gossip_Open(event, player, creature, sender, intid, code)
if(intid ==33) then
end
 
 
-- Weapon Enchant (Main Hand) - Enchants Cor Branco e Azul
if(intid == 300) then
player:GossipSetText(string.format("Main-Hand Enchantments de cores |cffffffffBranca |cFF000000e |cff0000ffAzul."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
-- Ir para pagina 2/3
player:GossipMenuAddItem(3,"|TInterface\\icons\\Inv_inscription_parchment:25|t Proxima Página (1/3) ",0, 440)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)",0, 1003)

--player:GossipMenuAddItem(9,"test 4030",0, 600, false, "")
--player:GossipMenuAddItem(9,"test 4031",0, 601, false, "")
--player:GossipMenuAddItem(9,"test 4032",0, 602, false, "")
--player:GossipMenuAddItem(9,"test 4033",0, 603, false, "")
--player:GossipMenuAddItem(9,"test 4034",0, 604, false, "")
--player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostblast:27|t |cff0000ffWraithchill",0, 459, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_jewelry_talisman_07:27|t |cffffffffCrusader",0, 450, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_jewelry_talisman_07:27|t |cffffffffBattlemaster",0, 122, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffDeathfrost",0, 117, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffIcy Weapon",0, 129, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffAP vs Undead",0, 451, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostward:27|t |cffffffffAvalanche",0, 454, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostward:27|t |cffffffffWinter's Grasp",0, 455, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_warrior_shatteringthrow:27|t |cffffffffExecutioner",0, 118, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_mindtwisting:27|t |cffffffffWindwalk",0, 452, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shaman_improvedstormstrike:27|t |cffffffffElemental Slayer",0, 453, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostblast:27|t |cff0000ffWraithchill",0, 459, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_lightningoverload:27|t |cff0000ffMongoose",0, 126, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_lightningoverload:27|t |cff0000ffMark of the Thunderlord",0, 456, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_20:27|t |cff0000ffColossus",0, 457, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_20:27|t |cff0000ffBlade Ward",0, 458, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffHeartsong",0, 460, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffSoulfrost",0, 461, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffRiver's Song",0, 462, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_14:27|t |cff0000ffJade Spirit",0, 463, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_bluefire:27|t |cff0000ffGreater Spell Power",0, 116, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_empowerruneblade2:27|t |cff0000ffRune of Razorice",0, 464, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_ice_magicdamage:27|t |cff0000ffFrostbrand",0, 133, false, "")


player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- test wraithchills estatico, as particulas vao apenas p cima e p baixo
if(intid == 600) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4030)
player:GossipComplete()
end
end
-- test wraithchills Ok, as particulas vao p esquerda
if(intid == 601) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4031)
player:GossipComplete()
end
end
-- test wraithchills ok, as particulas vao p direita
if(intid == 602) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4032)
player:GossipComplete()
end
end
-- test wraithchills ok, p direita tbm (na ponta a particula e maior)
if(intid == 603) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4033)
player:GossipComplete()
end
end
-- test wraithchills ok, particula p esquerda e na ponta p direita
if(intid == 604) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4034)
player:GossipComplete()
end
end


if(intid == 450) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1900)
player:GossipComplete()
end
end

if(intid == 122) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2675)
player:GossipComplete()
end
end

if(intid == 117) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3273)
player:GossipComplete()
end
end

if(intid == 129) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1894)
player:GossipComplete()
end
end

if(intid == 451) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3093)
player:GossipComplete()
end
end

if(intid == 452) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4005)
player:GossipComplete()
end
end

if(intid == 453) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4008)
player:GossipComplete()
end
end

if(intid == 126) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2673)
player:GossipComplete()
end
end

if(intid == 118) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3225)
player:GossipComplete()
end
end

if(intid == 454) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4014)
player:GossipComplete()
end
end

if(intid == 455) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4015)
player:GossipComplete()
end
end

if(intid == 456) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4010)
player:GossipComplete()
end
end

if(intid == 457) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4011)
player:GossipComplete()
end
end

if(intid == 458) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3869)
player:GossipComplete()
end
end


if(intid == 459) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4006)
player:GossipComplete()
end
end

if(intid == 460) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1896)
player:GossipComplete()
end
end

if(intid == 461) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 26)
player:GossipComplete()
end
end

if(intid == 462) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4024)
player:GossipComplete()
end
end

if(intid == 463) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4023)
player:GossipComplete()
end
end

if(intid == 116) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3854)
player:GossipComplete()
end
end

if(intid == 464) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 25)
player:GossipComplete()
end
end

if(intid == 133) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2672)
player:GossipComplete()
end
end

-- Weapon Enchant (Main Hand) - Enchants Cor Roxo, Vermelho, Laranja e Amarelo (pagina 2/3)
if(intid == 440) then
player:GossipSetText(string.format("Main-Hand Enchantments de cores |cFF800080Roxo, |cFFFF0000Vermelho, |cFFFF4500Laranja |cFF000000e |cffffff00Amarelo."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,300)
player:GossipMenuAddItem(3,"|TInterface\\icons\\Inv_inscription_parchment:25|t Proxima Página (2/3)",0, 441)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)",0, 1003)

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Chronos",0, 465, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Blackrock",0, 466, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Shadowmoon (WoD)",0, 467, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Mark of Shadowmoon",0, 468, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Netherflame",0, 469, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Nightmare",0, 470, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Sinwrath",0, 471, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Power Torrent (Flames)",0, 472, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Berserking",0, 115, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Attack Power",0, 473, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_retributionaura:27|t |cFFFF4500Flames of Ragnaros",0, 474, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Power Torrent",0, 475, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Blood Draining",0, 119, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Fiery Weapon",0, 136, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_dualwieldspecialization:27|t |cFFFF4500Elemental Force",0, 476, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_summonlightwell:27|t |cffffff00Sunfire",0, 477, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_earthquake:27|t |cffffff00Landslide",0, 478, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Light of the Earth-Warder",0, 479, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Titanguard",0, 480, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_paladin_divinestorm:27|t |cffffff00Spirit",0, 481, false, "")

player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 465) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4016)
player:GossipComplete()
end
end
if(intid == 466) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4017)
player:GossipComplete()
end
end
if(intid == 467) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4025)
player:GossipComplete()
end
end
if(intid == 468) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1743)
player:GossipComplete()
end
end
if(intid == 469) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3855)
player:GossipComplete()
end
end
if(intid == 470) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4004)
player:GossipComplete()
end
end
if(intid == 471) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4026)
player:GossipComplete()
end
end
if(intid == 472) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4027)
player:GossipComplete()
end
end
if(intid == 115) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3789)
player:GossipComplete()
end
end
if(intid == 119) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3870)
player:GossipComplete()
end
end
if(intid == 473) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1606)
player:GossipComplete()
end
end
if(intid == 474) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4021)
player:GossipComplete()
end
end
if(intid == 475) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4000)
player:GossipComplete()
end
end
if(intid == 136) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 803)
player:GossipComplete()
end
end
if(intid == 476) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4001)
player:GossipComplete()
end
end
if(intid == 477) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2671)
player:GossipComplete()
end
end
if(intid == 478) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4002)
player:GossipComplete()
end
end
if(intid == 479) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4020)
player:GossipComplete()
end
end
if(intid == 480) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3846)
player:GossipComplete()
end
end
if(intid == 481) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1903)
player:GossipComplete()
end
end

-- Weapon Enchant (Main Hand) Pagina 3/3 - Enchants Cor Verde
if(intid == 441) then
player:GossipSetText(string.format("Main-Hand Enchantments de cor |cFF008000Verde."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,440)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual(Main Hand)",0, 1003)

-- player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny - Temporario",0, 482, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Breath of Yu'lon",0, 483, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Earthliving",0, 132, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Agility",0, 131, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_shaman_earthlivingweapon:27|t |cFF008000Unholy Weapon",0, 120, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Spell Power II",0, 127, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Rockbiter",0, 484, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Windfury",0, 485, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostbrand:27|t Frostbrand II",0, 486, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flametounge:27|t Flametongue",0, 487, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_parry:27|t Sharpened",0, 488, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_rogue_dualweild:27|t Deadly Poison",0, 489, false, "")

player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 482) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4013)
player:GossipComplete()
end
end
if(intid == 483) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4019)
player:GossipComplete()
end
end
if(intid == 132) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3345)
player:GossipComplete()
end
end
if(intid == 131) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1103)
player:GossipComplete()
end
end
if(intid == 120) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1899)
player:GossipComplete()
end
end
if(intid == 127) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2343)
player:GossipComplete()
end
end
if(intid == 484) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1)
player:GossipComplete()
end
end
if(intid == 485) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 283)
player:GossipComplete()
end
end
if(intid == 486) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2)
player:GossipComplete()
end
end
if(intid == 487) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3)
player:GossipComplete()
end
end
if(intid == 488) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 13)
player:GossipComplete()
end
end
if(intid == 489) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 7)
player:GossipComplete()
end
end

if(intid == 1003) then
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 0)
player:SendBroadcastMessage("Relogue para restaurar o visual do enchant equipado na sua main hand weapon.")
player:GossipComplete()
end
end


-- Weapon Enchant (Off Hand) Pagina 1/3 - Enchants Cor Branco e Azul
if(intid == 302) then
player:GossipSetText(string.format("Off-Hand Enchantments de cores |cffffffffBranca |cFF000000e |cff0000ffAzul."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
player:GossipMenuAddItem(3,"|TInterface\\icons\\Inv_inscription_parchment:25|t Proxima Página (1/3) ",0, 530)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)",0, 1002)


player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_jewelry_talisman_07:27|t |cffffffffCrusader",0, 501, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_jewelry_talisman_07:27|t |cffffffffBattlemaster",0, 502, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffDeathfrost",0, 503, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffIcy Weapon",0, 504, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_shootwand:27|t |cffffffffAP vs Undead",0, 505, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostward:27|t |cffffffffAvalanche",0, 506, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostward:27|t |cffffffffWinter's Grasp",0, 507, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_warrior_shatteringthrow:27|t |cffffffffExecutioner",0, 508, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_mindtwisting:27|t |cffffffffWindwalk",0, 509, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shaman_improvedstormstrike:27|t |cffffffffElemental Slayer",0, 510, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostblast:27|t |cff0000ffWraithchill",0, 511, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_lightningoverload:27|t |cff0000ffMongoose",0, 512, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_lightningoverload:27|t |cff0000ffMark of the Thunderlord",0, 513, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_20:27|t |cff0000ffColossus",0, 514, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_20:27|t |cff0000ffBlade Ward",0, 515, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffHeartsong",0, 516, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffSoulfrost",0, 517, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_mace_25:27|t |cff0000ffRiver's Song",0, 518, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_staff_14:27|t |cff0000ffJade Spirit",0, 519, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_bluefire:27|t |cff0000ffGreater Spell Power",0, 520, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_empowerruneblade2:27|t |cff0000ffRune of Razorice",0, 521, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_ice_magicdamage:27|t |cff0000ffFrostbrand",0, 522, false, "")

player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 501) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1900)
player:GossipComplete()
end
end

if(intid == 502) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2675)
player:GossipComplete()
end
end

if(intid == 503) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3273)
player:GossipComplete()
end
end

if(intid == 504) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1894)
player:GossipComplete()
end
end

if(intid == 505) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3093)
player:GossipComplete()
end
end

if(intid == 506) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4014)
player:GossipComplete()
end
end

if(intid == 507) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4015)
player:GossipComplete()
end
end

if(intid == 508) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3225)
player:GossipComplete()
end
end

if(intid == 509) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4005)
player:GossipComplete()
end
end

if(intid == 510) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4008)
player:GossipComplete()
end
end

if(intid == 511) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4006)
player:GossipComplete()
end
end

if(intid == 512) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2673)
player:GossipComplete()
end
end

if(intid == 513) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4010)
player:GossipComplete()
end
end

if(intid == 514) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4011)
player:GossipComplete()
end
end

if(intid == 515) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3869)
player:GossipComplete()
end
end

if(intid == 516) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1896)
player:GossipComplete()
end
end

if(intid == 517) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 26)
player:GossipComplete()
end
end

if(intid == 518) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4024)
player:GossipComplete()
end
end

if(intid == 519) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4023)
player:GossipComplete()
end
end

if(intid == 520) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3854)
player:GossipComplete()
end
end

if(intid == 521) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 25)
player:GossipComplete()
end
end

if(intid == 522) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2672)
player:GossipComplete()
end
end
 
-- Weapon Enchant (Off Hand) Pagina 2/3 - Enchants Cor Roxo, Vermelho, Laranja e Amarelo
if(intid == 530) then
player:GossipSetText(string.format("Off Hand Enchantments de cores |cFF800080Roxo, |cFFFF0000Vermelho, |cFFFF4500Laranja |cFF000000e |cffffff00Amarelo."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,302)
player:GossipMenuAddItem(3,"|TInterface\\icons\\Inv_inscription_parchment:25|t Proxima Página (2/3)",0, 551)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)",0, 1002)

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Chronos",0, 531, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Blackrock",0, 532, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Shadowmoon (WoD)",0, 533, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Mark of Shadowmoon",0, 534, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Netherflame",0, 535, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Nightmare",0, 536, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Sinwrath",0, 537, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Power Torrent (Flames)",0, 538, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Berserking",0, 539, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Attack Power",0, 540, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_retributionaura:27|t |cFFFF4500Flames of Ragnaros",0, 541, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Power Torrent",0, 542, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Blood Draining",0, 543, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Fiery Weapon",0, 544, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_dualwieldspecialization:27|t |cFFFF4500Elemental Force",0, 545, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_summonlightwell:27|t |cffffff00Sunfire",0, 546, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_earthquake:27|t |cffffff00Landslide",0, 547, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Light of the Earth-Warder",0, 548, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Titanguard",0, 549, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_paladin_divinestorm:27|t |cffffff00Spirit",0, 550, false, "")

player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 531) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4016)
player:GossipComplete()
end
end
if(intid == 532) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4017)
player:GossipComplete()
end
end
if(intid == 533) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4025)
player:GossipComplete()
end
end
if(intid == 534) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1743)
player:GossipComplete()
end
end
if(intid == 535) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3855)
player:GossipComplete()
end
end
if(intid == 536) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4004)
player:GossipComplete()
end
end
if(intid == 537) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4026)
player:GossipComplete()
end
end
if(intid == 538) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4027)
player:GossipComplete()
end
end
if(intid == 539) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3789)
player:GossipComplete()
end
end
if(intid == 540) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1606)
player:GossipComplete()
end
end
if(intid == 541) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4021)
player:GossipComplete()
end
end
if(intid == 542) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4000)
player:GossipComplete()
end
end
if(intid == 543) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3870)
player:GossipComplete()
end
end
if(intid == 544) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 803)
player:GossipComplete()
end
end
if(intid == 545) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4001)
player:GossipComplete()
end
end
if(intid == 546) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2671)
player:GossipComplete()
end
end
if(intid == 547) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4002)
player:GossipComplete()
end
end
if(intid == 548) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4020)
player:GossipComplete()
end
end
if(intid == 549) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3846)
player:GossipComplete()
end
end
if(intid == 550) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1903)
player:GossipComplete()
end
end

-- Weapon Enchant (Off Hand) Pagina 3/3 - Enchants Cor Verde
if(intid == 551) then
player:GossipSetText(string.format("Off Hand Enchantments de cor |cFF008000Verde."))
player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,530)
player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)",0, 1002)

-- player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny - Temporario",0, 552, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Breath of Yu'lon",0, 553, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Earthliving",0, 554, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Agility",0, 555, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_shaman_earthlivingweapon:27|t |cFF008000Unholy Weapon",0, 556, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Spell Power II",0, 557, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Rockbiter",0, 558, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Windfury",0, 559, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostbrand:27|t Frostbrand II",0, 560, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flametounge:27|t Flametongue",0, 561, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_parry:27|t Sharpened",0, 562, false, "")

player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_rogue_dualweild:27|t Deadly Poison",0, 563, false, "")

player:GossipMenuAddItem(5,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF800000Sair",0,999)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end





if(intid == 552) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4013)
player:GossipComplete()
end
end
if(intid == 553) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4019)
player:GossipComplete()
end
end
if(intid == 554) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3345)
player:GossipComplete()
end
end
if(intid == 555) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1103)
player:GossipComplete()
end
end
if(intid == 556) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1899)
player:GossipComplete()
end
end
if(intid == 557) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2343)
player:GossipComplete()
end
end
if(intid == 558) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1)
player:GossipComplete()
end
end
if(intid == 559) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 283)
player:GossipComplete()
end
end
if(intid == 560) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2)
player:GossipComplete()
end
end
if(intid == 561) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3)
player:GossipComplete()
end
end
if(intid == 562) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 13)
player:GossipComplete()
end
end
if(intid == 563) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 7)
player:GossipComplete()
end
end
 

if(intid == 1002) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 0)
player:SendBroadcastMessage("Relogue para restaurar o visual do enchant equipado na sua off hand weapon.")
player:GossipComplete()
end
end


 
 

-- Codigo para deixar de backup caso precise em outros scripts
-- if(intid == 104) then
-- player:CastSpell(player, 49411, true)
-- player:GossipComplete()
-- end
 
 
if (intid == 998) then
On_Gossip_Select(unit, player, creature)
end
 
if (intid == 999) then
player:GossipComplete()
end
 
end
 
RegisterCreatureGossipEvent(NpcId, 1, On_Gossip_Select)
RegisterCreatureGossipEvent(NpcId, 2, On_Gossip_Open)