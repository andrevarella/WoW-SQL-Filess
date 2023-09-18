
ALUF_Database = {
	["ActiveProfile"] = "default",
	["default"] = {
		["CCIndicator"] = {
			["Priorities"] = {
				["offCD"] = 3,
				["usefulDebuffs"] = 1,
				["crowdControl"] = 5,
				["usefulBuffs"] = 2,
				["defCD"] = 8,
				["root"] = 4,
				["silence"] = 6,
				["stun"] = 7,
			},
		},
		["HideBlizzCastBar"] = true,
		["PetFrame"] = {
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameSmall",
				["ColourMode"] = "reaction",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["Aura"] = {
				["Enabled"] = true,
				["LargeIconSize"] = 25,
				["NormalIconSize"] = 21,
				["MaxShownBuffs"] = 40,
				["ShowOnlyPlayerDebuffs"] = false,
				["GrowRTL"] = false,
				["AurasPerRow"] = 7,
				["OnlyShowRaidBuffs"] = false,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -2,
					["Position"] = "BELOW",
				},
				["MaxShownDebuffs"] = 40,
				["OnlyShowDispellableDebuffs"] = false,
				["GrowUpwards"] = false,
				["SpectatorFilter"] = false,
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
				["BarText"] = "%CURR%/%MAX%",
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "none",
			},
			["PowerBar"] = {
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
		},
		["FocusFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["CastBar"] = {
				["Enabled"] = true,
				["Position"] = {
					["XOffset"] = 5,
					["AttachedTo"] = "Aura",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
			},
			["Aura"] = {
				["Enabled"] = true,
				["LargeIconSize"] = 25,
				["NormalIconSize"] = 21,
				["MaxShownBuffs"] = 40,
				["ShowOnlyPlayerDebuffs"] = false,
				["GrowRTL"] = false,
				["AurasPerRow"] = 7,
				["OnlyShowRaidBuffs"] = false,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownDebuffs"] = 40,
				["OnlyShowDispellableDebuffs"] = false,
				["GrowUpwards"] = false,
				["SpectatorFilter"] = false,
			},
			["RaidIcon"] = {
				["Size"] = 16,
			},
			["PowerBar"] = {
			},
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "class",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarText",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_Name",
				["ColourMode"] = "reaction",
			},
			["QuestIcon"] = {
				["Size"] = 32,
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarText",
				["BarText"] = "%CURR%/%MAX%",
			},
			["PvPIcon"] = {
				["Size"] = 48,
			},
			["PetBattleIcon"] = {
				["Size"] = 32,
			},
			["LeaderIcon"] = {
				["Size"] = 16,
			},
			["StatusIcon"] = {
				["Size"] = 16,
			},
			["DRTracker"] = {
				["Enabled"] = true,
				["GrowDirection"] = "LEFT",
				["IconSize"] = 21,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "CastHistory",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownIcons"] = 6,
			},
			["CastHistory"] = {
				["Enabled"] = true,
				["Direction"] = "LEFT",
				["Position"] = {
					["XOffset"] = 28,
					["AttachedTo"] = "CastBar",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxIcons"] = 6,
				["IconDuration"] = 7,
				["Size"] = 21,
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["Icon"] = {
				{
					["FallBackType"] = "racial",
					["Type"] = "trinket",
				}, -- [1]
				{
					["FallBackType"] = "dispel",
					["Type"] = "interrupt",
				}, -- [2]
			},
		},
		["ArenaEnemyFrames"] = {
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameSmall",
				["ColourMode"] = "reaction",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["DRTracker"] = {
				["Enabled"] = true,
				["GrowDirection"] = "RIGHT",
				["IconSize"] = 32,
				["Position"] = {
					["XOffset"] = 5,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -18,
					["Position"] = "RIGHT",
				},
				["MaxShownIcons"] = 6,
			},
			["CastBar"] = {
				["Enabled"] = true,
				["Position"] = {
					["XOffset"] = -32,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -12,
					["Position"] = "LEFT",
				},
			},
			["CastHistory"] = {
				["Enabled"] = true,
				["Direction"] = "LEFT",
				["Position"] = {
					["XOffset"] = 24,
					["AttachedTo"] = "CastBar",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxIcons"] = 3,
				["IconDuration"] = 7,
				["Size"] = 21,
			},
			["Portrait"] = {
				["Type"] = "class",
			},
			["ArenaHeader"] = {
				["Enabled"] = true,
				["SpaceBetweenFrames"] = 42,
				["GrowthDirection"] = "DOWN",
			},
			["Icon"] = {
				{
					["FallBackType"] = "racial",
					["Type"] = "trinket",
				}, -- [1]
				{
					["FallBackType"] = "dispel",
					["Type"] = "interrupt",
				}, -- [2]
				{
					["Type"] = "specialisation",
				}, -- [3]
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
				["BarText"] = "%CURR%/%MAX%",
			},
			["PowerBar"] = {
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "class",
			},
		},
		["FocusTargetFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameVerySmall",
				["ColourMode"] = "reaction",
			},
			["PowerBar"] = {
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["HealthBar"] = {
				["ColourMode"] = "class",
			},
		},
		["PlayerFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["CastBar"] = {
				["Enabled"] = true,
				["Position"] = {
					["XOffset"] = 21,
					["AttachedTo"] = "Aura",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
			},
			["Aura"] = {
				["Enabled"] = true,
				["LargeIconSize"] = 25,
				["NormalIconSize"] = 21,
				["MaxShownBuffs"] = 40,
				["ShowOnlyPlayerDebuffs"] = false,
				["GrowRTL"] = false,
				["AurasPerRow"] = 7,
				["OnlyShowRaidBuffs"] = false,
				["Position"] = {
					["XOffset"] = 32,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownDebuffs"] = 40,
				["OnlyShowDispellableDebuffs"] = false,
				["GrowUpwards"] = false,
				["SpectatorFilter"] = false,
			},
			["PvPIcon"] = {
				["Size"] = 48,
			},
			["PowerBar"] = {
			},
			["RoleIcon"] = {
				["Size"] = 16,
			},
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "class",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarText",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_Name",
				["ColourMode"] = "reaction",
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarText",
				["BarText"] = "%CURR%/%MAX%",
			},
			["MasterLooterIcon"] = {
				["Size"] = 16,
			},
			["LeaderIcon"] = {
				["Size"] = 16,
			},
			["StatusIcon"] = {
				["Size"] = 16,
			},
			["DRTracker"] = {
				["Enabled"] = true,
				["GrowDirection"] = "RIGHT",
				["IconSize"] = 21,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "CastHistory",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownIcons"] = 6,
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["Icon"] = {
				{
					["FallBackType"] = "racial",
					["Type"] = "trinket",
				}, -- [1]
				{
					["FallBackType"] = "dispel",
					["Type"] = "interrupt",
				}, -- [2]
			},
		},
		["TargetFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["CastBar"] = {
				["Enabled"] = true,
				["Position"] = {
					["XOffset"] = 5,
					["AttachedTo"] = "Aura",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
			},
			["Aura"] = {
				["Enabled"] = true,
				["LargeIconSize"] = 25,
				["NormalIconSize"] = 21,
				["MaxShownBuffs"] = 40,
				["ShowOnlyPlayerDebuffs"] = false,
				["GrowRTL"] = false,
				["AurasPerRow"] = 7,
				["OnlyShowRaidBuffs"] = false,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownDebuffs"] = 40,
				["OnlyShowDispellableDebuffs"] = false,
				["GrowUpwards"] = false,
				["SpectatorFilter"] = false,
			},
			["RaidIcon"] = {
				["Size"] = 16,
			},
			["PowerBar"] = {
			},
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "class",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarText",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_Name",
				["ColourMode"] = "reaction",
			},
			["QuestIcon"] = {
				["Size"] = 32,
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarText",
				["BarText"] = "%CURR%/%MAX%",
			},
			["PvPIcon"] = {
				["Size"] = 48,
			},
			["PetBattleIcon"] = {
				["Size"] = 32,
			},
			["LeaderIcon"] = {
				["Size"] = 16,
			},
			["StatusIcon"] = {
				["Size"] = 16,
			},
			["DRTracker"] = {
				["Enabled"] = true,
				["GrowDirection"] = "LEFT",
				["IconSize"] = 21,
				["Position"] = {
					["XOffset"] = 0,
					["AttachedTo"] = "CastHistory",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownIcons"] = 6,
			},
			["CastHistory"] = {
				["Enabled"] = true,
				["Direction"] = "LEFT",
				["Position"] = {
					["XOffset"] = 28,
					["AttachedTo"] = "CastBar",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxIcons"] = 6,
				["IconDuration"] = 7,
				["Size"] = 21,
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["Icon"] = {
				{
					["FallBackType"] = "racial",
					["Type"] = "trinket",
				}, -- [1]
				{
					["FallBackType"] = "dispel",
					["Type"] = "interrupt",
				}, -- [2]
			},
		},
		["FrameMover"] = {
			["ALUF_ArenaEnemyFrames"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "RIGHT",
				["RelativePoint"] = "RIGHT",
				["XOffset"] = -360.0000224310145,
				["YOffset"] = 18.00000068387239,
			},
			["ALUF_FocusFrame"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "TOPLEFT",
				["RelativePoint"] = "TOPLEFT",
				["XOffset"] = 250.0000077961453,
				["YOffset"] = -138.0000045135578,
			},
			["FrameLock"] = false,
			["ALUF_PlayerFrame"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "TOPLEFT",
				["RelativePoint"] = "TOPLEFT",
				["XOffset"] = 19.00000157290651,
				["YOffset"] = -4,
			},
			["ALUF_TargetTargetFrame"] = {
				["RelativeTo"] = "ALUF_TargetFrame",
				["Point"] = "BOTTOMLEFT",
				["RelativePoint"] = "BOTTOMRIGHT",
				["XOffset"] = 5.00000006838724,
				["YOffset"] = 6.999999658063802,
			},
			["ALUF_PetFrame"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "TOPLEFT",
				["RelativePoint"] = "TOPLEFT",
				["XOffset"] = 19.00000157290651,
				["YOffset"] = -224.9999965122508,
			},
			["ALUF_PartyFrames"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "LEFT",
				["RelativePoint"] = "LEFT",
				["XOffset"] = 124.0000051974302,
				["YOffset"] = 18.00000068387239,
			},
			["ALUF_FocusTargetFrame"] = {
				["RelativeTo"] = "ALUF_FocusFrame",
				["Point"] = "BOTTOMLEFT",
				["RelativePoint"] = "BOTTOMRIGHT",
				["XOffset"] = 5.00000006838724,
				["YOffset"] = 6.999999658063802,
			},
			["ALUF_TargetFrame"] = {
				["RelativeTo"] = "UIParent",
				["Point"] = "TOPLEFT",
				["RelativePoint"] = "TOPLEFT",
				["XOffset"] = 250.0000077961453,
				["YOffset"] = -4,
			},
		},
		["Version"] = "3.2.0b",
		["PartyFrames"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["TargetFrame"] = {
				["Position"] = {
					["XOffset"] = -5,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -3,
					["Position"] = "LEFT",
				},
			},
			["CastBar"] = {
				["Enabled"] = true,
				["Position"] = {
					["XOffset"] = 26,
					["AttachedTo"] = "PetFrame",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
			},
			["PartyHeader"] = {
				["Enabled"] = true,
				["SpaceBetweenFrames"] = 50,
				["ShowRaid"] = false,
				["ShowPlayer"] = false,
				["ShowArena"] = true,
				["GrowthDirection"] = "DOWN",
			},
			["Aura"] = {
				["Enabled"] = true,
				["LargeIconSize"] = 21,
				["NormalIconSize"] = 21,
				["MaxShownBuffs"] = 6,
				["ShowOnlyPlayerDebuffs"] = false,
				["GrowRTL"] = false,
				["AurasPerRow"] = 6,
				["OnlyShowRaidBuffs"] = false,
				["Position"] = {
					["XOffset"] = 24,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxShownDebuffs"] = 6,
				["OnlyShowDispellableDebuffs"] = false,
				["GrowUpwards"] = false,
				["SpectatorFilter"] = false,
			},
			["PvPIcon"] = {
				["Size"] = 32,
			},
			["PowerBar"] = {
			},
			["RoleIcon"] = {
				["Size"] = 16,
			},
			["CCIndicator"] = {
				["Enabled"] = true,
			},
			["HealthBar"] = {
				["ShowHealPrediction"] = true,
				["ShowAbsorb"] = true,
				["ColourMode"] = "class",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%CURR%/%MAX%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameSmall",
				["ColourMode"] = "reaction",
			},
			["PowerBarText"] = {
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
				["BarText"] = "%CURR%/%MAX%",
			},
			["MasterLooterIcon"] = {
				["Size"] = 16,
			},
			["LeaderIcon"] = {
				["Size"] = 16,
			},
			["PetFrame"] = {
				["Position"] = {
					["XOffset"] = 5,
					["AttachedTo"] = "UnitFrame",
					["YOffset"] = -5,
					["Position"] = "RIGHT",
				},
			},
			["DRTracker"] = {
				["Enabled"] = true,
				["GrowDirection"] = "LEFT",
				["IconSize"] = 32,
				["Position"] = {
					["XOffset"] = -5,
					["AttachedTo"] = "TargetFrame",
					["YOffset"] = -18,
					["Position"] = "LEFT",
				},
				["MaxShownIcons"] = 6,
			},
			["CastHistory"] = {
				["Enabled"] = true,
				["Direction"] = "RIGHT",
				["Position"] = {
					["XOffset"] = -21,
					["AttachedTo"] = "CastBar",
					["YOffset"] = -5,
					["Position"] = "BELOW",
				},
				["MaxIcons"] = 3,
				["IconDuration"] = 7,
				["Size"] = 21,
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["Icon"] = {
				{
					["FallBackType"] = "racial",
					["Type"] = "trinket",
				}, -- [1]
				{
					["FallBackType"] = "dispel",
					["Type"] = "interrupt",
				}, -- [2]
			},
		},
		["TargetTargetFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameVerySmall",
				["ColourMode"] = "reaction",
			},
			["PowerBar"] = {
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["HealthBar"] = {
				["ColourMode"] = "class",
			},
		},
		["PartyPetFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["HealthBarText"] = {
				["ShowDisconnect"] = true,
				["BarText"] = "%PERCENT_SHORT%%",
				["ShowDeadOrGhost"] = true,
				["FontObject"] = "ArenaLiveFont_StatusBarTextSmall",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameVerySmall",
				["ColourMode"] = "reaction",
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["HealthBar"] = {
				["ColourMode"] = "none",
			},
		},
		["Cooldown"] = {
			["TextSize"] = 24,
			["ShowText"] = true,
			["StaticSize"] = false,
		},
		["PartyTargetFrame"] = {
			["UnitFrame"] = {
				["Enabled"] = true,
				["Scale"] = 1,
				["TooltipMode"] = "Always",
			},
			["Portrait"] = {
				["Type"] = "threeD",
			},
			["NameText"] = {
				["FontObject"] = "ArenaLiveFont_NameVerySmall",
				["ColourMode"] = "reaction",
			},
			["PowerBar"] = {
			},
			["Border"] = {
				["Enabled"] = true,
				["Green"] = 1,
				["Blue"] = 1,
				["Red"] = 1,
			},
			["HealthBar"] = {
				["ColourMode"] = "class",
			},
		},
	},
	["CharacterToProfile"] = {
		["Filovirus-Heroes Of Wow"] = "default",
	},
	["Profiles"] = {
		["default"] = true,
	},
}
