local LibSimpleOptions = LibStub("LibSimpleOptions-1.0")
local frame = CreateFrame("FRAME");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
frame:RegisterEvent("VARIABLES_LOADED");

local function Options(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText(ELITEFRAME_NAME, ELITEFRAME_SUBTEXT)

	local EliteFrameDropDown = self:MakeDropDown(
	'name', ELITEFRAME_FRAME_DROPDOWN_NAME,
	'description', ELITEFRAME_FRAME_DROPDOWN_DESCRIPTION,
	'values', {
	'NONE', ELITEFRAME_NONE,
	'RARE', ELITEFRAME_RARE,
	'RAREELITE', ELITEFRAME_RARE_ELITE,
	'ELITE', ELITEFRAME_ELITE
	},
	'default', 'ELITE',
	'getFunc', function() return EliteFrameConfig.Portrait end,
	'setFunc', function(value) EliteFrameConfig.Portrait = value 
	EliteFrame_OnPortraitChange(); end
	)
	local EliteFrameCheckBox = self:MakeToggle(
	'name', ELITEFRAME_ADJUST_CHECKBOX_NAME,
	'description', ELITEFRAME_ADJUST_CHECKBOX_DESCRIPTION,
	'default', true,
	'getFunc', function() return EliteFrameConfig.Adjust end,
	'setFunc', function(value) EliteFrameConfig.Adjust = value 
	EliteFrame_Adjust(); end
	)
EliteFrameDropDown:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25);
EliteFrameCheckBox:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 15, -50);
end

function EliteFrame_OnPortraitChange()
	if EliteFrameConfig.Portrait == "NONE" then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame.blp"); end
	if EliteFrameConfig.Portrait == "RARE" then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare.blp"); end
	if EliteFrameConfig.Portrait == "RAREELITE" then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp"); end
	if EliteFrameConfig.Portrait == "ELITE" then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp"); end
end

function EliteFrame_MakeConfig()
	if EliteFrameConfig == nil then
		EliteFrameConfig = {};
		EliteFrameConfig.Portrait = 'ELITE';
		EliteFrameConfig.Adjust = true;
	end
end

function EliteFrame_Adjust()
	if EliteFrameConfig.Adjust == true
		then PlayerFrame:ClearAllPoints();
		PlayerFrame:SetPoint("TOPLEFT", 0, -4);
	end
	if EliteFrameConfig.Adjust == false
		then PlayerFrame:ClearAllPoints();
		PlayerFrame:SetPoint("TOPLEFT", -19, -4);
	end
end

function frame:OnEvent(event)
	if event == "VARIABLES_LOADED" then
		EliteFrame_MakeConfig();
		EliteFrame_OnPortraitChange();
		LibSimpleOptions.AddOptionsPanel("EliteFrame", function(self) Options(self, anchor) end);
		LibSimpleOptions.AddSlashCommand("EliteFrame", "/eliteframe");
	end
	if event == "PLAYER_ENTERING_WORLD" then
		EliteFrame_Adjust(); 
	end
end

frame:SetScript("OnEvent", frame.OnEvent);
