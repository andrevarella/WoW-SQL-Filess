CastingBarFrame:SetScale(1.1)
TargetFrameSpellBar:SetScale(1.15)
FocusFrameSpellBar:SetScale(2.1)
FocusFrameSpellBar.SetScale = function() end

-- Player castbar
local a = CreateFrame("Frame", "PlayerCastbar", UIParent)
local cb = "CastingBarFrame"

a:SetPoint("BOTTOM", 0, 120)
a:SetWidth(1)
a:SetHeight(1)
a:SetParent(_G[cb])

_G[cb.."Flash"].Show = function() this:Hide() end

hooksecurefunc(_G[cb], "Show", function()
	_G[cb]:ClearAllPoints()
	_G[cb]:SetPoint("TOP", a, "CENTER")
	CastingBarFrame.SetPoint = function() end
end)


-- Focus castbar
local b = CreateFrame("Frame", "FocusCastbar", UIParent)
local fcb = "FocusFrameSpellBar"

b:SetPoint("CENTER", 0, 60)
b:SetWidth(1)
b:SetHeight(1)
b:SetParent(_G[fcb])

_G[fcb.."Flash"].Show = function() this:Hide() end

hooksecurefunc(_G[fcb], "Show", function()
	_G[fcb]:ClearAllPoints()
	_G[fcb]:SetPoint("CENTER", b, "CENTER")
	FocusFrameSpellBar.SetPoint = function() end
end)
