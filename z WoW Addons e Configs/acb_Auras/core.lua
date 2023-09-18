local sort = sort;
local GetTime = GetTime;
local UnitAura = UnitAura;
local FormatTime = AzCastBar.FormatTime;
local LWE = LibWeaponEnchant;

-- Extra Options
local extraOptions = {
	{
		[0] = "Filtering",
		-- override default options
		{ var = "enabled", default = false },
		{ var = "unit", default = "target", restrict = { "TargetAuras" } },
		{ var = "selfAurasOnly", default = true, restrict = { "TargetAuras" } },
		{ var = "showEnchants", default = false, restrict = { "TargetAuras" } },

		{ type = "Text", var = "unit", default = "player", label = "Watched Unit", y = 20 },
		{ type = "Check", var = "showBuffs", default = true, label = "Show Buffs" },
		{ type = "Check", var = "showDebuffs", default = true, label = "Show Debuffs" },
		{ type = "Check", var = "showEnchants", default = true, label = "Show Temporary Weapon Enchants (Player Only)" },
		{ type = "Check", var = "showTracking", default = false, label = "Show Active Tracking Type (Player Only)", y = 12 },
		{ type = "Check", var = "selfAurasOnly", default = false, label = "Show Auras Coming from You" },
		{ type = "Check", var = "showPetAuras", default = false, label = "Show Pet and Vehicle Auras", y = 12 },
		{ type = "Check", var = "showStealable", default = false, label = "Show Stealable Buffs", y = 16 },
		{ type = "DropDown", var = "auraLabelFormat", default = "FULL", label = "Aura Label Format", list = { ["Name & Stack"] = "FULL", ["Name Only"] = "NAME", ["Stack Only"] = "STACK" } },
	},
	{
		[0] = "Colors",
		{ type = "Check", var = "defaultDebuffColors", default = true, label = "Use the Default Debuff Colors", y = 12 },
		{ type = "Slider", var = "bgColorAlpha", default = 0.2, label = "Background Color Alpha", min = 0, max = 1, step = 0.01, y = 20 },
		{ type = "Color", var = "colBuff", default = { 0.4, 0.6, 0.8 }, label = "Buff & Tracking Color" },
		{ type = "Color", var = "colDebuff", default = { 1.0, 0.5, 0.5 }, label = "Debuff Color" },
		{ type = "Color", var = "colTimeOut", default = { 0.8, 0.8, 0.2 }, label = "Buff Timeout Color" },
		{ type = "Color", var = "colEnchant", default = { 0.6, 0.2, 0.9 }, label = "Temporary Weapon Enchant Color", y = 12 },
		{ type = "Slider", var = "shortBuffDuration", default = 30, label = "Short Buff Timeout Duration", min = 0, max = 600, step = 1, y = 12 },
		{ type = "Check", var = "fullBarTimeless", default = false, label = "Show full bar for auras with no duration" },
	},
	{
		[0] = "Blizzard",
		{ type = "Check", var = "hideAuras", default = false, label = "Hide Default Aura Frame", restrict = { "PlayerAuras" } },
		{ type = "Check", var = "hideEnchants", default = false, label = "Hide Default Temporary Enchant Frame", restrict = { "PlayerAuras" } },
		{ type = "Check", var = "hideTracking", default = false, label = "Hide Default Tracking Frame", restrict = { "PlayerAuras" } },
	},
};

-- Variables
local events = {};
local auraPriority = { ENCHANT = 1, TRACKING = 2, HELPFUL = 3, HARMFUL = 4 };
local updateInterval = 1 / 60;

-- Debuff Colors
local DebuffColors = {};
for type, color in next, DebuffTypeColor do
	DebuffColors[type] = { color.r, color.g, color.b };
end

--------------------------------------------------------------------------------------------------------
--                                            Frame Scripts                                           --
--------------------------------------------------------------------------------------------------------

-- OnUpdate
local function OnUpdate(self,elapsed)
	-- Update Limiter
	self.nextUpdate = (self.nextUpdate - elapsed);
	if (self.nextUpdate > 0) then
		return;
	end
	self.nextUpdate = updateInterval;
	-- Update Bar
	local timer = self.timer;
	self.timeLeft = (timer.endTime - GetTime());
	if (self.timeLeft < 0) then
		self.timeLeft = 0;
	end
	self.status:SetValue(self.timeLeft);
	self:SetTimeText(self.timeLeft);
	-- Change to TimeOut Color
	if (self.colorTimeoutFlag) and (self.timeLeft <= self.colorTimeoutFlag) then
		self.colorTimeoutFlag = nil;
		self.status:SetStatusBarColor(unpack(self.cfg.colTimeOut));
		if (self.cfg.bgColorAlpha > 0) then
			self.bg:SetVertexColor(unpack(self.cfg.colTimeOut));
			self.bg:SetAlpha(self.cfg.bgColorAlpha);
		end
	end
end

-- OnClick
local function OnClick(self,button)
	if (self.cfg.unit == "player") then
		local timer = self.timer;
		if (timer.type == "ENCHANT") then
			CancelItemTempEnchantment(timer.slot - 15);
		elseif (timer.type == "TRACKING") then
			ToggleDropDownMenu(1,nil,MiniMapTrackingDropDown,"cursor",0,-5);
		else
			CancelUnitBuff(self.cfg.unit,timer.index,timer.type);
		end
	end
end

-- OnEnter
local function OnEnter(self)
	local timer = self.timer;
	GameTooltip:SetOwner(self,AzCastBar.GetOptimalAnchor(self));
	if (timer.type == "ENCHANT") then
		GameTooltip:SetInventoryItem("player",timer.slot);
	elseif (timer.type == "TRACKING") then
		GameTooltip:SetTracking();
	else
		GameTooltip:SetUnitAura(self.cfg.unit,timer.index,timer.type);
		local _, _, _, _, _, _, _, casterUnit = UnitAura(self.cfg.unit,timer.index,timer.type);
		if (casterUnit) then
			GameTooltip:AddLine("<Applied by "..tostring(UnitName(casterUnit))..">",0.4,0.72,1);
			GameTooltip:Show();
		end
	end
end

-- OnLeave
local function HideGTT()
	GameTooltip:Hide();
end

--------------------------------------------------------------------------------------------------------
--                                          Helper Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Sort Auras
local function SortAurasFunc(a,b)
	if (a.type == b.type) then
		if (a.type == "ENCHANT") then
			return a.slot < b.slot;
		elseif (a.endTime == b.endTime) then
			return a.label < b.label;
		elseif (a.endTime == 0 or b.endTime == 0) then
			return a.endTime == 0;
		else
			return a.endTime > b.endTime;
		end
	else
		return auraPriority[a.type] < auraPriority[b.type];
	end
end

-- Removes All Entries of the Given Type
local function RemoveTableType(tbl,type)
	for i = #tbl, 1, -1 do
		if (tbl[i].type == type) then
			tbl:RecycleIndex(i);
		end
	end
end

-- Query Auras
local function QueryAuras(timers,unit,auraType,showSelfAuras,showPetAuras,showStealable)
	local index = 1;
	local isFiltered = (showSelfAuras or showPetAuras or showStealable);
	while (1) do
		local name, rank, icon, count, debuffType, duration, endTime, casterUnit, isStealable = UnitAura(unit,index,auraType);
		if (not name) then
			break;
		elseif (not isFiltered) or (showStealable and isStealable) or (showSelfAuras and casterUnit == "player") or (showPetAuras and (casterUnit == "pet" or casterUnit == "vehicle")) then
			local tbl = timers:Fetch();
			tbl.label = name; tbl.icon = icon; tbl.duration = duration; tbl.endTime = endTime; tbl.type = auraType; tbl.index = index; tbl.count = count; tbl.debuffType = debuffType;
		end
		index = (index + 1);
	end
end

-- Callback Function for LibWeaponEnchant
local function UpdateEnchantTimers(self,mhSlot,mhEnchant,mhDuration,mhEndTime,ohSlot,ohEnchant,ohDuration,ohEndTime)
	RemoveTableType(self.timers,"ENCHANT");
	if (mhEnchant) then
		local tbl = self.timers:Fetch();
		tbl.label = mhEnchant; tbl.icon = GetInventoryItemTexture("player",mhSlot); tbl.duration = mhDuration; tbl.endTime = mhEndTime; tbl.type = "ENCHANT"; tbl.slot = mhSlot;
	end
	if (ohEnchant) then
		local tbl = self.timers:Fetch();
		tbl.label = ohEnchant; tbl.icon = GetInventoryItemTexture("player",ohSlot); tbl.duration = ohDuration; tbl.endTime = ohEndTime; tbl.type = "ENCHANT"; tbl.slot = ohSlot;
	end
	self:UpdateTimers();
end

--------------------------------------------------------------------------------------------------------
--                                               Events                                               --
--------------------------------------------------------------------------------------------------------

-- OnEvent
local function OnEvent(self,event,...)
	events[event](self,event,...);
end

-- Tracking Update -- [Fixed in 3.1] When going from a "spell" type tracking to "None", tracking data still hasn't updated on the MINIMAP_UPDATE_TRACKING event. But it will trigger a UNIT_AURA event.
function events:MINIMAP_UPDATE_TRACKING(event,button,...)
	RemoveTableType(self.timers,"TRACKING");
	local name, texture, active;
	for i = 1, GetNumTrackingTypes() do
		name, texture, active = GetTrackingInfo(i);
		if (active) then
			break;
		end
	end
	local tbl = self.timers:Fetch();
	tbl.label = (active and name or NONE); tbl.icon = GetTrackingTexture(); tbl.duration = 0; tbl.endTime = 0; tbl.type = "TRACKING";
	self:UpdateTimers();
end

-- Aura Update
function events:UNIT_AURA(event,unit)
	if (unit == self.cfg.unit) then
		if (self.cfg.showBuffs) then
			RemoveTableType(self.timers,"HELPFUL");
			QueryAuras(self.timers,unit,"HELPFUL",self.cfg.selfAurasOnly,self.cfg.showPetAuras,self.cfg.showStealable);
		end
		if (self.cfg.showDebuffs) then
			RemoveTableType(self.timers,"HARMFUL");
			QueryAuras(self.timers,unit,"HARMFUL",self.cfg.selfAurasOnly,self.cfg.showPetAuras,self.cfg.showStealable);
		end
		self:UpdateTimers();
	end
end

-- Pet Changed -- Only check when player's pet change
function events:UNIT_PET(event,unit)
	if (unit == "player") then
		self:ScanAllAuras();
	end
end

-- Focus + Target Changed
function events:PLAYER_TARGET_CHANGED(event,...)
	self:ScanAllAuras();
end
events.PLAYER_FOCUS_CHANGED = events.PLAYER_TARGET_CHANGED;

--------------------------------------------------------------------------------------------------------
--                                                Code                                                --
--------------------------------------------------------------------------------------------------------

-- Configure Bar
local function ConfigureBar(self,bar)
	bar = (bar or self);
	bar:EnableMouse(1);
	bar:RegisterForClicks("RightButtonUp");
	bar:SetScript("OnClick",OnClick);
	bar:SetScript("OnEnter",OnEnter);
	bar:SetScript("OnLeave",HideGTT);
	return bar;
end

-- Update Timers
local function UpdateTimers(self)
	sort(self.timers,SortAurasFunc);
	-- Update Timer Bars
	for index, timer in ipairs(self.timers) do
		local bar = self.bars[index] or self:ConfigureBar(AzCastBar.CreateBar("Button",self));
		bar.timer = timer;
		bar.totalTimeText = (self.cfg.showTotalTime) and (timer.duration > 0) and (" / "..FormatTime(timer.duration)) or nil;
		bar.colorTimeoutFlag = (timer.type == "HELPFUL") and (self.cfg.shortBuffDuration > 0) and (timer.duration > self.cfg.shortBuffDuration) and (self.cfg.shortBuffDuration) or nil;
		bar.status:SetMinMaxValues(0,timer.duration == 0 and 1 or timer.duration);
		local color;
		if (self.cfg.defaultDebuffColors) and (timer.type == "HARMFUL") then
			color = DebuffColors[timer.debuffType] or DebuffColors["none"];
		elseif (timer.type == "HELPFUL") then
			color = (timer.duration > 0 and timer.duration <= self.cfg.shortBuffDuration and self.cfg.colTimeOut) or (self.cfg.colBuff);
		else
			color = (timer.type == "ENCHANT" and self.cfg.colEnchant) or (timer.type == "HARMFUL" and self.cfg.colDebuff) or (self.cfg.colBuff);
		end
		bar.status:SetStatusBarColor(unpack(color));
		if (self.cfg.bgColorAlpha > 0) then
			bar.bg:SetVertexColor(unpack(color));
			bar.bg:SetAlpha(self.cfg.bgColorAlpha);
		else
			bar.bg:SetVertexColor(unpack(self.cfg.colBackGround));
		end
		if (timer.duration == 0) then
			bar.time:SetText("");
			bar.status:SetValue(self.cfg.fullBarTimeless and 1 or 0);
			bar:SetScript("OnUpdate",nil);
		else
			bar:SetScript("OnUpdate",OnUpdate);
		end
		if (self.cfg.auraLabelFormat == "STACK") then
			bar.name:SetFormattedText(timer.count and timer.count > 1 and "%d" or "",timer.count);
		else
			bar.name:SetFormattedText(timer.count and timer.count > 1 and self.cfg.auraLabelFormat == "FULL" and "%s (%d)" or "%s",timer.label,timer.count);
		end
		bar.icon:SetTexture(timer.icon);
		bar.nextUpdate = 0;
		bar:Show();
		if (GameTooltip:IsOwned(bar)) then
			OnEnter(bar);
		end
	end
	-- Hide all other frames
	for i = #self.timers + 1, #self.bars do
		self.bars[i]:Hide();
	end
end

-- Scan Unit Auras
local function ScanAllAuras(self)
	if (self.cfg.unit == "player" and self.cfg.showEnchants) then
		UpdateEnchantTimers(self,LWE.GetEnchantData());
	end
	if (self.cfg.unit == "player" and self.cfg.showTracking) then
		events.MINIMAP_UPDATE_TRACKING(self,"MINIMAP_UPDATE_TRACKING");
	end
	if (self.cfg.showBuffs or self.cfg.showDebuffs) then
		events.UNIT_AURA(self,"UNIT_AURA",self.cfg.unit);
	end
	self:UpdateTimers();
end

-- OnConfigChanged -- Enable/Disable Plugin & Blizz Buff Frames
local function OnConfigChanged(self,cfg)
	-- Configure Ourself
	self.timers:Recycle();
	self:UnregisterAllEvents();
	LWE.UnregisterCallback(self);
	if (cfg.enabled) then
		if (cfg.showBuffs or cfg.showDebuffs) then
			self:RegisterEvent("UNIT_AURA");
			if (cfg.unit == "target") then
				self:RegisterEvent("PLAYER_TARGET_CHANGED");
			elseif (cfg.unit == "focus") then
				self:RegisterEvent("PLAYER_FOCUS_CHANGED");
			elseif (cfg.unit == "pet") then
				self:RegisterEvent("UNIT_PET");
			end
		end
		if (cfg.unit == "player") then
			if (cfg.showTracking) then
				self:RegisterEvent("MINIMAP_UPDATE_TRACKING");
			end
			if (cfg.showEnchants) then
				LWE.RegisterCallback(self,UpdateEnchantTimers);
			end
		end
		self:ScanAllAuras();
	else
		self:UpdateTimers();
	end
	-- Blizzard UI Fixup -- Player unit only -- PlayerAuras bar only
	if (cfg.unit == "player") and (self.token == "PlayerAuras") and (cfg.enabled) then
		-- BuffFrame
		if (cfg.hideAuras) then
			BuffFrame:UnregisterEvent("UNIT_AURA");
			BuffFrame:Hide();
		else
			BuffFrame:RegisterEvent("UNIT_AURA");
			BuffFrame:Show();
			if (BuffFrame:GetScript("OnEvent")) then
				BuffFrame:GetScript("OnEvent")(BuffFrame,"UNIT_AURA","player");
			end
		end
		-- TempEnchantFrame
		if (cfg.hideEnchants) then
			TemporaryEnchantFrame:Hide();
		else
			TemporaryEnchantFrame:Show();
		end
		-- MiniMapTracking
		if (cfg.hideTracking) then
			MiniMapTracking:Hide();
			MiniMapTrackingButton:UnregisterEvent("MINIMAP_UPDATE_TRACKING");
		else
			MiniMapTracking:Show();
			MiniMapTrackingButton:RegisterEvent("MINIMAP_UPDATE_TRACKING");
			MiniMapTracking_Update();
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                          Initialise Plugin                                         --
--------------------------------------------------------------------------------------------------------

-- Spawns a new Aura Plugin
local function SpawnAuraPlugin(token)
	local bar = AzCastBar.CreateMainBar("Button",token,extraOptions,true);
	bar.ConfigureBar = ConfigureBar;
	bar.UpdateTimers = UpdateTimers;
	bar.ScanAllAuras = ScanAllAuras;
	bar.OnConfigChanged = OnConfigChanged;

	bar.timers = LibTableRecycler:New();
	bar:ClearAllPoints();
	bar:SetPoint("CENTER");
	bar:SetScript("OnEvent",OnEvent);
	bar:ConfigureBar();
end

-- You can spawn any amount of aura plugins here, besides the default PlayerAuras & TargetAuras. Just make sure to call them something unique
SpawnAuraPlugin("PlayerAuras");
SpawnAuraPlugin("TargetAuras");