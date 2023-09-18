
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["PartyCooldownTracker"] = {
			["iconSource"] = -1,
			["Sadilanyok"] = {
				["roster"] = {
					["0x0A00000000A64044"] = {
						["unitID"] = "party1",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitName"] = "Saeberwinax",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["pet"] = {
						},
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 194885.043,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 194880.916,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 194880.916,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 194885.043,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 194886.089,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 194885.044,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 194880.916,
							},
						},
					},
				},
			},
			["authorOptions"] = {
				{
					["text"] = "",
					["type"] = "description",
					["fontSize"] = "large",
					["width"] = 2,
				}, -- [1]
				{
					["type"] = "space",
					["variableWidth"] = false,
					["height"] = 2,
					["useHeight"] = true,
					["width"] = 1,
				}, -- [2]
				{
					["type"] = "select",
					["values"] = {
						"bottom", -- [1]
						"bottom left", -- [2]
						"bottom right", -- [3]
						"center", -- [4]
						"left", -- [5]
						"right", -- [6]
						"top", -- [7]
						"top left", -- [8]
						"top right", -- [9]
					},
					["default"] = 1,
					["name"] = "anchor",
					["useDesc"] = false,
					["key"] = "anchor",
					["width"] = 1,
				}, -- [3]
				{
					["type"] = "select",
					["values"] = {
						"bottom", -- [1]
						"bottom left", -- [2]
						"bottom right", -- [3]
						"center", -- [4]
						"left", -- [5]
						"right", -- [6]
						"top", -- [7]
						"top left", -- [8]
						"top right", -- [9]
					},
					["default"] = 1,
					["name"] = "relative",
					["useDesc"] = false,
					["key"] = "anchorTo",
					["width"] = 1,
				}, -- [4]
				{
					["type"] = "select",
					["values"] = {
						"Default", -- [1]
						"Vuhdo 1", -- [2]
						"Vuhdo 2", -- [3]
						"Vuhdo 3", -- [4]
						"Vuhdo 4", -- [5]
						"Vuhdo 5", -- [6]
						"Vuhdo", -- [7]
						"Heal Bot", -- [8]
						"Grid", -- [9]
						"Grid2", -- [10]
						"Plexus", -- [11]
						"ElvUI Raid", -- [12]
						"BDGrid", -- [13]
						"Generic oUF", -- [14]
						"Lime", -- [15]
						"SUF", -- [16]
						"Alea Party", -- [17]
						"SUF Party", -- [18]
						"ElvUI Party", -- [19]
						"Generic oUF Party", -- [20]
						"PitBull4 Party", -- [21]
						"XPerl Party", -- [22]
						"Blizzard Party", -- [23]
						"Compact Raid", -- [24]
					},
					["default"] = 1,
					["name"] = "add to",
					["useDesc"] = false,
					["key"] = "frame",
					["width"] = 1,
				}, -- [5]
				{
					["type"] = "select",
					["values"] = {
						"left then down", -- [1]
						"right then down", -- [2]
						"left then up", -- [3]
						"right then up", -- [4]
					},
					["default"] = 1,
					["name"] = "direction",
					["useDesc"] = false,
					["key"] = "direction",
					["width"] = 1,
				}, -- [6]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 30,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["key"] = "column",
					["default"] = 4,
					["name"] = "number of columns",
				}, -- [7]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 10,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["key"] = "spacing",
					["default"] = 3,
					["name"] = "Spacing",
				}, -- [8]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 100,
					["step"] = 1,
					["width"] = 1,
					["min"] = -100,
					["key"] = "xOffset",
					["default"] = 0,
					["name"] = "xOffset",
				}, -- [9]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 100,
					["step"] = 1,
					["width"] = 1,
					["min"] = -100,
					["key"] = "yOffset",
					["default"] = 0,
					["name"] = "yOffset",
				}, -- [10]
				{
					["type"] = "header",
					["useName"] = false,
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [11]
				{
					["type"] = "select",
					["values"] = {
						"party1", -- [1]
						"party1 - party2", -- [2]
						"party1 - party3", -- [3]
						"party1 - party4", -- [4]
					},
					["default"] = 4,
					["name"] = "number of tracked cds per player",
					["useDesc"] = false,
					["key"] = "countUnits",
					["width"] = 1,
				}, -- [12]
				{
					["type"] = "toggle",
					["key"] = "show",
					["width"] = 1,
					["name"] = "Show/Hide on cooldown",
					["useDesc"] = true,
					["default"] = false,
					["desc"] = "Show only spells on cooldown",
				}, -- [13]
				{
					["type"] = "toggle",
					["key"] = "glow",
					["default"] = true,
					["name"] = "glowing effect if active",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [14]
				{
					["type"] = "toggle",
					["key"] = "des",
					["default"] = true,
					["name"] = "discolor on cooldown",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [15]
				{
					["type"] = "header",
					["useName"] = false,
					["text"] = "Способности класса",
					["noMerge"] = true,
					["width"] = 1,
				}, -- [16]
				{
					["subOptions"] = {
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "33206",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_painsupression:20:20:0:0|t |cFFFFFFFFPain suppression|r",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "6346",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_excorcism:20:20:0:0|t Fear Ward",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "10060",
									["default"] = true,
									["name"] = "|TInterface\\Icons\\spell_holy_powerinfusion:20:20:0:0|t Power Infusion",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "64044",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_psychichorrors:20:20:0:0|t |cFFFFFFFFPsychic Horror|r",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "47585",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_dispersion:20:20:0:0|t Dispersion",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "64901",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_symbolofhope:20:20:0:0|t Hymn of Hope",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "64843",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_divinehymn:20:20:0:0|t Divine Hymn",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "10890",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_psychicscream:20:20:0:0|t |cFFFFFFFFPsychic Scream|r",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "15487",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_impphaseshift:20:20:0:0|t Silence",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "34433",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_shadowfiend:20:20:0:0|t Shadow Fiend",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "48173",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_restoration:20:20:0:0|t Desperate Prayer",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "14751",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_windwalkon:20:20:0:0|t Inner Focus",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "48158",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Shadow_DemonicFortitude:20:20:0:0|t Shadow Word: Death",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "53007",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Holy_Penance:20:20:0:0|t Penance",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "47788",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Holy_GuardianSpirit:20:20:0:0|t Guardian Spirit",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [15]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:128:192:64:128|t |cfff0ebe0Priest",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "PRIEST",
							["size"] = 10,
						}, -- [1]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "2094",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_mindsteal:20:20:0:0|t Blind",
									["useDesc"] = false,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "26889",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_vanish:20:20:0:0|t Vanish",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "31224",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_nethercloak:20:20:0:0|t Cloak of Shadows",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "51722",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_dismantle:20:20:0:0|t Dismantle",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "11305",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_sprint:20:20:0:0|t Sprint",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "1766",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_kick:20:20:0:0|t Kick",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "1776",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_gouge:20:20:0:0|t Gouge",
									["useDesc"] = true,
									["default"] = false,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "8643",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_kidneyshot:20:20:0:0|t Kidney Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Завершающий прием, оглушающий цель. Продолжительность оглушения зависит от длины серии: 1 прием: 2 секунды2 приема: 3 секунды3 приема: 4 секунды4 приема: 5 секунд5 приемов: 6 секунд",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "57934",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_tricksofthetrade:20:20:0:0|t Tricks of the Trade",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "26669",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_shadowward:20:20:0:0|t Evasion",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "14185",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_antishadow:20:20:0:0|t Preparation",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "36554",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_shadowstep:20:20:0:0|t Shadowstep",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Проходя сквозь тень, разбойник появляется за спиной противника. Скорость его передвижения увеличивается на 70% в течение 3 сек.. Урон от примененной после этого способности увеличивается на 20%, а угроза, создаваемая ею, уменьшается на 50%. Время действия – 10 сек..",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "51713",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_shadowdance:20:20:0:0|t Shadow Dance",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "51690",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_murderspree:20:20:0:0|t Killing Spree",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "14177",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_ice_lament:20:20:0:0|t Cold Blood",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:128:196:0:64|t |cfffff468Rogue",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "ROGUE",
							["size"] = 10,
						}, -- [2]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "22812",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_stoneclawtotem:20:20:0:0|t Barskin",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "53201",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_starfall:20:20:0:0|t Starfall",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "29166",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_lightning:20:20:0:0|t Innervate",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "61384",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_typhoon:20:20:0:0|t Typhoon",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "48477",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_reincarnation:20:20:0:0|t Rebirth",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "33357",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_dash:20:20:0:0|t Dash",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "8983",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_bash:20:20:0:0|t Bash",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "49377",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_pet_bear:20:20:0:0|t Feral Charge - Bear",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "50334",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_berserk:20:20:0:0|t Berserk",
									["useDesc"] = true,
									["default"] = false,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "17116",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_ravenform:20:20:0:0|t Nature Swiftness",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "18562",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_relics_idolofrejuvenation:20:20:0:0|t Swiftmend",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "48438",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_flourish:20:20:0:0|t Wild Growth",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "33831",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_forceofnature:20:20:0:0|t Treants",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "61336",
									["default"] = true,
									["name"] = "|TInterface\\Icons\\Ability_Druid_TigersRoar:20:20:0:0|t Survival Instincts",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "22842",
									["default"] = true,
									["name"] = "|TInterface\\Icons\\Ability_BullRush:20:20:0:0|t Frenzied Regeneration",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "48447",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Nature_Tranquility:20:20:0:0|t Tranquility",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "49376",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_druid_feralchargecat:20:20:0:0|t Feral Charge - Cat",
									["useDesc"] = true,
									["default"] = false,
									["desc"] = "",
								}, -- [17]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:196:256:0:64|t |cffff7c0aDruid",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "DRUID",
							["size"] = 10,
						}, -- [3]
						{
							["subOptions"] = {
								{
									["subOptions"] = {
										{
											["type"] = "toggle",
											["key"] = "4167",
											["default"] = true,
											["name"] = "|TInterface\\Icons\\Spell_Nature_Web:20:20:0:0|t Web",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [1]
										{
											["type"] = "toggle",
											["key"] = "53548",
											["default"] = true,
											["name"] = "|TInterface\\Icons\\INV_Jewelcrafting_TruesilverCrab:20:20:0:0|t Pin",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [2]
										{
											["type"] = "toggle",
											["key"] = "53561",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Druid_PrimalTenacity:20:20:0:0|t Ravage",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [3]
										{
											["type"] = "toggle",
											["key"] = "53568",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Hunter_Pet_Bat:20:20:0:0|t Sonic Blast",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [4]
										{
											["type"] = "toggle",
											["key"] = "58611",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Fire_WindsofWoe:20:20:0:0|t Lava Breath",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [5]
										{
											["type"] = "toggle",
											["key"] = "61198",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Nature_StarFall:20:20:0:0|t Spirit Strike",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [6]
										{
											["type"] = "toggle",
											["key"] = "26064",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Hunter_Pet_Turtle:20:20:0:0|t Shell Shield",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [7]
										{
											["type"] = "toggle",
											["key"] = "26090",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Hunter_Pet_Gorilla:20:20:0:0|t Pummel",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [8]
										{
											["type"] = "toggle",
											["key"] = "55492",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Nature_Lightning:20:20:0:0|t Froststorm Breath",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [9]
										{
											["type"] = "toggle",
											["key"] = "55754",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Nature_Acid_01:20:20:0:0|t Acid Split",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [10]
										{
											["type"] = "toggle",
											["key"] = "64495",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Hunter_Pet_Wolf:20:20:0:0|t Furious Howl",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [11]
										{
											["type"] = "toggle",
											["key"] = "53480",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Ability_Druid_DemoralizingRoar:20:20:0:0|t Roar of Sacrifice",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [12]
									},
									["hideReorder"] = true,
									["useDesc"] = false,
									["nameSource"] = 0,
									["width"] = 1,
									["useCollapse"] = true,
									["name"] = "Pet Cooldowns",
									["collapse"] = false,
									["type"] = "group",
									["limitType"] = "none",
									["groupType"] = "simple",
									["key"] = "pet",
									["size"] = 10,
								}, -- [1]
								{
									["type"] = "header",
									["useName"] = false,
									["text"] = "",
									["noMerge"] = false,
									["width"] = 0.65,
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "3045",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_runningshot:20:20:0:0|t Rapid Fire",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "19263",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_whirlwind:20:20:0:0|t Deterrence",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "23989",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_readiness:20:20:0:0|t Readiness",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "5384",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_feigndeath:20:20:0:0|t Feign Death",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "781",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_feint:20:20:0:0|t Disengage",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "19503",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_golemstormbolt:20:20:0:0|t Scatter Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "34490",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_theblackarrow:20:20:0:0|t Silencing Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "1543",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_fire_flare:20:20:0:0|t Flare",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "34600",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_snaketrap:20:20:0:0|t Snake Trap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "49067",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_fire_selfdestruct:20:20:0:0|t Explosive Trap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "49056",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_fire_flameshock:20:20:0:0|t Immolation Trap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "14311",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_chainsofice:20:20:0:0|t Freezing Trap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "60192",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_chillingbolt:20:20:0:0|t Freezing Arrow",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "13809",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_freezingbreath:20:20:0:0|t Frost Trap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Установить ледяную ловушку, которая создает вокруг себя толстый слой льда на 30 сек.., когда к ней приближается первый противник. Все противники в радиусе 10 м замедляются на 50%, пока остаются в зоне действия эффекта. Ловушка существует в течение 30 сек.. Можно создавать только одну ловушку одновременно.",
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "63672",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_painspike:20:20:0:0|t Black Arrow",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [17]
								{
									["type"] = "toggle",
									["key"] = "49012",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_spear_02:20:20:0:0|t Wyvern Sting",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [18]
								{
									["type"] = "toggle",
									["key"] = "53271",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_masterscall:20:20:0:0|t Master's Call",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [19]
								{
									["type"] = "toggle",
									["key"] = "34477",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_misdirection:20:20:0:0|t Misdirection",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [20]
								{
									["type"] = "toggle",
									["key"] = "49048",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_upgrademoonglaive:20:20:0:0|t Multi-Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [21]
								{
									["type"] = "toggle",
									["key"] = "19577",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_devour:20:20:0:0|t Intimidation",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Приказать питомцу напугать противника, оглушив его на 3 сек.. и значительно повысив свой уровень угрозы. Время действия – 15 сек..",
								}, -- [22]
								{
									["type"] = "toggle",
									["key"] = "19574",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_druid_ferociousbite:20:20:0:0|t Bestial Wrath",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [23]
								{
									["type"] = "toggle",
									["key"] = "49050",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_spear_07:20:20:0:0|t Aimed Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [24]
								{
									["type"] = "toggle",
									["key"] = "53209",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_chimerashot2:20:20:0:0|t Chimera Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [25]
								{
									["type"] = "toggle",
									["key"] = "61006",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_assassinate2:20:20:0:0|t Kill Shot",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [26]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:0:64:64:128|t |cffaad372Hunter",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "HUNTER",
							["size"] = 10,
						}, -- [4]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "42917",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_frostnova:20:20:0:0|t Frost Nova",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "45438",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_frost:20:20:0:0|t Ice Block",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "2139",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_iceshock:20:20:0:0|t Counterspell",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "55342",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_magic_lesserinvisibilty:20:20:0:0|t Mirror Images",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "66",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_mage_invisibility:20:20:0:0|t Invisibility",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "1953",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_arcane_blink:20:20:0:0|t Blink",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "12051",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_purge:20:20:0:0|t Evocation",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "12042",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_lightning:20:20:0:0|t Arcane Power",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "42945",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_excorcism_02:20:20:0:0|t Blast Wave",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "42950",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_misc_head_dragon_01:20:20:0:0|t Dragon's Breath",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Наносит 370 - 430 ед. урона от огня противникам, находящимся в конусе поражения перед заклинателем, а также дезориентирует их на 5 сек.. Любой нанесенный урон приведет их в чувство. Вы прекращаете атаковать после применения этого заклинания.",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "11958",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_wizardmark:20:20:0:0|t Cold Snap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "43039",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_ice_lament:20:20:0:0|t Ice Barrier",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "31687",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_summonwaterelemental_2:20:20:0:0|t Summon Water Elemental",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "44572",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_mage_deepfreeze:20:20:0:0|t Deep Freeze",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "Оглушает цель на 5 сек.. Действует только на замороженных противников. Наносит от 1469 до 1741 ед. урона целям, с постоянной невосприимчивостью к оглушениям.",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "12472",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_coldhearted:20:20:0:0|t Icy Veins",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "42931",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_glacier:20:20:0:0|t Cone of Cold",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "12043",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_enchantarmor:20:20:0:0|t Presence of Mind",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [17]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:64:128:0:64|t |cff68ccefMage",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "MAGE",
							["size"] = 10,
						}, -- [5]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "48788",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_layonhands:20:20:0:0|t Lay on Hands",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "31884",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_avenginewrath:20:20:0:0|t Avenging Wrath",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "48806",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_thunderclap:20:20:0:0|t Hammer of Wrath",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "642",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_divineintervention:20:20:0:0|t Divine Shield",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "498",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_restoration:20:20:0:0|t Divine Protection",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "10278",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_sealofprotection:20:20:0:0|t Hand of Protection",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "6940",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_sealofsacrifice:20:20:0:0|t Hand of Sacrifice",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "1044",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_sealofvalor:20:20:0:0|t Freedom",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "10308",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_sealofmight:20:20:0:0|t Hammer of Justice",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "19752",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_timestop:20:20:0:0|t Divine Intervention",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "31821",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_auramastery:20:20:0:0|t Aura Mastery",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "48827",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_avengersshield:20:20:0:0|t Avenger's Shield",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "20066",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_prayerofhealing:20:20:0:0|t Repentance",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "48825",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_searinglight:20:20:0:0|t Holy Shock",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "20216",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_heal:20:20:0:0|t Divine Favor",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "64205",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_powerwordbarrier:20:20:0:0|t  Divine Sacrifice",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "10326",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\Spell_Holy_TurnUndead:20:20:0:0|t Turn Evil",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [17]
								{
									["type"] = "toggle",
									["key"] = "48817",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_holy_excorcism:20:20:0:0|t Holy Wrath",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [18]
								{
									["type"] = "toggle",
									["key"] = "54428",
									["width"] = 1,
									["name"] = "|TInterface\\Icons\\Spell_Holy_Aspiration:20:20:0:0|t Divine Plea",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [19]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:0:64:128:196|t |cfff48cbaPaladin",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "PALADIN",
							["size"] = 10,
						}, -- [6]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "8177",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_groundingtotem:20:20:0:0|t Grounding Totem",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "57994",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_cyclone:20:20:0:0|t Wind Shear",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "51514",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shaman_hex:20:20:0:0|t Hex",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "59159",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shaman_thunderstorm:20:20:0:0|t Thunderstorm",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "51533",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shaman_feralspirit:20:20:0:0|t Feral Spirit",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "32182",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_shaman_heroism:20:20:0:0|t Heroism",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "2825",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\Spell_Nature_BloodLust:18:18:0:0:64:64:4:60:4:60|t Bloodlust",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "2894",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_fire_elemental_totem:20:20:0:0|t Fire Elemental Totem",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "2484",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_strengthofearthtotem02:20:20:0:0|t Earthbind Totem",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "16166",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_wispheal:20:20:0:0|t Elemental Mastery",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "16190",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_frost_summonwaterelemental:20:20:0:0|t Mana Tide Totem",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "30823",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_shamanrage:20:20:0:0|t Shamanistic Rage",
									["useDesc"] = true,
									["default"] = false,
									["desc"] = "",
								}, -- [12]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:64:128:64:128|t |cff2359ffShaman",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "SHAMAN",
							["size"] = 10,
						}, -- [7]
						{
							["subOptions"] = {
								{
									["subOptions"] = {
										{
											["type"] = "toggle",
											["key"] = "19647",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_MindRot:20:20:0:0|t Spell Lock",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [1]
										{
											["type"] = "toggle",
											["key"] = "48011",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Nature_Purge:20:20:0:0|t Devour Magic",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [2]
										{
											["type"] = "toggle",
											["key"] = "54053",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_SoulLeech_3:20:20:0:0|t Shadow Bite",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [3]
										{
											["type"] = "toggle",
											["key"] = "47986",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_SacrificialShield:20:20:0:0|t Sacrifice",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [4]
										{
											["type"] = "toggle",
											["key"] = "47990",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_BlackPlague:20:20:0:0|t Suffering",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [5]
									},
									["hideReorder"] = true,
									["nameSource"] = 0,
									["width"] = 0.65,
									["useCollapse"] = true,
									["collapse"] = false,
									["name"] = "Pet Cooldowns",
									["type"] = "group",
									["limitType"] = "none",
									["groupType"] = "simple",
									["key"] = "pet",
									["size"] = 10,
								}, -- [1]
								{
									["type"] = "header",
									["useName"] = false,
									["text"] = "",
									["noMerge"] = false,
									["width"] = 0.65,
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "48020",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_demoniccircleteleport:20:20:0:0|t Demonic Circle: Teleport",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "47877",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\INV_Stone_04:20:20:0:0|t Create Healthstone",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "1122",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_summoninfernal:20:20:0:0|t Inferno",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "54785",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warstomp:20:20:0:0|t Demonic Charge",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "47860",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_deathcoil:20:20:0:0|t Death Coil",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "17928",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_deathscream:20:20:0:0|t Howl of Terror",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "50796",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warlock_chaosbolt:20:20:0:0|t Chaos Bolt",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "47847",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_shadowfury:20:20:0:0|t Shadowfury",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "18708",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_nature_removecurse:20:20:0:0|t Fel Domination",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "47193",
									["default"] = true,
									["name"] = "|TInterface\\Icons\\Ability_Warlock_DemonicEmpowerment:20:20:0:0|t Demonic Empowerment",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "61290",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Ability_Warlock_ShadowFlame:20:20:0:0|t Shadowflame",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "47827",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Shadow_ScourgeBuild:20:20:0:0|t Shadowburn",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "59671",
									["default"] = false,
									["name"] = "|TInterface\\Icons\\Spell_Nature_ShamanRage:20:20:0:0|t Challenging Howl",
									["useDesc"] = false,
									["width"] = 0.65,
								}, -- [15]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:196:256:64:128|t |cff9382c9Warlock",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "WARLOCK",
							["size"] = 10,
						}, -- [8]
						{
							["subOptions"] = {
								{
									["type"] = "toggle",
									["key"] = "871",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_shieldwall:20:20:0:0|t Shield Wall",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [1]
								{
									["type"] = "toggle",
									["key"] = "23920",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_shieldreflection:20:20:0:0|t Spell Reflection",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "676",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_disarm:20:20:0:0|t Disarm",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "3411",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_victoryrush:20:20:0:0|t Intervene",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "72",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_shieldbash:20:20:0:0|t Shield Bash",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "55694",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_focusedrage:20:20:0:0|t Enraged Regeneration",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "6552",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_gauntlets_04:20:20:0:0|t Pummel",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "20252",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_rogue_sprint:20:20:0:0|t Intercept",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "5246",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_golemthunderclap:20:20:0:0|t Intimidating Shout",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "11578",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_charge:20:20:0:0|t Charge",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "46924",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_bladestorm:20:20:0:0|t Bladestorm",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "60970",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_heroicleap:20:20:0:0|t Heroic Fury",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "12809",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_thunderbolt:20:20:0:0|t Concussion Blow",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "46968",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_shockwave:20:20:0:0|t Shockwave",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "2565",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_defend:20:20:0:0|t Shield Block",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "20230",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_warrior_challange:20:20:0:0|t Retaliation",
									["useDesc"] = true,
									["default"] = false,
									["desc"] = "",
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "1719",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_criticalstrike:20:20:0:0|t Recklessness",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [17]
								{
									["type"] = "toggle",
									["key"] = "12292",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_deathpact:20:20:0:0|t Death Wish",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [18]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:0:64:0:64|t |cffc69b6dWarrior",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "WARRIOR",
							["size"] = 10,
						}, -- [9]
						{
							["subOptions"] = {
								{
									["subOptions"] = {
										{
											["type"] = "toggle",
											["key"] = "47481",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_DeathKnight_Gnaw_Ghoul:20:20:0:0|t Gnaw",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [1]
										{
											["type"] = "toggle",
											["key"] = "47482",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_Skull:20:20:0:0|t Leap",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [2]
										{
											["type"] = "toggle",
											["key"] = "47484",
											["default"] = false,
											["name"] = "|TInterface\\Icons\\Spell_Shadow_RaiseDead:20:20:0:0|t Huddle",
											["useDesc"] = false,
											["width"] = 1,
										}, -- [3]
									},
									["hideReorder"] = true,
									["nameSource"] = 0,
									["width"] = 0.65,
									["useCollapse"] = true,
									["collapse"] = false,
									["name"] = "Pet cooldowns",
									["type"] = "group",
									["limitType"] = "none",
									["groupType"] = "simple",
									["key"] = "pet",
									["size"] = 10,
								}, -- [1]
								{
									["type"] = "header",
									["useName"] = false,
									["text"] = "",
									["noMerge"] = false,
									["width"] = 0.65,
								}, -- [2]
								{
									["type"] = "toggle",
									["key"] = "51052",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_antimagiczone:20:20:0:0|t Anti-Magic Zone",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [3]
								{
									["type"] = "toggle",
									["key"] = "48707",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_antimagicshell:20:20:0:0|t Anti-Magic Shell",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [4]
								{
									["type"] = "toggle",
									["key"] = "49576",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_strangulate:20:20:0:0|t Death Grip",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [5]
								{
									["type"] = "toggle",
									["key"] = "46584",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\Spell_Shadow_AnimateDead:20:20:0:0|t Raise Dead",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [6]
								{
									["type"] = "toggle",
									["key"] = "42650",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_armyofthedead:20:20:0:0|t Army of the Dead",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [7]
								{
									["type"] = "toggle",
									["key"] = "47528",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_mindfreeze:20:20:0:0|t Mind Freeze",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [8]
								{
									["type"] = "toggle",
									["key"] = "48792",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_iceboundfortitude:20:20:0:0|t Icebound Fortitude",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [9]
								{
									["type"] = "toggle",
									["key"] = "48743",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_deathpact:20:20:0:0|t Death Pact",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [10]
								{
									["type"] = "toggle",
									["key"] = "47476",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_soulleech_3:20:20:0:0|t Strangulate",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [11]
								{
									["type"] = "toggle",
									["key"] = "49206",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_pet_bat:20:20:0:0|t Summon Gargoyle",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [12]
								{
									["type"] = "toggle",
									["key"] = "49039",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_raisedead:20:20:0:0|t Lichborne",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [13]
								{
									["type"] = "toggle",
									["key"] = "49203",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_staff_15:20:20:0:0|t Hungering Cold",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [14]
								{
									["type"] = "toggle",
									["key"] = "51271",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\inv_armor_helm_plate_naxxramas_raidwarrior_c_01:20:20:0:0|t Unbreakable Armor",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [15]
								{
									["type"] = "toggle",
									["key"] = "48982",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_runetap:20:20:0:0|t Rune Tap",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [16]
								{
									["type"] = "toggle",
									["key"] = "49005",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\ability_hunter_rapidkilling:20:20:0:0|t Mark of Blood",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [17]
								{
									["type"] = "toggle",
									["key"] = "49016",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_deathknight_bladedarmor:20:20:0:0|t Hysteria",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [18]
								{
									["type"] = "toggle",
									["key"] = "49937",
									["width"] = 0.65,
									["name"] = "|TInterface\\Icons\\spell_shadow_deathanddecay:20:20:0:0|t Death and Decay",
									["useDesc"] = true,
									["default"] = true,
									["desc"] = "",
								}, -- [19]
							},
							["hideReorder"] = true,
							["useDesc"] = false,
							["nameSource"] = 0,
							["width"] = 1,
							["useCollapse"] = true,
							["name"] = "|TInterface\\WorldStateFrame\\ICONS-CLASSES:26:26:0:0:256:256:64:128:128:196|t |cffc41e3bDeath Knight",
							["collapse"] = true,
							["type"] = "group",
							["limitType"] = "none",
							["groupType"] = "simple",
							["key"] = "DEATHKNIGHT",
							["size"] = 10,
						}, -- [10]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["name"] = "Class cooldowns",
					["collapse"] = true,
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "simple",
					["key"] = "cds",
					["size"] = 10,
				}, -- [17]
				{
					["type"] = "header",
					["useName"] = true,
					["text"] = "Racials and Trinkets",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [18]
				{
					["subOptions"] = {
						{
							["type"] = "toggle",
							["key"] = "42292",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_holy_dispelmagic:20:20:0:0|t Horde/Alliance Medailon",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [1]
						{
							["type"] = "toggle",
							["key"] = "59752",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_shadow_charm:20:20:0:0|t Every Man for Himself",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [2]
						{
							["type"] = "toggle",
							["key"] = "71607",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\INV_Jewelcrafting_Gem_28:20:20:0:0|t Bauble of True Blood",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [3]
						{
							["type"] = "toggle",
							["key"] = "71586",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\inv_misc_key_15:20:20:0:0|t  Skeleton Key",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [4]
						{
							["type"] = "toggle",
							["key"] = "71638",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\inv_jewelry_trinket_06:20:20:0:0|t Sindragoda's Flawless Fang",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [5]
						{
							["type"] = "toggle",
							["key"] = "75490",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\inv_misc_rubysanctum1:20:20:0:0|t Glowing Twilight Scale",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [6]
						{
							["type"] = "toggle",
							["key"] = "67596",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\ability_warrior_endlessrage:20:20:0:0|t Battlemaster's Trinkets",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [7]
						{
							["type"] = "toggle",
							["key"] = "58984",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\ability_ambush:20:20:0:0|t Shadowmeld",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [8]
						{
							["type"] = "toggle",
							["key"] = "59547",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_holy_holyprotection:20:20:0:0|t Gift of Naaru",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [9]
						{
							["type"] = "toggle",
							["key"] = "20594",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_shadow_unholystrength:20:20:0:0|t Stoneform",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [10]
						{
							["type"] = "toggle",
							["key"] = "20589",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\ability_rogue_trip:20:20:0:0|t Escape Artist",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [11]
						{
							["type"] = "toggle",
							["key"] = "20572",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\racial_orc_berserkerstrength:20:20:0:0|t Blood Fury",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [12]
						{
							["type"] = "toggle",
							["key"] = "7744",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_shadow_raisedead:20:20:0:0|t Will of the Forsaken",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [13]
						{
							["type"] = "toggle",
							["key"] = "20549",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\ability_warstomp:20:20:0:0|t War Stomp",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [14]
						{
							["type"] = "toggle",
							["key"] = "26297",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\racial_troll_berserk:20:20:0:0|t Berserk",
							["useDesc"] = true,
							["default"] = true,
							["desc"] = "",
						}, -- [15]
						{
							["type"] = "toggle",
							["key"] = "28730",
							["width"] = 1,
							["name"] = "|TInterface\\Icons\\spell_shadow_teleport:20:20:0:0|t Arcane Torrent",
							["useDesc"] = false,
							["default"] = true,
							["desc"] = "",
						}, -- [16]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["name"] = "Trinkets and Racials",
					["collapse"] = true,
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "simple",
					["key"] = "ANY",
					["size"] = 10,
				}, -- [19]
				{
					["type"] = "header",
					["useName"] = false,
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [20]
				{
					["type"] = "toggle",
					["key"] = "lib_error",
					["width"] = 1,
					["name"] = "hide error text",
					["useDesc"] = false,
					["default"] = false,
					["desc"] = "",
				}, -- [21]
				{
					["type"] = "toggle",
					["key"] = "blizzFrame",
					["default"] = false,
					["name"] = "Ignore PartyMemberFrame",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [22]
			},
			["preferToUpdate"] = false,
			["yOffset"] = -980,
			["anchorPoint"] = "CENTER",
			["Keidavin"] = {
				["roster"] = {
					["0x0A00000000A613E8"] = {
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["race"] = "NightElf",
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 446536.137,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 446536.137,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 446536.137,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446536.136,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 446536.137,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 446536.136,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446536.137,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Kurishrath",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["icon"] = true,
			["Ilovewotlk"] = {
				["roster"] = {
				},
			},
			["useTooltip"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["Specterx"] = {
				["roster"] = {
					["0x0000000001855A34"] = {
						["class"] = "MAGE",
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							["45438"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 209142.281,
							},
							["1953"] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 209142.281,
							},
							["12051"] = {
								["dst"] = false,
								["cd"] = 240,
								["exp"] = 209142.281,
							},
							["59752"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 209142.281,
							},
							["2139"] = {
								["dst"] = false,
								["cd"] = 24,
								["exp"] = 209142.281,
							},
						},
						["pet"] = {
						},
						["unitName"] = "Imozz",
					},
					["0x00000000018B01C1"] = {
						["class"] = "PRIEST",
						["race"] = "NightElf",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitID"] = "party2",
						["spells"] = {
							["6346"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 209142.281,
							},
							["58984"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 209142.281,
							},
							["34433"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 209142.281,
							},
							["64843"] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 209142.281,
							},
							["10890"] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 209142.281,
							},
						},
						["pet"] = {
						},
						["unitName"] = "Meyoaru",
					},
				},
			},
			["Spectrolinex"] = {
				["roster"] = {
					["0x0000000001A5351F"] = {
						["class"] = "WARRIOR",
						["race"] = "Human",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Подвеска истинной крови",
								["itemID"] = 50354,
								["spellID"] = 71607,
							},
							[13] = {
								["itemName"] = "Медальон Альянса",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							["6552"] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 216768.312,
							},
							["5246"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 216768.312,
							},
							["42292"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 216768.312,
							},
							["871"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 216768.312,
							},
							["59752"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 216768.312,
							},
							["2565"] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 216768.312,
							},
							["71607"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 216768.312,
							},
							["46924"] = {
								["dst"] = false,
								["cd"] = 90,
								["exp"] = 216768.312,
							},
						},
						["pet"] = {
						},
						["unitName"] = "Specterx",
					},
				},
			},
			["Yagger"] = {
				["roster"] = {
					["0x0A0000000085AEB7"] = {
						["spells"] = {
							[33206] = {
								["dst"] = true,
								["cd"] = 144,
								["exp"] = 33207.792,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 33112.824,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 33112.823,
							},
							[48173] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 33186.297,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 33112.823,
							},
							[10060] = {
								["dst"] = true,
								["cd"] = 96,
								["exp"] = 33149.04,
							},
						},
						["race"] = "Scourge",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitName"] = "Xaza",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
					["0x0A000000009EEEC3"] = {
						["spells"] = {
							[2565] = {
								["dst"] = true,
								["cd"] = 60,
								["exp"] = 33187.987,
							},
							[59752] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 33240.223,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 33112.823,
							},
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 33112.824,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 33112.824,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 33112.824,
							},
							[676] = {
								["dst"] = true,
								["cd"] = 60,
								["exp"] = 33195.323,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 33112.825,
							},
							[46924] = {
								["dst"] = true,
								["cd"] = 90,
								["exp"] = 33154.193,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 33112.825,
							},
						},
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitName"] = "Jfumeunjoint",
						["class"] = "WARRIOR",
						["pet"] = {
						},
						["unitID"] = "party2",
					},
				},
			},
			["Kaalin"] = {
				["roster"] = {
					["0x0A00000000A613EB"] = {
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 447055.664,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 447055.664,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 447055.664,
							},
						},
						["race"] = "NightElf",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitName"] = "Sylvaelel",
					},
				},
			},
			["Diabolic"] = {
				["roster"] = {
				},
			},
			["Lavalash"] = {
				["roster"] = {
				},
			},
			["Blarginda"] = {
				["roster"] = {
					["0x0A00000000A613E9"] = {
						["unitName"] = "Ciarielth",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 446776.689,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 446776.689,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 446776.688,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446776.685,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446776.689,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 446776.689,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 446776.688,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
					},
				},
			},
			["Leal"] = {
				["roster"] = {
					["0x000000000019D699"] = {
						["class"] = "ROGUE",
						["race"] = "NightElf",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitName"] = "Zzuz",
						["frame"] = {
							["framePriorities"] = {
								"^PartyMemberFrame", -- [1]
							},
						},
						["spells"] = {
							["51722"] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 12754.187,
							},
							["11305"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 12754.187,
							},
							["26669"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 12754.187,
							},
							["31224"] = {
								["dst"] = false,
								["cd"] = 90,
								["exp"] = 12754.187,
							},
							["8643"] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 12754.187,
							},
							["2094"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 12754.187,
							},
							["26889"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 12754.187,
							},
							["57934"] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 12754.187,
							},
						},
						["unitID"] = "party1",
					},
					["0x000000000035017E"] = {
						["class"] = "WARRIOR",
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitName"] = "Spectorqx",
						["frame"] = {
							["framePriorities"] = {
								"^PartyMemberFrame", -- [1]
							},
						},
						["spells"] = {
							["5246"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 12754.187,
							},
							["23920"] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 12754.187,
							},
							["46924"] = {
								["dst"] = false,
								["cd"] = 90,
								["exp"] = 12754.187,
							},
							["2565"] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 12754.187,
							},
							["3411"] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 12754.187,
							},
							["55694"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 12754.187,
							},
							["6552"] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 12754.187,
							},
							["676"] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 12754.187,
							},
							["1719"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 12754.187,
							},
							["20230"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 12754.187,
							},
							["72"] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 12754.187,
							},
							["871"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 12754.187,
							},
							["20252"] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 12754.187,
							},
							["11578"] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 12754.187,
							},
						},
						["unitID"] = "party2",
					},
				},
			},
			["regionType"] = "icon",
			["Dopelêmon"] = {
				["roster"] = {
				},
			},
			["Asdqwe"] = {
				["roster"] = {
				},
			},
			["Paume"] = {
				["roster"] = {
				},
			},
			["config"] = {
				["countUnits"] = 2,
				["direction"] = 3,
				["glow"] = true,
				["anchorTo"] = 8,
				["ANY"] = {
					["59752"] = true,
					["28730"] = false,
					["59547"] = false,
					["42292"] = true,
					["67596"] = false,
					["75490"] = false,
					["71586"] = true,
					["58984"] = true,
					["20549"] = true,
					["7744"] = true,
					["26297"] = false,
					["20572"] = false,
					["20594"] = true,
					["71607"] = true,
					["71638"] = true,
					["20589"] = false,
				},
				["frame"] = 22,
				["anchor"] = 8,
				["yOffset"] = -26,
				["show"] = false,
				["column"] = 6,
				["blizzFrame"] = false,
				["spacing"] = 2,
				["lib_error"] = true,
				["cds"] = {
					["HUNTER"] = {
						["34600"] = false,
						["19263"] = true,
						["1543"] = false,
						["53271"] = true,
						["49067"] = false,
						["13809"] = true,
						["23989"] = true,
						["5384"] = true,
						["34490"] = true,
						["61006"] = false,
						["19503"] = true,
						["63672"] = false,
						["49048"] = false,
						["781"] = false,
						["34477"] = false,
						["pet"] = {
							["64495"] = false,
							["53548"] = true,
							["53561"] = true,
							["55754"] = false,
							["58611"] = false,
							["53568"] = false,
							["26090"] = true,
							["53480"] = true,
							["55492"] = false,
							["4167"] = true,
							["61198"] = false,
							["26064"] = false,
						},
						["49050"] = false,
						["60192"] = true,
						["49056"] = false,
						["49012"] = true,
						["19574"] = true,
						["14311"] = true,
						["3045"] = false,
						["53209"] = false,
						["19577"] = true,
					},
					["WARRIOR"] = {
						["12292"] = false,
						["60970"] = false,
						["20252"] = true,
						["20230"] = false,
						["55694"] = false,
						["12809"] = true,
						["46968"] = true,
						["1719"] = false,
						["23920"] = true,
						["2565"] = true,
						["11578"] = true,
						["6552"] = true,
						["676"] = true,
						["46924"] = true,
						["72"] = true,
						["5246"] = true,
						["3411"] = true,
						["871"] = true,
					},
					["ROGUE"] = {
						["14185"] = true,
						["26669"] = false,
						["1766"] = true,
						["11305"] = false,
						["2094"] = true,
						["14177"] = true,
						["57934"] = false,
						["51722"] = true,
						["1776"] = false,
						["51690"] = true,
						["36554"] = true,
						["8643"] = true,
						["31224"] = true,
						["26889"] = true,
						["51713"] = true,
					},
					["MAGE"] = {
						["12051"] = true,
						["12472"] = false,
						["43039"] = false,
						["12042"] = false,
						["31687"] = false,
						["55342"] = false,
						["42917"] = false,
						["1953"] = true,
						["42945"] = true,
						["42950"] = true,
						["45438"] = true,
						["2139"] = true,
						["42931"] = false,
						["44572"] = true,
						["11958"] = true,
						["12043"] = true,
						["66"] = false,
					},
					["PRIEST"] = {
						["64901"] = false,
						["47788"] = true,
						["48173"] = true,
						["48158"] = true,
						["64843"] = false,
						["10890"] = true,
						["10060"] = false,
						["6346"] = true,
						["15487"] = true,
						["33206"] = true,
						["64044"] = true,
						["34433"] = true,
						["47585"] = true,
						["53007"] = false,
						["14751"] = false,
					},
					["WARLOCK"] = {
						["47860"] = true,
						["47847"] = true,
						["61290"] = true,
						["17928"] = true,
						["18708"] = true,
						["47877"] = false,
						["pet"] = {
							["48011"] = true,
							["54053"] = false,
							["47986"] = true,
							["47990"] = false,
							["19647"] = true,
						},
						["47827"] = true,
						["50796"] = true,
						["48020"] = true,
						["1122"] = false,
						["47193"] = true,
						["54785"] = true,
						["59671"] = true,
					},
					["DEATHKNIGHT"] = {
						["49039"] = true,
						["47476"] = true,
						["51271"] = false,
						["49203"] = true,
						["48743"] = false,
						["49937"] = false,
						["48982"] = false,
						["49005"] = false,
						["48792"] = true,
						["49016"] = false,
						["47528"] = true,
						["pet"] = {
							["47484"] = false,
							["47481"] = true,
							["47482"] = false,
						},
						["49576"] = true,
						["49206"] = false,
						["51052"] = true,
						["46584"] = false,
						["48707"] = true,
						["42650"] = false,
					},
					["DRUID"] = {
						["48477"] = false,
						["50334"] = true,
						["17116"] = true,
						["33357"] = false,
						["61384"] = true,
						["33831"] = false,
						["49376"] = false,
						["61336"] = false,
						["29166"] = true,
						["48447"] = false,
						["22842"] = false,
						["18562"] = true,
						["49377"] = true,
						["22812"] = true,
						["53201"] = true,
						["48438"] = false,
						["8983"] = true,
					},
					["SHAMAN"] = {
						["8177"] = true,
						["2484"] = false,
						["51533"] = true,
						["51514"] = true,
						["57994"] = true,
						["16190"] = true,
						["59159"] = true,
						["2825"] = true,
						["30823"] = true,
						["16166"] = true,
						["32182"] = true,
						["2894"] = false,
					},
					["PALADIN"] = {
						["1044"] = true,
						["48806"] = false,
						["10308"] = true,
						["54428"] = true,
						["31884"] = true,
						["20066"] = true,
						["6940"] = true,
						["20216"] = false,
						["19752"] = false,
						["31821"] = true,
						["10326"] = false,
						["48817"] = false,
						["498"] = false,
						["642"] = true,
						["48827"] = true,
						["64205"] = true,
						["48825"] = false,
						["48788"] = false,
						["10278"] = true,
					},
				},
				["xOffset"] = -5,
				["des"] = false,
			},
			["Kynrasmina"] = {
				["roster"] = {
					["0x0A00000000A64048"] = {
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 195717.717,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 195717.718,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 195717.717,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 195717.717,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 195717.717,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 195717.717,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 195717.718,
							},
						},
						["race"] = "NightElf",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitName"] = "Delylrythx",
					},
				},
			},
			["tocversion"] = 30300,
			["uid"] = "9)m2dZi1)ca",
			["zoom"] = 0,
			["auto"] = true,
			["Goosebumps"] = {
				["roster"] = {
				},
			},
			["Testerr"] = {
				["roster"] = {
				},
			},
			["Jayhugunks"] = {
				["roster"] = {
					["0x0A00000000A613E4"] = {
						["unitName"] = "Flifalror",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 445996.565,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 445996.565,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 445996.564,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 445996.564,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 445996.564,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 445996.564,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 445996.565,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
					},
				},
			},
			["Exyth"] = {
				["roster"] = {
					["0x07000000001C4894"] = {
						["unitID"] = "party1",
						["race"] = "Human",
						["class"] = "WARRIOR",
						["faction"] = "Alliance",
						["unitName"] = "Pipir",
						["trinkets"] = {
						},
						["pet"] = {
						},
						["spells"] = {
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 37351.002,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 37351.001,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 37351,
							},
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 37351.001,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 37351,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 37351.001,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 37351.001,
							},
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 37351.002,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 37351.001,
							},
						},
					},
				},
			},
			["Howtoprot"] = {
				["roster"] = {
				},
			},
			["Madorit"] = {
				["roster"] = {
					["0x0A00000000A613E6"] = {
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 446173.572,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 446173.573,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 446173.572,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446173.572,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 446173.572,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 446173.573,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 446173.572,
							},
						},
						["race"] = "NightElf",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitName"] = "Falassaebe",
					},
				},
			},
			["Spectorqx"] = {
				["roster"] = {
					["0x000000000031D9B1"] = {
						["class"] = "PALADIN",
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							["1044"] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 15353.953,
							},
							["59752"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 15353.937,
							},
							["54428"] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 15353.937,
							},
							["6940"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 15353.953,
							},
							["642"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 15353.953,
							},
							["10278"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 15353.953,
							},
							["10308"] = {
								["dst"] = false,
								["cd"] = 40,
								["exp"] = 15353.937,
							},
							["31821"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 15353.937,
							},
							["64205"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 15353.937,
							},
						},
						["pet"] = {
						},
						["unitName"] = "Romansacra",
					},
				},
			},
			["Meriladra"] = {
				["roster"] = {
				},
			},
			["Theyymonkey"] = {
				["roster"] = {
					["0x0A00000000A5C94A"] = {
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["race"] = "Human",
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 367448.271,
							},
							[6346] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 367448.272,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367448.271,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367448.271,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 367448.271,
							},
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 367448.272,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 367448.272,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 367448.272,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367448.271,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Klamat",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["Monkeyape"] = {
				["roster"] = {
					["0x0A00000000A5C975"] = {
						["unitName"] = "Skasee",
						["race"] = "NightElf",
						["class"] = "DRUID",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[18562] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 368379.389,
							},
							[8983] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 368379.387,
							},
							[22812] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 368379.387,
							},
							[17116] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 368379.387,
							},
							[48438] = {
								["dst"] = false,
								["cd"] = 6,
								["exp"] = 368379.388,
							},
							[58984] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368379.388,
							},
							[48447] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 368379.388,
							},
							[29166] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 368379.387,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368379.387,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
					},
				},
			},
			["Brosaelsia"] = {
				["roster"] = {
				},
			},
			["displayIcon"] = "Interface\\Icons\\Spell_Shadow_Dispersion",
			["Reksalz"] = {
				["roster"] = {
				},
			},
			["Rogiergoe"] = {
				["roster"] = {
					["0x0A00000000A613ED"] = {
						["unitID"] = "party1",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitName"] = "Thilian",
						["trinkets"] = {
						},
						["pet"] = {
						},
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 447327.491,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 447327.491,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 447327.491,
							},
						},
					},
				},
			},
			["anchorFrameType"] = "SCREEN",
			["load"] = {
				["ingroup"] = {
					["single"] = "group",
					["multi"] = {
						["group"] = true,
						["raid"] = true,
						["solo"] = true,
					},
				},
				["zoneId"] = "",
				["talent"] = {
					["single"] = 70,
					["multi"] = {
						[53] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["difficulty"] = {
				},
				["use_zoneId"] = false,
				["use_size"] = false,
				["class"] = {
					["multi"] = {
					},
				},
				["use_spellknown"] = false,
				["use_exact_spellknown"] = false,
				["talent2"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "arena",
					["multi"] = {
						["party"] = true,
						["arena"] = true,
						["twenty"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["fortyman"] = true,
						["none"] = true,
					},
				},
			},
			["desc"] = "Author: Exyth\nDiscord: Exyth#5503",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["Kitte"] = {
				["roster"] = {
					["0x000000000000003C"] = {
						["unitID"] = "party1",
						["race"] = "Human",
						["class"] = "WARRIOR",
						["faction"] = "Alliance",
						["unitName"] = "Natrius",
						["spells"] = {
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 231251.611,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 231411.026,
							},
							[23920] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 231251.61,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 231251.611,
							},
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 231251.611,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 231251.61,
							},
							[46924] = {
								["dst"] = false,
								["cd"] = 90,
								["exp"] = 231396.864,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 231251.61,
							},
							[3411] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 231251.61,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 231251.611,
							},
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 231251.61,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 231251.609,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
						},
					},
				},
			},
			["Data"] = {
				["roster"] = {
					["0x000000000038D011"] = {
						["class"] = "WARLOCK",
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitName"] = "Tessttz",
						["frame"] = "PartyMemberFrame1",
						["spells"] = {
							["47860"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 533567.031,
							},
							["48020"] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 533567.031,
							},
							["18708"] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 533567.031,
							},
							["59752"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 533567.031,
							},
							["17928"] = {
								["dst"] = false,
								["cd"] = 40,
								["exp"] = 533567.031,
							},
							["19647"] = {
								["dst"] = false,
								["cd"] = 24,
								["exp"] = 533567.031,
							},
						},
						["unitID"] = "party1",
					},
				},
			},
			["Uglymonkey"] = {
				["roster"] = {
					["0x0A00000000A5C95D"] = {
						["unitID"] = "party1",
						["race"] = "Dwarf",
						["class"] = "PALADIN",
						["faction"] = "Alliance",
						["unitName"] = "Minmilas",
						["trinkets"] = {
						},
						["pet"] = {
						},
						["spells"] = {
							[31821] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367901.969,
							},
							[6940] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367893.919,
							},
							[1044] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 367893.919,
							},
							[54428] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 367893.918,
							},
							[642] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 367893.919,
							},
							[64205] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367901.969,
							},
							[10308] = {
								["dst"] = false,
								["cd"] = 40,
								["exp"] = 367893.919,
							},
							[10278] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 367893.919,
							},
						},
					},
				},
			},
			["Giegh"] = {
				["roster"] = {
					["0x0A00000000A613E8"] = {
						["unitID"] = "party1",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitName"] = "Kurishrath",
						["trinkets"] = {
						},
						["pet"] = {
						},
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 446416.447,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 446416.447,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 446416.447,
							},
						},
					},
				},
			},
			["Uglimonkey"] = {
				["roster"] = {
					["0x0A00000000A5C969"] = {
						["trinkets"] = {
						},
						["race"] = "NightElf",
						["spells"] = {
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 368092.533,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 368092.533,
							},
							[6346] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 368092.532,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 368092.533,
							},
							[58984] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368092.533,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Poustopaidoo",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["Bela"] = {
				["roster"] = {
				},
			},
			["Evilbeauty"] = {
				["roster"] = {
				},
			},
			["Capåmerica"] = {
				["roster"] = {
				},
			},
			["cooldownEdge"] = true,
			["Drdøøm"] = {
				["roster"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["unit"] = "player",
						["custom_type"] = "stateupdate",
						["custom"] = "function(allstates, event, ...)\n    \n    local self, WeakAuras = aura_env, WeakAuras;\n    \n    if ( event == \"OPTIONS\" ) then\n        \n        if ( WeakAuras.IsOptionsOpen() and self.loadedSession ) then\n            self.loadedSession = false;\n            self:SaveCurrentSession();\n        end\n        \n        self:InitNewMembers(allstates);\n        self:LoadLastSession();\n        self:CreateFrames(allstates);\n        self:scheduleUpdateFrames(allstates, 0.05);\n        \n    elseif ( event == \"WA_INIT\" ) then\n        self.loadedSession = true;\n        WeakAuras.ScanEvents(\"INVISUS_COOLDOWNS\", \"CD_UPDATE\");\n    elseif ( self.loadedSession ) then\n        if ( event == \"RAID_ROSTER_UPDATE\" or event == \"PARTY_MEMBERS_CHANGED\" ) then\n            if ( UnitInRaid(\"player\") and event == \"PARTY_MEMBERS_CHANGED\" ) then \n                return;\n            end\n            \n            WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, 1, \"WA_PARTY_MEMBERS_UPDATE\");\n        elseif ( event == \"WA_PARTY_MEMBERS_UPDATE\" ) then\n            return self:InitNewMembers(allstates);\n            \n        elseif ( event == \"INVISUS_COOLDOWNS\" ) then\n            local subEvent = ...;\n            \n            if ( subEvent == \"CD_UPDATE\" ) then\n                self:InitNewMembers(allstates);\n                self:LoadLastSession();\n                self:CreateFrames(allstates);\n                return true;\n            elseif ( subEvent == \"LibGroupTalents_Update\" ) then\n                local unit, unitName = select(2, ...)\n                local guid = UnitGUID(unit)\n                if ( unit and unitName and self.roster[guid] ) then\n                    self:UnitIsDetected(unit, guid);\n                    return self:CheckTalents(allstates, unit, guid);\n                end\n            elseif ( subEvent == \"FRAME_UPDATE\" ) then\n                self:scheduleUpdateFrames(allstates, 0.5);\n            end\n            \n        elseif ( event == \"WA_INSPECT_READY\" and ... ) then\n            local unit, guid, nilcheck = ...;\n            \n            if ( not nilcheck and CanInspect(unit, true) ) then\n                return NotifyInspect(unit), self:UnitIsDetected(unit, guid, true);\n            elseif ( nilcheck ) then\n                return self:UnitItemInit(allstates, unit, guid);\n            else\n                self:UnitIsDetected(unit, guid);\n            end\n            \n        elseif ( event == \"UNIT_INVENTORY_CHANGED\" and ... ) then\n            local unit = ...;\n            local guid = UnitGUID(unit);\n            return self.roster[guid] and self:UnitIsDetected(unit, guid);\n            \n        elseif ( event == \"UNIT_IS_VISIBLE\" and ... ) then\n            return self.UnitPetCDInit(allstates, ...)\n            \n        elseif ( event == \"ZONE_CHANGED_NEW_AREA\" ) then\n            return self:Update(allstates)\n            \n        elseif event == \"UNIT_PET\" and ... then\n            local unit = ...;\n            local guid = UnitGUID(unit);\n            local petGUID = self.GetPetGUID(unit);\n            \n            if ( not petGUID and unit ~= \"target\" and not (unit):match(\"raid\") ) then\n                return self:PetCooldownRemove(allstates, guid);\n            else\n                return self:UnitPetCDInit(allstates, unit);\n            end\n            \n        elseif ( event == \"UNIT_FACTION\" or event == \"UNIT_NAME_UPDATE\" ) and ... then\n            local unit = ...;\n            local guid = UnitGUID(unit);\n            if ( unit and (unit):match(\"partypet\") ) then\n                return self:PetCooldownRemove(allstates, guid);\n            end\n            \n        elseif ( event == \"COMBAT_LOG_EVENT_UNFILTERED\" and ... ) then\n            local _, subEvent, sourceGUID, _, _, destGUID, _, _, spellID, spellName, _, type = ...;\n            if ( self:SpellIsDisplay(sourceGUID, spellID) ) then\n                local GUID =self:SpellIsDisplay(sourceGUID, spellID);\n                \n                if ( subEvent == \"SPELL_RESURRECT\" or subEvent == \"SPELL_CAST_SUCCESS\" ) \n                and not self.blacklist[spellID] then\n                    return self:EditState( allstates, GUID, spellID, subEvent, destGUID);\n                elseif ( subEvent == \"SPELL_AURA_REMOVED\" ) then\n                    return self:SetDesaturated(allstates, sourceGUID, spellID);\n                elseif ( subEvent == \"SPELL_AURA_APPLIED\" and type == \"BUFF\" ) then \n                    local duration = select(6, UnitAura(self.roster[GUID].unitID, spellName));\n                    return self:SetGlow(allstates, GUID, spellID, duration);\n                end\n                \n            elseif ( subEvent == \"UNIT_DIED\" and self.pet_roster[destGUID] ) then \n                if ( self.pet_roster[destGUID].type == \"Вурдалак\" \n                    or self.pet_roster[destGUID].type == \"Ghoul\" ) then\n                    return self:EditState(allstates, self.pet_roster[destGUID].unitGUID, 46584, subEvent);\n                end\n                \n            elseif ( self.roster[sourceGUID] ) then\n                return self:AdditionalVerification(allstates, subEvent, sourceGUID, spellID, destGUID);\n            end\n            \n        elseif ( event == \"UNIT_SPELLCAST_SUCCEEDED\" and ... ) then\n            local srcUnit, spellName = ...;\n            local guid = UnitGUID(srcUnit);\n            \n            if ( self:SpellIsDisplay(guid, nil, spellName) ) then \n                local spellID = self.USS[spellName].id;\n                if ( self.roster[guid].spells[spellID] ) then\n                    return self:EditState(allstates, guid, spellID, event);\n                end\n            end\n            \n        elseif ( event == \"PLAYER_LOGOUT\" ) then\n            self:SaveCurrentSession();\n            self:scheduleUpdateFrames(allstates, 0.05);\n        end\n    end\nend",
						["spellIds"] = {
						},
						["names"] = {
						},
						["check"] = "event",
						["events"] = "INVISUS_COOLDOWNS RAID_ROSTER_UPDATE PARTY_MEMBERS_CHANGED WA_PARTY_MEMBERS_UPDATE CLEU:SPELL_CAST_SUCCESS:SPELL_AURA_REMOVED:SPELL_AURA_APPLIED:SPELL_RESURRECT:UNIT_DIED UNIT_SPELLCAST_SUCCEEDED UNIT_PET ZONE_CHANGED_NEW_AREA UNIT_IS_VISIBLE WA_INSPECT_READY UNIT_INVENTORY_CHANGED UNIT_FACTION UNIT_NAME_UPDATE PLAYER_LOGOUT WA_INIT ",
						["subeventPrefix"] = "SPELL",
						["customVariables"] = "{\n    expirationTime = true,\n    duration = true,\n    isBuff = {\n        display = \"Effect is Active\",\n        type = \"bool\",\n    },\n    isCD = {\n        display = \"Spell is on Cooldown\",    \n        type = \"bool\"    \n    }\n}",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1]\nend",
				["activeTriggerMode"] = 1,
			},
			["Thezmonkey"] = {
				["roster"] = {
					["0x0A00000000A5C956"] = {
						["spells"] = {
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367628.077,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 367628.077,
							},
							[6346] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 367628.077,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 367628.077,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 367628.077,
							},
						},
						["race"] = "Human",
						["trinkets"] = {
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitName"] = "Klafat",
					},
				},
			},
			["internalVersion"] = 44,
			["Vaaldruk"] = {
				["roster"] = {
				},
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = true,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["y"] = 0,
					["x"] = 45,
					["duration_type"] = "seconds",
					["translateType"] = "straightTranslate",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration"] = "0.3",
					["colorB"] = 1,
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    \n    return start + (progress * delta)\nend",
					["use_translate"] = false,
					["use_alpha"] = false,
					["duration_type"] = "seconds",
					["type"] = "custom",
					["use_color"] = true,
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend",
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["x"] = 0,
					["translateType"] = "custom",
					["colorType"] = "custom",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local state = aura_env.region.state\n    if ( aura_env.config.des and state ) then\n        aura_env.region.icon:SetDesaturated(state.dst) \n    end\n    return r1, g1, b1, a1\nend",
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorA"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_translate"] = true,
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["duration"] = "0.3",
					["y"] = 0,
					["x"] = -45,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["easeStrength"] = 3,
					["preset"] = "slideleft",
					["colorB"] = 1,
				},
			},
			["Cassa"] = {
				["roster"] = {
				},
			},
			["actions"] = {
				["start"] = {
					["do_custom"] = true,
					["do_message"] = false,
					["custom"] = "aura_env:scheduleUpdateEvent(\"INVISUS_COOLDOWNS\", 0.5, \"FRAME_UPDATE\")\n\n\n",
				},
				["finish"] = {
					["do_glow"] = false,
					["hide_all_glows"] = false,
					["custom"] = "aura_env:scheduleUpdateEvent(\"INVISUS_COOLDOWNS\", 0.05, \"FRAME_UPDATE\")",
					["do_message"] = false,
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "local WeakAuras, PartyCooldownTracker, db, DEFAULT_CHAT_FRAME = WeakAuras, aura_env, WeakAurasSaved, DEFAULT_CHAT_FRAME;\nlocal WA_GetUnitDebuff, UnitDebuff = WA_GetUnitDebuff, UnitDebuff;\nlocal _G, pairs, tonumber, select = _G, pairs, tonumber, select;\nlocal GetSpellInfo, GetCurrentMapAreaID, GetItemInfo, GetItemIcon= GetSpellInfo, GetCurrentMapAreaID, GetItemInfo, GetItemIcon;\nlocal UnitExists, UnitFactionGroup, GetNumPartyMembers = UnitExists, UnitFactionGroup, GetNumPartyMembers;\nlocal UnitInParty, UnitCreatureFamily = UnitInParty, UnitCreatureFamily;\nlocal GetInventoryItemLink = GetInventoryItemLink;\nlocal UnitName, UnitGUID, UnitRace, UnitClass = UnitName, UnitGUID, UnitRace, UnitClass;\nlocal config = PartyCooldownTracker.config;\nlocal LoadAddOn, LibStub = LoadAddOn, LibStub;\nlocal GetLocale, GetTime = GetLocale, GetTime;\n\nPartyCooldownTracker.libGT = LibStub:GetLibrary(\"LibGroupTalents-1.0\", true);\n\nif ( not PartyCooldownTracker.libGT ) then\n    local loaded, reason = LoadAddOn(\"LibGroupTalents-1.0\");\n    PartyCooldownTracker.libGT = LibStub:GetLibrary(\"LibGroupTalents-1.0\", true);\nend\n\nif ( PartyCooldownTracker.libGT ) then\n    function PartyCooldownTracker:LibGroupTalents_Update(e, guid, unit, newSpec, n1, n2, n3)\n        local unitName = UnitName(unit);\n        WeakAuras.timer:ScheduleTimer(\n        WeakAuras.ScanEvents, 0.5, \"INVISUS_COOLDOWNS\", \"LibGroupTalents_Update\", unit, unitName)\n    end\n    PartyCooldownTracker.libGT.RegisterCallback(PartyCooldownTracker, \"LibGroupTalents_Update\");\nelseif ( not config.lib_error ) then\n    DEFAULT_CHAT_FRAME:AddMessage(\"|cff69ccf0PartyCooldownTracker- WA|r couldn't find LibGroupTalents-1.0. Download the lib to display talent required cooldowns. (You can copy the name of lib in the |cffffd100Information|r tab).\");\nend\n\n-------------------------------------------------------------------------------------------------------\nPartyCooldownTracker.roster = PartyCooldownTracker.roster or {};\nPartyCooldownTracker.pet_roster = PartyCooldownTracker.pet_roster or {} ;\n\nfunction PartyCooldownTracker:GetNumPartyMembers()\n    if ( GetNumPartyMembers() == 0 ) then\n        return 0;\n    end\n    return config.countUnits <= GetNumPartyMembers() and config.countUnits or GetNumPartyMembers();\nend\n--------------------------------------------------------------------------------------------------------------------\nfunction PartyCooldownTracker:SaveCurrentSession()\n    db.displays[self.id][WeakAuras.me] = {};\n    local data = db.displays[self.id][WeakAuras.me];\n    data.roster = self.roster;\nend\n\nfunction PartyCooldownTracker:GroupRosterGeneration(object)\n    for i = 1, self:GetNumPartyMembers() do\n        local unit = \"party\"..i;\n        if ( UnitExists(unit) ) then \n            object[UnitGUID(unit)] = unit; \n        end\n    end\n    return object;\nend\n\nfunction PartyCooldownTracker:LoadLastSession()\n    local data = db.displays[self.id][WeakAuras.me];\n    local members = self:GroupRosterGeneration({});\n    \n    if ( ( not data ) or ( data and not data.roster ) ) then\n        return;\n    end\n    \n    for guid, unitDATA in pairs(data.roster) do\n        if ( members[guid] and self.roster[guid] ) then\n            local class = unitDATA.class;\n            local unitID = members[guid];\n            local member = self.roster[guid];\n            for spellID, info in pairs(unitDATA.spells) do\n                if ( self.cds[class][spellID] and self.cds[class][spellID].display )\n                or ( self.anyCDs[spellID] and self.anyCDs[spellID].display ) then\n                    \n                    member.spells = member.spells or {};\n                    member.spells[spellID] = member.spells[spellID] or {};\n                    member.spells[spellID].cd = info.cd;\n                    if ( info.exp and math.abs(info.exp - GetTime()) < info.cd ) then\n                        member.spells[spellID].dst = info.dst;\n                        member.spells[spellID].exp = info.exp;\n                        member.spells[spellID].cd = info.cd;\n                    end\n                end\n            end\n            \n            for invSlot, itemData in pairs(unitDATA.trinkets) do\n                if ( self.anyCDs[itemData.spellID] and self.anyCDs[itemData.spellID].display ) then\n                    self:AddTrinketInfo(guid, invSlot, itemData.itemName, itemData.itemID, itemData.spellID)\n                end\n            end\n            for petGUID, petData in pairs(unitDATA.pet) do\n                self.pet_roster[petGUID] = petData;\n                for spellID, info in pairs(petData.spells) do\n                    self:AddCooldownInfo(guid, spellID, info.cd)\n                end\n            end\n            \n            self.roster[guid] = member;\n        end\n    end\n    \nend\n---------------------------------------------------------------------------------------------------------------------\nlocal function GetSpellIcon(spellID, guid)\n    local icon = select(3, GetSpellInfo(spellID));\n    local data = PartyCooldownTracker.roster[guid];\n    \n    if ( data and data.trinkets ) then\n        for slotID, slotINFO in pairs(data.trinkets) do\n            if ( slotINFO.spellID == spellID ) then\n                icon = GetItemIcon(slotINFO.itemID) or icon;\n                break;\n            end\n        end\n    end\n    return icon;\nend \n\nfunction PartyCooldownTracker.GetPetGUID(unitID)\n    if ( unitID and unitID:match(\"party\") ) then\n        local i = (unitID):match(\"%d\");\n        local petID = \"partypet\"..i;\n        if ( UnitExists(petID) ) then\n            local petGUID = UnitGUID(petID);\n            return petGUID;\n        end\n    end            \nend\n\nlocal function GetPetID(unitID)\n    local i = (unitID):match(\"%d\");\n    if ( i and UnitExists(\"partypet\"..i) ) then\n        return \"partypet\"..i;\n    end\nend\n\nfunction PartyCooldownTracker:AdditionalVerification(allstates, subEvent, guid, spellID, destGUID)\n    if not ( subEvent == \"SPELL_CAST_SUCCESS\" ) then \n        return;\n    end\n    \n    local class = self.roster[guid] and self.roster[guid].class;\n    if ( self.relationship[class] and self.relationship[class][spellID] ) then\n        if ( not self.roster[guid].spells[spellID] ) then \n            return true, self:Relationship(allstates, guid, spellID, destGUID);\n        end\n    end\nend\n\nfunction PartyCooldownTracker:SpellIsDisplay(guid, spellID, spellName)\n    if ( self.roster[guid] and self.roster[guid].spells[spellID] ) then\n        return guid;\n    elseif ( self.pet_roster[guid] ) then\n        guid = self.pet_roster[guid].unitGUID;\n        if ( self.roster[guid] and self.roster[guid].spells[spellID] ) then\n            return guid;\n        end\n    elseif ( self.roster[guid] and self.USS[spellName] and self.USS[spellName].display ) then\n        return guid;\n    else\n        return false;\n    end\nend\n\nfunction PartyCooldownTracker:AddInfo(guid, spellID, exp, dst)\n    if not ( self.roster[guid] and self.roster[guid].spells[spellID] ) then \n        return;\n    end\n    \n    self.roster[guid].spells[spellID].exp = exp;\n    self.roster[guid].spells[spellID].dst = dst;\nend\n\nlocal C_PVP = {};\nC_PVP[0] = true;\n\nC_PVP.IsPVPMap = function() \n    return C_PVP[GetCurrentMapAreaID()];\nend\n\nfunction PartyCooldownTracker:Update(allstates)\n    if ( not C_PVP.IsPVPMap() ) then \n        return\n    end\n    \n    for _, state in pairs(allstates) do\n        if ( state and state.show ) then\n            state.changed=  true;\n            state.expirationTime = GetTime();\n            state.dst = false;\n            state.isBuff = false;\n            state.isCD = false;\n            \n            self:AddInfo(state.guid, state.spellID, state.expirationTime, state.dst);\n        end\n    end\n    return true;\nend\n-- Checking spells that have one CD\nfunction PartyCooldownTracker:Relationship(allstates, guid, spellID, destGUID) \n    local class = self.roster[guid].class;\n    if ( self.relationship[class] and self.relationship[class][spellID] ) then\n        \n        if ( spellID == 10278 and guid ~= destGUID ) then \n            return\n        end\n        \n        for id, cd in pairs(self.relationship[class][spellID]) do\n            local state = allstates[guid..id];\n            if ( state and (not state.isCD or state.expirationTime < cd + GetTime()) ) then\n                \n                state.show = true;\n                state.changed = true;\n                state.progressType = \"timed\";\n                state.duration = cd;\n                state.expirationTime = cd + GetTime();\n                state.isCD = true;\n                state.dst = config.des;\n                \n                allstates[guid..id] = state;\n                self:AddInfo(guid, id, state.expirationTime, state.dst);\n            end\n        end\n    end    \nend      \n\nfunction PartyCooldownTracker:GetHypothermia(allstates, guid, id)\n    local state = allstates[guid..id];\n    if ( not state ) then\n        return;\n    end\n    \n    local hypothermia = GetSpellInfo(41425);\n    state.changed = true;\n    \n    if ( WA_GetUnitDebuff(state.unit, hypothermia) ) then\n        state.expirationTime = select(7, UnitDebuff(state.unit, hypothermia));\n        allstates[guid..id] = state;\n        self:AddInfo(guid, id, state.expirationTime, state.dst);\n    else\n        state.dst = false;\n        state.isCD = false;\n        state.isBuff = false;\n        state.expirationTime = GetTime();\n        allstates[guid..id] = state;\n        self:AddInfo(guid, id, state.expirationTime, state.dst);\n    end \nend\n\nfunction PartyCooldownTracker:RefreshState(allstates, guid, spellID) \n    for _, id in pairs(self.refresh[spellID]) do\n        if ( id == 45438 ) then\n            return self:GetHypothermia(allstates, guid, id);\n        end\n        \n        if ( allstates[guid..id] ) then\n            local state = allstates[guid..id];\n            state.changed = true;\n            state.expirationTime = GetTime();\n            state.dst = false;\n            state.isCD = false;\n            state.isBuff = false;\n            \n            allstates[guid..id] = state;\n            self:AddInfo(guid, id, state.expirationTime, state.dst);\n        end\n    end\nend\n\nfunction PartyCooldownTracker:SetDesaturated(allstates, guid, spellID)\n    local state = allstates[guid..spellID];\n    if ( not state ) then\n        return;\n    end\n    \n    if ( self.blacklist[spellID] ) then\n        state.expirationTime = GetTime() + state.duration;\n        state.dst = config.des;\n        state.isCD = true;\n        state.isBuff = false;\n        \n        self:AddInfo(guid, spellID, state.expirationTime, state.dst);\n        \n    elseif ( state.isCD and state.isBuff ) then\n        state.expirationTime = state.expirationTime;\n        state.isBuff = false;\n        state.dst = config.des;\n        \n        self:AddInfo(guid, spellID, state.expirationTime, state.dst);\n    end\n    return true;\nend\n\nfunction PartyCooldownTracker:SetGlow(allstates, guid, spellID, duration)\n    local state = allstates[guid..spellID];\n    if ( not state ) then\n        return;\n    end\n    \n    state.isBuff = config.glow;\n    state.dst = false;\n    if ( not self.blacklist[spellID] and duration ) then\n        if ( spellID == 43039 ) then duration = 60; end\n        WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, duration,\n            \"COMBAT_LOG_EVENT_UNFILTERED\", GetTime(), \"SPELL_AURA_REMOVED\", guid, nil, nil, nil, nil, nil, spellID);\n    end\n    return true\nend\n----------------------        CREATE FRAME      -------------------------------------------------------\n-- created when the event is fired\nfunction PartyCooldownTracker:EditState(allstates, guid, spellID, subEvent, destGUID) \n    allstates[guid..spellID] = allstates[guid..spellID] or {};\n    local state = allstates[guid..spellID];\n    local data = self.roster[guid];\n    local unit = data.unitID;\n    local class = data.class;\n    \n    if ( not data or not (data.spells and data.spells[spellID]) ) then \n        return;\n    end\n    \n    state.show = true;\n    state.changed = true;\n    state.progressType = state.progressType or \"timed\";\n    state.icon = state.icon or GetSpellIcon(spellID, guid);\n    state.duration = data.spells[spellID].cd;\n    state.expirationTime = GetTime() + state.duration;\n    -- custom\n    state.autoHide = config.show;\n    state.isCD = true;\n    state.dst = config.des;\n    state.isBuff = false;\n    state.unit = data.unitID;\n    state.unitName = data.unitName;\n    state.guid = guid;\n    state.spellID = spellID;\n    \n    allstates[guid..spellID] = state;\n    self:AddInfo(guid, spellID, state.expirationTime, state.dst);\n    \n    if ( self.refresh[spellID] and subEvent ~= \"UNIT_DIED\" ) then\n        self:RefreshState(allstates, guid, spellID);\n    elseif ( self.relationship[class] and self.relationship[class][spellID] ) then\n        self:Relationship(allstates, guid, spellID, destGUID);\n    end\n    return true;\nend\n-- main create\nfunction PartyCooldownTracker:CreateCDFrame(allstates, guid, spellID)\n    local unitDATA = self.roster[guid];\n    local spellDATA = unitDATA.spells[spellID];\n    \n    allstates[guid..spellID] = {\n        show = true,\n        changed = true,\n        autoHide = config.show,\n        icon = GetSpellIcon(spellID, guid), \n        progressType = \"timed\",\n        duration = spellDATA.cd,\n        expirationTime = spellDATA.exp or GetTime(),\n        -- custom\n        unit = unitDATA.unitID,\n        isCD = ( spellDATA.exp and spellDATA.exp > GetTime() ) and true or false,\n        unitName = unitDATA.unitName,\n        dst = spellDATA.dst or false,\n        isBuff = false,\n        guid = guid,\n        spellID = spellID,\n    };\nend\n\nfunction PartyCooldownTracker:CreateFrame(allstates, guid)\n    local unitDATA = self.roster[guid];\n    for spellID in pairs(unitDATA.spells) do\n        self:CreateCDFrame(allstates, guid, spellID);\n    end\nend\n\nfunction PartyCooldownTracker:CreateFrames(allstates)\n    for guid in pairs(self.roster) do\n        self:CreateFrame(allstates, guid);\n    end\nend\n--------------------------------------------------------------------------\nfunction PartyCooldownTracker:AddCooldownInfo(guid, id, cd)\n    self.roster[guid].spells[id] = self.roster[guid].spells[id] or {};\n    self.roster[guid].spells[id].cd = cd;\nend\n\nfunction PartyCooldownTracker:AddTrinketInfo(guid, invSlot, itemName, itemID, spellID)\n    self.roster[guid].trinkets[invSlot] = self.roster[guid].trinkets[invSlot] or {};\n    self.roster[guid].trinkets[invSlot].itemName = itemName;\n    self.roster[guid].trinkets[invSlot].spellID = spellID;\n    self.roster[guid].trinkets[invSlot].itemID = itemID;\nend\n\nfunction PartyCooldownTracker:AddPetsInfo(unitGUID, petGUID, id, cd)\n    self.roster[unitGUID].pet[petGUID].spells[id] = self.roster[unitGUID].pet[petGUID].spells[id] or {};\n    self.roster[unitGUID].pet[petGUID].spells[id].cd = cd;\nend\n--------------------------------------------------------------------------\nfunction PartyCooldownTracker:RemoveCooldownInfo(allstates, guid, spellID)\n    self.roster[guid].spells[spellID] = nil;\n    local state = allstates[guid..spellID];\n    \n    if ( not state ) then\n        return;\n    end\n    \n    state.show = false;\n    state.changed = true;\n    allstates[guid..spellID] = state;\n    return true;\nend\n\nfunction PartyCooldownTracker:PetCooldownRemove(allstates, guid)\n    local update = falsel\n    for petGUID, data in pairs(self.pet_roster) do\n        if ( data.unitGUID == guid ) then\n            for spellID in pairs(data.spells) do\n                self:RemoveCooldownInfo(allstates, guid, spellID);\n            end\n            self.pet_roster[petGUID] = nil;\n            self.roster[guid].pet[petGUID] = nil;\n            update = true;\n        end\n    end\n    return update;\nend\n\nfunction PartyCooldownTracker:PetCooldownInit(allstates, unitGUID, petGUID, petType)\n    local createFrames = false;\n    for spellID, data in pairs(self.pets[petType]) do\n        if ( data.display ) then\n            self.pet_roster[petGUID].spells[spellID] = true;\n            self:AddPetsInfo(unitGUID, petGUID, spellID, data.cd);\n            self:AddCooldownInfo(unitGUID, spellID, data.cd);\n            self:CreateCDFrame(allstates, unitGUID, spellID);\n            createFrames = true;\n        end\n    end\n    return createFrames;\nend\n\nlocal function CreatePetRoster(unitGUID, petType)\n    return { unitGUID = unitGUID, type = petType, spells = {} };\nend\n\nfunction PartyCooldownTracker:UnitPetCDInit(allstates, unit)\n    local createFrame = false;\n    local unitGUID = UnitGUID(unit);\n    local petID = GetPetID(unit);\n    \n    if ( ( not petID ) or ( not self.roster[unitGUID] ) ) then\n        return;\n    end\n    \n    local petType = UnitCreatureFamily(petID);\n    local petGUID = UnitGUID(petID);\n    if ( self.pets[petType] and not self.pet_roster[petGUID] ) then\n        self.pet_roster[petGUID] = CreatePetRoster(unitGUID, petType);\n        self.roster[unitGUID].pet[petGUID] = CreatePetRoster(unitGUID, petType);\n        if ( self:PetCooldownInit(allstates, unitGUID, petGUID, petType) ) then\n            createFrame = true;\n        end\n    end\n    \n    return createFrame;\nend\n\nlocal function GetTableSize(object)\n    local t = {};\n    for _, v in pairs(object) do\n        tinsert(t, v);\n    end\n    return #t;\nend\n\nlocal function ScheduleTimer(duration, unit, guid, nilchek)\n    WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, duration, \"WA_INSPECT_READY\", unit, guid, nilchek);\nend\n\nPartyCooldownTracker.detected = {};\nfunction PartyCooldownTracker:UnitIsDetected(unit, guid, isDetected)\n    if ( self.detected[guid] ) then\n        self.detected[guid] = WeakAuras.timer:CancelTimer(self.detected[guid]);\n    end\n    if ( isDetected ) then\n        self.detected[guid] = ScheduleTimer(0.05, unit, guid, true);\n    else\n        local duration = GetTableSize(self.detected) + 1;\n        self.detected[guid] = ScheduleTimer(duration, unit, guid, false);\n    end\nend\n\nlocal function CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown)\n    PartyCooldownTracker:AddCooldownInfo(guid, spellID, cooldown);\n    PartyCooldownTracker:AddTrinketInfo(guid, invSlot, itemName, itemID, spellID);\n    PartyCooldownTracker:CreateCDFrame(allstates, guid, spellID);\n    return true;\nend\n\nfunction PartyCooldownTracker:UnitItemInit(allstates, unit, guid)\n    if ( not self.roster[guid] ) then\n        return;\n    end\n    local createFrames = false;\n    local invTrinkets = {};\n    local check = false;\n    local data = self.roster[guid];\n    \n    for invSlot = 13, 14 do\n        local itemLink = GetInventoryItemLink(unit, invSlot) or \"\";\n        local itemID = (itemLink):match(\"item:(%d+):\") or \"\";\n        local itemName = GetItemInfo(itemLink);\n        \n        if ( data.trinkets and data.trinkets[invSlot] ) then\n            if ( itemName and itemName ~= data.trinkets[invSlot].itemName ) then\n                local spellID = data.trinkets[invSlot].spellID;\n                createFrames = self:RemoveCooldownInfo(allstates, guid, spellID);\n                data.trinkets[invSlot] = nil;\n            end\n        end\n        \n        if itemName then \n            invTrinkets[itemName] = invSlot;\n            check = true;\n        end\n    end\n    \n    if ( not check ) then\n        return;\n    end\n    \n    for spellID, info in pairs(self.anyCDs) do\n        if ( info.display and info.trinket ) then\n            if ( type(info.trinket) == \"table\" ) then\n                for _, itemID in pairs(info.trinket) do\n                    if ( invTrinkets[GetItemInfo(itemID)] ) then\n                        local itemName = GetItemInfo(itemID);\n                        local invSlot = invTrinkets[itemName];\n                        local cooldown = info.cd;\n                        createFrames = CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown)\n                    end\n                end\n            else\n                local itemName = GetItemInfo(info.trinket);\n                if ( invTrinkets[itemName] ) then\n                    local invSlot = invTrinkets[itemName];\n                    local cooldown = info.cd;\n                    local itemID = info.trinket;\n                    createFrames = CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown);\n                end\n            end\n        end\n    end\n    \n    return createFrames;\nend\n\nfunction PartyCooldownTracker:GlyphsRosterGeneration(object, unit)\n    local active = self.libGT:GetActiveTalentGroup(unit);\n    for i = 1, 6 do \n        local glyph = select(i, self.libGT:GetUnitGlyphs(unit, active));\n        if ( glyph ) then   \n            object[glyph] = true;\n        end\n    end\n    return object;\nend\n\nfunction PartyCooldownTracker:CheckTalents(allstates, unit, guid, createFrames)\n    local update = createFrames;\n    local class = self.roster[guid].class;\n    local glyphs = self:GlyphsRosterGeneration({}, unit);\n    \n    for spellID, data in pairs(self.cds[class]) do\n        if ( data.display and (data.tReq or data.minus or data.glyph) ) then   \n            if ( not data.tReq\n                or select(5, self.libGT:GetTalentInfo(unit, data.tabIndex, data.talentIndex)) ~= 0 ) then\n                local cooldown = data.cd;\n                local glyphSlot = data.glyph;\n                \n                if ( glyphSlot and glyphs[glyphSlot.glyphID] ) then\n                    cooldown = cooldown - glyphSlot.minus;\n                end\n                \n                if ( data.minus ) then\n                    if ( type(data.minusTabIndex) == \"table\" ) then\n                        for i = 1, #data.minusTabIndex do\n                            local curRank = select(5, self.libGT:GetTalentInfo(unit, data.minusTabIndex[i], data.minusTalentIndex[i])) or 0;\n                            cooldown = cooldown - curRank * data.minusPerPoint[i];\n                        end\n                    else\n                        local curRank = select(5, self.libGT:GetTalentInfo(unit, data.minusTabIndex, data.minusTalentIndex)) or 0;\n                        cooldown = cooldown - curRank * data.minusPerPoint;\n                    end\n                end\n                \n                if ( class == \"HUNTER\" ) then\n                    for spell, spellData in pairs(self.relationship[class]) do\n                        for spellId in pairs(spellData) do\n                            if ( spellId == spellID ) then\n                                self.relationship[class][spell][spellId] = cooldown;\n                            end\n                        end \n                    end\n                end\n                \n                self:AddCooldownInfo(guid, spellID, cooldown);\n                update = true;\n            elseif ( self.roster[guid].spells[spellID] ) then\n                update = self:RemoveCooldownInfo(allstates, guid, spellID);\n            end\n        end\n    end\n    \n    if ( update ) then\n        self:CreateFrame(allstates, guid);\n    end\n    WeakAuras.ScanEvents(\"UNIT_IS_VISIBLE\", unit, guid);\n    return update;\nend\n\nfunction PartyCooldownTracker:UnitCooldownsInit(allstates, unit, guid)\n    local class = self.roster[guid].class;\n    local race = self.roster[guid].race;\n    local check = false;\n    local createFrames = false;\n    \n    for spellID, data in pairs(self.cds[class]) do\n        if ( data.display ) then\n            if ( not data.tReq ) then\n                self:AddCooldownInfo(guid, spellID, data.cd);\n                createFrames = true;\n            end\n            \n            if ( not check and (data.tReq or data.minus) ) then\n                check = true;\n            end\n        end\n    end  \n    \n    for spellID, data in pairs(self.anyCDs) do\n        if ( data.display ) then\n            if data.race == race then\n                self:AddCooldownInfo(guid, spellID, data.cd);\n                createFrames = true;\n            end\n        end\n    end\n    \n    if ( check and self.libGT and self.libGT:GetUnitTalents(unit) ) then\n        return self:CheckTalents(allstates, unit, guid, createFrames);\n    elseif ( createFrames ) then\n        self:CreateFrame(allstates, guid);\n    end\n    return createFrames;\nend\n\nfunction PartyCooldownTracker:RosterGeneration(unit, guid, unitClass, faction, race, unitName)\n    return { \n        spells = {}, \n        trinkets = {}, \n        pet = {},\n        unitID = unit, \n        class = unitClass, \n        faction = faction, \n        race = race, \n        unitName = unitName,\n    };\nend\n\nfunction PartyCooldownTracker:InitNewMembers(allstates)\n    local updateFrames = false;\n    for guid, unitData in pairs(self.roster) do\n        if ( not UnitInParty(unitData.unitName) ) then\n            if ( unitData.spells ) then\n                for id in pairs(unitData.spells) do\n                    self:RemoveCooldownInfo(allstates, guid, id);\n                    self:PetCooldownRemove(allstates, guid);\n                end \n            end\n            self.roster[guid] = nil;\n            updateFrames = true;\n        end\n    end\n    \n    for i = 1, self:GetNumPartyMembers() do\n        local unit = \"party\"..i;\n        local unitName = UnitName(unit);\n        local faction = UnitFactionGroup(unit) ; \n        local _, race = UnitRace(unit);\n        local guid = UnitGUID(unit);\n        local _, unitClass = UnitClass(unit);\n        \n        if ( unitName ~= _G.UNKNOWNOBJECT and not self.roster[guid] ) then\n            if ( self.cds[unitClass] ) then\n                self.roster[guid] = self:RosterGeneration(unit, guid, unitClass, faction, race, unitName);\n                \n                if ( self:UnitPetCDInit(allstates, unit) ) then\n                    updateFrames = true;\n                end\n                if ( self:UnitCooldownsInit(allstates, unit, guid) ) then\n                    updateFrames = true;\n                end\n            end\n        end\n    end\n    return updateFrames;\nend\n-------------- >> ANCHOR TO FRMAE << ----------------\nlocal defaultFramePriorities = {\n    -- raid frames\n    [0] = nil,\n    [1] = \"^Vd1\", -- vuhdo\n    [2] = \"^Vd2\", -- vuhdo\n    [3] = \"^Vd3\", -- vuhdo\n    [4] = \"^Vd4\", -- vuhdo\n    [5] = \"^Vd5\", -- vuhdo\n    [6] = \"^Vd\", -- vuhdo\n    [7] = \"^HealBot\", -- healbot\n    [8] = \"^GridLayout\", -- grid\n    [9] = \"^Grid2Layout\", -- grid2\n    [10] = \"^PlexusLayout\", -- plexus\n    [11] = \"^ElvUF_RaidGroup\", -- elv\n    [12] = \"^oUF_bdGrid\", -- bdgrid\n    [13] = \"^oUF_.-Raid\", -- generic oUF\n    [14] = \"^LimeGroup\", -- lime\n    [15] = \"^SUFHeaderraid\", -- suf\n    -- party frames\n    [16] = \"^AleaUI_GroupHeader\", -- Alea\n    [17] = \"^SUFHeaderparty\", --suf\n    [18] = \"^ElvUF_PartyGroup\", -- elv\n    [19] = \"^oUF_.-Party\", -- generic oUF\n    [20] = \"^PitBull4_Groups_Party\", -- pitbull4\n    [21] = \"^XPerl_party\", -- xperl\n    [22] = \"^PartyMemberFrame\", -- blizz\n    [23] = \"^CompactRaid\", -- blizz\n};\n\nlocal defaultPartyTargetFrames = {\n    \"SUFChildpartytarget%d\",\n};\n\nlocal attachIndex = ( config.frame - 1 );\nlocal getFrameOptions = {\n    framePriorities = {\n        [1] = defaultFramePriorities[attachIndex],\n    },\n    ignorePartyTargetFrame = true,\n    partyTargetFrames = defaultPartyTargetFrames,\n};\nif ( config.blizzFrame ) then\n    getFrameOptions.ignoreFrames = {\n        \"PitBull4_Frames_Target's target's target\",\n        \"ElvUF_PartyGroup%dUnitButton%dTarget\",\n        \"ElvUF_FocusTarget\",\n        \"PartyMemberFrame\",\n        \"RavenButton\",\n    };\nend\n\nlocal growDirections = {\n    [1] = \"BOTTOM\",\n    [2] = \"BOTTOMLEFT\",\n    [3] = \"BOTTOMRIGHT\",    \n    [4] = \"CENTER\",\n    [5] = \"LEFT\",\n    [6] = \"RIGHT\",\n    [7] = \"TOP\",\n    [8] = \"TOPLEFT\",\n    [9] = \"TOPRIGHT\",\n};\n\nPartyCooldownTracker.positionFrom = growDirections[config.anchor];\nPartyCooldownTracker.positionTo = growDirections[config.anchorTo];\nPartyCooldownTracker.spacing = config.spacing;\nPartyCooldownTracker.xOffset = config.xOffset;\nPartyCooldownTracker.yOffset = config.yOffset;\nPartyCooldownTracker.column = config.column;\nPartyCooldownTracker.auraCount = {};\n\nlocal function setIconPosition(self, state, rowIdx)\n    local unitToken;\n    for i = 1, self:GetNumPartyMembers() do\n        local unit = \"party\"..i;\n        if ( UnitName(unit) == state.unitName ) then unitToken = unit; end\n    end\n    if ( not unitToken ) then\n        state.show = false\n        state.changed = true\n    else\n        state.unitID = unitToken;\n        local region = WeakAuras.GetRegion(self.id, state.guid..state.spellID);\n        local f = WeakAuras.GetUnitFrame(state.unitID, getFrameOptions);\n        if ( f and region ) then\n            self.auraCount[state.unitID] = self.auraCount[state.unitID] or {};\n            self.auraCount[state.unitID].rowIdx = self.auraCount[state.unitID].rowIdx or 0;\n            self.auraCount[state.unitID].column = self.auraCount[state.unitID].column or 0;\n            self.auraCount[state.unitID].delta = self.auraCount[state.unitID].delta or 1;\n            \n            if ( self.auraCount[state.unitID].rowIdx == self.column ) then\n                self.auraCount[state.unitID].column = self.auraCount[state.unitID].column + 1;\n                self.auraCount[state.unitID].rowIdx = 0;\n                self.auraCount[state.unitID].delta = rowIdx;\n            end\n            \n            local order = self.auraCount[state.unitID].column;\n            local xoffset, yoffset = 0, 0;\n            local height, width = region:GetHeight() + self.spacing, region:GetWidth() + self.spacing;\n            local delta = self.auraCount[state.unitID].delta;\n            \n            if config.direction == 1 then -- Left, then down\n                yoffset = yoffset - (order * height)\n                xoffset = xoffset - (rowIdx - delta) * width\n            elseif  config.direction == 2 then -- Right, then down\n                yoffset = yoffset - (order * height)\n                xoffset = xoffset + (rowIdx - delta) * width\n            elseif  config.direction == 3 then -- Left, then up\n                yoffset = yoffset + (order * height)\n                xoffset = xoffset - (rowIdx - delta) * width\n            elseif  config.direction == 4 then  -- Right, then up\n                yoffset = yoffset + (order * height)\n                xoffset = xoffset + (rowIdx - delta) * width\n            end\n            \n            region:SetAnchor(self.positionFrom, f, self.positionTo);\n            region:SetOffset(xoffset + self.xOffset, yoffset + self.yOffset);\n            self.auraCount[state.unitID].rowIdx = self.auraCount[state.unitID].rowIdx + 1;\n        else\n            region:SetAnchor(self.positionFrom, _G.UIParent, self.positionTo);\n            region:SetOffset(-3000, 0);\n            if ( not config.lib_error ) then\n                DEFAULT_CHAT_FRAME:AddMessage(\"|cff69ccf0PartyCooldownTracker|r: 404 frame not found. Calling the function again.\")\n            end\n            self:scheduleUpdateEvent(\"INVISUS_COOLDOWNS\", 0.5, \"FRAME_UPDATE\");\n        end\n    end\nend\n\nfunction PartyCooldownTracker:sort(allstates)\n    local t = {};\n    for _, state in pairs(allstates) do\n        if ( state.spellID ) then\n            t[#t+1] = state;\n        end\n    end\n    table.sort(t, function (a,b)     \n            return ( a.spellID > b.spellID ) \n    end)\n    \n    return t;\nend\n\nPartyCooldownTracker.updateFrames = function(self, allstates)\n    table.wipe(self.auraCount);\n    local sortTable = self:sort(allstates);\n    for guid in pairs(self.roster) do  \n        local rowIdx = 0;\n        for _, state in pairs(sortTable) do\n            if ( state.show and state.guid == guid ) then\n                rowIdx = rowIdx + 1;\n                setIconPosition(self, state, rowIdx);\n            end                \n        end            \n    end\nend\n\nlocal timer;\nfunction PartyCooldownTracker:scheduleUpdateFrames(allstates, duration)\n    if ( timer ) then WeakAuras.timer:CancelTimer(timer); end\n    timer = WeakAuras.timer:ScheduleTimer(function()\n            self:updateFrames(allstates) end, \n        duration\n    );\nend\n\nPartyCooldownTracker.Events = {};\nfunction PartyCooldownTracker:scheduleUpdateEvent(event, duration, ...)\n    if ( ( not event ) or (not duration ) ) then\n        return\n    end\n    if ( self.Events[event] ) then self.Events[event] = WeakAuras.timer:CancelTimer(self.Events[event]); end\n    self.Events[event] = WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, \n    duration, event, ...);\nend \n\nPartyCooldownTracker.cds = {\n    [\"DEATHKNIGHT\"] = {\n        [48707] = {\n            [\"cd\"] = 45,\n        },\n        [51052] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 22,\n            [\"cd\"] = 120,\n        },\n        [49016] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 19,\n            [\"cd\"] = 180,\n        },\n        [48792] = {\n            [\"cd\"] = 120,\n        },\n        [49005] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 15,\n            [\"cd\"] = 180,\n        },\n        [48982] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 7,\n            [\"cd\"] = 60,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 10,\n            [\"minusPerPoint\"] = 10,\n        },\n        [55233] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 23,\n            [\"cd\"] = 60,\n        },\n        [49576] = {\n            [\"cd\"] = 35,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 6,\n            [\"minusPerPoint\"] = 5,\n        }, \n        [46584] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = {3, 3},\n            [\"minusTalentIndex\"] = {13, 20},\n            [\"minusPerPoint\"] = {45, 60},\n        },  \n        [42650] = {\n            [\"cd\"] = 600,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 13,\n            [\"minusPerPoint\"] = 120,\n        },\n        [47528] = {\n            [\"cd\"] = 10,\n        }, \n        [48743] = {\n            [\"cd\"] = 120,\n        }, \n        [47476] = {\n            [\"cd\"] = 120,\n            [\"glyph\"] = {[\"glyphID\"] = 58618, [\"minus\"]= 20},\n        }, \n        [49206] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 31,\n            [\"cd\"] = 180,\n        }, \n        [49203] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 20,\n            [\"cd\"] = 180,\n        }, \n        [49039] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 8,\n            [\"cd\"] = 120\n        },\n        [51271] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 24,\n            [\"cd\"] = 60,\n        },\n        [49937] = {\n            [\"cd\"] = 30, \n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 5,\n            [\"minusPerPoint\"] = 5,\n        }, \n    },\n    [\"DRUID\"] = {\n        [29166] = {\n            [\"cd\"] = 180,\n        },\n        [48477] = {\n            [\"cd\"] = 600,\n        },\n        [48447] = {\n            [\"cd\"] = 480,\n        },\n        [22812] = {\n            [\"cd\"] = 60,\n        },\n        [61336] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 7,\n            [\"cd\"] = 180,\n        },\n        [22842] = {\n            [\"cd\"] = 180,\n        },\n        [8983] = {\n            [\"cd\"] = 60,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 13,\n            [\"minusPerPoint\"] = 15,\n        },\n        [53201] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 28,\n            [\"cd\"] = 90,\n            [\"glyph\"] = {[\"glyphID\"] = 54828, [\"minus\"] = 30},\n        }, \n        [61384] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 24,\n            [\"cd\"] = 20,\n            [\"glyph\"] = {[\"glyphID\"] = 63056, [\"minus\"] = 3},\n        },\n        [33357] = {\n            [\"cd\"] = 180,\n            [\"glyph\"] = {[\"glyphID\"] = 59219, [\"minus\"] = 36},\n        }, \n        [49376] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 30,\n        }, \n        [16979] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 15,\n        }, \n        [50334] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 30,\n            [\"cd\"] = 180,\n        }, \n        [17116] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 12,\n            [\"cd\"] = 180,\n        },\n        [18562] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 18,\n            [\"cd\"] = 15,\n        }, \n        [48438] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 6,\n        }, \n        [33831] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 180,\n        }, \n    },\n    [\"HUNTER\"] = {\n        [19263] = {\n            [\"cd\"] = 60,\n            [\"glyph\"] = {[\"glyphID\"] = 56850, [\"minus\"] = 10},\n        },\n        [34477] = {\n            [\"cd\"] = 30,\n        },\n        [53271] = {\n            [\"cd\"] = 60,\n        },\n        [3045] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 10,\n            [\"minusPerPoint\"] = 60,\n        },\n        [5384] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 11,\n            [\"minusPerPoint\"] = 2,\n            [\"glyph\"] = {[\"glyphID\"] = 57903, [\"minus\"] = 5},\n        },\n        [781] = {\n            [\"cd\"] = 25,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 11,\n            [\"minusPerPoint\"] = 2,\n            [\"glyph\"] = {[\"glyphID\"] = 56844, [\"minus\"] = 5},\n        },\n        [63672] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,\n        },\n        [49067] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,\n        },\n        [14311] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,\n        },\n        [60192] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,\n        },\n        [34600] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,     \n        },\n        [13809] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,     \n        },\n        [49056] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 2,      \n        },\n        [23989]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 180,\n        }, \n        [19503]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 9,\n            [\"cd\"] = 30,\n        },\n        [34490]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 24,\n            [\"cd\"] = 20,\n        },\n        [1543]   = {\n            [\"cd\"] = 20,\n        },  \n        [49012]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 20,\n            [\"cd\"] = 60,\n            [\"glyph\"] = {[\"glyphID\"] = 56848, [\"minus\"] = 6},\n        }, \n        [49048]  = {\n            [\"cd\"] = 10,\n            [\"glyph\"] = {[\"glyphID\"] = 56836, [\"minus\"] = 1},\n        }, \n        [19577]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 13,\n            [\"cd\"] = 60,\n        }, \n        [19574]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 18,\n            [\"cd\"] = 100,\n            [\"glyph\"] = {[\"glyphID\"] = 56830, [\"minus\"] = 20},\n        }, \n        [49050]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 9,\n            [\"cd\"] = 8,\n            [\"glyph\"] = {[\"glyphID\"] = 56824, [\"minus\"] = 2},\n        }, \n        [53209]  = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 10,\n            [\"glyph\"] = {[\"glyphID\"] = 63065, [\"minus\"] = 1},\n        }, \n        [61006]  = {\n            [\"cd\"] = 15,\n            [\"glyph\"] = {[\"glyphID\"] = 63067, [\"minus\"] = 6}, \n        }, \n    },\n    [\"MAGE\"] = {\n        [45438] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 3,\n            [\"minusPerPoint\"] = 20,\n        },\n        [66] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 24,\n            [\"minusPerPoint\"] = 27,\n        },\n        [12472] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 3,\n            [\"minusPerPoint\"] = 12,\n        },\n        [42917] = {\n            [\"cd\"] = 25,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 3,\n            [\"minusPerPoint\"] = 1.666667,\n        },        \n        [42931] = {\n            [\"cd\"] = 10,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 3,\n            [\"minusPerPoint\"] = 0.7,    \n        },   \n        [2139]  = {\n            [\"cd\"] = 24,\n        }, \n        [55342] = {\n            [\"cd\"] = 180,\n        }, \n        [1953]  = {\n            [\"cd\"] = 15,\n        },\n        [12051] = {\n            [\"cd\"] = 240,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 24,\n            [\"minusPerPoint\"] = 60,\n        },\n        [12043] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 16,\n            [\"cd\"] = 120,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 24,\n            [\"minusPerPoint\"] = 18,\n        },\n        [12042] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 22,\n            [\"cd\"] = 120,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 24,\n            [\"minusPerPoint\"] = 18,\n        }, \n        [42945] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 16,\n            [\"cd\"] = 30,\n        },  \n        [42950] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 20,\n        }, \n        [11958] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 480,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 17,\n            [\"minusPerPoint\"] = 48,\n        },\n        [43039] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 20,\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 17,\n            [\"minusPerPoint\"] = 3,\n        }, \n        [31687] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 17,\n            [\"minusPerPoint\"] = 15,\n            [\"glyph\"] = {[\"glyphID\"] = 56373, [\"minus\"] = 30},\n        },\n        [44572] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 28,\n            [\"cd\"] = 30,\n        },  \n    },\n    [\"PALADIN\"] = {\n        [31821] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 6,\n            [\"cd\"] = 120,\n        },\n        [498] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 14,\n            [\"minusPerPoint\"] = 30,\n        },\n        [64205] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 6,\n            [\"cd\"] = 120,\n        },\n        [642] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 14,\n            [\"minusPerPoint\"] = 30,\n        },\n        [48788] = {\n            [\"cd\"] = 1200,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 8,\n            [\"minusPerPoint\"] = 120,\n            [\"glyph\"] = {[\"glyphID\"] = 57955, [\"minus\"] = 300},\n        },\n        [1044] = {\n            [\"cd\"] = 25,\n        },\n        [54428] = {\n            [\"cd\"] = 60,\n        },\n        [10278] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 4,\n            [\"minusPerPoint\"] = 60,\n        },\n        [6940] = {\n            [\"cd\"] = 120,\n        },\n        [1038] = {\n            [\"cd\"] = 120,\n        },\n        [10308] = {\n            [\"cd\"] = 60,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = {2, 2},\n            [\"minusTalentIndex\"] = {10, 25},\n            [\"minusPerPoint\"] = {10, 5},\n        },  \n        [31884] = {\n            [\"cd\"] = 180,\n        }, \n        [48806] = {\n            [\"cd\"] = 6,\n        }, \n        [19752] = {\n            [\"cd\"] = 600,\n        }, \n        [48827] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 22,\n            [\"cd\"] = 30,\n        }, \n        [20066] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 18,\n            [\"cd\"] = 60,\n        },\n        [48825] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 19,\n            [\"cd\"] = 6,\n            [\"glyph\"] = {[\"glyphID\"] = 63224, [\"minus\"] = 1},\n        }, \n        [20216] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 13,\n            [\"cd\"] = 120,\n        }, \n        [10326] = {\n            [\"cd\"] = 1,\n            [\"glyph\"] = {[\"glyphID\"] = 54931, [\"minus\"] = -7},\n        },\n        [48817] = {\n            [\"cd\"] = 30,\n            [\"glyph\"] = {[\"glyphID\"] = 56420, [\"minus\"]= 15},\n        }, \n    },\n    [\"PRIEST\"] = {\n        [64843] = {\n            [\"cd\"] = 480,\n        },\n        [48158] = {\n            [\"cd\"] = 12,\n        },\n        [6346] = {\n            [\"cd\"] = 180,\n            [\"glyph\"] = {[\"glyphID\"] = 55678, [\"minus\"] = 60},\n        },\n        [47788] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 180,\n        },\n        [64901] = {\n            [\"cd\"] = 360,\n        },\n        [10060] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 19,\n            [\"cd\"] = 120,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 23,\n            [\"minusPerPoint\"] = 12,\n        },\n        [10890] = {\n            [\"cd\"] = 27,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 2,\n            [\"glyph\"] = {[\"glyphID\"] = 55676, [\"minus\"] = -8},\n        },\n        [34433] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 10,\n            [\"minusPerPoint\"] = 60,\n        },\n        [33206] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 23,\n            [\"minusPerPoint\"] = 18,\n        },\n        [48173] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 6,\n            [\"cd\"] = 120,\n        },   \n        [53007] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 10,\n            [\"glyph\"] = {[\"glyphID\"] = 63235, [\"minus\"] = 2},\n        },  \n        [14751] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 8,\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 23,\n            [\"minusPerPoint\"] = 18,\n        },\n        [64044] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 23,\n            [\"cd\"] = 120,\n        }, \n        [47585] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 120,\n            [\"glyph\"] = {[\"glyphID\"] = 63229, [\"minus\"]= 45},\n        }, \n        [15487] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 13,\n            [\"cd\"] = 45,\n        }, \n    },\n    [\"ROGUE\"]  = {\n        [31224] = {\n            [\"cd\"] = 90,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 15,\n        },\n        [26669] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 30,\n        },\n        [57934] = {\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 26,\n            [\"minusPerPoint\"] = 5,\n        }, \n        [26889] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 30,\n        },\n        [2094] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 30,\n        },\n        [14185] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 480,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 26,\n            [\"minusPerPoint\"] = 90, \n        },\n        [36554] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 30,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 26,\n            [\"minusPerPoint\"] = 5,\n            \n        },\n        [11305] = {\n            [\"cd\"] = 180,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 7,\n            [\"minusPerPoint\"] = 30,\n        },\n        [51722] = {\n            [\"cd\"] = 60,\n        },  \n        [1766]  = {\n            [\"cd\"] = 10,\n        }, \n        [1776]  = {\n            [\"cd\"] = 10,\n        },  \n        [8643]  = {\n            [\"cd\"] = 20,\n        },\n        [51713] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 28,\n            [\"cd\"] = 60,\n        },  \n        [51690] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 28,\n            [\"cd\"] = 120,\n            [\"glyph\"] = {[\"glyphID\"] = 63252, [\"minus\"]= 45},\n        },\n        [14177] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 13,\n            [\"cd\"] = 180,\n        },  \n    },\n    [\"SHAMAN\"] = {\n        [32182] = {\n            [\"cd\"] = 300,\n        },\n        [2825] = {\n            [\"cd\"] = 300,\n        },\n        [16190] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 17,\n            [\"cd\"] = 300,\n        },\n        [20608] = {\n            [\"cd\"] = 1800,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 3,\n            [\"minusPerPoint\"] = 420,\n        },\n        [30823] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 26,\n            [\"cd\"] = 60,\n        },\n        [57994] = {\n            [\"cd\"] = 6,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 6,\n            [\"minusPerPoint\"] = 0.2,\n        }, \n        [8177]  = {\n            [\"cd\"] = 15,\n        },  \n        [51514] = {\n            [\"cd\"] = 45,\n        }, \n        [59159] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 25,\n            [\"cd\"] = 45,\n            [\"glyph\"] = {[\"glyphID\"] = 63270, [\"minus\"] = 10},\n        }, \n        [51533] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 29,\n            [\"cd\"] = 180,\n        },  \n        [2894]  = {\n            [\"cd\"] = 600,\n            [\"glyph\"] = {[\"glyphID\"] = 55455, [\"minus\"] = 300},\n            \n        },  \n        [2484]  = {\n            [\"cd\"] = 15,\n        }, \n        [16166] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 16,\n            [\"cd\"] = 180,\n            [\"glyph\"] = {[\"glyphID\"] = 55452, [\"minus\"] = 30},\n        }, \n    }, \n    [\"WARLOCK\"] = {\n        [47877] = {\n            [\"cd\"] = 120,\n        },\n        [48020] = {\n            [\"cd\"] = 30,\n            [\"glyph\"] = {[\"glyphID\"] = 63309, [\"minus\"] = 4}, \n        }, \n        [1122]  = {\n            [\"cd\"] = 600,\n        },\n        [61290] = {\n            [\"cd\"] = 15,\n        },\n        [47827] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 7,\n            [\"cd\"] = 15,\n        },\n        [59671] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 15,\n        },\n        [54785] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 45,\n        },  \n        [47860] = {\n            [\"cd\"] = 120,\n        }, \n        [17928] = {\n            [\"cd\"] = 40,\n            [\"glyph\"] = {[\"glyphID\"] = 56217, [\"minus\"] = 8},\n        },\n        [50796] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 26,\n            [\"cd\"] = 12,   \n            [\"glyph\"] = {[\"glyphID\"] = 63304, [\"minus\"] = 2},    \n        },  \n        [47847] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 23,\n            [\"cd\"] = 20,\n        }, \n        [18708] = {\n            [\"cd\"] = 180,\n        },\n        [47139] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 19,\n            [\"cd\"] = 60,  \n        },\n    },\n    [\"WARRIOR\"] = {\n        [55694] = {\n            [\"cd\"] = 180,\n        },\n        [12975] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 6,\n            [\"cd\"] = 180,\n            [\"glyph\"] = {[\"glyphID\"] = 58376, [\"minus\"] = 60},\n        },\n        [2565] = {\n            [\"cd\"] = 60,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 8,\n            [\"minusPerPoint\"] = 10,\n        },\n        [871] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 13,\n            [\"minusPerPoint\"] = 30,\n            [\"glyph\"] = {[\"glyphID\"] = 63329, [\"minus\"] = 120},\n        },\n        [11578] = {\n            [\"cd\"] = 15,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 1,\n            [\"minusTalentIndex\"] = 24,\n            [\"minusPerPoint\"] = -5,\n        },  \n        [676] = {\n            [\"cd\"] = 60,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 3,\n            [\"minusTalentIndex\"] = 11,\n            [\"minusPerPoint\"] = 10,\n        },\n        [1719] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 33.333,\n        },\n        [20230] = {\n            [\"cd\"] = 300,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 18,\n            [\"minusPerPoint\"] = 33.333,\n        },\n        [20252] =  {\n            [\"cd\"] = 25,\n            [\"minus\"] = true,\n            [\"minusTabIndex\"] = 2,\n            [\"minusTalentIndex\"] = 15,\n            [\"minusPerPoint\"] = 5,\n        },\n        [23920] = {\n            [\"cd\"] = 10,\n            [\"glyph\"] = {[\"glyphID\"] = 63328, [\"minus\"] = 1},\n        },\n        [3411]  = {\n            [\"cd\"] = 30,\n        }, \n        [72]    = {\n            [\"cd\"] = 12,\n        }, \n        [6552]  = {\n            [\"cd\"] = 10,            \n        }, \n        [5246]  = {\n            [\"cd\"] = 120,\n        },\n        [46924] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 1,\n            [\"talentIndex\"] = 31,\n            [\"cd\"] = 90,\n            [\"glyph\"] = {[\"glyphID\"] = 63324, [\"minus\"] = 15},\n        }, \n        [60970] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 23,\n            [\"cd\"] = 45,\n        },  \n        [12809] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 30,\n        }, \n        [46968] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 3,\n            [\"talentIndex\"] = 27,\n            [\"cd\"] = 20,\n            [\"glyph\"] = {[\"glyphID\"] = 63325, [\"minus\"] = 3},\n        },\n        [12292] = {\n            [\"tReq\"] = true,\n            [\"tabIndex\"] = 2,\n            [\"talentIndex\"] = 14,\n            [\"cd\"] = 180,\n        },\n    },    \n};\n\nif ( config.cds ) then\n    for class, classData in pairs(config.cds) do\n        if ( PartyCooldownTracker.cds[class] ) then\n            for spellID, enable in pairs(classData) do\n                spellID = tonumber(spellID);\n                local spellDATA = PartyCooldownTracker.cds[class][spellID];\n                if ( spellDATA ) then\n                    spellDATA.display = enable;\n                end\n            end\n        end\n    end\nend\n\n-- Heroism / Bloodlust\nif ( UnitFactionGroup(\"player\") == \"Horde\" ) then\n    PartyCooldownTracker.cds[\"SHAMAN\"][32182] = nil;\nelse\n    PartyCooldownTracker.cds[\"SHAMAN\"][2825] = nil;\nend\n-- preparation spells\nPartyCooldownTracker.refresh = {\n    [14185] = {26669, 11305, 26889, 14177, 36554, 13877, 51722, 1766}, -- ROGUE\n    [23989] = {\n        19263, 5384, 781, 19503, 34490, 1543, 34600, 3045, \n        49067, 49056, 14311, 60192, 13809, 63672, 49012,  \n        49048, 19577, 49050,53209, 61006, 34477, 53721\n    }, -- HUNTER\n    [11958] = {42917, 45438, 43039, 31687, 44572, 12472}, -- MAGE\n    [46584] = {47481}, -- DK\n};\n\nPartyCooldownTracker.anyCDs = {\n    -- spellID                itemID/race                          \n    [42292] = {[\"cd\"] = 120, [\"trinket\"] = {51377, 51378, 46082}}, -- Medailon Alliance/Horde\n    [71607] = {[\"cd\"] = 120, [\"trinket\"] = {50726, 50354}}, -- Bauble of True Blood\n    [71586] = {[\"cd\"] = 120, [\"trinket\"] = 50356}, -- Corroded Skeleton Key\n    [71638] = {[\"cd\"] = 60,  [\"trinket\"] = 50364}, -- Sindragosa's Flawless Fang\n    [75490] = {[\"cd\"] = 120, [\"trinket\"] = 54573}, -- Glowing Twilight Scale\n    [67596] = {[\"cd\"] = 120, [\"trinket\"] = {42137, 42136, 42135, 42134, 42133}}, -- Battlemaster\n    \n    [59752] = {[\"cd\"] = 120, [\"race\"] = \"Human\"}, -- Every Man for Himself\n    [58984] = {[\"cd\"] = 120, [\"race\"] = \"NightElf\"}, -- Shadowmeld\n    [59547] = {[\"cd\"] = 180, [\"race\"] = \"Draenei\"}, -- Gift of Naaru\n    [20594] = {[\"cd\"] = 120, [\"race\"] = \"Dwarf\"}, -- Stoneform\n    [20589] = {[\"cd\"] = 95,  [\"race\"] = \"Gnome\"}, -- Escape Artist\n    [20572] = {[\"cd\"] = 120, [\"race\"] = \"Orc\"}, -- Blood Fury\n    [7744]  = {[\"cd\"] = 120, [\"race\"] = \"Scourge\"}, -- Will of Forsaken\n    [20549] = {[\"cd\"] = 120, [\"race\"] = \"Tauren\"}, -- War Stomp\n    [26297] = {[\"cd\"] = 180, [\"race\"] = \"Troll\"}, -- Berserk\n    [28730] = {[\"cd\"] = 120, [\"race\"] = \"BloodElf\"}  -- Arcane Torrent\n};\n\nif ( config.ANY ) then\n    for spellID, enable in pairs(config.ANY) do\n        spellID = tonumber(spellID);\n        if ( PartyCooldownTracker.anyCDs[spellID] ) then\n            PartyCooldownTracker.anyCDs[spellID].display = enable;\n        end\n    end\nend\n-- casting spells that can\"t be read from CLEU\nPartyCooldownTracker.USS = {\n    [GetSpellInfo(48477)] = {\n        display = PartyCooldownTracker.cds.DRUID[48477].display,\n        id = 48477,\n    },\n    [GetSpellInfo(51514)] = {\n        display = PartyCooldownTracker.cds.SHAMAN[51514].display,\n        id = 51514,\n    },\n    [GetSpellInfo(61384)] = {\n        display = PartyCooldownTracker.cds.DRUID[61384].display,\n        id = 61384,\n    },\n    [GetSpellInfo(17928)] = {\n        display = PartyCooldownTracker.cds.WARLOCK[17928].display,\n        id = 17928,\n    },\n    [GetSpellInfo(50796)] = {\n        display = PartyCooldownTracker.cds.WARLOCK[50796].display,\n        id = 50796,\n    }, \n    [GetSpellInfo(47877)] = {\n        display = PartyCooldownTracker.cds.WARLOCK[47877].display,\n        id = 47877,\n    },\n    [GetSpellInfo(53007)] = {\n        display = PartyCooldownTracker.cds.PRIEST[53007].display,\n        id = 53007\n    }\n};\n-- spells that have one CD\"s\nPartyCooldownTracker.relationship = {\n    [\"PALADIN\"] = {\n        [498]   = {[31884] = 30, [642] = 120},\n        [642]   = {[31884] = 30, [498] = 120},\n        [31884] = {[642]   = 30, [498] = 30},\n        [10278] = {[31884] = 30, [642] = 120, [498] = 120},\n    },\n    [\"WARRIOR\"] = {\n        [72]    = {[6552] = 10},\n        [6552]  = {[72] = 12}\n    },\n    [\"HUNTER\"]  = {\n        [14311] = {[60192] = 30, [13809] = 30}, \n        [60192] = {[14311] = 30, [13809] = 30},\n        [13809] = {[14311] = 30, [60192] = 30},\n        [49056] = {[49067] = 30},\n        [49067] = {[49056] = 30}\n    },\n    [\"DRUID\"]   = {\n        [49376] = {[16979] = 15},\n        [16979] = {[49376] = 15}\n    }\n};\n\nlocal L = {};\nif GetLocale() == \"enUS\" then\n    L[\"Felhunter\"] = \"Felhunter\"\n    L[\"Voidwalker\"] = \"Voidwalker\"\n    L[\"Ghoul\"] = \"Ghoul\"\n    L[\"Spider\"] = \"Spider\"\n    L[\"Crab\"] = \"Crab\"\n    L[\"Wolf\"] = \"Wolf\"\n    L[\"Worm\"] = \"Worm\"   \n    L[\"Chimaera\"] = \"Chimaera\"\n    L[\"Gorilla\"] = \"Gorilla\"\n    L[\"Turtle\"] = \"Turtle\"\n    L[\"Spirit Beast\"] = \"Spirit Beast\"\n    L[\"Core Hound\"] = \"Core Hound\"\n    L[\"Bat\"] = \"Bat\"\n    L[\"Ravager\"] = \"Ravager\"\nelse\n    L[\"Felhunter\"] = \"Felhunter\"\n    L[\"Voidwalker\"] = \"Voidwalker\"\n    L[\"Ghoul\"] = \"Ghoul\"\n    L[\"Spider\"] = \"Spider\"\n    L[\"Crab\"] = \"Crab\"\n    L[\"Wolf\"] = \"Wolf\"\n    L[\"Worm\"] = \"Worm\"   \n    L[\"Chimaera\"] = \"Chimaera\"\n    L[\"Gorilla\"] = \"Gorilla\"\n    L[\"Turtle\"] = \"Turtle\"\n    L[\"Spirit Beast\"] = \"Spirit Beast\"\n    L[\"Core Hound\"] = \"Core Hound\"\n    L[\"Bat\"] = \"Bat\"\n    L[\"Ravager\"] = \"Ravager\"\nend\n-- pet ability table (API return only localization)\nPartyCooldownTracker.pets = {\n    [L[\"Felhunter\"]] = {\n        [19647] = {[\"cd\"] = 24},\n        [48011] = {[\"cd\"] = 8},\n        [54053] = {[\"cd\"] = 6},\n    },\n    [L[\"Voidwalker\"]] = {\n        [47986] = {[\"cd\"] = 60},\n        [47990] = {[\"cd\"] = 120},\n    },\n    [L[\"Ghoul\"]] = {\n        [47482] = {[\"cd\"] = 20},\n        [47481] = {[\"cd\"] = 60},\n        [47484] = {[\"cd\"] = 45},\n    },\n    [L[\"Spider\"]] =  {\n        [4167] = {[\"cd\"] = 40},\n    },\n    [L[\"Crab\"]] = { \n        [53548] = {[\"cd\"] = 40},\n        [53480] = {[\"cd\"] = 60},\n    },\n    [L[\"Gorilla\"]] = { \n        [26090] = {[\"cd\"] = 30},\n        [53480] = {[\"cd\"] = 60},\n    },\n    [L[\"Turtle\"]] = {\n        [26064] = {[\"cd\"] = 60},\n        [53480] = {[\"cd\"] = 60},\n    },\n    [L[\"Turtle\"]] = {\n        [55754] = {[\"cd\"] = 10}, \n        [53480] = {[\"cd\"] = 60},\n    },\n    [L[\"Wolf\"]] = {\n        [64495] = {[\"cd\"] = 40}\n    },\n    [L[\"Chimaera\"]] = {\n        [55492] = {[\"cd\"] = 10},\n    },\n    [L[\"Spirit Beast\"]] = {\n        [61198] = {[\"cd\"] = 10},\n    },\n    [L[\"Core Hound\"]] = {\n        [58611] = {[\"cd\"] = 10},\n    },\n    [L[\"Bat\"]] = {\n        [53568] = {[\"cd\"] = 60}, \n    },\n    [L[\"Ravager\"]] = {\n        [53561] = {[\"cd\"] = 40},\n        [53480] = {[\"cd\"] = 60},\n    },\n};\n\nfor _, classData in pairs(config.cds) do\n    if ( classData.pet ) then\n        for spellID, enable in pairs(classData.pet) do\n            spellID = tonumber(spellID);\n            for type, data in pairs(PartyCooldownTracker.pets) do\n                for spellId in pairs(data) do\n                    if ( spellId == spellID ) then\n                        PartyCooldownTracker.pets[type][spellID].display = enable;\n                    end\n                end\n            end\n        end\n    end\nend\n--------------------------------------------------------------------------------------------------------\n-- blacklist for CLUE:SPELL_CAST_SUCCESS\nPartyCooldownTracker.blacklist = {\n    [57934] = true, -- tricks of the trade\n    [34477] = true, -- misdirection\n    [14751] = true, -- inner focus\n    [46584] = true, -- raise dead\n    [20216] = true, -- divine favor\n}\n\n\n\n",
					["do_custom"] = true,
				},
			},
			["Selanthii"] = {
				["roster"] = {
					["0x0A00000000A6404B"] = {
						["unitID"] = "party1",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitName"] = "Caylvax",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["pet"] = {
						},
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 195875.545,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 195875.546,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 195875.545,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 195875.544,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 195875.545,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 195875.545,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 195875.545,
							},
						},
					},
				},
			},
			["Göditself"] = {
				["roster"] = {
				},
			},
			["Misnaim"] = {
				["roster"] = {
				},
			},
			["Iìíl"] = {
				["roster"] = {
				},
			},
			["version"] = 115,
			["Unstopabull"] = {
				["roster"] = {
				},
			},
			["height"] = 25,
			["Alterëgo"] = {
				["roster"] = {
					["0x0000000000000019"] = {
						["unitName"] = "Vandre",
						["race"] = "Human",
						["class"] = "WARRIOR",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 203811.664,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 203811.666,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 203811.663,
							},
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 203811.665,
							},
							[23920] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 203811.665,
							},
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 203811.664,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 203811.665,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 203811.665,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 203811.664,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 203811.665,
							},
							[3411] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 203811.664,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
						},
					},
				},
			},
			["Dopelemon"] = {
				["roster"] = {
				},
			},
			["Clench"] = {
				["roster"] = {
					["0x0A00000000A658AD"] = {
						["trinkets"] = {
						},
						["race"] = "Draenei",
						["spells"] = {
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 356991.573,
							},
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 356991.574,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 356991.572,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 356991.573,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 356991.574,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 356991.574,
							},
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 356991.573,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 356991.574,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Bigestgorila",
						["class"] = "WARRIOR",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
					["0x0A00000000A5CF26"] = {
						["trinkets"] = {
						},
						["race"] = "Human",
						["spells"] = {
							[10308] = {
								["dst"] = false,
								["cd"] = 40,
								["exp"] = 356991.575,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 356991.572,
							},
							[54428] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 356991.572,
							},
							[1044] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 356991.574,
							},
							[642] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 356991.573,
							},
							[31884] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 356991.573,
							},
							[10278] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 356991.573,
							},
							[31821] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 356991.575,
							},
							[64205] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 356991.574,
							},
							[6940] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 356991.575,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Boklukxd",
						["class"] = "PALADIN",
						["pet"] = {
						},
						["unitID"] = "party2",
					},
				},
			},
			["url"] = "",
			["Igglum"] = {
				["roster"] = {
					["0x0A00000000A64047"] = {
						["unitName"] = "Sylbriax",
						["race"] = "NightElf",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 195165.565,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 195165.566,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 195165.565,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
						},
					},
				},
			},
			["Meritamsi"] = {
				["roster"] = {
				},
			},
			["Vengeance"] = {
				["roster"] = {
				},
			},
			["Themonkeyx"] = {
				["roster"] = {
					["0x0A00000000A5C91C"] = {
						["unitName"] = "Okhunter",
						["race"] = "NightElf",
						["class"] = "HUNTER",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[19263] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 366895.8,
							},
							[23989] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 366895.801,
							},
							[58984] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 366895.8,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 366895.801,
							},
							[14311] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 366895.8,
							},
							[53271] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 366895.8,
							},
							[19503] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 366895.8,
							},
							[34490] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 366895.799,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
					},
				},
			},
			["Comm"] = {
				["roster"] = {
				},
			},
			["alpha"] = 1,
			["anchorFrameFrame"] = "WeakAuras:PartyMember1Frame",
			["subRegions"] = {
				{
					["glowFrequency"] = 0.25000002980232,
					["type"] = "subglow",
					["useGlowColor"] = true,
					["glowType"] = "ACShine",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						0.96470588235294, -- [2]
						0.5843137254902, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glowScale"] = 1.6,
					["glowThickness"] = 1,
					["glow"] = false,
					["glowLines"] = 5,
					["glowBorder"] = false,
				}, -- [1]
			},
			["xOffset"] = -1720,
			["Biggestmonke"] = {
				["roster"] = {
					["0x0A00000000A5C994"] = {
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["race"] = "NightElf",
						["spells"] = {
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 368599.946,
							},
							[6346] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 368599.946,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368599.946,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 368599.946,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 368599.945,
							},
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 368599.945,
							},
							[58984] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368599.945,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 368599.945,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 368599.945,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Spitisouu",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["Makkarenko"] = {
				["roster"] = {
					["0x00000000001FEA34"] = {
						["trinkets"] = {
						},
						["race"] = "Human",
						["spells"] = {
							[10308] = {
								["dst"] = false,
								["cd"] = 40,
								["exp"] = 10988.441,
							},
							[59752] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 11006.609,
							},
							[54428] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 10991.471,
							},
							[1044] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 10988.44,
							},
							[642] = {
								["dst"] = true,
								["cd"] = 300,
								["exp"] = 11194.82,
							},
							[31884] = {
								["dst"] = true,
								["cd"] = 180,
								["exp"] = 11121.465,
							},
							[10278] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 10988.441,
							},
							[31821] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 10988.439,
							},
							[64205] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 10988.44,
							},
							[6940] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 11060.812,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party2",
						["class"] = "PALADIN",
						["pet"] = {
						},
						["unitName"] = "Likewarpal",
					},
					["0x000000000010E9AE"] = {
						["trinkets"] = {
						},
						["race"] = "Human",
						["spells"] = {
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 10988.44,
							},
							[59752] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 11029.355,
							},
							[11578] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 10988.441,
							},
							[72] = {
								["dst"] = false,
								["cd"] = 12,
								["exp"] = 10988.44,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 10988.439,
							},
							[5246] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 11108.63,
							},
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 10988.44,
							},
							[20252] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 10988.439,
							},
							[46924] = {
								["dst"] = true,
								["cd"] = 90,
								["exp"] = 11004.471,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 10988.441,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "WARRIOR",
						["pet"] = {
						},
						["unitName"] = "Eliasex",
					},
				},
			},
			["Tennatren"] = {
				["roster"] = {
					["0x00000000000000B8"] = {
						["trinkets"] = {
						},
						["race"] = "Human",
						["spells"] = {
							[31884] = {
								["dst"] = false,
								["cd"] = 180,
								["exp"] = 347374.528,
							},
							[6940] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 347374.529,
							},
							[1044] = {
								["dst"] = false,
								["cd"] = 25,
								["exp"] = 347374.529,
							},
							[10278] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 347374.529,
							},
							[642] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 347374.528,
							},
							[54428] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 347374.528,
							},
							[10308] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 347374.528,
							},
							[59752] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 347374.528,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Wonderwomann",
						["class"] = "PALADIN",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["Umonkey"] = {
				["roster"] = {
					["0x0A00000000A5BED6"] = {
						["unitName"] = "Showrunner",
						["race"] = "Human",
						["class"] = "PRIEST",
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							[33206] = {
								["dst"] = true,
								["cd"] = 144,
								["exp"] = 13653.215,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 13542.24,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 13539.492,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 13539.492,
							},
							[10060] = {
								["dst"] = true,
								["cd"] = 96,
								["exp"] = 13618.275,
							},
							[59752] = {
								["dst"] = true,
								["cd"] = 120,
								["exp"] = 13634.796,
							},
							[34433] = {
								["dst"] = true,
								["cd"] = 300,
								["exp"] = 13816.346,
							},
						},
						["pet"] = {
						},
						["trinkets"] = {
						},
					},
				},
			},
			["anchorFrameParent"] = true,
			["Moggoar"] = {
				["roster"] = {
				},
			},
			["cooldown"] = true,
			["Thexmonkey"] = {
				["roster"] = {
					["0x0A00000000A5C941"] = {
						["spells"] = {
							[676] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 367187.94,
							},
							[5246] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367187.939,
							},
							[6552] = {
								["dst"] = false,
								["cd"] = 10,
								["exp"] = 367187.94,
							},
							[871] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 367187.94,
							},
							[2565] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 367187.939,
							},
							[46924] = {
								["dst"] = false,
								["cd"] = 90,
								["exp"] = 367187.939,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 367187.939,
							},
						},
						["race"] = "Gnome",
						["trinkets"] = {
							[13] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["class"] = "WARRIOR",
						["pet"] = {
						},
						["unitName"] = "Okwar",
					},
				},
			},
			["semver"] = "3.0.37",
			["Exxth"] = {
				["roster"] = {
					["0x070000000008F594"] = {
						["trinkets"] = {
						},
						["race"] = "Troll",
						["spells"] = {
							[57994] = {
								["dst"] = false,
								["cd"] = 6,
								["exp"] = 355961.606,
							},
							[2825] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 355961.606,
							},
							[8177] = {
								["dst"] = false,
								["cd"] = 15,
								["exp"] = 355961.607,
							},
							[51514] = {
								["dst"] = false,
								["cd"] = 45,
								["exp"] = 355961.607,
							},
						},
						["faction"] = "Horde",
						["unitName"] = "Amarvati",
						["class"] = "SHAMAN",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["id"] = "PartyCooldownTracker",
			["Hapinnie"] = {
				["roster"] = {
					["0x0A00000000A613ED"] = {
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["race"] = "NightElf",
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 447455.471,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 447455.472,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 447455.471,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 447455.471,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 447455.471,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 447455.47,
							},
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 447455.47,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Thilian",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["frameStrata"] = 2,
			["width"] = 25,
			["Sovjet"] = {
				["roster"] = {
					["0x0700000000688683"] = {
						["trinkets"] = {
							[14] = {
								["itemName"] = "Medallion of the Alliance",
								["itemID"] = 51377,
								["spellID"] = 42292,
							},
						},
						["race"] = "NightElf",
						["spells"] = {
							[42292] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 3165.996,
							},
							[13809] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 3165.996,
							},
							[19503] = {
								["dst"] = false,
								["cd"] = 30,
								["exp"] = 3165.996,
							},
							[34490] = {
								["dst"] = false,
								["cd"] = 20,
								["exp"] = 3165.996,
							},
							[53271] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 3165.996,
							},
							[19263] = {
								["dst"] = false,
								["cd"] = 60,
								["exp"] = 3165.996,
							},
							[49050] = {
								["dst"] = false,
								["cd"] = 8,
								["exp"] = 3165.996,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Konto",
						["class"] = "HUNTER",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["Voltcv"] = {
				["roster"] = {
				},
			},
			["inverse"] = true,
			["Самапнулшм"] = {
				["roster"] = {
					["0x00000000002429B3"] = {
						["class"] = "PRIEST",
						["race"] = "Human",
						["trinkets"] = {
							[14] = {
								["itemName"] = "Подвеска истинной крови",
								["itemID"] = 50354,
								["spellID"] = 71607,
							},
						},
						["faction"] = "Alliance",
						["unitID"] = "party1",
						["spells"] = {
							["64901"] = {
								["dst"] = false,
								["cd"] = 360,
								["exp"] = 3692.015,
							},
							["48173"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 3692.015,
							},
							["10890"] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 3692.015,
							},
							["33206"] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 3692.015,
							},
							["59752"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 3692.015,
							},
							["71607"] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 3692.015,
							},
							["64843"] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 3692.015,
							},
							["34433"] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 3692.015,
							},
						},
						["pet"] = {
						},
						["unitName"] = "Dpheroqt",
					},
				},
			},
			["Rynna"] = {
				["roster"] = {
					["0x0A00000000A64046"] = {
						["trinkets"] = {
						},
						["race"] = "NightElf",
						["spells"] = {
							[33206] = {
								["dst"] = false,
								["cd"] = 144,
								["exp"] = 195009.401,
							},
							[10890] = {
								["dst"] = false,
								["cd"] = 27,
								["exp"] = 195004.613,
							},
							[64843] = {
								["dst"] = false,
								["cd"] = 480,
								["exp"] = 195004.613,
							},
							[48173] = {
								["dst"] = false,
								["cd"] = 120,
								["exp"] = 195009.401,
							},
							[34433] = {
								["dst"] = false,
								["cd"] = 300,
								["exp"] = 195004.613,
							},
							[10060] = {
								["dst"] = false,
								["cd"] = 96,
								["exp"] = 195009.401,
							},
						},
						["faction"] = "Alliance",
						["unitName"] = "Celyiax",
						["class"] = "PRIEST",
						["pet"] = {
						},
						["unitID"] = "party1",
					},
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "",
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "isCD",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "isBuff",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = 0.5,
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "isBuff",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.glow",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "0",
						["variable"] = "expirationTime",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = {
								["custom"] = "aura_env.region.state.isCD = false\naura_env.region.state.dst = false\naura_env.region.state.isBuff = false\n\nlocal guid = aura_env.region.state.guid\nlocal spellID = aura_env.region.state.spellID\nlocal dst = aura_env.region.state.dst\nlocal exp = GetTime()\n\nif guid and spellID then\n    aura_env:AddInfo(guid, spellID, exp, dst)\nend\n\n\n",
							},
							["property"] = "customcode",
						}, -- [1]
						{
							["value"] = 1,
							["property"] = "alpha",
						}, -- [2]
					},
				}, -- [3]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["Asdzx"] = {
				["roster"] = {
				},
			},
		},
	},
	["lastArchiveClear"] = 1627613707,
	["minimap"] = {
		["hide"] = false,
	},
	["lastUpgrade"] = 1627613710,
	["dbVersion"] = 44,
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -240.0122932901654,
		["yOffset"] = -90.66958342802116,
		["height"] = 665.0000550517277,
		["width"] = 830.0000244826317,
	},
	["editor_theme"] = "Monokai",
}
