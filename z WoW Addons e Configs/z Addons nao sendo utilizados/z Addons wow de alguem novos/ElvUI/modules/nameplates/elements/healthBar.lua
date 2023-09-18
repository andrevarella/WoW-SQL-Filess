local E, L, V, P, G = unpack(select(2, ...))
local mod = E:GetModule("NamePlates")
local LSM = LibStub("LibSharedMedia-3.0")

local RAID_CLASS_COLORS = RAID_CLASS_COLORS

function mod:UpdateElement_HealthOnValueChanged()
	local frame = self:GetParent().UnitFrame
	if not frame.UnitType then return end -- Bugs

	mod:UpdateElement_Health(frame)
	mod:UpdateElement_HealthColor(frame)
	mod:UpdateElement_Glow(frame)
	mod:UpdateElement_Filters(frame, "UNIT_HEALTH")
end

function mod:UpdateElement_HealthColor(frame)
	if not frame.HealthBar:IsShown() then return end

	local r, g, b
	local scale = 1

	local class = frame.UnitClass
	local classColor = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
	local useClassColor = mod.db.units[frame.UnitType].healthbar.useClassColor
	if classColor and ((frame.UnitType == "FRIENDLY_PLAYER" and useClassColor) or (frame.UnitType == "ENEMY_PLAYER" and useClassColor)) then
		r, g, b = classColor.r, classColor.g, classColor.b
	else
		local status = mod:UnitDetailedThreatSituation(frame)
		if status then
			if status == 3 then
				if E.Role == "Tank" then
					r, g, b = mod.db.threat.goodColor.r, mod.db.threat.goodColor.g, mod.db.threat.goodColor.b
					scale = mod.db.threat.goodScale
				else
					r, g, b = mod.db.threat.badColor.r, mod.db.threat.badColor.g, mod.db.threat.badColor.b
					scale = mod.db.threat.badScale
				end
			elseif status == 2 then
				if E.Role == "Tank" then
					r, g, b = mod.db.threat.badTransition.r, mod.db.threat.badTransition.g, mod.db.threat.badTransition.b
				else
					r, g, b = mod.db.threat.goodTransition.r, mod.db.threat.goodTransition.g, mod.db.threat.goodTransition.b
				end
				scale = 1
			elseif status == 1 then
				if E.Role == "Tank" then
					r, g, b = mod.db.threat.goodTransition.r, mod.db.threat.goodTransition.g, mod.db.threat.goodTransition.b
				else
					r, g, b = mod.db.threat.badTransition.r, mod.db.threat.badTransition.g, mod.db.threat.badTransition.b
				end
				scale = 1
			else
				if E.Role == "Tank" then
					--Check if it is being tanked by an offtank.
					--if self.db.threat.beingTankedByTank then
					--	r, g, b = self.db.threat.beingTankedByTankColor.r, self.db.threat.beingTankedByTankColor.g, self.db.threat.beingTankedByTankColor.b
					--	scale = self.db.threat.goodScale
					--else
						r, g, b = self.db.threat.badColor.r, self.db.threat.badColor.g, self.db.threat.badColor.b
						scale = self.db.threat.badScale
					--end
				else
					--if self.db.threat.beingTankedByTank then
					--	r, g, b = self.db.threat.beingTankedByTankColor.r, self.db.threat.beingTankedByTankColor.g, self.db.threat.beingTankedByTankColor.b
					--	scale = self.db.threat.goodScale
					--else
						r, g, b = self.db.threat.goodColor.r, self.db.threat.goodColor.g, self.db.threat.goodColor.b
						scale = self.db.threat.goodScale
					--end
				end
			end
		end

		if (not status) or (status and not mod.db.threat.useThreatColor) then
			local reactionType = frame.UnitReaction
			if reactionType == 4 then
				r, g, b = mod.db.reactions.neutral.r, mod.db.reactions.neutral.g, mod.db.reactions.neutral.b
			elseif reactionType > 4 then
				if frame.UnitType == "FRIENDLY_PLAYER" then
					r, g, b = mod.db.reactions.friendlyPlayer.r, mod.db.reactions.friendlyPlayer.g, mod.db.reactions.friendlyPlayer.b
				else
					r, g, b = mod.db.reactions.good.r, mod.db.reactions.good.g, mod.db.reactions.good.b
				end
			else
				r, g, b = mod.db.reactions.bad.r, mod.db.reactions.bad.g, mod.db.reactions.bad.b
			end
		end
	end

	if r ~= frame.HealthBar.r or g ~= frame.HealthBar.g or b ~= frame.HealthBar.b then
		if not frame.HealthColorChanged then
			frame.HealthBar:SetStatusBarColor(r, g, b)
			if frame.HealthColorChangeCallbacks then
				for _, cb in ipairs(frame.HealthColorChangeCallbacks) do
					cb(self, frame, r, g, b)
				end
			end
		end
		frame.HealthBar.r, frame.HealthBar.g, frame.HealthBar.b = r, g, b
	end

	if frame.ThreatScale ~= scale then
		frame.ThreatScale = scale
		if frame.isTarget and self.db.useTargetScale then
			scale = scale * self.db.targetScale
		end
		self:SetFrameScale(frame, scale * (frame.ActionScale or 1))
	end
end

function mod:UpdateElement_Health(frame)
	local health = frame.oldHealthBar:GetValue()
	local _, maxHealth = frame.oldHealthBar:GetMinMaxValues()
	frame.HealthBar:SetMinMaxValues(0, maxHealth)
	if frame.MaxHealthChangeCallbacks then
		for _, cb in ipairs(frame.MaxHealthChangeCallbacks) do
			cb(self, frame, maxHealth)
		end
	end	

	if frame.HealthValueChangeCallbacks then
		for _, cb in ipairs(frame.HealthValueChangeCallbacks) do
			cb(self, frame, health)
		end
	end

	frame.HealthBar:SetValue(health)
	frame:GetParent().UnitFrame.FlashTexture:Point("TOPRIGHT", frame.HealthBar:GetStatusBarTexture(), "TOPRIGHT") --idk why this fixes this

	if self.db.units[frame.UnitType].healthbar.text.enable then
		frame.HealthBar.text:SetText(E:GetFormattedText(self.db.units[frame.UnitType].healthbar.text.format, health, maxHealth))
	else
		frame.HealthBar.text:SetText("")
	end
end

function mod:RegisterHealthBarCallbacks(frame, valueChangeCB, colorChangeCB, maxHealthChangeCB)
	if valueChangeCB then
		frame.HealthValueChangeCallbacks = frame.HealthValueChangeCallbacks or {}
		tinsert(frame.HealthValueChangeCallbacks, valueChangeCB)
	end

	if colorChangeCB then
		frame.HealthColorChangeCallbacks = frame.HealthColorChangeCallbacks or {}
		tinsert(frame.HealthColorChangeCallbacks, colorChangeCB)
	end

	if maxHealthChangeCB then
		frame.MaxHealthChangeCallbacks = frame.MaxHealthChangeCallbacks or {}
		tinsert(frame.MaxHealthChangeCallbacks, maxHealthChangeCB)
	end
end

function mod:ConfigureElement_HealthBar(frame, configuring)
	local healthBar = frame.HealthBar

	healthBar:SetPoint("TOP", frame, "CENTER", 0, self.db.units[frame.UnitType].castbar.height + 3)
	healthBar:SetWidth(self.db.units[frame.UnitType].healthbar.width * (frame.ThreatScale or 1) * (frame.isTarget and self.db.useTargetScale and self.db.targetScale or 1))
	healthBar:SetHeight(self.db.units[frame.UnitType].healthbar.height * (frame.ThreatScale or 1) * (frame.isTarget and self.db.useTargetScale and self.db.targetScale or 1))


	healthBar:SetStatusBarTexture(LSM:Fetch("statusbar", self.db.statusbar), "BORDER")

	if (not configuring) and (self.db.units[frame.UnitType].healthbar.enable or frame.isTarget) then
		healthBar:Show()
	end

	healthBar.text:SetAllPoints(healthBar)
	healthBar.text:SetFont(LSM:Fetch("font", self.db.healthFont), self.db.healthFontSize, self.db.healthFontOutline)
end

function mod:ConstructElement_HealthBar(parent)
	local frame = CreateFrame("StatusBar", "$parentHealthBar", parent)
	frame:SetStatusBarTexture(LSM:Fetch("statusbar", self.db.statusbar), "BORDER")
	self:StyleFrame(frame)

	frame:SetScript("OnSizeChanged", function(self, width)
		local health = self:GetValue()
		local _, maxHealth = self:GetMinMaxValues()
		self:GetStatusBarTexture():SetPoint("TOPRIGHT", -(width * ((maxHealth - health) / maxHealth)), 0)
	end)

	parent.FlashTexture = frame:CreateTexture(nil, "OVERLAY")
	parent.FlashTexture:SetTexture(LSM:Fetch("background", "ElvUI Blank"))
	parent.FlashTexture:Point("BOTTOMLEFT", frame:GetStatusBarTexture(), "BOTTOMLEFT")
	parent.FlashTexture:Point("TOPRIGHT", frame:GetStatusBarTexture(), "TOPRIGHT")
	parent.FlashTexture:Hide()

	frame.text = frame:CreateFontString(nil, "OVERLAY")
	frame.text:SetFont(LSM:Fetch("font", self.db.font), self.db.fontSize, self.db.fontOutline)
	frame.text:SetWordWrap(false)

	frame.scale = CreateAnimationGroup(frame)
	frame.scale.width = frame.scale:CreateAnimation("Width")
	frame.scale.width:SetDuration(0.2)
	frame.scale.height = frame.scale:CreateAnimation("Height")
	frame.scale.height:SetDuration(0.2)

	frame:Hide()

	return frame
end