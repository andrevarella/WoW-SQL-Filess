local AceAddon = LibStub("AceAddon-3.0");
local AceDb = LibStub("AceDB-3.0");
local AceDBOptions = LibStub("AceDBOptions-3.0");
local AceConfig = LibStub("AceConfig-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0");

local addon = AceAddon:GetAddon("NameplateClass");
local module = addon:NewModule("Config");

local Utils = addon.Utils;

function module:OnInitialize()
	self.db = addon.dbRoot;
	
	AceConfig:RegisterOptionsTable(addon.name, self.BuildBlizzardOptionsForMasterPage(addon));
	AceConfigDialog:AddToBlizOptions(addon.name, addon.name);
	
	local profileOptions = AceDBOptions:GetOptionsTable(self.db, "Default")
	AceConfig:RegisterOptionsTable(addon.name .. "Profiles", profileOptions);
	AceConfigDialog:AddToBlizOptions(addon.name .. "Profiles", "Profiles", addon.name);
	
	for name, subModule in addon:IterateModules() do
		if subModule.BuildBlizzardOptions ~= nil then
			local options = subModule:BuildBlizzardOptions()
			if options == nil then
				error("Module " .. name .. " returned nil options.");
			end
			local key = addon.name .. subModule.name;
			AceConfig:RegisterOptionsTable(key, options);
			AceConfigDialog:AddToBlizOptions(key, subModule.name, addon.name);
		end
	end
end

function module:OnEnable()
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged");
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged");
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged");
end

function module:OnDisable()
	self.db.UnregisterAllCallbacks(self);
end

function module:OnProfileChanged(event, database, newProfileKey)
	addon.db = addon.dbRoot.profile;
	addon:UpdateAppearence();
end

function module:BuildBlizzardOptionsForMasterPage()
	local dbConnection = Utils.DbConfig:New(function(key) return addon.db end);
	
	local iterator = 
	{
		value = -1,
		Next = function (self)
			self.value = self.value + 1
			return self.value;
		end
	}
	
	local options = 
	{
		type = "group",
		name = self.name,
		get = dbConnection.Get,
		set = dbConnection.Set,
		args = {}
	}
	
	options.args["Description"] = 
	{
		type = "description",
		name = "Adds class icons to players nameplates.",
		fontSize = "medium",
		order = iterator:Next()
	}
	
	options.args["Enabled"] = 
	{
		type = "toggle",
		name = "Enabled",
		desc = "",
		set = dbConnection:BuildSetter(function(newState) if newState then self:Enable() else self:Disable() end end),
		order = iterator:Next()
	}
	
	options.args["Update"] = 
	{
		type = "execute",
		name = "Update nameplates now",
		func = function() self:UpdateAllNameplates() end,
		order = iterator:Next()
	}
	
	options.args["Size"] = 
	{
		type = "range",
		name = "Size",
		desc = "",
		min = 0,
		max = 256,
		softMin = 8,
		softMax = 64,
		step = 2,
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	options.args["OffsetX"] = 
	{
		type = "range",
		name = "OffsetX",
		desc = "",
		softMin = -80,
		softMax = 240,
		step = 1,
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	options.args["OffsetY"] = 
	{
		type = "range",
		name = "OffsetY",
		desc = "",
		softMin = -80,
		softMax = 80,
		step = 1,
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	options.args["UpdateFrequency"] = 
	{
		type = "range",
		name = "Update frequency",
		desc = "",
		min = 0.1,
		max = 5,
		step = 0.1,
		order = iterator:Next()
	}
	
	options.args["DisplayClassIconBorder"] = 
	{
		type = "toggle",
		name = "Display border",
		desc = "",
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	options.args["ClassIconBorderFollowNameplateColor"] = 
	{
		type = "toggle",
		name = "Dynamic border color",
		desc = "Set border color to the color of the nameplate",
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	options.args["ShowQuestionMarks"] = 
	{
		type = "toggle",
		name = "Show question marks",
		desc = "Show question marks for unknown targets",
		set = dbConnection:BuildSetter( function(newState) self:UpdateAppearence() end),
		order = iterator:Next()
	}
	
	return options
end