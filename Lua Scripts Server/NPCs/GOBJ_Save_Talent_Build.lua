--local NPC_ID = 94151
local GameObjectEntry = 3501007

local itemVIP = 61000
local itemVIPeterno = 61001

playerMap = {}

function SpellIDToTalentandRank(spellID)

    local spellMap = 
	{
-- disc priest
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


-- mage
-- arcane
-- arcane subtlety
[11210] = {talentID = 74, rank = 0},
[12592] = {talentID = 74, rank = 1},

-- arcane focus
[11222] = {talentID = 76, rank = 0},
[12839] = {talentID = 76, rank = 1},
[12840] = {talentID = 76, rank = 2},

-- arcane stability
[11237] = {talentID = 80, rank = 0},
[12463] = {talentID = 80, rank = 1},
[12464] = {talentID = 80, rank = 2},
[16769] = {talentID = 80, rank = 3},
[16770] = {talentID = 80, rank = 4},

-- arcane fortitude
[28574] = {talentID = 85, rank = 0},
[54658] = {talentID = 85, rank = 1},
[54659] = {talentID = 85, rank = 2},

-- magic absorb
[29441] = {talentID = 1650, rank = 0},
[29444] = {talentID = 1650, rank = 1},

-- arcane concent
[11213] = {talentID = 75, rank = 0},
[12574] = {talentID = 75, rank = 1},
[12575] = {talentID = 75, rank = 2},
[12576] = {talentID = 75, rank = 3},
[12577] = {talentID = 75, rank = 4},

-- magica atunement
[11247] = {talentID = 82, rank = 0},
[12606] = {talentID = 82, rank = 1},

-- spell impact
[11242] = {talentID = 81, rank = 0},
[12467] = {talentID = 81, rank = 1},
[12469] = {talentID = 81, rank = 2},

-- student of the mind
[44397] = {talentID = 1845, rank = 0},
[44398] = {talentID = 1845, rank = 1},
[44399] = {talentID = 1845, rank = 2},

-- focus magic
[54646] = {talentID = 2211, rank = 0},

-- arcane shielding
[11252] = {talentID = 83, rank = 0},
[12605] = {talentID = 83, rank = 1},

-- imp CS
[11255] = {talentID = 88, rank = 0},
[12598] = {talentID = 88, rank = 1},

-- arcane meditation
[18462] = {talentID = 1142, rank = 0},
[18463] = {talentID = 1142, rank = 1},
[18464] = {talentID = 1142, rank = 2},

-- torment of the weak
[29447] = {talentID = 2222, rank = 0},
[55339] = {talentID = 2222, rank = 1},
[55340] = {talentID = 2222, rank = 2},

-- imp blink
[31569] = {talentID = 1724, rank = 0},
[31570] = {talentID = 1724, rank = 1},

-- presence of the mind
[12043] = {talentID = 86, rank = 0},

-- arcane mind
[11232] = {talentID = 77, rank = 0},
[12500] = {talentID = 77, rank = 1},
[12501] = {talentID = 77, rank = 2},
[12502] = {talentID = 77, rank = 3},
[12503] = {talentID = 77, rank = 4},

-- prismatic cloak
[31574] = {talentID = 1726, rank = 0},
[31575] = {talentID = 1726, rank = 1},
[54354] = {talentID = 1726, rank = 2},

-- arcane instability
[15058] = {talentID = 421, rank = 0},
[15059] = {talentID = 421, rank = 1},
[15060] = {talentID = 421, rank = 2},

-- arcane potency
[31571] = {talentID = 1725, rank = 0},
[31572] = {talentID = 1725, rank = 1},

-- arcane emp
[31579] = {talentID = 1727, rank = 0},
[31582] = {talentID = 1727, rank = 1},
[31583] = {talentID = 1727, rank = 2},

-- arcane power
[12042] = {talentID = 87, rank = 0},

-- incanter absorption
[44394] = {talentID = 1844, rank = 0},
[44395] = {talentID = 1844, rank = 1},
[44396] = {talentID = 1844, rank = 2},

-- arcane flows
[44378] = {talentID = 1843, rank = 0},
[44379] = {talentID = 1843, rank = 1},

-- mind mastery
[31584] = {talentID = 1728, rank = 0},
[31585] = {talentID = 1728, rank = 1},
[31586] = {talentID = 1728, rank = 2},
[31587] = {talentID = 1728, rank = 3},
[31588] = {talentID = 1728, rank = 4},

-- slow
[31589] = {talentID = 1729, rank = 0},

-- missile barrage
[44404] = {talentID = 2209, rank = 0},
[54486] = {talentID = 2209, rank = 1},
[54488] = {talentID = 2209, rank = 2},
[54489] = {talentID = 2209, rank = 3},
[54490] = {talentID = 2209, rank = 4},

-- netherwind presence
[44400] = {talentID = 1846, rank = 0},
[44402] = {talentID = 1846, rank = 1},
[44403] = {talentID = 1846, rank = 2},

-- spell power
[35578] = {talentID = 1826, rank = 0},
[35581] = {talentID = 1826, rank = 1},

-- arcane barrage
[44425] = {talentID = 1847, rank = 0},


-- fire mage
-- imp fire blast
[11078] = {talentID = 27, rank = 0},
[11080] = {talentID = 27, rank = 1},

-- incineration
[18459] = {talentID = 1141, rank = 0},
[18460] = {talentID = 1141, rank = 1},
[54734] = {talentID = 1141, rank = 2},

-- imp fireball
[11069] = {talentID = 26, rank = 0},
[12338] = {talentID = 26, rank = 1},
[12339] = {talentID = 26, rank = 2},
[12340] = {talentID = 26, rank = 3},
[12341] = {talentID = 26, rank = 4},

-- ignite
[11119] = {talentID = 34, rank = 0},
[11120] = {talentID = 34, rank = 1},
[12846] = {talentID = 34, rank = 2},
[12847] = {talentID = 34, rank = 3},
[12848] = {talentID = 34, rank = 4},

-- burning determination
[54747] = {talentID = 2212, rank = 0},
[54749] = {talentID = 2212, rank = 1},

-- world in flames
[11108] = {talentID = 31, rank = 0},
[12349] = {talentID = 31, rank = 1},
[12350] = {talentID = 31, rank = 2},

-- flame throwing
[11100] = {talentID = 28, rank = 0},
[12353] = {talentID = 28, rank = 1},

-- impact
[11103] = {talentID = 30, rank = 0},
[12357] = {talentID = 30, rank = 1},
[12358] = {talentID = 30, rank = 2},

-- pyro
[11366] = {talentID = 29, rank = 0},

-- burning soul
[11083] = {talentID = 23, rank = 0},
[12351] = {talentID = 23, rank = 1},

-- imp scorch
[11095] = {talentID = 25, rank = 0},
[12872] = {talentID = 25, rank = 1},
[12873] = {talentID = 25, rank = 2},

-- molten shields
[11094] = {talentID = 24, rank = 0},
[13043] = {talentID = 24, rank = 1},

-- master of the elments
[29074] = {talentID = 1639, rank = 0},
[29075] = {talentID = 1639, rank = 1},
[29076] = {talentID = 1639, rank = 2},

-- playing with fire
[31638] = {talentID = 1730, rank = 0},
[31639] = {talentID = 1730, rank = 1},
[31640] = {talentID = 1730, rank = 2},

-- critical mass
[11115] = {talentID = 33, rank = 0},
[11367] = {talentID = 33, rank = 1},
[11368] = {talentID = 33, rank = 2},

-- blast wave
[11113] = {talentID = 32, rank = 0},

-- blazing speed
[31641] = {talentID = 1731, rank = 0},
[31642] = {talentID = 1731, rank = 1},

-- fire power
[11124] = {talentID = 35, rank = 0},
[12378] = {talentID = 35, rank = 1},
[12398] = {talentID = 35, rank = 2},
[12399] = {talentID = 35, rank = 3},
[12400] = {talentID = 35, rank = 4},

-- pyromaniac
[34293] = {talentID = 1733, rank = 0},
[34295] = {talentID = 1733, rank = 1},
[34296] = {talentID = 1733, rank = 2},

-- combustion
[11129] = {talentID = 36, rank = 0},

-- molten fury
[31679] = {talentID = 1732, rank = 0},
[31680] = {talentID = 1732, rank = 1},

-- fiery payback
[64353] = {talentID = 1848, rank = 0},
[64357] = {talentID = 1848, rank = 1},

-- emp fire
[31656] = {talentID = 1734, rank = 0},
[31657] = {talentID = 1734, rank = 1},
[31658] = {talentID = 1734, rank = 2},

-- firestarter
[44442] = {talentID = 1849, rank = 0},
[44443] = {talentID = 1849, rank = 1},

-- dragon breath
[31661] = {talentID = 1735, rank = 0},

-- hot streak
[44445] = {talentID = 1850, rank = 0},
[44446] = {talentID = 1850, rank = 1},
[44448] = {talentID = 1850, rank = 2},

-- burnout
[44449] = {talentID = 1851, rank = 0},
[44469] = {talentID = 1851, rank = 1},
[44470] = {talentID = 1851, rank = 2},
[44471] = {talentID = 1851, rank = 3},
[44472] = {talentID = 1851, rank = 4},

-- living bomb
[44457] = {talentID = 1852, rank = 0},

-- frost mage
-- frostbite
[11071] = {talentID = 38, rank = 0},
[12496] = {talentID = 38, rank = 1},
[12497] = {talentID = 38, rank = 2},

-- imp frostbolt
[11070] = {talentID = 37, rank = 0},
[12473] = {talentID = 37, rank = 1},
[16763] = {talentID = 37, rank = 2},
[16765] = {talentID = 37, rank = 3},
[16766] = {talentID = 37, rank = 4},

-- ice floes
[31670] = {talentID = 62, rank = 0},
[31672] = {talentID = 62, rank = 1},
[55094] = {talentID = 62, rank = 2},

-- ice shards
[11207] = {talentID = 73, rank = 0},
[12672] = {talentID = 73, rank = 1},
[15047] = {talentID = 73, rank = 2},

-- frost warding
[11189] = {talentID = 70, rank = 0},
[28332] = {talentID = 70, rank = 1},

-- precision
[29438] = {talentID = 1649, rank = 0},
[29439] = {talentID = 1649, rank = 1},
[29440] = {talentID = 1649, rank = 2},

-- perma frost
[11175] = {talentID = 65, rank = 0},
[12569] = {talentID = 65, rank = 1},
[12571] = {talentID = 65, rank = 2},

-- poiercing ice
[11151] = {talentID = 61, rank = 0},
[12952] = {talentID = 61, rank = 1},
[12953] = {talentID = 61, rank = 2},

-- icy veins
[12472] = {talentID = 69, rank = 0},

-- imp blizzard
[11185] = {talentID = 63, rank = 0},
[12487] = {talentID = 63, rank = 1},
[12488] = {talentID = 63, rank = 2},

-- arctic reach
[16757] = {talentID = 741, rank = 0},
[16758] = {talentID = 741, rank = 1},

-- frost channeling
[11160] = {talentID = 66, rank = 0},
[12518] = {talentID = 66, rank = 1},
[12519] = {talentID = 66, rank = 2},

-- shatter
[11170] = {talentID = 67, rank = 0},
[12982] = {talentID = 67, rank = 1},
[12983] = {talentID = 67, rank = 2},

-- cold snap
[11958] = {talentID = 72, rank = 0},

-- imp cone of cold
[11190] = {talentID = 64, rank = 0},
[12489] = {talentID = 64, rank = 1},
[12490] = {talentID = 64, rank = 2},

-- frozen core
[31667] = {talentID = 1736, rank = 0},
[31668] = {talentID = 1736, rank = 1},
[31669] = {talentID = 1736, rank = 2},

-- cold as ice
[55091] = {talentID = 1737, rank = 0},
[55092] = {talentID = 1737, rank = 1},

-- winters chill
[11180] = {talentID = 68, rank = 0},
[28592] = {talentID = 68, rank = 1},
[28593] = {talentID = 68, rank = 2},

-- shattered barrier
[44745] = {talentID = 2214, rank = 0},
[54787] = {talentID = 2214, rank = 1},

-- ice barrier
[11426] = {talentID = 71, rank = 0},

-- arctic winds
[31674] = {talentID = 1738, rank = 0},
[31675] = {talentID = 1738, rank = 1},
[31676] = {talentID = 1738, rank = 2},
[31677] = {talentID = 1738, rank = 3},
[31678] = {talentID = 1738, rank = 4},

-- emp frostbolt
[31682] = {talentID = 1740, rank = 0},
[31683] = {talentID = 1740, rank = 1},

-- fingers of frost
[44543] = {talentID = 1853, rank = 0},
[44545] = {talentID = 1853, rank = 1},

-- brain freeze
[44546] = {talentID = 1854, rank = 0},
[44548] = {talentID = 1854, rank = 1},
[44549] = {talentID = 1854, rank = 2},

-- sum water ele
[31687] = {talentID = 1741, rank = 0},

-- enduring water
[44557] = {talentID = 1855, rank = 0},
[44560] = {talentID = 1855, rank = 1},
[44561] = {talentID = 1855, rank = 2},

-- chilled to the bone
[44566] = {talentID = 1856, rank = 0},
[44567] = {talentID = 1856, rank = 1},
[44568] = {talentID = 1856, rank = 2},
[44570] = {talentID = 1856, rank = 3},
[44571] = {talentID = 1856, rank = 4},

-- deep freeze
[44572] = {talentID = 1857, rank = 0},



-- warlock
-- affliction
-- imp curse of agony
[18827] = {talentID = 1284, rank = 0},
[18829] = {talentID = 1284, rank = 1},

-- suppression
[18174] = {talentID = 1005, rank = 0},
[18175] = {talentID = 1005, rank = 1},
[18176] = {talentID = 1005, rank = 2},

-- imp corruption
[17810] = {talentID = 1003, rank = 0},
[17811] = {talentID = 1003, rank = 1},
[17812] = {talentID = 1003, rank = 2},
[17813] = {talentID = 1003, rank = 3},
[17814] = {talentID = 1003, rank = 4},

-- imp curse of weakness
[18179] = {talentID = 1006, rank = 0},
[18180] = {talentID = 1006, rank = 1},

-- imp drain soul
[18213] = {talentID = 1101, rank = 0},
[18372] = {talentID = 1101, rank = 1},

-- imp life tap
[18182] = {talentID = 1007, rank = 0},
[18183] = {talentID = 1007, rank = 1},

-- soul siphon
[17804] = {talentID = 1004, rank = 0},
[17805] = {talentID = 1004, rank = 1},

-- imp fear
[53754] = {talentID = 2205, rank = 0},
[53759] = {talentID = 2205, rank = 1},

-- fel concentra
[17783] = {talentID = 1001, rank = 0},
[17784] = {talentID = 1001, rank = 1},
[17785] = {talentID = 1001, rank = 2},

-- amp curse
[18288] = {talentID = 1061, rank = 0},

-- grim reach
[18218] = {talentID = 1021, rank = 0},
[18219] = {talentID = 1021, rank = 1},

-- nightfall
[18094] = {talentID = 1002, rank = 0},
[18095] = {talentID = 1002, rank = 1},

-- emp corruptio
[32381] = {talentID = 1764, rank = 0},
[32382] = {talentID = 1764, rank = 1},
[32383] = {talentID = 1764, rank = 2},

-- shado embrace
[32385] = {talentID = 1763, rank = 0},
[32387] = {talentID = 1763, rank = 1},
[32392] = {talentID = 1763, rank = 2},
[32393] = {talentID = 1763, rank = 3},
[32394] = {talentID = 1763, rank = 4},

-- siphon life
[63108] = {talentID = 1041, rank = 0},

-- curse of exhaustion
[18223] = {talentID = 1081, rank = 0},

-- imp felhunter
[54037] = {talentID = 1873, rank = 0},
[54038] = {talentID = 1873, rank = 1},

-- shadow mastery
[18271] = {talentID = 1042, rank = 0},
[18272] = {talentID = 1042, rank = 1},
[18273] = {talentID = 1042, rank = 2},
[18274] = {talentID = 1042, rank = 3},
[18275] = {talentID = 1042, rank = 4},

-- eradication
[47195] = {talentID = 1878, rank = 0},
[47196] = {talentID = 1878, rank = 1},
[47197] = {talentID = 1878, rank = 2},

-- contagion
[30060] = {talentID = 1669, rank = 0},
[30061] = {talentID = 1669, rank = 1},
[30062] = {talentID = 1669, rank = 2},
[30063] = {talentID = 1669, rank = 3},
[30064] = {talentID = 1669, rank = 4},

-- dark pact
[18220] = {talentID = 1022, rank = 0},

-- imp howl
[30054] = {talentID = 1668, rank = 0},
[30057] = {talentID = 1668, rank = 1},

-- malediction
[32477] = {talentID = 1667, rank = 0},
[32483] = {talentID = 1667, rank = 1},
[32484] = {talentID = 1667, rank = 2},

-- death's embrace
[47198] = {talentID = 1875, rank = 0},
[47199] = {talentID = 1875, rank = 1},
[47200] = {talentID = 1875, rank = 2},

-- UA
[30108] = {talentID = 1670, rank = 0},

-- pandemic
[58435] = {talentID = 2245, rank = 0},

-- everlasting affliction
[47201] = {talentID = 1876, rank = 0},
[47202] = {talentID = 1876, rank = 1},
[47203] = {talentID = 1876, rank = 2},
[47204] = {talentID = 1876, rank = 3},
[47205] = {talentID = 1876, rank = 4},

-- haunt
[48181] = {talentID = 2041, rank = 0},


-- demo
-- imp healthstone
[18692] = {talentID = 1221, rank = 0},
[18693] = {talentID = 1221, rank = 1},

-- improv imp
[18694] = {talentID = 1222, rank = 0},
[18695] = {talentID = 1222, rank = 1},
[18696] = {talentID = 1222, rank = 2},

-- demonic embrace
[18697] = {talentID = 1223, rank = 0},
[18698] = {talentID = 1223, rank = 1},
[18699] = {talentID = 1223, rank = 2},

-- fel syngery
[47230] = {talentID = 1883, rank = 0},
[47231] = {talentID = 1883, rank = 1},

-- imp health funnel
[18703] = {talentID = 1224, rank = 0},
[18704] = {talentID = 1224, rank = 1},

-- demonic bruta
[18705] = {talentID = 1225, rank = 0},
[18706] = {talentID = 1225, rank = 1},
[18707] = {talentID = 1225, rank = 2},

-- fel vitality
[18731] = {talentID = 1242, rank = 0},
[18743] = {talentID = 1242, rank = 1},
[18744] = {talentID = 1242, rank = 2},

-- imp succubus
[18754] = {talentID = 1243, rank = 0},
[18755] = {talentID = 1243, rank = 1},
[18756] = {talentID = 1243, rank = 2},

-- soul link
[19028] = {talentID = 1282, rank = 0},

-- fel domin
[18708] = {talentID = 1226, rank = 0},

-- demonic aegis
[30143] = {talentID = 1671, rank = 0},
[30144] = {talentID = 1671, rank = 1},
[30145] = {talentID = 1671, rank = 2},

-- unholy power
[18769] = {talentID = 1262, rank = 0},
[18770] = {talentID = 1262, rank = 1},
[18771] = {talentID = 1262, rank = 2},
[18772] = {talentID = 1262, rank = 3},
[18773] = {talentID = 1262, rank = 4},

-- master summoner
[18709] = {talentID = 1227, rank = 0},
[18710] = {talentID = 1227, rank = 1},

-- mana feed
[30326] = {talentID = 1281, rank = 0},

-- master conjuror
[18767] = {talentID = 1261, rank = 0},
[18768] = {talentID = 1261, rank = 1},

-- master demonogist
[23785] = {talentID = 1244, rank = 0},
[23822] = {talentID = 1244, rank = 1},
[23823] = {talentID = 1244, rank = 2},
[23824] = {talentID = 1244, rank = 3},
[23825] = {talentID = 1244, rank = 4},

-- molten core
[47245] = {talentID = 1283, rank = 0},
[47246] = {talentID = 1283, rank = 1},
[47247] = {talentID = 1283, rank = 2},

-- demonic resilience
[30319] = {talentID = 1680, rank = 0},
[30320] = {talentID = 1680, rank = 1},
[30321] = {talentID = 1680, rank = 2},

-- demonic empowerment
[47193] = {talentID = 1880, rank = 0},

-- demonic knowledge
[35691] = {talentID = 1263, rank = 0},
[35692] = {talentID = 1263, rank = 1},
[35693] = {talentID = 1263, rank = 2},

-- demonic tactis
[30242] = {talentID = 1673, rank = 0},
[30245] = {talentID = 1673, rank = 1},
[30246] = {talentID = 1673, rank = 2},
[30247] = {talentID = 1673, rank = 3},
[30248] = {talentID = 1673, rank = 4},

-- decimation
[63156] = {talentID = 2261, rank = 0},
[63158] = {talentID = 2261, rank = 1},

-- imp demonic tactics
[54347] = {talentID = 1882, rank = 0},
[54348] = {talentID = 1882, rank = 1},
[54349] = {talentID = 1882, rank = 2},

-- summon felg
[30146] = {talentID = 1672, rank = 0},

-- nemesis
[63117] = {talentID = 1884, rank = 0},
[63121] = {talentID = 1884, rank = 1},
[63123] = {talentID = 1884, rank = 2},

-- demonic pact
[47236] = {talentID = 1885, rank = 0},
[47237] = {talentID = 1885, rank = 1},
[47238] = {talentID = 1885, rank = 2},
[47239] = {talentID = 1885, rank = 3},
[47240] = {talentID = 1885, rank = 4},

-- metamorphosis
[59672] = {talentID = 1886, rank = 0},


-- destruction
-- imp shadow bolt
[17793] = {talentID = 944, rank = 0},
[17796] = {talentID = 944, rank = 1},
[17801] = {talentID = 944, rank = 2},
[17802] = {talentID = 944, rank = 3},
[17803] = {talentID = 944, rank = 4},

-- bane
[17788] = {talentID = 943, rank = 0},
[17789] = {talentID = 943, rank = 1},
[17790] = {talentID = 943, rank = 2},
[17791] = {talentID = 943, rank = 3},
[17792] = {talentID = 943, rank = 4},

-- aftermath
[18119] = {talentID = 982, rank = 0},
[18120] = {talentID = 982, rank = 1},

-- molten skin
[63349] = {talentID = 1887, rank = 0},
[63350] = {talentID = 1887, rank = 1},
[63351] = {talentID = 1887, rank = 2},

-- cataclysm
[17778] = {talentID = 941, rank = 0},
[17779] = {talentID = 941, rank = 1},
[17780] = {talentID = 941, rank = 2},

-- demonic power
[18126] = {talentID = 983, rank = 0},
[18127] = {talentID = 983, rank = 1},

-- shadowburn
[17877] = {talentID = 963, rank = 0},

-- ruin
[17959] = {talentID = 967, rank = 0},
[59738] = {talentID = 967, rank = 1},
[59739] = {talentID = 967, rank = 2},
[59740] = {talentID = 967, rank = 3},
[59741] = {talentID = 967, rank = 4},

-- intensity
[18135] = {talentID = 985, rank = 0},
[18136] = {talentID = 985, rank = 1},

-- destructive reach
[17917] = {talentID = 964, rank = 0},
[17918] = {talentID = 964, rank = 1},

-- imp searin pain
[17927] = {talentID = 965, rank = 0},
[17929] = {talentID = 965, rank = 1},
[17930] = {talentID = 965, rank = 2},

-- backlash
[34935] = {talentID = 1817, rank = 0},
[34938] = {talentID = 1817, rank = 1},
[34939] = {talentID = 1817, rank = 2},

-- imp immolate
[17815] = {talentID = 961, rank = 0},
[17833] = {talentID = 961, rank = 1},
[17834] = {talentID = 961, rank = 2},

-- devastation
[18130] = {talentID = 981, rank = 0},

-- nether protection
[30299] = {talentID = 1679, rank = 0},
[30301] = {talentID = 1679, rank = 1},
[30302] = {talentID = 1679, rank = 2},

-- emberstorm
[17954] = {talentID = 966, rank = 0},
[17955] = {talentID = 966, rank = 1},
[17956] = {talentID = 966, rank = 2},
[17957] = {talentID = 966, rank = 3},
[17958] = {talentID = 966, rank = 4},

-- conflagrate
[17962] = {talentID = 968, rank = 0},

-- soul leech
[30293] = {talentID = 1678, rank = 0},
[30295] = {talentID = 1678, rank = 1},
[30296] = {talentID = 1678, rank = 2},

-- pyroclasm
[18096] = {talentID = 986, rank = 0},
[18073] = {talentID = 986, rank = 1},
[63245] = {talentID = 986, rank = 2},

-- shadow and flame
[30288] = {talentID = 1677, rank = 0},
[30289] = {talentID = 1677, rank = 1},
[30290] = {talentID = 1677, rank = 2},
[30291] = {talentID = 1677, rank = 3},
[30292] = {talentID = 1677, rank = 4},

-- imp soul leech
[54117] = {talentID = 1889, rank = 0},
[54118] = {talentID = 1889, rank = 1},

-- backdraft
[47258] = {talentID = 1888, rank = 0},
[47259] = {talentID = 1888, rank = 1},
[47260] = {talentID = 1888, rank = 2},

-- shadowfury
[30283] = {talentID = 1676, rank = 0},

-- emp imp
[47220] = {talentID = 2045, rank = 0},
[47221] = {talentID = 2045, rank = 1},
[47223] = {talentID = 2045, rank = 2},

-- fire and brimstone
[47266] = {talentID = 1890, rank = 0},
[47267] = {talentID = 1890, rank = 1},
[47268] = {talentID = 1890, rank = 2},
[47269] = {talentID = 1890, rank = 3},
[47270] = {talentID = 1890, rank = 4},

-- chaos bolt
[50796] = {talentID = 1891, rank = 0},


-- rogue assassin
-- imp evisc
[14162] = {talentID = 276, rank = 0},
[14163] = {talentID = 276, rank = 1},
[14164] = {talentID = 276, rank = 2},

-- remorseless attacks
[14144] = {talentID = 272, rank = 0},
[14148] = {talentID = 272, rank = 1},

-- malice
[14138] = {talentID = 270, rank = 0},
[14139] = {talentID = 270, rank = 1},
[14140] = {talentID = 270, rank = 2},
[14141] = {talentID = 270, rank = 3},
[14142] = {talentID = 270, rank = 4},

-- ruthlessness
[14156] = {talentID = 273, rank = 0},
[14160] = {talentID = 273, rank = 1},
[14161] = {talentID = 273, rank = 2},

-- blood spatter
[51632] = {talentID = 2068, rank = 0},
[51633] = {talentID = 2068, rank = 1},

-- puncturing wounds
[13733] = {talentID = 277, rank = 0},
[13865] = {talentID = 277, rank = 1},
[13866] = {talentID = 277, rank = 2},

-- vigor
[14983] = {talentID = 382, rank = 0},

-- imp expose armor
[14168] = {talentID = 278, rank = 0},
[14169] = {talentID = 278, rank = 1},

-- lethality
[14128] = {talentID = 269, rank = 0},
[14132] = {talentID = 269, rank = 1},
[14135] = {talentID = 269, rank = 2},
[14136] = {talentID = 269, rank = 3},
[14137] = {talentID = 269, rank = 4},

-- vile poisons
[16513] = {talentID = 682, rank = 0},
[16514] = {talentID = 682, rank = 1},
[16515] = {talentID = 682, rank = 2},

-- imp poisons
[14113] = {talentID = 268, rank = 0},
[14114] = {talentID = 268, rank = 1},
[14115] = {talentID = 268, rank = 2},
[14116] = {talentID = 268, rank = 3},
[14117] = {talentID = 268, rank = 4},

-- fleet footed
[31208] = {talentID = 1721, rank = 0},
[31209] = {talentID = 1721, rank = 1},

-- cold blood
[14177] = {talentID = 280, rank = 0},

-- imp kidney shot
[14174] = {talentID = 279, rank = 0},
[14175] = {talentID = 279, rank = 1},
[14176] = {talentID = 279, rank = 2},

-- quick recovery
[31244] = {talentID = 1762, rank = 0},
[31245] = {talentID = 1762, rank = 1},

-- seal fate
[14186] = {talentID = 283, rank = 0},
[14190] = {talentID = 283, rank = 1},
[14193] = {talentID = 283, rank = 2},
[14194] = {talentID = 283, rank = 3},
[14195] = {talentID = 283, rank = 4},

-- murder
[14158] = {talentID = 274, rank = 0},
[14159] = {talentID = 274, rank = 1},

-- deadly brew
[51625] = {talentID = 2065, rank = 0},
[51626] = {talentID = 2065, rank = 1},

-- overkill
[58426] = {talentID = 281, rank = 0},

-- deadened nerves
[31380] = {talentID = 1723, rank = 0},
[31382] = {talentID = 1723, rank = 1},
[31383] = {talentID = 1723, rank = 2},

-- focused attacks
[51634] = {talentID = 2069, rank = 0},
[51635] = {talentID = 2069, rank = 1},
[51636] = {talentID = 2069, rank = 2},

-- find weakness
[31234] = {talentID = 1718, rank = 0},
[31235] = {talentID = 1718, rank = 1},
[31236] = {talentID = 1718, rank = 2},

-- master poisoner
[31226] = {talentID = 1715, rank = 0},
[31227] = {talentID = 1715, rank = 1},
[58410] = {talentID = 1715, rank = 2},

-- mutilate
[1329] = {talentID = 1719, rank = 0},

-- turn the tables
[51627] = {talentID = 2066, rank = 0},
[51628] = {talentID = 2066, rank = 1},
[51629] = {talentID = 2066, rank = 2},

-- cut to the chase
[51664] = {talentID = 2070, rank = 0},
[51665] = {talentID = 2070, rank = 1},
[51667] = {talentID = 2070, rank = 2},
[51668] = {talentID = 2070, rank = 3},
[51669] = {talentID = 2070, rank = 4},

-- hunger for blood
[51662] = {talentID = 2071, rank = 0},



-- rogue combat
-- imp gouge
[13741] = {talentID = 203, rank = 0},
[13793] = {talentID = 203, rank = 1},
[13792] = {talentID = 203, rank = 2},

-- imp sinister strike
[13732] = {talentID = 201, rank = 0},
[13863] = {talentID = 201, rank = 1},

-- dual wield spec
[13715] = {talentID = 221, rank = 0},
[13848] = {talentID = 221, rank = 1},
[13849] = {talentID = 221, rank = 2},
[13851] = {talentID = 221, rank = 3},
[13852] = {talentID = 221, rank = 4},

-- imp slice and dice
[14165] = {talentID = 1827, rank = 0},
[14166] = {talentID = 1827, rank = 1},

-- deflection
[13713] = {talentID = 187, rank = 0},
[13853] = {talentID = 187, rank = 1},
[13854] = {talentID = 187, rank = 2},

-- precisison
[13705] = {talentID = 181, rank = 0},
[13832] = {talentID = 181, rank = 1},
[13843] = {talentID = 181, rank = 2},
[13844] = {talentID = 181, rank = 3},
[13845] = {talentID = 181, rank = 4},

-- endurance
[13742] = {talentID = 204, rank = 0},
[13872] = {talentID = 204, rank = 1},

-- riposte
[14251] = {talentID = 301, rank = 0},

-- close quarters combat
[13706] = {talentID = 182, rank = 0},
[13804] = {talentID = 182, rank = 1},
[13805] = {talentID = 182, rank = 2},
[13806] = {talentID = 182, rank = 3},
[13807] = {talentID = 182, rank = 4},

-- imp kick
[13754] = {talentID = 206, rank = 0},
[13867] = {talentID = 206, rank = 1},

-- imp sprint
[13743] = {talentID = 222, rank = 0},
[13875] = {talentID = 222, rank = 1},

-- lightning reflexes
[13712] = {talentID = 186, rank = 0},
[13788] = {talentID = 186, rank = 1},
[13789] = {talentID = 186, rank = 2},

-- aggression
[18427] = {talentID = 1122, rank = 0},
[18428] = {talentID = 1122, rank = 1},
[18429] = {talentID = 1122, rank = 2},
[61330] = {talentID = 1122, rank = 3},
[61331] = {talentID = 1122, rank = 4},

-- mace spec
[13709] = {talentID = 184, rank = 0},
[13800] = {talentID = 184, rank = 1},
[13801] = {talentID = 184, rank = 2},
[13802] = {talentID = 184, rank = 3},
[13803] = {talentID = 184, rank = 4},

-- blade flurry
[13877] = {talentID = 223, rank = 0},

-- hack and slash
[13960] = {talentID = 242, rank = 0},
[13961] = {talentID = 242, rank = 1},
[13962] = {talentID = 242, rank = 2},
[13963] = {talentID = 242, rank = 3},
[13964] = {talentID = 242, rank = 4},

-- weapon expertise
[30919] = {talentID = 1703, rank = 0},
[30920] = {talentID = 1703, rank = 1},

-- blade twisting
[31124] = {talentID = 1706, rank = 0},
[31126] = {talentID = 1706, rank = 1},

-- vitality
[31122] = {talentID = 1705, rank = 0},
[31123] = {talentID = 1705, rank = 1},
[61329] = {talentID = 1705, rank = 2},

-- adrenaline rush
[13750] = {talentID = 205, rank = 0},

-- nerves of steel
[31130] = {talentID = 1707, rank = 0},
[31131] = {talentID = 1707, rank = 1},

-- throwing spec
[5952] = {talentID = 2072, rank = 0},
[51679] = {talentID = 2072, rank = 1},

-- combat potency
[35541] = {talentID = 1825, rank = 0},
[35550] = {talentID = 1825, rank = 1},
[35551] = {talentID = 1825, rank = 2},
[35552] = {talentID = 1825, rank = 3},
[35553] = {talentID = 1825, rank = 4},

-- unfair advantage
[51672] = {talentID = 2073, rank = 0},
[51674] = {talentID = 2073, rank = 1},

-- surprise attacks
[32601] = {talentID = 1709, rank = 0},

-- savage combat
[51682] = {talentID = 2074, rank = 0},
[58413] = {talentID = 2074, rank = 1},

-- pray on the weak
[51685] = {talentID = 2075, rank = 0},
[51686] = {talentID = 2075, rank = 1},
[51687] = {talentID = 2075, rank = 2},
[51688] = {talentID = 2075, rank = 3},
[51689] = {talentID = 2075, rank = 4},

-- killing spree
[51690] = {talentID = 2076, rank = 0},

-- subtetly / subtlety
-- relentless strikes
[14179] = {talentID = 2244, rank = 0},
[58422] = {talentID = 2244, rank = 1},
[58423] = {talentID = 2244, rank = 2},
[58424] = {talentID = 2244, rank = 3},
[58425] = {talentID = 2244, rank = 4},

-- master of deception
[13958] = {talentID = 241, rank = 0},
[13970] = {talentID = 241, rank = 1},
[13971] = {talentID = 241, rank = 2},

-- opportunity
[14057] = {talentID = 261, rank = 0},
[14072] = {talentID = 261, rank = 1},

-- sleight of hand
[30892] = {talentID = 1700, rank = 0},
[30893] = {talentID = 1700, rank = 1},

-- dirty tricks
[14076] = {talentID = 262, rank = 0},
[14094] = {talentID = 262, rank = 1},

-- camouflage
[13975] = {talentID = 244, rank = 0},
[14062] = {talentID = 244, rank = 1},
[14063] = {talentID = 244, rank = 2},

-- elusiveness
[13981] = {talentID = 247, rank = 0},
[14066] = {talentID = 247, rank = 1},

-- ghostly strike
[14278] = {talentID = 303, rank = 0},

-- serrated blades
[14171] = {talentID = 1123, rank = 0},
[14172] = {talentID = 1123, rank = 1},
[14173] = {talentID = 1123, rank = 2},

-- setup
[13983] = {talentID = 246, rank = 0},
[14070] = {talentID = 246, rank = 1},
[14071] = {talentID = 246, rank = 2},

-- initiative
[13976] = {talentID = 245, rank = 0},
[13979] = {talentID = 245, rank = 1},
[13980] = {talentID = 245, rank = 2},

-- imp ambush
[14079] = {talentID = 263, rank = 0},
[14080] = {talentID = 263, rank = 1},

-- heightened senses
[30894] = {talentID = 1701, rank = 0},
[30895] = {talentID = 1701, rank = 1},

-- preparation
[14185] = {talentID = 284, rank = 0},

-- dirty deeds
[14082] = {talentID = 265, rank = 0},
[14083] = {talentID = 265, rank = 1},

-- hemorrhage
[16511] = {talentID = 681, rank = 0},

-- master of subtlety
[31221] = {talentID = 1713, rank = 0},
[31222] = {talentID = 1713, rank = 1},
[31223] = {talentID = 1713, rank = 2},

-- deadliness
[30902] = {talentID = 1702, rank = 0},
[30903] = {talentID = 1702, rank = 1},
[30904] = {talentID = 1702, rank = 2},
[30905] = {talentID = 1702, rank = 3},
[30906] = {talentID = 1702, rank = 4},

-- enveloping shadows
[31211] = {talentID = 1711, rank = 0},
[31212] = {talentID = 1711, rank = 1},
[31213] = {talentID = 1711, rank = 2},

-- preparation
[14183] = {talentID = 381, rank = 0},

-- cheat death
[31228] = {talentID = 1722, rank = 0},
[31229] = {talentID = 1722, rank = 1},
[31230] = {talentID = 1722, rank = 2},

-- sisnister calling
[31216] = {talentID = 1712, rank = 0},
[31217] = {talentID = 1712, rank = 1},
[31218] = {talentID = 1712, rank = 2},
[31219] = {talentID = 1712, rank = 3},
[31220] = {talentID = 1712, rank = 4},

-- waylay
[51692] = {talentID = 2077, rank = 0},
[51696] = {talentID = 2077, rank = 1},

-- honor among thieves
[51698] = {talentID = 2078, rank = 0},
[51700] = {talentID = 2078, rank = 1},
[51701] = {talentID = 2078, rank = 2},

-- shadowstep
[36554] = {talentID = 1714, rank = 0},

-- filthy tricks
[58414] = {talentID = 2079, rank = 0},
[58415] = {talentID = 2079, rank = 1},

-- slaughter from the shadows
[51708] = {talentID = 2080, rank = 0},
[51709] = {talentID = 2080, rank = 1},
[51710] = {talentID = 2080, rank = 2},
[51711] = {talentID = 2080, rank = 3},
[51712] = {talentID = 2080, rank = 4},

-- shadow dance
[51713] = {talentID = 2081, rank = 0},

-- balance
-- starlight wrath
[16814] = {talentID = 762, rank = 0},
[16815] = {talentID = 762, rank = 1},
[16816] = {talentID = 762, rank = 2},
[16817] = {talentID = 762, rank = 3},
[16818] = {talentID = 762, rank = 4},

-- genesis
[57810] = {talentID = 2238, rank = 0},
[57811] = {talentID = 2238, rank = 1},
[57812] = {talentID = 2238, rank = 2},
[57813] = {talentID = 2238, rank = 3},
[57814] = {talentID = 2238, rank = 4},

-- moonglow
[16845] = {talentID = 783, rank = 0},
[16846] = {talentID = 783, rank = 1},
[16847] = {talentID = 783, rank = 2},

-- nature's majesty
[35363] = {talentID = 1822, rank = 0},
[35364] = {talentID = 1822, rank = 1},

-- imp moonfire
[16821] = {talentID = 763, rank = 0},
[16822] = {talentID = 763, rank = 1},

-- brambles
[16836] = {talentID = 782, rank = 0},
[16839] = {talentID = 782, rank = 1},
[16840] = {talentID = 782, rank = 0},

-- nature's grace
[16880] = {talentID = 789, rank = 0},
[61345] = {talentID = 789, rank = 1},
[61346] = {talentID = 789, rank = 2},

-- nature's splendor
[57865] = {talentID = 2240, rank = 0},

-- nature's reach
[16819] = {talentID = 764, rank = 0},
[16820] = {talentID = 764, rank = 1},

-- vengeance
[16909] = {talentID = 792, rank = 0},
[16910] = {talentID = 792, rank = 1},
[16911] = {talentID = 792, rank = 2},
[16912] = {talentID = 792, rank = 3},
[16913] = {talentID = 792, rank = 4},

-- celestial focus
[16850] = {talentID = 784, rank = 0},
[16923] = {talentID = 784, rank = 1},
[16924] = {talentID = 784, rank = 2},

-- lunar guidance
[33589] = {talentID = 1782, rank = 0},
[33590] = {talentID = 1782, rank = 1},
[33591] = {talentID = 1782, rank = 2},

-- insect swarm
[5570] = {talentID = 788, rank = 0},

-- imp insect swarm
[57849] = {talentID = 2239, rank = 0},
[57850] = {talentID = 2239, rank = 1},
[57851] = {talentID = 2239, rank = 2},

-- dreamstate
[33597] = {talentID = 1784, rank = 0},
[33599] = {talentID = 1784, rank = 1},
[33956] = {talentID = 1784, rank = 2},

-- moonfury
[16896] = {talentID = 790, rank = 0},
[16897] = {talentID = 790, rank = 1},
[16899] = {talentID = 790, rank = 2},

-- balance of power
[33592] = {talentID = 1783, rank = 0},
[33596] = {talentID = 1783, rank = 1},

-- moonkin form
[24858] = {talentID = 793, rank = 0},

-- improved moonkin
[48384] = {talentID = 1912, rank = 0},
[48395] = {talentID = 1912, rank = 1},
[48396] = {talentID = 1912, rank = 2},

-- imp faerie fire
[33600] = {talentID = 1785, rank = 0},
[33601] = {talentID = 1785, rank = 1},
[33602] = {talentID = 1785, rank = 2},

-- owlkin frenzy
[48389] = {talentID = 1913, rank = 0},
[48392] = {talentID = 1913, rank = 1},
[48393] = {talentID = 1913, rank = 2},

-- wrath of cenarius
[33603] = {talentID = 1786, rank = 0},
[33604] = {talentID = 1786, rank = 1},
[33605] = {talentID = 1786, rank = 2},
[33606] = {talentID = 1786, rank = 3},
[33607] = {talentID = 1786, rank = 4},

-- eclipse
[48516] = {talentID = 1924, rank = 0},
[48521] = {talentID = 1924, rank = 1},
[48525] = {talentID = 1924, rank = 2},

-- typhoon
[50516] = {talentID = 1923, rank = 0},

-- force of nature
[33831] = {talentID = 1787, rank = 0},

-- gale winds
[48488] = {talentID = 1925, rank = 0},
[48514] = {talentID = 1925, rank = 1},

-- earth and moon
[48506] = {talentID = 1928, rank = 0},
[48510] = {talentID = 1928, rank = 1},
[48511] = {talentID = 1928, rank = 2},

-- starfall
[48505] = {talentID = 1926, rank = 0},


-- feral
-- Ferocity
[16934] = {talentID = 796, rank = 0},
[16935] = {talentID = 796, rank = 1},
[16936] = {talentID = 796, rank = 2},
[16937] = {talentID = 796, rank = 3},
[16938] = {talentID = 796, rank = 4},

-- Feral Aggression
[16858] = {talentID = 795, rank = 0},
[16859] = {talentID = 795, rank = 1},
[16860] = {talentID = 795, rank = 2},
[16861] = {talentID = 795, rank = 3},
[16862] = {talentID = 795, rank = 4},

-- feral instinct
[16947] = {talentID = 799, rank = 0},
[16948] = {talentID = 799, rank = 1},
[16949] = {talentID = 799, rank = 2},

-- savage fury
[16998] = {talentID = 805, rank = 0},
[16999] = {talentID = 805, rank = 1},

-- thick hide
[16929] = {talentID = 794, rank = 0},
[16930] = {talentID = 794, rank = 1},
[16931] = {talentID = 794, rank = 2},

-- feral swiftness
[17002] = {talentID = 807, rank = 0},
[24866] = {talentID = 807, rank = 1},

-- survival instincts
[61336] = {talentID = 1162, rank = 0},

-- sharpened claws
[16942] = {talentID = 798, rank = 0},
[16943] = {talentID = 798, rank = 1},
[16944] = {talentID = 798, rank = 2},

-- shredding attacks
[16966] = {talentID = 802, rank = 0},
[16968] = {talentID = 802, rank = 1},

-- predatory strikes
[16972] = {talentID = 803, rank = 0},
[16974] = {talentID = 803, rank = 1},
[16975] = {talentID = 803, rank = 2},

-- primal fury
[37116] = {talentID = 801, rank = 0},
[37117] = {talentID = 801, rank = 1},

-- primal precision
[48409] = {talentID = 1914, rank = 0},
[48410] = {talentID = 1914, rank = 1},

-- brutal impact
[16940] = {talentID = 797, rank = 0},
[16941] = {talentID = 797, rank = 1},

-- feral charge
[49377] = {talentID = 804, rank = 0},

-- nurturing instinct
[33872] = {talentID = 1792, rank = 0},
[33873] = {talentID = 1792, rank = 1},

-- natural reaction
[57878] = {talentID = 2242, rank = 0},
[57880] = {talentID = 2242, rank = 1},
[57881] = {talentID = 2242, rank = 2},
-- heart of the wild
[17003] = {talentID = 808, rank = 0},
[17004] = {talentID = 808, rank = 1},
[17005] = {talentID = 808, rank = 2},
[17006] = {talentID = 808, rank = 3},
[24894] = {talentID = 808, rank = 4},
-- survival of the fittest
[33853] = {talentID = 1794, rank = 0},
[33855] = {talentID = 1794, rank = 1},
[33856] = {talentID = 1794, rank = 2},
-- leader of the pack
[17007] = {talentID = 809, rank = 0},
-- imp leader of the pack
[34297] = {talentID = 1798, rank = 0},
[34300] = {talentID = 1798, rank = 1},
-- primal tenacity
[33851] = {talentID = 1793, rank = 0},
[33852] = {talentID = 1793, rank = 1},
[33957] = {talentID = 1793, rank = 2},
-- protector of the pack
[57873] = {talentID = 2241, rank = 0},
[57876] = {talentID = 2241, rank = 1},
[57877] = {talentID = 2241, rank = 2},
-- predatory instincts
[33859] = {talentID = 1795, rank = 0},
[33866] = {talentID = 1795, rank = 1},
[33867] = {talentID = 1795, rank = 2},
-- infected wounds
[48483] = {talentID = 1919, rank = 0},
[48484] = {talentID = 1919, rank = 1},
[48485] = {talentID = 1919, rank = 2},
-- kings of the jungle
[48492] = {talentID = 1921, rank = 0},
[48494] = {talentID = 1921, rank = 1},
[48495] = {talentID = 1921, rank = 2},
-- mangle
[33917] = {talentID = 1796, rank = 0},
-- imp mangle
[48532] = {talentID = 1920, rank = 0},
[48489] = {talentID = 1920, rank = 1},
[48491] = {talentID = 1920, rank = 2},
-- rend and tear
[48432] = {talentID = 1918, rank = 0},
[48433] = {talentID = 1918, rank = 1},
[48434] = {talentID = 1918, rank = 2},
[51268] = {talentID = 1918, rank = 3},
[51269] = {talentID = 1918, rank = 4},
-- primal gore
[63503] = {talentID = 2266, rank = 0},
-- berserk
[50334] = {talentID = 1927, rank = 0},


-- resto
-- imp mark of the wild
[17050] = {talentID = 821, rank = 0},
[17051] = {talentID = 821, rank = 1},

-- nature's focus
[17063] = {talentID = 823, rank = 0},
[17065] = {talentID = 823, rank = 1},
[17066] = {talentID = 823, rank = 2},

-- furor
[17056] = {talentID = 822, rank = 0},
[17058] = {talentID = 822, rank = 1},
[17059] = {talentID = 822, rank = 2},
[17060] = {talentID = 822, rank = 3},
[17061] = {talentID = 822, rank = 4},
-- naturalist
[17069] = {talentID = 824, rank = 0},
[17070] = {talentID = 824, rank = 1},
[17071] = {talentID = 824, rank = 2},
[17072] = {talentID = 824, rank = 3},
[17073] = {talentID = 824, rank = 4},
-- subtlety
[17118] = {talentID = 841, rank = 0},
[17119] = {talentID = 841, rank = 1},
[17120] = {talentID = 841, rank = 2},
-- natural shapeshifter
[16833] = {talentID = 826, rank = 0},
[16834] = {talentID = 826, rank = 1},
[16835] = {talentID = 826, rank = 2},
-- intensity
[17106] = {talentID = 829, rank = 0},
[17107] = {talentID = 829, rank = 1},
[17108] = {talentID = 829, rank = 2},
-- omen of clarity
[16864] = {talentID = 827, rank = 0},
-- master shapeshifter
[48411] = {talentID = 1915, rank = 0},
[48412] = {talentID = 1915, rank = 1},
-- tranquil spirit
[24968] = {talentID = 843, rank = 0},
[24969] = {talentID = 843, rank = 1},
[24970] = {talentID = 843, rank = 2},
[24971] = {talentID = 843, rank = 3},
[24972] = {talentID = 843, rank = 4},
-- imp rejuvenation
[17111] = {talentID = 830, rank = 0},
[17112] = {talentID = 830, rank = 1},
[17113] = {talentID = 830, rank = 2},
-- NS
[17116] = {talentID = 831, rank = 0},
-- gift of the nature
[17104] = {talentID = 828, rank = 0},
[24943] = {talentID = 828, rank = 1},
[24944] = {talentID = 828, rank = 2},
[24945] = {talentID = 828, rank = 3},
[24946] = {talentID = 828, rank = 4},
-- imp tranquility
[17123] = {talentID = 842, rank = 0},
[17124] = {talentID = 842, rank = 1},
-- empowered touch
[33879] = {talentID = 1788, rank = 0},
[33880] = {talentID = 1788, rank = 1},
-- nature's bounty
[17074] = {talentID = 825, rank = 0},
[17075] = {talentID = 825, rank = 1},
[17076] = {talentID = 825, rank = 2},
[17077] = {talentID = 825, rank = 3},
[17078] = {talentID = 825, rank = 4},
-- living spirit
[34151] = {talentID = 1797, rank = 0},
[34152] = {talentID = 1797, rank = 1},
[34153] = {talentID = 1797, rank = 2},
-- swiftmend
[18562] = {talentID = 844, rank = 0},
-- natural perfection
[33881] = {talentID = 1790, rank = 0},
[33882] = {talentID = 1790, rank = 1},
[33883] = {talentID = 1790, rank = 2},
-- empowered rejuvenation
[33886] = {talentID = 1789, rank = 0},
[33887] = {talentID = 1789, rank = 1},
[33888] = {talentID = 1789, rank = 2},
[33889] = {talentID = 1789, rank = 3},
[33890] = {talentID = 1789, rank = 4},
-- living seed
[48496] = {talentID = 1922, rank = 0},
[48499] = {talentID = 1922, rank = 1},
[48500] = {talentID = 1922, rank = 2},
-- revitalize
[48539] = {talentID = 1929, rank = 0},
[48544] = {talentID = 1929, rank = 1},
[48545] = {talentID = 1929, rank = 2},
-- tree of life
[65139] = {talentID = 1791, rank = 0},
-- imp tree of life
[48535] = {talentID = 1930, rank = 0},
[48536] = {talentID = 1930, rank = 1},
[48537] = {talentID = 1930, rank = 2},
-- imp barkskin
[63410] = {talentID = 2264, rank = 0},
[63411] = {talentID = 2264, rank = 1},
-- gift of the earthmother
[51179] = {talentID = 1916, rank = 0},
[51180] = {talentID = 1916, rank = 1},
[51181] = {talentID = 1916, rank = 2},
[51182] = {talentID = 1916, rank = 3},
[51183] = {talentID = 1916, rank = 4},
-- wild growth
[48438] = {talentID = 1917, rank = 0},

-- bm hunter
-- imp aspect of the hawk
[19552] = {talentID = 1382, rank = 0},
[19553] = {talentID = 1382, rank = 1},
[19554] = {talentID = 1382, rank = 2},
[19555] = {talentID = 1382, rank = 3},
[19556] = {talentID = 1382, rank = 4},
-- endurance training
[19583] = {talentID = 1389, rank = 0},
[19584] = {talentID = 1389, rank = 1},
[19585] = {talentID = 1389, rank = 2},
[19586] = {talentID = 1389, rank = 3},
[19587] = {talentID = 1389, rank = 4},
-- focused fire
[35029] = {talentID = 1624, rank = 0},
[35030] = {talentID = 1624, rank = 1},
-- imp aspect of the monkey
[19549] = {talentID = 1381, rank = 0},
[19550] = {talentID = 1381, rank = 1},
[19551] = {talentID = 1381, rank = 2},
-- thick hide
[19609] = {talentID = 1395, rank = 0},
[19610] = {talentID = 1395, rank = 1},
[19612] = {talentID = 1395, rank = 2},
-- imp revive pet
[24443] = {talentID = 1625, rank = 0},
[19575] = {talentID = 1625, rank = 1},
-- pathfinding
[19559] = {talentID = 1384, rank = 0},
[19560] = {talentID = 1384, rank = 1},
-- aspect mastery
[53265] = {talentID = 2138, rank = 0},
-- unleashed fury
[19616] = {talentID = 1396, rank = 0},
[19617] = {talentID = 1396, rank = 1},
[19618] = {talentID = 1396, rank = 2},
[19619] = {talentID = 1396, rank = 3},
[19620] = {talentID = 1396, rank = 4},
-- imp mend pet
[19572] = {talentID = 1385, rank = 0},
[19573] = {talentID = 1385, rank = 1},
-- ferocity
[19598] = {talentID = 1393, rank = 0},
[19599] = {talentID = 1393, rank = 1},
[19600] = {talentID = 1393, rank = 2},
[19601] = {talentID = 1393, rank = 3},
[19602] = {talentID = 1393, rank = 4},
-- spirit bond
[19578] = {talentID = 1388, rank = 0},
[20895] = {talentID = 1388, rank = 1},
-- intimidation
[19577] = {talentID = 1387, rank = 0},
-- bestial discipline
[19590] = {talentID = 1390, rank = 0},
[19592] = {talentID = 1390, rank = 1},
-- animal handler
[34453] = {talentID = 1799, rank = 0},
[34454] = {talentID = 1799, rank = 1},
-- frenzy
[19621] = {talentID = 1397, rank = 0},
[19622] = {talentID = 1397, rank = 1},
[19623] = {talentID = 1397, rank = 2},
[19624] = {talentID = 1397, rank = 3},
[19625] = {talentID = 1397, rank = 4},
-- ferocious insipiration
[34455] = {talentID = 1800, rank = 0},
[34459] = {talentID = 1800, rank = 1},
[34460] = {talentID = 1800, rank = 2},
-- bestial wrath
[19574] = {talentID = 1386, rank = 0},
-- catlike reflexes
[34462] = {talentID = 1801, rank = 0},
[34464] = {talentID = 1801, rank = 1},
[34465] = {talentID = 1801, rank = 2},
-- invigoration
[53252] = {talentID = 2136, rank = 0},
[53253] = {talentID = 2136, rank = 1},
-- serpent swiftness
[34466] = {talentID = 1802, rank = 0},
[34467] = {talentID = 1802, rank = 1},
[34468] = {talentID = 1802, rank = 2},
[34469] = {talentID = 1802, rank = 3},
[34470] = {talentID = 1802, rank = 4},
-- longevity
[53262] = {talentID = 2140, rank = 0},
[53263] = {talentID = 2140, rank = 1},
[53264] = {talentID = 2140, rank = 2},
-- the beast within
[34692] = {talentID = 1803, rank = 0},
-- cobra strikes
[53256] = {talentID = 2137, rank = 0},
[53259] = {talentID = 2137, rank = 1},
[53260] = {talentID = 2137, rank = 2},
-- kindred spirits
[56314] = {talentID = 2227, rank = 0},
[56315] = {talentID = 2227, rank = 1},
[56316] = {talentID = 2227, rank = 2},
[56317] = {talentID = 2227, rank = 3},
[56318] = {talentID = 2227, rank = 4},
-- beast mastery
[53270] = {talentID = 2139, rank = 0},

-- mm / marksmanship
-- imp concussive shot
[19407] = {talentID = 1341, rank = 0},
[19412] = {talentID = 1341, rank = 1},
-- focused aim
[53620] = {talentID = 2197, rank = 0},
[53621] = {talentID = 2197, rank = 1},
[53622] = {talentID = 2197, rank = 2},
-- lethal shots
[19426] = {talentID = 1344, rank = 0},
[19427] = {talentID = 1344, rank = 1},
[19429] = {talentID = 1344, rank = 2},
[19430] = {talentID = 1344, rank = 3},
[19431] = {talentID = 1344, rank = 4},
-- careful aim
[34482] = {talentID = 1806, rank = 0},
[34483] = {talentID = 1806, rank = 1},
[34484] = {talentID = 1806, rank = 2},
-- imp hunters mark
[19421] = {talentID = 1343, rank = 0},
[19422] = {talentID = 1343, rank = 1},
[19423] = {talentID = 1343, rank = 2},
-- mortal shots
[19485] = {talentID = 1349, rank = 0},
[19487] = {talentID = 1349, rank = 1},
[19488] = {talentID = 1349, rank = 2},
[19489] = {talentID = 1349, rank = 3},
[19490] = {talentID = 1349, rank = 4},
-- go for the throat
[34950] = {talentID = 1818, rank = 0},
[34954] = {talentID = 1818, rank = 1},
-- imp arcane shot
[19454] = {talentID = 1346, rank = 0},
[19455] = {talentID = 1346, rank = 1},
[19456] = {talentID = 1346, rank = 2},
-- aimed shot
[19434] = {talentID = 1345, rank = 0},
-- rapid killing
[34948] = {talentID = 1819, rank = 0},
[34949] = {talentID = 1819, rank = 1},
-- imp stings
[19464] = {talentID = 1348, rank = 0},
[19465] = {talentID = 1348, rank = 1},
[19466] = {talentID = 1348, rank = 2},
-- efficiency
[19416] = {talentID = 1342, rank = 0},
[19417] = {talentID = 1342, rank = 1},
[19418] = {talentID = 1342, rank = 2},
[19419] = {talentID = 1342, rank = 3},
[19420] = {talentID = 1342, rank = 4},
-- concussive barrage
[35100] = {talentID = 1351, rank = 0},
[35102] = {talentID = 1351, rank = 1},
-- readiness
[23989] = {talentID = 1353, rank = 0},
-- barrage
[19461] = {talentID = 1347, rank = 0},
[19462] = {talentID = 1347, rank = 1},
[24691] = {talentID = 1347, rank = 2},
-- combat experience
[34475] = {talentID = 1804, rank = 0},
[34476] = {talentID = 1804, rank = 1},

-- ranged weapon specialization
[19507] = {talentID = 1362, rank = 0},
[19508] = {talentID = 1362, rank = 1},
[19509] = {talentID = 1362, rank = 2},

-- piercing shots
[53234] = {talentID = 2130, rank = 0},
[53237] = {talentID = 2130, rank = 1},
[53238] = {talentID = 2130, rank = 2},

-- trueshot aura
[19506] = {talentID = 1361, rank = 0},

-- imp barrage
[35104] = {talentID = 1821, rank = 0},
[35110] = {talentID = 1821, rank = 1},
[35111] = {talentID = 1821, rank = 2},

-- master marksman
[34485] = {talentID = 1807, rank = 0},
[34486] = {talentID = 1807, rank = 1},
[34487] = {talentID = 1807, rank = 2},
[34488] = {talentID = 1807, rank = 3},
[34489] = {talentID = 1807, rank = 4},

-- rapid recuperation
[53228] = {talentID = 2131, rank = 0},
[53232] = {talentID = 2131, rank = 1},

-- wild quiver
[53215] = {talentID = 2132, rank = 0},
[53216] = {talentID = 2132, rank = 1},
[53217] = {talentID = 2132, rank = 2},

-- silencing shot
[34490] = {talentID = 1808, rank = 0},

-- imp steady shot
[53221] = {talentID = 2133, rank = 0},
[53222] = {talentID = 2133, rank = 1},
[53224] = {talentID = 2133, rank = 2},

-- marked for death
[53241] = {talentID = 2134, rank = 0},
[53243] = {talentID = 2134, rank = 1},
[53244] = {talentID = 2134, rank = 2},
[53245] = {talentID = 2134, rank = 3},
[53246] = {talentID = 2134, rank = 4},

-- chimera shot
[53209] = {talentID = 2135, rank = 0},

-- survival
-- improved tracking
[52783] = {talentID = 1623, rank = 0},
[52785] = {talentID = 1623, rank = 1},
[52786] = {talentID = 1623, rank = 2},
[52787] = {talentID = 1623, rank = 3},
[52788] = {talentID = 1623, rank = 4},

-- hawk erye
[19498] = {talentID = 1820, rank = 0},
[19499] = {talentID = 1820, rank = 1},
[19500] = {talentID = 1820, rank = 2},

-- savage strikes
[19159] = {talentID = 1621, rank = 0},
[19160] = {talentID = 1621, rank = 1},

-- surefooted
[19290] = {talentID = 1310, rank = 0},
[19294] = {talentID = 1310, rank = 1},
[24283] = {talentID = 1310, rank = 2},

-- entrapment
[19184] = {talentID = 1304, rank = 0},
[19387] = {talentID = 1304, rank = 1},
[19388] = {talentID = 1304, rank = 2},
-- trap mastery
[19376] = {talentID = 1305, rank = 0},
[63457] = {talentID = 1305, rank = 1},
[63458] = {talentID = 1305, rank = 2},
-- survival instincts
[34494] = {talentID = 1810, rank = 0},
[34496] = {talentID = 1810, rank = 1},
-- survivalist
[19255] = {talentID = 1622, rank = 0},
[19256] = {talentID = 1622, rank = 1},
[19257] = {talentID = 1622, rank = 2},
[19258] = {talentID = 1622, rank = 3},
[19259] = {talentID = 1622, rank = 4},
-- scatter shot
[19503] = {talentID = 1814, rank = 0},
-- deflection
[19295] = {talentID = 1311, rank = 0},
[19297] = {talentID = 1311, rank = 1},
[19298] = {talentID = 1311, rank = 2},
-- survival tactis
[19286] = {talentID = 1309, rank = 0},
[19287] = {talentID = 1309, rank = 1},
-- t.n.t.
[56333] = {talentID = 2229, rank = 0},
[56336] = {talentID = 2229, rank = 1},
[56337] = {talentID = 2229, rank = 2},
-- lock and load
[56342] = {talentID = 1306, rank = 0},
[56343] = {talentID = 1306, rank = 1},
[56344] = {talentID = 1306, rank = 2},
-- hunter vs wild
[56339] = {talentID = 2228, rank = 0},
[56340] = {talentID = 2228, rank = 1},
[56341] = {talentID = 2228, rank = 2},
-- killer instinct
[19370] = {talentID = 1321, rank = 0},
[19371] = {talentID = 1321, rank = 1},
[19373] = {talentID = 1321, rank = 2},
-- counterattack
[19306] = {talentID = 1312, rank = 0},
-- lightning reflexes
[19168] = {talentID = 1303, rank = 0},
[19180] = {talentID = 1303, rank = 1},
[19181] = {talentID = 1303, rank = 2},
[24296] = {talentID = 1303, rank = 3},
[24297] = {talentID = 1303, rank = 4},
-- resourcefulness
[34491] = {talentID = 1809, rank = 0},
[34492] = {talentID = 1809, rank = 1},
[34493] = {talentID = 1809, rank = 2},

-- expose weakness
[34500] = {talentID = 1812, rank = 0},
[34502] = {talentID = 1812, rank = 1},
[34503] = {talentID = 1812, rank = 2},

-- wyvern sting
[19386] = {talentID = 1325, rank = 0},

-- thrill of the hunt
[34497] = {talentID = 1811, rank = 0},
[34498] = {talentID = 1811, rank = 1},
[34499] = {talentID = 1811, rank = 2},

-- master tactician
[34506] = {talentID = 1813, rank = 0},
[34507] = {talentID = 1813, rank = 1},
[34508] = {talentID = 1813, rank = 2},
[34838] = {talentID = 1813, rank = 3},
[34839] = {talentID = 1813, rank = 4},

-- noxious stings
[53295] = {talentID = 2141, rank = 0},
[53296] = {talentID = 2141, rank = 1},
[53297] = {talentID = 2141, rank = 2},

-- point of no escape
[53298] = {talentID = 2142, rank = 0},
[53299] = {talentID = 2142, rank = 1},


-- black arrow
[3674] = {talentID = 1322, rank = 0},

-- sniper training
[53302] = {talentID = 2143, rank = 0},
[53303] = {talentID = 2143, rank = 1},
[53304] = {talentID = 2143, rank = 2},

-- hunting party
[53290] = {talentID = 2144, rank = 0},
[53291] = {talentID = 2144, rank = 1},
[53292] = {talentID = 2144, rank = 2},

-- explosive shot
[53301] = {talentID = 2145, rank = 0},


-- elemental
-- convection
    [16039] = {talentID = 564, rank = 0},
    [16109] = {talentID = 564, rank = 1},
    [16110] = {talentID = 564, rank = 2},
    [16111] = {talentID = 564, rank = 3},
    [16112] = {talentID = 564, rank = 4},

-- concussion
    [16035] = {talentID = 563, rank = 0},
    [16105] = {talentID = 563, rank = 1},
    [16106] = {talentID = 563, rank = 2},
    [16107] = {talentID = 563, rank = 3},
    [16108] = {talentID = 563, rank = 4},

-- call of flame
    [16038] = {talentID = 561, rank = 0},
    [16160] = {talentID = 561, rank = 1},
    [16161] = {talentID = 561, rank = 2},

-- elemental warding
    [28996] = {talentID = 1640, rank = 0},
    [28997] = {talentID = 1640, rank = 1},
    [28998] = {talentID = 1640, rank = 2},

-- elemental devastation
    [30160] = {talentID = 1645, rank = 0},
    [29179] = {talentID = 1645, rank = 1},
    [29180] = {talentID = 1645, rank = 2},

-- reverberation
    [16040] = {talentID = 575, rank = 0},
    [16113] = {talentID = 575, rank = 1},
    [16114] = {talentID = 575, rank = 2},
    [16115] = {talentID = 575, rank = 3},
    [16116] = {talentID = 575, rank = 4},

-- elemental focus
    [16164] = {talentID = 574, rank = 0},

-- elemental fury
    [16089] = {talentID = 565, rank = 0},
    [60184] = {talentID = 565, rank = 1},
    [60185] = {talentID = 565, rank = 2},
    [60187] = {talentID = 565, rank = 3},
    [60188] = {talentID = 565, rank = 4},

-- imp fire nova
    [16086] = {talentID = 567, rank = 0},
    [16544] = {talentID = 567, rank = 1},

-- eye of the storm
    [29062] = {talentID = 1642, rank = 0},
    [29064] = {talentID = 1642, rank = 1},
    [29065] = {talentID = 1642, rank = 2},

-- elemental reach
    [28999] = {talentID = 1641, rank = 0},
    [29000] = {talentID = 1641, rank = 1},

-- call of thunder
    [16041] = {talentID = 562, rank = 0},

-- unrelenting storm
    [30664] = {talentID = 1682, rank = 0},
    [30665] = {talentID = 1682, rank = 1},
    [30666] = {talentID = 1682, rank = 2},

-- elemental precision
    [30672] = {talentID = 1685, rank = 0},
    [30673] = {talentID = 1685, rank = 1},
    [30674] = {talentID = 1685, rank = 2},

-- lightning mastery
    [16578] = {talentID = 721, rank = 0},
    [16579] = {talentID = 721, rank = 1},
    [16580] = {talentID = 721, rank = 2},
    [16581] = {talentID = 721, rank = 3},
    [16582] = {talentID = 721, rank = 4},

-- elemental mastery
    [16166] = {talentID = 573, rank = 0},

-- storm, earth and fire
    [51483] = {talentID = 2052, rank = 0},
    [51485] = {talentID = 2052, rank = 1},
    [51486] = {talentID = 2052, rank = 2},

-- booming echoes
    [63370] = {talentID = 2262, rank = 0},
    [63372] = {talentID = 2262, rank = 1},

-- elemental oath
    [51466] = {talentID = 2049, rank = 0},
    [51470] = {talentID = 2049, rank = 1},

-- lightning overload
    [30675] = {talentID = 1686, rank = 0},
    [30678] = {talentID = 1686, rank = 1},
    [30679] = {talentID = 1686, rank = 2},

-- astral shift
    [51474] = {talentID = 2050, rank = 0},
    [51478] = {talentID = 2050, rank = 1},
    [51479] = {talentID = 2050, rank = 2},

-- totem of wrath
    [30706] = {talentID = 1687, rank = 0},

-- lava flows
    [51480] = {talentID = 2051, rank = 0},
    [51481] = {talentID = 2051, rank = 1},
    [51482] = {talentID = 2051, rank = 2},

-- shamanism
    [62097] = {talentID = 2252, rank = 0},
    [62098] = {talentID = 2252, rank = 1},
    [62099] = {talentID = 2252, rank = 2},
    [62100] = {talentID = 2252, rank = 3},
    [62101] = {talentID = 2252, rank = 4},

-- thunderstorm
    [51490] = {talentID = 2053, rank = 0},
	

-- enhance
-- enhancing totems
    [16259] = {talentID = 610, rank = 0},
    [16295] = {talentID = 610, rank = 1},
    [52456] = {talentID = 610, rank = 2},

-- earths grasp
    [16043] = {talentID = 2101, rank = 0},
    [16130] = {talentID = 2101, rank = 1},

-- ancestral knowledge
    [17485] = {talentID = 614, rank = 0},
    [17486] = {talentID = 614, rank = 1},
    [17487] = {talentID = 614, rank = 2},
    [17488] = {talentID = 614, rank = 3},
    [17489] = {talentID = 614, rank = 4},

-- guardian totems
    [16258] = {talentID = 609, rank = 0},
    [16293] = {talentID = 609, rank = 1},

-- thundering strikes
    [16255] = {talentID = 613, rank = 0},
    [16302] = {talentID = 613, rank = 1},
    [16303] = {talentID = 613, rank = 2},
    [16304] = {talentID = 613, rank = 3},
    [16305] = {talentID = 613, rank = 4},

-- imp ghost wolf
    [16262] = {talentID = 605, rank = 0},
    [16287] = {talentID = 605, rank = 1},

-- improved shields
    [16261] = {talentID = 607, rank = 0},
    [16290] = {talentID = 607, rank = 1},
    [51881] = {talentID = 607, rank = 2},

-- elemental weapons
    [16266] = {talentID = 611, rank = 0},
    [29079] = {talentID = 611, rank = 1},
    [29080] = {talentID = 611, rank = 2},

-- shamanistic focus
    [43338] = {talentID = 617, rank = 0},

-- ancitipation
    [16254] = {talentID = 601, rank = 0},
    [16271] = {talentID = 601, rank = 1},
    [16272] = {talentID = 601, rank = 2},

-- flurry
    [16256] = {talentID = 602, rank = 0},
    [16281] = {talentID = 602, rank = 1},
    [16282] = {talentID = 602, rank = 2},
    [16283] = {talentID = 602, rank = 3},
    [16284] = {talentID = 602, rank = 4},

-- touhness
    [16252] = {talentID = 615, rank = 0},
    [16306] = {talentID = 615, rank = 1},
    [16307] = {talentID = 615, rank = 2},
    [16308] = {talentID = 615, rank = 3},
    [16309] = {talentID = 615, rank = 4},

-- imp windfury totem
    [29192] = {talentID = 1647, rank = 0},
    [29193] = {talentID = 1647, rank = 1},

-- spirit weapons
    [16268] = {talentID = 616, rank = 0},

-- mental dexterity
    [51883] = {talentID = 2083, rank = 0},
    [51884] = {talentID = 2083, rank = 1},
    [51885] = {talentID = 2083, rank = 2},

-- unleashed rage
    [30802] = {talentID = 1689, rank = 0},
    [30808] = {talentID = 1689, rank = 1},
    [30809] = {talentID = 1689, rank = 2},

-- weapon mastery
    [29082] = {talentID = 1643, rank = 0},
    [29084] = {talentID = 1643, rank = 1},
    [29086] = {talentID = 1643, rank = 2},

-- frozen power
    [63373] = {talentID = 2263, rank = 0},
    [63374] = {talentID = 2263, rank = 1},

-- dual wield spec
    [30816] = {talentID = 1692, rank = 0},
    [30818] = {talentID = 1692, rank = 1},
    [30819] = {talentID = 1692, rank = 2},

-- dual wield
    [30798] = {talentID = 1690, rank = 0},

-- stormstrike
    [17364] = {talentID = 901, rank = 0},

-- static shock
    [51525] = {talentID = 2055, rank = 0},
    [51526] = {talentID = 2055, rank = 1},
    [51527] = {talentID = 2055, rank = 2},
	
-- lava lash
    [60103] = {talentID = 2249, rank = 0},

-- imp stormstrike
    [51521] = {talentID = 2054, rank = 0},
    [51522] = {talentID = 2054, rank = 1},

-- mental quickness
    [30812] = {talentID = 1691, rank = 0},
    [30813] = {talentID = 1691, rank = 1},
    [30814] = {talentID = 1691, rank = 2},

-- shamanistic rage
    [30823] = {talentID = 1693, rank = 0},

-- earthen power
    [51523] = {talentID = 2056, rank = 0},
    [51524] = {talentID = 2056, rank = 1},

-- maelstrom weapon
    [51528] = {talentID = 2057, rank = 0},
    [51529] = {talentID = 2057, rank = 1},
    [51530] = {talentID = 2057, rank = 2},
    [51531] = {talentID = 2057, rank = 3},
    [51532] = {talentID = 2057, rank = 4},

-- feral spirit
    [51533] = {talentID = 2058, rank = 0},
	
-- resto
-- imp healing wave
[16182] = {talentID = 586, rank = 0},
[16226] = {talentID = 586, rank = 1},
[16227] = {talentID = 586, rank = 2},
[16228] = {talentID = 586, rank = 3},
[16229] = {talentID = 586, rank = 4},

-- totemic focus
[16173] = {talentID = 595, rank = 0},
[16222] = {talentID = 595, rank = 1},
[16223] = {talentID = 595, rank = 2},
[16224] = {talentID = 595, rank = 3},
[16225] = {talentID = 595, rank = 4},

-- imp reincarnation
[16184] = {talentID = 589, rank = 0},
[16209] = {talentID = 589, rank = 1},

-- healing grace
[29187] = {talentID = 1646, rank = 0},
[29189] = {talentID = 1646, rank = 1},
[29191] = {talentID = 1646, rank = 2},

-- tidal focus
[16179] = {talentID = 593, rank = 0},
[16214] = {talentID = 593, rank = 1},
[16215] = {talentID = 593, rank = 2},
[16216] = {talentID = 593, rank = 3},
[16217] = {talentID = 593, rank = 4},

-- imp water shield
[16180] = {talentID = 583, rank = 0},
[16196] = {talentID = 583, rank = 1},
[16198] = {talentID = 583, rank = 2},
-- healing focus
[16181] = {talentID = 587, rank = 0},
[16230] = {talentID = 587, rank = 1},
[16232] = {talentID = 587, rank = 2},

-- tidal force
[55198] = {talentID = 582, rank = 0},

-- ancestral healing
[16176] = {talentID = 581, rank = 0},
[16235] = {talentID = 581, rank = 1},
[16240] = {talentID = 581, rank = 2},

-- restorative totems
[16187] = {talentID = 588, rank = 0},
[16205] = {talentID = 588, rank = 1},
[16206] = {talentID = 588, rank = 2},

-- tidal mastery
[16194] = {talentID = 594, rank = 0},
[16218] = {talentID = 594, rank = 1},
[16219] = {talentID = 594, rank = 2},
[16220] = {talentID = 594, rank = 3},
[16221] = {talentID = 594, rank = 4},

-- healing way
[29206] = {talentID = 1648, rank = 0},
[29205] = {talentID = 1648, rank = 1},
[29202] = {talentID = 1648, rank = 2},

-- NS
[16188] = {talentID = 591, rank = 0},

-- focused mind
[30864] = {talentID = 1695, rank = 0},
[30865] = {talentID = 1695, rank = 1},
[30866] = {talentID = 1695, rank = 2},

-- purification
[16178] = {talentID = 592, rank = 0},
[16210] = {talentID = 592, rank = 1},
[16211] = {talentID = 592, rank = 2},
[16212] = {talentID = 592, rank = 3},
[16213] = {talentID = 592, rank = 4},

-- nature's guardian
[30881] = {talentID = 1699, rank = 0},
[30883] = {talentID = 1699, rank = 1},
[30884] = {talentID = 1699, rank = 2},
[30885] = {talentID = 1699, rank = 3},
[30886] = {talentID = 1699, rank = 4},

-- mana tide totem
[16190] = {talentID = 590, rank = 0},

-- cleanse spirit
[51886] = {talentID = 2084, rank = 0},

-- blessing of the eternals
[51554] = {talentID = 2060, rank = 0},
[51555] = {talentID = 2060, rank = 1},

-- improved chain heal
[30872] = {talentID = 1697, rank = 0},
[30873] = {talentID = 1697, rank = 1},

-- nature's blessing
[30867] = {talentID = 1696, rank = 0},
[30868] = {talentID = 1696, rank = 1},
[30869] = {talentID = 1696, rank = 2},

-- ancestral awakening
[51556] = {talentID = 2061, rank = 0},
[51557] = {talentID = 2061, rank = 1},
[51558] = {talentID = 2061, rank = 2},

-- earth shield
[974] = {talentID = 1698, rank = 0},

-- improved earth shield
[51560] = {talentID = 2059, rank = 0},
[51561] = {talentID = 2059, rank = 1},

-- tidal waves
[51562] = {talentID = 2063, rank = 0},
[51563] = {talentID = 2063, rank = 1},
[51564] = {talentID = 2063, rank = 2},
[51565] = {talentID = 2063, rank = 3},
[51566] = {talentID = 2063, rank = 4},

-- riptide
[61295] = {talentID = 2064, rank = 0},


-- Holy
-- spiritual focus
[20205] = {talentID = 1432, rank = 0},
[20206] = {talentID = 1432, rank = 1},
[20207] = {talentID = 1432, rank = 2},
[20209] = {talentID = 1432, rank = 3},
[20208] = {talentID = 1432, rank = 4},

-- seals of the pure
[20224] = {talentID = 1463, rank = 0},
[20225] = {talentID = 1463, rank = 1},
[20330] = {talentID = 1463, rank = 2},
[20331] = {talentID = 1463, rank = 3},
[20332] = {talentID = 1463, rank = 4},

-- healing light
[20237] = {talentID = 1444, rank = 0},
[20238] = {talentID = 1444, rank = 1},
[20239] = {talentID = 1444, rank = 2},

-- divine intelect
[20257] = {talentID = 1449, rank = 0},
[20258] = {talentID = 1449, rank = 1},
[20259] = {talentID = 1449, rank = 2},
[20260] = {talentID = 1449, rank = 3},
[20261] = {talentID = 1449, rank = 4},

-- unyielding faith
[9453] = {talentID = 1628, rank = 0},
[25836] = {talentID = 1628, rank = 1},

-- aura mastery
[31821] = {talentID = 1435, rank = 0},

-- illumination
[20210] = {talentID = 1461, rank = 0},
[20212] = {talentID = 1461, rank = 1},
[20213] = {talentID = 1461, rank = 2},
[20214] = {talentID = 1461, rank = 3},
[20215] = {talentID = 1461, rank = 4},

-- improved lay on hands
[20234] = {talentID = 1443, rank = 0},
[20235] = {talentID = 1443, rank = 1},

-- imp concentration aura
[20254] = {talentID = 1450, rank = 0},
[20255] = {talentID = 1450, rank = 1},
[20256] = {talentID = 1450, rank = 2},

-- iump blessing of wisdom
[20244] = {talentID = 1446, rank = 0},
[20245] = {talentID = 1446, rank = 1},

-- blesed hands
[53660] = {talentID = 2198, rank = 0},
[53661] = {talentID = 2198, rank = 1},

-- pure of heart
[31822] = {talentID = 1742, rank = 0},
[31823] = {talentID = 1742, rank = 1},

-- divine favor
[20216] = {talentID = 1433, rank = 0},

-- sanctified light
[20359] = {talentID = 1465, rank = 0},
[20360] = {talentID = 1465, rank = 1},
[20361] = {talentID = 1465, rank = 2},

-- purifying power
[31825] = {talentID = 1743, rank = 0},
[31826] = {talentID = 1743, rank = 1},

-- holy power
[5923] = {talentID = 1627, rank = 0},
[5924] = {talentID = 1627, rank = 1},
[5925] = {talentID = 1627, rank = 2},
[5926] = {talentID = 1627, rank = 3},
[25829] = {talentID = 1627, rank = 4},

-- light's grace
[31833] = {talentID = 1745, rank = 0},
[31835] = {talentID = 1745, rank = 1},
[31836] = {talentID = 1745, rank = 2},

-- holy shock
[20473] = {talentID = 1502, rank = 0},

-- blessed life
[31828] = {talentID = 1744, rank = 0},
[31829] = {talentID = 1744, rank = 1},
[31830] = {talentID = 1744, rank = 2},

-- sacred cleansing
[53551] = {talentID = 2190, rank = 0},
[53552] = {talentID = 2190, rank = 1},
[53553] = {talentID = 2190, rank = 2},

-- holy guidance
[31837] = {talentID = 1746, rank = 0},
[31838] = {talentID = 1746, rank = 1},
[31839] = {talentID = 1746, rank = 2},
[31840] = {talentID = 1746, rank = 3},
[31841] = {talentID = 1746, rank = 4},

-- divine illumination
[31842] = {talentID = 1747, rank = 0},

-- judgements of the pure
[53671] = {talentID = 2199, rank = 0},
[53673] = {talentID = 2199, rank = 1},
[54151] = {talentID = 2199, rank = 2},
[54154] = {talentID = 2199, rank = 3},
[54155] = {talentID = 2199, rank = 4},

-- infusion of light
[53569] = {talentID = 2193, rank = 0},
[53576] = {talentID = 2193, rank = 1},

-- enlightented judgements
[53556] = {talentID = 2191, rank = 0},
[53557] = {talentID = 2191, rank = 1},

-- beacon of light
[53563] = {talentID = 2192, rank = 0},

-- prot
-- divinity
[63646] = {talentID = 1442, rank = 0},
[63647] = {talentID = 1442, rank = 1},
[63648] = {talentID = 1442, rank = 2},
[63649] = {talentID = 1442, rank = 3},
[63650] = {talentID = 1442, rank = 4},

-- divine strength
[20262] = {talentID = 2185, rank = 0},
[20263] = {talentID = 2185, rank = 1},
[20264] = {talentID = 2185, rank = 2},
[20265] = {talentID = 2185, rank = 3},
[20266] = {talentID = 2185, rank = 4},

-- stoicism
[31844] = {talentID = 1748, rank = 0},
[31845] = {talentID = 1748, rank = 1},
[53519] = {talentID = 1748, rank = 2},

-- guardian's favor
[20174] = {talentID = 1425, rank = 0},
[20175] = {talentID = 1425, rank = 1},

-- anticipation
[20096] = {talentID = 1629, rank = 0},
[20097] = {talentID = 1629, rank = 1},
[20098] = {talentID = 1629, rank = 2},
[20099] = {talentID = 1629, rank = 3},
[20100] = {talentID = 1629, rank = 4},

-- divine sacrifice
[64205] = {talentID = 2280, rank = 0},

-- imp righteous fury
[20468] = {talentID = 1501, rank = 0},
[20469] = {talentID = 1501, rank = 1},
[20470] = {talentID = 1501, rank = 2},

-- toughness
[20143] = {talentID = 1423, rank = 0},
[20144] = {talentID = 1423, rank = 1},
[20145] = {talentID = 1423, rank = 2},
[20146] = {talentID = 1423, rank = 3},
[20147] = {talentID = 1423, rank = 4},

-- divine guardian
[53527] = {talentID = 2281, rank = 0},
[53530] = {talentID = 2281, rank = 1},

-- imp hoj
[20487] = {talentID = 1521, rank = 0},
[20488] = {talentID = 1521, rank = 1},

-- imp devo aura
[20138] = {talentID = 1422, rank = 0},
[20139] = {talentID = 1422, rank = 1},
[20140] = {talentID = 1422, rank = 2},

-- blesing of sanctury
[20911] = {talentID = 1431, rank = 0},

-- reckoning
[20177] = {talentID = 1426, rank = 0},
[20179] = {talentID = 1426, rank = 1},
[20181] = {talentID = 1426, rank = 2},
[20180] = {talentID = 1426, rank = 3},
[20182] = {talentID = 1426, rank = 4},

-- sacred duty
[31848] = {talentID = 1750, rank = 0},
[31849] = {talentID = 1750, rank = 1},

-- one handed weapon spec
[20196] = {talentID = 1429, rank = 0},
[20197] = {talentID = 1429, rank = 1},
[20198] = {talentID = 1429, rank = 2},

-- spiritual attunement
[31785] = {talentID = 2282, rank = 0},
[33776] = {talentID = 2282, rank = 1},

-- holy shield
[20925] = {talentID = 1430, rank = 0},

-- ardent defender
[31850] = {talentID = 1751, rank = 0},
[31851] = {talentID = 1751, rank = 1},
[31852] = {talentID = 1751, rank = 2},

-- redoubt
[20127] = {talentID = 1421, rank = 0},
[20130] = {talentID = 1421, rank = 1},
[20135] = {talentID = 1421, rank = 2},

-- combat expertise
[31858] = {talentID = 1753, rank = 0},
[31859] = {talentID = 1753, rank = 1},
[31860] = {talentID = 1753, rank = 2},

-- touched by the light
[53590] = {talentID = 2195, rank = 0},
[53591] = {talentID = 2195, rank = 1},
[53592] = {talentID = 2195, rank = 2},

-- avenger's shield
[31935] = {talentID = 1754, rank = 0},

-- guarded by the light
[53583] = {talentID = 2194, rank = 0},
[53585] = {talentID = 2194, rank = 1},

-- shield of the templar
[53709] = {talentID = 2204, rank = 0},
[53710] = {talentID = 2204, rank = 1},
[53711] = {talentID = 2204, rank = 2},

-- judgements of the just
[53695] = {talentID = 2200, rank = 0},
[53696] = {talentID = 2200, rank = 1},

-- hammer of righteous
[53595] = {talentID = 2196, rank = 0},


-- ret
-- deflection
[20060] = {talentID = 1403, rank = 0},
[20061] = {talentID = 1403, rank = 1},
[20062] = {talentID = 1403, rank = 2},
[20063] = {talentID = 1403, rank = 3},
[20064] = {talentID = 1403, rank = 4},

-- benedcition
[20101] = {talentID = 1407, rank = 0},
[20102] = {talentID = 1407, rank = 1},
[20103] = {talentID = 1407, rank = 2},
[20104] = {talentID = 1407, rank = 3},
[20105] = {talentID = 1407, rank = 4},

-- imp judgements
[25956] = {talentID = 1631, rank = 0},
[25957] = {talentID = 1631, rank = 1},

-- heart of the crusader
[20335] = {talentID = 1464, rank = 0},
[20336] = {talentID = 1464, rank = 1},
[20337] = {talentID = 1464, rank = 2},

-- imp blessing of might
[20042] = {talentID = 1401, rank = 0},
[20045] = {talentID = 1401, rank = 1},

-- vindication
[9452] = {talentID = 1633, rank = 0},
[26016] = {talentID = 1633, rank = 1},

-- conviction
[20117] = {talentID = 1411, rank = 0},
[20118] = {talentID = 1411, rank = 1},
[20119] = {talentID = 1411, rank = 2},
[20120] = {talentID = 1411, rank = 3},
[20121] = {talentID = 1411, rank = 4},

-- seal of command
[20375] = {talentID = 1481, rank = 0},

-- pursuit of justice
[26022] = {talentID = 1634, rank = 0},
[26023] = {talentID = 1634, rank = 1},

-- eye of an eye
[9799] = {talentID = 1632, rank = 0},
[25988] = {talentID = 1632, rank = 1},

-- sanctify of battle
[32043] = {talentID = 1761, rank = 0},
[35396] = {talentID = 1761, rank = 1},
[35397] = {talentID = 1761, rank = 2},

-- crusade
[31866] = {talentID = 1755, rank = 0},
[31867] = {talentID = 1755, rank = 1},
[31868] = {talentID = 1755, rank = 2},

-- two handed weapon spec
[20111] = {talentID = 1410, rank = 0},
[20112] = {talentID = 1410, rank = 1},
[20113] = {talentID = 1410, rank = 2},

-- sanctified retri
[31869] = {talentID = 1756, rank = 0},

-- vengeance
[20049] = {talentID = 1402, rank = 0},
[20056] = {talentID = 1402, rank = 1},
[20057] = {talentID = 1402, rank = 2},

-- divine purpose
[31871] = {talentID = 1757, rank = 0},
[31872] = {talentID = 1757, rank = 1},

-- the art of war
[53486] = {talentID = 2176, rank = 0},
[53488] = {talentID = 2176, rank = 1},

-- Repentance
[20066] = {talentID = 1441, rank = 0},

-- judgements of the wise
[31876] = {talentID = 1758, rank = 0},
[31877] = {talentID = 1758, rank = 1},
[31878] = {talentID = 1758, rank = 2},

-- fanaticism
[31879] = {talentID = 1759, rank = 0},
[31880] = {talentID = 1759, rank = 1},
[31881] = {talentID = 1759, rank = 2},

-- sanctified wrath
[53375] = {talentID = 2147, rank = 0},
[53376] = {talentID = 2147, rank = 1},

-- swift retribution
[53379] = {talentID = 2148, rank = 0},
[53484] = {talentID = 2148, rank = 1},
[53648] = {talentID = 2148, rank = 2},

-- crusader strike
[35395] = {talentID = 1823, rank = 0},

-- sheath of light
[53501] = {talentID = 2179, rank = 0},
[53502] = {talentID = 2179, rank = 1},
[53503] = {talentID = 2179, rank = 2},

-- righteous vengeance
[53380] = {talentID = 2149, rank = 0},
[53381] = {talentID = 2149, rank = 1},
[53382] = {talentID = 2149, rank = 2},

-- divine storm
[53385] = {talentID = 2150, rank = 0},



-- warr

-- arms
-- improved heroic strike
[12282] = {talentID = 124, rank = 0},
[12663] = {talentID = 124, rank = 1},
[12664] = {talentID = 124, rank = 2},

-- deflection
[16462] = {talentID = 130, rank = 0},
[16463] = {talentID = 130, rank = 1},
[16464] = {talentID = 130, rank = 2},
[16465] = {talentID = 130, rank = 3},
[16466] = {talentID = 130, rank = 4},

-- improved rend
[12286] = {talentID = 127, rank = 0},
[12658] = {talentID = 127, rank = 1},

-- improved charge
[12285] = {talentID = 126, rank = 0},
[12697] = {talentID = 126, rank = 1},

-- iron will
[12300] = {talentID = 641, rank = 0},
[12959] = {talentID = 641, rank = 1},
[12960] = {talentID = 641, rank = 2},

-- tactical mastery
[12295] = {talentID = 128, rank = 0},
[12676] = {talentID = 128, rank = 1},
[12677] = {talentID = 128, rank = 2},

-- imp OP
[12290] = {talentID = 131, rank = 0},
[12963] = {talentID = 131, rank = 1},

-- anger management
[12296] = {talentID = 137, rank = 0},

-- impale
[16493] = {talentID = 662, rank = 0},
[16494] = {talentID = 662, rank = 1},

-- deep wounds
[12834] = {talentID = 121, rank = 0},
[12849] = {talentID = 121, rank = 1},
[12867] = {talentID = 121, rank = 2},

-- two hand weapon spec
[12163] = {talentID = 136, rank = 0},
[12711] = {talentID = 136, rank = 1},
[12712] = {talentID = 136, rank = 2},

-- taste for blood
[56636] = {talentID = 2232, rank = 0},
[56637] = {talentID = 2232, rank = 1},
[56638] = {talentID = 2232, rank = 2},

-- poleaxe spec
[12700] = {talentID = 132, rank = 0},
[12781] = {talentID = 132, rank = 1},
[12783] = {talentID = 132, rank = 2},
[12784] = {talentID = 132, rank = 3},
[12785] = {talentID = 132, rank = 4},

-- sweeping strikes
[12328] = {talentID = 133, rank = 0},

-- mace spec
[12284] = {talentID = 125, rank = 0},
[12701] = {talentID = 125, rank = 1},
[12702] = {talentID = 125, rank = 2},
[12703] = {talentID = 125, rank = 3},
[12704] = {talentID = 125, rank = 4},

-- sword spec
[12281] = {talentID = 123, rank = 0},
[12812] = {talentID = 123, rank = 1},
[12813] = {talentID = 123, rank = 2},
[12814] = {talentID = 123, rank = 3},
[12815] = {talentID = 123, rank = 4},

-- weapon mastery
[20504] = {talentID = 134, rank = 0},
[20505] = {talentID = 134, rank = 1},

-- imp hamstring
[12289] = {talentID = 129, rank = 0},
[12668] = {talentID = 129, rank = 1},
[23695] = {talentID = 129, rank = 2},

-- trauma
[46854] = {talentID = 1859, rank = 0},
[46855] = {talentID = 1859, rank = 1},

-- second wind
[29834] = {talentID = 1663, rank = 0},
[29838] = {talentID = 1663, rank = 1},

-- mortal strike
[12294] = {talentID = 135, rank = 0},

-- strength of arms
[46865] = {talentID = 1862, rank = 0},
[46866] = {talentID = 1862, rank = 1},

-- imp slam
[12862] = {talentID = 2233, rank = 0},
[12330] = {talentID = 2233, rank = 1},

-- juggernaut
[64976] = {talentID = 2283, rank = 0},

-- imp MS
[35446] = {talentID = 1824, rank = 0},
[35448] = {talentID = 1824, rank = 1},
[35449] = {talentID = 1824, rank = 2},

-- unrelenting assault
[46859] = {talentID = 1860, rank = 0},
[46860] = {talentID = 1860, rank = 1},

-- sudden death
[29723] = {talentID = 1662, rank = 0},
[29725] = {talentID = 1662, rank = 1},
[29724] = {talentID = 1662, rank = 2},

-- endless rage
[29623] = {talentID = 1661, rank = 0},

-- blood frenzy
[29836] = {talentID = 1664, rank = 0},
[29859] = {talentID = 1664, rank = 1},

-- wrecking crew
[46867] = {talentID = 2231, rank = 0},
[56611] = {talentID = 2231, rank = 1},
[56612] = {talentID = 2231, rank = 2},
[56613] = {talentID = 2231, rank = 3},
[56614] = {talentID = 2231, rank = 4},

-- bladestorm
[46924] = {talentID = 1863, rank = 0},


-- fury
-- armored to the teeth
[61216] = {talentID = 2250, rank = 0},
[61221] = {talentID = 2250, rank = 1},
[61222] = {talentID = 2250, rank = 2},

-- booming voice
[12321] = {talentID = 158, rank = 0},
[12835] = {talentID = 158, rank = 1},

-- cruelty
[12320] = {talentID = 157, rank = 0},
[12852] = {talentID = 157, rank = 1},
[12853] = {talentID = 157, rank = 2},
[12855] = {talentID = 157, rank = 3},
[12856] = {talentID = 157, rank = 4},

-- imp demo shout
[12324] = {talentID = 161, rank = 0},
[12876] = {talentID = 161, rank = 1},
[12877] = {talentID = 161, rank = 2},
[12878] = {talentID = 161, rank = 3},
[12879] = {talentID = 161, rank = 4},

-- unbr wrath
[12322] = {talentID = 159, rank = 0},
[12999] = {talentID = 159, rank = 1},
[13000] = {talentID = 159, rank = 2},
[13001] = {talentID = 159, rank = 3},
[13002] = {talentID = 159, rank = 4},

-- imp cleave
[12329] = {talentID = 166, rank = 0},
[12950] = {talentID = 166, rank = 1},
[20496] = {talentID = 166, rank = 2},

-- piercing howl
[12323] = {talentID = 160, rank = 0},

-- blood craze
[16487] = {talentID = 661, rank = 0},
[16489] = {talentID = 661, rank = 1},
[16492] = {talentID = 661, rank = 2},

-- commanding presence
[12318] = {talentID = 154, rank = 0},
[12857] = {talentID = 154, rank = 1},
[12858] = {talentID = 154, rank = 2},
[12860] = {talentID = 154, rank = 3},
[12861] = {talentID = 154, rank = 4},

-- dual wield spec
[23584] = {talentID = 1581, rank = 0},
[23585] = {talentID = 1581, rank = 1},
[23586] = {talentID = 1581, rank = 2},
[23587] = {talentID = 1581, rank = 3},
[23588] = {talentID = 1581, rank = 4},

-- imp execute
[20502] = {talentID = 1542, rank = 0},
[20503] = {talentID = 1542, rank = 1},

-- enrage
[12317] = {talentID = 155, rank = 0},
[13045] = {talentID = 155, rank = 1},
[13046] = {talentID = 155, rank = 2},
[13047] = {talentID = 155, rank = 3},
[13048] = {talentID = 155, rank = 4},

-- precision
[29590] = {talentID = 1657, rank = 0},
[29591] = {talentID = 1657, rank = 1},
[29592] = {talentID = 1657, rank = 2},

-- Death Wish
[12292] = {talentID = 165, rank = 0},

-- imp intercept
[29888] = {talentID = 1543, rank = 0},
[29889] = {talentID = 1543, rank = 1},

-- Imp Berserker Rage
[20500] = {talentID = 1541, rank = 0},
[20501] = {talentID = 1541, rank = 1},

-- Flurry
[12319] = {talentID = 156, rank = 0},
[12971] = {talentID = 156, rank = 1},
[12972] = {talentID = 156, rank = 2},
[12973] = {talentID = 156, rank = 3},
[12974] = {talentID = 156, rank = 4},

-- intensify r age
[46908] = {talentID = 1864, rank = 0},
[46909] = {talentID = 1864, rank = 1},
[56924] = {talentID = 1864, rank = 2},

-- bloodthirst
[23881] = {talentID = 167, rank = 0},

-- imp whirlwind
[29721] = {talentID = 1655, rank = 0},
[29776] = {talentID = 1655, rank = 1},

-- furious attacks
[46910] = {talentID = 1865, rank = 0},
[46911] = {talentID = 1865, rank = 1},

-- improved berserker stance
[29759] = {talentID = 1658, rank = 0},
[29760] = {talentID = 1658, rank = 1},
[29761] = {talentID = 1658, rank = 2},
[29762] = {talentID = 1658, rank = 3},
[29763] = {talentID = 1658, rank = 4},

-- heroic fury
[60970] = {talentID = 1868, rank = 0},

-- rampage
[29801] = {talentID = 1659, rank = 0},

-- bloodsurge
[46913] = {talentID = 1866, rank = 0},
[46914] = {talentID = 1866, rank = 1},
[46915] = {talentID = 1866, rank = 2},

-- unending fury
[56927] = {talentID = 2234, rank = 0},
[56929] = {talentID = 2234, rank = 1},
[56930] = {talentID = 2234, rank = 2},
[56931] = {talentID = 2234, rank = 3},
[56932] = {talentID = 2234, rank = 4},

-- titan's grip
[46917] = {talentID = 1867, rank = 0},


-- prot
-- imp bloodrage
[12301] = {talentID = 142, rank = 0},
[12818] = {talentID = 142, rank = 1},

-- shield spec
[12298] = {talentID = 1601, rank = 0},
[12724] = {talentID = 1601, rank = 1},
[12725] = {talentID = 1601, rank = 2},
[12726] = {talentID = 1601, rank = 3},
[12727] = {talentID = 1601, rank = 4},

-- imp thunder clap
[12287] = {talentID = 141, rank = 0},
[12665] = {talentID = 141, rank = 1},
[12666] = {talentID = 141, rank = 2},

-- incite
[50685] = {talentID = 144, rank = 0},
[50686] = {talentID = 144, rank = 1},
[50687] = {talentID = 144, rank = 2},

-- anticipation
[12297] = {talentID = 138, rank = 0},
[12750] = {talentID = 138, rank = 1},
[12751] = {talentID = 138, rank = 2},
[12752] = {talentID = 138, rank = 3},
[12753] = {talentID = 138, rank = 4},

-- last stand
[12975] = {talentID = 153, rank = 0},

-- imp revenge
[12797] = {talentID = 147, rank = 0},
[12799] = {talentID = 147, rank = 1},

-- shield mastery 
[29598] = {talentID = 1654, rank = 0},
[29599] = {talentID = 1654, rank = 1},

-- toughness
[12299] = {talentID = 140, rank = 0},
[12761] = {talentID = 140, rank = 1},
[12762] = {talentID = 140, rank = 2},
[12763] = {talentID = 140, rank = 3},
[12764] = {talentID = 140, rank = 4},

-- imp spell reflection
[59088] = {talentID = 2247, rank = 0},
[59089] = {talentID = 2247, rank = 1},

-- imp disarm
[12313] = {talentID = 151, rank = 0},
[12804] = {talentID = 151, rank = 1},

-- puncture
[12308] = {talentID = 146, rank = 0},
[12810] = {talentID = 146, rank = 1},
[12811] = {talentID = 146, rank = 2},

-- imp disc
[12312] = {talentID = 150, rank = 0},
[12803] = {talentID = 150, rank = 1},

-- conc blow
[12809] = {talentID = 152, rank = 0},

-- gag order
[12311] = {talentID = 149, rank = 0},
[12958] = {talentID = 149, rank = 1},

-- one hand wspec
[16538] = {talentID = 702, rank = 0},
[16539] = {talentID = 702, rank = 1},
[16540] = {talentID = 702, rank = 2},
[16541] = {talentID = 702, rank = 3},
[16542] = {talentID = 702, rank = 4},

-- imp def stance
[29593] = {talentID = 1652, rank = 0},
[29594] = {talentID = 1652, rank = 1},

-- vigilance
[50720] = {talentID = 148, rank = 0},

-- focused rage
[29787] = {talentID = 1660, rank = 0},
[29790] = {talentID = 1660, rank = 1},
[29792] = {talentID = 1660, rank = 2},

-- vitality
[29140] = {talentID = 1653, rank = 0},
[29143] = {talentID = 1653, rank = 1},
[29144] = {talentID = 1653, rank = 2},

-- safeguard
[46945] = {talentID = 1870, rank = 0},
[46949] = {talentID = 1870, rank = 1},

-- warbringer
[57499] = {talentID = 2236, rank = 0},

-- devastate
[20243] = {talentID = 1666, rank = 0},

-- crit block
[47294] = {talentID = 1893, rank = 0},
[47295] = {talentID = 1893, rank = 1},
[47296] = {talentID = 1893, rank = 2},

-- sword and board
[46951] = {talentID = 1871, rank = 0},
[46952] = {talentID = 1871, rank = 1},
[46953] = {talentID = 1871, rank = 2},

-- damage shield
[58872] = {talentID = 2246, rank = 0},
[58874] = {talentID = 2246, rank = 1},

-- shockwave
[46968] = {talentID = 1872, rank = 0},


-- dk

-- blood
-- butchery
[48979] = {talentID = 1939, rank = 0},
[49483] = {talentID = 1939, rank = 1},

-- subversion
[48997] = {talentID = 1945, rank = 0},
[49490] = {talentID = 1945, rank = 1},
[49491] = {talentID = 1945, rank = 2},

-- blade barrier
[49182] = {talentID = 2017, rank = 0},
[49500] = {talentID = 2017, rank = 1},
[49501] = {talentID = 2017, rank = 2},
[55225] = {talentID = 2017, rank = 3},
[55226] = {talentID = 2017, rank = 4},

-- bladed armor
[48978] = {talentID = 1938, rank = 0},
[49390] = {talentID = 1938, rank = 1},
[49391] = {talentID = 1938, rank = 2},
[49392] = {talentID = 1938, rank = 3},
[49393] = {talentID = 1938, rank = 4},

-- scent of blood
[49004] = {talentID = 1948, rank = 0},
[49508] = {talentID = 1948, rank = 1},
[49509] = {talentID = 1948, rank = 2},

-- two hand wspec
[55107] = {talentID = 2217, rank = 0},
[55108] = {talentID = 2217, rank = 1},

-- rune tap
[48982] = {talentID = 1941, rank = 0},

-- dark Concition
[48987] = {talentID = 1943, rank = 0},
[49477] = {talentID = 1943, rank = 1},
[49478] = {talentID = 1943, rank = 2},
[49479] = {talentID = 1943, rank = 3},
[49480] = {talentID = 1943, rank = 4},

-- death rune mastery
[49467] = {talentID = 2086, rank = 0},
[50033] = {talentID = 2086, rank = 1},
[50034] = {talentID = 2086, rank = 2},

-- imp life tap
[48985] = {talentID = 1942, rank = 0},
[49488] = {talentID = 1942, rank = 1},
[49489] = {talentID = 1942, rank = 2},

-- spell deflection
[49145] = {talentID = 2018, rank = 0},
[49495] = {talentID = 2018, rank = 1},
[49497] = {talentID = 2018, rank = 2},

-- vendetta
[49015] = {talentID = 1953, rank = 0},
[50154] = {talentID = 1953, rank = 1},
[55136] = {talentID = 1953, rank = 2},

-- bloody strikes
[48977] = {talentID = 2015, rank = 0},
[49394] = {talentID = 2015, rank = 1},
[49395] = {talentID = 2015, rank = 2},

-- veteran of the third war
[49006] = {talentID = 1950, rank = 0},
[49526] = {talentID = 1950, rank = 1},
[50029] = {talentID = 1950, rank = 2},

-- mark of blood
[49005] = {talentID = 1949, rank = 0},

-- bloody vengeance
[48988] = {talentID = 1944, rank = 0},
[49503] = {talentID = 1944, rank = 1},
[49504] = {talentID = 1944, rank = 2},

-- abomination might
[53137] = {talentID = 2105, rank = 0},
[53138] = {talentID = 2105, rank = 1},

-- bloodworms
[49027] = {talentID = 1960, rank = 0},
[49542] = {talentID = 1960, rank = 1},
[49543] = {talentID = 1960, rank = 2},

-- hysteria
[49016] = {talentID = 1954, rank = 0},

-- imp blood presence
[50365] = {talentID = 1936, rank = 0},
[50371] = {talentID = 1936, rank = 1},

-- imp death strike
[62905] = {talentID = 2259, rank = 0},
[62908] = {talentID = 2259, rank = 1},

-- sudden doom
[49018] = {talentID = 1955, rank = 0},
[49529] = {talentID = 1955, rank = 1},
[49530] = {talentID = 1955, rank = 2},

-- vampiric blood
[55233] = {talentID = 2019, rank = 0},

-- will of the necropolis
[49189] = {talentID = 1959, rank = 0},
[50149] = {talentID = 1959, rank = 1},
[50150] = {talentID = 1959, rank = 2},

-- heart strike
[55050] = {talentID = 1957, rank = 0},

-- might of mograine
[49023] = {talentID = 1958, rank = 0},
[49533] = {talentID = 1958, rank = 1},
[49534] = {talentID = 1958, rank = 2},

-- blood gorged
[61154] = {talentID = 2034, rank = 0},
[61155] = {talentID = 2034, rank = 1},
[61156] = {talentID = 2034, rank = 2},
[61157] = {talentID = 2034, rank = 3},
[61158] = {talentID = 2034, rank = 4},

-- dancing rune weapon
[49028] = {talentID = 1961, rank = 0},


-- frost
-- imp icy touch
[49175] = {talentID = 2031, rank = 0},
[50031] = {talentID = 2031, rank = 1},
[51456] = {talentID = 2031, rank = 2},

-- runic power mastery
[49455] = {talentID = 2020, rank = 0},
[50147] = {talentID = 2020, rank = 1},

-- toughness
[49042] = {talentID = 1968, rank = 0},
[49786] = {talentID = 1968, rank = 1},
[49787] = {talentID = 1968, rank = 2},
[49788] = {talentID = 1968, rank = 3},
[49789] = {talentID = 1968, rank = 4},

-- icy reach
[55061] = {talentID = 2035, rank = 0},
[55062] = {talentID = 2035, rank = 1},

-- black ice
[49140] = {talentID = 1973, rank = 0},
[49661] = {talentID = 1973, rank = 1},
[49662] = {talentID = 1973, rank = 2},
[49663] = {talentID = 1973, rank = 3},
[49664] = {talentID = 1973, rank = 4},

-- nerves of cold steel
[49226] = {talentID = 2022, rank = 0},
[50137] = {talentID = 2022, rank = 1},
[50138] = {talentID = 2022, rank = 2},

-- icy talons
[50880] = {talentID = 2042, rank = 0},
[50884] = {talentID = 2042, rank = 1},
[50885] = {talentID = 2042, rank = 2},
[50886] = {talentID = 2042, rank = 3},
[50887] = {talentID = 2042, rank = 4},

-- lichborne
[49039] = {talentID = 2215, rank = 0},

-- annihilation
[51468] = {talentID = 2048, rank = 0},
[51472] = {talentID = 2048, rank = 1},
[51473] = {talentID = 2048, rank = 2},

-- killing machine
[51123] = {talentID = 2044, rank = 0},
[51127] = {talentID = 2044, rank = 1},
[51128] = {talentID = 2044, rank = 2},
[51129] = {talentID = 2044, rank = 3},
[51130] = {talentID = 2044, rank = 4},

-- chill of the grave
[49149] = {talentID = 1981, rank = 0},
[50115] = {talentID = 1981, rank = 1},

-- endless winter
[49137] = {talentID = 1971, rank = 0},
[49657] = {talentID = 1971, rank = 1},

-- frigid dreadplate
[49186] = {talentID = 1990, rank = 0},
[51108] = {talentID = 1990, rank = 1},
[51109] = {talentID = 1990, rank = 2},

-- glacier rot
[49471] = {talentID = 2030, rank = 0},
[49790] = {talentID = 2030, rank = 1},
[49791] = {talentID = 2030, rank = 2},

-- deathchill
[49796] = {talentID = 1980, rank = 0},

-- imp icy talons
[55610] = {talentID = 2223, rank = 0},

-- merciless combat
[49024] = {talentID = 1993, rank = 0},
[49538] = {talentID = 1993, rank = 1},

-- rime
[49188] = {talentID = 1992, rank = 0},
[56822] = {talentID = 1992, rank = 1},
[59057] = {talentID = 1992, rank = 2},

-- chillBlains
[50040] = {talentID = 2260, rank = 0},
[50041] = {talentID = 2260, rank = 1},
[50043] = {talentID = 2260, rank = 2},

-- hungering cold
[49203] = {talentID = 1999, rank = 0},

-- imp frost presence
[50384] = {talentID = 2029, rank = 0},
[50385] = {talentID = 2029, rank = 1},

-- threat of thassarian
[65661] = {talentID = 2284, rank = 0},
[66191] = {talentID = 2284, rank = 1},
[66192] = {talentID = 2284, rank = 2},

-- blood of the north
[54639] = {talentID = 2210, rank = 0},
[54638] = {talentID = 2210, rank = 1},
[54637] = {talentID = 2210, rank = 2},

-- unbreakable armor
[51271] = {talentID = 1979, rank = 0},

-- acclimation
[49200] = {talentID = 1997, rank = 0},
[50151] = {talentID = 1997, rank = 1},
[50152] = {talentID = 1997, rank = 2},

-- frost strike
[49143] = {talentID = 1975, rank = 0},

-- guile of gorefiend
[50187] = {talentID = 2040, rank = 0},
[50190] = {talentID = 2040, rank = 1},
[50191] = {talentID = 2040, rank = 2},

-- tundra stalker
[49202] = {talentID = 1998, rank = 0},
[50127] = {talentID = 1998, rank = 1},
[50128] = {talentID = 1998, rank = 2},
[50129] = {talentID = 1998, rank = 3},
[50130] = {talentID = 1998, rank = 4},

-- howling blast
[49184] = {talentID = 1989, rank = 0},

-- unholy
-- vicious strikes
[51745] = {talentID = 2082, rank = 0},
[51746] = {talentID = 2082, rank = 1},

-- virulence
[48962] = {talentID = 1932, rank = 0},
[49567] = {talentID = 1932, rank = 1},
[49568] = {talentID = 1932, rank = 2},

-- anticipation
[55129] = {talentID = 2218, rank = 0},
[55130] = {talentID = 2218, rank = 1},
[55131] = {talentID = 2218, rank = 2},
[55132] = {talentID = 2218, rank = 3},
[55133] = {talentID = 2218, rank = 4},

-- eppidemic
[49036] = {talentID = 1963, rank = 0},
[49562] = {talentID = 1963, rank = 1},

-- morbidity
[48963] = {talentID = 1933, rank = 0},
[49564] = {talentID = 1933, rank = 1},
[49565] = {talentID = 1933, rank = 2},

-- unholy command
[49588] = {talentID = 2025, rank = 0},
[49589] = {talentID = 2025, rank = 1},

-- ravenous dead
[48965] = {talentID = 1934, rank = 0},
[49571] = {talentID = 1934, rank = 1},
[49572] = {talentID = 1934, rank = 2},

-- outbreak
[49013] = {talentID = 2008, rank = 0},
[55236] = {talentID = 2008, rank = 1},
[55237] = {talentID = 2008, rank = 2},

-- necrosis
[51459] = {talentID = 2047, rank = 0},
[51462] = {talentID = 2047, rank = 1},
[51463] = {talentID = 2047, rank = 2},
[51464] = {talentID = 2047, rank = 3},
[51465] = {talentID = 2047, rank = 4},

-- corpse explosion
[49158] = {talentID = 1985, rank = 0},

-- on a pale horse
[49146] = {talentID = 2039, rank = 0},
[51267] = {talentID = 2039, rank = 1},

-- blood-caked blade
[49219] = {talentID = 2004, rank = 0},
[49627] = {talentID = 2004, rank = 1},
[49628] = {talentID = 2004, rank = 2},

-- night of the dead
[55620] = {talentID = 2225, rank = 0},
[55623] = {talentID = 2225, rank = 1},

-- unholy blight
[49194] = {talentID = 1996, rank = 0},

-- impurity
[49220] = {talentID = 2005, rank = 0},
[49633] = {talentID = 2005, rank = 1},
[49635] = {talentID = 2005, rank = 2},
[49636] = {talentID = 2005, rank = 3},
[49638] = {talentID = 2005, rank = 4},

-- dirge
[49223] = {talentID = 2011, rank = 0},
[49599] = {talentID = 2011, rank = 1},

-- desecration
[55666] = {talentID = 2226, rank = 0},
[55667] = {talentID = 2226, rank = 1},

-- magic sup
[49224] = {talentID = 2009, rank = 0},
[49610] = {talentID = 2009, rank = 1},
[49611] = {talentID = 2009, rank = 2},

-- reaping
[49208] = {talentID = 2001, rank = 0},
[56834] = {talentID = 2001, rank = 1},
[56835] = {talentID = 2001, rank = 2},

-- master of ghouls
[52143] = {talentID = 1984, rank = 0},

-- desolation
[66799] = {talentID = 2285, rank = 0},
[66814] = {talentID = 2285, rank = 1},
[66815] = {talentID = 2285, rank = 2},
[66816] = {talentID = 2285, rank = 3},
[66817] = {talentID = 2285, rank = 4},

-- anti-magic zone
[51052] = {talentID = 2221, rank = 0},

-- imp unh presence
[50391] = {talentID = 2013, rank = 0},
[50392] = {talentID = 2013, rank = 1},

-- ghoul frenzy
[63560] = {talentID = 2085, rank = 0},

-- crpyt fever
[49032] = {talentID = 1962, rank = 0},
[49631] = {talentID = 1962, rank = 1},
[49632] = {talentID = 1962, rank = 2},

-- bone shield
[49222] = {talentID = 2007, rank = 0},

-- wandering plague
[49217] = {talentID = 2003, rank = 0},
[49654] = {talentID = 2003, rank = 1},
[49655] = {talentID = 2003, rank = 2},

-- ebon plaguebringer
[51099] = {talentID = 2043, rank = 0},
[51160] = {talentID = 2043, rank = 1},
[51161] = {talentID = 2043, rank = 2},

-- scourge strike
[55090] = {talentID = 2216, rank = 0},

-- rage of rivendare
[50117] = {talentID = 2036, rank = 0},
[50118] = {talentID = 2036, rank = 1},
[50119] = {talentID = 2036, rank = 2},
[50120] = {talentID = 2036, rank = 3},
[50121] = {talentID = 2036, rank = 4},

-- summon gargoyle
[49206] = {talentID = 2000, rank = 0}

    }
    return spellMap[spellID]
end



function OpenNPCSaveBuild(event, player, gameobject)
    if (player:HasItem(itemVIP) == false and player:HasItem(itemVIPeterno) == false) then
        player:SendBroadcastMessage("Você precisa do Livro Vip para usar esse npc.")
        player:GossipComplete()
    else
        player:SaveToDB()
        player:GossipMenuAddItem(3, " |TInterface\\icons\\Ability_druid_naturalperfection.png:26|t Criar |cFF0000FFBuild", 1, 80) -- Salvar Builds Submenu
        local guid = player:GetGUIDLow()
        
        local query = "SELECT DISTINCT BuildSlot, BuildName FROM custom_save_talents WHERE guid = "..guid
        local result = CharDBQuery(query)
        
        if result then
            repeat
                local buildSlot = result:GetUInt32(0)
                local talentName = result:GetString(1)
				--player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_most_damage_killingblow_dieleast.png:26|t |cFF0000FFBuild " .. intid .. "|r [ |cffffff00" .. talentName .. "|r ]", 0, intid + 30) -- Stored Builds Submenu
                player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_most_damage_killingblow_dieleast.png:26|t |cFF0000FFBuild " .. buildSlot .. "|r [ |cffffff00" .. talentName .. "|r ]", 0, buildSlot + 30) -- Stored Builds Submenu
            until not result:NextRow()
        end
        
        player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_returnxflags_def_wsg.png:26|t Resetar |cFF0000FFTalentos", 1, 500, false, "Tem certeza que quer Resetar os Talentos?") -- Reset Talents
		--player:GossipMenuAddItem(3, " |TInterface\\icons\\Inv_inscription_minorglyph08.png:26|t Major Glyphs", 1, 100)
		--player:GossipMenuAddItem(3, " |TInterface\\icons\\Inv_inscription_majorglyph18.png:26|t Minor Glyphs", 1, 101)
		--player:GossipMenuAddItem(3, " Trocar de Spec Instant\n (para ativar Glyphs)", 1, 110)
        player:GossipSendMenu(1, gameobject)
    end
end


function OnGossipSelect(event, player, gameobject, sender, intid, code)
	-- [Submenu] Aplicar Talent
	if intid >= 30 and intid <= 50 then
		local buildSlot = intid - 30
		local guid = player:GetGUIDLow()
		local query = "SELECT BuildName FROM custom_save_talents WHERE guid = " .. guid .. " AND BuildSlot = " .. buildSlot
		local result = CharDBQuery(query)
    
		if result then
			local talentName = result:GetString(0)
			--player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_most_damage_killingblow_dieleast.png:26|t Aplicar |cFF0000FFBuild " .. (intid -30) .. "|r [|cffffff00 " .. talentName .. " |r]", 0, intid + 1000)
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Achievement_bg_most_damage_killingblow_dieleast.png:26|t Aplicar |cFF0000FFBuild " .. buildSlot .. "|r [|cffffff00 " .. talentName .. " |r]", 0, intid + 1000)
		end
    
		--player:GossipMenuAddItem(9, " |TInterface\\icons\\Ability_fiegndead.png:26|t Deletar |cFF0000FFBuild ", 1, intid + 2000, false, "|cffffff00Tem certeza que quer deletar a Build " .. intid - 30 .. " ?")
		player:GossipMenuAddItem(9, " |TInterface/Icons/Inv_scroll_11.png:26|t Renomear |cFF0000FFBuild", 1, intid + 2100, true)
		player:GossipMenuAddItem(9, " |TInterface\\icons\\Ability_fiegndead.png:26|t Deletar |cFF0000FFBuild ", 1, intid + 2000, false, "|cffffff00Tem certeza que quer deletar a Build " .. buildSlot .. " ?")
		player:GossipMenuAddItem(2, "|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:16:16:0:0|t |cFF800000Voltar", 0, 499)
		player:GossipSendMenu(1, gameobject)
	end
	

	-- Realmente Aplica a Build
	if intid >= 1030 and intid <= 1050 then -- Aplicar Talents (de acordo com o Gossip [Aplicar Talents], que tem intid 30 até 50)
		-- Custom Lua Function
		if player:InArenaQueue() then
			player:SendBroadcastMessage("Você não pode aplicar uma build através do Talent Archivist enquanto estiver na fila de Arena.")
			player:GossipComplete()
		else 
			local buildSlot = intid - 1030
				player:ResetTalents()
				player:SaveToDB()
				playerMap[player:GetGUIDLow()] = buildSlot
				player:RegisterEvent(ApplyTalentsPeriodically, 100, 10) -- Milisegundos/quantidades de applies
				ApplyGlyphsFromStoredTable(player, buildSlot)
			if player:GetActiveSpec() == 0 then -- Main Spec - Force Switch spec for Glyphs (need to Relog or Switch spec, otherwise they don't work)
				player:CastSpell(player, 63644, true) -- Activate Secondary Spec
				player:CastSpell(player, 63645, true) -- Activate primary Spec
			elseif player:GetActiveSpec() == 1 then
				player:CastSpell(player, 63645, true)
				player:CastSpell(player, 63644, true)
			end
				player:SetPower(player:GetMaxPower(0), 0)
				player:SendBroadcastMessage("Você aplicou a Build " .. (intid - 1030))
			player:GossipComplete()
		end
	end
	
	-- Deletar a build selecionada
	if intid >= 2030 and intid <= 2050 then
		local buildSlot = intid - 2030
		local guid = player:GetGUIDLow()
		CharDBExecute("DELETE FROM custom_save_talents WHERE guid = "..guid.." AND BuildSlot = "..buildSlot)
		CharDBExecute("DELETE FROM custom_save_talents_glyphs WHERE guid = "..guid.." AND BuildSlot = "..buildSlot)
		player:SendBroadcastMessage("Build " .. (intid - 2030) .. " deletada.")
		player:GossipComplete()
	end
	
	-- Renomear a build selecionada
	if intid >= 2130 and intid <= 2150 then
		local BuildName = code
		local guid = player:GetGUIDLow()
		CharDBExecute("UPDATE custom_save_talents SET BuildName = '"..BuildName.."' WHERE guid = "..guid.." AND BuildSlot = "..(intid - 2130))
		player:SendBroadcastMessage("Build " .. (intid - 2130) .. " renomeada para '" .. (BuildName) .. "' ")
		player:GossipComplete()
	end

	-- Salvar Build - Submenu
	if(intid == 80) then 
		player:GossipSetText(string.format(" "))
		player:SaveToDB()
		for i = 1, 10 do -- Só mostra 10 Slots
			player:GossipMenuAddItem(3, " |TInterface\\icons\\Ability_druid_naturalperfection.png:26|t Salvar Build - |cFF0000FFSlot " .. i, 1, i, true, "Digite o nome da Build que você deseja Salvar.\n Exemplos: 'Build PvE' ou 'DPS 0/59/12' ")
		end
		player:GossipMenuAddItem(9, "\n |TInterface\\icons\\Ability_fiegndead.png:26|t Deletar |cFF0000FFBuilds|r Salvas", 1, 450, false, "|cffffff00Tem certeza que quer deletar \ntodas as Builds salvas ?|r")
		player:GossipMenuAddItem(5,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)        
		player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)    
	end
	
	-- Salvar Build
	if intid >= 1 and intid <= 20 then
		local BuildName = code
		local guid = player:GetGUIDLow()
		player:SaveToDB()
		player:GossipComplete()
		player:SendBroadcastMessage("Build Salvada no Slot " .. (intid))
    
		CharDBExecute("DELETE FROM custom_save_talents WHERE guid = "..guid.." AND BuildSlot = "..intid)
		
		player:SaveToDB()
		local activeSpec = player:GetActiveSpec()
		local specMask
		if activeSpec == 0 then     -- Main Spec
			specMask = "specMask IN (1,3)"
		elseif activeSpec == 1 then -- Off Spec
			specMask = "specMask IN (2,3)"
		end

		-- get talents and add them on the new database, based on active spec
		local result = CharDBQuery("SELECT spell FROM character_talent WHERE guid = "..guid.." AND "..specMask)
		if result then
			repeat
				local spell = result:GetUInt32(0)
				local BuildSlot = intid
				CharDBExecute("INSERT INTO custom_save_talents (guid, spell, BuildSlot, BuildName) VALUES ("..guid..", "..spell..", "..BuildSlot..", '"..BuildName.."')")
			until not result:NextRow()
		end
		
		-- Save Glyphs
		local glyphQuery = "REPLACE INTO custom_save_talents_glyphs (guid, glyph1, glyph2, glyph3, glyph4, glyph5, glyph6, BuildSlot) VALUES ("..guid
		local result = CharDBQuery("SELECT glyph1, glyph2, glyph3, glyph4, glyph5, glyph6 FROM character_glyphs WHERE guid = "..guid.." AND talentGroup = "..activeSpec)

		if result then
			for i = 0, result:GetColumnCount() - 1 do
				local glyph = result:GetUInt32(i)
				glyphQuery = glyphQuery .. ", " .. glyph
			end
			glyphQuery = glyphQuery .. ", " .. intid .. ")"
			CharDBExecute(glyphQuery)
		end
	end
	
	-- Deletar todas Builds Salvas
	if intid == 450 then 
		local guid = player:GetGUIDLow()
		CharDBExecute("DELETE FROM custom_save_talents WHERE guid = " .. guid)
		CharDBExecute("DELETE FROM custom_save_talents_glyphs WHERE guid = " .. guid)
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
	
	if intid == 110 then -- Trocar de Spec (para aplicar Glyph, sem precisar Relogar)
		OpenNPCSaveBuild(event, player, gameobject)
		if player:GetActiveSpec() == 0 then -- Main Spec - Force Switch spec to make applied Glyphs work
			player:CastSpell(player, 63644, true)
			player:CastSpell(player, 63645, true)
		elseif player:GetActiveSpec() == 1 then
			player:CastSpell(player, 63645, true)
			player:CastSpell(player, 63644, true)
		end
	end
	
	
	
	if(intid == 100) then -- Major Glyphs
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowlup:26|t Major Glyphs - Slot Cima", 1, 104)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowleft:26|t Major Glyphs - Slot Esquerdo", 1, 105)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowright:26|t Major Glyphs - Slot Direito", 1, 106)
		player:GossipMenuAddItem(2, " Voltar", 1, 499)
		player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)    
	elseif(intid == 101) then -- Minor Glyphs
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(3, " |TInterface\\icons\\misc_arrowdown:26|t Minor Glyphs - Slot Baixo", 1, 107)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowleft:26|t Minor Glyphs - Slot Esquerdo", 1, 108)
		player:GossipMenuAddItem(3, " |TInterface\\icons\\Misc_arrowright:26|t Minor Glyphs - Slot Direito", 1, 109)
		player:GossipMenuAddItem(2, " Voltar", 1, 499)
		player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)    
	end

    -- Major Glyphs
	if intid >= 104 and intid <= 106 then
		local GlyphSlot
		if intid == 104 then     -- Major Up
			GlyphSlot = 0       
		elseif intid == 105 then -- Major Left
			GlyphSlot = 5
		elseif intid == 106 then -- Major Right
			GlyphSlot = 3
		end
		player:SetData("GlyphSlot", GlyphSlot) -- Salvando GlyphSlot no player para ser usado em intid 110
	
		-- Major Glyphs:
		if (player:GetClass() == 1) then     -- Warrior
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Pain Suppression", 1, 111)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11222)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 2) then -- Paladin
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 111)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 112)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 3) then -- Hunter
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 4) then -- Rogue
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 5) then -- Priest
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 6) then -- Death Knight
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
     	elseif (player:GetClass() == 7) then -- Shaman
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 8) then -- Mage
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 9) then -- Warlock
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Insect Swarm", 1, 113)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 11) then -- Druid
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		end
	end

	if intid == 111 then     -- Glyph of Pain Suppression
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(190, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	elseif intid == 112 then -- Glyph of Mortal Strike
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(489, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	elseif intid == 113 then -- Glyph of Insect Swarm
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(176, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	elseif intid == 114 then -- Glyph of the Wild - Minor
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(433, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	elseif intid == 115 then -- Glyph of Dash - Minor
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(551, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	end

	-- Minor Glyphs
	if intid >= 107 and intid <= 109 then
		local GlyphSlot
		if intid == 107 then     -- Minor Down
			GlyphSlot = 1
		elseif intid == 108 then -- Minor Left
			GlyphSlot = 2
		elseif intid == 109 then -- Minor Right
			GlyphSlot = 4
		end
		player:SetData("GlyphSlot", GlyphSlot) -- Salvando GlyphSlot no player para ser usado em intid 110
	
		-- Minor Glyphs:
		if (player:GetClass() == 1) then -- Warrior
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Pain Suppression", 1, 111)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11222)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 2) then -- Rogue
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 3) then -- Hunter
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 4) then -- Rogue
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 5) then -- Priest
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph Minor ", 1, 116)
			player:GossipMenuAddItem(3, "Glyph of Dash", 1, 117)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 6) then -- Death Knight
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
     	elseif (player:GetClass() == 7) then -- Shaman
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 8) then -- Mage
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 9) then -- Warlock
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Insect Swarm", 1, 113)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		elseif (player:GetClass() == 11) then -- Druid
			player:GossipSetText(string.format("Atualmente os glyphs adicionados atraves de Lua só estão tendo efeito após trocar de Spec ou Relogar."))
			player:GossipMenuAddItem(3, "Glyph of Mortal Strike", 1, 112)
			player:GossipMenuAddItem(3, "Glyph of Dispersion", 1, 11122)
			player:GossipMenuAddItem(2, "Voltar", 1, 100)
			player:GossipSendMenu(0x7FFFFFFF, gameobject, menu_id)
		end
	end
	
	-- Minor Glyphs Entries
	if intid == 116 then     -- Glyph of Dash - Minor
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(551, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	elseif intid == 117 then -- Glyph of Dash - Minor
		local GlyphSlot = player:GetData("GlyphSlot")
		player:SetGlyph(551, GlyphSlot)
		OpenNPCSaveBuild(event, player, gameobject)
	end
	
	if(intid == 499) then -- Back to Main Menu
		OpenNPCSaveBuild(event, player, gameobject)
	end
end

function ApplyTalentsPeriodically(eventid, delay, repeats, player)
    ApplyTalentsFromStoredTable(player)
end

function ApplyTalentsFromStoredTable(player, buildSlot)
    local guid = player:GetGUIDLow()
    local buildSlot = playerMap[guid]

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

function ApplyGlyphsFromStoredTable(player, buildSlot)
    local guid = player:GetGUIDLow()
    local result = CharDBQuery("SELECT glyph1, glyph2, glyph3, glyph4, glyph5, glyph6 FROM custom_save_talents_glyphs WHERE guid = "..guid.." AND BuildSlot = "..buildSlot)

    if result then
        local glyphSlots = {0, 1, 2, 3, 4, 5} -- (0, 5 e 3 são major. Em ordem: cima, esquerda, direita)

        for i = 0, result:GetColumnCount() - 1 do
            local glyphID = result:GetUInt32(i)
            local glyphSlot = glyphSlots[i+1] -- Índices Lua começam em 1, não 0

            if glyphID ~= 0 then -- Se o glyphID não for 0 (nenhum glyph)
                player:SetGlyph(glyphID, glyphSlot)
            end
        end
    end
end




RegisterGameObjectGossipEvent(GameObjectEntry, 1, OpenNPCSaveBuild)
RegisterGameObjectGossipEvent(GameObjectEntry, 2, OnGossipSelect)
