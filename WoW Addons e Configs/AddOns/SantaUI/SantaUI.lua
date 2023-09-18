-- Hi
ChatFrame1:AddMessage("Santa says: Ho ho ho...",1,0,0.3)

-- /rl to reload UI
SLASH_LHRELOADUI1 = "/rl";
SlashCmdList["LHRELOADUI"] = function() ReloadUI(); end;

-- Reposition tooltip
hooksecurefunc("GameTooltip_SetDefaultAnchor", function (tooltip, parent)
	tooltip:SetOwner(parent, "ANCHOR_NONE")
	tooltip:ClearAllPoints()
	tooltip:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -30, 85)
end)

-- Unit frames
PlayerFrame:SetScale(1.2)
PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("TOPLEFT", -20, -7)

TargetFrame:SetScale(1.2)
TargetFrame:ClearAllPoints()
TargetFrame:SetPoint("TOPLEFT", 220, -7)

-- Party frames
PartyMemberFrame1:SetScale(1.3)
PartyMemberFrame1:ClearAllPoints()
PartyMemberFrame1:SetPoint("LEFT", 100, 35)
--PartyMemberFrame1PetFrame:SetScale(1.4)
--PartyMemberFrame1PetFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 0, 0)

PartyMemberFrame2:SetScale(1.3)
PartyMemberFrame2:ClearAllPoints()
PartyMemberFrame2:SetPoint("LEFT", 100, -35)
--PartyMemberFrame2PetFrame:SetScale(1.4)
--PartyMemberFrame2PetFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", -50, -50)

PartyMemberFrame3:SetScale(1.3)
PartyMemberFrame3:ClearAllPoints()
PartyMemberFrame3:SetPoint("LEFT", 100, -100)

PartyMemberFrame4:SetScale(1.3)
PartyMemberFrame4:ClearAllPoints()
PartyMemberFrame4:SetPoint("LEFT", 100, 100)