--[[--------------------------------------------------------------------
	PhanxConfig-Slider
	Simple slider widget generator.
	Based on tekKonfig-Slider and AceGUI-3.0-Slider.
	Requires LibStub.

	This library is not intended for use by other authors. Absolutely no
	support of any kind will be provided for other authors using it, and
	its internals may change at any time without notice.
----------------------------------------------------------------------]]

local MINOR_VERSION = tonumber(("$Revision: 28 $"):match("%d+"))

local lib, oldminor = LibStub:NewLibrary("PhanxConfig-Slider", MINOR_VERSION)
if not lib then return end

local function OnEnter(self)
	local text = self:GetParent().desc
	if text then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetText(text, nil, nil, nil, nil, true)
	end
end

local function OnLeave()
	GameTooltip:Hide()
end

local function OnMouseWheel(self, delta)
	local step = self:GetValueStep() * delta
	local minValue, maxValue = self:GetMinMaxValues()
	if step > 0 then
		self:SetValue(min(self:GetValue() + step, maxValue))
	else
		self:SetValue(max(self:GetValue() + step, minValue))
	end
end

local function OnValueChanged(self)
	local parent = self:GetParent()
	local value = parent.OnValueChanged and parent:OnValueChanged(self:GetValue())
	if not value then
		value = self:GetValue()
	end
	if parent.isPercent then
		parent.valueText:SetFormattedText(self.valueFormat or "%d%%", value * 100)
	else
		parent.valueText:SetFormattedText(self.valueFormat or "%d", value)
	end
end

local function SetText(self, text)
	return self.valueText:SetText(text)
end

local function SetValue(self, value)
	if self.isPercent then
		self.valueText:SetFormattedText(self.valueFormat or "%d%%", value * 100)
	else
		self.valueText:SetFormattedText(self.valueFormat or "%d", value)
	end

	return self.slider:SetValue(value)
end

local sliderBG = {
	bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
	edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
	edgeSize = 8, tile = true, tileSize = 8,
	insets = { left = 3, right = 3, top = 6, bottom = 6 }
}

function lib.CreateSlider(parent, name, lowvalue, highvalue, valuestep, percent)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetWidth(144)
	frame:SetHeight(42)

--	local bg = frame:CreateTexture(nil, "BACKGROUND")
--	bg:SetAllPoints(frame)
--	bg:SetTexture(0, 0, 0)

	local slider = CreateFrame("Slider", nil, frame)
	slider:SetPoint("LEFT", 5, 0)
	slider:SetPoint("RIGHT", -5, 0)
	slider:SetHeight(17)
	slider:SetHitRectInsets(0, 0, -10, -10)
	slider:SetOrientation("HORIZONTAL")
	slider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
	slider:SetBackdrop(sliderBG)

	local label = slider:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	label:SetPoint("BOTTOMLEFT", slider, "TOPLEFT")
	label:SetPoint("BOTTOMRIGHT", slider, "TOPRIGHT")
	label:SetJustifyH("LEFT")
	label:SetText(name)

	local low = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	low:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", 0, 3)
	if percent then
		low:SetFormattedText("%d%%", lowvalue * 100)
	else
		low:SetText(lowvalue)
	end

	local high = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	high:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 0, 3)
	if percent then
		high:SetFormattedText("%d%%", highvalue * 100)
	else
		high:SetText(highvalue)
	end

	local value = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	value:SetPoint("TOP", slider, "BOTTOM", 0, 3)
	value:SetTextColor(1, 0.8, 0)

	slider:EnableMouseWheel(true)
	slider:SetMinMaxValues(lowvalue, highvalue)
	slider:SetValueStep(valuestep or 1)

	slider:SetScript("OnEnter", OnEnter)
	slider:SetScript("OnLeave", OnLeave)
	slider:SetScript("OnMouseWheel", OnMouseWheel)
	slider:SetScript("OnValueChanged", OnValueChanged)

	frame.slider = slider
	frame.labelText = label
	frame.lowText = low
	frame.highText = high
	frame.valueText = value

	frame.isPercent = percent

	frame.SetText = SetText
	frame.SetValue = SetValue

	return frame
end