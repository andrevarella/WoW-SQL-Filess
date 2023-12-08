ClassIcons = {};
local ClassIcons = ClassIcons;
-- Class Icon Scripts
do
	local scripts = CreateFrame("Frame", "ClassIcons_ScriptsFrame", WorldFrame);
	scripts:Hide();
	scripts:RegisterEvent("PLAYER_ENTERING_WORLD");
	scripts:RegisterEvent("PLAYER_TARGET_CHANGED");
	scripts:RegisterEvent("PARTY_MEMBERS_CHANGED");
	scripts.ClassIcons = ClassIcons;
	ClassIcons.SCRIPTS_FRAME = scripts;
end
-- Player, Party and Target Icons
do
	local createFrame = CreateFrame;
	local uiParent = UIParent;	
	local globalEnv = getfenv(0);
	local playerIcon = createFrame("Frame", ("ClassIcons_PlayerIconFrame"), uiParent, "ClassIcons_UnitClassIconFrameTemplate");
	playerIcon:SetHeight(32);
	playerIcon:SetWidth(32);
	playerIcon:SetPoint("TOPLEFT", ("PlayerFrame"), "TOPLEFT", 85, 0);
	ClassIcons.ICONFRAME_PLAYER = playerIcon;
	local target = createFrame("Frame", "ClassIcons_TargetIconFrame", uiParent, "ClassIcons_UnitClassIconFrameTemplate");
	target:SetWidth(32);
	target:SetHeight(32);
	target:SetPoint("TOPRIGHT", "TargetFrame", "TOPRIGHT", -85, -5);
	ClassIcons.ICONFRAME_TARGET = target;
	local partyIcon;
	for index = 1, 4 do
		partyIcon = createFrame("Frame", ("ClassIcons_Party"..index.."IconFrame"), uiParent, "ClassIcons_UnitClassIconFrameTemplate");
		partyIcon:SetPoint("TOPLEFT", ("PartyMemberFrame"..index), "TOPLEFT", 50, 0);
		ClassIcons["ICONFRAME_PARTY"..index] = partyIcon;
	end
end
ClassIcons.Original_RaidOptionsFrame_UpdatePartyFrames = RaidOptionsFrame_UpdatePartyFrames;

function ClassIcons:Main_OnEvent(event)
	if (event == "PLAYER_TARGET_CHANGED") then
		self:Main_UpdateTarget();
	elseif (event == "PARTY_MEMBERS_CHANGED" or event == "PLAYER_ENTERING_WORLD") then
		self:Main_UpdateParty();
	end
	self:Main_UpdatePlayer();
end

ClassIcons.SCRIPTS_FRAME:SetScript("OnEvent", (function(self, event, ...) self.ClassIcons:Main_OnEvent(event); end));

function ClassIcons:Main_UpdatePlayer()
	local playerIcon = self.ICONFRAME_PLAYER;
	local _, class = UnitClass("player");
	playerIcon.TEXTURE:SetTexture("Interface\\AddOns\\ClassIcons\\Icons\\"..class);
	playerIcon:Show();
end

function ClassIcons:Main_UpdateTarget()
	local targetIcon = self.ICONFRAME_TARGET;
	
	if (UnitIsPlayer("target") ~= nil and UnitCreatureFamily("target") == nil) then
		local _, class = UnitClass("target");
		targetIcon.TEXTURE:SetTexture("Interface\\AddOns\\ClassIcons\\Icons\\"..class);
		targetIcon:Show();
	else
		targetIcon:Hide();
	end
end

function ClassIcons:Main_UpdateParty()
	if (HIDE_PARTY_INTERFACE == "1" and GetNumRaidMembers() > 0) then
		for index = 1, 4 do
			self["ICONFRAME_PARTY"..index]:Hide();
		end
		return;
	end	
	local unitClass = UnitClass;
	local partyIcon;
	local _, class;
	for index = 1, 4 do
		partyIcon = self["ICONFRAME_PARTY"..index];
		_, class = unitClass("party"..index);
		
		if (class ~= nil) then
			partyIcon.TEXTURE:SetTexture("Interface\\AddOns\\ClassIcons\\Icons\\"..class);
			partyIcon:Show();
		else
			partyIcon:Hide();
		end
	end
end

RaidOptionsFrame_UpdatePartyFrames = function()
	ClassIcons.Original_RaidOptionsFrame_UpdatePartyFrames();
	ClassIcons:Main_UpdateParty();
end
