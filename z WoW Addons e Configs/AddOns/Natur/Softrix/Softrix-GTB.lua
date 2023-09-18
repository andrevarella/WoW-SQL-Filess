
--[[

		$title:			Natur Enemy Castbar
		$author:		Michael Boyle (Softrix)
		$email:			michael.boyle@softrix.co.uk
		$website:		www.softrix.co.uk
		
		$credits:		This Natur Enemy Castbar is a complete rewrite based on the 
						excellent discontinued addon by Naturfreund.
																		
						A big thank you goes to Krycek for his additional work on the 
						spells which left me to concentrate on the addon programming 
						side bringing you more features and quicker bug tracking  =D
						
						Krycek's Wowinterface profile and contact information can be 
						found on wowinterface.com's website at:
						
						http://www.wowinterface.com/forums/member.php?userid=33413
						
						Credits also go to Shadowed who is the author of the GTB bar 
						library which I	have modified for this addon.  The original 
						unmodified GTB library for the purpose of these credits is at:
						
						http://www.wowinterface.com/downloads/info10204-GTB-1.0.html
						
						I was going to write my own bar routines until i came across
						his excellent library.. why re-invent the wheel as they say!
		
]]--


local major = "Softrix-1.0"
local minor = tonumber(string.match("$Revision: 525509 $", "(%d+)") or 1)

assert(LibStub, string.format("%s requires LibStub.", major))

local Softrix = LibStub:NewLibrary(major, minor)
if( not Softrix ) then return end

-- Softrix Library
Softrix.framePool = Softrix.framePool or {}
Softrix.groups = Softrix.groups or {}

local framePool = Softrix.framePool
local groups = Softrix.groups
local methods = {"RegisterOnMove", "SetAnchorVisible", "SetMaxBars", "SetBaseColor", "EnableGradient", "SetPoint", "SetScale", "SetWidth", "SetHeight", "SetTexture", "SetBarGrowth", "SetIconPosition",
"SetFadeTime", "RegisterOnFade", "SetDisplayGroup", "GetDisplayGroup", "RegisterBar", "UnregisterBar", "SetRepeatingTimer", "UnregisterAllBars", "SetBarIcon", "SetInvert", "ShowBar",
"HideBar", "SetSourceIconPosition", "SetGroupFontSize"}

-- Internal functions for managing bars
local function getFrame()
	-- Check for an unused bar
	if( #(framePool) > 0 ) then
		return table.remove(framePool, 1)
	end
		
	-- Create the actual bar
	local frame = CreateFrame("StatusBar", nil, UIParent)
	frame:SetClampedToScreen(true)
	frame:SetMinMaxValues(0, 1)
	frame:SetValue(1)	
	
	frame.bg = CreateFrame("StatusBar", nil, frame)
	frame.bg:SetMinMaxValues(0, 1)
	frame.bg:SetValue(1)
	frame.bg:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
	frame.bg:SetFrameLevel(0)

	-- Create icons
	frame.icon = frame:CreateTexture(nil, "ARTWORK")
	frame.source = frame:CreateTexture(nil, "ARTWORK")
	
	-- Sparky
	frame.spark = frame:CreateTexture(nil, "OVERLAY")
	frame.spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	frame.spark:SetWidth(16)
	frame.spark:SetBlendMode("ADD")
	
	-- Timer text
	frame.timer = frame:CreateFontString(nil, "OVERLAY")
	frame.timer:SetFontObject(GameFontHighlight)
	frame.timer:SetJustifyH("RIGHT")
	
	-- Display Text
	frame.text = frame:CreateFontString(nil, "OVERLAY")
	frame.text:SetFontObject(GameFontHighlight)
	frame.text:SetJustifyH("LEFT")
	
	return frame
end

-- Release it to be reused later
local function releaseFrame(frame)
	-- Stop updates
	frame:SetScript("OnUpdate", nil)
	frame:EnableMouse(false)
	frame:Hide()

	-- Reset alpha so everythings visible again
	frame:SetAlpha(1.0)

	-- And now readd to the frame pool
	table.insert(framePool, frame)	
end

local function triggerFadeCallback(group, barID)
	if( type(group.onFadeHandler) == "table" and type(group.onFadeFunc) == "string" ) then
		group.onFadeHandler[group.onFadeFunc](group.onFadeHandler, barID)			
	elseif( type(group.onFadeFunc) == "string" ) then
		local func = getglobal(group.onFadeFunc)
		getglobal(group.onFadeFunc)(barID)
	elseif( type(group.onFadeFunc) == "function" ) then
		group.onFadeFunc(barID)
	end
end

-- Fadeout OnUpdate
local function fadeOnUpdate(self, elapsed)
	local time = GetTime()
	self.fadeTime = self.fadeTime - (time - self.lastUpdate)
	self.lastUpdate = time

	-- Done fading, hide
	if( self.fadeTime <= 0 ) then
		groups[self.owner]:UnregisterBar(self.barID)
		triggerFadeCallback(groups[self.originalOwner], self.barID)
		return
	end
		
	self:SetAlpha(self.fadeTime / self.timeToFade)
end

-- Starts to fade out the actual bar
local function fadeoutBar(self)
	local group = groups[self.owner]
	
	-- Don't fade at all, remove right now
	if( group.fadeTime <= 0 ) then
		group:UnregisterBar(self.barID)	
		triggerFadeCallback(groups[self.originalOwner])
		return
	end
	
	-- Start fading
	self.timeToFade = group.fadeTime
	self.fadeTime = group.fadeTime
	self:SetScript("OnUpdate", fadeOnUpdate)
end

-- OnUpdate for a bar
local function barOnUpdate(self)
	local time = GetTime()
	-- Check if times ran out and that we need to start fading it out
	self.secondsLeft = self.secondsLeft - (time - self.lastUpdate)
	self.lastUpdate = time
	if( self.secondsLeft <= 0 ) then
		-- Check if it's a repeating timer
		local bar = groups[self.groupName].bars[self.barID]
		if( bar.repeating ) then
			self.secondsLeft = self.startSeconds
			self.lastUpdate = time
			return
		end		
		self:SetValue(0)
		self.spark:Hide()		
		fadeoutBar(self)
		return
	end
	
	-- Timer text, need to see if this can be optimized a bit later
	local hour = floor(self.secondsLeft / 3600)
	local minutes = self.secondsLeft - (hour * 3600)
	minutes = floor(minutes / 60)
	
	local seconds = self.secondsLeft - ((hour * 3600) + (minutes * 60))
	local reversed = self.reversed
	
	if( hour > 0 ) then
		self.timer:SetFormattedText("%d:%02d", hour, minutes)
	elseif( minutes > 0 ) then
		self.timer:SetFormattedText("%d:%02d", minutes, floor(seconds))
	elseif( seconds < 10 ) then
		self.timer:SetFormattedText("%.1f", seconds)
	else
		self.timer:SetFormattedText("%.0f", floor(seconds))
	end
	
	local percent = self.secondsLeft / self.startSeconds

	-- Color gradient towards red
	if( self.gradients ) then
		-- finalColor + (currentColor - finalColor) * percentLeft		
		self:SetStatusBarColor(1.0 + (self.r - 1.0) * percent, self.g * percent, self.b * percent)
	end
	
	-- Spark position
	local sp = self:GetWidth() * percent
	sp = reversed and -sp or sp
	self.spark:SetPoint("CENTER", self, reversed and "RIGHT" or "LEFT", sp, 0)

	--self.spark:SetPoint("CENTER", self, "LEFT", self:GetWidth() * percent, 0)

	-- Now update the actual displayed bar
	self:SetValue(reversed and 1-percent or percent)

	--self:SetValue(percent)
end

-- Reposition the group
local function sortBars(a, b)
	return a.endTime < b.endTime
end

local function repositionFrames(group)
	table.sort(group.usedBars, sortBars)

	local offset = 0
	if( group.iconPosition == "LEFT" ) then
		offset = group.height
	end
	
	for i, bar in pairs(group.usedBars) do
		bar:ClearAllPoints()
		
		if( i > 1 ) then
			if( group.barGrowth == "DOWN" ) then
				bar:SetPoint("TOPLEFT", group.usedBars[i - 1], "BOTTOMLEFT", 0, 0)
			else
				bar:SetPoint("BOTTOMLEFT", group.usedBars[i - 1], "TOPLEFT", 0, 0)
			end
		elseif( group.barGrowth == "UP" ) then
			bar:SetPoint("BOTTOMLEFT", group.frame, "TOPLEFT", offset, 0)
		else
			bar:SetPoint("TOPLEFT", group.frame, "BOTTOMLEFT", offset, 0)
		end
		
		-- Did we hit the bar limit yet?
		if( not group.maxBars or i <= group.maxBars ) then
			bar:Show()
		else
			bar:Hide()
		end
	end
end

------------------------
--   PUBLIC METHODS   --
------------------------

-- Register a new group
local backdrop = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		--[[edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 0.80,]]--
		insets = {left = 1, right = 1, top = 1, bottom = 1}}

-- Dragging functions
local function OnDragStart(self)
	if( IsAltKeyDown() ) then
		self.isMoving = true
		self:StartMoving()
	end
end

local function OnDragStop(self)
	if( self.isMoving ) then
		self.isMoving = nil
		self:StopMovingOrSizing()

		--local scale = self:GetEffectiveScale()
		--local x, y = self:GetLeft() * scale, self:GetTop() * scale
		local x, y = self:GetLeft(), self:GetTop()

		local group = groups[self.name]
		if( group.onMoveHandler and group.onMoveFunc ) then
			group.onMoveHandler[group.onMoveFunc](group.onMoveHandler, self, x, y)			
		elseif( type(group.onMoveFunc) == "string" ) then
			getglobal(group.onMoveFunc)(self, x, y)
		elseif( type(group.onMoveFunc) == "function" ) then
			group.onMoveFunc(self, x, y)
		end
	end
end

local function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
	GameTooltip:SetText("Hold ALT and drag to a position of your choice.  Type /natur for options.", nil, nil, nil, nil, 1)
end

local function OnLeave(self)
	GameTooltip:Hide()
end

function Softrix:RegisterGroup(name, texture)

	local obj = {name = name, frame = CreateFrame("Frame", nil, UIParent), fontSize = 11, height = 16, obj = obj, bars = {}, usedBars = {}, reversed = false}
	
	-- Inject our methods
	for _, func in pairs(methods) do
		obj[func] = Softrix[func]
	end

	-- Register
	groups[name] = obj

	-- Set defaults
	local frame = obj.frame
	frame:SetHeight(12)
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetBackdrop(backdrop)
	frame:SetBackdropColor(0, 0, 0, 1.0)
	frame:SetBackdropBorderColor(0.75, 0.75, 0.75, 1.0)
	frame:SetScript("OnDragStart", OnDragStart)
	frame:SetScript("OnDragStop", OnDragStop)
	frame:SetScript("OnShow", OnShow)
	frame:SetScript("OnEnter", OnEnter)
	frame:SetScript("OnLeave", OnLeave)
	frame.name = name
	
	-- Display name
	frame.text = frame:CreateFontString(nil, "OVERLAY")
	frame.text:SetPoint("CENTER", frame)
	frame.text:SetFontObject(GameFontHighlightSmall)
	frame.text:SetText(name)
	
	obj:SetScale(1.0)
	obj:SetWidth(200)
	obj:SetFadeTime(0.25)
	obj:SetMaxBars(nil)
	obj:EnableGradient(true)
	obj:SetAnchorVisible(true)
	obj:SetBarGrowth("DOWN")
	obj:SetIconPosition("LEFT")
	obj:SetSourceIconPosition("RIGHT");	-- added by mik
	obj:SetTexture(texture)
	obj:SetBaseColor(0.0, 1.0, 0.0)
	obj:SetPoint("CENTER", UIParent, "CENTER")
	
	return obj	
end

-- Retrieve a group after it's been registered
function Softrix:GetGroup(name)
	return groups[name] and groups[name].obj
end

-- Returns every registered group and it's config obj
function Softrix:GetGroups()
	return groups
end

-----------------
----- MISC ------
-----------------

function Softrix.SetAnchorVisible(group, flag)
	
	group.anchorShown = flag
	
	if( flag ) then
		group.frame:EnableMouse(true)
		group.frame:SetAlpha(1.0)
	else
		group.frame:EnableMouse(false)
		group.frame:SetAlpha(0)
	end
end

function Softrix.RegisterOnMove(group, handler, func)
	if( func ) then
		group.onMoveHandler = handler
		group.onMoveFunc = func
	else
		group.onMoveFunc = handler
	end
end

-- Associate a function to call when bars fade
function Softrix.RegisterOnFade(group, handler, func)
	if( func ) then
		group.onFadeHandler = handler
		group.onFadeFunc = func
	else
		group.onFadeFunc = handler
	end
end


-----------------
-- BAR DISPLAY --
-----------------

local origBarID = {};

-- Hide an existing bar.
function Softrix.HideBar(group, id)
	if not group.bars[id] then return end
	--Keep record of this timer
	origBarID[id] = {update=group.bars[id].lastUpdate,text=group.bars[id].barText,timer=group.bars[id].secondsLeft,icon=group.bars[id].iconPath, source=group.bars[id].sourcePath,color={r=group.bars[id].r,g=group.bars[id].g,b=group.bars[id].b}}
	Softrix.UnregisterBar(group, id)
end

-- Show an existing bar that was previously hidden.
function Softrix.ShowBar(group, id, timer)
	if not origBarID[id] then return end
	local time = origBarID[id].timer - (GetTime() - origBarID[id].update)
	-- group, id, text, 60, 54, icon, r, g, b
	Softrix.RegisterBar(group, id, origBarID[id].text, time, timer, origBarID[id].icon, origBarID[id].source, origBarID[id].color.r, origBarID[id].color.g, origBarID[id].color.b)
end

-- Set Reversed Status
function Softrix.SetInvert(group, value)
	group.reversed = value
end

-- Height of all the bars
function Softrix.SetHeight(group, height)
	group.height = height
	group.frame:SetHeight(height)	
	for _, bar in pairs(group.bars) do
		bar.bg:SetHeight(height)
		bar:SetHeight(height)
	end
end

-- Gradients from base color -> red depending on time left
function Softrix.EnableGradient(group, flag)
	group.gradients = flag
end

-- Sets the max number of bars that can show up in this group
function Softrix.SetMaxBars(group, max)
	group.maxBars = max
	repositionFrames(group)
end

-- Group frame positioning, and all the timers inside it
function Softrix.SetPoint(group, ...)
	group.frame:ClearAllPoints()
	group.frame:SetPoint(...)
end

-- Bar scale
function Softrix.SetScale(group, scale)
	group.scale = scale
	group.frame:SetScale(scale)
end

-- Width of all the bars
function Softrix.SetWidth(group, width)
	group.width = width
	group.frame:SetWidth(width + group.height)

	for _, bar in pairs(group.bars) do
		bar.text:SetWidth((group.width - ((group.fontSize or size) * 3.6)) * 0.90)
		bar.bg:SetWidth(group.width)
		bar:SetWidth(group.width)
	end
end

-- Bar texture
function Softrix.SetTexture(group, texture)
	group.texture = texture
	for _, bar in pairs(group.bars) do
		bar.bg:SetStatusBarTexture(texture)
		bar:SetStatusBarTexture(texture)
	end
end

-- Bar growth mode (UP/DOWN)
function Softrix.SetBarGrowth(group, type)
	group.barGrowth = type
	repositionFrames(group)
end

-- Icon positioning (LEFT/RIGHT)
function Softrix.SetIconPosition(group, position)
	group.iconPosition = position
end

-- Source Icon positioning (LEFT/RIGHT)
function Softrix.SetSourceIconPosition(group, position)
	group.SourceiconPosition = position
end

-- Group object
function Softrix.SetBaseColor(group, r, g, b)
	if( not group.baseColor ) then
		group.baseColor = {}
	end
	group.baseColor.r = r
	group.baseColor.g = g
	group.baseColor.b = b
end

-- How many seconds we should take to fade out
function Softrix.SetFadeTime(group, seconds)
	group.fadeTime = seconds
end

-- Redirect everything to the specified group
function Softrix.SetDisplayGroup(group, name)
	-- Don't allow setting the group to redirect to itself
	if( name == "" or name == group.name ) then
		name = nil
	end
	-- Reset the bars if the display group changed
	if( group.redirectTo ~= name ) then
		group:UnregisterAllBars()
	end
	group.redirectTo = name
end

-- Gets the current display group
function Softrix.GetDisplayGroup(group)
	return group.redirectTo
end

-- Change the font size of the group
function Softrix.SetGroupFontSize(group, size)
	group.fontSize = size
end


--------------------
-- BAR MANAGEMENT --
--------------------

-- Register
function Softrix.RegisterBar(group, id, text, seconds, startSeconds, icon, source, r, g, b)
	
	local originalOwner = group.name
	
	-- Check if we're supposed to redirect this to another group, and that the group exists
	if( group.redirectTo and groups[group.redirectTo] ) then
		group = groups[group.redirectTo]
	end
	
	-- Already exists, remove the old one quickly
	if( group.bars[id] ) then
		group:UnregisterBar(id)
	end

	-- Retrieve a frame thats either recycled, or a newly created one
	local frame = getFrame()
		
	-- So we can do sorting and positioning
	table.insert(group.usedBars, frame)

	-- Grab basic info about the font
	local path, size, style = GameFontHighlight:GetFont()
	size = group.fontSize or size
	
	-- Timer text
	local timerTextWidth = size * 3.6
	
	frame.timer:SetPoint("LEFT", frame, "LEFT", 0, 0)
	frame.timer:SetFont(path, size, style)
	frame.timer:SetText(seconds)

	frame.timer:SetHeight(group.height)
	frame.timer:SetWidth(timerTextWidth)
	
	-- Display text
	frame.text:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
	frame.text:SetFont(path, size, style)
	frame.text:SetText(text)

	frame.text:SetHeight(group.height)
	frame.text:SetWidth((group.width - timerTextWidth) * 0.90)
	
	-- Timer spark
	frame.spark:SetHeight(group.height + 25)
	frame.spark:Show()
	
	-- Update icon
	if( icon ) then
		frame.icon:SetTexture(icon)
		
		if( frame.icon:GetTexture() ) then
			local offset = 0
			if( group.iconPosition == "LEFT" ) then
				offset = -group.height
			end
		
			frame.icon:SetWidth(group.height)
			frame.icon:SetHeight(group.height)
			frame.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
			frame.icon:SetPoint("TOPLEFT", frame, "TOP" .. group.iconPosition, offset, 0)
			frame.icon:Show()
		else
			frame.icon:Hide()
		end
	else
		frame.icon:Hide()
	end
	
	-- Update source icon
	if( source ) then
		frame.source:SetTexture(source)		
		if( frame.source:GetTexture() ) then
			local offset = 0
			if( group.SourceiconPosition == "LEFT" ) then
				offset = -group.height
			end		
			frame.source:SetWidth(group.height)
			frame.source:SetHeight(group.height)
			frame.source:SetTexCoord(0.07, 0.93, 0.07, 0.93)
			frame.source:SetPoint("TOPLEFT", frame, "TOP" .. group.SourceiconPosition, offset, 0)
			frame.source:Show()
		else
			frame.source:Hide()
		end
	else
		frame.source:Hide()
	end

	-- Set info the bar needs to know
	frame.r = r or group.baseColor.r
	frame.g = g or group.baseColor.g
	frame.b = b or group.baseColor.b
	frame.owner = group.name
	frame.originalOwner = originalOwner
	frame.lastUpdate = GetTime()
	frame.endTime = GetTime() + seconds
	frame.secondsLeft = seconds
	frame.startSeconds = startSeconds or seconds
	frame.gradients = group.gradients
	frame.groupName = group.name
	frame.iconPath = icon
	frame.barText = text
	frame.barID = id
	frame.reversed = group.reversed
		
	-- Setup background
	frame.bg:SetStatusBarTexture(group.texture)
	frame.bg:SetStatusBarColor(0.0, 0.5, 0.5, 0.5)
	frame.bg:SetWidth(group.width)
	frame.bg:SetHeight(group.height)
	
	-- Start it up
	frame:SetStatusBarTexture(group.texture)
	frame:SetStatusBarColor(frame.r, frame.g, frame.b)
	frame:SetWidth(group.width)
	frame:SetHeight(group.height)
	frame:SetScale(group.scale)
	frame:SetScript("OnUpdate", barOnUpdate)
	
	-- Reposition this group
	repositionFrames(group)

	-- Register it
	group.bars[id] = frame
end

-- Remove all bars
function Softrix.UnregisterAllBars(group)
	
	-- Check if we're supposed to redirect this to another group, and that the group exists
	if( group.redirectTo and groups[group.redirectTo] ) then
		group = groups[group.redirectTo]
	end

	-- Clear the used bars list
	local totalBars = #(group.usedBars)
	for i=totalBars, 1, -1 do
		table.remove(group.usedBars, i)
	end
	
	-- Release all the frames
	for id, bar in pairs(group.bars) do
		releaseFrame(bar)
		group.bars[id] = nil
	end
	
	return (totalBars > 0)
end

-- Unregistering
function Softrix.UnregisterBar(group, id)

	-- Check if we're supposed to redirect this to another group, and that the group exists
	if( group.redirectTo and groups[group.redirectTo] ) then
		group = groups[group.redirectTo]
	end

	-- Remove the old entry, if it exists
	if( not group.bars[id] ) then
		return nil
	end

	-- Remove from list of used bars
	for i=#(group.usedBars), 1, -1 do
		if( group.usedBars[i].barID == id ) then
			table.remove(group.usedBars, i)
			break
		end
	end

	releaseFrame(group.bars[id])
	repositionFrames(group)
	group.bars[id] = nil
	
	return true
end

-- Icon
function Softrix.SetBarIcon(group, id, icon, left, right, top, bottom)

	-- Check if we're supposed to redirect this to another group, and that the group exists
	if( group.redirectTo and groups[group.redirectTo] ) then
		group = groups[group.redirectTo]
	end

	local bar = group.bars[id]
	if( not bar ) then
		return
	end
	
	-- Display icon
	if( icon ) then
		bar.bar.icon:SetTexture(icon)		
		if( bar.bar.icon:GetTexture() ) then
			local mod = -1
			if( group.iconPosition == "RIGHT" ) then
				mod = 1
			end		
			bar.icon:SetWidth(group.height)
			bar.icon:SetHeight(group.height)
			bar.icon:SetTexCoord(left or 0.07, right or 0.93, top or 0.07, bottom or 0.93)
			bar.icon:SetPoint("TOPLEFT", bar, "TOP" .. group.iconPosition, mod * group.height, 0)
			bar.icon:Show()
		else
			bar.bar.icon:Hide()
		end
	else
		bar.bar.icon:Hide()
	end
end

-- Change it to a repeating timer
function Softrix.SetRepeatingTimer(group, id, flag)
	-- Check if we're supposed to redirect this to another group, and that the group exists
	if( group.redirectTo and groups[group.redirectTo] ) then
		group = groups[group.redirectTo]
	end
	local bar = group.bars[id]
	if( bar ) then
		bar.repeating = flag
	end
end


