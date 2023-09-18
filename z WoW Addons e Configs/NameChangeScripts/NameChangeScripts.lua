local frame = CreateFrame("FRAME", "NameChangeScripts")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventHandler(self, event, ...)

	NewName = " "
	
	-- Change Player UnitFrame Name
	PlayerFrame.name:SetText(NewName);
	
	-- Change Target UnitFrame Name
	TFNC = CreateFrame("Frame", "TargetFrameNameChange")
	local function ChangeTargetName(self)
		local PN = GetUnitName("player")
		local TN = GetUnitName("target")
		if PN == TN then
			TargetFrame.name:SetText(NewName)
		end
	end
	TFNC:SetScript("OnUpdate", ChangeTargetName)
	
	-- Change Target's Target UnitFrame Name
	TFTNC = CreateFrame("Frame", "TargetFrameTargetNameChange")
	local function ChangeTargetofTargetName(self)
		local PN = GetUnitName("player")
		local TTN = GetUnitName("targettarget")
		if PN == TTN then
			TargetFrameToT.name:SetText(NewName)
		end
	end
	TFTNC:SetScript("OnUpdate", ChangeTargetofTargetName)
	
	-- Change Focus UnitFrame Name
	FFNC = CreateFrame("Frame", "FocusFrameNameChange")
	local function ChangeFocusName(self)
		local PN = GetUnitName("player")
		local FN = GetUnitName("focus")
		if PN == FN then
			FocusFrame.name:SetText(NewName)
		end
	end
	FFNC:SetScript("OnUpdate", ChangeFocusName)
	
	-- Change Focus' Target UnitFrame Name
	FFTNC = CreateFrame("Frame", "FocusFrameTargetNameChange")
	local function ChangeFocusTargetName(self)
		local PN = GetUnitName("player")
		local FTN = GetUnitName("focustarget")
		if PN == FTN then
			FocusFrameToT.name:SetText(NewName)
		end
	end
	FFTNC:SetScript("OnUpdate", ChangeFocusTargetName)
	
end
frame:SetScript("OnEvent", eventHandler)