--[[-------------------------------------------------
-- Interrupt Bar by Robrman, original by Kollektiv -- 
---------------------------------------------------]]

InterruptBarDB = InterruptBarDB or { scale = 1, hidden = false, smart=false,prio = false, cols=6, colsPrio=6, arenaOnly=false, bgOnly=false, lock = false }
local abilities = {}
local order
local arena=false
local bg=false
local band = bit.band

local spell_table={

-- Prio Bar

{spellID=6552,	time=10, prio=true}, -- Pummel
{spellID=72,	time=12, prio=true}, -- Shield Bash
{spellID=1766,	time=10, prio=true}, -- Kick
{spellID=57994,	time=6,  prio=true}, -- Wind Shear
{spellID=8177,  time=13, prio=true}, -- Grounding Totem
{spellID=2139,	time=24, prio=true}, -- Counterspell
{spellID=19647, time=24, prio=true}, -- Spell Lock
{spellID=47476, time=120,prio=true}, -- Strangulate
{spellID=34490, time=20, prio=true}, -- Silencing Shot
{spellID=15487,	time=45, prio=true}, -- Silence
{spellID=16979, time=15, prio=true}, -- Feral Charge - Bear
{spellID=48827,	time=30, prio=true}, -- Avenger's Shield
{spellID=47528,	time=10, prio=true}, -- Mind Freeze
{spellID=49576,	time=25, prio=true}, -- Death Grip
{spellID=48707, time=45, prio=true}, -- Anti-Magic Shell
{spellID=49039,	time=120,prio=true}, -- Lichborne
{spellID=47481, time=60, prio=true}, -- Gnaw
{spellID=23920, time=10, prio=true}, -- Spell Reflection
{spellID=59159, time=35, prio=true}, -- Thunderstorm
{spellID=31224, time=60, prio=true}, -- Cloak of Shadows
{spellID=19574,	time=64, prio=true}, -- Bestial Wrath
{spellID=34600,	time=28, prio=true}, -- Snake Trap
{spellID=1776,	time=10, prio=true}, -- Gouge
{spellID=60503,	time=6,  prio=true}, -- Taste for Blood
{spellID=5384,	time=30,  prio=true}, -- Feign Death

-- Main Bar

{spellID=53548,	time=40, prio=false},  -- Pin
{spellID=61384,	time=20, prio=false},  -- Typhoon
{spellID=49050, time=8,   prio=false}, -- Aimed Shot
{spellID=19503, time=30,  prio=false}, -- Scatter Shot
{spellID=14311, time=28,  prio=false}, -- Freezing Trap
{spellID=19263,	time=90,  prio=false}, -- Deterrence
{spellID=53480,	time=60,  prio=false}, -- Roar of Sacrifice
{spellID=53271,	time=60,  prio=false}, -- Master's Call
{spellID=23989,	time=180, prio=false}, -- Readiness
{spellID=49012,	time=60,  prio=false}, -- Wyvern Sting
{spellID=781,	time=16,  prio=false}, -- Disengage
{spellID=50334,	time=180, prio=false}, -- Berserk
{spellID=22812, time=60,  prio=false}, -- Barkskin
{spellID=8983,	time=60,  prio=false}, -- Bash
{spellID=53201,	time=60,  prio=false}, -- Starfall
{spellID=47847,	time=20,  prio=false}, -- Shadowfury
{spellID=17928,	time=40,  prio=false}, -- Howl of Terror
{spellID=48020,	time=30,  prio=false}, -- Demonic Circle: Teleport
{spellID=47860,	time=120, prio=false}, -- Death Coil
{spellID=18708,	time=180, prio=false}, -- Fel Domination
{spellID=1953,	time=15,  prio=false}, -- Blink
{spellID=44572,	time=30,  prio=false}, -- Deep Freeze
{spellID=42950,	time=20,  prio=false}, -- Dragon's Breath
{spellID=42945,	time=30,  prio=false}, -- Blast Wave
{spellID=45438,	time=240, prio=false}, -- Ice Block
{spellID=11958,	time=384, prio=false}, -- Cold Snap
{spellID=12043,	time=84,  prio=false}, -- Presence of Mind
{spellID=12051,	time=300, prio=false}, -- Evocation
{spellID=48792, time=120, prio=false}, -- Icebound Fortitude
{spellID=49206,	time=180, prio=false}, -- Summon Gargoyle
{spellID=49203,	time=60,  prio=false}, -- Hungering Cold
{spellID=10890,	time=27,  prio=false}, -- Psychic Scream
{spellID=64044,	time=120, prio=false}, -- Psychic Horror
{spellID=47585,	time=75,  prio=false}, -- Dispersion
{spellID=33206,	time=144, prio=false}, -- Pain Suppression
{spellID=10278,	time=180, prio=false}, -- Hand of Protection
{spellID=64205,	time=120, prio=false}, -- Divine Sacrifice
{spellID=10308, time=40,  prio=false}, -- Hammer of Justice
{spellID=20066,	time=60,  prio=false}, -- Repentance
{spellID=31884,	time=120, prio=false}, -- Avenging Wrath
{spellID=1044,  time=25,  prio=false}, -- Hand of Freedom
{spellID=642,	time=300, prio=false}, -- Divine Shield
{spellID=8643,  time=20,  prio=false}, -- Kidney Shot
{spellID=14185,	time=300, prio=false}, -- Preparation
{spellID=51722,	time=60,  prio=false}, -- Dismantle
{spellID=2094,	time=120, prio=false}, -- Blind
{spellID=26889,	time=120, prio=false}, -- Vanish
{spellID=36554, time=20,  prio=false}, -- Shadowstep
{spellID=51713, time=60,  prio=false}, -- Shadow Dance
{spellID=26669, time=180, prio=false}, -- Evasion
{spellID=51690,	time=75,  prio=false}, -- Killing Spree
{spellID=51514, time=45,  prio=false}, -- Hex
{spellID=30823,	time=60,  prio=false}, -- Shamanistic Rage
{spellID=16188,	time=120, prio=false}, -- Nature's Swiftness
{spellID=11578,	time=20,  prio=false}, -- Charge
{spellID=20252,	time=25,  prio=false}, -- Intercept
{spellID=18499,	time=30,  prio=false}, -- Berserker Rage
{spellID=46968,	time=20,  prio=false}, -- Shockwave
{spellID=12809,	time=30,  prio=false}, -- Concussion Blow
{spellID=46924,	time=75,  prio=false}, -- Bladestorm
{spellID=5246,	time=120, prio=false}, -- Intimidating Shout
{spellID=871,   time=300, prio=false}, -- Shield Wall
{spellID=71607,	time=120, prio=false}, -- Bauble of True Blood
{spellID=71646,	time=120, prio=false}, -- Bauble of True Blood
{spellID=7744,	time=120, prio=false}, -- Will of the Forsaken


--[[---------------  Other - Essas nao contam, estao ai apenas se vc quiser adicionar elas la em cima  ------------------------

				Death Knight

{spellID=51052, time=120, prio=false}, -- Anti-Magic Zone
14311 freezing trap
frost trap 13809
arrow 60192

raciais:
stoneform - 20594 2m cd
arcane torrent 28730 2m
war stomp 20549 2m
gift of the naaru 59547 3m
escape artist 20589 1.75m
every man for himself 59752 2m

hand of sacrifice 6940 2m

feign death nao da pra colocar

sfiend 34433 3m / 5mcd
fade 586 24s sem glyph
fear ward 6346 3m
desperate prayer 48173 2m
divine hymn 64843 8m

enraged regen 55694 3m
retal 20230 5m
shield block 2565 1m
disarm warr 676 1m
intervene 3411 30

sprint 11305 3m

lobos de enhance
stoneclaw

{spellID=45182,	time=60,  prio=false}, -- Cheat Death


dbw - strenght of the taunka 71561
67773 DV hc, DV normal 67708

				Druid

{spellID=22812, time=60, prio=false}, -- Barkskin




				Hunter

{spellID=19577,	time=42,  prio=false}, -- Intimidation
Some missing: ravage, pin, etc
Freezing Arrow 60192 28s


				Mage

{spellID=12472,	time=144, prio=false}, -- Icy Veins




				Paladin

{spellID=10308, time=40,  prio=false}, -- Hammer of Justice
{spellID=1044,  time=25,  prio=false}, -- Hand of Freedom
{spellID=20066,	time=60,  prio=false}, -- Repentance

				Priest

{spellID=10060,	time=96,  prio=false}, -- Power Infusion


				Rogue

{spellID=11286,	time=10,  prio=false}, -- Gouge
{spellID=2094,	time=120, prio=false}, -- Blind
{spellID=26889,	time=120, prio=false}, -- Vanish
{spellID=36554, time=20,  prio=false}, -- Shadowstep
{spellID=51713, time=60,  prio=false}, -- Shadow Dance



				Shaman

{spellID=49916, time=15, prio=false}, -- Grounding Totem
{spellID=30823,	time=60, prio=false}, -- Shamanistic Rage
				
				Warlock

{spellID=17928,	time=40,  prio=false}, -- Howl of Terror
{spellID=48020,	time=30,  prio=false}, -- Demonic Circle: Teleport
{spellID=18708,	time=180, prio=false}, -- Fel Domination
{spellID=30283,	time=20,  prio=false}, -- Shadowfury

				Warrior

{spellID=5246,	time=120, prio=false}, -- Intimidating Shout
{spellID=46968,	time=20,  prio=false}, -- Shockwave
{spellID=12809,	time=30,  prio=false}, -- Concussion Blow
{spellID=46924,	time=90,  prio=false}, -- Bladestorm
{spellID=57755,	time=60,  prio=false}, -- Heroic Throw

--------------------------------------------------]]
}
-----------------------------------------------------
-----------------------------------------------------

for k,spell in ipairs(spell_table) do
	local name,_,spellicon = GetSpellInfo(spell.spellID)	
	abilities[spell.spellID] = { icon = spellicon, duration = spell.time }
end

local frame
local bar
local bar2

local x = -45
local x2 = -45
local y2 = 0
local count2 = 0
local count=0
local y=0
local totalIcons=0
local GetTime = GetTime
local ipairs = ipairs
local pairs = pairs
local select = select
local floor = floor
local band = bit.band
local GetSpellInfo = GetSpellInfo

local GROUP_UNITS = bit.bor(0x00000010, 0x00000400)

local activetimers = {}

local size = 0
local function getsize()
	size = 0
	for k in pairs(activetimers) do
		size = size + 1
	end
end

local function isInBG()
	local a,type = IsInInstance()
	if (type == "pvp") then
		return true
	end
	return false
end

local function isInArena()
	local _,type = IsInInstance()
	if (type == "arena") then
		return true
	end
	return false
	
end
local function isPrio(ability)
	for _,v in ipairs(spell_table) do
		if v.spellID==ability then
			return v.prio
		end
	end
	return false
end

local function InterruptBar_AddIcons()
	for _,ability in ipairs(spell_table) do
		local btn = CreateFrame("Frame",nil,bar)
		btn:SetWidth(30)
		btn:SetHeight(30)
		if InterruptBarDB.prio and isPrio(ability.spellID) then
			btn:SetPoint("CENTER",bar2,"CENTER",x2,y2)
		else
			btn:SetPoint("CENTER",bar,"CENTER",x,y)
		end
			
		btn:SetFrameStrata("LOW")
		
		local cd = CreateFrame("Cooldown",nil,btn)
		cd.noomnicc = false
		cd.noCooldownCount = false
		cd:SetAllPoints(true)
		cd:SetFrameStrata("LOW")
		cd:Hide()
		
		local texture = btn:CreateTexture(nil,"LOW")
		texture:SetAllPoints(true)
		texture:SetTexture(abilities[ability.spellID].icon)
		texture:SetTexCoord(0.07,0.9,0.07,0.90)
	
		--local text = cd:CreateFontString(nil,"ARTWORK")
		--text:SetFont(STANDARD_TEXT_FONT,18,"OUTLINE")
		--text:SetTextColor(1,1,0,1)
		--text:SetPoint("LEFT",btn,"LEFT",1,0)
		
		btn.texture = texture
		--btn.text = texture
		btn.duration = abilities[ability.spellID].duration
		btn.cd = cd
		if InterruptBarDB.prio and isPrio(ability.spellID) then
			bar2[ability.spellID] = btn
			x2 = x2 + 30
			count2 = count2 + 1
			totalIcons = totalIcons + 1
			if count2 >= InterruptBarDB.colsPrio and InterruptBarDB.colsPrio > 0 then
				y2 = y2 - 30
				x2 =-45
				count2=0
			end
		else
			bar[ability.spellID] = btn
			x = x + 30
			count = count + 1
			totalIcons = totalIcons + 1
			if count >= InterruptBarDB.cols and InterruptBarDB.cols > 0 then
				y = y - 30
				x=-45
				count=0
			end
		end
	end
	x = -45
	count=0
	y=0
	active=0
	x2 = -45
	count2=0
	y2=0
end

local function InterruptBar_AddIcon(ability)
	if InterruptBarDB.prio and isPrio(ability) then
		if not bar2[ability]:IsVisible() then
			bar2[ability]:SetPoint("CENTER",bar2,"CENTER",x2,y2)
			bar2[ability]:Show()
			x2 = x2 + 30
			count2 = count2 + 1
			if count2 >= InterruptBarDB.colsPrio and InterruptBarDB.colsPrio > 0 then
				y2 = y2 - 30
				x2=-45
				count2=0
			end
		end	
	else
		if not bar[ability]:IsVisible() then
			bar[ability]:SetPoint("CENTER",bar,"CENTER",x,y)
			bar[ability]:Show()
			x = x + 30
			count = count + 1
			if count >= InterruptBarDB.cols and InterruptBarDB.cols > 0 then
				y = y - 30
				x=-45
				count=0
			end
		end
	end
end


local function InterruptBar_SavePosition()
	local point, _, relativePoint, xOfs, yOfs = bar:GetPoint()
	if not InterruptBarDB.Position then 
		InterruptBarDB.Position = {}
	end
	--first bar
	InterruptBarDB.Position.point = point
	InterruptBarDB.Position.relativePoint = relativePoint
	InterruptBarDB.Position.xOfs = xOfs
	InterruptBarDB.Position.yOfs = yOfs
	--second bar
	local point, _, relativePoint, xOfs, yOfs = bar2:GetPoint()
	InterruptBarDB.Position.point2 = point
	InterruptBarDB.Position.relativePoint2 = relativePoint
	InterruptBarDB.Position.xOfs2 = xOfs
	InterruptBarDB.Position.yOfs2 = yOfs
end

local function InterruptBar_LoadPosition()
	if InterruptBarDB.Position then
		bar:SetPoint(InterruptBarDB.Position.point,UIParent,InterruptBarDB.Position.relativePoint,InterruptBarDB.Position.xOfs,InterruptBarDB.Position.yOfs)
		if InterruptBarDB.Position.point2 then
			bar2:SetPoint(InterruptBarDB.Position.point2,UIParent,InterruptBarDB.Position.relativePoint2,InterruptBarDB.Position.xOfs2,InterruptBarDB.Position.yOfs2)
		else
			bar2:SetPoint("CENTER", UIParent, "CENTER")
		end
	else
		bar:SetPoint("CENTER", UIParent, "CENTER")
		bar2:SetPoint("CENTER", UIParent, "CENTER")
	end
end

local function InterruptBar_Repos()
	if (InterruptBarDB.bgOnly and not bg and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.bgOnly and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.arenaOnly and InterruptBarDB.bgOnly and not bg) then return end
	if not InterruptBarDB.smart then
		x = -45
		count=0
		y=0
		x2 = -45
		count2 = 0
		y2 = 0
		active=0
		for _,v in ipairs(spell_table) do
			if InterruptBarDB.prio and isPrio(v.spellID) then
				bar2[v.spellID]:Hide()
			else
				bar[v.spellID]:Hide()
			end
			InterruptBar_AddIcon(v.spellID)
			if InterruptBarDB.hidden then
				if InterruptBarDB.prio and isPrio(v.spellID) then
					bar2[v.spellID]:Hide()
				else
					bar[v.spellID]:Hide()
				end
			end
		end
	else 
		if InterruptBarDB.hidden then
			x = -45
			count=0
			y=0
			x2 = -45
			count2 = 0
			y2 = 0
			for _,v in ipairs(spell_table) do
				if InterruptBarDB.prio and isPrio(v.spellID) then
					bar2[v.spellID]:Hide() 
				else
					bar[v.spellID]:Hide()
				end
				if activetimers[v.spellID] then
					InterruptBar_AddIcon(v.spellID)
				end
			end
		end
	end
end

local function InterruptBar_UpdateBar()
	bar:SetScale(InterruptBarDB.scale)
	bar2:SetScale(InterruptBarDB.scale)
	
	if (InterruptBarDB.bgOnly and not bg and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.bgOnly and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.arenaOnly and InterruptBarDB.bgOnly and not bg) then return end

	if InterruptBarDB.prio then
		bar2:Show()
	end
	if not InterruptBarDB.prio then
		for _,v in ipairs(spell_table) do
			if isPrio(v.spellID) and bar2[v.spellID] then
				bar[v.spellID]=bar2[v.spellID] 
			end
		end
		bar2:Hide()
	elseif InterruptBarDB.prio and table.getn(bar2) == 0 then
		for _,v in ipairs(spell_table) do
			if InterruptBarDB.prio and isPrio(v.spellID) then
				if bar[v.spellID] and not bar2[v.spellID] then
					bar2[v.spellID]=bar[v.spellID]
				end
			end
		end
	end
	if InterruptBarDB.hidden or InterruptBarDB.smart then
		if InterruptBarDB.smart then
			x = -45
			count=0
			y=0
			x2 = -45
			y2 = 0
			count2 = 0
		end
		for _,v in ipairs(spell_table) do
			if InterruptBarDB.prio and isPrio(v.spellID) then
				bar2[v.spellID]:Hide()
			else	
				bar[v.spellID]:Hide()
			end
		end
	else
		for _,v in ipairs(spell_table) do
			if InterruptBarDB.prio and isPrio(v.spellID) then
				bar2[v.spellID]:Show() 
			else
				bar[v.spellID]:Show() 
			end
		end
	end
	if InterruptBarDB.lock then
		bar:EnableMouse(false)
		bar2:EnableMouse(false)
	else
		bar:EnableMouse(true)
		bar2:EnableMouse(true)
	end
end

local function InterruptBar_CreateBar()
	bar = CreateFrame("Frame", nil, UIParent)
	bar:SetMovable(true)
	bar:SetWidth(120)
	bar:SetHeight(30)
	bar:SetClampedToScreen(true) 
	bar:SetScript("OnMouseDown",function(self,button) if button == "LeftButton" then self:StartMoving() end end)
	bar:SetScript("OnMouseUp",function(self,button) if button == "LeftButton" then self:StopMovingOrSizing() InterruptBar_SavePosition() end end)
	bar:Show()

	bar2 = CreateFrame("Frame", nil, UIParent)
	bar2:SetMovable(true)
	bar2:SetWidth(120)
	bar2:SetHeight(30)
	bar2:SetClampedToScreen(true) 
	bar2:SetScript("OnMouseDown",function(self,button) if button == "LeftButton" then self:StartMoving() end end)
	bar2:SetScript("OnMouseUp",function(self,button) if button == "LeftButton" then self:StopMovingOrSizing() InterruptBar_SavePosition() end end)
	bar2:Show()
	
	InterruptBar_AddIcons()
	InterruptBar_UpdateBar()
	InterruptBar_LoadPosition()
end

--local function InterruptBar_UpdateText(text,cooldown)
	--if cooldown < 60 then 
		--if cooldown <= 0.5 then
	--		text:SetText("")
	--	elseif cooldown < 10 then
--			text:SetFormattedText(" %d",cooldown)
--		else
--			text:SetFormattedText("%d",cooldown)
--		end
--	else
--		local m=floor((cooldown+30)/60)
--		text:SetFormattedText("%dm",m)
--	end
--	if cooldown < 6 then 
--		text:SetTextColor(1,0,0,1)
--	else 
--		text:SetTextColor(1,1,0,1) 
--	end
--end

local function InterruptBar_StopAbility(ref,ability)
	if InterruptBarDB.hidden then ref:Hide() end
	if activetimers[ability] then activetimers[ability] = nil end
--	ref.text:SetText("")
	ref.cd:Hide()
	if InterruptBarDB.hidden and InterruptBarDB.smart then InterruptBar_Repos() end
end

local function InterruptBar_StopAbility(ref,ability)
	if InterruptBarDB.hidden then
		if ref then
			ref:Hide()
		else
			if isPrio(ability) and InterruptBarDB.prio then
				ref=bar2[ability]
			else
				ref=bar[ability]	
			end
		end
	end
	if activetimers[ability] then activetimers[ability] = nil end
	if ref then
--		ref.text:SetText("")
		ref.cd:Hide()
	end
	if InterruptBarDB.hidden then InterruptBar_Repos() end
end

local time = 0
local function InterruptBar_OnUpdate(self, elapsed)
	time = time + elapsed
	if time > 0.25 then
		getsize()
		for ability,ref in pairs(activetimers) do
			ref.cooldown = ref.start + ref.duration - GetTime()
			if ref.cooldown <= 0 then
				InterruptBar_StopAbility(ref,ability)
			else 
--				InterruptBar_UpdateText(ref.text,floor(ref.cooldown+0.5))
			end
		end
		if size == 0 then frame:SetScript("OnUpdate",nil) end
		time = time - 0.25
	end
end

local function InterruptBar_StartTimer(ref,ability)
	if (InterruptBarDB.bgOnly and not bg and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.bgOnly and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.arenaOnly and InterruptBarDB.bgOnly and not bg) then return end
	if InterruptBarDB.hidden or InterruptBarDB.smart or InterruptBarDB.smartPrio then
		ref:Show()
	end
	local duration
	activetimers[ability] = ref
	ref.cd:Show()
	ref.cd:SetCooldown(GetTime()-0.40,ref.duration)
	ref.start = GetTime()
	--InterruptBar_UpdateText(ref.text,ref.duration)
	frame:SetScript("OnUpdate",InterruptBar_OnUpdate)
end

local function InterruptBar_COMBAT_LOG_EVENT_UNFILTERED(...)
	local spellID, ability, useSecondDuration
	return function(_, eventtype, _, srcName, srcFlags, _, dstName, dstFlags, id)
		if (band(srcFlags, 0x00000040) == 0x00000040 and (eventtype == "SPELL_CAST_SUCCESS" or eventtype == "SPELL_AURA_APPLIED")) then 
			spellID = id
		else
			return
		end
		if (InterruptBarDB.bgOnly and not bg and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.bgOnly and InterruptBarDB.arenaOnly and not arena) or (not InterruptBarDB.arenaOnly and InterruptBarDB.bgOnly and not bg) then return end
		local cold_snap={44572,45438,12472,31687}
		local prep={26889,36554}
		local ready={19263,19503,34490,14311,19386}
		if spellID == 11958 then --cold snap 82676 Ring of Frost -- 44572 Deep Freeze -- 45438 Ice Block
			if InterruptBarDB.prio and isPrio(ability) then
				for _,abil in ipairs(cold_snap) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar2[abil],abil)
					end
				end
			else
				for _,abil in ipairs(cold_snap) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar[abil],abil)
					end
				end
			end
		elseif spellID == 14185 then --prep
			if InterruptBarDB.prio and isPrio(ability) then
				for _,abil in ipairs(prep) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar2[abil],abil)
					end
				end
			else
				for _,abil in ipairs(prep) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar[abil],abil)
					end
				end
			end
		elseif spellID == 23989 then --readiness
			if InterruptBarDB.prio and isPrio(ability) then
				for _,abil in ipairs(ready) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar2[abil],abil)
					end
				end
			else
				for _,abil in ipairs(ready) do
					if activetimers[abil] then
						InterruptBar_StopAbility(bar[abil],abil)
					end
				end
			end
		end
		useSecondDuration = false

-- Feral Charges

		if spellID == 49376 then spellID = 16979; useSecondDuration = true end
		if abilities[spellID] then	
			if useSecondDuration and spellID == 49376 then
				bar[spellID].duration = 15
			elseif spellID == 49376 then
				bar[spellID].duration = 15
			end
			if InterruptBarDB.smart then
				InterruptBar_AddIcon(spellID)
			end
			if InterruptBarDB.prio and isPrio(spellID) then
				InterruptBar_StartTimer(bar2[spellID],spellID)
			else
				InterruptBar_StartTimer(bar[spellID],spellID)
			end
		end

-- Freezing Trap, Freezing Arrow and Frost Trap

		if spellID == 60192 then spellID = 14311; useSecondDuration = true end
		if abilities[spellID] then	
			if useSecondDuration and spellID == 60192 then
				bar[spellID].duration = 24
			elseif spellID == 60192 then
				bar[spellID].duration = 24
			end
			if InterruptBarDB.smart then
				InterruptBar_AddIcon(spellID)
			end
			if InterruptBarDB.prio and isPrio(spellID) then
				InterruptBar_StartTimer(bar2[spellID],spellID)
			else
				InterruptBar_StartTimer(bar[spellID],spellID)
			end
		end

		if spellID == 14311 then spellID = 60192; useSecondDuration = true end
		if abilities[spellID] then	
			if useSecondDuration and spellID == 14311 then
				bar[spellID].duration = 24
			elseif spellID == 14311 then
				bar[spellID].duration = 24
			end
			if InterruptBarDB.smart then
				InterruptBar_AddIcon(spellID)
			end
			if InterruptBarDB.prio and isPrio(spellID) then
				InterruptBar_StartTimer(bar2[spellID],spellID)
			else
				InterruptBar_StartTimer(bar[spellID],spellID)
			end
		end

		if spellID == 13809 then spellID = 14311; useSecondDuration = true end
		if abilities[spellID] then	
			if useSecondDuration and spellID == 13809 then
				bar[spellID].duration = 24
			elseif spellID == 13809 then
				bar[spellID].duration = 24
			end
			if InterruptBarDB.smart then
				InterruptBar_AddIcon(spellID)
			end
			if InterruptBarDB.prio and isPrio(spellID) then
				InterruptBar_StartTimer(bar2[spellID],spellID)
			else
				InterruptBar_StartTimer(bar[spellID],spellID)
			end
		end
	end
end

InterruptBar_COMBAT_LOG_EVENT_UNFILTERED = InterruptBar_COMBAT_LOG_EVENT_UNFILTERED()


local function InterruptBar_ResetAllTimers()
	for _,ability in ipairs(spell_table) do
		if InterruptBarDB.prio and isPrio(ability.spellID) then
			InterruptBar_StopAbility(bar2[ability.spellID],ability.spellID)
		else
			InterruptBar_StopAbility(bar[ability.spellID],ability.spellID)
		end
	end
	if not InterruptBarDB.smart and not (InterruptBarDB.smart and InterruptBarDB.hidden) then
		InterruptBar_Repos()
	end

end

local function InterruptBar_Reset()
	InterruptBarDB = InterruptBarDB or { scale = 1, hidden = false, smart=false,prio = false, cols=6, colsPrio=6, arenaOnly=false, bgOnly=false, lock = false }
	InterruptBar_ResetAllTimers()
	InterruptBar_UpdateBar()
	InterruptBar_LoadPosition()
end
local function InterruptBar_PLAYER_ENTERING_WORLD(self)
	arena=isInArena()
	bg=isInBG()
	InterruptBar_Reset()
end
local function InterruptBar_Test()
		if InterruptBarDB.smart and InterruptBarDB.hidden then 
			InterruptBar_Repos()
		end
		for _,ability in ipairs(spell_table) do
		if InterruptBarDB.smart then InterruptBar_AddIcon(ability.spellID) end
			if InterruptBarDB.prio and isPrio(ability.spellID) then
				InterruptBar_StartTimer(bar2[ability.spellID],ability.spellID)
			else
				InterruptBar_StartTimer(bar[ability.spellID],ability.spellID)
			end
		end
end


local cmdfuncs = {
	scale = function(v) InterruptBarDB.scale = v; InterruptBar_UpdateBar() end,
	hidden = function() InterruptBarDB.hidden = not InterruptBarDB.hidden; InterruptBar_UpdateBar() end,
	smart = function() InterruptBarDB.smart = not InterruptBarDB.smart; InterruptBar_Reset() end,
	lock = function() InterruptBarDB.lock = not InterruptBarDB.lock; InterruptBar_UpdateBar() end,
	prio = function() InterruptBarDB.prio = not InterruptBarDB.prio; InterruptBar_UpdateBar();InterruptBar_Repos() end,
	arenaonly = function() InterruptBarDB.arenaOnly = not InterruptBarDB.arenaOnly; InterruptBar_Reset() end,
	bgonly = function() InterruptBarDB.bgOnly = not InterruptBarDB.bgOnly; InterruptBar_Reset() end,
	cols = function(id,v) 
		if not id or not v then return end
		if ((id == 1 or id == 2) and v >= 0) then 
			if id==1 then
				InterruptBarDB.cols = v
			elseif id==2 then
				InterruptBarDB.colsPrio = v
			end
				InterruptBar_Repos()
		end
	end,
	reset = function() InterruptBar_Reset() end,
	test = function() InterruptBar_Test() end,
}

local cmdtbl = {}
function InterruptBar_Command(cmd)
	for k in ipairs(cmdtbl) do
		cmdtbl[k] = nil
	end
	for v in gmatch(cmd, "[%d|%a|.]+") do
		tinsert(cmdtbl, v)
	end
  local cb = cmdfuncs[cmdtbl[1]] 
  if cb then
  	local s = tonumber(cmdtbl[2])
  	local ss = tonumber(cmdtbl[3])
  	cb(s,ss)
  else
	ChatFrame1:AddMessage("-- scale <number> | value: " .. InterruptBarDB.scale,0,1,0)
  	ChatFrame1:AddMessage("-- hidden (toggle) Hide when off CD | value: " .. tostring(InterruptBarDB.hidden),0,1,0)
	ChatFrame1:AddMessage("-- smart (toggle) Only show CD when used | value: " .. tostring(InterruptBarDB.smart),0,1,0)
  	ChatFrame1:AddMessage("-- lock (toggle) | value: " .. tostring(InterruptBarDB.lock),0,1,0)
	ChatFrame1:AddMessage("-- prio (toggle second anchor w/ priority spells) | value: " .. tostring(InterruptBarDB.prio),0,1,0)
	ChatFrame1:AddMessage("-- arenaonly (toggle arena only mode) | value: " .. tostring(InterruptBarDB.arenaOnly),0,1,0)
	ChatFrame1:AddMessage("-- bgonly (toggle bg only mode) | value: " .. tostring(InterruptBarDB.bgOnly),0,1,0)
	ChatFrame1:AddMessage("-- cols <bar ID(1=main, 2=prio)> <num> (0 = 1 row) | bar1=" .. tostring(InterruptBarDB.cols).." bar2=" .. tostring(InterruptBarDB.colsPrio),0,1,0)
  	ChatFrame1:AddMessage("-- test (execute)",0,1,0)
  	ChatFrame1:AddMessage("-- reset (execute)",0,1,0)
  end
end

local function InterruptBar_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	if not InterruptBarDB.scale then InterruptBarDB.scale = 1 end
	if not InterruptBarDB.hidden then InterruptBarDB.hidden = false end
	if not InterruptBarDB.smart then InterruptBarDB.smart = false end
	if not InterruptBarDB.prio then InterruptBarDB.prio = false end
	if not InterruptBarDB.arenaOnly then InterruptBarDB.arenaOnly=false end
	if not InterruptBarDB.bgOnly then InterruptBarDB.bgOnly=false end
	if not InterruptBarDB.cols then InterruptBarDB.cols = 6 end
	if not InterruptBarDB.colsPrio then InterruptBarDB.colsPrio = 6 end
	if not InterruptBarDB.lock then InterruptBarDB.lock = false end
	InterruptBar_CreateBar()
	
	SlashCmdList["InterruptBar"] = InterruptBar_Command
	SLASH_InterruptBar1 = "/ib"
	
	ChatFrame1:AddMessage("Interrupt Bar by Robrman, original by Kollektiv, . Type /ib for options.",0,1,0)
end

local eventhandler = {
	["VARIABLES_LOADED"] = function(self) InterruptBar_OnLoad(self) end,
	["PLAYER_ENTERING_WORLD"] = function(self) InterruptBar_PLAYER_ENTERING_WORLD(self) end,
	["COMBAT_LOG_EVENT_UNFILTERED"] = function(self,...) InterruptBar_COMBAT_LOG_EVENT_UNFILTERED(...) end,
}

local function InterruptBar_OnEvent(self,event,...)
	eventhandler[event](self,...)
end

frame = CreateFrame("Frame",nil,UIParent)
frame:SetScript("OnEvent",InterruptBar_OnEvent)
frame:RegisterEvent("VARIABLES_LOADED")
