local NPC_ID = 94151

playerMap = {}

function SpellIDToTalentandRank(spellID)

    local spellMap = 
	{
		
-- unbreakable will 
[14522] = {talentID = 342, rank = 0},
[14788] = {talentID = 342, rank = 1},
[14789] = {talentID = 342, rank = 2},
[14790] = {talentID = 342, rank = 3},
[14791] = {talentID = 342, rank = 4},

-- twin disciplines
[47586] = {talentID = 1898, rank = 0},
[47587] = {talentID = 1898, rank = 1},
[47588] = {talentID = 1898, rank = 2},
[52802] = {talentID = 1898, rank = 3},
[52803] = {talentID = 1898, rank = 4},

-- silent resolve
[14523] = {talentID = 352, rank = 0},
[14784] = {talentID = 352, rank = 1},
[14785] = {talentID = 352, rank = 2},

-- imp inner fire
[14747] = {talentID = 346, rank = 0},
[14770] = {talentID = 346, rank = 1},
[14771] = {talentID = 346, rank = 2},

-- imp power words fortitude
[14749] = {talentID = 344, rank = 0},
[14767] = {talentID = 344, rank = 1},

-- martyrdom
[14531] = {talentID = 321, rank = 0},
[14774] = {talentID = 321, rank = 1},

-- meditation
[14521] = {talentID = 347, rank = 0},
[14776] = {talentID = 347, rank = 1},
[14777] = {talentID = 347, rank = 2},

-- inner focus 
[14751] = {talentID = 348, rank = 0},

-- imp PWS
[14748] = {talentID = 343, rank = 0},
[14768] = {talentID = 343, rank = 1},
[14769] = {talentID = 343, rank = 2},

-- absolution
[33167] = {talentID = 1769, rank = 0},
[33171] = {talentID = 1769, rank = 1},
[33172] = {talentID = 1769, rank = 2},

-- mental agility
[14520] = {talentID = 341, rank = 0},
[14780] = {talentID = 341, rank = 1},
[14781] = {talentID = 341, rank = 2},

-- imp mana burn
[14750] = {talentID = 350, rank = 0},
[14772] = {talentID = 350, rank = 1},

-- reflective shield
[33201] = {talentID = 2268, rank = 0},
[33202] = {talentID = 2268, rank = 1},

-- mental strenght
[18551] = {talentID = 1201, rank = 0},
[18552] = {talentID = 1201, rank = 1},
[18553] = {talentID = 1201, rank = 2},
[18554] = {talentID = 1201, rank = 3},
[18555] = {talentID = 1201, rank = 4},

-- soul warding
[63574] = {talentID = 351, rank = 0},

-- focused power
[33186] = {talentID = 1771, rank = 0},
[33190] = {talentID = 1771, rank = 1},

-- enlightenment
[34908] = {talentID = 1772, rank = 0},
[34909] = {talentID = 1772, rank = 1},
[34910] = {talentID = 1772, rank = 2},

-- focused will
[45234] = {talentID = 1858, rank = 0},
[45243] = {talentID = 1858, rank = 1},
[45244] = {talentID = 1858, rank = 2},

-- power infusion
[10060] = {talentID = 322, rank = 0},

-- imp flash heal
[63504] = {talentID = 1773, rank = 0},
[63505] = {talentID = 1773, rank = 1},
[63506] = {talentID = 1773, rank = 2},

-- renewed hope
[57470] = {talentID = 2235, rank = 0},
[57472] = {talentID = 2235, rank = 1},

-- rapture
[47535] = {talentID = 1896, rank = 0},
[47536] = {talentID = 1896, rank = 1},
[47537] = {talentID = 1896, rank = 2},

-- aspiration
[47507] = {talentID = 1894, rank = 0},
[47508] = {talentID = 1894, rank = 1},

-- divine aegis
[47509] = {talentID = 1895, rank = 0},
[47511] = {talentID = 1895, rank = 1},
[47515] = {talentID = 1895, rank = 2},

-- PS
[33206] = {talentID = 1774, rank = 0},

-- grace
[47516] = {talentID = 1901, rank = 0},
[47517] = {talentID = 1901, rank = 1},

-- borrowed time
[52795] = {talentID = 1202, rank = 0},
[52797] = {talentID = 1202, rank = 1},
[52798] = {talentID = 1202, rank = 2},
[52799] = {talentID = 1202, rank = 3},
[52800] = {talentID = 1202, rank = 4},

-- PENANCE
[47540] = {talentID = 1897, rank = 0},



-- hpriest
-- healing focus
[14913] = {talentID = 410, rank = 0},
[15012] = {talentID = 410, rank = 1},

-- imp renew
[14908] = {talentID = 406, rank = 0},
[15020] = {talentID = 406, rank = 1},
[17191] = {talentID = 406, rank = 2},

-- holy spec
[14889] = {talentID = 401, rank = 0},
[15008] = {talentID = 401, rank = 1},
[15009] = {talentID = 401, rank = 2},
[15010] = {talentID = 401, rank = 3},
[15011] = {talentID = 401, rank = 4},

-- spell warding
[27900] = {talentID = 411, rank = 0},
[27901] = {talentID = 411, rank = 1},
[27902] = {talentID = 411, rank = 2},
[27903] = {talentID = 411, rank = 3},
[27904] = {talentID = 411, rank = 4},

-- divine fury
[18530] = {talentID = 1181, rank = 0},
[18531] = {talentID = 1181, rank = 1},
[18533] = {talentID = 1181, rank = 2},
[18534] = {talentID = 1181, rank = 3},
[18535] = {talentID = 1181, rank = 4},

-- desperate prayer
[19236] = {talentID = 442, rank = 0},

-- blessed recov
[27811] = {talentID = 1636, rank = 0},
[27815] = {talentID = 1636, rank = 1},
[27816] = {talentID = 1636, rank = 2},

-- inspiration
[14892] = {talentID = 361, rank = 0},
[15362] = {talentID = 361, rank = 1},
[15363] = {talentID = 361, rank = 2},

-- holy reach
[27789] = {talentID = 1635, rank = 0},
[27790] = {talentID = 1635, rank = 1},

-- imp healing
[14912] = {talentID = 408, rank = 0},
[15013] = {talentID = 408, rank = 1},
[15014] = {talentID = 408, rank = 2},

-- searing light
[14909] = {talentID = 403, rank = 0},
[15017] = {talentID = 403, rank = 1},

-- healing prayer
[14911] = {talentID = 413, rank = 0},
[15018] = {talentID = 413, rank = 1},

-- spirit of redemp
[20711] = {talentID = 1561, rank = 0},

-- spiritual guidance
[14901] = {talentID = 402, rank = 0},
[15028] = {talentID = 402, rank = 1},
[15029] = {talentID = 402, rank = 2},
[15030] = {talentID = 402, rank = 3},
[15031] = {talentID = 402, rank = 4},

-- surge of light
[33150] = {talentID = 1766, rank = 0},
[33154] = {talentID = 1766, rank = 1},

-- spiritual healing
[14898] = {talentID = 404, rank = 0},
[15349] = {talentID = 404, rank = 1},
[15354] = {talentID = 404, rank = 2},
[15355] = {talentID = 404, rank = 3},
[15356] = {talentID = 404, rank = 4},

-- holy concen
[34753] = {talentID = 1768, rank = 0},
[34859] = {talentID = 1768, rank = 1},
[34860] = {talentID = 1768, rank = 2},

-- lightwell
[724] = {talentID = 1637, rank = 0},

-- blessed resil
[33142] = {talentID = 1765, rank = 0},
[33145] = {talentID = 1765, rank = 1},
[33146] = {talentID = 1765, rank = 2},

-- body and soul
[64127] = {talentID = 2279, rank = 0},
[64129] = {talentID = 2279, rank = 1},

-- emp healing
[33158] = {talentID = 1767, rank = 0},
[33159] = {talentID = 1767, rank = 1},
[33160] = {talentID = 1767, rank = 2},
[33161] = {talentID = 1767, rank = 3},
[33162] = {talentID = 1767, rank = 4},

-- serendipity
[63730] = {talentID = 1904, rank = 0},
[63733] = {talentID = 1904, rank = 1},
[63737] = {talentID = 1904, rank = 2},

-- emp renew
[63534] = {talentID = 1902, rank = 0},
[63542] = {talentID = 1902, rank = 1},
[63543] = {talentID = 1902, rank = 2},

-- circle of helaing
[34861] = {talentID = 1815, rank = 0},

-- test of faith
[47558] = {talentID = 1903, rank = 0},
[47559] = {talentID = 1903, rank = 1},
[47560] = {talentID = 1903, rank = 2},

-- divine providence
[47562] = {talentID = 1905, rank = 0},
[47564] = {talentID = 1905, rank = 1},
[47565] = {talentID = 1905, rank = 2},
[47566] = {talentID = 1905, rank = 3},
[47567] = {talentID = 1905, rank = 4},

-- guardian spirit
[47788] = {talentID = 1911, rank = 0},


-- spriest
-- spirit tap
[15270] = {talentID = 465, rank = 0},
[15335] = {talentID = 465, rank = 1},
[15336] = {talentID = 465, rank = 2},

-- imp spirit tap
[15337] = {talentID = 2027, rank = 0},
[15338] = {talentID = 2027, rank = 1},

-- darkness
[15259] = {talentID = 462, rank = 0},
[15307] = {talentID = 462, rank = 1},
[15308] = {talentID = 462, rank = 2},
[15309] = {talentID = 462, rank = 3},
[15310] = {talentID = 462, rank = 4},

-- shadow affinity
[15318] = {talentID = 466, rank = 0},
[15272] = {talentID = 466, rank = 1},
[15320] = {talentID = 466, rank = 2},

-- imp SWP
[15275] = {talentID = 482, rank = 0},
[15317] = {talentID = 482, rank = 1},

-- shadow focus
[15260] = {talentID = 463, rank = 0},
[15327] = {talentID = 463, rank = 1},
[15328] = {talentID = 463, rank = 2},

-- imp psychic scream
[15392] = {talentID = 542, rank = 0},
[15448] = {talentID = 542, rank = 1},

-- imp mind blast
[15273] = {talentID = 481, rank = 0},
[15312] = {talentID = 481, rank = 1},
[15313] = {talentID = 481, rank = 2},
[15314] = {talentID = 481, rank = 3},
[15316] = {talentID = 481, rank = 4},

-- mind flay
[15407] = {talentID = 501, rank = 0},

-- veiled shadows
[15274] = {talentID = 483, rank = 0},
[15311] = {talentID = 483, rank = 1},

-- shadow reach
[17322] = {talentID = 881, rank = 0},
[17323] = {talentID = 881, rank = 1},

-- shadow weaving
[15257] = {talentID = 461, rank = 0},
[15331] = {talentID = 461, rank = 1},
[15332] = {talentID = 461, rank = 2},

-- silence
[15487] = {talentID = 541, rank = 0},

-- vamp embrace
[15286] = {talentID = 484, rank = 0},

-- imp vamp embrace
[27839] = {talentID = 1638, rank = 0},
[27840] = {talentID = 1638, rank = 1},

-- focused mind
[33213] = {talentID = 1777, rank = 0},
[33214] = {talentID = 1777, rank = 1},
[33215] = {talentID = 1777, rank = 2},

-- mind melt
[14910] = {talentID = 1781, rank = 0},
[33371] = {talentID = 1781, rank = 1},

-- imp DP
[63625] = {talentID = 2267, rank = 0},
[63626] = {talentID = 2267, rank = 1},
[63627] = {talentID = 2267, rank = 2},

-- shadowform
[15473] = {talentID = 521, rank = 0},

-- shadow power
[33221] = {talentID = 1778, rank = 0},
[33222] = {talentID = 1778, rank = 1},
[33223] = {talentID = 1778, rank = 2},
[33224] = {talentID = 1778, rank = 3},
[33225] = {talentID = 1778, rank = 4},

-- imp shadowform
[47569] = {talentID = 1906, rank = 0},
[47570] = {talentID = 1906, rank = 1},

-- misery
[33191] = {talentID = 1816, rank = 0},
[33192] = {talentID = 1816, rank = 1},
[33193] = {talentID = 1816, rank = 2},

-- psychic hororr
[64044] = {talentID = 1908, rank = 0},

-- vamp touch
[34914] = {talentID = 1779, rank = 0},

-- pain and suffering
[47580] = {talentID = 1909, rank = 0},
[47581] = {talentID = 1909, rank = 1},
[47582] = {talentID = 1909, rank = 2},

-- twisted faith
[47573] = {talentID = 1907, rank = 0},
[47577] = {talentID = 1907, rank = 1},
[47578] = {talentID = 1907, rank = 2},
[51166] = {talentID = 1907, rank = 3},
[51167] = {talentID = 1907, rank = 4},

-- dispersion
[47585] = {talentID = 1910, rank = 0},

    }
    return spellMap[spellID]
end



function ApplyTalentsFromStoredTable(player, buildSlot)
    local guid = player:GetGUIDLow()
    local buildSlot = playerMap[guid] -- Recupera o buildSlot do playerMap

    local result = CharDBQuery("SELECT spell FROM custom_save_talents WHERE guid = "..guid.." AND BuildSlot = "..buildSlot)
    if result then
        repeat
            local spellID = result:GetUInt32(0)
            local talentInfo = SpellIDToTalentandRank(spellID)

            if talentInfo then
                player:LearnTalent(talentInfo.talentID, talentInfo.rank)
            end
        until not result:NextRow()
    end
end
function Timer.PeriodicApplyTalents(eventid, delay, repeats, player)
    ApplyTalentsFromStoredTable(player)
end


-- ADICIONAR ITEM VIP
function OnGossipHello(event, player, creature)
	player:SaveToDB()
    player:GossipMenuAddItem(3, " |TInterface\\icons\\Ability_druid_naturalperfection.png:26|t Criar Build", 1, 80) -- Salvar Talents Submenu
	local guid = player:GetGUIDLow()
	local query = "SELECT intid, BuildName FROM custom_save_talents_buildname WHERE guid = "..guid
	local result = CharDBQuery(query)
	if result then
		repeat
			local intid = result:GetUInt32(0)
			local talentName = result:GetString(1)
		    player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_most_damage_killingblow_dieleast.png:26|t  Aplicar Build " .. intid .. " [" .. talentName .. "]", 0, intid + 30)
		until not result:NextRow()
	end
	player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_returnxflags_def_wsg.png:26|t Resetar Talentos", 1, 500, false, "Tem certeza que quer Resetar os Talentos?") -- Reset Talents
	player:GossipMenuAddItem(3, " |TInterface\\icons\\Inv_inscription_minorglyph08.png:26|t Major Glyphs", 1, 100)
	player:GossipMenuAddItem(3, " |TInterface\\icons\\Inv_inscription_majorglyph18.png:26|t Minor Glyphs", 1, 101)
	player:GossipMenuAddItem(3, " Trocar de Spec Instant\n (para ativar Glyphs)", 1, 110)
    player:GossipSendMenu(1, creature)
end


function OnGossipSelect(event, player, creature, sender, intid, code)
	if(intid == 80) then -- Salvar Talents - Submenu
		player:GossipSetText(string.format(" ")) 
		for i = 1, 12 do -- Só mostra 12 Slots
			player:GossipMenuAddItem(3, "|TInterface\\icons\\Ability_druid_naturalperfection.png:26|t Salvar Build - Slot " .. i, 1, i, true, "Digite o nome da Build que você deseja Salvar.\n Exemplos: 'Build PvE' 'DPS 0/59/12' ")
		end
		player:GossipMenuAddItem(9, " \n |TInterface\\icons\\Ability_fiegndead.png:26|t Deletar Builds Salvas", 1, 450, false, "Tem certeza que quer Deletar os Talentos?") -- Adicionando a opção de deletar builds salvas
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)        
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end

	if(intid == 100) then -- Major Glyphs
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowlup:26|t Major Glyphs - Slot Cima", 1, 104)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowleft:26|t Major Glyphs - Slot Esquerdo", 1, 105)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowright:26|t Major Glyphs - Slot Direito", 1, 106)
		player:GossipMenuAddItem(3, " Voltar", 1, 499)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end

	if(intid == 101) then -- Minor Glyphs
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(3, " |TInterface\\icons\\misc_arrowdown:26|t Minor Glyphs - Slot Baixo", 1, 107)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowleft:26|t Minor Glyphs - Slot Esquerdo", 1, 108)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowright:26|t Minor Glyphs - Slot Direito", 1, 109)
		player:GossipMenuAddItem(3, " Voltar", 1, 499)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)    
	end

	if intid == 110 then -- Glyph of Insect Swarm
		OnGossipHello(event, player, creature)
		if player:GetActiveSpec() == 0 then -- Main Spec - Force Switch spec to Save Glyphs
			player:CastSpell(player, 63644, true) -- Activate Secondary Spec
			player:CastSpell(player, 63645, true) -- Activate primary Spec
		elseif player:GetActiveSpec() == 1 then
			player:CastSpell(player, 63645, true)
			player:CastSpell(player, 63644, true)
		end
	end

	--if(intid == 104 and intid == 105 or intid == 106 or intid) then -- Major Glyphs
	if intid >= 104 and intid <= 109 then
		local GlyphSlot
		if intid == 104 then     -- Major Up
			GlyphSlot = 0       
		elseif intid == 105 then -- Major Left
			GlyphSlot = 5
		elseif intid == 106 then -- Major Right
			GlyphSlot = 3
		elseif intid == 107 then -- Minor Down -- Criar outro local só pra minor? (pra nao poder colocar glyph major em slot minor)
			GlyphSlot = 1
		elseif intid == 108 then -- Minor Left
			GlyphSlot = 2
		elseif intid == 109 then -- Minor Right
			GlyphSlot = 4
		end
		player:SetData("GlyphSlot", GlyphSlot) -- Salvando GlyphSlot no player para ser usado em intid 110
	
		if (player:GetClass() == 5) then -- Priest
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Pain Suppression", 1, 111)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11222)
			player:GossipMenuAddItem(3, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
		elseif (player:GetClass() == 1) then -- Warrior
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(3, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
		elseif (player:GetClass() == 11) then -- Druid
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Insect Swarm", 1, 113)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(3, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
		end
	end

	if intid == 111 then -- Glyph of Pain Suppression
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(190, GlyphSlot)
		player:CastSpell(player, 63644, true)
		OnGossipHello(event, player, creature)
	end
	
	if intid == 112 then -- Glyph of Mortal Strike
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(489, GlyphSlot)
		player:CastSpell(player, 63644, true)
		OnGossipHello(event, player, creature)
	end
	
	if intid == 113 then -- Glyph of Insect Swarm
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(176, GlyphSlot)
		OnGossipHello(event, player, creature)
	end
	


   
	
	-- 2 = pala
	-- 3 = hunter
	-- 4 = rogue
	-- 5 = priest 
	-- 6 = dk
	-- 7 = shaman
	-- 8 = mage
	-- 9 = warlock
	-- 11 = druid
	
	
	-- Salvar Talents Atuais (até 20 slots)
	if intid >= 1 and intid <= 20 then
			local BuildName = code
			local guid = player:GetGUIDLow()
		CharDBExecute("REPLACE INTO custom_save_talents_buildname (guid, intid, BuildName) VALUES ("..guid..", "..intid..", '"..BuildName.."')")
			player:SaveToDB()
		CharDBExecute("DELETE FROM custom_save_talents WHERE guid = "..guid.." AND BuildSlot = "..intid)
			local activeTalentGroup = CharDBQuery("SELECT activeTalentGroup FROM characters WHERE guid = "..guid):GetUInt32(0)
			local specMask
		if activeTalentGroup == 0 then -- Main Spec
			specMask = 1
		elseif activeTalentGroup == 1 then -- Off Spec
			specMask = 2
		end
		local result = CharDBQuery("SELECT spell FROM character_talent WHERE guid = "..guid.." AND specMask = "..specMask)
			player:GossipComplete()
			player:SendBroadcastMessage("Build Salvada no Slot " .. (intid))
		if result then
			repeat
				local spell = result:GetUInt32(0)
				local BuildSlot = intid
				CharDBExecute("INSERT INTO custom_save_talents (guid, spell, BuildSlot) VALUES ("..guid..", "..spell..", "..BuildSlot..")")
			until not result:NextRow()
		end
	end
	

	
	-- Aplicar Talent Selecionado
	if intid >= 30 and intid <= 39 then
		local buildSlot = intid - 30
		player:ResetTalents()
		player:SaveToDB()
		playerMap[player:GetGUIDLow()] = buildSlot
		player:RegisterEvent(Timer.PeriodicApplyTalents, 100, 20) -- Milisegundos/quantidades de applies
		player:GossipComplete()
	end
	
	-- Deletar Builds Salvas
	if intid == 450 then 
		local guid = player:GetGUIDLow()
		CharDBExecute("DELETE FROM custom_save_talents_buildname WHERE guid = " .. guid)
		CharDBExecute("DELETE FROM custom_save_talents WHERE guid = " .. guid)
		player:SaveToDB()
		player:SendBroadcastMessage("Builds salvas foram deletados.")
		player:GossipComplete()
	end
	
	if intid == 500 then -- Reset Talents
		player:ResetTalents()
		player:SaveToDB()
		player:SendBroadcastMessage("Seus Talentos foram resetados.")
		player:GossipComplete()
    end
	if(intid == 499) then -- Back to Main Menu
		OnGossipHello(event, player, creature)
	end
end
RegisterCreatureGossipEvent(NPC_ID, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_ID, 2, OnGossipSelect)






