-- Credit: Macca

local f = CreateFrame("Frame")

f:SetScript("OnUpdate", function(self, e)
	local Mana = UnitMana("target")
	local ManaMax = UnitManaMax("target")
	local valueM = ((Mana / ManaMax) * 100)
	TargetFrameManaBar.TextString:SetText(TextStatusBar_CapDisplayOfNumericValue(Mana))
end)