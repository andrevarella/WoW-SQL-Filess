local ADDON_NAME = "NameplateClass";
local ADDON_PATH = "Interface\\Addons\\" .. ADDON_NAME;

local AceAddon = LibStub("AceAddon-3.0");
local AceConfig = LibStub("AceConfig-3.0");
local AceDb = LibStub("AceDB-3.0");
local LibNameplate = LibStub("LibNameplate-1.0");
local LibEvents = LibStub("LibEvents-1.0");
local LibLogger = LibStub("LibLogger-1.0");
local AceTimer = LibStub("AceTimer-3.0");

local addon = AceAddon:NewAddon(ADDON_NAME);
local events = LibEvents:New(addon);
local log = LibLogger:New(addon);

addon.logLevel = 20;
addon.Utils = {};
addon.nameplateFrames = {};

local dbDefaults = {
	profile = {
			Enabled = true,
			Size = 32,
			Alpha = 1,
			DisplayClassIconBorder = true,
			ClassIconBorderFollowNameplateColor = true,
			OffsetX = 7,
			OffsetY = -9,
			ShowQuestionMarks = false,
			UpdateFrequency = 1
	}
}

function addon:OnInitialize()
	self.dbRoot = AceDb:New("DB", dbDefaults, true);
	self.db = self.dbRoot.profile;
	self.storages = { 
		PlayerClasses = self:CreateStorage()
	};
end

function addon:OnEnable()
	if self.db.Enabled == false then
		self:Disable();
		return;
	end
	
	self.timer = AceTimer:ScheduleRepeatingTimer(function() self:AutoUpdate() end, self.db.UpdateFrequency);
	
	LibNameplate.RegisterCallback(self, "LibNameplate_NewNameplate", function(event, ...) self:OnNameplateCreated(...) end)
	LibNameplate.RegisterCallback(self, "LibNameplate_FoundGUID", function(event, ...) self:OnNameplateDiscoveredGuid(...) end )
	LibNameplate.RegisterCallback(self, "LibNameplate_RecycleNameplate", function(event, ...) self:OnNameplateRecycled(...) end )
	
	events:Enable();
	
	events:PARTY_MEMBERS_CHANGED();
	
	self:UpdateAllNameplates();
end

function addon:OnDisable()
	LibNameplate.UnregisterAllCallbacks(self);
	events:Disable();
	
	if self.timer ~= nil then
		AceTimer:CancelTimer(self.timer);
	end
	
	local nameplatesList = {LibNameplate:GetAllNameplates()};
	
	for i = 2, nameplatesList[1] do
		local nameplate = nameplatesList[i]
		local frame = self:GetNameplateFrame(nameplate);
		frame:ClearClass();
	end
end

function addon:UpdateTimer()
	self.timer.delay = self.db.UpdateFrequency;
end

function addon:AutoUpdate()
	local nameplatesList = {LibNameplate:GetAllNameplates()};
	for i = 2, nameplatesList[1] do
		local nameplate = nameplatesList[i]
		local frame = self:GetNameplateFrame(nameplate);
		self:UpdateBorderColor(frame);
	end
end

-- { storage1 = {function get(self, key), function set(self, key, value), function reset(self)}, storage2 = {...}, ... }
function addon:CreateStorage(getFunc, setFunc, resetFunc)
	local storage = {}
	
	if getFunc == nil then
		storage.storage = {}
		getFunc = function(self, playerName) return self.storage[playerName] end;
		setFunc = function(self, playerName, unifiedClass) self.storage[playerName] = unifiedClass end;
		resetFunc = function(self) self.storage = {} end
	end
	
	storage.Get = getFunc;
	storage.Set = setFunc;
	storage.Reset = resetFunc;

	return storage;
end

function addon:SetStorage(categoryName, storage)
	if storage == nil then 
		error() 
	end
	
	self.storages[categoryName] = storage;
end

function addon:GetStorage(categoryName)
	return self.storages[categoryName];
end

function addon:IndexToClass(classIndex)
	return PLAYER_CLASSES[classIndex];
end

function addon:ClassToIndex(unifiedClass)
	if unifiedClass == nil then error() end
	return PLAYER_CLASSES_INDEXES[unifiedClass]
end

function addon:OnNameplateCreated(nameplate)
	self:UpdateNameplate(nameplate)
end

function addon:OnNameplateDiscoveredGuid(nameplate, GUID, unitID)
	self:UpdateNameplate(nameplate, unitID)
end

function addon:OnNameplateRecycled(nameplate)
	local frame = addon:GetNameplateFrame(nameplate);
	frame:ClearClass();
end

function addon:UpdateAllNameplates()
	local nameplatesList = {LibNameplate:GetAllNameplates()};
	for i = 2, nameplatesList[1] do
		local nameplate = nameplatesList[i]
		self:UpdateNameplate(nameplate)
	end
end

function addon:GetUnitMetadata(unitId)
	local class, unifiedClass = UnitClass(unitId)
	local isCreature = not UnitIsPlayer(unitId);
	local isHostile = nil;
	local reaction =  UnitReaction(unitId, "player");
	if reaction ~= nil then
		isHostile = reaction < 4;
	end
	
	return {class = unifiedClass, isCreature = isCreature, isHostile = isHostile}
end

function addon:GetMetadata(nameplate, unitID)
	local class, isHostile, isCreature;
	
	if unitID ~= nil then
		return self:GetUnitMetadata(unitID);
	else
		class = LibNameplate:GetClass(nameplate);
		local reaction, unitType = LibNameplate:GetReaction(nameplate);
		isCreature = unitType == "NPC";
		isHostile = reaction == "HOSTILE";
		
		return { class = class, isHostile = isHostile, isCreature = isCreature }
	end
end

function addon:UpdateNameplate(nameplate, unitID)
	local storage = self.storages.PlayerClasses;
	local name = LibNameplate:GetName(nameplate);
	local metadata = self:GetMetadata(nameplate, unitID);
	
	if metadata.class == nil then
		local storedMetadata = storage:Get(name);
		if storedMetadata ~= nil then
			metadata = storedMetadata;
		end
	else
		storage:Set(name, metadata);
	end
	
	log:Log(40, "nameplate of '", name, "' are being updated with '", metadata.class, "' class");
	local frame = self:GetNameplateFrame(nameplate);
	frame:SetMetadata(metadata);
	self:UpdateFrameAppearence(frame);
end

function addon:UpdateAppearence()
	for _, nameplate in pairs(self.nameplateFrames) do
		self:UpdateFrameAppearence(nameplate);
	end
end

function addon:UpdateBorderColor(nameplateFrame)
	local nameplate = nameplateFrame:GetParent();
	
	local r,g,b,a = 0,0,0,1;
	
	if self.db.ClassIconBorderFollowNameplateColor then
		local hpBar = LibNameplate:GetHealthBar(nameplate);
		if hpBar and hpBar.GetStatusBarColor then
			r,g,b,a = hpBar:GetStatusBarColor()
		end
	end
	
	nameplateFrame.classBorderTexture:SetVertexColor(r,g,b,a);
end

function addon:UpdateFrameAppearence(nameplateFrame)
	local nameplate = nameplateFrame:GetParent()
	nameplateFrame:SetAlpha(self.db.Alpha);
	nameplateFrame:SetWidth(self.db.Size);
	nameplateFrame:SetHeight(self.db.Size);
	nameplateFrame:SetPoint("RIGHT", nameplate, "LEFT", self.db.OffsetX, self.db.OffsetY);
	
	
	if nameplateFrame.isCreature then
		nameplateFrame:Hide();
	elseif nameplateFrame.class == nil then
		if self.db.ShowQuestionMarks then
			SetPortraitToTexture(nameplateFrame.classTexture,"Interface\\Icons\\Inv_misc_questionmark")
			-- nameplateFrame.classTexture:SetTexture("Interface\\Icons\\Inv_misc_questionmark");
			nameplateFrame.classTexture:SetTexCoord(0.075, 0.925, 0.075, 0.925);
			nameplateFrame:Show();
		else
			nameplateFrame:Hide();
		end
	else
		nameplateFrame.classTexture:SetTexture(ADDON_PATH .. "\\images\\UI-CHARACTERCREATE-CLASSES_ROUND");
		nameplateFrame.classTexture:SetTexCoord(unpack(CLASS_ICON_TCOORDS[nameplateFrame.class]));
		nameplateFrame:Show();
	end

	if nameplateFrame:IsVisible() then
		if nameplateFrame.class ~= nil and self.db.DisplayClassIconBorder then
			nameplateFrame.classBorderTexture:Show();
			self:UpdateBorderColor(nameplateFrame);
		else
			nameplateFrame.classBorderTexture:Hide();
		end
	end
end

function addon:GetNameplateFrame(nameplate)
	if nameplate.classFrame == nil then
		local classFrame = CreateFrame("Frame", nil, nameplate);
		
		function classFrame.ClearClass(this)
			this:Hide();
		end
		
		function classFrame.SetMetadata(this, metadata)
			this.class = metadata.class;
			this.isCreature = metadata.isCreature;
			this.isHostile = metadata.isHostile;
		end
		
		local texture = classFrame:CreateTexture(nil, "ARTWORK");
		texture:SetAllPoints();
		classFrame.classTexture = texture;
		
		local textureBorder = classFrame:CreateTexture(nil, "ARTWORK");
		textureBorder:SetTexture(ADDON_PATH .. "\\images\\RoundBorder");
		textureBorder:SetAllPoints()
		classFrame.classBorderTexture = textureBorder;
		
		self:UpdateFrameAppearence(classFrame);
		table.insert(self.nameplateFrames, classFrame);
		nameplate.classFrame = classFrame;
	end
	
	return nameplate.classFrame;
end

function addon:AddUnit(unitID)
	local storage = self.storages.PlayerClasses;
	local name = UnitName(unitID);
	log:Log(40, "Adding unit '",  unitID ,"' with name '", name ,"'.")
	
	if name ~= nil then
		local metadata = self:GetUnitMetadata(unitID);
		log:Log(39, unitID, "resolved to class ", metadata.class);
		if metadata.class ~= nil then
			storage:Set(name, metadata);
			local nameplate = LibNameplate:GetNameplateByName(name);
			if nameplate ~= nil then
				self:GetNameplateFrame(nameplate):SetMetadata(metadata);
			end
		end
	end
end

function events:ARENA_OPPONENT_UPDATE(unit, reason)
	log:Log(50, "arena_opponent_update", unit, reason)
	if reason == "seen" then
		self:AddUnit(unit);
	end
end

function events:PARTY_MEMBERS_CHANGED()
	local numPartyMembers = GetNumPartyMembers()
	log:Log(50, "PARTY_MEMBERS_CHANGED invoked. Party members count = ", numPartyMembers)
	
	if numPartyMembers ~= nil then
		for i = 1, numPartyMembers do
			local unitID = "party"..i;
			self:AddUnit(unitID);
		end
	end
end