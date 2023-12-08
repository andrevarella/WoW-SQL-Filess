local AceAddon = LibStub("AceAddon-3.0");
local AceDb = LibStub("AceDB-3.0");
local LibLogger = LibStub("LibLogger-1.0");
local AceConfig = LibStub("AceConfig-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0");

local addon = AceAddon:GetAddon("NameplateClass");
local log = LibLogger:New(addon);
local module = addon:NewModule("Cache");

local Utils = addon.Utils;

local cachingCategories = {
	["PlayerClasses"] = function(module) return module.PlayerClassConverter end
}

local oldStorages = {}

function module:OnInitialize()
	local db = addon.dbRoot;
	
	if db.global.Cache == nil then
		db.global.Cache = {
			Enabled = true,
			PlayerClasses = {}
		}
	end
	
	self.db = db.global.Cache;
	
	self.cachingStorages = {}
	self.oldStorages = {}
	
	for categoryName, converterBuilder in pairs(cachingCategories) do
		local converter = converterBuilder(self);
		
		if converter == nil then
			error()
		end
		
		self.cachingStorages[categoryName] = self:CreateDbStorage(categoryName, converter);
	end
	
	
	log:Log(5, module.name .. "Initialized");
end

function module:OnEnable()
	if self.db.Enabled == false then
		module:Disable();
		return;
	end

	for categoryName, storage in pairs(self.cachingStorages) do
		self.oldStorages[categoryName] = addon:GetStorage(categoryName);
		addon:SetStorage("PlayerClasses", storage);
	end
	
	log:Log(5, module.name, "Enabled");
end

function module:OnDisable()
	for categoryName, storage in pairs(self.oldStorages) do
		addon:SetStorage(categoryName, storage);
	end
	
	log:Log(5, module.name, "Disabled");
end

function module:CreateDbStorage(category, valueConverter)
	if category == nil or type(category) ~= "string" then
		error()
	end
	
	local get = function(self, key) return self.db[category][key] end
	local set = function(self, key, value) self.db[category][key] = value end
	local reset = function(self) self.db[category] = {} end
	
	if valueToStoredValueConverter ~= nil then
		local oldGet = get;
		local oldSet = set;
		
		get = function(self, key) return valueConverter:ToOriginal(oldGet(key)) end
		set = function(self, key, value) oldSet(key, valueConverter:ToConfig(value)) end
	end
	
	return {
		Get = get,
		Set = set,
		Reset = reset,
		db = self.db
	}
end

function module:BuildBlizzardOptions()
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
		name = module.name,
		get = dbConnection.Get,
		set = dbConnection.Set,
		args = {}
	}
	
	options.args["Description"] = 
	{
		type = "description",
		name = "Caches classes of players to accounts config.",
		fontSize = "medium",
		order = iterator:Next()
	}
	
	options.args["Enabled"] = 
	{
		type = "toggle",
		name = "Enabled",
		desc = "",
		set = dbConnection:BuildSetter(function(newState) if newState then module:Enable() else module:Disable() end end),
		order = iterator:Next()
	}
	
	options.args["Reset"] = 
	{
		type = "execute",
		name = "Reset Cache",
		func = function() for categoryName, storage in pairs(self.cachingStorages) do storage:Reset(); end addon:UpdateAllNameplates() end,
		order = iterator:Next()
	}
	
	return options
end