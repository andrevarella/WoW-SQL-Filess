--[[
	Some notes regarding the mechanics and events triggered on weapon enchant changes:
	* There doesn't seem to be an event for temp weapon enchants, UNIT_INVENTORY_CHANGED works well to determine when you gain or lose one though.
	* When applying a shaman imbue, a UNIT_AURA event is also triggered unlike non-spell enchants like poisons etc.
	* The Blizz UI uses an OnUpdate handler to query GetWeaponEnchantInfo() on each update, I don't like that method at all.
	* Weapon enchant data seems to be updated *exactly* after the UNIT_INVENTORY_CHANGED event, which is why you cannot update the data during this event.
	* Zoning will suspend the weapon buff timer, probably the same mechanics that suspends them when logged out. This has been taken into account, by adding the time between leaving and entering the world, to the enchant timer.

	ChangeLog:
	### Rev 02 ###
	- Now checks if the result from GetWeaponEnchantInfo() is valid, if not, it will requery again in 0.5 sec. Invalid result is when (hasMainHandEnchant == 1) but (mainHandExpiration == 0).
	- The enchant endtime is now extended after zoning, this means that zoning should no longer reset the enchant, making the lib believe it is a new enchant.
	### Rev 03 ###
	- Can now scan simple white quality weapons, as the starting scan line was changed from 6 to 5.
	- Changed the "enchantPattern", it will now match "Fishing Lure" instead of "Fishing Lure (+100 Fishing Skill)" for example
	- Enchant duration is now reset to zero when weapon has no enchant.
	### Rev 04 ###
	- Few changes, just some cleanup
--]]

-- Initialise Library
local REVISION = 4;
if (type(LibWeaponEnchant) == "table") and (LibWeaponEnchant.vers >= REVISION) then
	return;
end
LibWeaponEnchant = LibWeaponEnchant or {};
LibWeaponEnchant.vers = REVISION;
LibWeaponEnchant.callbacks = LibWeaponEnchant.callbacks or {};

-- Variables
local updateTime = 0.1;
local callbacks = LibWeaponEnchant.callbacks;
local nextUpdate;
local leaveTime;

-- Weapon Enchant Variables
local mhSlot = GetInventorySlotInfo("MainHandSlot");
local ohSlot = GetInventorySlotInfo("SecondaryHandSlot");
local mhEnchant, ohEnchant;
local mhEndTime, ohEndTime = 0, 0;
local mhDuration, ohDuration;
local enchantPattern = "(.-) %(";		-- Old Pattern: "(.+) %(%d+ .+%)"

-- Frame
local f = CreateFrame("Frame");
f:SetScript("OnEvent",function(self,event,...) self[event](self,event,...); end);

-- Tooltip
local tip = CreateFrame("GameTooltip","LibWeaponEnchantTip",nil,"GameTooltipTemplate");
tip:SetOwner(UIParent,"ANCHOR_NONE");

--------------------------------------------------------------------------------------------------------
--                                         Scanning Functions                                         --
--------------------------------------------------------------------------------------------------------

-- Scan Tooltip
local function ScanWeaponTipEnchant(slotId)
	tip:ClearLines();
	tip:SetInventoryItem("player",slotId);
	for i = 5, tip:NumLines() do
		local enchant = _G["LibWeaponEnchantTipTextLeft"..i]:GetText():match(enchantPattern);
		if (enchant) then
			return enchant;
		end
	end
	return UNKNOWN;
end

-- Post Timers to Callback Functions
local function PostUpdate()
	for token, func in next, callbacks do
		func(token,mhSlot,mhEnchant,mhDuration,mhEndTime,ohSlot,ohEnchant,ohDuration,ohEndTime);
	end
end

-- Get Enchant Data
local function QueryWeaponEnchantData()
	local hasMainHandEnchant, mainHandExpiration, _, hasOffHandEnchant, offHandExpiration = GetWeaponEnchantInfo();
	-- Test if result is valid -- Have seen cases where hasMainHandEnchant is one, but the mainHandExpiration is still zero
	if (hasMainHandEnchant and mainHandExpiration == 0) or (hasOffHandEnchant and offHandExpiration == 0) then
		nextUpdate = updateTime;
		return;
	end
	-- Mainhand
	local hasChanged;
	if (hasMainHandEnchant) then
		local enchantName = ScanWeaponTipEnchant(mhSlot);
		local endTime = GetTime() + (mainHandExpiration / 1000);
		if (enchantName ~= mhEnchant) or (endTime > mhEndTime + 1.2) then
			mhEnchant = enchantName;
			mhEndTime = endTime;
			mhDuration = ceil(mainHandExpiration / 1000);
			hasChanged = true;
		end
	else
		hasChanged = (hasChanged or mhEnchant ~= nil);
		mhEnchant = nil;
		mhEndTime = 0;
		mhDuration = 0;
	end
	-- Offhand
	if (hasOffHandEnchant) then
		local enchantName = ScanWeaponTipEnchant(ohSlot);
		local endTime = GetTime() + (offHandExpiration / 1000);
		if (enchantName ~= ohEnchant) or (endTime > ohEndTime + 1.2) then
			ohEnchant = enchantName;
			ohEndTime = endTime;
			ohDuration = ceil(offHandExpiration / 1000);
			hasChanged = true;
		end
	else
		hasChanged = (hasChanged or ohEnchant ~= nil);
		ohEnchant = nil;
		ohEndTime = 0;
		ohDuration = 0;
	end
	-- Post Updates if Changed
	if (hasChanged) then
		PostUpdate();
	end
	-- Success
	return 1;
end

--------------------------------------------------------------------------------------------------------
--                                              OnUpdate                                              --
--------------------------------------------------------------------------------------------------------

-- OnUpdate
local function OnUpdate(self,elapsed)
	nextUpdate = (nextUpdate - elapsed);
	if (nextUpdate <= 0) and (QueryWeaponEnchantData()) then
		self:SetScript("OnUpdate",nil);
	end
end

-- Req Update
function f:RequestUpdate()
	nextUpdate = updateTime;
	self:SetScript("OnUpdate",OnUpdate);
end

--------------------------------------------------------------------------------------------------------
--                                               Events                                               --
--------------------------------------------------------------------------------------------------------

-- Leaving World
function f:PLAYER_LEAVING_WORLD(event)
	leaveTime = GetTime();
end

-- Entering World
function f:PLAYER_ENTERING_WORLD(event)
	if (leaveTime) and (mhEndTime > 0 or ohEndTime > 0) then
		local addedTime = (GetTime() - leaveTime);
		if (mhEndTime > 0) then
			mhEndTime = (mhEndTime + addedTime);
		end
		if (ohEndTime > 0) then
			ohEndTime = (ohEndTime + addedTime);
		end
		PostUpdate();
	end
	leaveTime = nil;
end

-- Inventory Change
function f:UNIT_INVENTORY_CHANGED(event,unit)
	if (unit == "player") then
		self:RequestUpdate();
	end
end

--------------------------------------------------------------------------------------------------------
--                                 Callback Registration  +  Get Data                                 --
--------------------------------------------------------------------------------------------------------

-- Return Enchant Variables -- Should perhaps call QueryWeaponEnchantData() if no callbacks are registered
function LibWeaponEnchant.GetEnchantData()
	return mhSlot, mhEnchant, mhDuration, mhEndTime, ohSlot, ohEnchant, ohDuration, ohEndTime;
end

-- Register Callback
function LibWeaponEnchant.RegisterCallback(token,func)
	if (not next(callbacks)) then
		f:RegisterEvent("PLAYER_ENTERING_WORLD");
		f:RegisterEvent("PLAYER_LEAVING_WORLD");
		f:RegisterEvent("UNIT_INVENTORY_CHANGED");
		f:RequestUpdate();
	end
	callbacks[token] = func;
end

-- Unregister Callback
function LibWeaponEnchant.UnregisterCallback(token)
	callbacks[token] = nil;
	if (not next(callbacks)) then
		f:UnregisterAllEvents();
		f:SetScript("OnUpdate",nil);
	end
end