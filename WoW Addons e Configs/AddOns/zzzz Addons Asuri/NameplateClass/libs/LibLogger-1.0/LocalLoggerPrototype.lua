local lib = LibStub("LibLogger-1.0");
if not lib:UpdateRequired() then return end

local LibPrototype = LibStub("LibPrototype-1.0");

local LocalLoggerPrototype = LibPrototype:CreatePrototype("LocalLoggerPrototype");
LocalLoggerPrototype:CreatePropertyFor("debugInfo");

function LocalLoggerPrototype:Log(level, ...)
	return self.owner:Log(level, ..., self.debugInfo);
end