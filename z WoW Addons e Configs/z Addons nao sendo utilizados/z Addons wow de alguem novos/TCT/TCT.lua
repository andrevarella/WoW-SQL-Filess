local l = CreateFrame("Frame", nil, UIParent)
l.point = {"BOTTOM", UIParent, -20, 100} --Позиция иконок (сразу все 4 после /reload)

local GetInventoryItemLink = _G.GetInventoryItemLink
local GetInventoryItemTexture = _G.GetInventoryItemTexture
local GetMacroInfo = _G.GetMacroInfo
local GetActionInfo = _G.GetActionInfo
local substr = _G.string.sub
local wipe = _G.wipe
local playerGUID = UnitGUID("player")
local GetTime = _G.GetTime

l.spellToItem = l.spellToItem or {}
l.cooldownStartTimes = l.cooldownStartTimes or {}
l.cooldownDurations = l.cooldownDurations or {}
l.cooldowns = l.cooldowns or nil
l.hooks = l.hooks or {}

local enchantProcTimes = {}

if not l.eventFrame then
	l.eventFrame = CreateFrame("Frame")
	l.eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	l.eventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	l.eventFrame:RegisterEvent("PLAYER_LOGIN")
	l.eventFrame:SetScript("OnEvent", function(frame, event, ...)
		frame.l[event](frame.l, event, ...)
	end)
end
l.eventFrame.l = l

local INVALID_EVENTS = {
	SPELL_DISPEL 			= true,
	SPELL_DISPEL_FAILED 	= true,
	SPELL_STOLEN 			= true,
	SPELL_AURA_REMOVED 		= true,
	SPELL_AURA_REMOVED_DOSE = true,
	SPELL_AURA_BROKEN 		= true,
	SPELL_AURA_BROKEN_SPELL = true,
	SPELL_CAST_FAILED 		= true
}

local slots = {
	AMMOSLOT = 0,
	INVTYPE_HEAD = 1,
	INVTYPE_NECK = 2,
	INVTYPE_SHOULDER = 3,
	INVTYPE_BODY = 4,
	INVTYPE_CHEST = 5,
	INVTYPE_WAIST = 6,
	INVTYPE_LEGS = 7,
	INVTYPE_FEET = 8,
	INVTYPE_WRIST = 9,
	INVTYPE_HAND = 10,
	INVTYPE_FINGER = {11, 12},
	INVTYPE_TRINKET = {13, 14},
	INVTYPE_CLOAK = 15,
	INVTYPE_WEAPONMAINHAND = 16,
	INVTYPE_2HWEAPON = 16,
	INVTYPE_WEAPON = {16, 17},
	INVTYPE_HOLDABLE = 17,
	INVTYPE_SHIELD = 17,
	INVTYPE_WEAPONOFFHAND = 17,
	INVTYPE_RANGED = 18
}

function l:PLAYER_ENTERING_WORLD()
	playerGUID = UnitGUID("player")	
	self:Hook("GetInventoryItemCooldown")
	self:Hook("GetActionCooldown")
	self:Hook("GetItemCooldown")
end

function l:Hook(name)
	if l.hooks[name] then
		_G[name] = l.hooks[name]
	end
	l.hooks[name] = _G[name]
	_G[name] = function(...)
		return self[name](self, ...)
	end
end

local function checkSlotForEnchantID(slot, enchantID)
	local link = GetInventoryItemLink("player", slot)
	if not link then return false; end
	local itemID, enchant = link:match("item:(%d+):(%d+)")
	if tonumber(enchant or -1) == enchantID then
		return true, tonumber(itemID)
	else
		return false
	end
end

local function isEquipped(itemID)
	local _, _, _, _, _, _, _, _, equipLoc = GetItemInfo(itemID)
	local slot = slots[equipLoc]
	if type(slot) == "table" then
		for _, v in ipairs(slot) do
			local link = GetInventoryItemLink("player", v)
			if link and link:match(("item:%s"):format(itemID)) then
				return true
			end
		end
	else
		local link = GetInventoryItemLink("player", slot)
		if link and link:match(("item:%s"):format(itemID)) then
			return true
		end
	end
	return false
end

function l:COMBAT_LOG_EVENT_UNFILTERED(frame, timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName)
	playerGUID = playerGUID or UnitGUID("player")
	if ((destGUID == playerGUID and (sourceGUID == nil or sourceGUID == destGUID)) or sourceGUID == playerGUID) and not INVALID_EVENTS[event] and substr(event, 0, 6) == "SPELL_" then
		local itemID = l.spellToItem[spellID]
		if itemID then
			if type(itemID) == "table" then
				for k, v in ipairs(itemID) do
					if isEquipped(v) then
						self:SetCooldownFor(v, spellID, "ITEM")
					end
				end
				return
			else
				if isEquipped(itemID) then
					self:SetCooldownFor(itemID, spellID, "ITEM")
				end
				return
			end
		end
		local enchantID = l.enchants[spellID]
		if enchantID then
			local enchantID, slot1, slot2 = unpack(enchantID)
			local enchantPresent, itemID, first, second
			enchantPresent, itemID = checkSlotForEnchantID(slot1, enchantID)
			if enchantPresent then
				first = itemID
				if (enchantProcTimes[slot1] or 0) < GetTime() - (l.cooldowns[spellID] or 45) then
					enchantProcTimes[slot1] = GetTime()
					self:SetCooldownFor(itemID, spellID, "ENCHANT")
					return
				end
			end
			enchantPresent, itemID = checkSlotForEnchantID(slot2, enchantID)
			if enchantPresent then
				second = itemID
				if (enchantProcTimes[slot2] or 0) < GetTime() - (l.cooldowns[spellID] or 45) then
					enchantProcTimes[slot2] = GetTime()
					self:SetCooldownFor(itemID, spellID, "ENCHANT")
					return
				end
			end
			if first and second then
				if enchantProcTimes[slot1] < enchantProcTimes[slot2] then
					self:SetCooldownFor(first, spellID, "ENCHANT")
				else
					self:SetCooldownFor(second, spellID, "ENCHANT")
				end
			end
		end
		local metaID = l.metas[spellID]
		if metaID then
			local link = GetInventoryItemLink("player", 1)
			if link then
				local id = tonumber(link:match("item:(%d+)") or 0)
				if id and id ~= 0 then
					self:SetCooldownFor(id, spellID, "META")
				end
			end
			return
		end
		local talentID = l.talents[spellID]
		if talentID then
			self:SetCooldownFor(("%s: %s"):format(UnitClass("player"), talentID), spellID, "TALENT")
			return
		end
	end
end

function l:SetCooldownFor(itemID, spellID, procSource)
	local duration = l.cooldowns[spellID] or 45
	l.cooldownStartTimes[itemID] = GetTime()
	l.cooldownDurations[itemID] = duration
	if procSource == "TALENT" then
		l:TalentProc(spellID, GetTime, duration, procSource)
	else
		local GetTime = GetTime()
		l:Proc(itemID, spellID, GetTime, duration, procSource)
	end
end

local function cooldownReturn(id)
	if not id then return end
	local hasItem = id and l.cooldownStartTimes[id] and l.cooldownDurations[id]
	if hasItem then
		if l.cooldownStartTimes[id] + l.cooldownDurations[id] > GetTime() then
			return l.cooldownStartTimes[id], l.cooldownDurations[id], 1
		else
			return 0, 0, 0
		end
	else
		return nil
	end
end

function l:IsInternalItemCooldown(itemID)
	return cooldownReturn(itemID) ~= nil
end

function l:GetInventoryItemCooldown(unit, slot)
	local start, duration, enable = self.hooks.GetInventoryItemCooldown(unit, slot)
	if not enable or enable == 0 then
		local link = GetInventoryItemLink("player", slot)
		if link then
			local itemID = link:match("item:(%d+)")
			itemID = tonumber(itemID or 0)
			
			local start, duration, running = cooldownReturn(itemID)
			if start then return start, duration, running end
		end
	end
	return start, duration, enable
end

function l:GetActionCooldown(slotID)
	local t, id, subtype, globalID = GetActionInfo(slotID)
	if t == "item" then
		local start, duration, running = cooldownReturn(id)
		if start then return start, duration, running end
	elseif t == "macro" then
		local _, tex = GetMacroInfo(id)
		if tex == GetInventoryItemTexture("player", 13) then
			id = tonumber(GetInventoryItemLink("player", 13):match("item:(%d+)"))
			local start, duration, running = cooldownReturn(id)
			if start then return start, duration, running end
		elseif tex == GetInventoryItemTexture("player", 14) then
			id = tonumber(GetInventoryItemLink("player", 14):match("item:(%d+)"))
			local start, duration, running = cooldownReturn(id)
			if start then return start, duration, running end
		end
	end
	return self.hooks.GetActionCooldown(slotID)
end

function l:GetItemCooldown(param)
	local id
	local iparam = tonumber(param)
	if iparam and iparam > 0 then
		id = param
	elseif type(param) == "string" then
		local name, link = GetItemInfo(param)
		if link then
			id = link:match("item:(%d+)")
		end
	end
	if id then
		id = tonumber(id)
		local start, duration, running = cooldownReturn(id)
		if start then return start, duration, running end
	end
	return self.hooks.GetItemCooldown(param)
end

local spellToItem = {
	[64411] = 46017,
	[60065] = {44914, 40684, 49074},
	[60488] = 40373,
	[64713] = 45518,
	[60064] = {44912, 40682, 49706},
	[67703]	= {47303, 47115},
	[67708]	= {47303, 47115},
	[67772] = {47464, 47131},
	[67773] = {47464, 47131},
	[72416] = {50398, 50397},
	[72412] = {50402, 50401},
	[72418] = {50399, 50400},
	[72414] = {50404, 50403},
	[71485] = 50362,
	[71492] = 50362,
	[71486] = 50362,
	[71484] = 50362,
	[71491] = 50362,
	[71487] = 50362,
	[71556] = 50363,
	[71560] = 50363,
	[71558] = 50363,
	[71561] = 50363,
	[71559] = 50363,
	[71557] = 50363,	
	[71403] = 50198,
	[71610] = 50359,
	[71633] = 50352,
	[71601] = 50353,
	[71584] = 50358,
	[71401] = 50342,
    [71605] = 50360,
	[71541] = 50343,
	[71641] = 50366,
	[71639] = 50349,
	[71644] = 50348,
    [71636] = 50365,
	[75458] = 54569,
	[75466]	= 54572,
	-- [75490]	= 54573,
	[75477]	= 54571,
	[75456] = 54590,
	[75473]	= 54588,			
	-- [75495]	= 54589,
	[75480]	= 54591,
	[67117] = {48501, 48502, 48503, 48504, 48505, 48472, 48474, 48476, 48478, 48480, 48491, 48492, 48493, 48494, 48495, 48496, 48497, 48498, 48499, 48500, 48486, 48487, 48488, 48489, 48490, 48481, 48482, 48483, 48484, 48485},
	[67671] = 47214,
	[67669] = 47213,
	[64772] = 45609,
	[65024] = 46038,
	[60443] = 40371,
	[64790] = 45522,
	[60203] = 42990,
	[60494] = 40255,
	[65004] = 65005,
	[60492] = 39229,
	[60530] = 40258,
	[60437] = 40256,
	[49623] = 37835,
	[65019] = 45931,
	[64741] = 45490,
	[65014] = 45286,
	[65003] = 45929,
	[60538] = 40382,
	[58904] = 43573,
	[60062] = {40685, 49078},
	[64765] = 45507,
	[51353]	= 38358,
	[60218] = 37220,
	[60479] = 37660,
	[51348] = 38359,
	[63250] = 45131,
	[63250] = 45219,
	[60302] = 37390,
	[54808] = 40865,
	[60483] = 37264,
	[52424] = 38675,
	[55018] = 40767,
	[52419] = 38674,
	-- [18350] = 37111,
	[60520] = 37657,
	[60307] = 37064,
	[60233] = {44253, 44254, 44255, 42987},
	[60235] = {44253, 44254, 44255, 42987},
	[60229] = {44253, 44254, 44255, 42987},
	[60234] = {44253, 44254, 44255, 42987},
	[23684] = 19288,
}

local enchants = {
	-- [59620] = {3789, 16, 17},
	-- [28093] = {2673, 16, 17},
	-- [13907] = {912, 16, 17},
	[55637] = {3722, 15},
	[55775] = {3730, 15},
	[55767] = {3728, 15},
	[59626] = {3790, 16},
	[59625] = {3790, 16},	
}

local metas = {	
	-- [55382] = 41401,			
	-- [32848] = 25901,
	[23454] = 25899,
	[55341] = 41385,
	[18803] = 25893,
	[32845]	= 25898,
	[39959] = 32410,
	[55379] = 41400
}

local cooldowns = {
	[72416] = 60,
	[72412] = 60,
	[72418] = 60,
	[72414] = 60,
	[60488] = 15,
	[51348] = 10,
	[51353] = 10,
	[54808] = 60,
	[55018] = 60,
	[52419] = 30,
	[59620] = 90,
	[55382] = 15,
	[32848] = 15,
	[55341] = 90,
	[48517] = 30,
	[48518] = 30,
	[47755] = 12,
	[71485] = 105,
	[71492] = 105,
	[71486] = 105,
	[71484] = 105,
	[71491] = 105,
	[71487] = 105,
	[71556] = 105,
	[71560] = 105,
	[71558] = 105,
	[71561] = 105,
	[71559] = 105,
	[71557] = 105,
    [71605] = 90,
    [71636] = 90,
	[75458] = 45,
	[75466]	= 45,
	-- [75490]	= 54573,
	[75477]	= 45,
	[75456] = 45,
	[75473]	= 45,			
	-- [75495]	= 54589,
	[75480]	= 45,
	[59626] = 35,
	[59625] = 35, 	
}

local talents = {
	-- Druid
	[48517] = "Eclipse",
	[48518] = "Eclipse",
	[56453] = "Lock and Load",
	[52286] = "Will of the Necropolis",
	[47755] = "Rapture"
}

l.spellToItem = l.spellToItem or {}
l.cooldowns = l.cooldowns or {}
l.enchants = l.enchants or {}
l.metas = l.metas or {}
l.talents = l.talents or {}

local tt, tts = {}, {}
local function merge(t1, t2)
	wipe(tts)
	for _, v in ipairs(t1) do
		tts[v] = true
	end
	for _, v in ipairs(t2) do
		if not tts[v] then
			tinsert(t1, v)
		end
	end
end

for k, v in pairs(spellToItem) do
	local e = l.spellToItem[k]
	if e and e ~= v then
		if type(e) == "table" then
			if type(v) ~= "table" then
				wipe(tt)
				tinsert(tt, v)
			end
			merge(e, tt)
		else
			l.spellToItem[k] = {e, v}
		end
	else
		l.spellToItem[k] = v
	end
end

for k, v in pairs(cooldowns) do
	l.cooldowns[k] = v
end

for k, v in pairs(enchants) do
	l.enchants[k] = v
end

for k, v in pairs(metas) do
	l.metas[k] = v
end

for k, v in pairs(talents) do
	l.talents[k] = v
end


l.bsize = 1;
l.elements = {}

l.bd = {bgFile =  "Interface\\Buttons\\WHITE8X8",
        edgeFile =  "Interface\\Buttons\\WHITE8X8",
        tile = false, tileSize = 0, edgeSize = l.bsize,
        insets = { left = -l.bsize, right = -l.bsize, top = -l.bsize, bottom = -l.bsize
        }}

function l:CreateElements()
	for i=11, 14 do
	  local f = CreateFrame("frame", nil,self)
		f.cd1 = CreateFrame("cooldown", nil, f)
		f.cd2 = CreateFrame("cooldown", nil, f)
		f.tex = f:CreateTexture(nil, "OVERLAY")
		self.elements[i] = f
		self.elements[i].slot = i
		f.cd1:SetPoint("TOPLEFT", 2,-2)
		f.cd1:SetPoint("BOTTOMRIGHT", -2, 2)
		f.cd1:SetReverse(true)
		f.cd2:SetPoint("TOPLEFT", 2,-2)
		f.cd2:SetPoint("BOTTOMRIGHT", -2, 2)
        f.tex:SetPoint("TOPLEFT", 2,-2)
		f.tex:SetPoint("BOTTOMRIGHT", -2, 2)
        f.tex:SetTexCoord(.07, .93, .07, .93)
		f:SetSize(self:GetHeight(), self:GetHeight())
        f:SetBackdrop(l.bd)
        f:SetBackdropColor(0,0,0,.6)
		f:SetBackdropBorderColor(.1,.6,.1)
		if i==11 then
			f:SetPoint("LEFT")
		elseif i==12 then
			f:SetPoint("LEFT", self.elements[i-1], "RIGHT", 4, 0)
		elseif i==13 then
			f:SetPoint("LEFT", self.elements[i-1], "RIGHT", 4, 0)
		elseif i==14 then
			f:SetPoint("LEFT", self.elements[i-1], "RIGHT", 4, 0)
		end
	end
end

function l:CreateHolder()
	self:SetParent(UIParent)
	self:SetSize(40,40)
	self:SetPoint(unpack(l.point))
	--self:SetBackdrop(l.bd)
	self:SetBackdropColor(0,0,0,.5)
    self:CreateElements()
end

function l:UpdateIcon()
    for i=11,14 do
		self.elements[i].tex:SetTexture(nil)
        local itemID = GetInventoryItemID("player", i)
        if itemID then
		self.elements[i].id = itemID
		local icon = select(10, GetItemInfo(itemID))
            if not self.elements[i].tex:GetTexture() and itemID==50398 then
                self.elements[i].tex:SetTexture(icon)
				self.elements[i]:SetAlpha(1)
			elseif not self.elements[i].tex:GetTexture() and i>12 then
				self.elements[i].tex:SetTexture(icon)
				self.elements[i]:SetAlpha(1)
			elseif not self.elements[i].tex:GetTexture() then
			self.elements[i]:SetAlpha(0)
            end
        end
		self.elements[i].timer = 0
		self.elements[i]:SetScript("OnUpdate", function(fr, e) 
		fr.timer = fr.timer+e
			if l.elements[i].timer > 1 then
				if not fr.tex:GetTexture() then fr:SetAlpha(0) end
				fr.timer = 0
				fr:SetScript("OnUpdate", nil)
			end
		end)
    end
end

function l:PLAYER_EQUIPMENT_CHANGED(_,slot)
l:UpdateIcon()
end

function l:PLAYER_LOGIN()
	self:CreateHolder()
    self:UpdateIcon()
end

function l:Proc(itemID, spellID, GetTime, duration, procSource)
	for i=11, 14 do
		local id = self.elements[i].id
		local buffname = GetSpellInfo(spellID)
		if itemID==id then
			self.elements[i].cd2:SetAlpha(0)
			self.elements[i].cd2:SetScript("OnHide", function(fr) fr:GetParent():SetBackdropBorderColor(.1,.6,.1) end)
			self.elements[i].cd1:SetCooldown(select(7,UnitBuff("player", buffname)) - select(6,UnitBuff("player", buffname)), select(6,UnitBuff("player", buffname)))
			self.elements[i].cd2:SetCooldown(GetTime, duration)
			self.elements[i].cd1:SetScript("OnUpdate", function(fr)
				if not select(6,UnitBuff("player", buffname)) then
					fr:SetReverse(false)
					fr:GetParent().cd2:SetAlpha(1)
					fr:GetParent():SetBackdropBorderColor(.8,.2,.2)
					fr:SetScript("OnUpdate", nil)
				end
			end)
		end
	end
end

function l:TalentProc(spellID, GetTime, duration, procSource) end