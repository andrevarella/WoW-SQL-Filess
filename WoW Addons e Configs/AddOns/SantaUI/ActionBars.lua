local AddOn = CreateFrame("Frame")
local OnEvent = function(self, event, ...) self[event](self, event, ...) end
AddOn:SetScript("OnEvent", OnEvent)

-- Hide graphics
for _, frame in ipairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap, MainMenuBarPageNumber, MainMenuXPBarTexture2, MainMenuXPBarTexture3, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar2, MainMenuMaxLevelBar3, CharacterBag0Slot, CharacterBag1Slot, CharacterBag2Slot, CharacterBag3Slot}) do
		frame:Hide()
end

for _, texture in ipairs({ReputationWatchBarTexture2, ReputationWatchBarTexture3, ReputationXPBarTexture2, ReputationXPBarTexture3, MainMenuBarTexture0, MainMenuBarTexture1, ReputationWatchBarTexture0, ReputationWatchBarTexture1, ReputationXPBarTexture0, ReputationXPBarTexture1, MainMenuBarLeftEndCap, MainMenuBarRightEndCap, MainMenuXPBarTexture0, MainMenuXPBarTexture1, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, PossessBackground1, PossessBackground2, BonusActionBarTexture0, BonusActionBarTexture1}) do
	texture:SetTexture(nil)
end

ShapeshiftBarLeft:SetAlpha(0); ShapeshiftBarRight:SetAlpha(0); ShapeshiftBarMiddle:SetAlpha(0)

-- Scaling
MainMenuBar:SetScale(0.95)
MultiBarBottomLeft:SetScale(0.95); MultiBarBottomRight:SetScale(0.95)
MultiBarRight:SetScale(0.9); MultiBarLeft:SetScale(0.9)

-- Bottom right actionbar
MultiBarBottomRight:ClearAllPoints()
MultiBarBottomRight:SetPoint("BOTTOM", 250, 4)

-- Experience bar
MainMenuExpBar:SetScale(0.8)
MainMenuExpBar:SetWidth(1250)
ReputationWatchBar:SetScale(0.8)
ReputationWatchBar:SetWidth(1250)
ReputationWatchStatusBar:SetWidth(1250)

-- Paging
ActionBarUpButton:SetPoint("LEFT", -22, 5)
ActionBarUpButton:SetAlpha(0.7)
ActionBarDownButton:SetPoint("LEFT", -22, -16)
ActionBarDownButton:SetAlpha(0.7)

-- Bags
MainMenuBarBackpackButton:SetScript("OnClick", function(self, RightButton)
	OpenAllBags()
	BackpackButton_UpdateChecked(self)
	ContainerFrame1:SetScale(0.85); ContainerFrame2:SetScale(0.85);	ContainerFrame3:SetScale(0.85);	ContainerFrame4:SetScale(0.85);	ContainerFrame5:SetScale(0.85)
end)

MainMenuBarBackpackButton:ClearAllPoints()
MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -4, 4)
MainMenuBarBackpackButton:SetScale(0.7)
MainMenuBarBackpackButton:SetAlpha(0.6)
KeyRingButton:SetScale(0.01)

-- Micro menu
local function PLAYER_ENTERING_WORLD()
	CharacterMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint("BOTTOMLEFT", "Minimap", "BOTTOMLEFT", -15, -65)
end

do
	local b = {
		"CharacterMicroButton",
		"SpellbookMicroButton",
		"TalentMicroButton",
		"AchievementMicroButton",
		"QuestLogMicroButton",
		"SocialsMicroButton",
		"PVPMicroButton",
		"LFDMicroButton",
		"MainMenuMicroButton",
		"HelpMicroButton"
		}
	for k, v in pairs(b) do
		_G[v]:SetScale(0.6)
		_G[v]:SetAlpha(0)
	end
end

-- Show/hide micro menu on mouseover
local microMouseOver = function(frame)
	local microshow = function()
		CharacterMicroButton:SetAlpha(1)
		SpellbookMicroButton:SetAlpha(1)
		TalentMicroButton:SetAlpha(1)
		AchievementMicroButton:SetAlpha(1)
		QuestLogMicroButton:SetAlpha(1)
		SocialsMicroButton:SetAlpha(1)
		PVPMicroButton:SetAlpha(1)
		LFDMicroButton:SetAlpha(1)
		MainMenuMicroButton:SetAlpha(1)
		HelpMicroButton:SetAlpha(1)
	end

	local microhide = function()
		CharacterMicroButton:SetAlpha(0)
		SpellbookMicroButton:SetAlpha(0)
		TalentMicroButton:SetAlpha(0)
		AchievementMicroButton:SetAlpha(0)
		QuestLogMicroButton:SetAlpha(0)
		SocialsMicroButton:SetAlpha(0)
		PVPMicroButton:SetAlpha(0)
		LFDMicroButton:SetAlpha(0)
		MainMenuMicroButton:SetAlpha(0)
		HelpMicroButton:SetAlpha(0)
	end

	frame:EnableMouse(true)
	frame:HookScript("OnEnter", microshow)
	frame:HookScript("OnLeave", microhide)
end

microMouseOver(CharacterMicroButton)
microMouseOver(SpellbookMicroButton)
microMouseOver(TalentMicroButton)
microMouseOver(AchievementMicroButton)
microMouseOver(QuestLogMicroButton)
microMouseOver(SocialsMicroButton)
microMouseOver(PVPMicroButton)
microMouseOver(LFDMicroButton)
microMouseOver(MainMenuMicroButton)
microMouseOver(HelpMicroButton)

-- Ghetto fix for the micro menu resetting it's postition sometimes
local f = CreateFrame("Frame", UIParent)
f:SetHeight(20)
f:SetWidth(140)
f:SetPoint("BOTTOMLEFT", "Minimap", "BOTTOMLEFT", -10, -35)

local fixMicroMenu = function(frame)
	local resetPos = function()
		CharacterMicroButton:ClearAllPoints()
		CharacterMicroButton:SetPoint("BOTTOMLEFT", "Minimap", "BOTTOMLEFT", -15, -65)
	end

	frame:EnableMouse(true)
	frame:HookScript("OnEnter", resetPos)
end

fixMicroMenu(f)

-- Show/hide frame on mouseover
local enableMouseOver = function(frame, includeChildren)
	local show = function()
		frame:SetAlpha(1)
	end

	local hide = function()
		frame:SetAlpha(0)
	end
	
	if includeChildren then
			for _, child in ipairs({frame:GetChildren()}) do
				child:HookScript("OnEnter", show)
				child:HookScript("OnLeave", hide)
			end
		end

	frame:EnableMouse(true)
	frame:HookScript("OnEnter", show)
	frame:HookScript("OnLeave", hide)
	hide()
end

enableMouseOver(MainMenuBarBackpackButton)
enableMouseOver(ActionBarUpButton)
enableMouseOver(ActionBarDownButton)
enableMouseOver(PetActionBarFrame, true)
enableMouseOver(ShapeshiftBarFrame, true)


-- Hide macro text (Credit: Thek)
do
	local a = {
		"ActionButton",
		"MultiBarBottomLeftButton",
		"MultiBarBottomRightButton",
		"MultiBarRightButton",
		"MultiBarLeftButton",
		"BonusActionButton"
		}
	for k, v in pairs(a) do
		for i = 1, 12 do
			_G[v..i.."Name"]:Hide()
		end
	end
end

AddOn:RegisterEvent("PLAYER_ENTERING_WORLD")
AddOn["PLAYER_ENTERING_WORLD"] = PLAYER_ENTERING_WORLD