--[[
AdiBags - Adirelle's bag addon.
Copyright 2010 Adirelle (adirelle@tagada-team.net)
All rights reserved.
--]]

local addonName, addon = ...
local L = addon.L

local GetSlotId = addon.GetSlotId
local GetBagSlotFromId = addon.GetBagSlotFromId

local ITEM_SIZE = addon.ITEM_SIZE
local ITEM_SPACING = addon.ITEM_SPACING
local SECTION_SPACING = addon.SECTION_SPACING
local BAG_INSET = addon.BAG_INSET

--------------------------------------------------------------------------------
-- Widget scripts
--------------------------------------------------------------------------------

local function BagSlotButton_OnClick(button)
	if button:GetChecked() then
		button.panel:Show()
	else
		button.panel:Hide()
	end
end

local CollapseButton_OnClick
do
	local function CollapseDropDownMenu_ToggleSection(button, key, container)
		local section = container.sections[key]
		if section then
			section:SetCollapsed(not section:IsCollapsed())
		else
			addon.db.char.collapsedSections[key] = not addon.db.char.collapsedSections[key]
		end
	end

	local info = {}
	local entries = {}
	local function CollapseDropDownMenu_Initialize(self, level)
		if not level then return end

		-- Title
		wipe(info)
		info.isTitle = true
		info.text = L['Section visibility']
		info.notCheckable = true
		UIDropDownMenu_AddButton(info, level)

		-- Now list all potential sections
		wipe(entries)
		for key, collapsed in pairs(addon.db.char.collapsedSections) do
			if collapsed and not entries[key] then
				entries[key] = true
				tinsert(entries, key)
			end
		end
		for key in pairs(self.container.sections) do
			if not entries[key] then
				entries[key] = true
				tinsert(entries, key)
			end
		end
		table.sort(entries)

		-- Add an entry for each section
		local currentCat = nil
		wipe(info)
		for i, key in ipairs(entries) do
			local name, category = addon:SplitSectionKey(key)
			if category ~= currentCat then
				wipe(info)
				info.text = category
				info.disabled = true
				info.notCheckable = true
				UIDropDownMenu_AddButton(info, level)
				currentCat = category
				wipe(info)
			end
			local section = self.container.sections[key]
			if section then
				info.text = format("%s (%d)", name, section.count)
			else
				info.text = name
			end
			info.tooltipTitle = format(L['Show %s'], name)
			info.tooltipText = L['Check this to show this section. Uncheck to hide it.']
			info.checked = not addon.db.char.collapsedSections[key]
			info.keepShownOnClick = true
			info.arg1 = key
			info.arg2 = self.container
			info.func = CollapseDropDownMenu_ToggleSection
			UIDropDownMenu_AddButton(info, level)
		end
	end

	local frame
	function CollapseButton_OnClick(button)
		if not frame then
			frame = CreateFrame("Frame", addonName.."CollapseDropDownMenu")
			frame.displayMode = "MENU"
			frame.initialize = CollapseDropDownMenu_Initialize
			frame.point = "BOTTOMRIGHT"
			frame.relativePoint = "BOTTOMLEFT"
		end
		frame.container = button.container
		ToggleDropDownMenu(1, nil, frame, 'cursor')
	end
end

--------------------------------------------------------------------------------
-- Bag creation
--------------------------------------------------------------------------------

local containerClass, containerProto, containerParentProto = addon:NewClass("Container", "LayeredRegion", "AceEvent-3.0", "AceBucket-3.0")

function addon:CreateContainerFrame(...) return containerClass:Create(...) end

local SimpleLayeredRegion = addon:GetClass("SimpleLayeredRegion")

local bagSlots = {}
function containerProto:OnCreate(name, bagIds, isBank)
	self:SetParent(UIParent)
	containerParentProto.OnCreate(self)

	--self:EnableMouse(true)
	self:SetFrameStrata("HIGH")

	self:SetBackdrop(addon.BACKDROP)

	self:SetScript('OnShow', self.OnShow)
	self:SetScript('OnHide', self.OnHide)

	self.name = name
	self.bagIds = bagIds
	self.isBank = isBank

	self.buttons = {}
	self.dirtyButtons = {}
	self.content = {}
	self.stacks = {}
	self.sections = {}

	self.added = {}
	self.removed = {}
	self.changed = {}

	for bagId in pairs(self.bagIds) do
		self.content[bagId] = { size = 0 }
		tinsert(bagSlots, bagId)
		if not addon.itemParentFrames[bagId] then
			local f = CreateFrame("Frame", addonName..'ItemContainer'..bagId, self)
			f.isBank = isBank
			f:SetID(bagId)
			addon.itemParentFrames[bagId] = f
		end
	end

	local button = CreateFrame("Button", nil, self)
	button:SetAllPoints(self)
	button:RegisterForClicks("AnyUp")
	button:SetScript('OnClick', function(_, ...) return self:OnClick(...) end)
	button:SetScript('OnReceiveDrag', function() return self:OnClick("LeftButton") end)
	self.ClickReceiver = button
	local minFrameLevel = button:GetFrameLevel() + 1

	local headerLeftRegion = SimpleLayeredRegion:Create(self, "TOPLEFT", "RIGHT", 4)
	headerLeftRegion:SetPoint("TOPLEFT", BAG_INSET, -BAG_INSET)
	self.HeaderLeftRegion = headerLeftRegion
	self:AddWidget(headerLeftRegion)
	headerLeftRegion:SetFrameLevel(minFrameLevel)

	local headerRightRegion = SimpleLayeredRegion:Create(self, "TOPRIGHT", "LEFT", 4)
	headerRightRegion:SetPoint("TOPRIGHT", -32, -BAG_INSET)
	self.HeaderRightRegion = headerRightRegion
	self:AddWidget(headerRightRegion)
	headerRightRegion:SetFrameLevel(minFrameLevel)

	local bottomLeftRegion = SimpleLayeredRegion:Create(self, "BOTTOMLEFT", "UP", 4)
	bottomLeftRegion:SetPoint("BOTTOMLEFT", BAG_INSET, BAG_INSET)
	self.BottomLeftRegion = bottomLeftRegion
	self:AddWidget(bottomLeftRegion)
	bottomLeftRegion:SetFrameLevel(minFrameLevel)

	local bottomRightRegion = SimpleLayeredRegion:Create(self, "BOTTOMRIGHT", "UP", 4)
	bottomRightRegion:SetPoint("BOTTOMRIGHT", -BAG_INSET, BAG_INSET)
	self.BottomRightRegion = bottomRightRegion
	self:AddWidget(bottomRightRegion)
	bottomRightRegion:SetFrameLevel(minFrameLevel)

	local bagSlotPanel = addon:CreateBagSlotPanel(self, name, bagSlots, isBank)
	bagSlotPanel:Hide()
	self.BagSlotPanel = bagSlotPanel
	wipe(bagSlots)

	local closeButton = CreateFrame("Button", nil, self, "UIPanelCloseButton")
	self.CloseButton = closeButton
	closeButton:SetPoint("TOPRIGHT", -2, -2)
	addon.SetupTooltip(closeButton, L["Close"])
	closeButton:SetFrameLevel(minFrameLevel)

	local bagSlotButton = CreateFrame("CheckButton", nil, self)
	bagSlotButton:SetNormalTexture([[Interface\Buttons\Button-Backpack-Up]])
	bagSlotButton:SetCheckedTexture([[Interface\Buttons\CheckButtonHilight]])
	bagSlotButton:GetCheckedTexture():SetBlendMode("ADD")
	bagSlotButton:SetScript('OnClick', BagSlotButton_OnClick)
	bagSlotButton.panel = bagSlotPanel
	bagSlotButton:SetWidth(18)
	bagSlotButton:SetHeight(18)
	addon.SetupTooltip(bagSlotButton, {
		L["Equipped bags"],
		L["Click to toggle the equipped bag panel, so you can change them."]
	}, "ANCHOR_BOTTOMLEFT", -8, 0)
	headerLeftRegion:AddWidget(bagSlotButton, 50)

	local title = self:CreateFontString(self:GetName().."Title","OVERLAY","GameFontHighlightLarge")
	self.Title = title
	title:SetText(L[name])
	title:SetTextColor(1, 1, 1)
	title:SetHeight(18)
	title:SetJustifyH("LEFT")
	title:SetPoint("LEFT", headerLeftRegion, "RIGHT", 4, 0)
	title:SetPoint("RIGHT", headerRightRegion, "LEFT", -4, 0)

	local anchor = addon:CreateAnchorWidget(self, name, L[name], self)
	anchor:SetAllPoints(title)
	anchor:EnableMouse(true)
	anchor:SetFrameLevel(self:GetFrameLevel() + 10)
	anchor:SetScript('OnMouseDown', anchor.StartMoving)
	anchor:SetScript('OnMouseUp', anchor.StopMoving)
	if addon.db.profile.positionMode == 'manual' then
		anchor:Show()
	end
	self.Anchor = anchor

	local collapseButton = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
	collapseButton:SetText("V")
	collapseButton:SetWidth(20)
	collapseButton:SetHeight(20)
	collapseButton:SetScript("OnClick", CollapseButton_OnClick)
	collapseButton.container = self
	self:AddHeaderWidget(collapseButton, 10)
	self.CollapseButton = collapseButton
	addon.SetupTooltip(collapseButton, {
		L["Section visibility"],
		L["Click to select which sections should be shown or hidden. Section visibility is common to all bags."]
	}, "ANCHOR_TOPLEFT", 0, 8)

	local content = CreateFrame("Frame", nil, self)
	content:SetPoint("TOPLEFT", BAG_INSET, -addon.TOP_PADDING)
	self.Content = content
	self:AddWidget(content)

	self:UpdateBackgroundColor()
	self.paused = true

	-- Register persitent listeners
	local name = self:GetName()
	local RegisterMessage = LibStub('AceEvent-3.0').RegisterMessage
	RegisterMessage(name, 'AdiBags_FiltersChanged', self.FiltersChanged, self)
	RegisterMessage(name, 'AdiBags_LayoutChanged', self.LayoutChanged, self)
	RegisterMessage(name, 'AdiBags_ConfigChanged', self.ConfigChanged, self)
end

function containerProto:ToString() return self.name or self:GetName() end

--------------------------------------------------------------------------------
-- Scripts & event handlers
--------------------------------------------------------------------------------

function containerProto:BagsUpdated(bagIds)
	local hadInconsistentItems = self.hasInconsistentItems
	self.hasInconsistentItems = false
	for bag in pairs(bagIds) do
		if hadInconsistentItems or self.bagIds[bag] then
			self:UpdateContent(bag)
		end
	end
--[===[@alpha@
	if hadInconsistentItems and not self.hasInconsistentItems then
		self:Debug('Inconsistent items fixed')
	end
--@end-alpha@]===]
	self:UpdateButtons()
	self:LayoutSections()
end

function containerProto:CanUpdate()
	return not addon.holdYourBreath and not self.paused and self:IsVisible()
end

function containerProto:FiltersChanged()
	self.filtersChanged = true
	if self:CanUpdate() then
		self:RedispatchAllItems()
		self:LayoutSections()
	end
end

function containerProto:LayoutChanged()
	self.forceLayout = true
	if self:CanUpdate() then
		self:LayoutSections(true)
	end
end

function containerProto:ConfigChanged(event, name)
	if name:match('^backgroundColors%.') then
		self:UpdateBackgroundColor()
	end
end

function containerProto:OnShow()
	PlaySound(self.isBank and "igMainMenuOpen" or "igBackPackOpen")
	self:RegisterEvent('EQUIPMENT_SWAP_PENDING', "PauseUpdates")
	self:RegisterEvent('EQUIPMENT_SWAP_FINISHED', "ResumeUpdates")
	containerParentProto.OnShow(self)
	self:ResumeUpdates()
end

function containerProto:OnHide()
	containerParentProto.OnHide(self)
	PlaySound(self.isBank and "igMainMenuClose" or "igBackPackClose")
	self:PauseUpdates()
	self:UnregisterAllEvents()
	self:UnregisterAllMessages()
	self:UnregisterAllBuckets()
end

function containerProto:ResumeUpdates()
	if not self.paused then return end
	self.paused = false
	self.bagUpdateBucket = self:RegisterBucketMessage('AdiBags_BagUpdated', 0.2, "BagsUpdated")
	self:Debug('ResumeUpdates')
--[===[@alpha@
	local hadInconsistentItems = self.hasInconsistentItems
--@end-alpha@]===]
	self.hasInconsistentItems = false
	for bag in pairs(self.bagIds) do
		self:UpdateContent(bag)
	end
--[===[@alpha@
	if hadInconsistentItems and not self.hasInconsistentItems then
		self:Debug('Inconsistent items fixed')
	end
--@end-alpha@]===]
	self:UpdateButtons()
	if self.filtersChanged  then
		self:RedispatchAllItems()
	end
	self:LayoutSections(true)
end

function containerProto:PauseUpdates()
	if self.paused then return end
	self:Debug('PauseUpdates')
	self:UnregisterBucket(self.bagUpdateBucket, true)
	self.paused = true
end

--------------------------------------------------------------------------------
-- Backdrop click handler
--------------------------------------------------------------------------------

local band = bit.band
local function FindBagWithRoom(self, itemFamily)
	local fallback
	for bag in pairs(self.bagIds) do
		local numFree, family = GetContainerNumFreeSlots(bag)
		if numFree and numFree > 0 then
			if band(family, itemFamily) ~= 0 then
				return bag
			elseif not fallback then
				fallback = bag
			end
		end
	end
	return fallback
end

local FindFreeSlot
do
	local slots = {}
	FindFreeSlot = function(self, item)
		local bag = FindBagWithRoom(self, GetItemFamily(item))
		if not bag then return end
		wipe(slots)
		GetContainerFreeSlots(bag, slots)
		return GetSlotId(bag, slots[1])
	end
end

function containerProto:OnClick(...)
	local kind, data1, data2 = GetCursorInfo()
	local itemLink
	if kind == "item" then
		itemLink = data2
	elseif kind == "merchant" then
		itemLink = GetMerchantItemLink(data1)
	else
		return
	end
	self:Debug('OnClick', kind, data1, data2, '=>', itemLink)
	if itemLink then
		local slotId = FindFreeSlot(self, itemLink)
		if slotId then
			local button = self.buttons[slotId]
			if button then
				local button = button:GetRealButton()
				self:Debug('Redirecting click to', button)
				return button:GetScript('OnClick')(button, ...)
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Regions and global layout
--------------------------------------------------------------------------------

function containerProto:AddHeaderWidget(widget, order, width, yOffset, side)
	local region = (side == "LEFT") and self.HeaderLeftRegion or self.HeaderRightRegion
	region:AddWidget(widget, order, width, 0, yOffset)
end

function containerProto:AddBottomWidget(widget, side, order, height, xOffset, yOffset)
	local region = (side == "RIGHT") and self.BottomRightRegion or self.BottomLeftRegion
	region:AddWidget(widget, order, height, xOffset, yOffset)
end

function containerProto:GetContentMinWidth()
	return math.max(
		(self.BottomLeftRegion:IsShown() and self.BottomLeftRegion:GetWidth() or 0) +
			(self.BottomRightRegion:IsShown() and self.BottomRightRegion:GetWidth() or 0),
		self.Title:GetStringWidth() + 32 +
			(self.HeaderLeftRegion:IsShown() and (self.HeaderLeftRegion:GetWidth() + 4) or 0) +
			(self.HeaderRightRegion:IsShown() and (self.HeaderRightRegion:GetWidth() + 4) or 0)
	)
end

function containerProto:OnLayout()
	local bottomHeight = 0
	if self.BottomLeftRegion:IsShown() then
		bottomHeight = self.BottomLeftRegion:GetHeight() + BAG_INSET
	end
	if self.BottomRightRegion:IsShown() then
		bottomHeight = math.max(bottomHeight, self.BottomRightRegion:GetHeight() + BAG_INSET)
	end
	self:SetWidth(BAG_INSET * 2 + math.max(self:GetContentMinWidth(), self.Content:GetWidth()))
	self:SetHeight(addon.TOP_PADDING + BAG_INSET + bottomHeight + self.Content:GetHeight())
end

--------------------------------------------------------------------------------
-- Miscellaneous
--------------------------------------------------------------------------------

function containerProto:UpdateBackgroundColor()
	local r, g, b, a = unpack(addon.db.profile.backgroundColors[self.name], 1, 4)
	self:SetBackdropColor(r, g, b, a)
	self:SetBackdropBorderColor(0.5, 0.5, 0.5, a)
	self.BagSlotPanel:SetBackdropColor(r, g, b, a)
	self.BagSlotPanel:SetBackdropBorderColor(0.5, 0.5, 0.5, a)
end

--------------------------------------------------------------------------------
-- Bag content scanning
--------------------------------------------------------------------------------

function containerProto:UpdateContent(bag)
	self:Debug('UpdateContent', bag)
	local added, removed, changed = self.added, self.removed, self.changed
	local content = self.content[bag]
	local newSize = GetContainerNumSlots(bag)
	local _, bagFamily = GetContainerNumFreeSlots(bag)
	content.family = bagFamily
	local inconsistencyCount = 0
	for slot = 1, newSize do
		local slotData = content[slot]
		if not slotData then
			slotData = {
				bag = bag,
				slot = slot,
				slotId = GetSlotId(bag, slot),
				bagFamily = bagFamily,
				count = 0,
				isBank = self.isBank,
			}
			content[slot] = slotData
		end
		local itemId = GetContainerItemID(bag, slot)
		local link = GetContainerItemLink(bag, slot)
		local _, count, _, _, _, _, link2 = GetContainerItemInfo(bag, slot)
		local name, _, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo(link or itemId or "")
		local inconsistent = false
		if (itemId or ((count or 0) > 0)) and (not name or not link or link ~= link2) then
			self:Debug('Weird item information, bag,slot=', bag, slot, 'id=', itemId, 'count=', count, 'GetContainerItemLink=', link, 'GetContainerItemInfo link=', link2)
			inconsistent = true
			inconsistencyCount = inconsistencyCount + 1
		end
		link, count = link or false, count or 0

		if slotData.link ~= link or slotData.inconsistent ~= inconsistent then
			removed[slotData.slotId] = slotData.link
			slotData.inconsistent = inconsistent
			slotData.count = count
			slotData.link = link
			slotData.itemId = itemId
			slotData.name, slotData.quality, slotData.iLevel, slotData.reqLevel, slotData.class, slotData.subclass,  slotData.equipSlot, slotData.texture, slotData.vendorPrice = name, quality, iLevel, reqLevel, class, subclass, equipSlot, texture, vendorPrice
			slotData.maxStack = maxStack or (link and 1 or 0)
			added[slotData.slotId] = slotData
		elseif slotData.count ~= count then
			slotData.count = count
			changed[slotData.slotId] = slotData
		end
	end
	for slot = content.size, newSize + 1, -1 do
		local slotData = content[slot]
		if slotData then
			removed[slotData.slotId] = slotData.link
			content[slot] = nil
		end
	end
	content.hasInconsistentItems = inconsistencyCount > 0
	if content.hasInconsistentItems and not self.hasInconsistentItems then
		self:Debug('Container has inconsistent items')
		self.hasInconsistentItems = true
	end
	content.size = newSize
end

function containerProto:HasContentChanged()
	return not not (next(self.added) or next(self.removed) or next(self.changed))
end

--------------------------------------------------------------------------------
-- Item dispatching
--------------------------------------------------------------------------------

function containerProto:GetStackButton(key)
	local stack, isNew = self.stacks[key]
	if not stack then
		stack = addon:AcquireStackButton(self, key)
		self.stacks[key] = stack
	end
	return stack
end

function containerProto:GetSection(name, category)
	local key = addon:BuildSectionKey(name, category)
	local section = self.sections[key]
	if not section then
		section = addon:AcquireSection(self, name, category)
		self.sections[key] = section
	end
	return section
end

local function FilterSlot(slotData)
	if slotData.inconsistent then
		return L["Buggy items"], nil
	elseif slotData.link then
		local section, category, filterName = addon:Filter(slotData, L['Miscellaneous'])
		return section, category, filterName, addon:ShouldStack(slotData)
	else
		return L["Free space"], nil, nil, addon:ShouldStack(slotData)
	end
end

function containerProto:DispatchItem(slotData)
	local sectionName, category, filterName, shouldStack, stackKey = FilterSlot(slotData)
	assert(sectionName, "sectionName is nil, item: "..(slotData.link or "none"))
	local slotId = slotData.slotId
	local button = self.buttons[slotId]
	if button and ((button:IsStack() and not shouldStack) or (not button:IsStack() and shouldStack)) then
		self:RemoveSlot(slotId)
		button = nil
	end
	if shouldStack then
		local fullKey = strjoin('#', stackKey, tostring(slotData.bagFamily))
		button = self:GetStackButton(fullKey)
		button:AddSlot(slotId)
	elseif not button then
		button = addon:AcquireItemButton(self, slotData.bag, slotData.slot)
	end
	local section = self:GetSection(sectionName, category or sectionName)
	if button:GetSection() ~= section then
		section:AddItemButton(slotId, button)
	end
	button.filterName = filterName
	button:FullUpdate()
	self.buttons[slotId] = button
end

function containerProto:RemoveSlot(slotId)
	local button = self.buttons[slotId]
	if button then
		self.buttons[slotId] = nil
		if button:IsStack() then
			button:RemoveSlot(slotId)
			if button:IsEmpty() then
				self.stacks[button:GetKey()] = nil
				button:Release()
			end
		else
			button:Release()
		end
	end
end

function containerProto:UpdateButtons()
	if not self:HasContentChanged() then return end
	self:Debug('UpdateButtons')

	local added, removed, changed = self.added, self.removed, self.changed
	self:SendMessage('AdiBags_PreContentUpdate', self, added, removed, changed)

	--[===[@debug@
	local numAdded, numRemoved, numChanged = 0, 0, 0
	--@end-debug@]===]

	for slotId in pairs(removed) do
		self:RemoveSlot(slotId)
		--[===[@debug@
		numRemoved = numRemoved + 1
		--@end-debug@]===]
	end

	if next(added) then
		self:SendMessage('AdiBags_PreFilter', self)
		for slotId, slotData in pairs(added) do
			self:DispatchItem(slotData)
			--[===[@debug@
			numAdded = numAdded + 1
			--@end-debug@]===]
		end
		self:SendMessage('AdiBags_PostFilter', self)
	end

	-- Just push the buttons into dirtyButtons
	local buttons = self.buttons
	for slotId in pairs(changed) do
		buttons[slotId]:FullUpdate()
		--[===[@debug@
		numChanged = numChanged + 1
		--@end-debug@]===]
	end

	self:SendMessage('AdiBags_PostContentUpdate', self, added, removed, changed)

	--[===[@debug@
	self:Debug(numRemoved, 'slot(s) removed', numAdded, 'slot(s) added and', numChanged, 'slot(s) changed')
	--@end-debug@]===]

	wipe(added)
	wipe(removed)
	wipe(changed)
end

function containerProto:RedispatchAllItems()
	self:Debug('RedispatchAllItems')
	self:SendMessage('AdiBags_PreFilter', self)
	for bag, content in pairs(self.content) do
		for slotId, slotData in ipairs(content) do
			self:DispatchItem(slotData)
		end
	end
	self:SendMessage('AdiBags_PostFilter', self)
	self.filtersChanged = nil
end

--------------------------------------------------------------------------------
-- Section layout
--------------------------------------------------------------------------------

local function CompareSections(a, b)
	local orderA, orderB = a:GetOrder(), b:GetOrder()
	if orderA == orderB then
		if a.category == b.category then
			return a.name < b.name
		else
			return a.category < b.category
		end
	else
		return orderA > orderB
	end
end

local sections = {}
local max, floor = math.max, math.floor

local function GetBestSection(maxWidth, maxHeight, xOffset, rowHeight, category)
	local bestIndex, leastWasted, bestWidth, bestHeight
	for index, section in ipairs(sections) do
		if category and section.category ~= category then
			break
		end
		local fit, width, height, wasted = section:FitInSpace(maxWidth, maxHeight, xOffset, rowHeight)
		if fit then
			if not leastWasted or wasted < leastWasted then
				bestIndex, bestWidth, bestHeight, leastWasted = index, width, height, wasted
			end
		end
	end
	return bestIndex, bestWidth, bestHeight
end

local getNextSection = {
	-- 0: keep section of the same category together and in the right order
	[0] = function(maxWidth, maxHeight, xOffset, rowHeight)
		local fit, width, height = sections[1]:FitInSpace(maxWidth, maxHeight, xOffset, rowHeight)
		if fit then
			return 1, width, height
		end
	end,
	-- 1: keep categories together
	[1] = function(maxWidth, maxHeight, xOffset, rowHeight)
		return GetBestSection(maxWidth, maxHeight, xOffset, rowHeight, sections[1].category)
	end,
	-- 2: do not care about ordering
	[2] = function(maxWidth, maxHeight, xOffset, rowHeight)
		return GetBestSection(maxWidth, maxHeight, xOffset, rowHeight)
	end
}

local function DoLayoutSections(self, rowWidth, maxHeight, clean, force)
	rowWidth = rowWidth + ITEM_SIZE - SECTION_SPACING

	local minHeight = 0
	for key, section in pairs(self.sections) do
		if section:IsCollapsed() then
			section:Hide()
		else
			local fit, _, _, _, height = section:FitInSpace(rowWidth, 10000, 0, 0)
			if fit and height > minHeight then
				minHeight = height
			end
			tinsert(sections, section)
		end
	end
	table.sort(sections, CompareSections)
	if minHeight > maxHeight then
		maxHeight = minHeight
	end

	local content = self.Content
	local getNext = getNextSection[addon.db.profile.laxOrdering]

	local wasted = 0
	local contentWidth, contentHeight = 0, 0
	local columnX, numColumns = 0, 0
	local num = #sections
	while num > 0 do
		local columnWidth, y = 0, 0
		while num > 0 and y < maxHeight do
			local rowHeight, x = 0, 0
			while num > 0 and x < rowWidth do
				local index, width, height = getNext(rowWidth - x, maxHeight - y, x, rowHeight)
				if not index then
					break
				end
				local section = tremove(sections, index)
				category = section.category
				num = num - 1
				--section:Show()
				section:SetPoint("TOPLEFT", content, columnX + x, -y)
				section:Layout(width, height, clean, force)
				x = x + section:GetWidth() + SECTION_SPACING
				rowHeight = max(rowHeight, section:GetHeight())
			end
			if x > 0 then
				y = y + rowHeight + ITEM_SPACING
				columnWidth = max(columnWidth, x)
				contentHeight = max(contentHeight, y)
			else
				break
			end
		end
		if y > 0 then
			numColumns = numColumns + 1
			columnX = columnX + columnWidth
			contentWidth = max(contentWidth, columnX)
			wasted = maxHeight - y
		else
			break
		end
	end
	return contentWidth - SECTION_SPACING, contentHeight - ITEM_SPACING, numColumns, wasted, minHeight
end

function containerProto:LayoutSections(repack)

	local num = 0
	local changed = self.forceLayout
	for key, section in pairs(self.sections) do
		if section:IsEmpty() then
			section:Release()
			self.sections[key] = nil
			changed = true
		elseif section:IsCollapsed() then
			section:Hide()
		else
			section:Show()
			if not self.forceLayout and section:NeedLayout(repack) then
				changed = true
			end
			num = num + 1
		end
	end
	if not changed then
		return
	end
	if num == 0 then
		self.Content:SetSize(0.5, 0.5)
		self.forceLayout = nil
		return
	end

	self:Debug('LayoutSections')

	local rowWidth = (ITEM_SIZE + ITEM_SPACING) * addon.db.profile.rowWidth - ITEM_SPACING
	local maxHeight = addon.db.profile.maxHeight * UIParent:GetHeight() * UIParent:GetEffectiveScale() / self:GetEffectiveScale()
	self:Debug('- GetContentMinWidth:', self:GetContentMinWidth())

	local contentWidth, contentHeight, numColumns, wastedHeight, minHeight = DoLayoutSections(self, rowWidth, maxHeight, repack, self.forceLayout)
	if numColumns > 1 and wastedHeight / contentHeight > 0.1 then
		local totalHeight = contentHeight * numColumns - wastedHeight
		if totalHeight / numColumns < minHeight then
			numColumns = numColumns - 1
		end
		maxHeight = totalHeight / numColumns * 1.10
		contentWidth, contentHeight, numColumns, wastedHeight = DoLayoutSections(self, rowWidth, maxHeight, repack, self.forceLayout)
	elseif numColumns == 1 and contentWidth < self:GetContentMinWidth()  then
		contentWidth, contentHeight, numColumns, wastedHeight = DoLayoutSections(self, self:GetContentMinWidth(), maxHeight, repack, self.forceLayout)
	end

	self.Content:SetSize(contentWidth, contentHeight)

	self.forceLayout = nil
end
