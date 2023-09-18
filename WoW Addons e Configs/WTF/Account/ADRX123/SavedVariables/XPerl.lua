
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["Chad WoW"] = {
		["Hybridmind"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["guildList"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
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
						["a"] = 0,
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
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 95,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Veiodalancha"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["gradient"] = {
					["enable"] = 1,
					["s"] = {
						["a"] = 1,
						["b"] = 0.25,
						["g"] = 0.25,
						["r"] = 0.25,
					},
					["e"] = {
						["a"] = 0,
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["class"] = 1,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
				["guildList"] = 1,
				["classic"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["border"] = {
					["a"] = 1,
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["bar"] = {
					["rage"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
				["castBar"] = {
					["enable"] = 1,
				},
				["threatMode"] = "portraitFrame",
				["name"] = 1,
				["hitIndicator"] = 1,
				["happiness"] = {
					["enabled"] = 1,
					["flashWhenSad"] = 1,
					["onlyWhenSad"] = 1,
				},
				["level"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["enable"] = 1,
					["size"] = 20,
					["width"] = 0,
				},
			},
			["tooltip"] = {
				["enable"] = 1,
				["enableBuffs"] = 1,
				["modifier"] = "all",
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["partypet"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 12,
				},
				["name"] = 1,
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Test"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Netherweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Netherweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Netherweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
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
					["enable"] = 1,
					["who"] = 3,
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
			["optionsColour"] = {
				["r"] = 0.7,
				["g"] = 0.2,
				["b"] = 0.2,
			},
			["colour"] = {
				["frame"] = {
					["a"] = 1,
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
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
				["class"] = 1,
				["classic"] = 1,
				["guildList"] = 1,
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
					["healthEmpty"] = {
						["r"] = 1,
						["g"] = 0,
						["b"] = 0,
					},
					["mana"] = {
						["r"] = 0,
						["g"] = 0,
						["b"] = 1,
					},
					["energy"] = {
						["r"] = 1,
						["g"] = 1,
						["b"] = 0,
					},
					["runic_power"] = {
						["r"] = 0,
						["g"] = 0.82,
						["b"] = 1,
					},
				},
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
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
					["size"] = 120,
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
				["castBar"] = {
					["enable"] = 1,
				},
				["happiness"] = {
					["enabled"] = 1,
					["flashWhenSad"] = 1,
					["onlyWhenSad"] = 1,
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
			["transparency"] = {
				["frame"] = 1,
				["text"] = 1,
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
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
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
		["Souremix"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["gradient"] = {
					["enable"] = 1,
					["s"] = {
						["a"] = 1,
						["b"] = 0.25,
						["g"] = 0.25,
						["r"] = 0.25,
					},
					["e"] = {
						["a"] = 0,
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["class"] = 1,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
				["guildList"] = 1,
				["classic"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["border"] = {
					["a"] = 1,
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["bar"] = {
					["rage"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
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
				["castBar"] = {
					["enable"] = 1,
				},
				["threatMode"] = "portraitFrame",
				["name"] = 1,
				["hitIndicator"] = 1,
				["happiness"] = {
					["enabled"] = 1,
					["flashWhenSad"] = 1,
					["onlyWhenSad"] = 1,
				},
				["level"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["enable"] = 1,
					["size"] = 20,
					["width"] = 0,
				},
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Cylline"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Remove Curse",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Remove Curse",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Remove Curse",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["guildList"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
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
						["a"] = 0,
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
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
	},
	["savedPositions"] = {
		["Chad WoW"] = {
			["Hybridmind"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 541.6918890635433,
					["left"] = 135.1012051567074,
				},
			},
			["Veiodalancha"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 615.4666697832843,
					["left"] = 16.00000045725775,
				},
			},
			["Test"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 733.3333764666827,
					["left"] = 0,
				},
			},
			["Souremix"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 733.3333764666827,
					["left"] = 0,
				},
			},
			["Cylline"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 733.3333764666827,
					["left"] = 0,
				},
			},
		},
		["Heroes Of Wow"] = {
			["Nevercleanse"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 734.3641575365713,
					["height"] = 540.0000686607884,
					["left"] = 474.2033947288894,
					["width"] = 700.0001758919799,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 661.0247890951911,
					["left"] = 16.76648107410077,
				},
			},
			["Laasker"] = {
				["XPerl_Player"] = {
					["top"] = 925.7854120212577,
					["left"] = 20.69999964141658,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 657.8447951615003,
					["left"] = 4.600000146362764,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 671.5687314666307,
					["height"] = 540.0000686607884,
					["left"] = 791.9607353296891,
					["width"] = 700.0000358349134,
				},
			},
			["Easyclass"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 805.3012529342547,
					["left"] = 0,
				},
			},
			["Unstopabull"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 733.5074984898388,
					["height"] = 540.0000686607884,
					["left"] = 475.0602638612215,
					["width"] = 700.0001758919799,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 659.8216888440504,
					["left"] = 40.4283558238551,
				},
			},
			["Priestbolado"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 805.3012529342547,
					["left"] = 0,
				},
			},
			["Maedoazde"] = {
				["XPerl_Party_Anchor"] = {
					["top"] = 783.5293816354862,
					["left"] = 0,
				},
			},
			["Reksalz"] = {
				["XPerl_OptionsAnchor"] = {
					["top"] = 535.5959041788091,
					["height"] = 540.0000686607884,
					["left"] = 677.2559587340455,
					["width"] = 700.0000358349134,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.8105913235208,
					["left"] = 57.04000342555457,
				},
			},
		},
	},
	["ConfigVersion"] = "3.0.9",
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["HOT"] = 1,
		},
		["highlightSelection"] = 1,
		["rangeFinder"] = {
			["StatsFrame"] = {
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Touch",
			},
			["Main"] = {
				["enabled"] = true,
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Touch",
			},
			["NameFrame"] = {
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["spell"] = "Healing Touch",
			},
		},
		["bar"] = {
			["fat"] = 1,
			["background"] = 1,
			["fadeTime"] = 0.5,
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
		},
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
				["curable"] = 0,
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
				["maxrows"] = 2,
				["castable"] = 0,
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
				["curable"] = 0,
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
				["maxrows"] = 2,
				["castable"] = 0,
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
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["maxrows"] = 2,
				["right"] = 1,
				["size"] = 20,
				["inside"] = 1,
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
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["b"] = 0.25,
					["g"] = 0.25,
					["r"] = 0.25,
				},
				["e"] = {
					["a"] = 0,
					["b"] = 0.1,
					["g"] = 0.1,
					["r"] = 0.1,
				},
			},
			["class"] = 1,
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
					["b"] = 0,
					["g"] = 1,
					["r"] = 1,
				},
				["unfriendly"] = {
					["b"] = 0,
					["g"] = 0.5,
					["r"] = 1,
				},
				["friend"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 0,
				},
				["enemy"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
			},
			["guildList"] = 1,
			["classic"] = 1,
			["frame"] = {
				["a"] = 1,
				["b"] = 0,
				["g"] = 0,
				["r"] = 0,
			},
			["border"] = {
				["a"] = 1,
				["b"] = 0.5,
				["g"] = 0.5,
				["r"] = 0.5,
			},
			["bar"] = {
				["rage"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["healthFull"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 0,
				},
				["focus"] = {
					["b"] = 0.25,
					["g"] = 0.5,
					["r"] = 1,
				},
				["runic_power"] = {
					["b"] = 1,
					["g"] = 0.82,
					["r"] = 0,
				},
				["mana"] = {
					["b"] = 1,
					["g"] = 0,
					["r"] = 0,
				},
				["healthEmpty"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 1,
				},
				["energy"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 178.8379383437512,
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
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
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
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
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
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["level"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["enable"] = 1,
				["size"] = 20,
				["width"] = 0,
			},
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
				["lowHP"] = 30,
				["highHP"] = 40,
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
		["tooltip"] = {
			["buffModifier"] = "all",
			["modifier"] = "all",
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
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
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
			["scale"] = 0.7,
			["enable"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["maxrows"] = 2,
				["size"] = 12,
				["castable"] = 0,
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
		["transparency"] = {
			["text"] = 1,
			["frame"] = 1,
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
				["maxrows"] = 2,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["size"] = 22,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 32,
			},
			["portrait"] = 1,
			["scale"] = 0.8,
			["castBar"] = {
				["enable"] = 1,
				["castTime"] = 1,
			},
			["spacing"] = 23,
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
			["hitIndicator"] = 1,
			["target"] = {
				["enable"] = 1,
				["size"] = 120,
				["large"] = 1,
			},
			["buffs"] = {
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
				["size"] = 22,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["combatFlash"] = 1,
		["buffs"] = {
			["countdownStart"] = 24,
		},
		["maximumScale"] = 1.5,
		["optionsColour"] = {
			["b"] = 0.2,
			["g"] = 0.2,
			["r"] = 0.7,
		},
	},
	["Heroes Of Wow"] = {
		["Nevercleanse"] = {
			["highlight"] = {
				["enable"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Holy Light",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["width"] = 35,
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
					["castable"] = 0,
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
					["curable"] = 0,
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
					["width"] = 35,
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
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["guildList"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
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
						["a"] = 0,
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
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 35,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 171.3149869444415,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 35,
				},
			},
			["tooltip"] = {
				["enable"] = 1,
				["enableBuffs"] = 1,
				["modifier"] = "all",
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 35,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 35,
				},
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
					["width"] = 35,
				},
			},
			["partypet"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 12,
				},
				["name"] = 1,
				["scale"] = 1.15,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
					["width"] = 35,
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.84,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 110,
				["anchor"] = "TOP",
				["level"] = 1,
				["size"] = {
					["width"] = 35,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 66,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Laasker"] = {
			["highlight"] = {
			},
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
			},
			["ShowTutorials"] = true,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
			["target"] = {
				["debuffs"] = {
					["enable"] = 1,
					["size"] = 29,
					["curable"] = 0,
					["big"] = 1,
				},
				["values"] = 1,
				["combo"] = {
					["blizzard"] = 1,
					["enable"] = 1,
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
					["width"] = 45,
				},
				["threat"] = 1,
				["pvpIcon"] = 1,
				["mobType"] = 1,
				["highlightDebuffs"] = {
					["who"] = 2,
				},
				["raidIconAlternate"] = 1,
				["threatMode"] = "portraitFrame",
				["healerMode"] = {
					["type"] = 1,
				},
				["scale"] = 0.8,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 3,
					["maxrows"] = 2,
				},
				["elite"] = 1,
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
				["scale"] = 0.5,
				["titles"] = 1,
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
			["optionsColour"] = {
				["r"] = 0.7,
				["g"] = 0.2,
				["b"] = 0.2,
			},
			["colour"] = {
				["frame"] = {
					["a"] = 1,
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
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
				["class"] = 1,
				["classbarBright"] = 1.16,
				["gradient"] = {
					["enable"] = 1,
					["s"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
					["e"] = {
						["a"] = 1,
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
					},
				},
				["border"] = {
					["a"] = 1,
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["bar"] = {
					["rage"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0.1568627450980392,
						["g"] = 0.8509803921568627,
						["r"] = 0.06666666666666667,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
				},
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["size"] = 29,
					["curable"] = 0,
					["big"] = 1,
				},
				["values"] = 1,
				["combo"] = {
					["blizzard"] = 1,
					["enable"] = 1,
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
					["width"] = 45,
				},
				["threat"] = 1,
				["pvpIcon"] = 1,
				["mobType"] = 1,
				["highlightDebuffs"] = {
					["who"] = 2,
				},
				["raidIconAlternate"] = 1,
				["threatMode"] = "portraitFrame",
				["healerMode"] = {
					["type"] = 1,
				},
				["scale"] = 0.8,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 3,
					["maxrows"] = 2,
				},
				["elite"] = 1,
				["classIcon"] = 1,
			},
			["targettargettarget"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 29,
				},
				["values"] = 1,
				["pvpIcon"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["mana"] = 1,
				["scale"] = 0.5,
				["level"] = 1,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["maxrows"] = 2,
				},
				["size"] = {
					["width"] = 45,
				},
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 29,
				},
				["values"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["hitIndicator"] = 1,
				["anchor"] = "TOP",
				["size"] = {
					["width"] = 45,
				},
				["inRaid"] = 1,
				["pvpIcon"] = 1,
				["portrait"] = 1,
				["threatMode"] = "nameFrame",
				["name"] = 1,
				["spacing"] = 75,
				["scale"] = 0.92,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 8,
					["maxrows"] = 2,
				},
				["target"] = {
					["enable"] = 1,
					["large"] = 1,
					["size"] = 66,
				},
				["classIcon"] = 1,
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 183.9055326790245,
			},
			["highlightDebuffs"] = {
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["focustarget"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 29,
				},
				["values"] = 1,
				["pvpIcon"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["mana"] = 1,
				["scale"] = 0.4,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["maxrows"] = 2,
				},
				["level"] = 1,
				["enable"] = 1,
				["size"] = {
					["width"] = 45,
				},
			},
			["pet"] = {
				["threat"] = 1,
				["values"] = 1,
				["scale"] = 0.5,
				["healerMode"] = {
					["type"] = 1,
				},
				["debuffs"] = {
					["enable"] = 1,
					["size"] = 20,
				},
				["happiness"] = {
					["enabled"] = 1,
					["flashWhenSad"] = 1,
					["onlyWhenSad"] = 1,
				},
				["threatMode"] = "portraitFrame",
				["name"] = 1,
				["hitIndicator"] = 1,
				["level"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["size"] = 18,
					["maxrows"] = 2,
				},
				["castBar"] = {
					["enable"] = 1,
				},
				["size"] = {
					["enable"] = 1,
					["width"] = 45,
					["size"] = 20,
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
				["scale"] = 0.6800000000000001,
				["buffs"] = {
					["enable"] = 1,
					["castable"] = 0,
					["size"] = 5,
					["maxrows"] = 2,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
			},
			["transparency"] = {
				["frame"] = 1,
				["text"] = 1,
			},
			["player"] = {
				["partyNumber"] = 1,
				["debuffs"] = {
					["enable"] = 1,
					["size"] = 25,
				},
				["values"] = 1,
				["scale"] = 0.9,
				["castBar"] = {
					["enable"] = 1,
				},
				["fullScreen"] = {
					["lowHP"] = 30,
					["highHP"] = 40,
				},
				["hitIndicator"] = 1,
				["dockRunes"] = 1,
				["level"] = 1,
				["size"] = {
					["width"] = 45,
				},
				["threat"] = 1,
				["pvpIcon"] = 1,
				["showRunes"] = 1,
				["threatMode"] = "portraitFrame",
				["classIcon"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["wrap"] = 1,
					["flash"] = 1,
					["count"] = 40,
					["hideBlizzard"] = 1,
					["size"] = 25,
					["rows"] = 2,
					["cooldown"] = 1,
					["maxrows"] = 2,
				},
				["healerMode"] = {
					["type"] = 1,
				},
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
				["healerMode"] = {
					["type"] = 1,
				},
				["mana"] = 1,
				["scale"] = 0.4,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["maxrows"] = 2,
				},
				["level"] = 1,
				["enable"] = 1,
				["size"] = {
					["width"] = 45,
				},
			},
			["tooltip"] = {
				["buffModifier"] = "all",
				["modifier"] = "all",
			},
			["targettarget"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 29,
				},
				["values"] = 1,
				["pvpIcon"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["mana"] = 1,
				["scale"] = 0.5,
				["buffs"] = {
					["size"] = 22,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["maxrows"] = 2,
				},
				["level"] = 1,
				["enable"] = 1,
				["size"] = {
					["width"] = 45,
				},
			},
			["buffs"] = {
				["countdownStart"] = 24,
				["ignoreSeasonal"] = 1,
			},
			["maximumScale"] = 2.75,
			["bar"] = {
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
				["fat"] = 1,
			},
		},
		["Easyclass"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Frostweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Frostweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["item"] = "Heavy Frostweave Bandage",
					["HealthLowPoint"] = 0.85,
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["gradient"] = {
					["enable"] = 1,
					["s"] = {
						["a"] = 1,
						["b"] = 0.25,
						["g"] = 0.25,
						["r"] = 0.25,
					},
					["e"] = {
						["a"] = 0,
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["class"] = 1,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
				["guildList"] = 1,
				["classic"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["border"] = {
					["a"] = 1,
					["b"] = 0.5,
					["g"] = 0.5,
					["r"] = 0.5,
				},
				["bar"] = {
					["rage"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
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
				["castBar"] = {
					["enable"] = 1,
				},
				["threatMode"] = "portraitFrame",
				["name"] = 1,
				["hitIndicator"] = 1,
				["happiness"] = {
					["enabled"] = 1,
					["flashWhenSad"] = 1,
					["onlyWhenSad"] = 1,
				},
				["level"] = 1,
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["enable"] = 1,
					["size"] = 20,
					["width"] = 0,
				},
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Unstopabull"] = {
			["highlight"] = {
				["enable"] = 1,
				["AGGRO"] = 1,
				["HOT"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
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
			["optionsColour"] = {
				["r"] = 0.7,
				["g"] = 0.2,
				["b"] = 0.2,
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
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.95,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
					["size"] = 120,
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
			["transparency"] = {
				["frame"] = 1,
				["text"] = 1,
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
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
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
		["Priestbolado"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Lesser Heal",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
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
			["optionsColour"] = {
				["r"] = 0.7,
				["g"] = 0.2,
				["b"] = 0.2,
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
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 186,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
					["size"] = 120,
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
			["transparency"] = {
				["frame"] = 1,
				["text"] = 1,
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
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
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
		["Maedoazde"] = {
			["highlight"] = {
				["enable"] = 1,
				["HOT"] = 1,
				["AGGRO"] = 1,
				["SHIELD"] = 1,
			},
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
			},
			["showAFK"] = 1,
			["combatFlash"] = 1,
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
					["curable"] = 0,
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
					["maxrows"] = 2,
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
			},
			["colour"] = {
				["guildList"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
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
						["a"] = 0,
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
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 197.2760667029557,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
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
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["size"] = {
					["width"] = 0,
				},
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
			},
			["highlightDebuffs"] = {
				["enable"] = 1,
				["frame"] = 1,
				["border"] = 1,
				["class"] = 1,
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 32,
				},
				["portrait"] = 1,
				["scale"] = 0.8,
				["castBar"] = {
					["enable"] = 1,
					["castTime"] = 1,
				},
				["spacing"] = 23,
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
				["hitIndicator"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 120,
					["large"] = 1,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["percent"] = 1,
				["classIcon"] = 1,
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
		["Reksalz"] = {
			["highlight"] = {
				["enable"] = 1,
				["AGGRO"] = 1,
				["HOT"] = 1,
			},
			["showFD"] = 1,
			["highlightSelection"] = 1,
			["rangeFinder"] = {
				["StatsFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["Main"] = {
					["enabled"] = true,
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
				["NameFrame"] = {
					["FadeAmount"] = 0.5,
					["HealthLowPoint"] = 0.85,
					["spell"] = "Healing Touch",
				},
			},
			["party"] = {
				["debuffs"] = {
					["halfSize"] = 1,
					["below"] = 1,
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 30,
				},
				["portrait"] = 1,
				["scale"] = 0.92,
				["castBar"] = {
					["castTime"] = 1,
				},
				["spacing"] = 140,
				["anchor"] = "TOP",
				["level"] = 1,
				["size"] = {
					["width"] = 24,
				},
				["threat"] = 1,
				["inRaid"] = 1,
				["range30yard"] = 1,
				["hitIndicator"] = 1,
				["threatMode"] = "portraitFrame",
				["name"] = 1,
				["values"] = 1,
				["target"] = {
					["enable"] = 1,
					["size"] = 66,
				},
				["buffs"] = {
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["wrap"] = 1,
					["rows"] = 2,
					["size"] = 22,
				},
				["healerMode"] = {
					["type"] = 1,
				},
				["classIcon"] = 1,
			},
			["buffHelper"] = {
				["enable"] = 1,
				["sort"] = "group",
				["visible"] = 1,
			},
			["focus"] = {
				["debuffs"] = {
					["enable"] = 1,
					["big"] = 1,
					["curable"] = 0,
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
					["width"] = 32,
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
					["castable"] = 0,
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
					["curable"] = 0,
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
					["width"] = 32,
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
					["castable"] = 0,
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
				["spacing"] = 0,
				["anchor"] = "TOP",
				["buffs"] = {
					["castable"] = 0,
					["maxrows"] = 2,
					["right"] = 1,
					["size"] = 20,
					["inside"] = 1,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 0,
				},
			},
			["colour"] = {
				["classic"] = 1,
				["guildList"] = 1,
				["border"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["unfriendly"] = {
						["b"] = 0,
						["g"] = 0.5,
						["r"] = 1,
					},
					["friend"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["enemy"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
				["class"] = 1,
				["classbarBright"] = 1,
				["frame"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["a"] = 0,
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["bar"] = {
					["rage"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
					["healthFull"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 0,
					},
					["focus"] = {
						["b"] = 0.25,
						["g"] = 0.5,
						["r"] = 1,
					},
					["runic_power"] = {
						["b"] = 1,
						["g"] = 0.82,
						["r"] = 0,
					},
					["mana"] = {
						["b"] = 1,
						["g"] = 0,
						["r"] = 0,
					},
					["energy"] = {
						["b"] = 0,
						["g"] = 1,
						["r"] = 1,
					},
					["healthEmpty"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 1,
					},
				},
			},
			["bar"] = {
				["fat"] = 1,
				["background"] = 1,
				["fadeTime"] = 0.5,
				["texture"] = {
					"Perl v2", -- [1]
					"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 32,
				},
			},
			["minimap"] = {
				["enable"] = 1,
				["radius"] = 78,
				["pos"] = 171.7306373033826,
			},
			["tooltip"] = {
				["enable"] = 1,
				["enableBuffs"] = 1,
				["modifier"] = "all",
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 32,
				},
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 32,
				},
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
					["width"] = 32,
				},
			},
			["partypet"] = {
				["debuffs"] = {
					["enable"] = 1,
					["curable"] = 0,
					["size"] = 12,
				},
				["name"] = 1,
				["scale"] = 0.7,
				["enable"] = 1,
				["buffs"] = {
					["enable"] = 1,
					["maxrows"] = 2,
					["size"] = 12,
					["castable"] = 0,
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
			["transparency"] = {
				["text"] = 1,
				["frame"] = 1,
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
					["lowHP"] = 30,
					["highHP"] = 40,
				},
				["hitIndicator"] = 1,
				["dockRunes"] = 1,
				["level"] = 1,
				["size"] = {
					["width"] = 32,
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
					["maxrows"] = 2,
					["castable"] = 0,
					["enable"] = 1,
					["rows"] = 3,
					["wrap"] = 1,
					["size"] = 22,
				},
				["percent"] = 1,
				["size"] = {
					["width"] = 32,
				},
			},
			["raidpet"] = {
				["enable"] = 1,
				["hunter"] = 1,
				["warlock"] = 1,
			},
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
	},
}
XPerlConfigSavePerCharacter = 1
