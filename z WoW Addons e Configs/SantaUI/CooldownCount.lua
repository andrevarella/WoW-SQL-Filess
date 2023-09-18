cooldownThreshold = 10

local ActionButton_UpdateHotkeysHook = function(self, actionButtonType)
	if not self.elements then
		local name = self:GetName()
		
		self.elements = {
			icon = _G[name .. "Icon"],
			normalTexture = _G[name .. "NormalTexture"],
		}
	end
end

-- Most of this is stolen from RedRange
local timeleft
local ActionButton_OnUpdateCooldownHook = function(self, elapsed)
	if self.cooldown and self.cooldown.active then
		timeLeft = ceil(self.cooldown.start + self.cooldown.duration - GetTime())
		
		if self.cooldown.enable > 0 and timeLeft > 0 then
			if timeLeft <= cooldownThreshold then
				self.cooldown.count:SetText(format("%d", timeLeft))
			end
		else
			self.cooldown.count:SetText("")
			self.cooldown.active = false
		end			
	end
end

local CooldownFrame_SetTimerHook = function(self, start, duration, enable)
	local button = self:GetParent()

	if start > 0 and duration > 3 and enable > 0 then
		if not button.cooldown then
			local name = button:GetName() .. "Counter"
			
	    local frame = CreateFrame("Frame", name, self)
	    frame:SetWidth(32)
	    frame:SetHeight(32)
	    frame:SetPoint("CENTER", button, "CENTER")

	    local count = frame:CreateFontString(nil, "ARTWORK")
			count:SetFont(unpack({STANDARD_TEXT_FONT, 20}))
			count:SetShadowOffset(0.7, -0.7)
	    count:SetAllPoints(frame)
	    count:SetJustifyH("CENTER")

	    button.cooldown = {
	      count = count
	    }
		else
			button.cooldown.count:SetText("")
		end
		
		button.cooldown.active = true
		button.cooldown.start = start
		button.cooldown.duration = duration
		button.cooldown.enable = enable

		ActionButton_OnUpdateCooldownHook(self, 1)
	end
end

if cooldownThreshold > 0 then
	hooksecurefunc("ActionButton_OnUpdate", ActionButton_OnUpdateCooldownHook)
	hooksecurefunc("CooldownFrame_SetTimer", CooldownFrame_SetTimerHook)
end