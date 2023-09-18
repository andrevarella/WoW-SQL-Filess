-- KibsItemLevel, author Kibsgaard;
-- https://www.curseforge.com/wow/addons/kibs-item-level
local namespace = select(2,...);
LoadAddOn("LibItemUpgradeInfo-1.0");

local _G = _G;
local tonumber = tonumber;
local UIParent = UIParent;
local CreateFrame = CreateFrame;
local charFS = {};
local inspectFS = {};
local activeFS = {};
local charIcons = {};
local inspectIcons = {};
local activeIcons = {};
local enchantIcons = {};
local inspectEnchantIcons = {};
local activeEnchantIcons = {};
local iconSize = 16;
local iconOffset = 18;
local fontStyle = "SystemFont_Small";
local updateInProgress = false;
local updateInProgressInspect = false;
local GetItemIcon = GetItemIcon;
local GetItemInfo = GetItemInfo;
local GetInventoryItemLink = GetInventoryItemLink;
local GetName = GetName;
local GameTooltip = GameTooltip;
local str_find = string.find;
local str_match = string.gmatch;
local str_sub = string.sub;
local format = string.format;

-- globals;
local kitsLoadFrame = CreateFrame("Frame", nil, PaperDollFrame);
local ilvlFrame = CreateFrame("Frame");
local itemUpgradeInfo = LibStub("LibItemUpgradeInfo-1.0");
local variables_loaded = namespace.variables_loaded;
local enchatIcons = "INTERFACE/ICONS/inv_misc_enchantedscroll";

local emptySockets = {
	["Meta "]    	= "INTERFACE/ITEMSOCKETINGFRAME/UI-EmptySocket-Meta",
	["Red "]     	= "INTERFACE/ITEMSOCKETINGFRAME/UI-EmptySocket-Red",
	["Blue "]    	= "INTERFACE/ITEMSOCKETINGFRAME/UI-EmptySocket-Blue",
	["Yellow "] 	= "INTERFACE/ITEMSOCKETINGFRAME/UI-EmptySocket-Yellow",
	["Prismatic "]	= "INTERFACE/ITEMSOCKETINGFRAME/UI-EmptySocket-Prismatic",
};

local enchantableItems = {
	[1]  = true,  [2]  = nil,  [3]  = true,  [15] = true, [5]  = true, [9]  = true,
	[10] = true,  [6]  = nil,  [7]  = true,  [8]  = true, [11] = nil,  [12] = nil,
	[13] = nil,   [14] = nil,  [16] = true,  [17] = true, [18] = nil
};

local function findSockets(who,slot)
	local itemLink = GetInventoryItemLink(who,slot);
	local _, _, _, _, itemID = str_find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?");

	if (itemID) then
		-- SOCKETS;
		local _,cleanItemLink = GetItemInfo(itemID);
		if (cleanItemLink) then
			GameTooltip:ClearLines();
			GameTooltip:SetOwner(ilvlFrame, "CENTER");
			GameTooltip:SetHyperlink(cleanItemLink);
			
			local line;
			local texturePath;
			local GemSocketID = (slot - 1) * 3 + 1;
			local sockets = GemSocketID;
			
			for i = 1, 3 do
				activeIcons[i+GemSocketID-1].texture:SetAlpha(0.0);						
			end
			
			for i = 2, GameTooltip:NumLines() do
				line = _G[GameTooltip:GetName().."TextLeft"..i];
				if (line) then
					line = line:GetText();
					if (line) then
						if(line:find("Socket")) then
							texturePath = emptySockets[line:sub(1, line:find("Socket") - 1)];
							if (texturePath) then
								activeIcons[sockets].texture:SetTexture(""..texturePath);
								activeIcons[sockets].texture:SetAlpha(1.0);
								sockets = sockets + 1;
							end
						end
					end
				end
			end
			
			-- GEMS;
			for i = 1, 3 do
				local _, itemLink = GetItemGem(GetInventoryItemLink(who,slot),i);
				if (itemLink) then
					activeIcons[i+GemSocketID-1].texture:SetTexture(GetItemIcon(itemLink));
					activeIcons[i+GemSocketID-1].texture:SetAlpha(1.0);
					activeIcons[i+GemSocketID-1]:SetScript("OnEnter",function(s,m)
						GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR");
						GameTooltip:SetHyperlink(itemLink);
						GameTooltip:Show(); 
					end);
					activeIcons[i+GemSocketID-1]:SetScript("OnLeave",function(s,m)
						GameTooltip:Hide(); 
					end);
				end
			end
		end
	end
end

local function getEnchant(itemlink,i)
	if itemlink then
		local found, _, itemSubString = str_find(itemlink, "^|c%x+|H(.+)|h%[.*%]");
		local itemSubStringTable = {};

		for v in str_match(itemSubString, "[^:]+") do
			tinsert(itemSubStringTable, v);
		end
		
		itemSubString = itemSubStringTable[2]..":"..itemSubStringTable[3], itemSubStringTable[2];
		local stringStart, stringEnd = str_find(itemSubString, ":");
		itemSubString = str_sub(itemSubString, stringStart + 1);
		hasEnchant = itemSubString ~= "0"
	end
	
	-- did we find any enchants?;
	if hasEnchant then
		activeEnchantIcons[i].texture:SetTexture(enchatIcons);
		activeEnchantIcons[i].texture:SetVertexColor(1.0, 1.0, 1.0, 1);
	else
		if _data.enchantCharMiss then
			activeEnchantIcons[i].texture:SetVertexColor(1.0, 0.2, 0.2, 1);
		else
			activeEnchantIcons[i].texture:SetVertexColor(0, 0, 0, 0);
		end
	end
end

local function findItemInfo(who)
	if not (who) then
		return
	end
	
	if (who == "player") then
		activeFS = charFS;
		activeIcons = charIcons;
		activeEnchantIcons = enchantIcons;
		updateInProgress = false;
	else
		activeFS = inspectFS;
		activeIcons = inspectIcons;
		activeEnchantIcons = inspectEnchantIcons;
		updateInProgressInspect = false;
	end
	
	local tilvl = 0;
	local numItems = 16;
	GameTooltip:Hide();
	
	for i = 1, 18 do
		if (activeFS[i]) then
			local itemlink = GetInventoryItemLink(who,i);
			if (itemlink) then
				if (i == 17) then numItems = numItems+1; end
				
				GameTooltip:SetOwner(ilvlFrame, "CENTER");
				GameTooltip:SetHyperlink(itemlink);
				
				-- find enchants;
				if (enchantableItems[i] and _data.enchantChar) then
					getEnchant(itemlink, i);
				end
				
				-- find gems;
				if (_data.gemsChar) then
					findSockets(who,i);
				end
				
				-- find ilvl;
				local upgrade, max, delta = itemUpgradeInfo:GetItemUpgradeInfo(itemlink);
				local ilvl = itemUpgradeInfo:GetUpgradedItemLevel(itemlink);
				
				if not(ilvl) then ilvl = 0; end
				
				if (ilvl == 1) then
					ilvl = namespace.findHeirloomilvl();
				end
				
				if (upgrade and _data.upgrades) then
					activeFS[i]:SetText(ilvl .." ("..upgrade.."/"..max..")");
				else
					if (_data.ilvlChar) then
						activeFS[i]:SetText(ilvl);
					else
						activeFS[i]:SetText("");
					end
				end
				
				if (ilvl) then
					local color = namespace.itemLevelMixInGetColor(ilvl);
					if (_data.itemLevelColors) then
						activeFS[i]:SetTextColor(color.r, color.g, color.b, 1);
					else
						activeFS[i]:SetTextColor(1, 1, 1, 1);
					end
					tilvl = tilvl + ilvl;
				end
			else
				if (charFS[i]) then
					activeFS[i]:SetText("");
					if (enchantableItems[i]) then
						activeEnchantIcons[i].texture:SetAlpha(0.0);
						activeEnchantIcons[i]:SetScript("OnEnter", nil);
					end
					local slotID = (i - 1) * 3 + 1;
					for j = slotID, slotID + 2 do
						activeIcons[j].texture:SetAlpha(0.0);
						activeIcons[j]:SetScript("OnEnter", nil);
					end
				end
			end
		end
	end
	
	local unitGS, GSr, GSg, GSb = namespace.formatGearScore(who);
	if (not unitGS) then
		unitGS = 0;
		GSr, GSg, GSb = 1, 1, 1;
	end

	local itemLevel = math.floor((tilvl/numItems) * 100 * 0.01);
	local ilvlColor = namespace.itemLevelMixInGetColor(itemLevel);
	if (not itemLevel) then
		itemLevel = 0;
		ilvlColor = 1, 1, 1;
	end
	if (_data.GearScore and _data.iLvlScore) then
		if (who ~= "player") then
			InspectItemLevelFrame.ilvltext:SetFormattedText("%s/%d", unitGS, itemLevel);
			InspectItemLevelFrame.ilvltext:SetTextColor(GSr, GSg, GSb);
		else
			CharacterItemLevelFrame.ilvltext:SetFormattedText("%s/%d", unitGS, itemLevel);
			CharacterItemLevelFrame.ilvltext:SetTextColor(GSr, GSg, GSb);
		end
	elseif (_data.GearScore) then
		if (who ~= "player") then
			InspectItemLevelFrame.ilvltext:SetFormattedText("%s", unitGS);
			InspectItemLevelFrame.ilvltext:SetTextColor(GSr, GSg, GSb);
		else
			CharacterItemLevelFrame.ilvltext:SetFormattedText("%s", unitGS);
			CharacterItemLevelFrame.ilvltext:SetTextColor(GSr, GSg, GSb);
		end
	elseif (_data.iLvlScore) then
		if (who ~= "player") then
			InspectItemLevelFrame.ilvltext:SetFormattedText("%d", itemLevel);
			InspectItemLevelFrame.ilvltext:SetTextColor(ilvlColor.r, ilvlColor.g, ilvlColor.b);
		else
			CharacterItemLevelFrame.ilvltext:SetFormattedText("%d", itemLevel);
			CharacterItemLevelFrame.ilvltext:SetTextColor(ilvlColor.r, ilvlColor.g, ilvlColor.b);
		end
	else
		if (who ~= "player") then
			InspectItemLevelFrame.ilvltext:SetFormattedText("%d", itemLevel);
			InspectItemLevelFrame.ilvltext:SetTextColor(ilvlColor.r, ilvlColor.g, ilvlColor.b);
		else
			CharacterItemLevelFrame.ilvltext:SetFormattedText("%d", itemLevel);
			CharacterItemLevelFrame.ilvltext:SetTextColor(ilvlColor.r, ilvlColor.g, ilvlColor.b);
		end
	end
	GameTooltip:Hide();
end

local function updatePlayer()
	if (_data.enableChar) then
		findItemInfo("player");
	end
end

local function iLevel_OnShow(self,...)
	if (variables_loaded) then
		if (_data.enableChar) then
			updateInProgress = true;
			updatePlayer();
		end
	end
end

local function updateInspect()
	findItemInfo(InspectFrame.unit);
end

local function eventHandler(self,event,...)
	if (_data.enableConfig) then
		if (event == "PLAYER_TARGET_CHANGED" and ilvlFrame.inspectVisible and _data.enableInspect) then
			if (InspectFrame.unit and InspectFrame.unit == "target") then
				updateInspect();
			end
		elseif (event ~= "PLAYER_TARGET_CHANGED") then
			if (updateInProgress == false) then
				updateInProgress = true;
				updatePlayer();
			end
		elseif (event == "PLAYER_EQUIPMENT_CHANGED") then
			updatePlayer();
		end
	end
end

-- layout helpers;
local slotID = { 1, 2, 3, 15, 5, 4, 18, 9, 10, 6, 7, 8, 11, 12, 13, 14, 16, 17 };
local slotAlign1 = { "TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPRIGHT","TOPRIGHT","TOPRIGHT",
			"TOPLEFT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPLEFT","BOTTOMRIGHT",
			"BOTTOMRIGHT","BOTTOMLEFT" };
local slotAlign2 = { "TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPLEFT","TOPLEFT","TOPLEFT",
			"TOPRIGHT","TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPRIGHT","BOTTOMLEFT",
			"BOTTOMLEFT","BOTTOMRIGHT" };
local slotOffsetx = { 10, 10, 10, 10, 10, -10, -10, -10, 10, -10, -10, -10, -10, -10, 10, 33, 33, -33 };
local slotOffsety = { -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, 40, 40, 40 };
local iconAlign1 = { "TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPLEFT","TOPRIGHT","TOPRIGHT","TOPRIGHT",
			"TOPLEFT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPRIGHT","TOPLEFT","BOTTOMRIGHT",
			"BOTTOMRIGHT","BOTTOMRIGHT" };
local iconAlign2 = { "BOTTOMLEFT","BOTTOMLEFT","BOTTOMLEFT","BOTTOMLEFT","BOTTOMLEFT","BOTTOMRIGHT","BOTTOMRIGHT","BOTTOMRIGHT",
			"BOTTOMLEFT","BOTTOMRIGHT","BOTTOMRIGHT","BOTTOMRIGHT","BOTTOMRIGHT","BOTTOMRIGHT","BOTTOMLEFT","TOPRIGHT",
			"TOPRIGHT","TOPRIGHT" };
local iconOffsetx = { iconOffset, iconOffset, iconOffset, iconOffset, iconOffset, -iconOffset, -iconOffset, -iconOffset, 
			iconOffset, -iconOffset, -iconOffset, -iconOffset, -iconOffset, -iconOffset, iconOffset, -iconOffset, 
			-iconOffset, iconOffset };
local iconOffsety = { -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, iconOffset, iconOffset, iconOffset };

-- create font strings;
local charkids = { CharacterHeadSlot, CharacterNeckSlot, CharacterShoulderSlot, CharacterShirtSlot, CharacterChestSlot, CharacterWaistSlot, CharacterLegsSlot, CharacterFeetSlot, CharacterWristSlot, CharacterHandsSlot,
 CharacterFinger0Slot, CharacterFinger1Slot, CharacterTrinket0Slot, CharacterTrinket1Slot, CharacterBackSlot, CharacterMainHandSlot, CharacterSecondaryHandSlot, CharacterRangedSlot };
local function createCharKits()
	for i = 1, 18 do
		if not (i == 4) then -- exclude 4, shirt;
			local offset;
			local offsety;
			if (_data.enchantChar or _data.enchantCharMiss) then
				offset = iconOffsetx[i];
				offsety = iconOffsety[i]/7;
			else
				offset = 0;
				offsety = -iconOffset;
			end
			
			charFS[i] = charkids[i]:CreateFontString("iLvl_"..slotID[i], "OVERLAY", fontStyle);
			charFS[i]:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
			charFS[i]:SetText("");
			charFS[i]:SetPoint(slotAlign1[i], charkids[i], slotAlign2[i], slotOffsetx[i], slotOffsety[i]);
			
			if (enchantableItems[i]) then
				enchantIcons[i] = CreateFrame("Frame", "EnchantIcon"..i, charkids[i]);
				if (i ~= 16) and (i ~= 17) and (i ~= 18) then
					enchantIcons[i]:SetPoint(iconAlign1[i], charFS[i], iconAlign2[i], 0, iconOffsety[i]);
				else
					enchantIcons[i]:SetPoint(iconAlign1[i], charFS[i], iconAlign2[i], -5, offsety);
				end
				enchantIcons[i]:SetSize(iconSize,iconSize);

				local texture = enchantIcons[i]:CreateTexture("EnchantIconTex"..i, "OVERLAY");
				texture:SetAllPoints();
				enchantIcons[i].texture = texture;
				enchantIcons[i].texture:SetTexture(enchatIcons);
				enchantIcons[i].texture:SetAlpha(0.0);
				
				offsety = offsety + iconOffsety[i];
			end
			
			local iconSlotID = (i-1) * 3 + 1;
			for j = iconSlotID, iconSlotID + 2 do
				charIcons[j] = CreateFrame("Frame", "GemIcon"..j, charkids[i]);
				if (i ~= 16) and (i ~= 17) and (i ~= 18) then
					charIcons[j]:SetPoint(iconAlign1[i], charFS[i], iconAlign2[i], offset, iconOffsety[i]);
				else
					charIcons[j]:SetPoint(iconAlign1[i], charFS[i], iconAlign2[i], -5, offsety);
				end
				charIcons[j]:SetSize(iconSize,iconSize);
				
				local texture = charIcons[j]:CreateTexture("GemIconTex"..j, "OVERLAY");
				texture:SetAllPoints();
				charIcons[j].texture = texture;
				charIcons[j].texture:SetTexture(emptySockets["Prismatic "]);
				charIcons[j].texture:SetAlpha(0.0);
				
				offset = offset + iconOffsetx[i];
				offsety = offsety + iconOffsety[i];
			end
		end
	end
end

-- create font strings for the inspection window;
local inspkids = { InspectHeadSlot, InspectNeckSlot, InspectShoulderSlot, InspectShirtSlot, InspectChestSlot, InspectWaistSlot, InspectLegsSlot, InspectFeetSlot, InspectWristSlot, InspectHandsSlot,
 InspectFinger0Slot, InspectFinger1Slot, InspectTrinket0Slot, InspectTrinket1Slot, InspectBackSlot, InspectMainHandSlot, InspectSecondaryHandSlot, InspectRangedSlot };
local function createInspectKits()
	for i = 1, 18 do
		if not (i == 4) then -- exclude 4, shirt;
			local offset;
			local offsety;
			if (_data.enchantInsp or _data.enchantInspMiss) then
				offset = iconOffsetx[i];
				offsety = iconOffsety[i];
			else
				offset = 0;
				offsety = iconOffset;
			end
			
			inspectFS[i] = inspkids[i]:CreateFontString("iLvl_"..slotID[i], "ARTWORK", fontStyle);
			inspectFS[i]:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE");
			inspectFS[i]:SetText("");
			inspectFS[i]:SetPoint(slotAlign1[i], inspkids[i], slotAlign2[i] , slotOffsetx[i], slotOffsety[i]);
			
			if (enchantableItems[i]) then
				inspectEnchantIcons[i] = CreateFrame("Frame", "EnchantIcon"..i, inspkids[i]);
				if (i ~= 16) and (i ~= 17) and (i ~= 18) then
					inspectEnchantIcons[i]:SetPoint(iconAlign1[i], inspectFS[i], iconAlign2[i], 0, iconOffsety[i]);
				else
					inspectEnchantIcons[i]:SetPoint(iconAlign1[i], inspectFS[i], iconAlign2[i], -5, offsety + 2);
				end
				inspectEnchantIcons[i]:SetSize(iconSize,iconSize);

				local texture = inspectEnchantIcons[i]:CreateTexture("EnchantIconTex"..i, "ARTWORK");
				texture:SetAllPoints();
				inspectEnchantIcons[i].texture = texture;
				inspectEnchantIcons[i].texture:SetTexture(enchatIcons);
				inspectEnchantIcons[i].texture:SetAlpha(0.0);
				
				offsety = offsety + iconOffsety[i];
			end
			
			local iconSlotID = (i-1) * 3 + 1;
			for j = iconSlotID, iconSlotID + 2 do
				inspectIcons[j] = CreateFrame("Frame", "GemIcon"..j, inspkids[i]);
				if (i ~= 16) and (i ~= 17) and (i ~= 18) then
					inspectIcons[j]:SetPoint(iconAlign1[i], inspectFS[i], iconAlign2[i], offset, iconOffsety[i]);
				else
					inspectIcons[j]:SetPoint(iconAlign1[i], inspectFS[i], iconAlign2[i], -5, offsety);
				end
				inspectIcons[j]:SetSize(iconSize,iconSize);
				
				local texture = inspectIcons[j]:CreateTexture("GemIconTex"..j, "ARTWORK");
				texture:SetAllPoints();
				inspectIcons[j].texture = texture;
				inspectIcons[j].texture:SetTexture(emptySockets["Prismatic "]);
				inspectIcons[j].texture:SetAlpha(0.0);
				
				offset = offset + iconOffsetx[i];
				offsety = offsety + iconOffsety[i];
			end
		end
	end	
end

-- register event handler;
local function setupEventHandler(self,event)
	if (event == "VARIABLES_LOADED" or event == "PLAYER_LOGIN") then
		namespace.config_loaded();
		
		ilvlFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
		ilvlFrame:RegisterEvent("UNIT_INVENTORY_CHANGED");
		ilvlFrame:RegisterEvent("SOCKET_INFO_CLOSE");
		ilvlFrame:RegisterEvent("SOCKET_INFO_SUCCESS");
		ilvlFrame:RegisterEvent("SOCKET_INFO_UPDATE");
		ilvlFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
		ilvlFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
		
		InspectFrame:SetScript("OnShow", function(self)
			ilvlFrame.inspectVisible = true;
			updateInspect();
		end);
		InspectFrame:SetScript("OnHide", function(self)
			ilvlFrame.inspectVisible = false;
		end);
		
		ilvlFrame:SetScript("OnEvent", eventHandler);
		kitsLoadFrame:SetScript("OnShow", iLevel_OnShow);
		
		if (_data.enableChar) then updatePlayer(); end
		if (_data.resist) then
			CharacterResistanceFrame:Hide();
		else
			CharacterResistanceFrame:Show();
		end
		
		createCharKits();
		createInspectKits();
	end
end
ilvlFrame:RegisterEvent("VARIABLES_LOADED");
ilvlFrame:RegisterEvent("PLAYER_LOGIN");
ilvlFrame:SetScript("OnEvent", setupEventHandler);

function cleanUpiLvl()
	eventHandler(self, "PLAYER_EQUIPMENT_CHANGED");
end