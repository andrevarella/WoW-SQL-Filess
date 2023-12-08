local lib = LibStub("LibLogger-1.0");
if not lib:UpdateRequired() then return end

local LibPrototype = LibStub("LibPrototype-1.0");

local LoggerPrototype = LibPrototype:CreatePrototype("LoggerPrototype");
lib.LoggerPrototype = LoggerPrototype;

LoggerPrototype:CreatePropertyFor("prescription");

local function MessagePartToMessage(messagePart, separator, redirectNum)
	redirectNum = redirectNum or 0;
	redirectNum = redirectNum + 1;
	
	if redirectNum >= lib.defaultRedirectCountLimit then
		if type(messagePart) == "function" then
			local status, funcResult = pcall(messagePart);
			
			if status then 
				messagePart = tostring(funcResult);
			end
		end
		
		return tostring(messagePart)
	end
	
	if type(messagePart) == "table" then
		local result;
		for i, v in pairs(messagePart) do
			if result == nil then
				result = "";
			else
				result = result .. separator;
			end
			if i ~= name then
				result = result .. i .. ":\"" .. MessagePartToMessage(v, separator, redirectNum) .. "\"";
			end
		end
		
		result = "{ " .. (result or "") .. " }";
		
		if messagePart.name ~= nil then
			result = messagePart.name .. " = " .. result;
		end
		
		return result;
	else
		return MessagePartToMessage(messagePart, separator, lib.defaultRedirectCountLimit);
	end
end

local function CombineMessageParts(...)
	local result;
	
	for _, messagePart in pairs({ ... }) do
		local messagePart = MessagePartToMessage(messagePart, ", ");
		if result == nil then
			result = messagePart;
		else
			result = result .. " " .. messagePart;
		end
	end
	
	return result;
end

function LoggerPrototype:Log(level, ...)
	local maximumLogLevel = lib.globalMaximumLogLevelOverride or self.maximumLogLevel;
	if ((level or 1) <= maximumLogLevel) then
		local message = CombineMessageParts(...);
		return self:Out(message)
	end
end

function LoggerPrototype:Error(errorMessage, ...)
	self:Log(-99, errorMessage, ...);
	error(errorMessage);
end

function LoggerPrototype:LogVariable(level, variable, value)
	self:Log(level, "[", variable, "] = '", value, "'.")
end

function LoggerPrototype:Out(message)
	if self.name ~= nil and self.name ~= '' then
		message = self.name .. ": " .. self.prescription .. " " .. (message or "");
	end
	
	self.printMethod(message);
end

function LoggerPrototype:SetMaximumLogLevel(maximumLogLevel)
	self.maximumLogLevel = maximumLogLevel;
end

function LoggerPrototype:GetMaximumLogLevel()
	return self.maximumLogLevel;
end

function LoggerPrototype:CreateLocalLogger(prescription)
	local localLogger = self:CreateChild(lib.LocalLoggerPrototype);
	
	if prescription ~= nil then
		if type(prescription) ~= "string" then
			error("prescription must be a string but it was " .. type(prescription));
		end
		
		localLogger:SetPrescription(prescription);
	end

	localLogger.owner = self;
	LibPrototype:SetName(localLogger, self.name);
	
	debugInfo = {}
	localLogger:SetDebugInfo(debugInfo);
	local mt = getmetatable(debugInfo) or {};
	if mt.__newindex == nil then
		mt.__newindex = function(tbl, key, value)
			if value == nil then
				value = "nil"
			end
			rawset(tbl, key, value);
		end
	end
	setmetatable(debugInfo, mt)
	
	return localLogger, debugInfo;
end