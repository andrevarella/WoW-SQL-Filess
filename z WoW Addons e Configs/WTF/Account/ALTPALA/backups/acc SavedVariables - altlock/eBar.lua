
eBarDB = {
	["BarID"] = 4,
	["version"] = 1.1,
	["BarConfig"] = {
		["Warrior"] = {
			{
				["enabled"] = true,
				["name"] = "Pummel",
				["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
				["cooldown"] = 10,
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Spell Reflection",
				["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
			}, -- [2]
			{
				["ID"] = 11578,
				["cooldown"] = 20,
			}, -- [3]
			{
				["ID"] = 20252,
				["cooldown"] = 25,
			}, -- [4]
			{
				["ID"] = 18499,
				["cooldown"] = 25,
			}, -- [5]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [6]
		},
		["Paladin"] = {
			{
				["enabled"] = true,
				["name"] = "Holy Shock",
				["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Hammer of Justice",
				["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
			}, -- [2]
			{
				["enabled"] = true,
				["name"] = "Hand of Freedom",
				["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
			}, -- [3]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [4]
			{
				["enabled"] = false,
				["name"] = "Bauble of True Blood",
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
			}, -- [5]
		},
		["Shaman"] = {
			{
				["enabled"] = true,
				["name"] = "Wind Shear",
				["icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Grounding Totem",
				["icon"] = "Interface\\Icons\\Spell_Nature_GroundingTotem",
			}, -- [2]
			{
				["ID"] = 51514,
				["cooldown"] = 45,
			}, -- [3]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [4]
			{
				["enabled"] = false,
				["name"] = "Bauble of True Blood",
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
			}, -- [5]
		},
		["Rogue"] = {
			{
				["enabled"] = true,
				["name"] = "Kick",
				["icon"] = "Interface\\Icons\\Ability_Kick",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Shadowstep",
				["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
			}, -- [2]
			{
				["ID"] = 51713,
				["cooldown"] = 60,
				["enabled"] = true,
			}, -- [3]
			{
				["ID"] = 8643,
				["cooldown"] = 20,
			}, -- [4]
			{
				["ID"] = 51722,
				["cooldown"] = 60,
			}, -- [5]
			{
				["ID"] = 2094,
				["cooldown"] = 120,
			}, -- [6]
			{
				["ID"] = 31224,
				["cooldown"] = 60,
			}, -- [7]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [8]
		},
		["Mage"] = {
			{
				["enabled"] = true,
				["name"] = "Counterspell",
				["icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Deep Freeze",
				["icon"] = "Interface\\Icons\\Ability_Mage_DeepFreeze",
			}, -- [2]
			{
				["enabled"] = true,
				["name"] = "Blink",
				["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
			}, -- [3]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [4]
		},
		["Druid"] = {
			{
				["enabled"] = true,
				["name"] = "Barkskin",
				["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
				["cooldown"] = 60,
			}, -- [1]
			{
				["ID"] = 29166,
				["cooldown"] = 180,
			}, -- [2]
			{
				["ID"] = 50334,
				["cooldown"] = 180,
			}, -- [3]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [4]
			{
				["enabled"] = false,
				["name"] = "Bauble of True Blood",
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
			}, -- [5]
		},
		["Death Knight"] = {
			{
				["enabled"] = true,
				["name"] = "Mind Freeze",
				["icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Death Grip",
				["icon"] = "Interface\\Icons\\Spell_DeathKnight_Strangulate",
			}, -- [2]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [3]
		},
		["Hunter"] = {
			{
				["enabled"] = true,
				["name"] = "Scatter Shot",
				["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
			}, -- [1]
			{
				["ID"] = 14311,
				["cooldown"] = 28,
				["enabled"] = true,
			}, -- [2]
			{
				["ID"] = 23989,
				["cooldown"] = 180,
			}, -- [3]
			{
				["ID"] = 53271,
				["cooldown"] = 60,
			}, -- [4]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [5]
		},
		["Priest"] = {
			{
				["enabled"] = true,
				["name"] = "Psychic Scream",
				["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Penance",
				["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
			}, -- [2]
			{
				["ID"] = 47585,
				["cooldown"] = 90,
				["enabled"] = true,
			}, -- [3]
			{
				["ID"] = 586,
				["cooldown"] = 24,
				["enabled"] = true,
			}, -- [4]
			{
				["ID"] = 15487,
				["cooldown"] = 45,
				["enabled"] = true,
			}, -- [5]
			{
				["ID"] = 48158,
				["cooldown"] = 12,
				["enabled"] = true,
			}, -- [6]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [7]
			{
				["enabled"] = false,
				["name"] = "Bauble of True Blood",
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
			}, -- [8]
		},
		["Warlock"] = {
			{
				["enabled"] = true,
				["name"] = "Spell Lock",
				["icon"] = "Interface\\Icons\\Spell_Shadow_MindRot",
			}, -- [1]
			{
				["enabled"] = true,
				["name"] = "Shadowfury",
				["icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfury",
			}, -- [2]
			{
				["ID"] = 48020,
				["cooldown"] = 30,
			}, -- [3]
			{
				["enabled"] = true,
				["name"] = "PvP Trinket",
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
			}, -- [4]
		},
	},
	["BarPositions"] = {
		["eBar_bar_2"] = {
			"BOTTOM", -- [1]
			"", -- [2]
			"BOTTOM", -- [3]
			243.8387030453465, -- [4]
			191.9795364478556, -- [5]
		},
		["eBar_bar_3"] = {
			"BOTTOM", -- [1]
			"", -- [2]
			"BOTTOM", -- [3]
			246.0546326852979, -- [4]
			105.9716361458183, -- [5]
		},
		["eBar_bar_1"] = {
			"CENTER", -- [1]
			"", -- [2]
			"CENTER", -- [3]
			238.7698060546771, -- [4]
			-197.5276827221608, -- [5]
		},
	},
	["BARS"] = {
		["eBar_bar_2"] = {
			["bar_config"] = {
				["Warrior"] = {
					{
						["enabled"] = true,
						["name"] = "Pummel",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
						["cooldown"] = 10,
					}, -- [1]
					{
						["ID"] = 18499,
						["cooldown"] = 25,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 20252,
						["cooldown"] = 25,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 11578,
						["cooldown"] = 20,
						["order"] = 4,
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "Spell Reflection",
						["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
						["order"] = 5,
					}, -- [5]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [6]
				},
				["Paladin"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["name"] = "Hand of Freedom",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["name"] = "Hammer of Justice",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["name"] = "Holy Shock",
						["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
					}, -- [3]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 50,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [5]
				},
				["Shaman"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["name"] = "Wind Shear",
						["icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["name"] = "Grounding Totem",
						["icon"] = "Interface\\Icons\\Spell_Nature_GroundingTotem",
					}, -- [2]
					{
						["ID"] = 51514,
						["cooldown"] = 45,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Rogue"] = {
					{
						["ID"] = 31224,
						["cooldown"] = 60,
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 2094,
						["cooldown"] = 120,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 8643,
						["cooldown"] = 20,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 51713,
						["order"] = 4,
						["cooldown"] = 60,
						["enabled"] = true,
					}, -- [4]
					{
						["enabled"] = true,
						["order"] = 5,
						["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
						["name"] = "Shadowstep",
					}, -- [5]
					{
						["enabled"] = true,
						["order"] = 6,
						["icon"] = "Interface\\Icons\\Ability_Kick",
						["name"] = "Kick",
					}, -- [6]
					{
						["ID"] = 51722,
						["cooldown"] = 60,
						["order"] = 50,
					}, -- [7]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [8]
				},
				["Mage"] = {
					{
						["enabled"] = true,
						["name"] = "Blink",
						["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Deep Freeze",
						["icon"] = "Interface\\Icons\\Ability_Mage_DeepFreeze",
						["order"] = 2,
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "Counterspell",
						["icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [4]
				},
				["Druid"] = {
					{
						["ID"] = 50334,
						["cooldown"] = 180,
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 29166,
						["cooldown"] = 180,
						["order"] = 2,
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "Barkskin",
						["order"] = 3,
						["cooldown"] = 60,
						["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [5]
				},
				["Death Knight"] = {
					{
						["enabled"] = true,
						["name"] = "Mind Freeze",
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Death Grip",
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_Strangulate",
						["order"] = 2,
					}, -- [2]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [3]
				},
				["Hunter"] = {
					{
						["ID"] = 53271,
						["cooldown"] = 60,
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 23989,
						["cooldown"] = 180,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 14311,
						["order"] = 3,
						["cooldown"] = 28,
						["enabled"] = true,
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["name"] = "Scatter Shot",
						["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Warlock"] = {
					{
						["ID"] = 48020,
						["cooldown"] = 30,
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfury",
						["name"] = "Shadowfury",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["icon"] = "Interface\\Icons\\Spell_Shadow_MindRot",
						["name"] = "Spell Lock",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Priest"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
						["name"] = "Psychic Scream",
					}, -- [1]
					{
						["ID"] = 47585,
						["order"] = 2,
						["cooldown"] = 90,
						["enabled"] = true,
					}, -- [2]
					{
						["ID"] = 15487,
						["order"] = 3,
						["cooldown"] = 45,
						["enabled"] = true,
					}, -- [3]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 4,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [4]
					{
						["enabled"] = true,
						["order"] = 50,
						["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
						["name"] = "Penance",
					}, -- [5]
					{
						["ID"] = 48158,
						["order"] = 50,
						["cooldown"] = 12,
						["enabled"] = true,
					}, -- [6]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [7]
					{
						["ID"] = 586,
						["order"] = 50,
						["cooldown"] = 24,
						["enabled"] = true,
					}, -- [8]
				},
			},
			["spells"] = {
				["Cloak of Shadows"] = true,
				["Demonic Circle: Teleport"] = true,
				["Mind Freeze"] = true,
				["Fade"] = false,
				["Shadow Dance"] = true,
				["Berserker Rage"] = true,
				["Hammer of Justice"] = true,
				["Silence"] = true,
				["Blind"] = true,
				["PvP Trinket"] = false,
				["Psychic Scream"] = true,
				["Blink"] = true,
				["Pummel"] = true,
				["Counterspell"] = true,
				["Freezing Trap"] = true,
				["Grounding Totem"] = true,
				["Shadowfury"] = true,
				["Readiness"] = true,
				["Master's Call"] = true,
				["Holy Shock"] = true,
				["Dismantle"] = false,
				["Shadowstep"] = true,
				["Deep Freeze"] = true,
				["Hand of Freedom"] = true,
				["Dispersion"] = true,
				["Hex"] = true,
				["Scatter Shot"] = true,
				["Kidney Shot"] = true,
				["Intercept"] = true,
				["Shadow Word: Death"] = false,
				["Penance"] = false,
				["Berserk"] = true,
				["Barkskin"] = true,
				["Spell Reflection"] = true,
				["Bauble of True Blood"] = false,
				["Wind Shear"] = true,
				["Charge"] = true,
				["Kick"] = true,
				["Innervate"] = true,
				["Spell Lock"] = true,
				["Death Grip"] = true,
			},
			["attributes"] = {
				["grow"] = "RIGHT",
				["shadowfury"] = true,
				["readiness"] = true,
				["kidney shot"] = true,
				["shadow dance"] = true,
				["class"] = "Mage",
				["scatter shot"] = true,
				["dismantle"] = false,
				["shadowstep"] = true,
				["spell lock"] = true,
				["bauble of true blood"] = false,
				["hex"] = true,
				["psychic scream"] = true,
				["berserk"] = true,
				["intercept"] = true,
				["deep freeze"] = true,
				["holy shock"] = true,
				["penance"] = false,
				["height"] = 30,
				["innervate"] = true,
				["grounding totem"] = true,
				["hand of freedom"] = true,
				["charge"] = true,
				["shadow word: death"] = false,
				["demonic circle: teleport"] = true,
				["per_row"] = 5,
				["death grip"] = true,
				["unit"] = "arena2",
				["fade"] = false,
				["mind freeze"] = true,
				["hide_ready"] = false,
				["size"] = 29.99999929711365,
				["spacing"] = 1,
				["silence"] = true,
				["mode"] = "ICON",
				["pummel"] = true,
				["master's call"] = true,
				["barkskin"] = true,
				["spell reflection"] = true,
				["blind"] = true,
				["enabled"] = false,
				["berserker rage"] = true,
				["wind shear"] = true,
				["hammer of justice"] = true,
				["width"] = 30,
				["cloak of shadows"] = true,
				["blink"] = true,
				["kick"] = true,
				["pvp trinket"] = false,
				["counterspell"] = true,
				["freezing trap"] = true,
				["dispersion"] = true,
				["cooldown_color"] = "NORMAL",
			},
			["order"] = {
				["Warrior"] = {
					"Spell Reflection", -- [1]
					"Charge", -- [2]
					"Intercept", -- [3]
					"Berserker Rage", -- [4]
					"Pummel", -- [5]
				},
				["Paladin"] = {
					"Holy Shock", -- [1]
					"Hammer of Justice", -- [2]
					"Hand of Freedom", -- [3]
				},
				["Shaman"] = {
					"Hex", -- [1]
					"Grounding Totem", -- [2]
					"Wind Shear", -- [3]
				},
				["Rogue"] = {
					"Kick", -- [1]
					"Shadowstep", -- [2]
					"Shadow Dance", -- [3]
					"Kidney Shot", -- [4]
					"Blind", -- [5]
					"Cloak of Shadows", -- [6]
				},
				["Mage"] = {
					"Blink", -- [1]
					"Deep Freeze", -- [2]
					"Counterspell", -- [3]
				},
				["Druid"] = {
					"Barkskin", -- [1]
					"Innervate", -- [2]
					"Berserk", -- [3]
				},
				["Death Knight"] = {
					"Death Grip", -- [1]
					"Mind Freeze", -- [2]
				},
				["Hunter"] = {
					"Scatter Shot", -- [1]
					"Freezing Trap", -- [2]
					"Readiness", -- [3]
					"Master's Call", -- [4]
				},
				["Priest"] = {
					"Silence", -- [1]
					"Dispersion", -- [2]
					"Psychic Scream", -- [3]
				},
				["Warlock"] = {
					"Spell Lock", -- [1]
					"Shadowfury", -- [2]
					"Demonic Circle: Teleport", -- [3]
				},
			},
		},
		["eBar_bar_3"] = {
			["bar_config"] = {
				["Warrior"] = {
					{
						["enabled"] = true,
						["cooldown"] = 10,
						["name"] = "Pummel",
						["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Spell Reflection",
						["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
					}, -- [2]
					{
						["ID"] = 11578,
						["cooldown"] = 20,
					}, -- [3]
					{
						["ID"] = 20252,
						["cooldown"] = 25,
					}, -- [4]
					{
						["ID"] = 18499,
						["cooldown"] = 25,
					}, -- [5]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [6]
				},
				["Paladin"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
						["name"] = "Hand of Freedom",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
						["name"] = "Hammer of Justice",
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
						["name"] = "Holy Shock",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Shaman"] = {
					{
						["enabled"] = true,
						["name"] = "Wind Shear",
						["icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Grounding Totem",
						["icon"] = "Interface\\Icons\\Spell_Nature_GroundingTotem",
					}, -- [2]
					{
						["ID"] = 51514,
						["cooldown"] = 45,
					}, -- [3]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["cooldown"] = 120,
						["name"] = "Bauble of True Blood",
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [5]
				},
				["Rogue"] = {
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Ability_Kick",
						["name"] = "Kick",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
						["name"] = "Shadowstep",
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 51713,
						["enabled"] = true,
						["cooldown"] = 60,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 8643,
						["cooldown"] = 20,
						["order"] = 4,
					}, -- [4]
					{
						["ID"] = 51722,
						["cooldown"] = 60,
						["order"] = 5,
					}, -- [5]
					{
						["ID"] = 2094,
						["cooldown"] = 120,
						["order"] = 6,
					}, -- [6]
					{
						["ID"] = 31224,
						["cooldown"] = 60,
						["order"] = 7,
					}, -- [7]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [8]
				},
				["Mage"] = {
					{
						["enabled"] = true,
						["name"] = "Counterspell",
						["icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Deep Freeze",
						["icon"] = "Interface\\Icons\\Ability_Mage_DeepFreeze",
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "Blink",
						["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
					}, -- [3]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Druid"] = {
					{
						["enabled"] = true,
						["cooldown"] = 60,
						["name"] = "Barkskin",
						["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
					}, -- [1]
					{
						["ID"] = 29166,
						["cooldown"] = 180,
					}, -- [2]
					{
						["ID"] = 50334,
						["cooldown"] = 180,
					}, -- [3]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["cooldown"] = 120,
						["name"] = "Bauble of True Blood",
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [5]
				},
				["Death Knight"] = {
					{
						["enabled"] = true,
						["name"] = "Mind Freeze",
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Death Grip",
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_Strangulate",
					}, -- [2]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [3]
				},
				["Hunter"] = {
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
						["name"] = "Scatter Shot",
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 14311,
						["enabled"] = true,
						["cooldown"] = 28,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 23989,
						["cooldown"] = 180,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 53271,
						["cooldown"] = 60,
						["order"] = 4,
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Warlock"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Spell_Shadow_MindRot",
						["name"] = "Spell Lock",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfury",
						["name"] = "Shadowfury",
					}, -- [2]
					{
						["ID"] = 48020,
						["cooldown"] = 30,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Priest"] = {
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
						["name"] = "Psychic Scream",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
						["name"] = "Penance",
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 47585,
						["enabled"] = true,
						["cooldown"] = 90,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 586,
						["enabled"] = true,
						["cooldown"] = 24,
						["order"] = 4,
					}, -- [4]
					{
						["ID"] = 15487,
						["enabled"] = true,
						["cooldown"] = 45,
						["order"] = 5,
					}, -- [5]
					{
						["ID"] = 48158,
						["enabled"] = true,
						["cooldown"] = 12,
						["order"] = 6,
					}, -- [6]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [7]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 7,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [8]
				},
			},
			["spells"] = {
				["Cloak of Shadows"] = true,
				["Demonic Circle: Teleport"] = true,
				["Mind Freeze"] = true,
				["Fade"] = true,
				["Shadow Dance"] = true,
				["Berserker Rage"] = true,
				["Hammer of Justice"] = true,
				["Silence"] = true,
				["Blind"] = true,
				["PvP Trinket"] = false,
				["Psychic Scream"] = true,
				["Blink"] = true,
				["Pummel"] = true,
				["Counterspell"] = true,
				["Freezing Trap"] = true,
				["Grounding Totem"] = true,
				["Shadowfury"] = true,
				["Readiness"] = true,
				["Master's Call"] = true,
				["Holy Shock"] = true,
				["Dismantle"] = true,
				["Shadowstep"] = true,
				["Deep Freeze"] = true,
				["Hand of Freedom"] = true,
				["Dispersion"] = true,
				["Hex"] = true,
				["Scatter Shot"] = true,
				["Kidney Shot"] = true,
				["Intercept"] = true,
				["Shadow Word: Death"] = true,
				["Penance"] = true,
				["Berserk"] = true,
				["Barkskin"] = true,
				["Spell Reflection"] = true,
				["Bauble of True Blood"] = true,
				["Wind Shear"] = true,
				["Charge"] = true,
				["Kick"] = true,
				["Innervate"] = true,
				["Spell Lock"] = true,
				["Death Grip"] = true,
			},
			["attributes"] = {
				["grow"] = "RIGHT",
				["shadowfury"] = true,
				["readiness"] = true,
				["kidney shot"] = true,
				["shadow dance"] = true,
				["class"] = "Paladin",
				["scatter shot"] = true,
				["dismantle"] = true,
				["shadowstep"] = true,
				["spell lock"] = true,
				["bauble of true blood"] = true,
				["hex"] = true,
				["psychic scream"] = true,
				["berserk"] = true,
				["intercept"] = true,
				["deep freeze"] = true,
				["holy shock"] = true,
				["penance"] = true,
				["height"] = 30,
				["innervate"] = true,
				["grounding totem"] = true,
				["hand of freedom"] = true,
				["charge"] = true,
				["shadow word: death"] = true,
				["demonic circle: teleport"] = true,
				["per_row"] = 5,
				["death grip"] = true,
				["unit"] = "arena3",
				["fade"] = true,
				["mind freeze"] = true,
				["hide_ready"] = false,
				["size"] = 29.99999929711365,
				["spacing"] = 1,
				["silence"] = true,
				["mode"] = "ICON",
				["pummel"] = true,
				["master's call"] = true,
				["barkskin"] = true,
				["spell reflection"] = true,
				["blind"] = true,
				["enabled"] = false,
				["berserker rage"] = true,
				["wind shear"] = true,
				["hammer of justice"] = true,
				["width"] = 30,
				["cloak of shadows"] = true,
				["blink"] = true,
				["kick"] = true,
				["pvp trinket"] = false,
				["counterspell"] = true,
				["freezing trap"] = true,
				["dispersion"] = true,
				["cooldown_color"] = "NORMAL",
			},
			["order"] = {
				["Warrior"] = {
					"Berserker Rage", -- [1]
					"Intercept", -- [2]
					"Charge", -- [3]
					"Spell Reflection", -- [4]
					"Pummel", -- [5]
				},
				["Paladin"] = {
					"Bauble of True Blood", -- [1]
					"Hand of Freedom", -- [2]
					"Hammer of Justice", -- [3]
					"Holy Shock", -- [4]
				},
				["Shaman"] = {
					"Bauble of True Blood", -- [1]
					"Hex", -- [2]
					"Grounding Totem", -- [3]
					"Wind Shear", -- [4]
				},
				["Rogue"] = {
					"Cloak of Shadows", -- [1]
					"Blind", -- [2]
					"Dismantle", -- [3]
					"Kidney Shot", -- [4]
					"Shadow Dance", -- [5]
					"Shadowstep", -- [6]
					"Kick", -- [7]
				},
				["Mage"] = {
					"Blink", -- [1]
					"Deep Freeze", -- [2]
					"Counterspell", -- [3]
				},
				["Druid"] = {
					"Bauble of True Blood", -- [1]
					"Berserk", -- [2]
					"Innervate", -- [3]
					"Barkskin", -- [4]
				},
				["Death Knight"] = {
					"Death Grip", -- [1]
					"Mind Freeze", -- [2]
				},
				["Hunter"] = {
					"Master's Call", -- [1]
					"Readiness", -- [2]
					"Freezing Trap", -- [3]
					"Scatter Shot", -- [4]
				},
				["Priest"] = {
					"Bauble of True Blood", -- [1]
					"Shadow Word: Death", -- [2]
					"Silence", -- [3]
					"Fade", -- [4]
					"Dispersion", -- [5]
					"Penance", -- [6]
					"Psychic Scream", -- [7]
				},
				["Warlock"] = {
					"Demonic Circle: Teleport", -- [1]
					"Shadowfury", -- [2]
					"Spell Lock", -- [3]
				},
			},
		},
		["eBar_bar_1"] = {
			["bar_config"] = {
				["Warrior"] = {
					{
						["ID"] = 11578,
						["cooldown"] = 20,
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
						["name"] = "Spell Reflection",
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "Pummel",
						["order"] = 3,
						["cooldown"] = 10,
						["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
					}, -- [3]
					{
						["ID"] = 18499,
						["cooldown"] = 25,
						["order"] = 4,
					}, -- [4]
					{
						["ID"] = 20252,
						["cooldown"] = 25,
						["order"] = 5,
					}, -- [5]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [6]
				},
				["Paladin"] = {
					{
						["enabled"] = true,
						["name"] = "Holy Shock",
						["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Hammer of Justice",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
						["order"] = 2,
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "Hand of Freedom",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 4,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Shaman"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [1]
					{
						["ID"] = 51514,
						["cooldown"] = 45,
						["order"] = 2,
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["name"] = "Grounding Totem",
						["icon"] = "Interface\\Icons\\Spell_Nature_GroundingTotem",
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["name"] = "Wind Shear",
						["icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Rogue"] = {
					{
						["enabled"] = true,
						["name"] = "Kick",
						["icon"] = "Interface\\Icons\\Ability_Kick",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Shadowstep",
						["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
					}, -- [2]
					{
						["ID"] = 51713,
						["cooldown"] = 60,
						["enabled"] = true,
					}, -- [3]
					{
						["ID"] = 8643,
						["cooldown"] = 20,
					}, -- [4]
					{
						["ID"] = 51722,
						["cooldown"] = 60,
					}, -- [5]
					{
						["ID"] = 2094,
						["cooldown"] = 120,
					}, -- [6]
					{
						["ID"] = 31224,
						["cooldown"] = 60,
					}, -- [7]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [8]
				},
				["Mage"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
						["name"] = "Counterspell",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Ability_Mage_DeepFreeze",
						["name"] = "Deep Freeze",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
						["name"] = "Blink",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Druid"] = {
					{
						["enabled"] = true,
						["name"] = "Barkskin",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
						["cooldown"] = 60,
					}, -- [1]
					{
						["ID"] = 29166,
						["cooldown"] = 180,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 50334,
						["cooldown"] = 180,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["cooldown"] = 120,
						["name"] = "PvP Trinket",
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 4,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [5]
				},
				["Death Knight"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_MindFreeze",
						["name"] = "Mind Freeze",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Spell_DeathKnight_Strangulate",
						["name"] = "Death Grip",
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [3]
				},
				["Hunter"] = {
					{
						["ID"] = 53271,
						["cooldown"] = 60,
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 23989,
						["cooldown"] = 180,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 14311,
						["order"] = 3,
						["cooldown"] = 28,
						["enabled"] = true,
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["name"] = "Scatter Shot",
						["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [5]
				},
				["Warlock"] = {
					{
						["ID"] = 48020,
						["cooldown"] = 30,
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfury",
						["name"] = "Shadowfury",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["icon"] = "Interface\\Icons\\Spell_Shadow_MindRot",
						["name"] = "Spell Lock",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Priest"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [1]
					{
						["ID"] = 15487,
						["order"] = 2,
						["cooldown"] = 45,
						["enabled"] = true,
					}, -- [2]
					{
						["ID"] = 47585,
						["order"] = 3,
						["cooldown"] = 90,
						["enabled"] = true,
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
						["name"] = "Psychic Scream",
					}, -- [4]
					{
						["ID"] = 48158,
						["enabled"] = true,
						["cooldown"] = 12,
						["order"] = 50,
					}, -- [5]
					{
						["enabled"] = true,
						["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
						["name"] = "Penance",
						["order"] = 50,
					}, -- [6]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 50,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [7]
					{
						["ID"] = 586,
						["enabled"] = true,
						["cooldown"] = 24,
						["order"] = 50,
					}, -- [8]
				},
			},
			["spells"] = {
				["Cloak of Shadows"] = true,
				["Demonic Circle: Teleport"] = true,
				["Mind Freeze"] = true,
				["Fade"] = false,
				["Shadow Dance"] = true,
				["Berserker Rage"] = true,
				["Hammer of Justice"] = true,
				["Silence"] = true,
				["Blind"] = true,
				["PvP Trinket"] = false,
				["Psychic Scream"] = true,
				["Blink"] = true,
				["Pummel"] = true,
				["Counterspell"] = true,
				["Freezing Trap"] = true,
				["Grounding Totem"] = true,
				["Shadowfury"] = true,
				["Readiness"] = true,
				["Master's Call"] = true,
				["Holy Shock"] = true,
				["Dismantle"] = false,
				["Shadowstep"] = true,
				["Deep Freeze"] = true,
				["Hand of Freedom"] = true,
				["Dispersion"] = true,
				["Hex"] = true,
				["Scatter Shot"] = true,
				["Kidney Shot"] = true,
				["Intercept"] = true,
				["Shadow Word: Death"] = false,
				["Penance"] = false,
				["Berserk"] = true,
				["Barkskin"] = true,
				["Spell Reflection"] = true,
				["Bauble of True Blood"] = true,
				["Wind Shear"] = true,
				["Charge"] = true,
				["Kick"] = true,
				["Innervate"] = true,
				["Spell Lock"] = true,
				["Death Grip"] = true,
			},
			["attributes"] = {
				["grow"] = "RIGHT",
				["shadowfury"] = true,
				["readiness"] = true,
				["kidney shot"] = true,
				["shadow dance"] = true,
				["class"] = "Warrior",
				["scatter shot"] = true,
				["dismantle"] = false,
				["shadowstep"] = true,
				["spell lock"] = true,
				["bauble of true blood"] = true,
				["hex"] = true,
				["psychic scream"] = true,
				["berserk"] = true,
				["intercept"] = true,
				["deep freeze"] = true,
				["holy shock"] = true,
				["penance"] = false,
				["height"] = 30,
				["innervate"] = true,
				["grounding totem"] = true,
				["hand of freedom"] = true,
				["charge"] = true,
				["shadow word: death"] = false,
				["demonic circle: teleport"] = true,
				["per_row"] = 5,
				["death grip"] = true,
				["unit"] = "arena1",
				["fade"] = false,
				["mind freeze"] = true,
				["hide_ready"] = false,
				["size"] = 29.99999929711365,
				["spacing"] = 1,
				["silence"] = true,
				["mode"] = "ICON",
				["pummel"] = true,
				["master's call"] = true,
				["barkskin"] = true,
				["spell reflection"] = true,
				["blind"] = true,
				["enabled"] = false,
				["berserker rage"] = true,
				["wind shear"] = true,
				["hammer of justice"] = true,
				["width"] = 30,
				["cloak of shadows"] = true,
				["blink"] = true,
				["kick"] = true,
				["pvp trinket"] = false,
				["counterspell"] = true,
				["freezing trap"] = true,
				["dispersion"] = true,
				["cooldown_color"] = "NORMAL",
			},
			["order"] = {
				["Warrior"] = {
					"Charge", -- [1]
					"Spell Reflection", -- [2]
					"Pummel", -- [3]
					"Berserker Rage", -- [4]
					"Intercept", -- [5]
				},
				["Paladin"] = {
					"Bauble of True Blood", -- [1]
					"Hand of Freedom", -- [2]
					"Hammer of Justice", -- [3]
					"Holy Shock", -- [4]
				},
				["Shaman"] = {
					"Wind Shear", -- [1]
					"Grounding Totem", -- [2]
					"Hex", -- [3]
					"Bauble of True Blood", -- [4]
				},
				["Rogue"] = {
					"Cloak of Shadows", -- [1]
					"Blind", -- [2]
					"Kidney Shot", -- [3]
					"Shadow Dance", -- [4]
					"Shadowstep", -- [5]
					"Kick", -- [6]
				},
				["Mage"] = {
					"Blink", -- [1]
					"Deep Freeze", -- [2]
					"Counterspell", -- [3]
				},
				["Druid"] = {
					"Bauble of True Blood", -- [1]
					"Berserk", -- [2]
					"Innervate", -- [3]
					"Barkskin", -- [4]
				},
				["Death Knight"] = {
					"Death Grip", -- [1]
					"Mind Freeze", -- [2]
				},
				["Hunter"] = {
					"Scatter Shot", -- [1]
					"Freezing Trap", -- [2]
					"Readiness", -- [3]
					"Master's Call", -- [4]
				},
				["Priest"] = {
					"Psychic Scream", -- [1]
					"Dispersion", -- [2]
					"Silence", -- [3]
					"Bauble of True Blood", -- [4]
				},
				["Warlock"] = {
					"Spell Lock", -- [1]
					"Shadowfury", -- [2]
					"Demonic Circle: Teleport", -- [3]
				},
			},
		},
	},
}
