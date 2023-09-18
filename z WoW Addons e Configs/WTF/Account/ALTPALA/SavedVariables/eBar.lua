
eBarDB = {
	["BarID"] = 5,
	["version"] = 1.1,
	["BarConfig"] = {
		["Warrior"] = {
			{
				["enabled"] = true,
				["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
				["cooldown"] = 10,
				["name"] = "Pummel",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [4]
			{
				["enabled"] = false,
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
				["name"] = "Bauble of True Blood",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [4]
			{
				["enabled"] = false,
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
				["name"] = "Bauble of True Blood",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [4]
		},
		["Druid"] = {
			{
				["enabled"] = true,
				["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
				["cooldown"] = 60,
				["name"] = "Barkskin",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [4]
			{
				["enabled"] = false,
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
				["name"] = "Bauble of True Blood",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [5]
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [4]
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
				["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
				["cooldown"] = 120,
				["name"] = "PvP Trinket",
			}, -- [7]
			{
				["enabled"] = false,
				["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
				["cooldown"] = 120,
				["name"] = "Bauble of True Blood",
			}, -- [8]
		},
	},
	["BarPositions"] = {
		["eBar_bar_4"] = {
			"BOTTOM", -- [1]
			"", -- [2]
			"BOTTOM", -- [3]
			232.0652102418645, -- [4]
			147.3417145542612, -- [5]
		},
		["eBar_bar_2"] = {
			"CENTER", -- [1]
			"", -- [2]
			"CENTER", -- [3]
			228.0953102014408, -- [4]
			-219.7843764017247, -- [5]
		},
	},
	["BARS"] = {
		["eBar_bar_4"] = {
			["bar_config"] = {
				["Warrior"] = {
					{
						["ID"] = 11578,
						["cooldown"] = 20,
						["order"] = 1,
					}, -- [1]
					{
						["ID"] = 20252,
						["cooldown"] = 25,
						["order"] = 2,
					}, -- [2]
					{
						["ID"] = 18499,
						["cooldown"] = 25,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "Pummel",
						["order"] = 5,
						["cooldown"] = 10,
						["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
					}, -- [5]
					{
						["enabled"] = true,
						["order"] = 6,
						["name"] = "Spell Reflection",
						["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
					}, -- [6]
				},
				["Paladin"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["name"] = "Hand of Freedom",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["name"] = "Hammer of Justice",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [4]
					{
						["enabled"] = true,
						["order"] = 5,
						["name"] = "Holy Shock",
						["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
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
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 2,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [2]
					{
						["ID"] = 51514,
						["cooldown"] = 45,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["order"] = 4,
						["name"] = "Grounding Totem",
						["icon"] = "Interface\\Icons\\Spell_Nature_GroundingTotem",
					}, -- [4]
					{
						["enabled"] = true,
						["order"] = 5,
						["name"] = "Wind Shear",
						["icon"] = "Interface\\Icons\\Spell_Nature_Cyclone",
					}, -- [5]
				},
				["Rogue"] = {
					{
						["enabled"] = true,
						["name"] = "Kick",
						["icon"] = "Interface\\Icons\\Ability_Kick",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Shadowstep",
						["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
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
						["order"] = 8,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [8]
				},
				["Mage"] = {
					{
						["enabled"] = true,
						["name"] = "Counterspell",
						["icon"] = "Interface\\Icons\\Spell_Frost_IceShock",
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
						["name"] = "Blink",
						["icon"] = "Interface\\Icons\\Spell_Arcane_Blink",
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Druid"] = {
					{
						["enabled"] = true,
						["name"] = "Barkskin",
						["order"] = 1,
						["cooldown"] = 60,
						["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
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
						["name"] = "PvP Trinket",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 5,
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
						["name"] = "PvP Trinket",
						["order"] = 3,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [3]
				},
				["Hunter"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
						["name"] = "Scatter Shot",
					}, -- [1]
					{
						["ID"] = 14311,
						["order"] = 2,
						["cooldown"] = 28,
						["enabled"] = true,
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
						["order"] = 5,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [5]
				},
				["Priest"] = {
					{
						["enabled"] = true,
						["name"] = "Psychic Scream",
						["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
						["order"] = 1,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Penance",
						["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
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
						["name"] = "PvP Trinket",
						["order"] = 7,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [7]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 8,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [8]
				},
				["Warlock"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["name"] = "Spell Lock",
						["icon"] = "Interface\\Icons\\Spell_Shadow_MindRot",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["name"] = "Shadowfury",
						["icon"] = "Interface\\Icons\\Spell_Shadow_Shadowfury",
					}, -- [2]
					{
						["ID"] = 48020,
						["cooldown"] = 30,
						["order"] = 3,
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
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
				["PvP Trinket"] = true,
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
				["class"] = "Druid",
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
				["death grip"] = true,
				["per_row"] = 5,
				["fade"] = true,
				["unit"] = "arena2",
				["mind freeze"] = true,
				["hide_ready"] = false,
				["size"] = 30.00000041032344,
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
				["pvp trinket"] = true,
				["counterspell"] = true,
				["freezing trap"] = true,
				["dispersion"] = true,
				["cooldown_color"] = "NORMAL",
			},
			["order"] = {
				["Warrior"] = {
					"Spell Reflection", -- [1]
					"Pummel", -- [2]
					"PvP Trinket", -- [3]
					"Berserker Rage", -- [4]
					"Intercept", -- [5]
					"Charge", -- [6]
				},
				["Paladin"] = {
					"Holy Shock", -- [1]
					"PvP Trinket", -- [2]
					"Hammer of Justice", -- [3]
					"Hand of Freedom", -- [4]
					"Bauble of True Blood", -- [5]
				},
				["Shaman"] = {
					"Wind Shear", -- [1]
					"Grounding Totem", -- [2]
					"Hex", -- [3]
					"PvP Trinket", -- [4]
					"Bauble of True Blood", -- [5]
				},
				["Rogue"] = {
					"PvP Trinket", -- [1]
					"Cloak of Shadows", -- [2]
					"Blind", -- [3]
					"Dismantle", -- [4]
					"Kidney Shot", -- [5]
					"Shadow Dance", -- [6]
					"Shadowstep", -- [7]
					"Kick", -- [8]
				},
				["Mage"] = {
					"PvP Trinket", -- [1]
					"Blink", -- [2]
					"Deep Freeze", -- [3]
					"Counterspell", -- [4]
				},
				["Druid"] = {
					"Barkskin", -- [1]
					"Innervate", -- [2]
					"Berserk", -- [3]
					"PvP Trinket", -- [4]
					"Bauble of True Blood", -- [5]
				},
				["Death Knight"] = {
					"PvP Trinket", -- [1]
					"Death Grip", -- [2]
					"Mind Freeze", -- [3]
				},
				["Hunter"] = {
					"PvP Trinket", -- [1]
					"Master's Call", -- [2]
					"Readiness", -- [3]
					"Freezing Trap", -- [4]
					"Scatter Shot", -- [5]
				},
				["Warlock"] = {
					"PvP Trinket", -- [1]
					"Demonic Circle: Teleport", -- [2]
					"Shadowfury", -- [3]
					"Spell Lock", -- [4]
				},
				["Priest"] = {
					"Bauble of True Blood", -- [1]
					"PvP Trinket", -- [2]
					"Shadow Word: Death", -- [3]
					"Silence", -- [4]
					"Fade", -- [5]
					"Dispersion", -- [6]
					"Penance", -- [7]
					"Psychic Scream", -- [8]
				},
			},
		},
		["eBar_bar_2"] = {
			["bar_config"] = {
				["Warrior"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldReflection",
						["name"] = "Spell Reflection",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "Pummel",
						["order"] = 2,
						["icon"] = "Interface\\Icons\\INV_Gauntlets_04",
						["cooldown"] = 10,
					}, -- [2]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 3,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
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
						["ID"] = 11578,
						["cooldown"] = 20,
						["order"] = 6,
					}, -- [6]
				},
				["Paladin"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["name"] = "Hand of Freedom",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfValor",
					}, -- [2]
					{
						["enabled"] = true,
						["order"] = 3,
						["name"] = "Hammer of Justice",
						["icon"] = "Interface\\Icons\\Spell_Holy_SealOfMight",
					}, -- [3]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [4]
					{
						["enabled"] = true,
						["order"] = 5,
						["name"] = "Holy Shock",
						["icon"] = "Interface\\Icons\\Spell_Holy_SearingLight",
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
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 5,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [5]
				},
				["Rogue"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Ability_Kick",
						["name"] = "Kick",
					}, -- [1]
					{
						["enabled"] = true,
						["order"] = 2,
						["icon"] = "Interface\\Icons\\Ability_Rogue_Shadowstep",
						["name"] = "Shadowstep",
					}, -- [2]
					{
						["ID"] = 51713,
						["order"] = 3,
						["cooldown"] = 60,
						["enabled"] = true,
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
						["order"] = 8,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
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
						["order"] = 4,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [4]
				},
				["Druid"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
						["cooldown"] = 120,
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 2,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [2]
					{
						["ID"] = 50334,
						["cooldown"] = 180,
						["order"] = 3,
					}, -- [3]
					{
						["ID"] = 29166,
						["cooldown"] = 180,
						["order"] = 4,
					}, -- [4]
					{
						["enabled"] = true,
						["name"] = "Barkskin",
						["order"] = 5,
						["icon"] = "Interface\\Icons\\Spell_Nature_StoneClawTotem",
						["cooldown"] = 60,
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
						["order"] = 3,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [3]
				},
				["Hunter"] = {
					{
						["enabled"] = true,
						["order"] = 1,
						["icon"] = "Interface\\Icons\\Ability_GolemStormBolt",
						["name"] = "Scatter Shot",
					}, -- [1]
					{
						["ID"] = 14311,
						["order"] = 2,
						["cooldown"] = 28,
						["enabled"] = true,
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
						["order"] = 5,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [5]
				},
				["Priest"] = {
					{
						["enabled"] = false,
						["name"] = "Bauble of True Blood",
						["order"] = 1,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\inv_jewelcrafting_gem_28",
					}, -- [1]
					{
						["enabled"] = true,
						["name"] = "PvP Trinket",
						["order"] = 2,
						["cooldown"] = 120,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
					}, -- [2]
					{
						["ID"] = 48158,
						["order"] = 3,
						["cooldown"] = 12,
						["enabled"] = true,
					}, -- [3]
					{
						["ID"] = 15487,
						["order"] = 4,
						["cooldown"] = 45,
						["enabled"] = true,
					}, -- [4]
					{
						["ID"] = 586,
						["order"] = 5,
						["cooldown"] = 24,
						["enabled"] = true,
					}, -- [5]
					{
						["ID"] = 47585,
						["order"] = 6,
						["cooldown"] = 90,
						["enabled"] = true,
					}, -- [6]
					{
						["enabled"] = true,
						["order"] = 7,
						["icon"] = "Interface\\Icons\\Spell_Holy_Penance",
						["name"] = "Penance",
					}, -- [7]
					{
						["enabled"] = true,
						["order"] = 8,
						["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
						["name"] = "Psychic Scream",
					}, -- [8]
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
						["order"] = 4,
						["icon"] = "Interface\\Icons\\INV_Jewelry_TrinketPVP_02",
						["cooldown"] = 120,
					}, -- [4]
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
				["PvP Trinket"] = true,
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
				["class"] = "Warrior",
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
				["death grip"] = true,
				["per_row"] = 5,
				["fade"] = true,
				["unit"] = "arena1",
				["mind freeze"] = true,
				["hide_ready"] = false,
				["size"] = 30.00000041032344,
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
				["pvp trinket"] = true,
				["counterspell"] = true,
				["freezing trap"] = true,
				["dispersion"] = true,
				["cooldown_color"] = "NORMAL",
			},
			["order"] = {
				["Warrior"] = {
					"Spell Reflection", -- [1]
					"Pummel", -- [2]
					"PvP Trinket", -- [3]
					"Berserker Rage", -- [4]
					"Intercept", -- [5]
					"Charge", -- [6]
				},
				["Paladin"] = {
					"Holy Shock", -- [1]
					"PvP Trinket", -- [2]
					"Hammer of Justice", -- [3]
					"Hand of Freedom", -- [4]
					"Bauble of True Blood", -- [5]
				},
				["Shaman"] = {
					"Bauble of True Blood", -- [1]
					"PvP Trinket", -- [2]
					"Hex", -- [3]
					"Grounding Totem", -- [4]
					"Wind Shear", -- [5]
				},
				["Rogue"] = {
					"PvP Trinket", -- [1]
					"Cloak of Shadows", -- [2]
					"Blind", -- [3]
					"Dismantle", -- [4]
					"Kidney Shot", -- [5]
					"Shadow Dance", -- [6]
					"Shadowstep", -- [7]
					"Kick", -- [8]
				},
				["Mage"] = {
					"PvP Trinket", -- [1]
					"Blink", -- [2]
					"Deep Freeze", -- [3]
					"Counterspell", -- [4]
				},
				["Druid"] = {
					"Barkskin", -- [1]
					"Innervate", -- [2]
					"Berserk", -- [3]
					"PvP Trinket", -- [4]
					"Bauble of True Blood", -- [5]
				},
				["Death Knight"] = {
					"PvP Trinket", -- [1]
					"Death Grip", -- [2]
					"Mind Freeze", -- [3]
				},
				["Hunter"] = {
					"PvP Trinket", -- [1]
					"Master's Call", -- [2]
					"Readiness", -- [3]
					"Freezing Trap", -- [4]
					"Scatter Shot", -- [5]
				},
				["Warlock"] = {
					"PvP Trinket", -- [1]
					"Demonic Circle: Teleport", -- [2]
					"Shadowfury", -- [3]
					"Spell Lock", -- [4]
				},
				["Priest"] = {
					"Psychic Scream", -- [1]
					"Penance", -- [2]
					"Dispersion", -- [3]
					"Fade", -- [4]
					"Silence", -- [5]
					"Shadow Word: Death", -- [6]
					"PvP Trinket", -- [7]
					"Bauble of True Blood", -- [8]
				},
			},
		},
	},
}
