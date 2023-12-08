local EventListener = LibStub:NewLibrary("LibEvents-1.0", 1);
if not EventListener then return end

local debugLevel = -1;
local log = LibStub("LibLogger-1.0"):New("EventListener", debugLevel);

local LibPrototype = LibStub("LibPrototype-1.0");
local EventListenerPrototype = LibPrototype:CreatePrototype();
local eventsFrame = CreateFrame("Frame");
local eventListeners = {} -- { [eventListenerId] = eventListener }
local eventsRegistry = {} -- { [eventName][eventListenerId] = nil or function([arg1] [, arg2] [, argN])  end}

local function OnEvent(eventName, ...)
	local eventRegistryEntry = eventsRegistry[eventName];
	
	for listenerId, func in pairs(eventRegistryEntry) do
		local listener = eventListeners[listenerId];
		listener[eventName](listener.state.target or listener, ...);
	end
end

local function RegisterEvent(id, eventName, callback, doNotOverride)
	if eventName == nil then error("eventName was nil") end
	if type(eventName) ~= "string" then error("eventName must be string but was " .. type(eventName)) end
	
	if eventsRegistry[eventName] == nil then
		eventsRegistry[eventName] = {}
		eventsFrame:RegisterEvent(eventName);
	end
	
	if doNotOverride and self:IsEventRegistered(eventName) then
		return false;
	end
	
	eventsRegistry[eventName][id] = callback;
	return true;
end

local function ListenerInterceptWrite(self, tbl, key, value)
	log:Log(60, "Assignment of", key, "was intercepted");
	if type(value) == "function" then
		local tableState = rawget(tbl, "state");
		
		if tableState == nil then
			tableState = {}
			rawset(tbl, "state", tableState);
			log:Log(50, "New table state initialized");
		end
		
		if tableState.target ~= nil then
			local oldValue = value;
			value = function(self, ...) oldValue(tableState.target, ...); end
		end
		
		
		if tableState.events == nil then
			tableState.events = {}
		end
		
		log:Log(60, "Event", key, "was hidden in events collection");
		tableState.events[key] = value;
		
		RegisterEvent(self.state.id, key, value);
	else
		log:Log(60, "Raw set used for ", key);
		rawset(tbl, key, value)
	end
end

local function ListenerInterceptRead(self, tbl, key)
	log:Log(60, "Read of", key, "was intercepted");
	local tableState = rawget(tbl, "state");
	if tableState ~= nil then
		local target = tableState.target;
		local events = tableState.events;
		
		if target ~= nil and events ~= nil then
			local event = events[key]
			if event ~= nil then
			
				log:Log(60, "Returned modified call");
				local result = function(self, ...) event(target, ...) end
				return result
			end
		end
	end
	
	
	log:Log(60, "No value resolved for", key);
end


function EventListener:New(target)
	local eventListener = EventListenerPrototype:CreateChild();
	eventListener.state = {}
	eventListener.state.id = #eventListeners + 1;
	eventListener.state.target = target or eventListener;
	eventListeners[eventListener.state.id] = eventListener;
	
	eventListener:InterceptRead(function(...) return ListenerInterceptRead(eventListener, ...) end);
	eventListener:InterceptWrite(function(...) return ListenerInterceptWrite(eventListener, ...) end);
	
	return eventListener;
end

function EventListenerPrototype:IsEventRegistered(eventName)
	return eventsRegistry[eventName] ~= nil and eventsRegistry[eventName][self.state.id] ~= nil;
end

function EventListenerPrototype:UnregisterEvent(eventName)
	if eventName == nil then error() end
	
	local eventRegistryEntry = eventsRegistry[eventName]
	
	if eventRegistryEntry ~= nil then
		if #eventRegistryEntry > 1 then
			table.remove(eventRegistryEntry, self.state.id)
		else
			eventsRegistry[eventName] = nil;
			eventsFrame:UnregisterEvent(eventName);
		end
	end
	
	self.state.events[eventName] = nil;
end

function EventListenerPrototype:UnregisterAllEvents()
	for eventName, callback in pairs(self:GetEventList()) do
		self:UnregisterEvent(eventName);
	end
end

function EventListenerPrototype:Disable()
	self.state.enabled = false;
	local oldEventList = self.state.supressedEvents or {}
	
	for event, callback in pairs(self:GetEventList()) do
		oldEventList[event] = callback;
	end
	
	self.state.supressedEvents = oldEventList;
	
	self:UnregisterAllEvents();
end

function EventListenerPrototype:Enable()
	if self.state.enabled == false then
		for eventName, callback in pairs(self.state.supressedEvents) do
			if self[eventName] == nil then
				self[eventName] = callback;
			end
		end
		
		self.state.supressedEvents = nil;
		self.state.enabled = true;
	end
end

function EventListenerPrototype:GetEventList()
	local list = {}
	
	for name, value in pairs(self.state.events) do
		if type(value) == "function" then
			list[name] = value;
		end
	end
	
	return list;
end

function EventListenerPrototype:GetOwner()
	return self.state.target;
end

eventsFrame:SetScript("OnEvent", function(self, eventName, ...) OnEvent(eventName, ...) end);

