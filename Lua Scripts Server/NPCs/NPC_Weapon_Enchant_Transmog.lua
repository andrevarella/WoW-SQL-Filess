local NpcId = 190065;
local NpcIdSmall = 94164;
local itemVIP = 83550
 
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
	player:GossipSetText(string.format("Sistema Vip para customizar o visual do |cff0000ffEnchant|r da sua arma.\n\nOs |cff0000ffEnchants|r PvP não necessitam de Vip, mas de Arena Rating."))
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_01:27|t Main Hand |cff0000ffWeapon Enchant",0, 300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_67:27|t Off Hand |cff0000ffWeapon Enchant",0, 302)

	player:GossipMenuAddItem(9," ",0, 999)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_01:27|t Main Hand |cff0000ffWeapon Enchant PvP",0, 700)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_sword_67:27|t Off Hand |cff0000ffWeapon Enchant PvP",0, 701)
	if player:IsGMVisible() then -- Disponivel apenas para GMs
        player:GossipMenuAddItem(3, "\nIDs de Achievements [Apenas p GM]", 0, 702)
    end
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
 
 
local function On_Gossip_Open(event, player, creature, sender, intid, code)
	if(intid ==33) then
end
 
 
-- Weapon Enchant (Main Hand) - Menu de Cores
if(intid == 300) then
	if (player:HasItem(itemVIP) == false) then
		player:SendBroadcastMessage("Você precisa do Livro Vip para usar essa função.")
		player:GossipComplete()
	else
		player:GossipSetText(string.format("Main-Hand Visual Enchants"))
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,998)
		player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)",0, 1003)
		player:GossipMenuAddItem(9,"Visual Enchants - |cffffffffWhite|r",0,605)
		player:GossipMenuAddItem(9,"Visual Enchants - |cff0000ffBlue|r",0,606)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFF800080Purple|r",0,607)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFFFF0000Red|r",0,608)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFFFF4500Orange|r",0,609)
		player:GossipMenuAddItem(9,"Visual Enchants - |cffffff00Yellow|r",0,610)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFF008000Green|r",0,611)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
end

-- Remover Enchant Visual (Main Hand)
if(intid == 1003) then
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 0)
		player:SendBroadcastMessage("Relogue para restaurar o visual original do enchant equipado na sua main hand weapon.")
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para remover o Enchant.")
		player:GossipComplete()
	end
end


if(intid == 605) then -- Main-Hand White
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cffffffffWhite|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
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
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_parry:27|t Sharpened",0, 488, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 450) then -- Crusader
local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 1900)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 122) then -- Battlemaster
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 2675)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 117) then -- Deathfrost
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3273)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 129) then -- Icy Weapon
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 1894)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 451) then -- AP vs Undead
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3093)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 454) then -- Avalanche
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4014)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 455) then -- Winter's Grasp
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4015)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 118) then -- Executioner
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3225)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 452) then -- Windwalk
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4005)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 453) then -- Elemental Slayer
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4008)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 488) then -- Sharpened
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 13)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 606) then -- Main-Hand Blue
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cff0000ffBlue|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
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
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostbrand:27|t Frostbrand II",0, 486, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Windfury",0, 485, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
if(intid == 459) then -- Wraithchill
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4006)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 126) then -- Mongoose
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 2673)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 456) then -- Mark of the Thunderlord
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4010)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 457) then -- Colossus
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4011)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 458) then -- Blade Ward
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3869)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 460) then -- Heartsong
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 1896)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 461) then -- Soulfrost
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 26)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 462) then -- River's Song
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4024)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 463) then -- Jade Spirit
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4023)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 116) then -- Greater Spell Power
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3854)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 464) then -- Rune of Razorice
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 25)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 133) then -- Frostbrand
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 2672)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 485) then -- Windfury
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 283)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

--[[
--player:GossipMenuAddItem(9,"test 4030",0, 600, false, "")
--player:GossipMenuAddItem(9,"test 4031",0, 601, false, "")
--player:GossipMenuAddItem(9,"test 4032",0, 602, false, "")
--player:GossipMenuAddItem(9,"test 4033",0, 603, false, "")
--player:GossipMenuAddItem(9,"test 4034",0, 604, false, "")
--player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostblast:27|t |cff0000ffWraithchill",0, 459, false, "")
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
--]]


if(intid == 607) then -- Main-Hand Purple
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cFF800080Purple|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Chronos",0, 465, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Blackrock",0, 466, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Shadowmoon (WoD)",0, 467, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Mark of Shadowmoon",0, 468, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Netherflame",0, 469, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 465) then -- Chronos
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4016)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 466) then -- Mark of Blackrock
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4017)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 467) then -- Mark of Shadowmoon (WoD)
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 4025)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 468) then -- Mark of Shadowmoon
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 1743)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 469) then -- Mark of Netherflame
	local item = player:GetEquippedItemBySlot(15)
	if(player:GetEquippedItemBySlot(15)) then
		setVisual(player, item, 3855)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 608) then -- Main-Hand Red
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cFFFF0000Red|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Nightmare",0, 470, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Sinwrath",0, 471, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Berserking",0, 115, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Attack Power",0, 473, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Blood Draining",0, 119, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 470) then -- Nightmare
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4004)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 471) then -- Sinwrath
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4026)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 115) then -- Berserking
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3789)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 473) then -- Attack Power
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1606)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 119) then -- Blood Draining
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3870)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 609) then -- Main-Hand Orange
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cFFFF4500Orange|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF0000Power Torrent (Static Flames)",0, 472, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Power Torrent",0, 475, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_retributionaura:27|t |cFFFF4500Flames of Ragnaros",0, 474, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_dualwieldspecialization:27|t |cFFFF4500Elemental Force",0, 476, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Fiery Weapon",0, 136, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flametounge:27|t Flametongue",0, 487, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 472) then -- Power Torrent(Flames only)
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4027)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 475) then -- Power Torrent
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4000)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 474) then -- Flames of Ragnaros
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4021)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 476) then -- Elemental Force
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4001)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 136) then -- Fiery Weapon
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 803)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 487) then -- Flametongue
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


if(intid == 610) then -- Main-Hand Yellow
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cffffff00Yellow|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_summonlightwell:27|t |cffffff00Sunfire",0, 477, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_earthquake:27|t |cffffff00Landslide",0, 478, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Light of the Earth-Warder",0, 479, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Titanguard",0, 480, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_paladin_divinestorm:27|t |cffffff00Spirit",0, 481, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Spell Power II",0, 127, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Rockbiter",0, 484, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if(intid == 477) then -- Sunfire
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2671)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 478) then -- Landslide
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4002)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 479) then -- Light of the Earth-Warder
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4020)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 480) then --Titanguard
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3846)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 481) then --Spirit
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1903)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 127) then -- Spell Power II
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2343)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 484) then -- Rockbiter
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


if(intid == 611) then -- Main-Hand Green
	player:GossipSetText(string.format("Main-Hand Visual Enchant - |cFF008000Green|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,300)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Breath of Yu'lon",0, 483, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Earthliving",0, 132, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Agility",0, 131, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_shaman_earthlivingweapon:27|t |cFF008000Unholy Weapon",0, 120, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_rogue_dualweild:27|t Deadly Poison",0, 489, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 483) then -- Breath of Yu'lon
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 4019)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 132) then -- Earthliving
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 3345)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 131) then -- Agility
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1103)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 120) then -- Unholy Weapon
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 1899)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 486) then -- Frostbrand II
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 2)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 489) then -- Deadly Poison
local item = player:GetEquippedItemBySlot(15)
if(player:GetEquippedItemBySlot(15)) then
setVisual(player, item, 7)
player:GossipComplete()
else
		player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


--
-- Weapon Enchant (Off Hand) - Menu de Cores
if(intid == 302) then
	if (player:HasItem(itemVIP) == false) then
		player:SendBroadcastMessage("Você precisa do Livro Vip para usar essa função.")
		player:GossipComplete()
	else
		player:GossipSetText(string.format("Off-Hand Visual Enchants"))
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,998)
		player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)",0, 1002)
		player:GossipMenuAddItem(9,"Visual Enchants - |cffffffffWhite|r",0,612)
		player:GossipMenuAddItem(9,"Visual Enchants - |cff0000ffBlue|r",0,613)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFF800080Purple|r",0,614)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFFFF0000Red|r",0,615)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFFFF4500Orange|r",0,616)
		player:GossipMenuAddItem(9,"Visual Enchants - |cffffff00Yellow|r",0,617)
		player:GossipMenuAddItem(9,"Visual Enchants - |cFF008000Green|r",0,618)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
	end
end


-- Remover Enchant Visual (Off Hand)
if(intid == 1002) then
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 0)
		player:SendBroadcastMessage("Relogue para restaurar o visual original do enchant equipado na sua off hand weapon.")
		player:GossipComplete()
	else 
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para remover o Enchant.")
		player:GossipComplete()
	end
end


if(intid == 612) then -- Off-Hand White
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cffffffffWhite|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
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
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_parry:27|t Sharpened",0, 562, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 501) then -- Crusader Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1900)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 502) then -- Battlemaster Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2675)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 503) then -- Deathfrost Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3273)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 504) then -- Icy Weapon Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1894)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 505) then -- AP vs Undead Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3093)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 506) then -- Avalanche Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4014)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 507) then -- Winter's Grasp Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4015)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 508) then -- Executioner Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3225)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 509) then -- Windwalk Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4005)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 510) then -- Elemental Slayer Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4008)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 562) then -- Sharpened Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 13)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 613) then -- Off-Hand Blue
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cff0000ffBlue|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
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
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_frost_frostbrand:27|t Frostbrand II",0, 560, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Windfury",0, 559, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 511) then -- Wraithchill
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4006)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 512) then -- Mongoose
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2673)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 513) then -- Mark of the Thunderlord
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4010)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 514) then -- Colossus
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4011)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 515) then -- Blade Ward
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3869)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 516) then -- Heartsong
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1896)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 517) then -- Soulfrost
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 26)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 518) then -- River's Song
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4024)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 519) then -- Jade Spirit
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4023)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 520) then -- Greater Spell Power
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3854)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 521) then -- Rune of Razorice
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 25)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 522) then -- Frostbrand
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2672)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 560) then
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 559) then -- Windfury
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 283)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


if(intid == 614) then -- Off-Hand Purple
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cFF800080Purple|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Chronos",0, 531, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Blackrock",0, 532, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_arcane_arcane04:27|t |cFF800080Mark of Shadowmoon (WoD)",0, 533, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Mark of Shadowmoon",0, 534, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_shadow_ritualofsacrifice:27|t |cFF800080Netherflame",0, 535, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if(intid == 531) then -- Chronos Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4016)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 532) then -- Blackrock Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4017)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 533) then -- Shadowmoon(WoD) Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4025)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 534) then -- Mark of Shadowmoon Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1743)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 535) then -- Netherflame Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3855)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 615) then -- Off-Hand Red
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cFFFF0000Red|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Nightmare",0, 536, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Sinwrath",0, 537, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Berserking",0, 539, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_deathknight_butcher:27|t |cFFFF0000Attack Power",0, 540, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Blood Draining",0, 543, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 536) then -- Nightmare Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4004)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 537) then -- Sinwrath Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4026)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 539) then -- Berserking
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3789)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 540) then -- Attack Power
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1606)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 543) then -- Blood Draining
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3870)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 616) then -- Off-Hand Orange
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cFFFF4500Orange|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF0000Power Torrent (Static Flames)",0, 538, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Power Torrent",0, 542, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_retributionaura:27|t |cFFFF4500Flames of Ragnaros",0, 541, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_dualwieldspecialization:27|t |cFFFF4500Elemental Force",0, 545, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flameblades:27|t |cFFFF4500Fiery Weapon",0, 544, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_fire_flametounge:27|t Flametongue",0, 561, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 538) then -- Power Torrent (Static) - Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4027)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 542) then -- Power Torrent
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4000)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 541) then -- Flames of Ragnaros
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4021)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 545) then -- Elemental Force
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4001)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 544) then -- Fiery Weapon
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 803)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 561) then -- Flametongue
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


if(intid == 617) then -- Off-Hand Yellow
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cffffff00Yellow|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_summonlightwell:27|t |cffffff00Sunfire",0, 546, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_nature_earthquake:27|t |cffffff00Landslide",0, 547, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Light of the Earth-Warder",0, 548, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_searinglight:27|t |cffffff00Titanguard",0, 549, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_paladin_divinestorm:27|t |cffffff00Spirit",0, 550, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Spell Power II",0, 557, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Spell_holy_removecurse:27|t Rockbiter",0, 558, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if(intid == 546) then -- Sunfire Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2671)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 547) then -- Landslide Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4002)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 548) then -- Light of the Earth-Warder Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 4020)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 549) then -- Titanguard Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 3846)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 550) then -- Spirit Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1903)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 557) then -- Spell Power II Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 2343)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 558) then -- Rockbiter Off
local item = player:GetEquippedItemBySlot(16)
if(player:GetEquippedItemBySlot(16)) then
setVisual(player, item, 1)
player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end

if(intid == 618) then -- Off-Hand Green
	player:GossipSetText(string.format("Off-Hand Visual Enchant - |cFF008000Green|r"))
	player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:22:22:0:0|t Voltar",0,302)
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Breath of Yu'lon",0, 553, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Earthliving",0, 554, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_axe_15:27|t |cFF008000Agility",0, 555, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\spell_shaman_earthlivingweapon:27|t |cFF008000Unholy Weapon",0, 556, false, "")
	player:GossipMenuAddItem(9,"|TInterface\\icons\\Ability_rogue_dualweild:27|t Deadly Poison",0, 563, false, "")
	player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if(intid == 553) then -- Breath of Yu'lon
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 4019)
	player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 554) then -- Earthliving Off
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 3345)
	player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 555) then -- Agility Off
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 1103)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 556) then -- Unholy Weapon Off
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 1899)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end
if(intid == 563) then -- Deadly Poison Off
	local item = player:GetEquippedItemBySlot(16)
	if(player:GetEquippedItemBySlot(16)) then
		setVisual(player, item, 7)
		player:GossipComplete()
	else
		player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
		player:GossipComplete()
	end
end


-- PvP Enchants:
-- Main Hand PvP Enchants
if(intid == 700) then
    player:GossipSetText(string.format("Main-Hand PvP Enchantments."))
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny |cFF000000(|cFFFFFF002000 Rating 2v2|cFF000000)",0, 750)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny |cFF000000(|cFFFFFF002000 Rating 3v3|cFF000000)\n",0, 751)
    player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Main Hand)\n",0, 1003)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end
-- OFF Hand PvP Enchants
if(intid == 701) then
    player:GossipSetText(string.format("Off-Hand PvP Enchantments."))
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_rod_enchantedfelsteel:27|t |cFF008000Demonic Tyranny |cFF000000(|cFFFFFF002000 Rating 3v3|cFF000000)",0, 752)
    player:GossipMenuAddItem(9,"|TInterface\\icons\\Inv_spear_09:27|t |cFFFF0000Glorious Tyranny |cFF000000(|cFFFFFF002000 Rating 3v3|cFF000000)\n",0, 753)
    player:GossipMenuAddItem(5,"|TInterface\\icons\\spell_holy_dispelmagic:27|t Remover Enchant Visual (Off Hand)\n",0, 1002)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- Glorious Tiranny Main Hand
if(intid == 751) then
	if player:HasAchieved(405) then --     -- Verifica se o jogador possui o achievement ID 405
		local item = player:GetEquippedItemBySlot(15)
		if(player:GetEquippedItemBySlot(15)) then
			setVisual(player, item, 4012)
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
			player:GossipComplete()
		end
	else
		player:SendBroadcastMessage("É necessário o achievement de 2000 de rating em 3v3 para adicionar esse enchant.")
		player:GossipComplete()
	end
-- Demonic Tiranny Main Hand
elseif(intid == 750) then
	if(player:HasAchieved(401)) then
		local item = player:GetEquippedItemBySlot(15)
		if(player:GetEquippedItemBySlot(15)) then
			setVisual(player, item, 4013)
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Você não tem uma Main Hand equipada para adicionar o Enchant Visual.")
			player:GossipComplete()
		end
	else
		player:SendBroadcastMessage("É necessário o achievement de 2000 de rating em 2v2 para adicionar esse enchant.")
		player:GossipComplete()
	end
-- Glorious Tiranny Off Hand
elseif(intid == 753) then
	if(player:HasAchieved(405)) then
		local item = player:GetEquippedItemBySlot(16)
		if(player:GetEquippedItemBySlot(16)) then
			setVisual(player, item, 4012)
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
			player:GossipComplete()
		end
	else
		player:SendBroadcastMessage("É necessário o achievement de 2000 de rating em 3v3 para adicionar esse enchant.")
		player:GossipComplete()
	end
-- Demonic Tiranny Off Hand
elseif(intid == 752) then
	if(player:HasAchieved(401)) then
		local item = player:GetEquippedItemBySlot(16)
		if(player:GetEquippedItemBySlot(16)) then
			setVisual(player, item, 4013)
			player:GossipComplete()
		else
			player:SendBroadcastMessage("Você não tem uma Off Hand equipada para adicionar o Enchant Visual.")
			player:GossipComplete()
		end
	else
		player:SendBroadcastMessage("É necessário o achievement de 2000 de rating em 2v2 para adicionar esse enchant.")
		player:GossipComplete()
	end

elseif intid == 702 then
   --player:GossipSetText(string.format("Para add achiev é:\n .Achiev add (Id) \n\n2v2:       Id Achievement:\n2000 = 401\n2200 = 1159\n2400 = 10036\n2700 = 10037\n3000 = 10046\n\n3v3:\n2000 = 405\n2200 = 1160\n2400 = 10038\n2700 = 13039\n3000 = 10047"))
   player:GossipSetText(string.format("Para add achiev é:\n .Achiev add (Id) \n\n2v2:       Id Achievement:\n |cFFFFFF002000|r = 401\n |cFFFFFF002200|r = 1159\n |cFFFFFF002400|r = 10036\n |cFFFFFF002700|r = 10037\n |cFFFFFF003000|r = 10046\n\n3v3:\n |cFFFFFF002000|r = 405\n |cFFFFFF002200|r = 1160\n |cFFFFFF002400|r = 10038\n |cFFFFFF002700|r = 13039\n |cFFFFFF003000|r = 10047"))
   player:GossipMenuAddItem(7,"Mostrar ids no chat\n",0,703)
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:19:19:0:0|t Voltar\n",0,998)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)



elseif intid == 703 then
   player:SendBroadcastMessage("      2v2 Ids:\n 2000 = 401\n 2200 = 1159\n 2400 = 10036\n 2700 = 10037\n 3000 = 10046\n      3v3 Ids:\n 2000 = 405\n 2200 = 1160\n 2400 = 10038\n 2700 = 13039\n 3000 = 10047")
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
   player:GossipComplete()

 
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
 

 --[[
Isso é um comentário  -- para "bloquear" varias linhas em lua utiliza: (em c++ é /* */)
de bloco em Lua
--]]
 
 
elseif (intid == 999) then
   player:GossipComplete()	

 
elseif (intid == 998) then
	On_Gossip_Select(unit, player, creature)
	end
end
 
RegisterCreatureGossipEvent(NpcId, 1, On_Gossip_Select)
RegisterCreatureGossipEvent(NpcId, 2, On_Gossip_Open)

RegisterCreatureGossipEvent(NpcIdSmall, 1, On_Gossip_Select)
RegisterCreatureGossipEvent(NpcIdSmall, 2, On_Gossip_Open)