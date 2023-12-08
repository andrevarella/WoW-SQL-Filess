local lib = LibStub("LibLogger-1.0"); -- originally created in InitBegin.lua
if not lib:UpdateRequired() then return end

local LibPrototype = LibStub("LibPrototype-1.0");

lib.defaultRedirectCountLimit = 2;

-- reutrs logger with properties: name, maximumLogLevel, prescription, printMethod, redirectCountLimit
function lib:New(namedObjectOrName, maximumLogLevel, prescription, printMethod, redirectCountLimit)
	if namedObjectOrName == nil then error() end
	
	local instance = self.LoggerPrototype:CreateChild();
	
	if type(namedObjectOrName) == "table" then
		if namedObjectOrName.logger ~= nil then
			return namedObjectOrName.logger;
		end
	
		if namedObjectOrName.name == nil then 
			error("namedObjectOrName should be name or table with name field");
		end
		
		namedObjectOrName.logger = instance;
		
		if maximumLogLevel == nil then
			maximumLogLevel = namedObjectOrName.logLevel;
		end
		
		namedObjectOrName = namedObjectOrName.name
	end

	instance.maximumLogLevel = maximumLogLevel or 1;
	instance.prescription = prescription or "";
	instance.printMethod = printMethod or function(message) print(message) end;
	instance.redirectCountLimit = redirectCountLimit or self.defaultRedirectCountLimit;
	
	LibPrototype:SetName(instance, namedObjectOrName or "")

	return instance
end

function lib:SetGlobalMaximumLogLevelOverride(logLevel)
	self.globalMaximumLogLevelOverride = logLevel;
	self:Log(logLevel, "Global log level was set to", logLevel);
end

function lib:GetGlobalMaximumLogLevelOverride(logLevel)
	return self.globalMaximumLogLevelOverride;
end
