-- Update by Silentdave (Ravegrobber - Kul'Tiras EU)
-- Due to various XML attribute changes in 3.0, the auto show and timer controlled hide of the PoisonerMenu no longer works. 
-- Thus added OnMouseUp to Minimapbutton in the XML file to toggle PoisonerMenu showing/hiding (linked to PoisonerMenu_Toggle() in this file

-- OnLoad event
function Poisoner_OnLoad(self)
	-- register for clicks
	self:RegisterForClicks("LeftButtonDown", "RightButtonDown", "MiddleButtonDown");
	self:RegisterForDrag("LeftButton");
	-- need this for the initial load
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
      -- register a slash command
        SLASH_POISONER1 = "/poisoner";
        SlashCmdList["POISONER"] = function(msg)
                Poisoner_ProcessCommand(msg);
        end;
	
	PoisonerDebug("Poisoner Loaded");
	
end

function Poisoner_OnEvent(self, event)
	if (event == "VARIABLES_LOADED") then
		Poisoner_OnVariablesLoaded(self);
	elseif (event == "PLAYER_REGEN_DISABLED") then
		Poisoner_OnEnterCombat();
	elseif (event == "PLAYER_REGEN_ENABLED") then
		Poisoner_OnLeaveCombat();
	end
end

function Poisoner_OnVariablesLoaded(self)
	if (POISONER_CONFIG == nil) then
		POISONER_CONFIG = {};
		local _, cls = UnitClass("player");
		POISONER_CONFIG.enabled = (cls == "ROGUE");
	end
	if (POISONER_CONFIG.scale ~= nil) then
		PoisonerMenu:SetScale(POISONER_CONFIG.scale);
	end
	Poisoner_SetPosition(POISONER_CONFIG.position or "left");
	if (POISONER_CONFIG.enabled) then
		PoisonerStateHeader:Show();
		PoisonerMinimapButton:Show();
	else
		PoisonerStateHeader:Hide();
	end
	if (not POISONER_CONFIG.tooltiptype) then
		POISONER_CONFIG.tooltiptype = "full"
	end
	PoisonerStateHeader.inCombat = false;
	PoisonerStateHeader:SetAttribute("state", "0");
	self:UnregisterEvent("VARIABLES_LOADED");
end

-- when entering combat we need to pregenerate the buttons, as that cannot be done during lockdown
function Poisoner_OnEnterCombat()
	PoisonerDebug("entering combat");
	PoisonerStateHeader.poisonCount = Poisoner_FindPoisons();
	Poisoner_CreateButtons();
	PoisonerStateHeader.inCombat = true;
end

function Poisoner_OnLeaveCombat()
	PoisonerDebug("leaving combat");
	PoisonerStateHeader.inCombat = false;
end

function Poisoner_OnItemButtonUpdate(button, elapsed)
	button.elapsed = button.elapsed + elapsed;
	if (button.needUpdate or button.elapsed > button.updateDelay) then
		-- find the current poison count for this button
		local _, _, itemName = string.find(button:GetName(), "^PoisonerMenuButton(.*)$");
		local count, rank;
		if (PoisonerStateHeader.poisonCount) then
			local rec = PoisonerStateHeader.poisonCount[itemName];
			if (rec) then
				count = rec.quantity;
				rank = rec.rank;
			end
		end
		
		-- and display it
		-- local cbutton = _G[button:GetName()];
		if (count and count > 0) then
			button:SetText(""..count);
			button:GetNormalTexture():SetVertexColor(1,1,1,1);
		else
			button:SetText("0");
			button:GetNormalTexture():SetVertexColor(0.5,0.5,0.5,1);
			button:GetHighlightTexture():SetVertexColor(0.5,0.5,0.5,1);
		end
		button.elapsed = 0;
		button.needUpdate = false;
	end
end

function Poisoner_OnMenuShow()
	-- find the current number of poisons available
	PoisonerStateHeader.poisonCount = Poisoner_FindPoisons();
	if (not PoisonerStateHeader.inCombat) then
		-- generate the appropriate buttons
		Poisoner_CreateButtons();
      end
end

function Poisoner_OnItemButtonClick(button)
	local _, _, itemName = string.find(button:GetName(), "^PoisonerMenuButton(.*)$");
	if (not SpellCanTargetItem()) then
		-- Poison is applying, decrement the count
		if (PoisonerStateHeader.poisonCount) then
			local rec = PoisonerStateHeader.poisonCount[itemName];
			if (rec) then
				rec.quantity = rec.quantity - 1;
			end
		end
	else
		-- still targetting, the box was displayed
		-- TODO: need to clear the cursor here somehow
	end
	button.needUpdate = true;
end


-- This function creates/initialises the individual buttons for each poison
-- type. Note that we re-use buttons if they had been previously created, as
-- there is no delete operation for frames.
function Poisoner_CreateButtons()
	local menu = PoisonerMenu;
	local i = 0;
	PoisonerDebug("Children of PoisonerMenu:")
	local children = { menu:GetChildren() };
	for _, child in ipairs(children) do
		PoisonerDebug(child:GetName());
		i = i+1;
	end
	PoisonerDebug(i.." children");

	local x = 0;
	for _, t in pairs(Poisoner_FindPoisons()) do
		local buttonName = "PoisonerMenuButton"..t.name;
		local button = _G[buttonName];
		if (not PoisonerStateHeader.inCombat) then
			if (button == nil) then

				button = CreateFrame("Button", buttonName, menu, "PoisonerItemButtonTemplate");
				local bfs = button:CreateFontString(buttonName.."Text","OVERLAY","GameFontNormal");
				bfs:SetPoint("BOTTOMRIGHT");
				bfs:SetTextColor(1,1,1,1);
				bfs:SetShadowColor(0,0,0,1);
				bfs:SetShadowOffset(-2,2);
				button:SetFontString(bfs);

				button:SetNormalTexture(t.icon);
				button:SetHighlightTexture(t.icon);
				button:GetNormalTexture():SetVertexColor(1,1,1,1);
				button:GetHighlightTexture():SetVertexColor(0.5,0.5,1,1);

				button:SetAttribute("type", "macro");
				button:SetAttribute("macrotext", "/use "..t.name.."\n/use [button:3] 18\n/use [button:2] 17\n/use [button:1] 16\n/click StaticPopup1Button1");
				

			end
			button:Hide();
			button:ClearAllPoints();
			if (t.quantity and t.quantity>0) then
				--button:SetScript("OnEnter", function() Poisoner_Tooltip(button,t.bag,t.bagslot,t.name) end);	
				--button:SetScript("OnLeave", function() GameTooltip:Hide() end);
				if (POISONER_CONFIG.position == "right") then
					button:SetPoint("TOPLEFT", x, 0);
					x = x + button:GetWidth() + 4;
				else
					button:SetPoint("TOPRIGHT", x, 0);
					x = x - button:GetWidth() - 4;
				end
				button:Show();
			end
			
			button.needUpdate = true;
		end
	end
	
	--[[local testbuttonName = PoisonerTestButton;
	if (testbutton == nil) then
	testbutton = CreateFrame("Button", "PoisonerTestButton", menu, "PoisonerItemButtonTemplate2");

				testbutton:SetNormalTexture("Interface\\Icons\\Spell_Nature_Reincarnation");
				testbutton:SetHighlightTexture("Interface\\Icons\\Spell_Nature_Reincarnation");
				testbutton:GetNormalTexture():SetVertexColor(1,1,1,1);
				testbutton:GetHighlightTexture():SetVertexColor(0.5,0.5,1,1);

				testbutton:SetAttribute("type", "macro");
				testbutton:SetAttribute("macrotext", "/use Sofort wirkendes Gift IX\n/use [button:2] 17\n/use [button:1] 16\n/click StaticPopup1Button1\n/say Poisoner TEST");
				
			--testbutton:Hide();
			testbutton:ClearAllPoints();
			testbutton:Show();
			if (POISONER_CONFIG.position == "right") then
				testbutton:SetPoint("TOPLEFT", x, 0);
				x = x + button:GetWidth() + 4;
			else
				testbutton:SetPoint("TOPRIGHT", x, 0);
				x = x - button:GetWidth() - 4;
			end
			testbutton:Show();
	
	end
	]]
end

--
-- Find available poisons
-- Returns an table keyed by poison name, value a table containing texture and quantity
--
function Poisoner_FindPoisons()
	local i, itemLink, bagSlots, bagId, icon, quantity;
	local ret = {};
	for i=0, 4 do
		itemLink = nil;
		bagSlots = GetContainerNumSlots(i);
		if (bagSlots > 0) then
			for j=1, bagSlots do
				itemLink = nil;
				itemLink = GetContainerItemLink(i, j);
				icon, quantity = GetContainerItemInfo(i, j)
				if (itemLink) then
					local itemId = nil;
					local itemName = nil;
					local itemRank = nil;
					local idx,pattern;
					for idx, pattern in ipairs(Poisoner_Patterns) do
						_, _, itemId, itemName, itemRank = string.find(itemLink, "item:(%d+).*%[("..pattern..")%]");
						if (itemName ~= nil) then
							break;
						end
					end
					
					if (itemName ~= nil) then
						-- if the quantity is 1, we either have a single consumable item, or an expendable item
						if (quantity == 1) then
							local charges = Poisoner_CountCharges(i, j);
							if (charges ~= nil) then
								quantity = charges;
							end
						end

						local t = ret[itemName];
						if (t == nil) then
							t = { name=itemName, icon=icon, quantity=0, rank=itemRank, id=itemId, bag=i, bagslot=j };
							ret[itemName] = t;
						end
						t.quantity = t.quantity + quantity;
						Poisoner_PoisonsEverSeen[itemName] = icon;
					end
				end
			end
		end
	end
	-- include zero counts for previously seen items we no longer have
	for prevItemName, prevIcon in pairs(Poisoner_PoisonsEverSeen) do
		local t = ret[prevItemName];
		if (t == nil) then
			t = { name=prevItemName, icon=prevIcon, quantity=0, bag=-1, bagslot=-1 };
			ret[prevItemName] = t;
		end
	end
	return ret;
end
-- since we cannot destroy frames, we must always remember everything we've seen
Poisoner_PoisonsEverSeen = {};

-- Use a tooltip to scan for the number of 'charges' on expendable items.
-- Returns the number of charges, or nil if it could not be found.
function Poisoner_CountCharges(bagId, bagSlot)
PoisonerDebug("Looking for charges of "..bagId..","..bagSlot);
	local ret = nil;
	PoisonerScannerTooltip:SetOwner(UIParent, "ANCHOR_NONE");
	PoisonerScannerTooltip:SetBagItem(bagId, bagSlot);
	for i=1,PoisonerScannerTooltip:NumLines() do
		local field = _G["PoisonerScannerTooltipTextLeft"..i];
		if (field ~= nil) then
			local text = field:GetText();
			if (text) then
				local _, _, charges = string.find(text, POISONER_PATTERN_CHARGES);
				if (charges) then
					ret = tonumber(charges);
					break;
				end
			end
		end
	end
	PoisonerScannerTooltip:Hide();
	return ret;
end


--
-- Slash command processing
--
function Poisoner_ProcessCommand(command)
	if (command == "lock") then
		Poisoner_DragLock();
	elseif (command == "unlock") then
		Poisoner_DragUnlock();
	elseif (command == "enable") then
		Poisoner_Enable();
	elseif (command == "disable") then
		Poisoner_Disable();
	elseif (command == "reset") then
		Poisoner_DragReset();
		Poisoner_SetScale(1.0);
		Poisoner_SetPosition("left");
	elseif (string.match(command, "^scale")) then
		local arg = string.match(command, "^scale%s+([%d%.]+)");
		Poisoner_SetScale(arg);
	elseif (string.match(command, "^position")) then
		local arg = string.match(command, "^position%s(%w+)");
		Poisoner_SetPosition(arg);
	elseif (command == "name") then
		POISONER_CONFIG.tooltiptype = "name";
	elseif (command == "full") then
		POISONER_CONFIG.tooltiptype = "full";
	else
		ChatFrame1:AddMessage(POISONER_COMMANDERROR..command, 1.0, 1.0, 0.5);
	end
end

function Poisoner_Disable()
	POISONER_CONFIG.enabled = false;
	if (PoisonerMenu:IsShown()) then
		PoisonerMenu:Hide();
	end
	PoisonerMinimapButton:Hide();
end

function Poisoner_Enable()
	POISONER_CONFIG.enabled = true;
	PoisonerMinimapButton:Show();
end

function PoisonerMenu_Toggle()
   	if (PoisonerMenu:IsShown()) then
		PoisonerMenu:Hide();
	else
		PoisonerMenu:Show();
	end
end

--
-- Dragging
--

-- Start dragging the poison button
function Poisoner_OnDragStart(self)
	if (not POISONER_CONFIG.dragLock and not Poisoner_BeingDragged) then
		self:StartMoving();
		Poisoner_BeingDragged = true;
	else
		ChatFrame1:AddMessage(POISONER_DRAGERROR, 1.0, 1.0, 0.5);
	end
end

-- Stop dragging the shard button
function Poisoner_OnDragStop(self)
	if (Poisoner_BeingDragged) then
		self:StopMovingOrSizing()
		Poisoner_BeingDragged = false;
	end
end

function Poisoner_DragLock()
	POISONER_CONFIG.dragLock = true;
end

function Poisoner_DragUnlock()
	POISONER_CONFIG.dragLock = false;
end

function Poisoner_DragReset()
	PoisonerMinimapButton:ClearAllPoints();
	PoisonerMinimapButton:SetPoint("BOTTOM", Minimap, -72, 112);
end


-- 
-- Scaling and position options
--

function Poisoner_SetScale(scale)
	POISONER_CONFIG.scale = scale;
	PoisonerMenu:SetScale(scale);
end

function Poisoner_SetPosition(position)
	if (position == "left" or position == "right") then
		POISONER_CONFIG.position = position;
		PoisonerMenu:ClearAllPoints();
		local p, rp;
		if (position == "right") then
			p = "TOPLEFT";
			rp = "RIGHT";
		else
			p = "TOPRIGHT";
			rp = "LEFT";
		end
		PoisonerMenu:SetPoint(p, PoisonerMinimapButton, rp);
	else
		-- error
		ChatFrame1:AddMessage(POISONER_POSITIONERROR, 1.0, 1.0, 0.5);
	end
end



--
--
-- Debugging : set to true if ya want it on
--

function PoisonerDebug(message)
	if (false) then
		if (message == nil) then
			message = "<nil>";
		end
		ChatFrame1:AddMessage(message);
	end
end

PoisonerOptions_SettingsFrame:Hide();