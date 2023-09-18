
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.0.9",
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["HOT"] = 1,
			["AGGRO"] = 1,
			["SHIELD"] = 1,
		},
		["highlightSelection"] = 1,
		["optionsColour"] = {
			["r"] = 0.7,
			["g"] = 0.2,
			["b"] = 0.2,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Wave",
			},
			["Main"] = {
				["enabled"] = true,
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Wave",
			},
			["NameFrame"] = {
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Wave",
			},
		},
		["showAFK"] = 1,
		["ShowTutorials"] = true,
		["buffHelper"] = {
			["enable"] = 1,
			["sort"] = "group",
			["visible"] = 1,
		},
		["focus"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["raid"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["enable"] = 1,
			["class"] = {
				{
					["enable"] = 1,
					["name"] = "WARRIOR",
				}, -- [1]
				{
					["enable"] = 1,
					["name"] = "ROGUE",
				}, -- [2]
				{
					["enable"] = 1,
					["name"] = "HUNTER",
				}, -- [3]
				{
					["enable"] = 1,
					["name"] = "MAGE",
				}, -- [4]
				{
					["enable"] = 1,
					["name"] = "WARLOCK",
				}, -- [5]
				{
					["enable"] = 1,
					["name"] = "PRIEST",
				}, -- [6]
				{
					["enable"] = 1,
					["name"] = "DRUID",
				}, -- [7]
				{
					["enable"] = 1,
					["name"] = "SHAMAN",
				}, -- [8]
				{
					["enable"] = 1,
					["name"] = "PALADIN",
				}, -- [9]
				{
					["enable"] = 1,
					["name"] = "DEATHKNIGHT",
				}, -- [10]
			},
			["group"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				1, -- [5]
				1, -- [6]
				1, -- [7]
				1, -- [8]
				1, -- [9]
			},
			["titles"] = 1,
			["scale"] = 0.8,
			["healerMode"] = {
				["type"] = 1,
			},
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["inside"] = 1,
				["right"] = 1,
				["size"] = 20,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["raidpet"] = {
			["enable"] = 1,
			["hunter"] = 1,
			["warlock"] = 1,
		},
		["colour"] = {
			["class"] = 1,
			["guildList"] = 1,
			["reaction"] = {
				["tapped"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 0.5,
				},
				["enemy"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["neutral"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["unfriendly"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0,
				},
				["friend"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["none"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 1,
				},
			},
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["classic"] = 1,
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["r"] = 0.25,
					["g"] = 0.25,
					["b"] = 0.25,
				},
				["e"] = {
					["a"] = 0,
					["r"] = 0.1,
					["g"] = 0.1,
					["b"] = 0.1,
				},
			},
			["border"] = {
				["a"] = 1,
				["r"] = 0.5,
				["g"] = 0.5,
				["b"] = 0.5,
			},
			["bar"] = {
				["rage"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["healthFull"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["focus"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0.25,
				},
				["energy"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["mana"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 1,
				},
				["healthEmpty"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["runic_power"] = {
					["r"] = 0,
					["g"] = 0.82,
					["b"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 186,
		},
		["combatFlash"] = 1,
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 32,
			},
			["portrait"] = 1,
			["scale"] = 0.99,
			["castBar"] = {
				["enable"] = 1,
				["castTime"] = 1,
			},
			["spacing"] = 75,
			["anchor"] = "TOP",
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["inRaid"] = 1,
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["target"] = {
				["enable"] = 1,
				["large"] = 1,
				["size"] = 66,
			},
			["hitIndicator"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["scale"] = 0.7,
			["healerMode"] = {
				["type"] = 1,
			},
			["level"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["size"] = 18,
				["maxrows"] = 2,
			},
			["portrait3D"] = 1,
			["size"] = {
				["enable"] = 1,
				["width"] = 0,
				["size"] = 20,
			},
		},
		["transparency"] = {
			["frame"] = 1,
			["text"] = 1,
		},
		["focustarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["partypet"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 12,
			},
			["name"] = 1,
			["enable"] = 1,
			["scale"] = 0.7,
			["buffs"] = {
				["enable"] = 1,
				["castable"] = 0,
				["size"] = 12,
				["maxrows"] = 2,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["width"] = 0,
			},
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["frame"] = 1,
			["border"] = 1,
			["class"] = 1,
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 0.9,
			["castBar"] = {
				["enable"] = 1,
			},
			["fullScreen"] = {
				["enable"] = 1,
				["highHP"] = 40,
				["lowHP"] = 30,
			},
			["hitIndicator"] = 1,
			["dockRunes"] = 1,
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["showRunes"] = 1,
			["threatMode"] = "portraitFrame",
			["classIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["wrap"] = 1,
				["flash"] = 1,
				["count"] = 40,
				["size"] = 25,
				["rows"] = 2,
				["hideBlizzard"] = 1,
				["cooldown"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["energyTicker"] = 1,
		},
		["pettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.7,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["bar"] = {
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
			["background"] = 1,
			["fadeTime"] = 0.5,
			["fat"] = 1,
		},
	},
	["savedPositions"] = {
		["Heroes Of Wow"] = {
			["Nevershock"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 732.6506293575067,
					["height"] = 540.0000686607884,
					["left"] = 476.7738620688193,
					["width"] = 700.0001758919799,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 595.4764108953742,
					["left"] = 23.13254870682581,
				},
			},
			["Tonydatiger"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 805.3012529342547,
					["left"] = 0,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
