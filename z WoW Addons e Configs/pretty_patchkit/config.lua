local namespace = select(2,...);

local _G = _G;
local getmetatable = getmetatable;
local tonumber = tonumber;
local GameTooltip = GameTooltip;
local GetName = GetName;
local GetText = GetText;

local iLvlColors = namespace.iLvlColors;
local variables_loaded = namespace.variables_loaded;

function namespace.itemLevelMixInGetColor(itemLevel)
	local color

	if C_InRange(itemLevel, 0, 100) then
		color = iLvlColors[1];
	elseif C_InRange(itemLevel, 100, 150) then
		color = iLvlColors[1];
	elseif C_InRange(itemLevel, 150, 185) then
		color = iLvlColors[2];
	elseif C_InRange(itemLevel, 185, 200) then
		color = iLvlColors[3];
	elseif C_InRange(itemLevel, 200, 277) then
		color = iLvlColors[4];
	elseif C_InRange(itemLevel, 277, 296) then
		color = iLvlColors[5];
	elseif itemLevel >= 297 then
		color = iLvlColors[6];
	end

	return color;
end

local function findHeirloomilvl()
	local line = "";
	for i = 2, GameTooltip:NumLines() do
		line = _G[GameTooltip:GetName().."TextLeft"..i];
		if (line) then
			line = line:GetText();
			if (line) then
				if (line:match(HEIRLOOMILVL)) then
					return tonumber(line:match("%d+"));
				end
			end
		end
	end
end
namespace.findHeirloomilvl = findHeirloomilvl;

local configPanel = CreateFrame("Frame", "prettyManagerPanel", InterfaceOptionsFramePanelContainer);
configPanel.name = "|cff31ccff*|r |cffff9999patch kit|r";

local function setCheckbox(label, description, onClick)
	local check = CreateFrame("CheckButton", "prettyManagerCheck"..label, configPanel, "InterfaceOptionsCheckButtonTemplate");
	check:SetScript("OnClick", function(self)
		PlaySound(self:GetChecked() and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff");
		onClick(self, self:GetChecked() and true or false);
		cleanUpiLvl();
	end);
	check.label = _G[check:GetName().."Text"];
	check.label:SetText(label);
	check.tooltipText = label;
	check.tooltipRequirement = description;
	
	check.Disable = function(self)
		getmetatable(self).__index.Disable(self)
		check.label:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	end
	check.Enable = function(self)
		getmetatable(self).__index.Enable(self);
		local fontObject = check.label:GetFontObject();
		check.label:SetTextColor(fontObject:GetTextColor());
	end
	return check;
end

-- local title_name = "|cffccff99GearScore|r |cff31ccff&|r |cffff9999Item Level|r";

-- create config panel;
local function config_loaded()
	if (variables_loaded) then return; end
	variables_loaded = true;
	
	-- SavedVariables;
	if (_data == nil) then _data = {}; end
	
	-- default settings;
	if (_data.enableConfig == nil) then _data.enableConfig = true; end
	if (_data.upgrades == nil) then _data.upgrades = false; end
	if (_data.enableChar == nil) then _data.enableChar = true; end
	if (_data.enchantChar == nil) then _data.enchantChar = true; end
	if (_data.enchantCharMiss == nil) then _data.enchantCharMiss = true; end
	if (_data.gemsChar == nil) then _data.gemsChar = true; end
	if (_data.ilvlChar == nil) then _data.ilvlChar = true; end
	if (_data.enableInspect == nil) then _data.enableInspect = true; end
	if (_data.iLvlScore == nil) then _data.iLvlScore = true; end
	if (_data.GearScore == nil) then _data.GearScore = false; end
	if (_data.tooltipScore == nil) then _data.tooltipScore = true; end
	if (_data.itemLvlTip == nil) then _data.itemLvlTip = true; end
	if (_data.compare == nil) then _data.compare = true; end
	if (_data.resist == nil) then _data.resist = true; end
	if (_data.GearScoreFormat == nil) then _data.GearScoreFormat = true; end
	if (_data.itemLevelColors == nil) then _data.itemLevelColors = true; end
	if (_data.UnassignedSpellBorderCheckBox == nil) then _data.UnassignedSpellBorderCheckBox = 1; end
	
	RegisterCVar("ShowSpellUnassignedBorder", _data.UnassignedSpellBorderCheckBox);
	
	-- titles;
	local title = configPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
	title:SetPoint("TOPLEFT", 16, -16);
	title:SetText(configPanel.name);

	local subtitle = configPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
	subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8);
	subtitle:SetPoint("RIGHT", -32, 0);
	subtitle:SetHeight(52);
	subtitle:SetJustifyH("LEFT");
	subtitle:SetJustifyV("TOP");
	subtitle:SetText(CONFIG_SUBTITLE);
	
	local reqtitle = configPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
	reqtitle:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, 6);
	reqtitle:SetPoint("RIGHT", 0, 0);
	reqtitle:SetHeight(40);
	reqtitle:SetJustifyH("LEFT");
	reqtitle:SetJustifyV("TOP");
	reqtitle:SetText(CONFIG_REQTITLE);
	
	-- widgets;
	local iLvlUpgrades = setCheckbox(CONFIG_UPGRADES,CONFIG_UPGRADES_DESC,function(self,value) _data.upgrades = value; end);
	iLvlUpgrades:SetChecked(_data.upgrades);
	iLvlUpgrades:SetPoint("TOPLEFT", reqtitle, "TOPLEFT", 0, -38);
	
	-- charkit;
	local ckEnchant = setCheckbox(CONFIG_CHARKITS_ENCH,CONFIG_CHARKITS_ENCH_DESC,function(self,value) _data.enchantChar = value; end);
	local ckMiss = setCheckbox(CONFIG_CHARKITS_ENCHMISS,CONFIG_CHARKITS_ENCHMISS_DESC,function(self,value) _data.enchantCharMiss = value; end);
	local ckGem = setCheckbox(CONFIG_CHARKITS_GEM,CONFIG_CHARKITS_GEM_DESC,function(self,value) _data.gemsChar = value; end);
	local ckiLvl = setCheckbox(CONFIG_CHARKITS_ILVL,CONFIG_CHARKITS_ILVL_DESC,function(self,value) _data.ilvlChar = value; end);
	local charKit = setCheckbox(CONFIG_CHARKITS,CONFIG_CHARKITS_DESC,
		function(self,value)
			_data.enableChar = value;
			ckEnchant:SetEnabled(value);
			ckMiss:SetEnabled(value);
			ckGem:SetEnabled(value);
			ckiLvl:SetEnabled(value);
		end);
	charKit:SetChecked(_data.enableChar);
	charKit:SetPoint("TOPRIGHT", iLvlUpgrades, "TOPRIGHT", 210, 0);
	
	ckMiss:SetEnabled(_data.enableChar);
	ckEnchant:SetEnabled(_data.enableChar);
	ckGem:SetEnabled(_data.enableChar);
	ckiLvl:SetEnabled(_data.enableChar);
	ckiLvl:SetChecked(_data.ilvlChar);
	ckiLvl:SetPoint("TOPLEFT", charKit, "BOTTOMLEFT", 15, 0);
	ckGem:SetChecked(_data.gemsChar);
	ckGem:SetPoint("TOPLEFT", ckiLvl, "BOTTOMLEFT", 0, 0);
	ckEnchant:SetChecked(_data.enchantChar);
	ckEnchant:SetPoint("TOPLEFT", ckGem, "BOTTOMLEFT", 0, 0);
	ckMiss:SetChecked(_data.enchantCharMiss);
	ckMiss:SetPoint("TOPLEFT", ckEnchant, "BOTTOMLEFT", 0, 0);

	-- inspectkit;
	local inspectKit = setCheckbox(CONFIG_INSPKITS,CONFIG_INSPKITS_DESC,
		function(self,value)
			_data.enableInspect = value;
			ikEnchant:SetEnabled(value);
			ikMiss:SetEnabled(value);
			ikGem:SetEnabled(value);
			ikiLvl:SetEnabled(value);
		end);
	inspectKit:SetChecked(_data.enableInspect);
	inspectKit:SetPoint("TOP", ckMiss, "BOTTOM", -15, -10);
	
	-- general;
	local ilvlScore = setCheckbox(CONFIG_ILVLSCORE,CONFIG_ILVLSCORE_DESC,function(self,value) _data.iLvlScore = value; end);
	ilvlScore:SetChecked(_data.iLvlScore);
	ilvlScore:SetPoint("TOPLEFT", iLvlUpgrades, "BOTTOMLEFT", 0, 0);
	
	local gsiLvl = setCheckbox(CONFIG_GSITEMSILVL,CONFIG_GSITEMSILVL_DESC,function(self,value) _data.itemLvlTip = value; end);
	gsiLvl:SetChecked(_data.itemLvlTip);
	gsiLvl:SetPoint("TOPLEFT", ilvlScore, "BOTTOMLEFT", 0, 0);
	
	local gearScore = setCheckbox(CONFIG_GEARSCORE,CONFIG_GEARSCORE_DESC,function(self,value) _data.GearScore = value; end);
	gearScore:SetChecked(_data.GearScore);
	gearScore:SetPoint("TOPLEFT", gsiLvl, "BOTTOMLEFT", 0, 0);
	
	local gsTip = setCheckbox(CONFIG_GSTOOLTIP,CONFIG_GSTOOLTIP_DESC,function(self,value) _data.tooltipScore = value; end);
	gsTip:SetChecked(_data.tooltipScore);
	gsTip:SetPoint("TOPLEFT", gearScore, "BOTTOMLEFT", 0, 0);
	
	local gsCompare = setCheckbox(CONFIG_GSCOMPARE,CONFIG_GSCOMPARE_DESC,function(self,value) _data.compare = value; end);
	gsCompare:SetChecked(_data.compare);
	gsCompare:SetPoint("TOPLEFT", gsTip, "BOTTOMLEFT", 0, 0);
	
	local resistance = setCheckbox(CONFIG_RESIST,CONFIG_RESIST_DESC,
		function(self,value)
			_data.resist = not value;
			if (_data.resist) then
				CharacterResistanceFrame:Hide();
			else
				CharacterResistanceFrame:Show();
			end
		end);
	resistance:SetPoint("TOPLEFT", gsCompare, "BOTTOMLEFT", 0, 0);
	resistance:SetChecked(not _data.resist);
	
	local iLvlColor = setCheckbox(CONFIG_COLORING,CONFIG_COLORING_DESC,function(self,value) _data.itemLevelColors = value; end);
	iLvlColor:SetChecked(_data.itemLevelColors);
	iLvlColor:SetPoint("TOPLEFT", resistance, "BOTTOMLEFT", 0, 0);
	
	local gsFormat = setCheckbox(CONFIG_GSFORMAT,CONFIG_GSFORMAT_DESC,function(self,value) _data.GearScoreFormat = value; end);
	gsFormat:SetChecked(_data.GearScoreFormat);
	gsFormat:SetPoint("TOPLEFT", iLvlColor, "BOTTOMLEFT", 0, 0);
	
	ShowUnassignedSpellBorderCheckBox:HookScript("OnClick", function(self)
		local value = self:GetChecked() and 1 or 0;
		_data.UnassignedSpellBorderCheckBox = value;
	end);
	ShowUnassignedSpellBorderCheckBox:HookScript("OnShow", function(self)
		self:SetChecked(_data.UnassignedSpellBorderCheckBox);
	end);
	
	cleanUpiLvl();
	InterfaceOptions_AddCategory(configPanel);
end
namespace.config_loaded = config_loaded;