
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.0.9",
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
		},
		["highlightSelection"] = 1,
		["bar"] = {
			["fat"] = 1,
			["background"] = 1,
			["fadeTime"] = 0.5,
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
			["Main"] = {
				["enabled"] = true,
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
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
				["big"] = 1,
				["curable"] = -0,
				["size"] = 29,
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
				["width"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 22,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["big"] = 1,
				["curable"] = -0,
				["size"] = 29,
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
				["width"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["size"] = 22,
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
			["spacing"] = -0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = -0,
				["maxrows"] = 2,
				["right"] = 1,
				["size"] = 20,
				["inside"] = 1,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = -0,
			},
		},
		["raidpet"] = {
			["enable"] = 1,
			["hunter"] = 1,
			["warlock"] = 1,
		},
		["colour"] = {
			["guildList"] = 1,
			["frame"] = {
				["a"] = 1,
				["b"] = -0,
				["g"] = -0,
				["r"] = -0,
			},
			["reaction"] = {
				["tapped"] = {
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["none"] = {
					["b"] = 1,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["neutral"] = {
					["b"] = -0,
					["g"] = 1,
					["r"] = 1,
				},
				["unfriendly"] = {
					["b"] = -0,
					["g"] = 0.5,
					["r"] = 1,
				},
				["friend"] = {
					["b"] = -0,
					["g"] = 1,
					["r"] = -0,
				},
				["enemy"] = {
					["b"] = -0,
					["g"] = -0,
					["r"] = 1,
				},
			},
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["b"] = 0.25,
					["g"] = 0.25,
					["r"] = 0.25,
				},
				["e"] = {
					["a"] = -0,
					["b"] = 0.1,
					["g"] = 0.1,
					["r"] = 0.1,
				},
			},
			["classic"] = 1,
			["class"] = 1,
			["border"] = {
				["a"] = 1,
				["b"] = 0.5,
				["g"] = 0.5,
				["r"] = 0.5,
			},
			["bar"] = {
				["rage"] = {
					["b"] = -0,
					["g"] = -0,
					["r"] = 1,
				},
				["healthFull"] = {
					["b"] = -0,
					["g"] = 1,
					["r"] = -0,
				},
				["focus"] = {
					["b"] = 0.25,
					["g"] = 0.5,
					["r"] = 1,
				},
				["runic_power"] = {
					["b"] = 1,
					["g"] = 0.82,
					["r"] = -0,
				},
				["mana"] = {
					["b"] = 1,
					["g"] = -0,
					["r"] = -0,
				},
				["energy"] = {
					["b"] = -0,
					["g"] = 1,
					["r"] = 1,
				},
				["healthEmpty"] = {
					["b"] = -0,
					["g"] = -0,
					["r"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 197.9346597602996,
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = -0,
			},
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["scale"] = 0.7,
			["portrait3D"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["maxrows"] = 2,
				["size"] = 18,
			},
			["values"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["level"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["enable"] = 1,
				["size"] = 20,
				["width"] = -0,
			},
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 0.92,
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
				["width"] = -0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["showRunes"] = 1,
			["threatMode"] = "portraitFrame",
			["energyTicker"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["wrap"] = 1,
				["flash"] = 1,
				["count"] = 40,
				["maxrows"] = 2,
				["rows"] = 2,
				["hideBlizzard"] = 1,
				["cooldown"] = 1,
				["size"] = 25,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["focustarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = -0,
			},
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = -0,
			},
		},
		["partypet"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = -0,
				["size"] = 12,
			},
			["name"] = 1,
			["scale"] = 0.7,
			["enable"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["maxrows"] = 2,
				["size"] = 12,
				["castable"] = -0,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["width"] = -0,
			},
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["frame"] = 1,
			["border"] = 1,
			["class"] = 1,
		},
		["transparency"] = {
			["text"] = 1,
			["frame"] = 1,
		},
		["pettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = -0,
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
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = -0,
			},
		},
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = -0,
				["size"] = 30,
			},
			["values"] = 1,
			["scale"] = 0.89,
			["castBar"] = {
				["enable"] = 1,
				["castTime"] = 1,
			},
			["spacing"] = 135,
			["anchor"] = "TOP",
			["level"] = 1,
			["size"] = {
				["width"] = 40,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["portrait"] = 1,
			["target"] = {
				["enable"] = 1,
				["size"] = 66,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["inRaid"] = 1,
			["hitIndicator"] = 1,
			["buffs"] = {
				["maxrows"] = 2,
				["castable"] = -0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 2,
				["size"] = 25,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["classIcon"] = 1,
		},
		["combatFlash"] = 1,
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["optionsColour"] = {
			["b"] = 0.2,
			["g"] = 0.2,
			["r"] = 0.7,
		},
	},
	["savedPositions"] = {
		["Heroes Of Wow"] = {
			["Dmg"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 792.5854575792495,
					["left"] = -0,
				},
			},
			["Blackoutz"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 738.2926443435115,
					["height"] = 539.9999333663736,
					["left"] = 399.268275062766,
					["width"] = 699.9999895972819,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 759.5161582273573,
					["left"] = -0,
				},
			},
			["Ihithard"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 748.9290420158205,
					["height"] = 540.0000686607884,
					["left"] = 464.7791298011005,
					["width"] = 700.0001758919799,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 677.9566218275768,
					["left"] = 22.81508091802038,
				},
			},
			["Crine"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 781.3012686611743,
					["left"] = -0,
				},
			},
			["Png"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 792.5854575792495,
					["left"] = -0,
				},
			},
			["Serppentting"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 792.5854575792495,
					["left"] = -0,
				},
			},
			["Faceroller"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 759.5294766054266,
					["left"] = -0,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
