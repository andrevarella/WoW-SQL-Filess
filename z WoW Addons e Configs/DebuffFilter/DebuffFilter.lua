DebuffFilter = LibStub("AceAddon-3.0"):NewAddon("DebuffFilter", "AceConsole-3.0", "AceEvent-3.0")
-- ButtonFacade library skins buttons (can change their display in many different ways)
local LBF = LibStub("LibButtonFacade", true)

function DebuffFilter:DebugTrace (arg1, enter)
	if self.db and DebuffFilter.PlayerConfig.General.showTrace == true then
		if (enter) then
			DEFAULT_CHAT_FRAME:AddMessage("DebuffFilter:"..arg1.." enter")
		else
			DEFAULT_CHAT_FRAME:AddMessage("DebuffFilter:"..arg1.." exit")
		end
	end
end

function DebuffFilter:DebugPrint (arg1)
	if DebuffFilter.PlayerConfig.General.showDebug == true then
		DEFAULT_CHAT_FRAME:AddMessage("DebuffFilter:"..arg1)
	end
end

-- grabs settings for the options screen, this is done by traversing
-- the configuration table which mirrors the table used for displaying
-- the options screen
function DebuffFilter:getfunc(info)
	local value = DebuffFilter.PlayerConfig
	for i = 1, #info do
		value = value[info[i]]
	end
	return value
end

-- modify configuration table, by traversing it -- it mirros the table
-- used for displaying the options screen
function DebuffFilter:setfunc(info, value)
	local parent = DebuffFilter.PlayerConfig

	for i = 1,#info-1 do
		parent = parent[info[i]]
	end
	parent[info[#info]] = value
end

local BuffOrDebuff = {
	type = "group",
	name = function(info) return info[#info] end,
    args = {
		selfapplied={
			name= DFILTER_OPTIONS_SELFAPPLIED,
			desc= DFILTER_OPTIONS_SELFAPPLIED_TOOLTIP,
			type= "toggle",
			set = function(info, value)
					if not value then value = nil end
					DebuffFilter:setfunc(info,value)
					DebuffFilter_Frame_Update(info[2],info[3])
				end,
			get = "getfunc",
			order=5,
		},
		dontcombine={
			name= DFILTER_OPTIONS_DONTCOMBINE,
			desc= DFILTER_OPTIONS_DONTCOMBINE_TOOLTIP,
			type= "toggle",
			set = function(info, value)
					if not value then value = nil end
					DebuffFilter:setfunc(info,value)
					DebuffFilter_Frame_Update(info[2],info[3])
				end,
			get = "getfunc",
			order=6,
		},
		del={
			name= DFILTER_OPTIONS_DEL,
			type= "execute",
			order=3,
			func=function(info)
					info.options.args.Buffs.args[info[2]].args[info[3]].args.List.args[info[5]] = nil 
					DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].List[info[5]] = nil
					DebuffFilter_Frame_Update(info[2],info[3])
				end,
		},
		texture={
			type="input",
			name=DFILTER_OPTIONS_TEXTURE,
			set = function(info, value)
					if value:len() == 0 then value = nil end
					DebuffFilter:setfunc(info,value)
					DebuffFilter_Frame_Update(info[2],info[3])
				end,
			order=4,
			get = "getfunc",
		},
	},
}

local BuffsOrDebuffsList = {
	name = function(info)
			if info[#info] == "Buffs" then return DFILTER_OPTIONS_BUFFS
			else return DFILTER_OPTIONS_DEBUFFS end end,
	type = "group",
	childGroups = "tab",
	args = {
		enterBuff={
			type="input",
			name=DFILTER_OPTIONS_NAME,
			desc="New buff/debuff to add to list",
			order=5,
			set = function(info, value)	
					info.options.args.Buffs.args[info[2]].args[info[3]].args.List.args[value] = BuffOrDebuff
					DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].List[value] = {}
					DebuffFilter_Frame_Update(info[2],info[3])
				end,
			get = function(info)
					-- remove old debuffs/buffs in list and add correct ones for the target frame
					-- that is selected.  This is done here since the get function does not work
					-- in a group node.  If it does work, it's because a subnode inherited it.
					local buffList = info.options.args.Buffs.args[info[2]].args[info[3]].args.List.args
					for k, v in pairs(buffList) do
						buffList[k] = nil
					end
					for k, v in pairs(DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].List) do
						buffList[k] = BuffOrDebuff
					end
					if DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].showAllBuffs or 
						not DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].enabled then
						info.option.disabled = true
						info.options.args.Buffs.args[info[2]].args[info[3]].args.List.disabled = true
					else
						info.option.disabled = false
						info.options.args.Buffs.args[info[2]].args[info[3]].args.List.disabled = false
					end	
				end,
		},
		showAllBuffs = {
			type = "toggle",
			name = "Show all",
			desc = "Show all buffs/debuffs",
			width="half",
			order=6,
			-- dont need to disable other widgets, their get functions will handle it
			set = function(info, value) 
					DebuffFilter:setfunc(info, value)
					DebuffFilter_Frame_Update(info[2], info[3])
				end,	
			get = function(info)
					if not DebuffFilter.PlayerConfig.Buffs[info[2]][info[3]].enabled then
						info.option.disabled = true
					else
						info.option.disabled = false
					end	
					return DebuffFilter:getfunc(info)
				end,
		},
		enabled={
			name= "Show Frame",
			desc= "Show or hide current frame",
			type= "toggle",
			order = 7,
			set = function(info, value) 
					DebuffFilter:setfunc(info, value)
					if value then
						DebuffFilter_Frame_Update(info[2],info[3])
						DebuffFilter.Frames[info[2]][info[3]].frame:Show()
					else
						DebuffFilter.Frames[info[2]][info[3]].frame:Hide()
					end
				end,	
			get = "getfunc",
		},
		List={
			name = DFILTER_OPTIONS_NAME,
			type = "group",
			args = {
			},
		},	
	},
}

local frameOptions = {
	type = "group",
	name = function(info)
			if info[#info] == "Buffs" then return DFILTER_OPTIONS_BUFFS
			else return DFILTER_OPTIONS_DEBUFFS end end,
	args = {
        grow = {
        	name = DFILTER_OPTIONS_GROW,
        	desc = DFILTER_OPTIONS_GROW_TOOLTIP,
        	type = "select",
        	values = {
				rightdown = "Right-Down",
				rightup = "Right-Up",
				leftdown = "Left-Down",
				leftup = "Left-Up",
			},
			set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						DebuffFilter_UpdateLayout(info[2],info[3])
				end,	
            get = "getfunc",
        },
        per_row = {
        	name = DFILTER_OPTIONS_ROW,
        	desc = DFILTER_OPTIONS_ROW_TOOLTIP,
        	type = "range",
        	min = 1,
        	max = 8,
        	step = 1,
			set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						DebuffFilter_UpdateLayout(info[2],info[3])
				end,	
            get = "getfunc",
        },
		scale = {
			name = "frame scale",
			desc = "Scales the frame only up or down in size",
			type = "range",
			min = 0.5,
			max = 3,
			step = 0.05,
			set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						DebuffFilter:FrameSetScale(DebuffFilter.Frames[info[2]][info[3]].frame,value)
				end,	
			get = "getfunc",
		},
	},
}

local frameLayoutTabs = {
	type = "group",
	name = function(info) return info[#info] end,
	childGroups = "tab",
	args = {
		Debuffs = frameOptions,
		Buffs = frameOptions,
	}	
}

local frameBuffsTabs = {
	type = "group",
	name = function(info) return info[#info] end,
	childGroups = "tab",
	args = {
		Debuffs = BuffsOrDebuffsList,
		Buffs = BuffsOrDebuffsList,
	},
}

local newTargetFrameName = {
	type = "group",
	name = function(info) return info[#info] end,
	args={
		del={
			name= DFILTER_OPTIONS_DEL,
			type= "execute",
			func=function(info)
				info.options.args.Frames.args[info[3]] = nil
				info.options.args.Buffs.args[info[3]] = nil
				info.options.args.General.args.listTargetFrames.args[info[3]] = nil
				
				if LBF then
					local groupID
					for a, b in ipairs({"Buffs","Debuffs"}) do
						groupID = info[3].." "..b.." Frame"
						DebuffFilter.Frames[info[3]][b].buttonfacadeGroup:Delete()
						DebuffFilter.PlayerConfig.ButtonFacade[groupID] = nil
					end
				end	

				DebuffFilter.Frames[info[3]]["Buffs"].frame:Hide()
				DebuffFilter.Frames[info[3]]["Debuffs"].frame:Hide()
				DebuffFilter.Frames[info[3]] = nil
				
				DebuffFilter.PlayerConfig.Buffs[info[3]] = nil
				DebuffFilter.PlayerConfig.Frames[info[3]] = nil
			end,
		},
	},	
}

local options = {
	handler = DebuffFilter,
	name="DebuffFilter",
	type = "group",
	args = {

	General = {
		handler = DebuffFilter,
		type = "group",
		name = "General Settings",
		childGroups = "tab",
		args = {
			version={
				order=1,
				type="description",
				name=function(info) return "version: "..GetAddOnMetadata("DebuffFilter", "Version") end,
			},
			count={
				order=2,
				name= DFILTER_OPTIONS_COUNT,
				desc= DFILTER_OPTIONS_COUNT_TOOLTIP,
				type= "toggle",
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						for k, v in pairs(DebuffFilter.Frames) do
							for a, b in ipairs({"Buffs","Debuffs"}) do
								if value then 
									DebuffFilter.Frames[k][b].frameCount:Show()
								else
									DebuffFilter.Frames[k][b].frameCount:Hide()
								end
							end
						end	
					end,
				get = "getfunc",
			},
			cooldowncount={
				order=3,
				name= DFILTER_OPTIONS_COOLDOWNCOUNT,
				desc= DFILTER_OPTIONS_COOLDOWNCOUNT_TOOLTIP,
				type= "toggle",
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						local buttons, i, button
						for k, v in pairs(DebuffFilter.Frames) do
							for a, b in ipairs({"Buffs","Debuffs"}) do
								buttons = DebuffFilter.Frames[k][b].buttons
								i = 1
								button = buttons["button"..i]
								while button do
									if value then
										buttons["button"..i].time:Hide()
									else
										buttons["button"..i].cooldown:Hide()
									end
									i = i + 1
									button = buttons["button"..i]
								end
								DebuffFilter_UpdateLayout(k,b)
								DebuffFilter_Frame_Update(k,b)
							end
						end	
					end,
				get = "getfunc",
			},
			combat={
				order=4,
				name= DFILTER_OPTIONS_COMBAT,
				desc= DFILTER_OPTIONS_COMBAT_TOOLTIP,
				type= "toggle",
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						if value then
							DebuffFilter:RegisterEvent("PLAYER_REGEN_DISABLED");
							DebuffFilter:RegisterEvent("PLAYER_REGEN_ENABLED");
							if (not UnitAffectingCombat("player")) then
								DebuffFilterFrame:Hide();
							end
						else
							DebuffFilter:UnregisterEvent("PLAYER_REGEN_DISABLED");
							DebuffFilter:UnregisterEvent("PLAYER_REGEN_ENABLED");
							DebuffFilterFrame:Show();
						end
					end,	
				get = "getfunc",
			},
			tooltips={
				order=5,
				name= DFILTER_OPTIONS_TOOLTIPS,
				desc= DFILTER_OPTIONS_TOOLTIPS_TOOLTIP,
				type= "toggle",
				set = "setfunc",
				get = "getfunc",
			},
			backdrop={
				order=6,
				name= DFILTER_OPTIONS_BACKDROP,
				desc= DFILTER_OPTIONS_BACKDROP_TOOLTIP,
				type= "toggle",
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						for k, v in pairs(DebuffFilter.Frames) do
							for a, b in ipairs({"Buffs","Debuffs"}) do
								if value then
									DebuffFilter.Frames[k][b].frameBackdrop:Show()
								else
									DebuffFilter.Frames[k][b].frameBackdrop:Hide()
								end
							end
						end	
					end,	
				get = "getfunc",
			},
			lock={
				order=7,
				name= DFILTER_OPTIONS_LOCK,
				desc= DFILTER_OPTIONS_LOCK_TOOLTIP,
				type= "toggle",
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						if value then 
							DebuffFilter_LockFrames(true) 
						else
							DebuffFilter_LockFrames(false)
						end	
					end,	
				get = "getfunc",
			},
			resetposition={
				order=8,
				name= "Reset Frame Positions",
				type= "execute",
				func=function()
					DebuffFilter.xvalues.xvalue = 478
					DebuffFilter.xvalues.nextxvalue = 578
					DebuffFilter.yvalue = 335
					local anchor;
					-- a frame's position is affected by its scale, so I need to reset scales too
					DebuffFilter.PlayerConfig.General.scale = 1.2
					DebuffFilterFrame:SetScale(1.2)
					for k, v in pairs(DebuffFilter.Frames) do
						for a, b in ipairs({"Buffs","Debuffs"}) do
							DebuffFilter.PlayerConfig.Frames[k][b].scale = 1
							DebuffFilter:FrameSetScale(DebuffFilter.Frames[k][b].frame, 1);
							
							anchor = {"TOPLEFT","UIParent","BOTTOMLEFT",DebuffFilter.xvalues.xvalue,DebuffFilter.yvalue}
							DebuffFilter.PlayerConfig.Frames[k][b].anchor = anchor			
							DebuffFilter.Frames[k][b].frame:ClearAllPoints()
							DebuffFilter.Frames[k][b].frame:SetPoint(unpack(anchor))

							DebuffFilter:swapXvalues()

						end
						DebuffFilter:adjustAnchorPoints()
					end
				end,		
			},
			config = {
				order=9,
				type = "execute",
				name = "Standalone Config",
				desc = "Setup addon in a movable standalone dialog",
				func = "OpenConfigDialog"
			},
			scale = {
				order=10,
				name = DFILTER_OPTIONS_SCALE,
				desc = DFILTER_OPTIONS_SCALE_TOOLTIP,
				type = "range",
				min = 0.5,
				max = 3,
				step = 0.05,
				set = function(info, value) 
						DebuffFilter:setfunc(info, value)
						DebuffFilter:SetScale(value)
					end,	
				get = "getfunc",
			},
			--[[header={
				order=11,
				name="",
				type= "header",
			},]]
			newTargetFrame={
				order=12,
				type="input",
				width="double",
				name="Target name for new frame:",
				desc="Can show buffs for new targets, like pet, raid1...",
				set = function(info, value)
						info.options.args.Frames.args[value] = frameLayoutTabs
						info.options.args.Buffs.args[value] = frameBuffsTabs
						info.options.args.General.args.listTargetFrames.args[value] = newTargetFrameName

						local frameitem, groupID
						DebuffFilter.Frames[value] = {}
						for a, b in ipairs({"Buffs","Debuffs"}) do
							DebuffFilter:createFrame(value, b)
							-- if there's ButtonFacade, create a group for frame so it can be skinned
							if LBF then
								groupID = value.." "..b.." Frame"
								frameitem = DebuffFilter.Frames[value][b]
								frameitem.buttonfacadeGroup = LBF:Group("DebuffFilter", groupID)
							end	
							DebuffFilter_Frame_Update(value, b)
						end	
						DebuffFilter:adjustAnchorPoints()
					end,
			},
			listTargetFrames={
				order=13,
				type="group",
				name="List of target names:",
				args={
				},
			},
			showDebug = {
				hidden = true,
				name = "ShowDebug",
				desc = "Show debug messages",
				type = "toggle",
				set = "setfunc",
				get = "getfunc",
			},
			showTrace = {
				hidden = true,
				name = "ShowTrace",
				desc = "Show trace messages",
				type = "toggle",
				set = "setfunc",
				get = "getfunc",
			},
		},	
	},
	Frames = {
		handler = DebuffFilter,
		type = "group",
		name = "Frame Layout",
		childGroups = "select",
		-- tooltip won't appear
		--desc = DFILTER_OPTIONS_TARGET_TOOLTIP,
		args = {
		},
	},
	Buffs = {
		handler = DebuffFilter,
		type = "group",
		name = "Frame Buffs",
		childGroups = "select",
		--desc = DFILTER_OPTIONS_TARGET_TOOLTIP,
		args = {
		},

	},

	},
}

-- taken from bongos, like below
function DebuffFilter:FrameSetScale(frame, scale)
	local ratio, x, y, layout;
	
	ratio = frame:GetScale() / scale;

	x, y = frame:GetLeft() * ratio, frame:GetTop() * ratio;
	-- store new position of frame in config file
	layout = DebuffFilter.PlayerConfig.Frames[frame.target][frame.buffOrDebuff]
	layout.anchor = {"TOPLEFT", "UIParent", "BOTTOMLEFT", x, y};			

	frame:ClearAllPoints();
	frame:SetPoint(unpack(layout.anchor));
	frame:SetScale(scale);
end

-- taken from bongos
function DebuffFilter:SetScale(scale)
	local ratio, x, y, frame, layout;

	ratio = DebuffFilterFrame:GetScale() / scale;

	for k, v in pairs(DebuffFilter.Frames) do
		for a, b in ipairs({"Buffs","Debuffs"}) do
			frame = DebuffFilter.Frames[k][b].frame
			x, y = frame:GetLeft() * ratio, frame:GetTop() * ratio;
			-- store new position of frame in config file
			layout = DebuffFilter.PlayerConfig.Frames[k][b]
			layout.anchor = {"TOPLEFT", "UIParent", "BOTTOMLEFT", x, y};			

			frame:ClearAllPoints();
			frame:SetPoint(unpack(layout.anchor));
		end	
	end

	DebuffFilterFrame:SetScale(scale);
end

-- I use two x positions, one for the buff, and the other for the debuff
function DebuffFilter:swapXvalues()
	local tempxvalue
	tempxvalue = DebuffFilter.xvalues.xvalue;
	DebuffFilter.xvalues.xvalue = DebuffFilter.xvalues.nextxvalue;
	DebuffFilter.xvalues.nextxvalue = tempxvalue;
end

-- for new frames, or resetting frames, this function calculates new positions
-- the positions are arranged like a grid
function DebuffFilter:adjustAnchorPoints()
	local yvalue, xvalue, nextxvalue = DebuffFilter.yvalue, DebuffFilter.xvalues.xvalue, DebuffFilter.xvalues.nextxvalue
	yvalue = yvalue - 60;
	-- if y has fallen too much, set its position back to top of screen
	if yvalue < 150 then
		xvalue = nextxvalue + 100
		nextxvalue = xvalue + 100
		yvalue = 515
		-- if x has gone too far right, set its position back to left of screen
		if xvalue > 885 then
			xvalue = xvalue - 1020
			nextxvalue = xvalue + 100
		end
	end
	DebuffFilter.yvalue, DebuffFilter.xvalues.xvalue, DebuffFilter.xvalues.nextxvalue = yvalue, xvalue, nextxvalue
end

-- settings that are stored on file and are referenced through DebuffFilter.PlayerConfig.  
-- ['**'] is a wildcard, and it can be replaced by any string -- it is used by Ace-DB
function DebuffFilter:InitDefaults()
	local defaults = {
		char = {
			General = {
				count = false,
				cooldowncount = false,
				combat = false,
				tooltips = false,
				backdrop = false,
				lock = true,
				scale = 1,
				showDebug = false,
				showTrace = false,
			},
			Frames = {
				['**'] = {
					['**'] = {
						per_row = 8,
						scale = 1,
						grow = "rightdown",
						time_tb = "bottom",
						time_lr = "right",
					},
				},
			},
			Buffs = {
				target = {
					Debuffs = {
						enabled = true,
					},
				},
				player = {
					Debuffs = {
						enabled = true,
					},
					Buffs = {
						enabled = true,
					},
				},
				['**'] = {
					['**'] = {
						showAllBuffs = false,
						["List"] = {
						},
					},
				},
			},
			ButtonFacade = {
			},
		},
	}
	return defaults
end

-- the direction that debuffs/buffs are organized, what side their time is on,
-- and what side the number of debuffs/buffs is placed
DebuffFilter.Orientation = {
	rightdown = { point="LEFT", relpoint="RIGHT", x=4, y=0 },
	rightup = { point="LEFT", relpoint="RIGHT", x=4, y=0 },
	leftdown = { point="RIGHT", relpoint="LEFT", x=-4, y=0 },
	leftup = { point="RIGHT", relpoint="LEFT", x=-4, y=0 },
	bottom = { point="TOP", relpoint="BOTTOM", x=0, y=-2, next_time="top" },
	top = { point="BOTTOM", relpoint="TOP", x=0, y=2, next_time="bottom" },
	left = { point="RIGHT", relpoint="LEFT", x=-4, y=0, next_time="right" },
	right = { point="LEFT", relpoint="RIGHT", x=4, y=0, next_time="left" },
}

-- increment number after combining two of the same debuffs/buffs
function DebuffFilter_CombineStacks(button)
	local total = (tonumber(button.count2:GetText()) or 1) + 1;
	button.count2:SetText(total);
end

function DebuffFilter_Button_OnLoad(self)
	local name = self:GetName();

	self.icon = _G[name .. "Icon"];
	self.time = _G[name .. "Duration"];
	self.cooldown = _G[name .. "Cooldown"];
	-- current number of debuff/buff's stack
	self.count = _G[name .. "Count"];
	-- number of same debuffs/buffs that are combined
	self.count2 = _G[name .. "Count2"];
	self.border = _G[name .. "Border"];
	self.update = 0;
	self.isTimeVisible = false;
end

function DebuffFilter_OnMouseDown(self, button)
	if (button == "LeftButton" and IsShiftKeyDown()) then
		self:GetParent():StartMoving();
	elseif (button == "RightButton" and IsControlKeyDown()) then
		local next_time;
		local frame = self:GetParent();
		local layout = DebuffFilter.PlayerConfig.Frames[frame.target][frame.buffOrDebuff];

		-- switch position of the debuffs/buffs time, if it's bottom make it top
		-- if there's only 1 per row, switch it to left or right side
		if (layout.per_row == 1) then
			next_time = DebuffFilter.Orientation[layout.time_lr].next_time;
			layout.time_lr = next_time;
		else
			next_time = DebuffFilter.Orientation[layout.time_tb].next_time;
			layout.time_tb = next_time;
		end

		-- reposition the times for the debuffs/buffs of a certain frame
		DebuffFilter_SetTimeOrientation(next_time, DebuffFilter.Frames[frame.target][frame.buffOrDebuff].buttons);
		DebuffFilter_Print(frame.target.." "..frame.buffOrDebuff.. " time orientation: " .. next_time);
	end
end

function DebuffFilter_OnMouseUp(self, button)
	if (button == "LeftButton") then
		local frame = self:GetParent();
		frame:StopMovingOrSizing();
		
		-- store the new frame position in config file
		local anchor = {"TOPLEFT","UIParent","BOTTOMLEFT",frame:GetLeft(),frame:GetTop()};
		DebuffFilter.PlayerConfig.Frames[frame.target][frame.buffOrDebuff].anchor = anchor;
	end
end

function DebuffFilter_Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Debuff Filter|r: " .. msg);
end

function DebuffFilter_ShowButton(button, index, texture, applications, duration, expiretime, target)
	button.index = index;
	button.expiretime = expiretime;
	button.target = target;
	button.icon:SetTexture(texture);

	-- show stack number of a debuff/buff
	if (applications > 1) then
		button.count:SetText(applications);
		button.count:Show();
	else
		button.count:Hide();
	end

	-- show time remaining for a debuff/buff, if it exists, as a time
	-- or display it as a cooldown on the debuff/buff itself similar to a clock
	if (duration and duration > 0) then
		if (not DebuffFilter.PlayerConfig.General.cooldowncount) then
			DebuffFilter_SetTime(button, expiretime-GetTime());
			button.time:Show();
		else
			CooldownFrame_SetTimer(button.cooldown, expiretime-duration, duration, 1);
		end
	else
		button.time:Hide();
		button.cooldown:Hide();

		-- dunno what this is for, maybe addon OmniCC?
		if (button.timer) then
			button.timer:Hide();
		end
	end

	button:Show();
end

function DebuffFilter_Frame_Update(target, buffOrDebuff)
	if not DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff].enabled then return end

	local frameitem = DebuffFilter.Frames[target][buffOrDebuff];
	local player_config = DebuffFilter.PlayerConfig.Frames[target][buffOrDebuff];
	local isdebuff = buffOrDebuff == "Debuffs";
	local player_buffs = DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff]["List"];
	local frameitem = DebuffFilter.Frames[target][buffOrDebuff];
	local buttons = frameitem.buttons;
	local already_seen_debuffs = frameitem.already_seen_debuffs;

	local button;
	local name, texture, applications, debufftype, duration, expiretime, caster, ismine;
	local selfapplied, dontcombine, texturefilter;
	local nametexture, color;
	local width = 0;
	local targetisplayer = target == "player";

	-- iterate through every debuff/buff player has and perhaps display it
	local i = 1;
	local debuff, all_debuffs = nil, false;
	-- check if we are to display all debuffs/buffs
	all_debuffs = DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff].showAllBuffs

	if isdebuff then
		name, _, texture, applications, debufftype, duration, expiretime, caster = UnitDebuff(target, i);
	else
		name, _, texture, applications, debufftype, duration, expiretime, caster = UnitBuff(target, i);
	end
	while texture do
		-- if we are not dealing with the current player's debuffs/buffs,
		-- check that the current debuff/buff was applied by the current player
		if not targetisplayer then
			ismine = caster == "player";
		end
	
		-- display number of debuffs/buffs raider has
		frameitem.frameCount:SetText(i);
		
		-- check if current debuff/buff is on list of debuffs/buffs to display
		if not all_debuffs then
			debuff = player_buffs[name];
		end	
		
		if debuff or all_debuffs then
			-- dont need to know these setting if we are displaying all debuffs/buffs
			if not all_debuffs then
				-- show only debuff/buff current player applied
				selfapplied = debuff.selfapplied;
				-- dont combine same debuff/buff from different players into one
				dontcombine = debuff.dontcombine;
				texturefilter = debuff.texture;
			end
			
			-- if texture field is not nil, look for a match with the name of debuff/buff's texture
			-- problem with this, is that i have seen spells who have texture names that are much different than the spell name
			if (targetisplayer or (not selfapplied or ismine)) and (not texturefilter or string.match(texture, texturefilter)) then
				nametexture = name .. texture;

				if (not dontcombine and already_seen_debuffs[nametexture]) then
					button = buttons["button" .. already_seen_debuffs[nametexture]];
				
					DebuffFilter_CombineStacks(button);

					-- button is already shown, and stacks are combined and shown too
					-- below just ensures that player's buff is shown and not the same buff from another raider
					if (targetisplayer or ismine) then
						DebuffFilter_ShowButton(button, i, texture, applications, duration, expiretime, target);
					end
				else
					-- assume it sets the color of the border of the debuff, but I can't find
					-- the DebuffTypeColor list anywhere
					if isdebuff then
						if (debufftype) then
							color = DebuffTypeColor[debufftype];
						else
							color = DebuffTypeColor["none"];
						end
					end	

					width = width + 1;
			
					if buttons ~= nil then
						button = buttons["button" .. width];
					end	
					
					if (not button) then
						if isdebuff then
							buttons["button" .. width] = CreateFrame("Button", "DebuffFilterButton"..target..buffOrDebuff..width, frameitem.frame, "DebuffFilter_DebuffButtonTemplate");
						else
							buttons["button" .. width] = CreateFrame("Button", "DebuffFilterButton"..target..buffOrDebuff..width, frameitem.frame, "DebuffFilter_BuffButtonTemplate");
						end
						button = buttons["button" .. width];
						button:EnableMouse(not DebuffFilter.PlayerConfig.General.lock);
						-- dont want ButtonFacade to use Count field, since it places it at bottom center of button
						if LBF then 
							frameitem.buttonfacadeGroup:AddButton(button,{Count=false})
						end
						
						-- set the position of the button, and its time
						DebuffFilter_SetButtonLayout(player_config, frameitem.frame, buttons, width);
					end

					-- make time visible and have it updated every second, if debuff/buff has a time, and if
					-- user does not want the cooldown appearing on debuff/buff, similar to a clock
					if duration and duration > 0 and not DebuffFilter.PlayerConfig.General.cooldowncount and not button.isTimeVisible then
						button:SetScript("OnUpdate",DebuffFilter_Button_OnUpdate);
						button.isTimeVisible = true;
					elseif (not duration or duration == 0 or DebuffFilter.PlayerConfig.General.cooldowncount) and button.isTimeVisible then
						button:SetScript("OnUpdate",nil);
						button.isTimeVisible = false;
					end
					
					if isdebuff then button.border:SetVertexColor(color.r, color.g, color.b) end
					-- set number of same debuffs/buffs, that are combined, to zero
					button.count2:SetText("");
					DebuffFilter_ShowButton(button, i, texture, applications, duration, expiretime, target);

					already_seen_debuffs[nametexture] = width;
				end
			end
		end
		i = i + 1;
		if isdebuff then
			name, _, texture, applications, debufftype, duration, expiretime, caster = UnitDebuff(target, i);
		else
			name, _, texture, applications, debufftype, duration, expiretime, caster = UnitBuff(target, i);
		end
	end

	-- hide remaining buttons that were visible from before
	i = width + 1;
	button = buttons["button" .. i];
	while button do
		button:Hide();
		i = i + 1;
		button = buttons["button" .. i];
	end

	if (width == 0) then
		frameitem.frameCount:SetText("");
	end

	-- better to reuse this table then use up memory by creating a new one
	for k in pairs(already_seen_debuffs) do
		already_seen_debuffs[k] = nil;
	end
end

function DebuffFilter:UNIT_AURA(eventName, ...)
	local arg1 = select(1, ...)
	local argGuid = UnitGUID(arg1)
	for k, v in pairs(DebuffFilter.Frames) do
		if UnitGUID(k) == argGuid then
			DebuffFilter_Frame_Update(k, "Buffs")
			DebuffFilter_Frame_Update(k, "Debuffs")
		end
	end
end

function DebuffFilter:PLAYER_TARGET_CHANGED(eventName, ...)
	for k, v in pairs(DebuffFilter.Frames) do
		if k:sub(1,6) == "target" then
			-- if the unit the frame is on is not "target", the GUID will need to be updated so
			-- DebuffFilter_Frame_Update is not called twice
			v.Buffs.frame.targetGUID = UnitGUID(v.Buffs.frame.target)
			DebuffFilter_Frame_Update(k, "Buffs")
			v.Debuffs.frame.targetGUID = UnitGUID(v.Debuffs.frame.target)
			DebuffFilter_Frame_Update(k, "Debuffs")
		end
	end
end

function DebuffFilter:PLAYER_FOCUS_CHANGED(eventName, ...)
	for k, v in pairs(DebuffFilter.Frames) do
		if k:sub(1,5) == "focus" then
			-- if the unit the frame is on is not "focus", the GUID will need to be updated so
			-- DebuffFilter_Frame_Update is not called twice
			v.Buffs.frame.targetGUID = UnitGUID(v.Buffs.frame.target)
			DebuffFilter_Frame_Update(k, "Buffs")
			v.Debuffs.frame.targetGUID = UnitGUID(v.Debuffs.frame.target)
			DebuffFilter_Frame_Update(k, "Debuffs")
		end
	end
end

-- in combat, so show frames
function DebuffFilter:PLAYER_REGEN_DISABLED(eventName, ...)
	DebuffFilterFrame:Show();
end

-- not in combat, so hide frames
function DebuffFilter:PLAYER_REGEN_ENABLED(eventName, ...)
	DebuffFilterFrame:Hide();
end

-- update time on debuff/buff every second, while loop is used to make sure, that if the players 
-- framerate is very low, it'll still do the updates as many times as needed
function DebuffFilter_Button_OnUpdate(self, elapsed)

	self.update = self.update + elapsed;
	while (self.update >= 1) do
		DebuffFilter_SetTime(self, self.expiretime-GetTime());

		self.update = self.update - 1;
	end
end

-- update frame if the unit the frame is on has changed
function DebuffFilter_Frame_OnUpdate(self, elapsed)

	self.DebuffFilterFrameUpdate = self.DebuffFilterFrameUpdate + elapsed;
	while (self.DebuffFilterFrameUpdate >= 0.1) do
		if self.targetGUID ~= UnitGUID(self.target) then
			self.targetGUID = UnitGUID(self.target)
			DebuffFilter_Frame_Update(self.target,self.buffOrDebuff)
		end

		self.DebuffFilterFrameUpdate = self.DebuffFilterFrameUpdate - 0.1;
	end
end

-- taken from ctmod
function DebuffFilter_SetTime(button, time)
	time = floor(time or 0);

	local min, sec, timeToShow;

	if ( time >= 60 ) then
		min = floor(time/60);
		sec = time - min*60;
	else
		sec = time;
		min = 0;
	end

	timeToShow = tostring(sec)
	if min > 0 then
		if sec <= 9 then
			timeToShow = "0" .. timeToShow
		end
		timeToShow = min .. ":" .. timeToShow
	end
	if (10 >= time) then
		button.time:SetTextColor(1, 0, 0);
	else
		button.time:SetTextColor(1, 0.82, 0);
	end

	button.time:SetText(timeToShow);
end

-- reposition or redraw frame's debuffs/buffs after options have been changed
function DebuffFilter_UpdateLayout(target,buffOrDebuff)
	local button;
	local frameitem = DebuffFilter.Frames[target][buffOrDebuff];
	local layout = DebuffFilter.PlayerConfig.Frames[target][buffOrDebuff];

	local i = 1;
	button = frameitem.buttons["button"..i];
	while button do
		button:ClearAllPoints();
		DebuffFilter_SetButtonLayout(layout, frameitem.frame, frameitem.buttons, i);

		i = i + 1;
		button = frameitem.buttons["button"..i];
	end
	
	DebuffFilter_SetCountOrientation(layout, frameitem);
end

-- set the location of a debuff/buff and the location of its time
function DebuffFilter_SetButtonLayout(layout, frame, buttons, index)
	local point, relpoint, x, y;
	local grow = layout.grow;
	local per_row = layout.per_row;
	local offset = 14;
	local button = buttons["button" .. index]

	point, relpoint = DebuffFilter.Orientation[grow].point, DebuffFilter.Orientation[grow].relpoint;
	x, y = DebuffFilter.Orientation[grow].x, DebuffFilter.Orientation[grow].y;

	-- place time to the left or right of debuff/buff if debuffs/buffs are arranged vertically
	if (per_row == 1 or DebuffFilter.PlayerConfig.General.cooldowncount) then
		offset = 4;
		DebuffFilter_SetTimeOrientation(layout.time_lr, button);
	else
		DebuffFilter_SetTimeOrientation(layout.time_tb, button);
	end

	if (index > 1) then
		-- start a new row if the current one has enough debuffs/buffs
		if (mod(index, per_row) == 1 or per_row == 1) then
			if (layout.grow == "rightdown" or layout.grow == "leftdown") then
				button:SetPoint("TOP", buttons["button" .. (index-per_row)], "BOTTOM", 0, -offset);
			else
				button:SetPoint("BOTTOM", buttons["button" .. (index-per_row)], "TOP", 0, offset);
			end
		else
			DebuffFilter_SetTimeOrientation(layout.time_tb, button);
			button:SetPoint(point, buttons["button" .. (index-1)], relpoint, x, y)
		end
	else
		button:SetPoint(point, frame, point, 0, 0);
	end
end

function DebuffFilter_SetTimeOrientation(orientation, button)
	local point, relpoint, x, y;

	point, relpoint = DebuffFilter.Orientation[orientation].point, DebuffFilter.Orientation[orientation].relpoint;
	x, y = DebuffFilter.Orientation[orientation].x, DebuffFilter.Orientation[orientation].y;

	-- set the position of the time, somewhere around the debuff/buff
	if (button.time) then
		button.time:ClearAllPoints();
		button.time:SetPoint(point, button, relpoint, x, y);
	-- set the positions of the times for the debuffs/buffs of a certain frame
	else
		local time, buttonitem

		local i = 1;
		buttonitem = button["button"..i]
		while buttonitem do
			time = buttonitem.time
			time:ClearAllPoints();
			time:SetPoint(point, buttonitem, relpoint, x, y);
			
			i = i + 1;
			buttonitem = button["button"..i]
		end
	end
end

-- set the location for the number of debuffs/buffs for the frame
function DebuffFilter_SetCountOrientation(layout, frameitem)
	local grow = layout.grow;
	local per_row = layout.per_row;
	local frame = frameitem.frame;

	local count = frameitem.frameCount;
	count:ClearAllPoints();

	if (per_row > 1) then
		if (grow == "rightdown" or grow == "rightup") then
			count:SetPoint("RIGHT", frame, "LEFT", 0, 0);
		else
			count:SetPoint("LEFT", frame, "RIGHT", 0, 0);
		end
	else
		if (grow == "rightdown" or grow == "leftdown") then
			count:SetPoint("BOTTOM", frame, "TOP", 0, 8);
		else
			count:SetPoint("TOP", frame, "BOTTOM", 0, -8);
		end
	end
end

-- lock the frames, so they cannot be moved, or unlock them
-- also allows mouse events to pass through debuffs/buffs if locked
function DebuffFilter_LockFrames(lock)
	local button, i, frameitem;

	for k, v in pairs(DebuffFilter.Frames) do
		for a, b in ipairs({"Buffs","Debuffs"}) do
			frameitem = DebuffFilter.Frames[k][b]
			frameitem.frame:EnableMouse(not lock);

			i = 1;
			button = frameitem.buttons["button" .. i];
			while button do
				button:EnableMouse(not lock);

				i = i + 1;
				button = frameitem.buttons["button" .. i];
			end
		end	
	end
end

-- code was moved from OnInitialize because otherwise, the saved positions of the frames could not be loaded.
-- These saved positions are only needed when user upgrades from old version of Debuff Filter.
-- These frames are from the xml file, and the saved positions are from the game -- the game saves the positions
-- of every xml frame when user logs out.
function DebuffFilter:VARIABLES_LOADED(eventName, ...)
	
	if DebuffFilter.portingXMLframes then
		local xmlFrameName, xmlframe, frameLayout
		for a, b in pairs({target="",focus="F",player="P"}) do
			for c, buff in ipairs({"Buffs","Debuffs"}) do
				xmlFrameName = "DebuffFilter_" .. b .. buff:sub(1,-2) .. "Frame"
				xmlframe = _G[xmlFrameName]
				frameLayout = DebuffFilter.PlayerConfig.Frames[a][buff]
				if xmlframe then 
					frameLayout.anchor = {"TOPLEFT", "UIParent", "BOTTOMLEFT", xmlframe:GetLeft(), xmlframe:GetTop()}
					DebuffFilter.Frames[a][buff].frame:ClearAllPoints();
					DebuffFilter.Frames[a][buff].frame:SetPoint(unpack(frameLayout.anchor));
				end	
			end
		end
	end	
end

function DebuffFilter:OnSkin(skin, gloss, backdrop, group, button, colors)
	if group then
		DebuffFilter.PlayerConfig.ButtonFacade[group] = {skin, gloss, backdrop, colors}
	end
end
	
-- ButtonFacade won't show entries for each frame unless you create its groups in OnEnable
function DebuffFilter:OnEnable()
	local groupID, frameitem, bfOptions
	for k, v in pairs(DebuffFilter.PlayerConfig.Frames) do
		for a, b in ipairs({"Buffs","Debuffs"}) do
			if LBF then
				groupID = k.." "..b.." Frame"
				frameitem = DebuffFilter.Frames[k][b]
				frameitem.buttonfacadeGroup = LBF:Group("DebuffFilter", groupID)
				bfOptions = DebuffFilter.PlayerConfig.ButtonFacade[groupID]
				if bfOptions then
					frameitem.buttonfacadeGroup:Skin(unpack(bfOptions))
				end
			end	

			-- display the frame and its debuffs/buffs
			DebuffFilter_Frame_Update(k, b)
		end
	end

	DebuffFilter:RegisterEvent("PLAYER_TARGET_CHANGED")
	DebuffFilter:RegisterEvent("PLAYER_FOCUS_CHANGED")
	DebuffFilter:RegisterEvent("UNIT_AURA")
end

function DebuffFilter:OnInitialize()
  	-- Code that you want to run when the addon is first loaded goes here.
	DebuffFilter:DebugTrace ("OnInitialize", true)
	-- create /dfilter command that enables changing options
	DebuffFilter:RegisterChatCommand("dfilter", "SlashProcessorFunc")
	-- options tables used to create options dialog
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("DebuffFilter", options)
    self.optionsFrame = {}
    -- options tables are added to the Blizzard Interface Options panel
    self.optionsFrame.General = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DebuffFilter", "DebuffFilter", nil, "General")
    self.optionsFrame.Frames = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DebuffFilter", "Frame Layout","DebuffFilter", "Frames")
    self.optionsFrame.Buffs = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DebuffFilter", "Frame Buffs","DebuffFilter", "Buffs")
    -- configuration settings read from savedvariables folder
    self.db = LibStub("AceDB-3.0"):New("DebuffFilterDB", DebuffFilter:InitDefaults(), "Default")
	
	-- configuration for current character, as read from the savedvariables file
	DebuffFilter.PlayerConfig = self.db.char;

	-- create default target frames in configuration if they don't exist
	for a, b in ipairs({"focus","target","player","targettarget"}) do
		if DebuffFilter.PlayerConfig.Frames[b] == nil then
			DebuffFilter.PlayerConfig.Frames[b] = {}
		end	
	end
	
	-- stores whether to grab the game's saved positions, of the xml frames from the old version of Debuff Filter
	DebuffFilter.portingXMLframes = false
	-- port settings from old version of Debuff Filter
	if DebuffFilter_Config then
		local DebuffFilter_Player = (UnitName("player").." - "..GetRealmName());
		local stri, ksub
		local buffOrDebuff, target
		if DebuffFilter_Config[DebuffFilter_Player] then
			DebuffFilter.portingXMLframes = true
			for k, v in pairs(DebuffFilter_Config[DebuffFilter_Player]) do
				-- dont want to repeat code that checks what the target is, so i use ksub
				ksub = k
				if k:sub(1,4) == "all_" then
					ksub = k:sub(5)
				end

				buffOrDebuff = "Buffs"
				stri = ksub:find("debuff")
				if stri == nil then stri = ksub:find("buff") else buffOrDebuff = "Debuffs" end
				if stri == nil then
					DebuffFilter.PlayerConfig.General[k] = v
				else
					if stri == 1 then
						target = "target"
					elseif stri == 2 and ksub:sub(1,1) == "p" then
						target = "player"
					elseif stri == 2 and ksub:sub(1,1) == "f" then
						target = "focus"
					end
					if k:sub(1,4) == "all_" then
						DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff].showAllBuffs = v
					else
						if k:find("_layout") then
							for a, b in pairs(v) do
								DebuffFilter.PlayerConfig.Frames[target][buffOrDebuff][a] = b
							end	
						elseif k:find("_list") then
							for a, b in pairs(v) do
								DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff].List[a] = b
							end
						elseif k:sub(-1) == "s" then
							DebuffFilter.PlayerConfig.Buffs[target][buffOrDebuff].enabled = v
						end
					end
				end
			end
			DebuffFilter_Config[DebuffFilter_Player] = nil
		end	
	end
			
	if LBF then
		-- buttonfacade callback
		LBF:RegisterSkinCallback("DebuffFilter", self.OnSkin, self)
	end

	-- holds all widget objects, such as the frames and buttons
	DebuffFilter.Frames = {}

	DebuffFilterFrame:SetScale(DebuffFilter.PlayerConfig.General.scale)

	-- position where frames start to be placed 
	DebuffFilter.xvalues = { xvalue = 478, nextxvalue = 578};
	DebuffFilter.yvalue = 335;
	for k, v in pairs(DebuffFilter.PlayerConfig.Frames) do
		-- don't allow default target frames to be listed, don't want to allow user to delete them
		if k ~= "player" and k ~= "target" and k ~= "focus" then
			options.args.General.args.listTargetFrames.args[k] = newTargetFrameName
		end
		-- create entries for target frames in dropdown menus
		options.args.Frames.args[k] = frameLayoutTabs
		options.args.Buffs.args[k] = frameBuffsTabs
		DebuffFilter.Frames[k] = {}
		for a, b in ipairs({"Buffs","Debuffs"}) do
			DebuffFilter:createFrame(k, b)
		end
		DebuffFilter:adjustAnchorPoints()
	end

	if (DebuffFilter.PlayerConfig.General.lock) then
		DebuffFilter_LockFrames(true);
	end

	if (DebuffFilter.PlayerConfig.General.combat) then
		DebuffFilter:RegisterEvent("PLAYER_REGEN_DISABLED");
		DebuffFilter:RegisterEvent("PLAYER_REGEN_ENABLED");

		if (not UnitAffectingCombat("player")) then
			DebuffFilterFrame:Hide();
		end
	end

	DebuffFilter:RegisterEvent("VARIABLES_LOADED")

	DebuffFilter:DebugTrace ("OnInitialize")
end

function DebuffFilter:createFrame(target, buff)
	local frames = DebuffFilter.PlayerConfig.Frames
	local frameitem, frameLayout
	
	DebuffFilter.Frames[target][buff] = {}
	frameitem = DebuffFilter.Frames[target][buff]

	-- stores already seen debuffs/buffs so that they can be combined and stacked
	frameitem.already_seen_debuffs = {}
	frameitem.buttons = {}

	frameitem.frame = CreateFrame("Frame","DebuffFilter"..target..buff,nil,"DebuffFilter_FrameTemplate");
	-- needed so that when a button is clicked, I can grab the frame's target and buff, so I can get layout information
	frameitem.frame.target = target
	frameitem.frame.buffOrDebuff = buff
	frameitem.frameBackdrop = CreateFrame("Button",nil,frameitem.frame,"DebuffFilter_BackdropTemplate");
	frameitem.frameBackdropTitle = frameitem.frameBackdrop:CreateFontString(nil,"ARTWORK","DebuffFilter_NameTemplate");
	frameitem.frameBackdropTitle:SetText(target .. " " ..buff);

	frameitem.frameCount = _G["DebuffFilter"..target..buff.."Count"];

	frameLayout = frames[target][buff]
	
	if frameLayout.anchor == nil then
		frameLayout.anchor = {"TOPLEFT","UIParent","BOTTOMLEFT",DebuffFilter.xvalues.xvalue,DebuffFilter.yvalue}
	end
	frameitem.frame:SetScale(frameLayout.scale)
	frameitem.frame:ClearAllPoints();
	frameitem.frame:SetPoint(unpack(frameLayout.anchor));
	DebuffFilter:swapXvalues()

	-- hide a frame that the player unchecked
	if (not DebuffFilter.PlayerConfig.Buffs[target][buff].enabled) then
		frameitem.frame:Hide();
	end

	if (DebuffFilter.PlayerConfig.General.backdrop) then
		frameitem.frameBackdrop:Show()
	end

	-- number of debuffs/buffs for a frame, including those not shown
	if (DebuffFilter.PlayerConfig.General.count) then
		frameitem.frameCount:Show();
	end

	-- position frameCount
	DebuffFilter_SetCountOrientation(frameLayout, frameitem);
	
	-- for targets other than these default ones, I cannot tell if the unit, that the frame is on, has changed.
	-- So I needed to create an OnUpdate script for these frames.
	if target ~= "player" and target ~= "target" and target ~= "focus" then
		frameitem.frame.DebuffFilterFrameUpdate = 0
		frameitem.frame.targetGUID = UnitGUID(target)
		frameitem.frame:SetScript("OnUpdate",DebuffFilter_Frame_OnUpdate)
	end
end

function DebuffFilter:SlashProcessorFunc(input)
	DebuffFilter:DebugTrace ("SlashProcessorFunc", true)
  	-- Process the slash command ('input' contains whatever follows the slash command)
	if not input or input:trim() == "" then
		-- open addon's options in the Blizzard Interface Options panel, allow option
		-- to open standalone configuration window to be visible
		options.args.General.args.config.hidden = false
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame.General)
	elseif input == "help" then
		DEFAULT_CHAT_FRAME:AddMessage("Debuff Filter commands:");
		DEFAULT_CHAT_FRAME:AddMessage("/dfilter: display the configuration menu in Blizzard's Interface Options panel.");
		DEFAULT_CHAT_FRAME:AddMessage("/dfilter |cff00ccffdialog|r: display configuration menu in a standalone panel.");
		DEFAULT_CHAT_FRAME:AddMessage("To move the frames, shift+left click and drag a backdrop or a monitored debuff/buff.");
		DEFAULT_CHAT_FRAME:AddMessage("To change a time orientation, ctrl+right click.");
	elseif input == "dialog" then
		DebuffFilter:OpenConfigDialog()
	end
	DebuffFilter:DebugTrace ("SlashProcessorFunc")
end

-- this is a standalone dialog, it can be resized and moved, so user can see his config changes
function DebuffFilter:OpenConfigDialog()
	InterfaceOptionsFrame:Hide()
	options.args.General.args.config.hidden = true
	if DebuffFilter.Container == nil then DebuffFilter.Container = LibStub("AceGUI-3.0"):Create("Frame") end
	LibStub("AceConfigDialog-3.0"):Open("DebuffFilter",DebuffFilter.Container)
end