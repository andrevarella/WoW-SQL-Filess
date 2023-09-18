
Grid2DB = {
	["objects"] = {
		["statusMap"] = {
			["warrior"] = {
				["side-bottom"] = {
					["buff-Vigilance"] = 99,
				},
			},
			["account"] = {
				["heals"] = {
					["heals-incoming"] = 99,
				},
				["center-right"] = {
					["debuff-UnchainedMagic"] = 110,
					["debuff-PlagueSickness"] = 110,
				},
				["text-down"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["death"] = 95,
					["offline"] = 93,
					["vehicle"] = 70,
					["role"] = 45,
					["pvp"] = 35,
				},
				["heals-color"] = {
					["heals-incoming"] = 99,
				},
				["alpha"] = {
					["offline"] = 97,
					["range"] = 98,
					["death"] = 99,
				},
				["text-name-color"] = {
					["classcolor"] = 99,
				},
				["center-left"] = {
					["debuff-MysticBuffet"] = 110,
					["debuff-HarvestSoul"] = 110,
					["debuff-BoilingBlood"] = 110,
					["debuff-UnboundPlague"] = 110,
				},
				["border"] = {
					["health-low"] = 69,
					["target"] = 99,
					["lowmana"] = 79,
					["voice"] = 89,
					["pvp"] = 45,
				},
				["health"] = {
					["health-current"] = 99,
				},
				["text-down-color"] = {
					["charmed"] = 65,
					["feign-death"] = 96,
					["death"] = 95,
					["offline"] = 93,
					["vehicle"] = 70,
					["role"] = 45,
					["pvp"] = 35,
				},
				["corner-bottom-left"] = {
					["threat"] = 99,
				},
				["text-name"] = {
					["name"] = 99,
				},
				["health-color"] = {
					["classcolor"] = 99,
					["health-current"] = 85,
				},
				["icon-center"] = {
					["buff-SpiritOfRedemption"] = 160,
					["raid-debuffs"] = 1000,
					["ready-check"] = 150,
					["death"] = 155,
				},
			},
		},
		["locations"] = {
			["warrior"] = {
			},
			["account"] = {
				["center-bottom"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-bottom",
					["x"] = 0,
					["y"] = -4,
					["point"] = "TOP",
				},
				["side-top"] = {
					["y"] = -1,
					["relPoint"] = "TOP",
					["name"] = "side-top",
					["x"] = 0,
					["point"] = "TOP",
				},
				["center-right"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-right",
					["x"] = 4,
					["y"] = 0,
					["point"] = "LEFT",
				},
				["corner-top-right"] = {
					["y"] = -1,
					["relPoint"] = "TOPRIGHT",
					["name"] = "corner-top-right",
					["x"] = -1,
					["point"] = "TOPRIGHT",
				},
				["center-left"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-left",
					["x"] = -4,
					["y"] = 0,
					["point"] = "RIGHT",
				},
				["corner-top-left"] = {
					["y"] = -1,
					["relPoint"] = "TOPLEFT",
					["name"] = "corner-top-left",
					["x"] = 1,
					["point"] = "TOPLEFT",
				},
				["corner-bottom-right"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOMRIGHT",
					["name"] = "corner-bottom-right",
					["x"] = -1,
					["point"] = "BOTTOMRIGHT",
				},
				["side-bottom-right"] = {
					["y"] = 2,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom-right",
					["x"] = 2,
					["point"] = "LEFT",
				},
				["name"] = {
					["y"] = -8,
					["relPoint"] = "TOP",
					["name"] = "name",
					["x"] = 0,
					["point"] = "TOP",
				},
				["center-top"] = {
					["relIndicator"] = "center",
					["relPoint"] = "CENTER",
					["name"] = "center-top",
					["x"] = 0,
					["y"] = 4,
					["point"] = "BOTTOM",
				},
				["center"] = {
					["y"] = 0,
					["relPoint"] = "CENTER",
					["name"] = "center",
					["x"] = 0,
					["point"] = "CENTER",
				},
				["side-bottom-left"] = {
					["y"] = 8,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom-left",
					["x"] = -2,
					["point"] = "RIGHT",
				},
				["corner-bottom-left"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOMLEFT",
					["name"] = "corner-bottom-left",
					["x"] = 1,
					["point"] = "BOTTOMLEFT",
				},
				["side-right"] = {
					["y"] = 0,
					["relPoint"] = "RIGHT",
					["name"] = "side-right",
					["x"] = -2,
					["point"] = "RIGHT",
				},
				["side-left"] = {
					["y"] = 0,
					["relPoint"] = "LEFT",
					["name"] = "side-left",
					["x"] = 2,
					["point"] = "LEFT",
				},
				["side-bottom"] = {
					["y"] = 1,
					["relPoint"] = "BOTTOM",
					["name"] = "side-bottom",
					["x"] = 0,
					["point"] = "BOTTOM",
				},
			},
		},
		["indicators"] = {
			["warrior"] = {
				["corner-bottom-right"] = {
					["location"] = "corner-bottom-right",
					["type"] = "square",
					["level"] = 5,
					["size"] = 5,
				},
			},
			["account"] = {
				["heals"] = {
					["type"] = "bar",
					["location"] = "center",
					["level"] = 1,
					["texture"] = "Gradient",
					["color1"] = {
						["a"] = 0,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["center-right"] = {
					["fontSize"] = 8,
					["location"] = "center-right",
					["level"] = 9,
					["type"] = "icon",
					["size"] = 16,
				},
				["text-down"] = {
					["font"] = "Friz Quadrata TT",
					["fontSize"] = 8,
					["location"] = "center-bottom",
					["level"] = 7,
					["textlength"] = 12,
					["type"] = "text",
				},
				["heals-color"] = {
					["type"] = "bar-color",
				},
				["center-left"] = {
					["fontSize"] = 8,
					["location"] = "center-left",
					["level"] = 9,
					["type"] = "icon",
					["size"] = 16,
				},
				["border"] = {
					["type"] = "border",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["text-name-color"] = {
					["type"] = "text-color",
				},
				["health-color"] = {
					["type"] = "bar-color",
				},
				["text-down-color"] = {
					["type"] = "text-color",
				},
				["health"] = {
					["type"] = "bar",
					["location"] = "center",
					["level"] = 2,
					["texture"] = "Gradient",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["icon-center"] = {
					["fontSize"] = 8,
					["location"] = "center",
					["level"] = 8,
					["type"] = "icon",
					["size"] = 16,
				},
				["corner-bottom-left"] = {
					["type"] = "square",
					["location"] = "corner-bottom-left",
					["level"] = 5,
					["size"] = 5,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["text-name"] = {
					["font"] = "Friz Quadrata TT",
					["fontSize"] = 8,
					["location"] = "name",
					["level"] = 6,
					["textlength"] = 12,
					["type"] = "text",
				},
				["alpha"] = {
					["type"] = "alpha",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["side-bottom"] = {
					["type"] = "square",
					["location"] = "side-bottom",
					["level"] = 5,
					["size"] = 5,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
			},
		},
		["statuses"] = {
			["warrior"] = {
				["buff-Vigilance"] = {
					["spellName"] = 50720,
					["type"] = "buff",
					["mine"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 1,
					},
				},
			},
			["account"] = {
				["debuff-BoilingBlood"] = {
					["type"] = "debuff",
					["spellName"] = 72442,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["debuff-Magic"] = {
					["type"] = "debuffType",
					["subType"] = "Magic",
					["color1"] = {
						["a"] = 1,
						["r"] = 0.2,
						["g"] = 0.6,
						["b"] = 1,
					},
				},
				["role"] = {
					["color2"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 1,
						["b"] = 1,
					},
					["type"] = "role",
					["colorCount"] = 2,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0.5,
					},
				},
				["target"] = {
					["type"] = "target",
					["color1"] = {
						["a"] = 1,
						["r"] = 0.8,
						["g"] = 0.8,
						["b"] = 0.8,
					},
				},
				["buff-Drink"] = {
					["spellName"] = "Drink",
					["type"] = "buff",
					["mine"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.8,
						["g"] = 0.8,
						["b"] = 1,
					},
				},
				["heals-incoming"] = {
					["flags"] = 23,
					["type"] = "heals-incoming",
					["includePlayerHeals"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0,
					},
				},
				["buff-SpiritOfRedemption"] = {
					["spellName"] = 27827,
					["type"] = "buff",
					["blinkThreshold"] = 3,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["threat"] = {
					["color2"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 1,
						["b"] = 1,
					},
					["type"] = "threat",
					["color3"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
					["colorCount"] = 3,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["name"] = {
					["type"] = "name",
				},
				["death"] = {
					["type"] = "death",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["ready-check"] = {
					["threshold"] = 10,
					["type"] = "ready-check",
					["color4"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 1,
					},
					["colorCount"] = 4,
					["color3"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
					["color2"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0,
					},
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
				},
				["pvp"] = {
					["type"] = "pvp",
					["color1"] = {
						["a"] = 0.75,
						["r"] = 0,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["debuff-HarvestSoul"] = {
					["type"] = "debuff",
					["spellName"] = 68980,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["mana"] = {
					["type"] = "mana",
				},
				["range"] = {
					["elapsed"] = 0.1,
					["type"] = "range",
					["default"] = 0.25,
					["range"] = 40,
				},
				["debuff-Disease"] = {
					["type"] = "debuffType",
					["subType"] = "Disease",
					["color1"] = {
						["a"] = 1,
						["r"] = 0.6,
						["g"] = 0.4,
						["b"] = 0,
					},
				},
				["feign-death"] = {
					["type"] = "feign-death",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 1,
					},
				},
				["debuff-UnchainedMagic"] = {
					["type"] = "debuff",
					["spellName"] = 69762,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["classcolor"] = {
					["type"] = "classcolor",
					["colors"] = {
						["UNKNOWN_UNIT"] = {
							["a"] = 1,
							["r"] = 0.5,
							["g"] = 0.5,
							["b"] = 0.5,
						},
						["Humanoid"] = {
							["a"] = 1,
							["r"] = 0.91764705882353,
							["g"] = 0.67450980392157,
							["b"] = 0.84705882352941,
						},
						["PALADIN"] = {
							["a"] = 1,
							["r"] = 0.96,
							["g"] = 0.55,
							["b"] = 0.73,
						},
						["MAGE"] = {
							["a"] = 1,
							["r"] = 0.41,
							["g"] = 0.8,
							["b"] = 0.94,
						},
						["Demon"] = {
							["a"] = 1,
							["r"] = 0.54509803921569,
							["g"] = 0.25490196078431,
							["b"] = 0.68627450980392,
						},
						["DRUID"] = {
							["a"] = 1,
							["r"] = 1,
							["g"] = 0.49,
							["b"] = 0.04,
						},
						["DEATHKNIGHT"] = {
							["a"] = 1,
							["r"] = 0.77,
							["g"] = 0.12,
							["b"] = 0.23,
						},
						["Elemental"] = {
							["a"] = 1,
							["r"] = 0.1,
							["g"] = 0.3,
							["b"] = 0.9,
						},
						["PRIEST"] = {
							["a"] = 1,
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["WARRIOR"] = {
							["a"] = 1,
							["r"] = 0.78,
							["g"] = 0.61,
							["b"] = 0.43,
						},
						["UNKNOWN_PET"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 1,
							["b"] = 0,
						},
						["WARLOCK"] = {
							["a"] = 1,
							["r"] = 0.58,
							["g"] = 0.51,
							["b"] = 0.79,
						},
						["SHAMAN"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0.44,
							["b"] = 0.87,
						},
						["ROGUE"] = {
							["a"] = 1,
							["r"] = 1,
							["g"] = 0.96,
							["b"] = 0.41,
						},
						["HOSTILE"] = {
							["a"] = 1,
							["r"] = 1,
							["g"] = 0.1,
							["b"] = 0.1,
						},
						["Beast"] = {
							["a"] = 1,
							["r"] = 0.93725490196078,
							["g"] = 0.75686274509804,
							["b"] = 0.27843137254902,
						},
						["HUNTER"] = {
							["a"] = 1,
							["r"] = 0.67,
							["g"] = 0.83,
							["b"] = 0.45,
						},
					},
					["colorHostile"] = true,
				},
				["vehicle"] = {
					["type"] = "vehicle",
					["color1"] = {
						["a"] = 0.75,
						["r"] = 0,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["health-current"] = {
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 1,
						["b"] = 0,
					},
					["type"] = "health-current",
				},
				["charmed"] = {
					["type"] = "charmed",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
				},
				["debuff-UnboundPlague"] = {
					["type"] = "debuff",
					["spellName"] = 70911,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["debuff-PlagueSickness"] = {
					["type"] = "debuff",
					["spellName"] = 73117,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["voice"] = {
					["type"] = "voice",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
				},
				["buff-Food"] = {
					["spellName"] = "Food",
					["type"] = "buff",
					["mine"] = true,
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 0.6,
					},
				},
				["debuff-MysticBuffet"] = {
					["type"] = "debuff",
					["spellName"] = 70127,
					["color1"] = {
						["a"] = 1,
						["r"] = 0.5,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["health-low"] = {
					["threshold"] = 0.4,
					["type"] = "health-low",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["health-deficit"] = {
					["threshold"] = 0.2,
					["type"] = "health-deficit",
				},
				["raid-debuffs"] = {
					["type"] = "raid-debuffs",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 0.5,
						["b"] = 1,
					},
				},
				["debuff-Curse"] = {
					["type"] = "debuffType",
					["subType"] = "Curse",
					["color1"] = {
						["a"] = 1,
						["r"] = 0.6,
						["g"] = 0,
						["b"] = 1,
					},
				},
				["offline"] = {
					["type"] = "offline",
					["color1"] = {
						["a"] = 1,
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
				["debuff-Poison"] = {
					["type"] = "debuffType",
					["subType"] = "Poison",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0.6,
						["b"] = 0,
					},
				},
				["lowmana"] = {
					["threshold"] = 0.75,
					["type"] = "lowmana",
					["color1"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 1,
					},
				},
			},
		},
	},
	["profile-current"] = {
		["Nicetry - Heroes Of Wow"] = "account-warrior",
	},
	["profileKeys"] = {
		["Nicetry - Heroes Of Wow"] = "profile",
	},
	["setup-flat"] = {
		["statusMap"] = {
			["account-warrior"] = {
				["heals"] = "account",
				["center-right"] = "account",
				["text-down"] = "account",
				["heals-color"] = "account",
				["icon-center"] = "account",
				["alpha"] = "account",
				["text-name-color"] = "account",
				["health-color"] = "account",
				["text-name"] = "account",
				["health"] = "account",
				["border"] = "account",
				["corner-bottom-left"] = "account",
				["text-down-color"] = "account",
				["center-left"] = "account",
				["side-bottom"] = "warrior",
			},
		},
		["locations"] = {
			["account-warrior"] = {
				["center-bottom"] = "account",
				["side-top"] = "account",
				["corner-bottom-right"] = "account",
				["side-left"] = "account",
				["side-bottom"] = "account",
				["corner-top-right"] = "account",
				["center-right"] = "account",
				["side-bottom-right"] = "account",
				["center"] = "account",
				["center-top"] = "account",
				["name"] = "account",
				["side-bottom-left"] = "account",
				["corner-bottom-left"] = "account",
				["side-right"] = "account",
				["corner-top-left"] = "account",
				["center-left"] = "account",
			},
		},
		["indicators"] = {
			["account-warrior"] = {
				["side-bottom"] = "account",
				["heals"] = "account",
				["center-right"] = "account",
				["text-down"] = "account",
				["heals-color"] = "account",
				["alpha"] = "account",
				["border"] = "account",
				["text-name-color"] = "account",
				["text-name"] = "account",
				["health-color"] = "account",
				["health"] = "account",
				["icon-center"] = "account",
				["corner-bottom-left"] = "account",
				["text-down-color"] = "account",
				["corner-bottom-right"] = "warrior",
				["center-left"] = "account",
			},
		},
		["statuses"] = {
			["account-warrior"] = {
				["debuff-BoilingBlood"] = "account",
				["debuff-Magic"] = "account",
				["role"] = "account",
				["target"] = "account",
				["buff-Drink"] = "account",
				["heals-incoming"] = "account",
				["buff-SpiritOfRedemption"] = "account",
				["threat"] = "account",
				["name"] = "account",
				["death"] = "account",
				["ready-check"] = "account",
				["pvp"] = "account",
				["debuff-HarvestSoul"] = "account",
				["mana"] = "account",
				["voice"] = "account",
				["debuff-Disease"] = "account",
				["feign-death"] = "account",
				["debuff-UnchainedMagic"] = "account",
				["classcolor"] = "account",
				["vehicle"] = "account",
				["health-current"] = "account",
				["charmed"] = "account",
				["debuff-UnboundPlague"] = "account",
				["debuff-PlagueSickness"] = "account",
				["debuff-Poison"] = "account",
				["offline"] = "account",
				["range"] = "account",
				["debuff-MysticBuffet"] = "account",
				["health-low"] = "account",
				["raid-debuffs"] = "account",
				["health-deficit"] = "account",
				["debuff-Curse"] = "account",
				["buff-Food"] = "account",
				["buff-Vigilance"] = "warrior",
				["lowmana"] = "account",
			},
		},
	},
	["namespaces"] = {
		["Grid2_StatusRaidDebuffs"] = {
		},
		["Grid2Layout"] = {
		},
		["GridRange"] = {
		},
		["Grid2Frame"] = {
		},
		["Grid2Blink"] = {
		},
	},
	["versions"] = {
		["warrior"] = {
			["Grid2Options"] = 1,
		},
		["Grid2Options"] = 1,
		["Grid2StatusRaidDebuffsOptions"] = 1,
		["globals"] = {
		},
	},
	["profile-available"] = {
		["Nicetry - Heroes Of Wow"] = {
		},
	},
	["setup-layers"] = {
		["statusMap"] = {
			["warrior"] = {
			},
			["account"] = {
			},
		},
		["locations"] = {
			["warrior"] = {
			},
			["account"] = {
			},
		},
		["indicators"] = {
			["warrior"] = {
			},
			["account"] = {
			},
		},
		["statuses"] = {
			["warrior"] = {
			},
			["account"] = {
			},
		},
	},
}
