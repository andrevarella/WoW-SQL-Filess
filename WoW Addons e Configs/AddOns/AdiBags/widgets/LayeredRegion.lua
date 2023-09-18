--[[
AdiBags - Adirelle's bag addon.
Copyright 2010 Adirelle (adirelle@tagada-team.net)
All rights reserved.
--]]

local addonName, addon = ...
local L = addon.L
local safecall = addon.safecall

--------------------------------------------------------------------------------
-- Abstract layered region
--------------------------------------------------------------------------------

local layeredRegionClass, layeredRegionProto = addon:NewClass("LayeredRegion", "Frame")

function layeredRegionProto:OnCreate(parent)
	if parent then
		self:SetParent(parent)
	end

	self:SetWidth(0.1)
	self:SetHeight(0.1)
	self.widgets = {}

	self:SetScript('OnShow', self.OnShow)
	self:SetScript('OnHide', self.OnHide)
end

function layeredRegionProto:SetContainer(container)
	self.container = container
end

function layeredRegionProto:OnShow()
	if not self.isShown then
		self:Debug('OnShow')
		self.isShown = true
		self:RequestLayout(true)
	end
end

function layeredRegionProto:OnHide()
	if self.isShown then
		self:Debug('OnHide')
		self.isShown = false
		self:RequestLayout()
	end
end

function layeredRegionProto:AddWidget(widget, ...)
	self:Debug('Adding widget', widget, ...)

	local data = { widget = widget }
	tinsert(self.widgets, data)
	safecall(self, "OnWidgetAdded", data, ...)
	widget:SetFrameLevel(self:GetFrameLevel()+1)

	if type(widget.SetContainer) == "function" and type(widget.Layout) == "function" then
		data.layered = true
		widget:SetContainer(self)
	else
		data.isShown = widget:IsShown()
		data.width = widget:GetWidth()
		data.height = widget:GetHeight()

		local visibility_callback = function()
			local isShown = widget:IsShown()
			if data.shown ~= isShown then
				data.shown = isShown
				self:RequestLayout()
			end
		end

		widget:HookScript('OnShow', visibility_callback)
		widget:HookScript('OnHide', visibility_callback)
		widget:HookScript('OnSizeChanged', function()
			local width, height = widget:GetWidth(), widget:GetHeight()
			if width and height and (data.width ~= width or data.height ~= height) then
				data.width, data.height = width, height
				self:RequestLayout()
			end
		end)

	end

	self:RequestLayout()
end

function layeredRegionProto:Layout()
	if not self.dirtyLayout then return end
--[===[@debug@
	if self.widgets[1] then
		self:Debug('Laying out children')
--@end-debug@]===]
		for i, data in pairs(self.widgets) do
			if data.layered then
				data.widget:Layout()
			end
		end
--[===[@debug@
	end
	if self.OnLayout then
		self:Debug('OnLayout')
--@end-debug@]===]
		safecall(self, "OnLayout")
--[===[@debug@
	end
--@end-debug@]===]
	self.dirtyLayout = nil
	self:SetScript('OnUpdate', nil)
end

function layeredRegionProto:RequestLayout(immediate)
	if self.dirtyLayout and not immediate then return end
	self.dirtyLayout = true
	if self.container then
		self.container:RequestLayout()
	elseif self:IsVisible() then
		self:Layout()
	else
		self:SetScript('OnUpdate', self.Layout)
	end
end

--------------------------------------------------------------------------------
-- Simple layered region
--------------------------------------------------------------------------------

local simpleLayeredRegionClass, simpleLayeredRegionProto = addon:NewClass("SimpleLayeredRegion", "LayeredRegion")

local DIRECTIONS = {
	UP    = {  0,  1, 1, 0 },
	DOWN  = {  0, -1, 1, 0 },
	LEFT  = { -1,  0, 0, 1 },
	RIGHT = {  1,  0, 0, 1 },
}

function simpleLayeredRegionProto:OnCreate(parent, anchorPoint, direction, spacing)
	layeredRegionProto.OnCreate(self, parent)
	self:Show()
	self:SetAnchorPoint(anchorPoint)
	self:SetDirection(direction)
	self:SetSpacing(spacing)
end

function simpleLayeredRegionProto:SetDirection(direction)
	if self.direction ~= direction then
		local dirData = direction and DIRECTIONS[direction]
		assert(dirData, "Invalid direction for SimpleLayeredRegion: "..direction)
		self.direction = direction
		self.dx, self.dy, self.sx, self.sy = unpack(dirData)
		self:RequestLayout()
	end
end

function simpleLayeredRegionProto:SetAnchorPoint(anchorPoint)
	if self.anchorPoint ~= anchorPoint then
		self.anchorPoint = anchorPoint
		self:RequestLayout()
	end
end

function simpleLayeredRegionProto:SetSpacing(spacing)
	if self.spacing ~= spacing then
		self.spacing = spacing or 0
		self:RequestLayout()
	end
end

local function CompareWidgets(a, b)
	return a.order > b.order
end

function simpleLayeredRegionProto:OnWidgetAdded(data, order, size, xOffset, yOffset)
	data.order = order or 0
	data.size = size or nil
	data.xOffset = xOffset or 0
	data.yOffset = yOffser or 0
	table.sort(self.widgets, CompareWidgets)
end

local max = math.max

function simpleLayeredRegionProto:OnLayout()
	local dx, dy, sx, sy = self.dx, self.dy, self.sx, self.sy
	local anchorPoint, spacing = self.anchorPoint, self.spacing
	local x, y, width, height = 0, 0, 0.1, 0.1
	local num = 0
	for index, data in ipairs(self.widgets) do
		if data.widget:IsShown() then
			local widget = data.widget
			widget:ClearAllPoints()
			if num > 0 then
				x = x + dx * spacing
				y = y + dy * spacing
			end
			widget:SetPoint(anchorPoint, self, x + data.xOffset, y + data.yOffset)
			local w, h = widget:GetWidth(), widget:GetHeight()
			x = x + dx * (data.size or w)
			y = y + dy * (data.size or h)
			width = max(width, x * dx, w * sx)
			height = max(height, y * dy, h * sy)
			num = num + 1
		end
	end
	self:SetWidth(width)
	self:SetHeight(height)
	if num > 0 then
		self:Show()
	else
		self:Hide()
	end
end
