UFP = "UnitFramePortrait_Update"; UICC = "Interface\\TargetingFrame\\UI-Classes-Circles"; CIT = CLASS_ICON_TCOORDS
hooksecurefunc(UFP,function(self) if self.portrait then local t = CIT[select(2,UnitClass(self.unit))] if t then self.portrait:SetTexture(UICC) self.portrait:SetTexCoord(unpack(t)) end end end)

local UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS =
UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS
local _, class, c

local function colour(statusbar, unit)
if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
_, class = UnitClass(unit)
c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
statusbar:SetStatusBarColor(c.r, c.g, c.b)
end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
colour(self, self.unit)
end)

local sb = _G.GameTooltipStatusBar
local addon = CreateFrame("Frame", "StatusColour")
addon:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
addon:SetScript("OnEvent", function()
colour(sb, "mouseover")
end)