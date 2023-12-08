--[[--------------------------------------------------------------------
	PhanxConfig-Checkbox
	Simple checkbox widget generator.
	Based on tekKonfig-Checkbox by Tekkub.
	Requires LibStub.

	This library is not intended for use by other authors. Absolutely no
	support of any kind will be provided for other authors using it, and
	its internals may change at any time without notice.
----------------------------------------------------------------------]]

local MINOR_VERSION = tonumber(("$Revision: 28 $"):match("%d+"))

local lib, oldminor = LibStub:NewLibrary("PhanxConfig-Checkbox", MINOR_VERSION)
if not lib then return end

local function OnEnter(self)
	if self.desc then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(self.desc, nil, nil, nil, nil, true)
	end
end

local function OnLeave()
	GameTooltip:Hide()
end

local function OnClick(self)
	local checked = self:GetChecked() == 1
	PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
	if self.OnClick then
		self.OnClick(self, checked)
	end
end

function lib.CreateCheckbox(parent, text, size)
	local check = CreateFrame("CheckButton", nil, parent)
	check:SetWidth(size or 26)
	check:SetHeight(size or 26)

	check:SetHitRectInsets(0, -100, 0, 0)

	check:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
	check:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
	check:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
	check:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	check:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

	check:SetScript("OnEnter", OnEnter)
	check:SetScript("OnLeave", OnLeave)
	check:SetScript("OnClick", OnClick)

	local label = check:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	label:SetPoint("LEFT", check, "RIGHT", 0, 1)
	label:SetText(text)

	check.label = label

	return check
end