local version = 1;
local name = "LibPrototype-1.0";
local lib = LibStub:NewLibrary(name, version);
if not lib then return; end

local function IndexParents(table, key)
	local parents = table.__parents;
	for _, parent in pairs(parents) do
		local value = parent[key]
		
		if value ~= nil then
			return value;
		end
	end
end

local function InvokeCtors(table)
	local parents = table.__parents;
	for _, parent in pairs(parents) do
		if parent.ctor ~= nil then
			parent.ctor(table);
		end
	end
end

function lib:SetName(t, name)
	if name == nil then error() end
	t.name = name;
	local mt = getmetatable(t) or {};
	mt.__tostring = function(t) return t.name end
	setmetatable(t, mt);
end

function lib:CreateChild(...)
	local parents = {...};
	
	local child = {};
	child.__parents = parents;
	lib:AddReadInterceptor(child, IndexParents);
	child.CallBase = function(self, methodName, ...) IndexParents(self, methodName)(...) end
	
	child.InterceptRead = function(this, ...) lib:AddReadInterceptor(this, ...) end;
	child.InterceptWrite = function (this, ...) lib:SetWriteInterceptor(this, ...) end;
	
	InvokeCtors(child);
	return child;
end

function lib:AddReadInterceptor(table, handler)
	local mt = getmetatable(table)
	
	if mt ~= nil then
		local newHandler = handler;
		
		if mt.__index ~= nil then
			if type(mt.__index) == "table" then
				oldHandler = function(tbl, key) return mt.__index[key] end
			elseif type(mt.__index) == "function" then
				oldHandler = mt.__index
			else
				error()
			end
			
			newHandler = function(tbl, key) return handler(tbl, key) or oldHandler(tbl, key) end
		end
		
		mt.__index = newHandler;
	else
		setmetatable(table, {__index = handler })
	end
end

function lib:SetWriteInterceptor(table, handler)
	local mt = getmetatable(table) or {}
	mt.__newindex = handler;
end

function lib:CreatePrototype(name, skipMixin)
	local prototype = {};
	
	if name ~= nil then
		lib:SetName(prototype, name);
	end
	
	if not skipMixin then
		prototype.CreatePropertyFor = function(this, ...) return self:CreatePropertyFor(this, ...) end;
		prototype.CreateChild = function(this, ...) return lib:CreateChild(..., this) end;
		prototype.New = function(this, ...) return lib:CreateChild(..., this) end;
		prototype.SetConstructor = function (this, ctor) this.ctor = ctor end;
	end
	
	return prototype;
end

function lib:CreatePropertyFor(owner, fieldName, propertyName, initValue)
	assert(fieldName)
	propertyName = propertyName or fieldName:gsub("^%l", string.upper);
	local getterName = "Get" .. propertyName;
	local setterName = "Set" .. propertyName;
	
	local getterFunc = function(self) return self[fieldName]; end;
	local setterFunc = function(self, value) self[fieldName] = value; end;
	
	owner[getterName] = getterFunc;
	owner[setterName] = setterFunc;
	
	if initValue ~= nil then
		setterFunc(owner, initValue);
	elseif getterFunc(owner) == nil then
		setterFunc(owner,{});
	end
	
	return propertyName, getterName, setterName;
end