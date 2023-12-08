local Skada = Skada
local bars = Skada:GetModule("BarDisplay", true)
if not bars then return end

local L = LibStub("AceLocale-3.0"):GetLocale("Skada")
local mod = Skada:NewModule(L["Scroll"])

local db, _
local defaults = {
	speed = 2.0,
	kspeed = 3,
	icon = true,
	button = "MiddleButton"
}

mod.elap = 0

function mod.ShowCursor(win)
	if not db.icon then
		return
	end
	SetCursor("")
	mod.ScrollIcon = mod.ScrollIcon or {}
	if not mod.ScrollIcon[win] then
		local f = CreateFrame("Frame", nil, win.bargroup)
		f:SetFrameStrata("TOOLTIP")
		f:SetSize(32, 32)
		f:SetPoint("CENTER")
		local t = f:CreateTexture(nil, "OVERLAY")
		t:SetTexture([[Interface\AddOns\Skada\Media\Textures\icon-scroll]])
		t:SetAllPoints(f)
		t:Show()
		mod.ScrollIcon[win] = f
	end
	mod.ScrollIcon[win]:Show()
end

function mod.HideCursor(win)
	ResetCursor()
	if not db.icon then
		return
	end
	mod.ScrollIcon[win]:Hide()
end

function mod.BeginScroll(win)
	_, mod.ypos = GetCursorPosition()
	mod.scrolling = win
	mod.ShowCursor(win)
end

function mod.EndScroll(win)
	mod.scrolling = nil
	mod.HideCursor(win)
end

function mod.OnUpdate(f, elap)
	local win = mod.scrolling
	if not win then
		return
	end
	if not IsMouseButtonDown(db.button) then
		mod.EndScroll(win)
		return
	end
	mod.ShowCursor(win)
	mod.elap = mod.elap + elap
	if mod.elap < 0.1 then
		return
	end
	mod.elap = 0
	local _, newpos = GetCursorPosition()
	local step = (win.db.barheight + win.db.barspacing) / (win.bargroup:GetEffectiveScale() * db.speed)
	while math.abs(newpos - mod.ypos) > step do
		if newpos > mod.ypos then
			bars:OnMouseWheel(nil, win.bargroup, 1)
			mod.ypos = mod.ypos + step
		else
			bars:OnMouseWheel(nil, win.bargroup, -1)
			mod.ypos = mod.ypos - step
		end
	end
end

local windows = {}
function Skada:Scroll(up)
	for win, _ in pairs(windows) do
		for i = 1, db.kspeed do
			bars:OnMouseWheel(nil, win.bargroup, up and 1 or -1)
		end
	end
end

mod.frame = CreateFrame("Button", "SkadaScrollHiddenFrame", UIParent)
mod.frame:SetScript("OnUpdate", mod.OnUpdate)

local hooked = {}
function mod.Create(self, win)
	if win.bargroup and not hooked[win.bargroup] then
		win.bargroup:HookScript("OnMouseDown", function(frame, button)
			if button == db.button then
				mod.BeginScroll(win)
			end
		end)
		hooksecurefunc(win.bargroup, "SortBars", function()
			mod.HookMore(win)
		end)
		windows[win] = true
		hooked[win.bargroup] = true
	end
	if not hooked["init"] then
		db = Skada.db.profile.scroll or {}
		for k, v in pairs(defaults) do
			if db[k] == nil then
				db[k] = v
			end
		end
		hooked["init"] = true
	end
end

local function BarClick(bar, button)
	if button == db.button then
		mod.BeginScroll(bar.scrollwin)
	elseif hooked[bar] then
		(hooked[bar])(bar, button)
	end
end

function mod.HookMore(win)
	if not hooked[win] then
		local bars = win.bargroup:GetBars()
		if bars then
			for name, bar in pairs(bars) do
				local old = bar:GetScript("OnMouseDown")
				if old ~= BarClick then
					bar:SetScript("OnMouseDown", BarClick)
					bar.scrollwin = win
					hooked[bar] = old
				end
			end
		end
		hooked[win] = true
	end
end

function mod.CreateBar(self, win, name, label, value, maxvalue, icon, o)
	hooked[win] = false
end
hooksecurefunc(bars, "CreateBar", mod.CreateBar)

--
-- Options.
--

function mod.AddDisplayOptions(self, win, options)
	Skada.options.args.scrolloptions = {
		type = "group",
		name = L["Scroll"],
		desc = (L["Options for %s."]):format(L["Scroll"]),
		order = 970,
		set = function(info, val)
			db[info[#info]] = val
		end,
		get = function(info)
			return db[info[#info]]
		end,
		args = {
			mouse = {
				type = "group",
				name = L["Mouse"],
				inline = true,
				order = 10,
				args = {
					button = {
						type = "select",
						name = L["Scroll mouse button"],
						values = {
							["MiddleButton"] = KEY_BUTTON3,
							["Button4"] = KEY_BUTTON4,
							["Button5"] = KEY_BUTTON5
						},
						width = "double",
						order = 10
					},
					speed = {
						type = "range",
						name = L["Scrolling Speed"],
						min = 0.1,
						max = 10,
						step = 0.1,
						bigStep = 1,
						order = 20
					},
					icon = {
						type = "toggle",
						name = L["Scroll Icon"],
						order = 30
					},
				}
			},
			binding = {
				type = "group",
				name = L["Keybinding"],
				inline = true,
				order = 20,
				args = {
					upkey = {
						type = "keybinding",
						name = COMBAT_TEXT_SCROLL_UP,
						set = function(info, val)
							local b1, b2 = GetBindingKey("SKADA_SCROLLUP")
							if b1 then
								SetBinding(b1)
							end
							if b2 then
								SetBinding(b2)
							end
							SetBinding(val, "SKADA_SCROLLUP")
							SaveBindings(GetCurrentBindingSet())
						end,
						get = function(info)
							return GetBindingKey("SKADA_SCROLLUP")
						end,
						order = 10
					},
					downkey = {
						type = "keybinding",
						name = COMBAT_TEXT_SCROLL_DOWN,
						set = function(info, val)
							local b1, b2 = GetBindingKey("SKADA_SCROLLDOWN")
							if b1 then
								SetBinding(b1)
							end
							if b2 then
								SetBinding(b2)
							end
							SetBinding(val, "SKADA_SCROLLDOWN")
							SaveBindings(GetCurrentBindingSet())
						end,
						get = function(info)
							return GetBindingKey("SKADA_SCROLLDOWN")
						end,
						order = 20
					},
					kspeed = {
						type = "range",
						name = L["Key scrolling speed"],
						min = 1,
						max = 10,
						step = 1,
						width = "double",
						order = 30
					},
				}
			}
		}
	}
end

hooksecurefunc(bars, "Create", mod.Create)
hooksecurefunc(bars, "AddDisplayOptions", mod.AddDisplayOptions)
_G.BINDING_NAME_SKADA_SCROLLUP = COMBAT_TEXT_SCROLL_UP
_G.BINDING_NAME_SKADA_SCROLLDOWN = COMBAT_TEXT_SCROLL_DOWN