local E, L, V, P, G = unpack(ElvUI);
local NP = E:GetModule("NamePlates");
local ACD = LibStub("AceConfigDialog-3.0-ElvUI");

local next, ipairs, pairs, type, tonumber = next, ipairs, pairs, type, tonumber
local tremove, tinsert, tsort, tconcat = table.remove, table.insert, table.sort, table.concat
local format, match, gsub, strsplit = string.format, string.match, string.gsub, strsplit

local GetSpellInfo = GetSpellInfo
local DUNGEON_DIFFICULTY, PLAYER_DIFFICULTY1, PLAYER_DIFFICULTY2 = DUNGEON_DIFFICULTY, PLAYER_DIFFICULTY1, PLAYER_DIFFICULTY2
local FACTION_STANDING_LABEL2, FACTION_STANDING_LABEL4, FACTION_STANDING_LABEL5 = FACTION_STANDING_LABEL2, FACTION_STANDING_LABEL4, FACTION_STANDING_LABEL5
local SPEED, DISABLE, HEALTH, LEVEL, NONE, COMBAT, FILTERS = SPEED, DISABLE, HEALTH, LEVEL, NONE, COMBAT, FILTERS
local ARENA, RAID, PARTY, BATTLEFIELDS = ARENA, RAID, PARTY, BATTLEFIELDS
local BLOCK, ENEMY, ROLE, TANK, NAME, HEALER, DAMAGER, COLOR = BLOCK, ENEMY, ROLE, TANK, NAME, HEALER, DAMAGER, COLOR

local selectedNameplateFilter

local carryFilterFrom, carryFilterTo
local function filterValue(value)
	return gsub(value,"([%(%)%.%%%+%-%*%?%[%^%$])","%%%1")
end

local function filterMatch(s,v)
	local m1, m2, m3, m4 = "^"..v.."$", "^"..v..",", ","..v.."$", ","..v..","
	return (match(s, m1) and m1) or (match(s, m2) and m2) or (match(s, m3) and m3) or (match(s, m4) and v..",")
end

local function filterPriority(auraType, unit, value, remove, movehere)
	if not auraType or not value then return end
	local filter = E.db.nameplates.units[unit] and E.db.nameplates.units[unit][auraType] and E.db.nameplates.units[unit][auraType].filters and E.db.nameplates.units[unit][auraType].filters.priority
	if not filter then return end
	local found = filterMatch(filter, filterValue(value))
	if found and movehere then
		local tbl, sv, sm = {strsplit(",",filter)}
		for i in ipairs(tbl) do
			if tbl[i] == value then sv = i elseif tbl[i] == movehere then sm = i end
			if sv and sm then break end
		end
		tremove(tbl, sm);tinsert(tbl, sv, movehere);
		E.db.nameplates.units[unit][auraType].filters.priority = tconcat(tbl,",")
	elseif found and remove then
		E.db.nameplates.units[unit][auraType].filters.priority = gsub(filter, found, "")
	elseif not found and not remove then
		E.db.nameplates.units[unit][auraType].filters.priority = (filter == "" and value) or (filter..","..value)
	end
end

local function UpdateInstanceDifficulty()
	if (E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.party) then
		E.Options.args.nameplate.args.filters.args.triggers.args.instanceType.args.dungeonDifficulty = {
			order = 10,
			type = "group",
			name = DUNGEON_DIFFICULTY,
			desc = L["Check these to only have the filter active in certain difficulties. If none are checked, it is active in all difficulties."],
			guiInline = true,
			get = function(info) return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceDifficulty.dungeon[info[#info]] end,
			set = function(info, value)
				E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceDifficulty.dungeon[info[#info]] = value
				UpdateInstanceDifficulty()
				NP:ConfigureAll()
			end,
			args = {
				normal = {
					order = 1,
					type = "toggle",
					name = PLAYER_DIFFICULTY1
				},
				heroic = {
					order = 2,
					type = "toggle",
					name = PLAYER_DIFFICULTY2
				},
			}
		}
	else
		E.Options.args.nameplate.args.filters.args.triggers.args.instanceType.args.dungeonDifficulty = nil
	end

	if (E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.raid) then
		E.Options.args.nameplate.args.filters.args.triggers.args.instanceType.args.raidDifficulty = {
			order = 11,
			type = "group",
			name = L["Raid Difficulty"],
			desc = L["Check these to only have the filter active in certain difficulties. If none are checked, it is active in all difficulties."],
			guiInline = true,
			get = function(info) return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceDifficulty.raid[info[#info]] end,
			set = function(info, value)
				E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceDifficulty.raid[info[#info]] = value
				UpdateInstanceDifficulty()
				NP:ConfigureAll()
			end,
			args = {
				normal = {
					order = 1,
					type = "toggle",
					name = PLAYER_DIFFICULTY1
				},
				heroic = {
					order = 2,
					type = "toggle",
					name = PLAYER_DIFFICULTY2
				},
			}
		}
	else
		E.Options.args.nameplate.args.filters.args.triggers.args.instanceType.args.raidDifficulty = nil
	end
end

local function UpdateStyleLists()
	if E.global.nameplates.filters[selectedNameplateFilter] and E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.names then
		E.Options.args.nameplate.args.filters.args.triggers.args.names.args.names = {
			order = 50,
			type = "group",
			name = "",
			guiInline = true,
			args = {},
		}
		if next(E.global.nameplates.filters[selectedNameplateFilter].triggers.names) then
			for name, _ in pairs(E.global.nameplates.filters[selectedNameplateFilter].triggers.names) do
				E.Options.args.nameplate.args.filters.args.triggers.args.names.args.names.args[name] = {
					name = name,
					type = "toggle",
					order = -1,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.names and E.global.nameplates.filters[selectedNameplateFilter].triggers.names[name]
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.names[name] = value
						NP:ConfigureAll()
					end,
				}
			end
		end
	end
	if E.global.nameplates.filters[selectedNameplateFilter] and E.global.nameplates.filters[selectedNameplateFilter].triggers.casting and E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells then
		E.Options.args.nameplate.args.filters.args.triggers.args.casting.args.spells = {
			order = 50,
			type = "group",
			name = "",
			guiInline = true,
			args = {},
		}
		if next(E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells) then
			local spell, spellName, notDisabled
			for name, _ in pairs(E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells) do
				spell = name
				if tonumber(spell) then
					spellName = GetSpellInfo(spell)
					notDisabled = (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable)
					if spellName then
						if notDisabled then
							spell = format("|cFFffff00%s|r |cFFffffff(%d)|r", spellName, spell)
						else
							spell = format("%s (%d)", spellName, spell)
						end
					end
				end
				E.Options.args.nameplate.args.filters.args.triggers.args.casting.args.spells.args[name] = {
					name = spell,
					type = "toggle",
					order = -1,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells and E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells[name]
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells[name] = value
						NP:ConfigureAll()
					end,
				}
			end
		end
	end

	if E.global.nameplates.filters[selectedNameplateFilter] and E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns and E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names then
		E.Options.args.nameplate.args.filters.args.triggers.args.cooldowns.args.names = {
			order = 50,
			type = "group",
			name = "",
			guiInline = true,
			args = {},
		}
		if next(E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names) then
			local spell, spellName, notDisabled
			for name, _ in pairs(E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names) do
				spell = name
				if tonumber(spell) then
					spellName = GetSpellInfo(spell)
					notDisabled = (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable)
					if spellName then
						if notDisabled then
							spell = format("|cFFffff00%s|r |cFFffffff(%d)|r", spellName, spell)
						else
							spell = format("%s (%d)", spellName, spell)
						end
					end
				end
				E.Options.args.nameplate.args.filters.args.triggers.args.cooldowns.args.names.args[name] = {
					name = spell,
					type = "select",
					values = {
						["DISABLED"] = DISABLE,
						["ONCD"] = L["On Cooldown"],
						["OFFCD"] = L["Off Cooldown"],
					},
					order = -1,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names and E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names[name]
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names[name] = value
						NP:ConfigureAll()
					end,
				}
			end
		end
	end

	if E.global.nameplates.filters[selectedNameplateFilter] and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names then
		E.Options.args.nameplate.args.filters.args.triggers.args.buffs.args.names = {
			order = 50,
			type = "group",
			name = "",
			guiInline = true,
			args = {},
		}
		if next(E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names) then
			local spell, spellName, notDisabled
			for name, _ in pairs(E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names) do
				spell = name
				if tonumber(spell) then
					spellName = GetSpellInfo(spell)
					notDisabled = (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable)
					if spellName then
						if notDisabled then
							spell = format("|cFFffff00%s|r |cFFffffff(%d)|r", spellName, spell)
						else
							spell = format("%s (%d)", spellName, spell)
						end
					end
				end
				E.Options.args.nameplate.args.filters.args.triggers.args.buffs.args.names.args[name] = {
					textWidth = true,
					name = spell,
					type = "toggle",
					order = -1,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names[name]
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names[name] = value
						NP:ConfigureAll()
					end,
				}
			end
		end
	end

	if E.global.nameplates.filters[selectedNameplateFilter] and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names then
		E.Options.args.nameplate.args.filters.args.triggers.args.debuffs.args.names = {
			order = 50,
			type = "group",
			name = "",
			guiInline = true,
			args = {},
		}
		if next(E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names) then
			local spell, spellName, notDisabled
			for name, _ in pairs(E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names) do
				spell = name
				if tonumber(spell) then
					spellName = GetSpellInfo(spell)
					notDisabled = (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable)
					if spellName then
						if notDisabled then
							spell = format("|cFFffff00%s|r |cFFffffff(%d)|r", spellName, spell)
						else
							spell = format("%s (%d)", spellName, spell)
						end
					end
				end
				E.Options.args.nameplate.args.filters.args.triggers.args.debuffs.args.names.args[name] = {
					textWidth = true,
					name = spell,
					type = "toggle",
					order = -1,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names[name]
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names[name] = value
						NP:ConfigureAll()
					end,
				}
			end
		end
	end
end

local function UpdateFilterGroup()
	if not selectedNameplateFilter or not E.global.nameplates.filters[selectedNameplateFilter] then
		E.Options.args.nameplate.args.filters.args.header = nil
		E.Options.args.nameplate.args.filters.args.actions = nil
		E.Options.args.nameplate.args.filters.args.triggers = nil
	end
	if selectedNameplateFilter and E.global.nameplates.filters[selectedNameplateFilter] then
		E.Options.args.nameplate.args.filters.args.header = {
			order = 4,
			type = "header",
			name = selectedNameplateFilter,
		}
		E.Options.args.nameplate.args.filters.args.triggers = {
			order = 5,
			type = "group",
			name = L["Triggers"],
			args = {
				enable = {
					order = 0,
					type = "toggle",
					name = L["Enable"],
					get = function(info)
						return (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable)
					end,
					set = function(info, value)
						if not E.db.nameplates then E.db.nameplates = {} end
						if not E.db.nameplates.filters then E.db.nameplates.filters = {} end
						if not E.db.nameplates.filters[selectedNameplateFilter] then E.db.nameplates.filters[selectedNameplateFilter] = {} end
						if not E.db.nameplates.filters[selectedNameplateFilter].triggers then E.db.nameplates.filters[selectedNameplateFilter].triggers = {} end
						E.db.nameplates.filters[selectedNameplateFilter].triggers.enable = value
						UpdateStyleLists() --we need this to recolor the spellid based on wether or not the filter is disabled
						NP:ConfigureAll()
					end,
				},
				priority = {
					order = 1,
					type = "range",
					name = L["Filter Priority"],
					desc = L["Lower numbers mean a higher priority. Filters are processed in order from 1 to 100."],
					min = 1, max = 100, step = 1,
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].triggers.priority or 1
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].triggers.priority = value
						NP:ConfigureAll()
					end,
				},
				resetFilter = {
					order = 2,
					type = "execute",
					name = L["Clear Filter"],
					desc = L["Return filter to its default state."],
					func = function()
						local filter = {}
						if G.nameplates.filters[selectedNameplateFilter] then
							filter = E:CopyTable(filter, G.nameplates.filters[selectedNameplateFilter])
						end
						NP:StyleFilterInitializeFilter(filter)
						E.global.nameplates.filters[selectedNameplateFilter] = filter
						UpdateStyleLists()
						UpdateInstanceDifficulty()
						NP:ConfigureAll()
					end,
				},
				spacer1 = {
					order = 3,
					type = "description",
					name = "",
				},
				names = {
					name = NAME,
					order = 4,
					type = "group",
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						addName = {
							order = 1,
							type = "input",
							name = L["Add Name"],
							desc = L["Add a Name to the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.names[value] = true
								UpdateFilterGroup()
								NP:ConfigureAll()
							end,
						},
						removeName = {
							order = 2,
							type = "input",
							name = L["Remove Name"],
							desc = L["Remove a Name from the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.names[value] = nil
								UpdateFilterGroup()
								NP:ConfigureAll()
							end,
						}
					},
				},
				targeting = {
					order = 5,
					type = "group",
					name = L["Targeting"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						isTarget = {
							order = 1,
							type = "toggle",
							name = L["Is Targeted"],
							desc = L["If enabled then the filter will only activate when you are targeting the unit."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.isTarget
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.isTarget = value
								NP:ConfigureAll()
							end,
						},
						notTarget = {
							order = 2,
							type = "toggle",
							name = L["Not Targeted"],
							desc = L["If enabled then the filter will only activate when you are not targeting the unit."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.notTarget
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.notTarget = value
								NP:ConfigureAll()
							end
						}
					}
				},
				casting = {
					order = 6,
					type = "group",
					name = L["Casting"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						interruptible = {
							order = 1,
							type = "toggle",
							name = L["Interruptible"],
							desc = L["If enabled then the filter will only activate if the unit is casting interruptible spells."],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.interruptible
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.interruptible = value
								NP:ConfigureAll()
							end,
						},
						notInterruptible = {
							order = 2,
							type = "toggle",
							name = L["Non-Interruptable"],
							desc = L["If enabled then the filter will only activate if the unit is casting not interruptible spells."],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.notInterruptible
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.notInterruptible = value
								NP:ConfigureAll()
							end,
						},
						spacer2 = {
							order = 3,
							type = "description",
							name = "",
						},
						addSpell = {
							order = 4,
							type = "input",
							name = L["Add Spell ID or Name"],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells[value] = true
								UpdateFilterGroup()
								NP:ConfigureAll()
							end,
						},
						removeSpell = {
							order = 5,
							type = "input",
							name = L["Remove Spell ID or Name"],
							desc = L["If the aura is listed with a number then you need to use that to remove it from the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.casting.spells[value] = nil
								UpdateFilterGroup()
								NP:ConfigureAll()
							end,
						},
						description = {
							order = 6,
							type = "descriptiption",
							name = L["If this list is empty, and if 'Interruptible' is checked, then the filter will activate on any type of cast that can be interrupted."],
						},
					}
				},
				combat = {
					order = 7,
					type = "group",
					name = COMBAT,
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						inCombat = {
							order = 1,
							type = "toggle",
							name = L["Player in Combat"],
							desc = L["If enabled then the filter will only activate when you are in combat."],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.inCombat
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.inCombat = value
								NP:ConfigureAll()
							end,
						},
						outOfCombat = {
							name = L["Player Out of Combat"],
							desc = L["If enabled then the filter will only activate when you are out of combat."],
							order = 2,
							type = "toggle",
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.outOfCombat
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.outOfCombat = value
								NP:ConfigureAll()
							end,
						},
					},
				},
				role = {
					order = 8,
					type = "group",
					name = ROLE,
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						tank = {
							order = 1,
							type = "toggle",
							name = TANK,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.role.tank
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.role.tank = value
								NP:ConfigureAll()
							end,
						},
						healer = {
							order = 2,
							type = "toggle",
							name = HEALER,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.role.healer
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.role.healer = value
								NP:ConfigureAll()
							end,
						},
						damager = {
							order = 3,
							type = "toggle",
							name = DAMAGER,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.role.damager
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.role.damager = value
								NP:ConfigureAll()
							end
						}
					}
				},
				health = {
					order = 9,
					type = "group",
					name = L["Health Threshold"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.healthThreshold
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.healthThreshold = value
								NP:ConfigureAll()
							end,
						},
						usePlayer = {
							order = 2,
							type = "toggle",
							name = L["Player Health"],
							desc = L["Enabling this will check your health amount."],
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.healthThreshold end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.healthUsePlayer
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.healthUsePlayer = value
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 3,
							type = "description",
							name = " ",
						},
						underHealthThreshold = {
							order = 4,
							type = "range",
							name = L["Under Health Threshold"],
							desc = L["If this threshold is used then the health of the unit needs to be lower than this value in order for the filter to activate. Set to 0 to disable."],
							min = 0, max = 1, step = 0.01,
							isPercent = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.healthThreshold end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.underHealthThreshold or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.underHealthThreshold = value
								NP:ConfigureAll()
							end,
						},
						overHealthThreshold = {
							order = 5,
							type = "range",
							name = L["Over Health Threshold"],
							desc = L["If this threshold is used then the health of the unit needs to be higher than this value in order for the filter to activate. Set to 0 to disable."],
							min = 0, max = 1, step = 0.01,
							isPercent = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.healthThreshold end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.overHealthThreshold or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.overHealthThreshold = value
								NP:ConfigureAll()
							end,
						},
					},
				},
				power = {
					order = 10,
					type = "group",
					name = L["Power Threshold"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						powerThreshold = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							desc = L["Enabling this will check your power amount."],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.powerThreshold
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.powerThreshold = value
								NP:ConfigureAll()
							end
						},
						spacer1 = {
							order = 2,
							type = "description",
							name = " "
						},
						underPowerThreshold = {
							order = 3,
							type = "range",
							name = L["Under Power Threshold"],
							desc = L["If this threshold is used then the power of the unit needs to be lower than this value in order for the filter to activate. Set to 0 to disable."],
							min = 0, max = 1, step = 0.01,
							isPercent = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.powerThreshold end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.underPowerThreshold or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.underPowerThreshold = value
								NP:ConfigureAll()
							end
						},
						overPowerThreshold = {
							order = 4,
							type = "range",
							name = L["Over Power Threshold"],
							desc = L["If this threshold is used then the power of the unit needs to be higher than this value in order for the filter to activate. Set to 0 to disable."],
							min = 0, max = 1, step = 0.01,
							isPercent = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.powerThreshold end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.overPowerThreshold or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.overPowerThreshold = value
								NP:ConfigureAll()
							end
						}
					}
				},
				levels = {
					order = 11,
					type = "group",
					name = LEVEL,
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.level
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.level = value
								NP:ConfigureAll()
							end,
						},
						matchLevel = {
							order = 2,
							type = "toggle",
							name = L["Match Player Level"],
							desc = L["If enabled then the filter will only activate if the level of the unit matches your own."],
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].triggers.level end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.mylevel
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.mylevel = value
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 3,
							type = "description",
							name = L["LEVEL_BOSS"],
						},
						minLevel = {
							order = 4,
							type = "range",
							name = L["Minimum Level"],
							desc = L["If enabled then the filter will only activate if the level of the unit is equal to or higher than this value."],
							min = -1, max = MAX_PLAYER_LEVEL+3, step = 1,
							disabled = function() return not (E.global.nameplates.filters[selectedNameplateFilter].triggers.level and not E.global.nameplates.filters[selectedNameplateFilter].triggers.mylevel) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.minlevel or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.minlevel = value
								NP:ConfigureAll()
							end,
						},
						maxLevel = {
							order = 5,
							type = "range",
							name = L["Maximum Level"],
							desc = L["If enabled then the filter will only activate if the level of the unit is equal to or lower than this value."],
							min = -1, max = MAX_PLAYER_LEVEL+3, step = 1,
							disabled = function() return not (E.global.nameplates.filters[selectedNameplateFilter].triggers.level and not E.global.nameplates.filters[selectedNameplateFilter].triggers.mylevel) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.maxlevel or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.maxlevel = value
								NP:ConfigureAll()
							end,
						},
						currentLevel = {
							order = 6,
							type = "range",
							name = L["Current Level"],
							desc = L["If enabled then the filter will only activate if the level of the unit matches this value."],
							min = -1, max = MAX_PLAYER_LEVEL+3, step = 1,
							disabled = function() return not (E.global.nameplates.filters[selectedNameplateFilter].triggers.level and not E.global.nameplates.filters[selectedNameplateFilter].triggers.mylevel) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.curlevel or 0
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.curlevel = value
								NP:ConfigureAll()
							end,
						},
					},
				},
				cooldowns = {
					name = L["Cooldowns"],
					order = 12,
					type = "group",
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						mustHaveAll = {
							order = 1,
							type = "toggle",
							name = L["Require All"],
							desc = L["If enabled then it will require all cooldowns to activate the filter. Otherwise it will only require any one of the cooldowns to activate it."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns and E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.mustHaveAll
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.mustHaveAll = value
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 2,
							type = "description",
							name = " ",
						},
						addCooldown = {
							order = 3,
							type = "input",
							name = L["Add Spell ID or Name"],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names[value] = "ONCD";
								UpdateFilterGroup();
								NP:ConfigureAll()
							end,
						},
						removeCooldown = {
							order = 4,
							type = "input",
							name = L["Remove Spell ID or Name"],
							desc = L["If the aura is listed with a number then you need to use that to remove it from the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.cooldowns.names[value] = nil
								UpdateFilterGroup()
								NP:ConfigureAll()
							end,
						}
					},
				},
				buffs = {
					name = L["Buffs"],
					order = 13,
					type = "group",
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						mustHaveAll = {
							order = 1,
							type = "toggle",
							name = L["Require All"],
							desc = L["If enabled then it will require all auras to activate the filter. Otherwise it will only require any one of the auras to activate it."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.mustHaveAll
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.mustHaveAll = value
								NP:ConfigureAll()
							end,
						},
						missing = {
							order = 2,
							type = "toggle",
							name = L["Missing"],
							desc = L["If enabled then it checks if auras are missing instead of being present on the unit."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.missing
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.missing = value
								NP:ConfigureAll()
							end,
						},
						minTimeLeft = {
							order = 3,
							type = "range",
							name = L["Minimum Time Left"],
							desc = L["Apply this filter if a buff has remaining time greater than this. Set to zero to disable."],
							min = 0, max = 10800, step = 1,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.minTimeLeft
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.minTimeLeft = value
								NP:ConfigureAll()
							end,
						},
						maxTimeLeft = {
							order = 4,
							type = "range",
							name = L["Maximum Time Left"],
							desc = L["Apply this filter if a buff has remaining time less than this. Set to zero to disable."],
							min = 0, max = 10800, step = 1,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.maxTimeLeft
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.maxTimeLeft = value
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 5,
							type = "description",
							name = " ",
						},
						addBuff = {
							order = 6,
							type = "input",
							name = L["Add Spell ID or Name"],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names[value] = true;
								UpdateFilterGroup();
								NP:ConfigureAll()
							end,
						},
						removeBuff = {
							order = 7,
							type = "input",
							name = L["Remove Spell ID or Name"],
							desc = L["If the aura is listed with a number then you need to use that to remove it from the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.buffs.names[value] = nil;
								UpdateFilterGroup();
								NP:ConfigureAll()
							end,
						}
					},
				},
				debuffs = {
					name = L["Debuffs"],
					order = 14,
					type = "group",
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						mustHaveAll = {
							order = 1,
							type = "toggle",
							name = L["Require All"],
							desc = L["If enabled then it will require all auras to activate the filter. Otherwise it will only require any one of the auras to activate it."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.mustHaveAll
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.mustHaveAll = value
								NP:ConfigureAll()
							end,
						},
						missing = {
							order = 2,
							type = "toggle",
							name = L["Missing"],
							desc = L["If enabled then it checks if auras are missing instead of being present on the unit."],
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.missing
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.missing = value
								NP:ConfigureAll()
							end,
						},
						minTimeLeft = {
							order = 3,
							type = "range",
							name = L["Minimum Time Left"],
							desc = L["Apply this filter if a debuff has remaining time greater than this. Set to zero to disable."],
							min = 0, max = 10800, step = 1,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.minTimeLeft
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.minTimeLeft = value
								NP:ConfigureAll()
							end,
						},
						maxTimeLeft = {
							order = 4,
							type = "range",
							name = L["Maximum Time Left"],
							desc = L["Apply this filter if a debuff has remaining time less than this. Set to zero to disable."],
							min = 0, max = 10800, step = 1,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs and E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.maxTimeLeft
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.maxTimeLeft = value
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 5,
							type = "description",
							name = " ",
						},
						addDebuff = {
							order = 6,
							type = "input",
							name = L["Add Spell ID or Name"],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names[value] = true;
								UpdateFilterGroup();
								NP:ConfigureAll()
							end,
						},
						removeDebuff = {
							order = 7,
							type = "input",
							name = L["Remove Spell ID or Name"],
							desc = L["If the aura is listed with a number then you need to use that to remove it from the list."],
							get = function(info) return "" end,
							set = function(info, value)
								if match(value, "^[%s%p]-$") then
									return
								end
								E.global.nameplates.filters[selectedNameplateFilter].triggers.debuffs.names[value] = nil;
								UpdateFilterGroup();
								NP:ConfigureAll()
							end,
						}
					},
				},
				nameplateType = {
					order = 15,
					type = "group",
					name = L["Unit Type"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						enable = {
							order = 0,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType and E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enable
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enable = value
								NP:ConfigureAll()
							end,
						},
						types = {
							order = 1,
							type = "group",
							name = "",
							guiInline = true,
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) or not E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enable end,
							args = {
								friendlyPlayer = {
									order = 1,
									type = "toggle",
									name = L["FRIENDLY_PLAYER"],
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.friendlyPlayer
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.friendlyPlayer = value
										NP:ConfigureAll()
									end,
								},
								friendlyNPC = {
									order = 2,
									type = "toggle",
									name = L["FRIENDLY_NPC"],
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.friendlyNPC
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.friendlyNPC = value
										NP:ConfigureAll()
									end,
								},
								enemyPlayer = {
									order = 3,
									type = "toggle",
									name = L["ENEMY_PLAYER"],
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enemyPlayer
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enemyPlayer = value
										NP:ConfigureAll()
									end,
								},
								enemyNPC = {
									order = 4,
									type = "toggle",
									name = L["ENEMY_NPC"],
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enemyNPC
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.nameplateType.enemyNPC = value
										NP:ConfigureAll()
									end,
								},
							},
						},
					},
				},
				reactionType = {
					name = L["Reaction Type"],
					order = 16,
					type = "group",
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						enable = {
							order = 0,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType and E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.enable
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.enable = value
								NP:ConfigureAll()
							end,
						},
						types = {
							order = 1,
							type = "group",
							name = "",
							guiInline = true,
							disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) or not E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.enable end,
							args = {
								hostile = {
									order = 1,
									type = "toggle",
									name = FACTION_STANDING_LABEL2,
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.hostile
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.hostile = value
										NP:ConfigureAll()
									end,
								},
								neutral = {
									order = 2,
									type = "toggle",
									name = FACTION_STANDING_LABEL4,
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.neutral
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.neutral = value
										NP:ConfigureAll()
									end,
								},
								friendly = {
									order = 3,
									type = "toggle",
									name = FACTION_STANDING_LABEL5,
									get = function(info)
										return E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.friendly
									end,
									set = function(info, value)
										E.global.nameplates.filters[selectedNameplateFilter].triggers.reactionType.friendly = value
										NP:ConfigureAll()
									end,
								},
							},
						},
					},
				},
				instanceType = {
					order = 17,
					type = "group",
					name = L["Instance Type"],
					disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
					args = {
						none = {
							order = 1,
							type = "toggle",
							name = NONE,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.none
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.none = value
								NP:ConfigureAll()
							end,
						},
						party = {
							type = "toggle",
							order = 2,
							name = PARTY,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.party
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.party = value
								UpdateInstanceDifficulty()
								NP:ConfigureAll()
							end,
						},
						raid = {
							order = 3,
							type = "toggle",
							name = RAID,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.raid
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.raid = value
								UpdateInstanceDifficulty()
								NP:ConfigureAll()
							end,
						},
						arena = {
							order = 4,
							type = "toggle",
							name = ARENA,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.arena
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.arena = value
								NP:ConfigureAll()
							end,
						},
						pvp = {
							order = 5,
							type = "toggle",
							name = BATTLEFIELDS,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.pvp
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].triggers.instanceType.pvp = value
								NP:ConfigureAll()
							end,
						},
					}
				},
			},
		}
		E.Options.args.nameplate.args.filters.args.actions = {
			type = "group",
			name = L["Actions"],
			order = 6,
			disabled = function() return not (E.db.nameplates and E.db.nameplates.filters and E.db.nameplates.filters[selectedNameplateFilter] and E.db.nameplates.filters[selectedNameplateFilter].triggers and E.db.nameplates.filters[selectedNameplateFilter].triggers.enable) end,
			args = {
				hide = {
					order = 1,
					type = "toggle",
					name = L["Hide Frame"],
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].actions.hide
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].actions.hide = value
						NP:ConfigureAll()
					end,
				},
				nameOnly = {
					name = L["Name Only"],
					order = 2,
					type = "toggle",
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].actions.nameOnly
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].actions.nameOnly = value
						NP:ConfigureAll()
					end,
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end
				},
				spacer1 = {
					order = 3,
					type = "description",
					name = " ",
				},
				scale = {
					order = 4,
					type = "range",
					name = L["Scale"],
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].actions.scale or 1
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].actions.scale = value
						NP:ConfigureAll()
					end,
					min=0.35, max = 1.5, step = 0.01,
				},
				alpha = {
					order = 5,
					type = "range",
					name = L["Alpha"],
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					get = function(info)
						return E.global.nameplates.filters[selectedNameplateFilter].actions.alpha or -1
					end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].actions.alpha = value
						NP:ConfigureAll()
					end,
					min=-1, max = 100, step = 1,
				},
				frameLevel = {
					order = 6,
					name = L["Frame Level"],
					desc = L["NAMEPLATE_FRAMELEVEL_DESC"],
					type = "range",
					min = 0, max = 10, step = 1,
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					get = function(info) return E.global.nameplates.filters[selectedNameplateFilter].actions.frameLevel or 0 end,
					set = function(info, value)
						E.global.nameplates.filters[selectedNameplateFilter].actions.frameLevel = value
						NP:ConfigureAll()
					end,
				},
				color = {
					order = 10,
					type = "group",
					name = COLOR,
					guiInline = true,
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					args = {
						health = {
							name = HEALTH,
							order = 1,
							type = "toggle",
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.color.health
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.color.health = value
								NP:ConfigureAll()
							end,
						},
						healthColor = {
							order = 2,
							type = "color",
							name = L["Health Color"],
							hasAlpha = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].actions.color.health end,
							get = function(info)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.healthColor
								return t.r, t.g, t.b, t.a, 136/255, 255/255, 102/255, 1
							end,
							set = function(info, r, g, b, a)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.healthColor
								t.r, t.g, t.b, t.a = r, g, b, a
								NP:ConfigureAll()
							end,
						},
						spacer1 = {
							order = 3,
							type = "description",
							name = " ",
						},
						border = {
							order = 4,
							type = "toggle",
							name = L["Border"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.color.border
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.color.border = value
								NP:ConfigureAll()
							end,
						},
						borderColor = {
							order = 5,
							type = "color",
							name = L["Border Color"],
							hasAlpha = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].actions.color.border end,
							get = function(info)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.borderColor
								return t.r, t.g, t.b, t.a, 0, 0, 0, 1
							end,
							set = function(info, r, g, b, a)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.borderColor
								t.r, t.g, t.b, t.a = r, g, b, a
								NP:ConfigureAll()
							end,
						},
						spacer2 = {
							order = 6,
							type = "description",
							name = " ",
						},
						name = {
							order = 7,
							type = "toggle",
							name = NAME,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.color.name
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.color.name = value
								NP:ConfigureAll()
							end,
						},
						nameColor = {
							order = 8,
							type = "color",
							name = L["Name Color"],
							hasAlpha = true,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].actions.color.name end,
							get = function(info)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.nameColor
								return t.r, t.g, t.b, t.a, 200/255, 200/255, 200/255, 1
							end,
							set = function(info, r, g, b, a)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.color.nameColor
								t.r, t.g, t.b, t.a = r, g, b, a
								NP:ConfigureAll()
							end,
						},
					},
				},
				texture = {
					order = 20,
					type = "group",
					name = L["Texture"],
					guiInline = true,
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.texture.enable
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.texture.enable = value
								NP:ConfigureAll()
							end,
						},
						texture = {
							order = 2,
							type = "select",
							dialogControl = "LSM30_Statusbar",
							name = L["Texture"],
							values = AceGUIWidgetLSMlists.statusbar,
							disabled = function() return not E.global.nameplates.filters[selectedNameplateFilter].actions.texture.enable end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.texture.texture
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.texture.texture = value
								NP:ConfigureAll()
							end,
						},
					},
				},
				flashing = {
					order = 30,
					type = "group",
					name = L["Flash"],
					guiInline = true,
					disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.flash.enable
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.flash.enable = value
								NP:ConfigureAll()
							end,
						},
						speed = {
							order = 2,
							type = "range",
							name = SPEED,
							disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
							get = function(info)
								return E.global.nameplates.filters[selectedNameplateFilter].actions.flash.speed or 4
							end,
							set = function(info, value)
								E.global.nameplates.filters[selectedNameplateFilter].actions.flash.speed = value
								NP:ConfigureAll()
							end,
							min=1, max = 10, step = 1,
						},
						color = {
							order = 3,
							type = "color",
							name = COLOR,
							hasAlpha = true,
							disabled = function() return E.global.nameplates.filters[selectedNameplateFilter].actions.hide end,
							get = function(info)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.flash.color
								return t.r, t.g, t.b, t.a, 104/255, 138/255, 217/255, 1
							end,
							set = function(info, r, g, b, a)
								local t = E.global.nameplates.filters[selectedNameplateFilter].actions.flash.color
								t.r, t.g, t.b, t.a = r, g, b, a
								NP:ConfigureAll()
							end,
						},
					},
				},
			},
		}

		UpdateInstanceDifficulty()
		UpdateStyleLists()
	end
end

local ORDER = 100;
local function GetUnitSettings(unit, name)
	local copyValues = {};
	for x, y in pairs(NP.db.units) do
		if(type(y) == "table" and x ~= unit) then
			copyValues[x] = L[x];
		end
	end
	local group = {
		order = ORDER,
		type = "group",
		name = name,
		childGroups = "tab",
		get = function(info) return E.db.nameplates.units[unit][ info[#info] ]; end,
		set = function(info, value) E.db.nameplates.units[unit][ info[#info] ] = value; NP:ConfigureAll(); end,
		args = {
			copySettings = {
				order = -10,
				type = "select",
				name = L["Copy Settings From"],
				desc = L["Copy settings from another unit."],
				values = copyValues,
				get = function() return ""; end,
				set = function(info, value)
					NP:CopySettings(value, unit);
					NP:ConfigureAll();
				end
			},
			defaultSettings = {
				order = -9,
				type = "execute",
				name = L["Default Settings"],
				desc = L["Set Settings to Default"],
				func = function(info, value)
					NP:ResetSettings(unit);
					NP:ConfigureAll();
				end
			},
			healthGroup = {
				order = 1,
				name = HEALTH,
				type = "group",
				get = function(info) return E.db.nameplates.units[unit].healthbar[ info[#info] ]; end,
				set = function(info, value) E.db.nameplates.units[unit].healthbar[ info[#info] ] = value; NP:ConfigureAll(); end,
				args = {
					header = {
						order = 0,
						type = "header",
						name = HEALTH
					},
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"]
					},
					height = {
						order = 2,
						type = "range",
						name = L["Height"],
						min = 4, max = 20, step = 1
					},
					width = {
						order = 3,
						type = "range",
						name = L["Width"],
						min = 50, max = 200, step = 1
					},
					textGroup = {
						order = 100,
						type = "group",
						name = L["Text"],
						guiInline = true,
						get = function(info) return E.db.nameplates.units[unit].healthbar.text[ info[#info] ]; end,
						set = function(info, value) E.db.nameplates.units[unit].healthbar.text[ info[#info] ] = value; NP:ConfigureAll(); end,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"]
							},
							format = {
								order = 2,
								name = L["Format"],
								type = "select",
								values = {
									["CURRENT"] = L["Current"],
									["CURRENT_MAX"] = L["Current / Max"],
									["CURRENT_PERCENT"] = L["Current - Percent"],
									["CURRENT_MAX_PERCENT"] = L["Current - Max | Percent"],
									["PERCENT"] = L["Percent"],
									["DEFICIT"] = L["Deficit"]
								}
							}
						}
					}
				}
			},
			castGroup = {
				order = 3,
				name = L["Cast Bar"],
				type = "group",
				get = function(info) return E.db.nameplates.units[unit].castbar[ info[#info] ]; end,
				set = function(info, value) E.db.nameplates.units[unit].castbar[ info[#info] ] = value; NP:ConfigureAll(); end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Cast Bar"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["Enable"]
					},
					hideSpellName = {
						order = 3,
						type = "toggle",
						name = L["Hide Spell Name"]
					},
					hideTime = {
						order = 4,
						type = "toggle",
						name = L["Hide Time"]
					},
					height = {
						order = 5,
						type = "range",
						name = L["Height"],
						min = 4, max = 20, step = 1
					},
					offset = {
						order = 6,
						type = "range",
						name = L["Offset"],
						min = 0, max = 15, step = 1
					},
					timeToHold = {
						order = 7,
						type = "range",
						name = L["Time To Hold"],
						desc = L["How many seconds the castbar should stay visible after the cast failed or was interrupted."],
						min = 0, max = 4, step = 0.1
					},
					castTimeFormat = {
						order = 8,
						type = "select",
						name = L["Cast Time Format"],
						values = {
							["CURRENT"] = L["Current"],
							["CURRENT_MAX"] = L["Current / Max"],
							["REMAINING"] = L["Remaining"]
						}
					},
					channelTimeFormat = {
						order = 9,
						type = "select",
						name = L["Channel Time Format"],
						values = {
							["CURRENT"] = L["Current"],
							["CURRENT_MAX"] = L["Current / Max"],
							["REMAINING"] = L["Remaining"]
						}
					},
					iconPosition = {
						order = 10,
						type = "select",
						name = L["Icon Position"],
						values = {
							["LEFT"] = L["Left"],
							["RIGHT"] = L["Right"]
						}
					}
				}
			},
			buffsGroup = {
				order = 4,
				name = L["Buffs"],
				type = "group",
				get = function(info) return E.db.nameplates.units[unit].buffs.filters[ info[#info] ] end,
				set = function(info, value) E.db.nameplates.units[unit].buffs.filters[ info[#info] ] = value; NP:ConfigureAll() end,
				disabled = function() return not E.db.nameplates.units[unit].healthbar.enable end,
				args = {
					header = {
						order = 0,
						type = "header",
						name = L["Buffs"],
					},
					enable = {
						order = 1,
						name = L["Enable"],
						type = "toggle",
						get = function(info) return E.db.nameplates.units[unit].buffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].buffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					numAuras = {
						order = 2,
						name = L["# Displayed Auras"],
						desc = L["Controls how many auras are displayed, this will also affect the size of the auras."],
						type = "range",
						min = 1, max = 8, step = 1,
						get = function(info) return E.db.nameplates.units[unit].buffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].buffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					baseHeight = {
						order = 3,
						name = L["Icon Base Height"],
						desc = L["Base Height for the Aura Icon"],
						type = "range",
						min = 6, max = 60, step = 1,
						get = function(info) return E.db.nameplates.units[unit].buffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].buffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					filtersGroup = {
						order = 4,
						type = "range",
						name = L["Icon Width Override"],
						desc = L["If not set to 0 then set the width of the Aura Icon to this"],
						min = 0, max = 60, step = 1,
						get = function(info) return E.db.nameplates.units[unit].buffs[ info[#info]] end,
						set = function(info, value) E.db.nameplates.units[unit].buffs[ info[#info] ] = value NP:ConfigureAll() end
					},
					filtersGroup = {
						order = 5,
						type = "group",
						name = FILTERS,
						guiInline = true,
						args = {
							minDuration = {
								order = 1,
								type = "range",
								name = L["Minimum Duration"],
								desc = L["Don't display auras that are shorter than this duration (in seconds). Set to zero to disable."],
								min = 0, max = 10800, step = 1,
							},
							maxDuration = {
								order = 2,
								type = "range",
								name = L["Maximum Duration"],
								desc = L["Don't display auras that are longer than this duration (in seconds). Set to zero to disable."],
								min = 0, max = 10800, step = 1,
							},
							jumpToFilter = {
								order = 3,
								name = L["Filters Page"],
								desc = L["Shortcut to global filters."],
								type = "execute",
								func = function() ACD:SelectGroup("ElvUI", "filters") end,
							},
							spacer1 = {
								order = 4,
								type = "description",
								name = " ",
							},
							specialFilters = {
								order = 5,
								type = "select",
								sortByValue = true,
								name = L["Add Special Filter"],
								desc = L["These filters don't use a list of spells like the regular filters. Instead they use the WoW API and some code logic to determine if an aura should be allowed or blocked."],
								values = function()
									local filters = {}
									local list = E.global.nameplates["specialFilters"]
									if not list then return end
									for filter in pairs(list) do
										filters[filter] = L[filter]
									end
									return filters
								end,
								set = function(info, value)
									filterPriority("buffs", unit, value)
									NP:ConfigureAll()
								end
							},
							filter = {
								order = 6,
								type = "select",
								name = L["Add Regular Filter"],
								desc = L["These filters use a list of spells to determine if an aura should be allowed or blocked. The content of these filters can be modified in the 'Filters' section of the config."],
								values = function()
									local filters = {}
									local list = E.global.unitframe["aurafilters"]
									if not list then return end
									for filter in pairs(list) do
										filters[filter] = filter
									end
									return filters
								end,
								set = function(info, value)
									filterPriority("buffs", unit, value)
									NP:ConfigureAll()
								end
							},
							resetPriority = {
								order = 7,
								name = L["Reset Priority"],
								desc = L["Reset filter priority to the default state."],
								type = "execute",
								func = function()
									E.db.nameplates.units[unit].buffs.filters.priority = P.nameplates.units[unit].buffs.filters.priority
									NP:ConfigureAll()
								end,
							},
							filterPriority = {
								order = 8,
								type = "multiselect",
								name = L["Filter Priority"],
								dragdrop = true,
								dragOnLeave = function() end, --keep this here
								dragOnEnter = function(info)
									carryFilterTo = info.obj.value
								end,
								dragOnMouseDown = function(info)
									carryFilterFrom, carryFilterTo = info.obj.value, nil
								end,
								dragOnMouseUp = function(info)
									filterPriority("buffs", unit, carryFilterTo, nil, carryFilterFrom) --add it in the new spot
									carryFilterFrom, carryFilterTo = nil, nil
								end,
								dragOnClick = function(info)
									filterPriority("buffs", unit, carryFilterFrom, true)
								end,
								stateSwitchGetText = function(_, TEXT)
									local text = TEXT
									local SF, localized = E.global.unitframe["specialFilters"][text], L[text]
									local blockText = SF and localized and text:match("^block") and localized:gsub("^%[.-]%s?", "")
									local filterText = (blockText and format("|cFF999999%s|r %s", BLOCK, blockText)) or localized or text
									return filterText
								end,
								values = function()
									local str = E.db.nameplates.units[unit].buffs.filters.priority
									if str == "" then return nil end
									return {strsplit(",",str)}
								end,
								get = function(_, value)
									local str = E.db.nameplates.units[unit].buffs.filters.priority
									if str == "" then return nil end
									local tbl = {strsplit(",",str)}
									return tbl[value]
								end,
								set = function()
									NP:ConfigureAll()
								end
							},
							spacer3 = {
								order = 9,
								type = "description",
								name = L["Use drag and drop to rearrange filter priority or right click to remove a filter."],
							}
						}
					}
				}
			},
			debuffsGroup = {
				order = 5,
				name = L["Debuffs"],
				type = "group",
				get = function(info) return E.db.nameplates.units[unit].debuffs.filters[ info[#info] ] end,
				set = function(info, value) E.db.nameplates.units[unit].debuffs.filters[ info[#info] ] = value; NP:ConfigureAll() end,
				disabled = function() return not E.db.nameplates.units[unit].healthbar.enable end,
				args = {
					header = {
						order = 0,
						type = "header",
						name = L["Debuffs"],
					},
					enable = {
						order = 1,
						name = L["Enable"],
						type = "toggle",
						get = function(info) return E.db.nameplates.units[unit].debuffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].debuffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					numAuras = {
						order = 2,
						name = L["# Displayed Auras"],
						desc = L["Controls how many auras are displayed, this will also affect the size of the auras."],
						type = "range",
						min = 1, max = 8, step = 1,
						get = function(info) return E.db.nameplates.units[unit].debuffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].debuffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					baseHeight = {
						order = 3,
						name = L["Icon Base Height"],
						desc = L["Base Height for the Aura Icon"],
						type = "range",
						min = 6, max = 60, step = 1,
						get = function(info) return E.db.nameplates.units[unit].debuffs[ info[#info] ] end,
						set = function(info, value) E.db.nameplates.units[unit].debuffs[ info[#info] ] = value; NP:ConfigureAll() end,
					},
					widthOverride = {
						order = 4,
						type = "range",
						name = L["Icon Width Override"],
						desc = L["If not set to 0 then set the width of the Aura Icon to this"],
						min = 0, max = 60, step = 1,
						get = function(info) return E.db.nameplates.units[unit].debuffs[ info[#info]] end,
						set = function(info, value) E.db.nameplates.units[unit].debuffs[ info[#info] ] = value NP:ConfigureAll() end
					},
					filtersGroup = {
						order = 5,
						type = "group",
						name = FILTERS,
						guiInline = true,
						args = {
							minDuration = {
								order = 1,
								type = "range",
								name = L["Minimum Duration"],
								desc = L["Don't display auras that are shorter than this duration (in seconds). Set to zero to disable."],
								min = 0, max = 10800, step = 1,
							},
							maxDuration = {
								order = 2,
								type = "range",
								name = L["Maximum Duration"],
								desc = L["Don't display auras that are longer than this duration (in seconds). Set to zero to disable."],
								min = 0, max = 10800, step = 1,
							},
							jumpToFilter = {
								order = 3,
								name = L["Filters Page"],
								desc = L["Shortcut to global filters."],
								type = "execute",
								func = function() ACD:SelectGroup("ElvUI", "filters") end,
							},
							spacer1 = {
								order = 4,
								type = "description",
								name = " ",
							},
							specialFilters = {
								order = 5,
								type = "select",
								sortByValue = true,
								name = L["Add Special Filter"],
								desc = L["These filters don't use a list of spells like the regular filters. Instead they use the WoW API and some code logic to determine if an aura should be allowed or blocked."],
								values = function()
									local filters = {}
									local list = E.global.nameplates["specialFilters"]
									if not list then return end
									for filter in pairs(list) do
										filters[filter] = L[filter]
									end
									return filters
								end,
								set = function(info, value)
									filterPriority("debuffs", unit, value)
									NP:ConfigureAll()
								end
							},
							filter = {
								order = 6,
								type = "select",
								name = L["Add Regular Filter"],
								desc = L["These filters use a list of spells to determine if an aura should be allowed or blocked. The content of these filters can be modified in the 'Filters' section of the config."],
								values = function()
									local filters = {}
									local list = E.global.unitframe["aurafilters"]
									if not list then return end
									for filter in pairs(list) do
										filters[filter] = filter
									end
									return filters
								end,
								set = function(info, value)
									filterPriority("debuffs", unit, value)
									NP:ConfigureAll()
								end
							},
							resetPriority = {
								order = 7,
								name = L["Reset Priority"],
								desc = L["Reset filter priority to the default state."],
								type = "execute",
								func = function()
									E.db.nameplates.units[unit].debuffs.filters.priority = P.nameplates.units[unit].debuffs.filters.priority
									NP:ConfigureAll()
								end,
							},
							filterPriority = {
								order = 8,
								type = "multiselect",
								name = L["Filter Priority"],
								dragdrop = true,
								dragOnLeave = function() end, --keep this here
								dragOnEnter = function(info)
									carryFilterTo = info.obj.value
								end,
								dragOnMouseDown = function(info)
									carryFilterFrom, carryFilterTo = info.obj.value, nil
								end,
								dragOnMouseUp = function(info)
									filterPriority("debuffs", unit, carryFilterTo, nil, carryFilterFrom) --add it in the new spot
									carryFilterFrom, carryFilterTo = nil, nil
								end,
								dragOnClick = function(info)
									filterPriority("debuffs", unit, carryFilterFrom, true)
								end,
								stateSwitchGetText = function(_, TEXT)
									local text = TEXT
									local SF, localized = E.global.unitframe["specialFilters"][text], L[text]
									local blockText = SF and localized and text:match("^block") and localized:gsub("^%[.-]%s?", "")
									local filterText = (blockText and format("|cFF999999%s|r %s", BLOCK, blockText)) or localized or text
									return filterText
								end,
								values = function()
									local str = E.db.nameplates.units[unit].debuffs.filters.priority
									if str == "" then return nil end
									return {strsplit(",",str)}
								end,
								get = function(info, value)
									local str = E.db.nameplates.units[unit].debuffs.filters.priority
									if str == "" then return nil end
									local tbl = {strsplit(",",str)}
									return tbl[value]
								end,
								set = function(info)
									NP:ConfigureAll()
								end
							},
							spacer3 = {
								order = 9,
								type = "description",
								name = L["Use drag and drop to rearrange filter priority or right click to remove a filter."],
							},
						},
					},
				},
			},
			levelGroup = {
				order = 6,
				name = LEVEL,
				type = "group",
				args = {
					header = {
						order = 0,
						type = "header",
						name = LEVEL
					},
					enable = {
						order = 1,
						name = L["Enable"],
						type = "toggle",
						get = function(info) return E.db.nameplates.units[unit].showLevel; end,
						set = function(info, value) E.db.nameplates.units[unit].showLevel = value; NP:ConfigureAll(); end
					}
				}
			},
			nameGroup = {
				order = 7,
				name = NAME,
				type = "group",
				get = function(info) return E.db.nameplates.units[unit].name[ info[#info] ]; end,
				set = function(info, value) E.db.nameplates.units[unit].name[ info[#info] ] = value; NP:ConfigureAll(); end,
				args = {
					header = {
						order = 0,
						type = "header",
						name = NAME
					},
					enable = {
						order = 1,
						name = L["Enable"],
						type = "toggle",
						get = function(info) return E.db.nameplates.units[unit].showName; end,
						set = function(info, value) E.db.nameplates.units[unit].showName = value; NP:ConfigureAll(); end
					}
				}
			}
		}
	};

	if(unit == "FRIENDLY_PLAYER" or unit == "ENEMY_PLAYER") then
		if unit == "ENEMY_PLAYER" then
			group.args.markHealers = {
				order = 1,
				type = "toggle",
				name = L["Healer Icon"],
				desc = L["Display a healer icon over known healers inside battlegrounds or arenas."],
				set = function(info, value) E.db.nameplates.units.ENEMY_PLAYER[ info[#info] ] = value NP:PLAYER_ENTERING_WORLD() NP:ConfigureAll() end
			}
		end
		group.args.healthGroup.args.useClassColor = {
			order = 4,
			type = "toggle",
			name = L["Use Class Color"]
		};
		group.args.nameGroup.args.useClassColor = {
			order = 3,
			type = "toggle",
			name = L["Use Class Color"]
		};
	elseif(unit == "ENEMY_NPC" or unit == "FRIENDLY_NPC") then
		group.args.eliteIcon = {
			order = 10,
			name = L["Elite Icon"],
			type = "group",
			get = function(info) return E.db.nameplates.units[unit].eliteIcon[ info[#info] ]; end,
			set = function(info, value) E.db.nameplates.units[unit].eliteIcon[ info[#info] ] = value; NP:ConfigureAll(); end,
			args = {
				header = {
					order = 0,
					type = "header",
					name = L["Elite Icon"]
				},
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"]
				},
				position = {
					order = 2,
					type = "select",
					name = L["Position"],
					values = {
						["LEFT"] = L["Left"],
						["RIGHT"] = L["Right"],
						["TOP"] = L["Top"],
						["BOTTOM"] = L["Bottom"],
						["CENTER"] = L["Center"]
					}
				},
				size = {
					order = 3,
					type = "range",
					name = L["Size"],
					min = 12, max = 42, step = 1
				},
				xOffset = {
					order = 4,
					type = "range",
					name = L["X-Offset"],
					min = -100, max = 100, step = 1
				},
				yOffset = {
					order = 5,
					type = "range",
					name = L["Y-Offset"],
					min = -100, max = 100, step = 1
				}
			}
		};
	end

	ORDER = ORDER + 100;
	return group;
end

E.Options.args.nameplate = {
	type = "group",
	name = L["NamePlates"],
	childGroups = "tree",
	get = function(info) return E.db.nameplates[ info[#info] ] end,
	set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:ConfigureAll(); end,
	args = {
		enable = {
			order = 1,
			type = "toggle",
			name = L["Enable"],
			get = function(info) return E.private.nameplates[ info[#info] ] end,
			set = function(info, value) E.private.nameplates[ info[#info] ] = value E:StaticPopup_Show("PRIVATE_RL") end
		},
		intro = {
			order = 2,
			type = "description",
			name = L["NAMEPLATE_DESC"]
		},
		header = {
			order = 3,
			type = "header",
			name = L["Shortcuts"]
		},
		spacer1 = {
			order = 4,
			type = "description",
			name = " "
		},
		generalShortcut = {
			order = 5,
			type = "execute",
			name = L["General"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "general") end,
			disabled = function() return not E.NamePlates end
		},
		fontsShortcut = {
			order = 6,
			type = "execute",
			name = L["Fonts"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "fontGroup") end,
			disabled = function() return not E.NamePlates end
		},
		cooldownShortcut = {
			order = 7,
			type = "execute",
			name = L["Cooldown Override"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "cooldownGroup") end,
			disabled = function() return not E.NamePlates end
		},
		spacer2 = {
			order = 8,
			type = "description",
			name = " "
		},
		threatShortcut = {
			order = 9,
			type = "execute",
			name = L["Threat"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "threatGroup") end,
			disabled = function() return not E.NamePlates end
		},
		castBarShortcut = {
			order = 10,
			type = "execute",
			name = L["Cast Bar"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "castGroup") end,
			disabled = function() return not E.NamePlates end
		},
		reactionShortcut = {
			order = 11,
			type = "execute",
			name = L["Reaction Colors"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "reactions") end,
			disabled = function() return not E.NamePlates end
		},
		spacer3 = {
			order = 12,
			type = "description",
			name = " "
		},
		cutawayHealthShortcut = {
			order = 13,
			type = "execute",
			name = L["Cutaway Health"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "generalGroup", "cutawayHealth") end,
			disabled = function() return not E.NamePlates end
		},
		friendlyPlayerShortcut = {
			order = 14,
			type = "execute",
			name = L["Friendly Player Frames"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "friendlyPlayerGroup") end,
			disabled = function() return not E.NamePlates end
		},
		enemyPlayerShortcut = {
			order = 15,
			type = "execute",
			name = L["Enemy Player Frames"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "enemyPlayerGroup") end,
			disabled = function() return not E.NamePlates end
		},
		spacer4 = {
			order = 16,
			type = "description",
			name = " "
		},
		friendlyNPCShortcut = {
			order = 17,
			type = "execute",
			name = L["Friendly NPC Frames"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "friendlyNPCGroup") end,
			disabled = function() return not E.NamePlates end
		},
		enemyNPCShortcut = {
			order = 18,
			type = "execute",
			name = L["Enemy NPC Frames"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "enemyNPCGroup") end,
			disabled = function() return not E.NamePlates end
		},
		filtersShortcut = {
			order = 19,
			type = "execute",
			name = L["Style Filter"],
			buttonElvUI = true,
			func = function() ACD:SelectGroup("ElvUI", "nameplate", "filters") end,
			disabled = function() return not E.NamePlates end
		},
		generalGroup = {
			order = 20,
			type = "group",
			name = L["General Options"],
			childGroups = "tab",
			disabled = function() return not E.NamePlates; end,
			args = {
				general = {
					order = 1,
					type = "group",
					name = L["General"],
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["General"]
						},
						statusbar = {
							order = 2,
							type = "select",
							dialogControl = "LSM30_Statusbar",
							name = L["StatusBar Texture"],
							values = AceGUIWidgetLSMlists.statusbar,
						},
						motionType = {
							type = "select",
							order = 3,
							name = L["Nameplate Motion Type"],
							desc = L["Set to either stack nameplates vertically or allow them to overlap."],
							values = {
								["STACKED"] = L["Stacking Nameplates"],
								["OVERLAP"] = L["Overlapping Nameplates"],
							},
						},
						lowHealthThreshold = {
							order = 4,
							name = L["Low Health Threshold"],
							desc = L["Make the unitframe glow yellow when it is below this percent of health, it will glow red when the health value is half of this value."],
							type = "range",
							isPercent = true,
							min = 0, max = 1, step = 0.01,
						},
						showEnemyCombat = {
							order = 5,
							type = "select",
							name = L["Enemy Combat Toggle"],
							desc = L["Control enemy nameplates toggling on or off when in combat."],
							values = {
								["DISABLED"] = DISABLE,
								["TOGGLE_ON"] = L["Toggle On While In Combat"],
								["TOGGLE_OFF"] = L["Toggle Off While In Combat"],
							},
							set = function(info, value)
								E.db.nameplates[ info[#info] ] = value;
								NP:PLAYER_REGEN_ENABLED();
							end,
						},
						showFriendlyCombat = {
							order = 6,
							type = "select",
							name = L["Friendly Combat Toggle"],
							desc = L["Control friendly nameplates toggling on or off when in combat."],
							values = {
								["DISABLED"] = DISABLE,
								["TOGGLE_ON"] = L["Toggle On While In Combat"],
								["TOGGLE_OFF"] = L["Toggle Off While In Combat"],
							},
							set = function(info, value)
								E.db.nameplates[ info[#info] ] = value;
								NP:PLAYER_REGEN_ENABLED();
							end
						},
						resetFilters = {
							order = 7,
							name = L["Reset Aura Filters"],
							type = "execute",
							func = function(info, value)
								E:StaticPopup_Show("RESET_NP_AF") --reset nameplate aurafilters
							end,
						},
						comboPoints = {
							order = 8,
							type = "toggle",
							name = L["Combo Points"],
							desc = L["Display combo points on nameplates."]
						},
						nameColoredGlow = {
							order = 9,
							type = "toggle",
							name = L["Name Colored Glow"],
							desc = L["Use the Name Color of the unit for the Name Glow."]
						},
						targetedNamePlate = {
							order = 10,
							type = "group",
							guiInline = true,
							name = L["Targeted Nameplate"],
							get = function(info) return E.db.nameplates[ info[#info] ] end,
							set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:ConfigureAll() end,
							args = {
								useTargetScale = {
									order = 1,
									type = "toggle",
									name = L["Use Target Scale"],
									desc = L["Enable/Disable the scaling of targetted nameplates."],
								},
								targetScale = {
									order = 2,
									type = "range",
									isPercent = true,
									name = L["Target Scale"],
									desc = L["Scale of the nameplate that is targetted."],
									min = 0.3, max = 2, step = 0.01,
									disabled = function() return E.db.nameplates.useTargetScale ~= true end,
								},
								nonTargetTransparency = {
									order = 3,
									type = "range",
									isPercent = true,
									name = L["Non-Target Transparency"],
									desc = L["Set the transparency level of nameplates that are not the target nameplate."],
									min = 0, max = 1, step = 0.01,
								},
								spacer1 = {
									order = 4,
									type = "description",
									name = " ",
								},
								glowColor = {
									order = 5,
									type = "color",
									name = L["Target Indicator Color"],
									hasAlpha = true,
									get = function(info)
										local t = E.db.nameplates.glowColor
										local d = P.nameplates.glowColor
										return t.r, t.g, t.b, t.a, d.r, d.g, d.b, d.a
									end,
									set = function(info, r, g, b, a)
										local t = E.db.nameplates.glowColor
										t.r, t.g, t.b, t.a = r, g, b, a
										NP:ConfigureAll()
									end,
								},
								targetGlow = {
									order = 6,
									type = "select",
									name = L["Target Indicator"],
									customWidth = 225,
									get = function(info) return E.db.nameplates.targetGlow end,
									set = function(info, value) E.db.nameplates.targetGlow = value; NP:ConfigureAll() end,
									values = {
										["none"] = NONE,
										["style1"] = L["Border Glow"],
										["style2"] = L["Background Glow"],
										["style3"] = L["Top Arrow"],
										["style4"] = L["Side Arrows"],
										["style5"] = L["Border Glow"].." + "..L["Top Arrow"],
										["style6"] = L["Background Glow"].." + "..L["Top Arrow"],
										["style7"] = L["Border Glow"].." + "..L["Side Arrows"],
										["style8"] = L["Background Glow"].." + "..L["Side Arrows"],
									},
								},
								alwaysShowTargetHealth = {
									order = 7,
									type = "toggle",
									name = L["Always Show Target Health"],
									customWidth = 200,
								}
							}
						}
					}
				},
				fontGroup = {
					order = 2,
					type = "group",
					name = L["Fonts"],
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["Fonts"]
						},
						name = {
							order = 2,
							type = "group",
							name = L["Default Font"],
							guiInline = true,
							args = {
								font = {
									order = 1,
									type = "select", dialogControl = "LSM30_Font",
									name = L["Font"],
									values = AceGUIWidgetLSMlists.font
								},
								fontSize = {
									order = 2,
									type = "range",
									name = FONT_SIZE,
									min = 4, max = 23, step = 1
								},
								fontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["Set the font outline."],
									values = {
										["NONE"] = NONE,
										["OUTLINE"] = "OUTLINE",
										["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
										["THICKOUTLINE"] = "THICKOUTLINE"
									}
								}
							}
						},
						health = {
							order = 3,
							type = "group",
							name = HEALTH,
							guiInline = true,
							args = {
								healthFont = {
									order = 1,
									type = "select", dialogControl = "LSM30_Font",
									name = L["Font"],
									values = AceGUIWidgetLSMlists.font
								},
								healthFontSize = {
									order = 2,
									name = FONT_SIZE,
									type = "range",
									min = 4, max = 36, step = 1
								},
								healthFontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["Set the font outline."],
									values = {
										["NONE"] = NONE,
										["OUTLINE"] = "OUTLINE",
										["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
										["THICKOUTLINE"] = "THICKOUTLINE"
									}
								}
							}
						},
						duration = {
							order = 4,
							type = "group",
							name = L["Duration"],
							guiInline = true,
							args = {
								durationFont = {
									order = 1,
									type = "select", dialogControl = "LSM30_Font",
									name = L["Font"],
									values = AceGUIWidgetLSMlists.font,
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								},
								durationFontSize = {
									order = 2,
									name = FONT_SIZE,
									type = "range",
									min = 4, max = 20, step = 1,
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								},
								durationFontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["Set the font outline."],
									values = {
										["NONE"] = NONE,
										["OUTLINE"] = "OUTLINE",
										["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
										["THICKOUTLINE"] = "THICKOUTLINE",
									},
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								},
								durationPosition = {
									order = 4,
									type = "select",
									name = L["Position"],
									values = {
										["CENTER"] = L["Center"],
										["TOPLEFT"] = "TOPLEFT",
										["BOTTOMLEFT"] = "BOTTOMLEFT",
										["TOPRIGHT"] = "TOPRIGHT"
									}
								}
							}
						},
						stacks = {
							order = 5,
							type = "group",
							name = L["Stack Counter"],
							guiInline = true,
							args = {
								stackFont = {
									order = 1,
									type = "select", dialogControl = "LSM30_Font",
									name = L["Font"],
									values = AceGUIWidgetLSMlists.font,
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								},
								stackFontSize = {
									order = 2,
									type = "range",
									name = FONT_SIZE,
									min = 4, max = 20, step = 1,
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								},
								stackFontOutline = {
									order = 3,
									type = "select",
									name = L["Font Outline"],
									desc = L["Set the font outline."],
									values = {
										["NONE"] = NONE,
										["OUTLINE"] = "OUTLINE",
										["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
										["THICKOUTLINE"] = "THICKOUTLINE",
									},
									set = function(info, value) E.db.nameplates[ info[#info] ] = value; NP:UpdatePlateFonts() end
								}
							}
						}
					}
				},
				cooldownGroup = {
					order = 3,
					type = "group",
					name = L["Cooldown Override"],
					get = function(info)
						local t = E.db.nameplates.cooldown[ info[#info] ]
						local d = P.nameplates.cooldown[ info[#info] ]
						return t.r, t.g, t.b, t.a, d.r, d.g, d.b;
					end,
					set = function(info, r, g, b)
						local t = E.db.nameplates.cooldown[ info[#info] ]
						t.r, t.g, t.b = r, g, b;
						E:UpdateCooldownSettings("nameplates")
					end,
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["Cooldown Override"]
						},
						override = {
							order = 2,
							type = "toggle",
							name = L["Use Override"],
							desc = L["This will override the global cooldown settings."],
							get = function(info) return E.db.nameplates.cooldown[ info[#info] ] end,
							set = function(info, value) E.db.nameplates.cooldown[ info[#info] ] = value end
						},
						threshold = {
							order = 3,
							type = "range",
							name = L["Low Threshold"],
							desc = L["Threshold before text turns red and is in decimal form. Set to -1 for it to never turn red"],
							min = -1, max = 20, step = 1,
							disabled = function() return not E.db.nameplates.cooldown.override end,
							get = function(info) return E.db.nameplates.cooldown[ info[#info] ] end,
							set = function(info, value) E.db.nameplates.cooldown[ info[#info] ] = value end
						},
						expiringColor = {
							order = 4,
							type = "color",
							name = L["Expiring"],
							desc = L["Color when the text is about to expire"],
							disabled = function() return not E.db.nameplates.cooldown.override end
						},
						secondsColor = {
							order = 5,
							type = "color",
							name = L["Seconds"],
							desc = L["Color when the text is in the seconds format."],
							disabled = function() return not E.db.nameplates.cooldown.override end
						},
						minutesColor = {
							order = 6,
							type = "color",
							name = L["Minutes"],
							desc = L["Color when the text is in the minutes format."],
							disabled = function() return not E.db.nameplates.cooldown.override end
						},
						hoursColor = {
							order = 7,
							type = "color",
							name = L["Hours"],
							desc = L["Color when the text is in the hours format."],
							disabled = function() return not E.db.nameplates.cooldown.override end
						},
						daysColor = {
							order = 8,
							type = "color",
							name = L["Days"],
							desc = L["Color when the text is in the days format."],
							disabled = function() return not E.db.nameplates.cooldown.override end
						}
					}
				},
				threatGroup = {
					order = 4,
					type = "group",
					name = L["Threat"],
					get = function(info)
						local t = E.db.nameplates.threat[ info[#info] ];
						local d = P.nameplates.threat[info[#info]];
						return t.r, t.g, t.b, t.a, d.r, d.g, d.b;
					end,
					set = function(info, r, g, b)
						local t = E.db.nameplates.threat[ info[#info] ];
						t.r, t.g, t.b = r, g, b;
					end,
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["Threat"]
						},
						useThreatColor = {
							order = 2,
							type = "toggle",
							name = L["Use Threat Color"],
							get = function(info) return E.db.nameplates.threat.useThreatColor; end,
							set = function(info, value) E.db.nameplates.threat.useThreatColor = value; end
						},
						goodScale = {
							order = 3,
							type = "range",
							name = L["Good Scale"],
							get = function(info) return E.db.nameplates.threat[ info[#info] ]; end,
							set = function(info, value) E.db.nameplates.threat[ info[#info] ] = value; end,
							min = 0.3, max = 2, step = 0.01,
							isPercent = true
						},
						badScale = {
							order = 4,
							type = "range",
							name = L["Bad Scale"],
							get = function(info) return E.db.nameplates.threat[ info[#info] ]; end,
							set = function(info, value) E.db.nameplates.threat[ info[#info] ] = value; end,
							min = 0.3, max = 2, step = 0.01,
							isPercent = true
						},
						beingTankedByTank = {
							order = 5,
							type = "toggle",
							name = L["Color Tanked"],
							desc = L["Use Tanked Color when a nameplate is being effectively tanked by another tank."],
							get = function(info) return E.db.nameplates.threat[ info[#info] ]; end,
							set = function(info, value) E.db.nameplates.threat[ info[#info] ] = value; end,
							disabled = function() return not E.db.nameplates.threat.useThreatColor; end,
							hidden = true
						},
						beingTankedByTankColor = {
							order = 6,
							type = "color",
							name = L["Tanked Color"],
							hasAlpha = false,
							disabled = function() return (not E.db.nameplates.threat.beingTankedByTank or not E.db.nameplates.threat.useThreatColor); end,
							hidden = true
						},
						spacer = {
							order = 7,
							type = "description",
							name = "",
						},
						goodColor = {
							order = 8,
							type = "color",
							name = L["Good Color"],
							hasAlpha = false,
							disabled = function() return not E.db.nameplates.threat.useThreatColor; end
						},
						badColor = {
							order = 9,
							type = "color",
							name = L["Bad Color"],
							hasAlpha = false,
							disabled = function() return not E.db.nameplates.threat.useThreatColor; end
						},
						goodTransition = {
							order = 10,
							type = "color",
							name = L["Good Transition Color"],
							hasAlpha = false,
							disabled = function() return not E.db.nameplates.threat.useThreatColor; end
						},
						badTransition = {
							order = 11,
							type = "color",
							name = L["Bad Transition Color"],
							hasAlpha = false,
							disabled = function() return not E.db.nameplates.threat.useThreatColor; end
						}
					}
				},
				castGroup = {
					order = 5,
					type = "group",
					name = L["Cast Bar"],
					get = function(info)
						local t = E.db.nameplates[ info[#info] ];
						local d = P.nameplates[info[#info]];
						return t.r, t.g, t.b, t.a, d.r, d.g, d.b;
					end,
					set = function(info, r, g, b)
						local t = E.db.nameplates[ info[#info] ];
						t.r, t.g, t.b = r, g, b;
						NP:ForEachPlate("ConfigureElement_CastBar");
					end,
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["Cast Bar"]
						},
						castColor = {
							order = 2,
							type = "color",
							name = L["Cast Color"],
							hasAlpha = false
						},
						castNoInterruptColor = {
							order = 3,
							type = "color",
							name = L["Cast No Interrupt Color"],
							hasAlpha = false
						}
					}
				},
				reactions = {
					order = 6,
					type = "group",
					name = L["Reaction Colors"],
					get = function(info)
						local t = E.db.nameplates.reactions[ info[#info] ];
						local d = P.nameplates.reactions[info[#info]];
						return t.r, t.g, t.b, t.a, d.r, d.g, d.b;
					end,
					set = function(info, r, g, b)
						local t = E.db.nameplates.reactions[ info[#info] ];
						t.r, t.g, t.b = r, g, b;
						NP:ForEachPlate("UpdateElement_HealthColor", true)
						NP:ForEachPlate("UpdateElement_Name", true)
					end,
					args = {
						header = {
							order = 1,
							type = "header",
							name = L["Reaction Colors"]
						},
						bad = {
							order = 2,
							type = "color",
							name = ENEMY,
							hasAlpha = false
						},
						neutral = {
							order = 3,
							type = "color",
							name = L["Neutral"],
							hasAlpha = false
						},
						good = {
							order = 4,
							type = "color",
							name = L["FRIENDLY_NPC"],
							hasAlpha = false
						},
						friendlyPlayer = {
							order = 5,
							type = "color",
							name = L["FRIENDLY_PLAYER"],
							hasAlpha = false
						}
					}
				},
				cutawayHealth = {
					order = 7,
					type = "group",
					name = L["Cutaway Health"],
					args = {
						enabled = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							get = function(info) return E.db.nameplates.cutawayHealth end,
							set = function(info, value) E.db.nameplates.cutawayHealth = value; end,
						},
						healthLength = {
							order = 2,
							type = "range",
							name = L["Health Length"],
							desc = L["How much time before the CutawayHealth starts to fade."],
							min = 0.1, max = 1, step = 0.1,
							get = function(info) return E.db.nameplates.cutawayHealthLength end,
							set = function(info, value) E.db.nameplates.cutawayHealthLength = value end
						},
						healthFadeOutTime = {
							order = 3,
							type = "range",
							name = L["Fade Out"],
							desc = L["How long the CutawayHealth will take to fade out."],
							min = 0.1, max = 1, step = 0.1,
							get = function(info) return E.db.nameplates.cutawayHealthFadeOutTime end,
							set = function(info, value) E.db.nameplates.cutawayHealthFadeOutTime = value end
						}
					}
				}
			}
		},
		friendlyPlayerGroup = GetUnitSettings("FRIENDLY_PLAYER", L["Friendly Player Frames"]),
		enemyPlayerGroup = GetUnitSettings("ENEMY_PLAYER", L["Enemy Player Frames"]),
		friendlyNPCGroup = GetUnitSettings("FRIENDLY_NPC", L["Friendly NPC Frames"]),
		enemyNPCGroup = GetUnitSettings("ENEMY_NPC", L["Enemy NPC Frames"]),
		filters = {
			order = -99,
			type = "group",
			name = L["Style Filter"],
			childGroups = "tab",
			disabled = function() return not E.NamePlates end,
			args = {
				addFilter = {
					order = 1,
					type = "input",
					name = L["Create Filter"],
					get = function(info) return "" end,
					set = function(info, value)
						if match(value, "^[%s%p]-$") then
							return
						end
						if E.global["nameplates"]["filters"][value] then
							E:Print(L["Filter already exists!"])
							return
						end
						local filter = {}
						NP:StyleFilterInitializeFilter(filter)
						E.global.nameplates.filters[value] = filter
						UpdateFilterGroup()
						NP:ConfigureAll()
					end
				},
				selectFilter = {
					order = 2,
					type = "select",
					sortByValue = true,
					name = L["Select Filter"],
					get = function(info) return selectedNameplateFilter end,
					set = function(info, value) selectedNameplateFilter = value UpdateFilterGroup() end,
					values = function()
						local filters, priority, name = {}
						local list = E.global.nameplates.filters
						local profile = E.db.nameplates.filters
						if not list then return end
						for filter, content in pairs(list) do
							priority = (content.triggers and content.triggers.priority) or "?"
							name = (content.triggers and profile[filter] and profile[filter].triggers and profile[filter].triggers.enable and filter) or (content.triggers and format("|cFF666666%s|r", filter)) or filter
							filters[filter] = format("|cFFffff00(%s)|r %s", priority, name)
						end
						return filters
					end
				},
				removeFilter = {
					order = 3,
					type = "execute",
					name = L["Delete Filter"],
					desc = L["Delete a created filter, you cannot delete pre-existing filters, only custom ones."],
					buttonElvUI = true,
					func = function()
						for profile in pairs(E.data.profiles) do
							if E.data.profiles[profile].nameplates and E.data.profiles[profile].nameplates.filters and E.data.profiles[profile].nameplates.filters[selectedNameplateFilter] then
								E.data.profiles[profile].nameplates.filters[selectedNameplateFilter] = nil
							end
						end
						E.global.nameplates.filters[selectedNameplateFilter] = nil
						selectedNameplateFilter = nil
						UpdateFilterGroup()
						NP:ConfigureAll()
					end,
					disabled = function() return G.nameplates.filters[selectedNameplateFilter] end,
					hidden = function() return selectedNameplateFilter == nil end
				}
			}
		}
	}
}