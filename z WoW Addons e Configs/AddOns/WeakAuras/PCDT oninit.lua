local WeakAuras, PartyCooldownTracker, db, DEFAULT_CHAT_FRAME = WeakAuras, aura_env, WeakAurasSaved, DEFAULT_CHAT_FRAME;
local WA_GetUnitDebuff, UnitDebuff = WA_GetUnitDebuff, UnitDebuff;
local _G, pairs, tonumber, select = _G, pairs, tonumber, select;
local GetSpellInfo, GetCurrentMapAreaID, GetItemInfo, GetItemIcon= GetSpellInfo, GetCurrentMapAreaID, GetItemInfo, GetItemIcon;
local UnitExists, UnitFactionGroup, GetNumPartyMembers = UnitExists, UnitFactionGroup, GetNumPartyMembers;
local UnitInParty, UnitCreatureFamily = UnitInParty, UnitCreatureFamily;
local GetInventoryItemLink = GetInventoryItemLink;
local UnitName, UnitGUID, UnitRace, UnitClass = UnitName, UnitGUID, UnitRace, UnitClass;
local config = PartyCooldownTracker.config;
local LoadAddOn, LibStub = LoadAddOn, LibStub;
local GetLocale, GetTime = GetLocale, GetTime;

PartyCooldownTracker.libGT = LibStub:GetLibrary("LibGroupTalents-1.0", true);

if ( not PartyCooldownTracker.libGT ) then
    local loaded, reason = LoadAddOn("LibGroupTalents-1.0");
    PartyCooldownTracker.libGT = LibStub:GetLibrary("LibGroupTalents-1.0", true);
end

if ( PartyCooldownTracker.libGT ) then
    function PartyCooldownTracker:LibGroupTalents_Update(e, guid, unit, newSpec, n1, n2, n3)
        local unitName = UnitName(unit);
        WeakAuras.timer:ScheduleTimer(
        WeakAuras.ScanEvents, 0.5, "INVISUS_COOLDOWNS", "LibGroupTalents_Update", unit, unitName)
    end
    PartyCooldownTracker.libGT.RegisterCallback(PartyCooldownTracker, "LibGroupTalents_Update");
elseif ( not config.lib_error ) then
    DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0PartyCooldownTracker- WA|r couldn't find LibGroupTalents-1.0. Download the lib to display talent required cooldowns. (You can copy the name of lib in the |cffffd100Information|r tab).");
end

-------------------------------------------------------------------------------------------------------
PartyCooldownTracker.roster = PartyCooldownTracker.roster or {};
PartyCooldownTracker.pet_roster = PartyCooldownTracker.pet_roster or {} ;

function PartyCooldownTracker:GetNumPartyMembers()
    if ( GetNumPartyMembers() == 0 ) then
        return 0;
    end
    return config.countUnits <= GetNumPartyMembers() and config.countUnits or GetNumPartyMembers();
end
--------------------------------------------------------------------------------------------------------------------
function PartyCooldownTracker:SaveCurrentSession()
    db.displays[self.id][WeakAuras.me] = {};
    local data = db.displays[self.id][WeakAuras.me];
    data.roster = self.roster;
end

function PartyCooldownTracker:GroupRosterGeneration(object)
    for i = 1, self:GetNumPartyMembers() do
        local unit = "party"..i;
        if ( UnitExists(unit) ) then 
            object[UnitGUID(unit)] = unit; 
        end
    end
    return object;
end

function PartyCooldownTracker:LoadLastSession()
    local data = db.displays[self.id][WeakAuras.me];
    local members = self:GroupRosterGeneration({});
    
    if ( ( not data ) or ( data and not data.roster ) ) then
        return;
    end
    
    for guid, unitDATA in pairs(data.roster) do
        if ( members[guid] and self.roster[guid] ) then
            local class = unitDATA.class;
            local unitID = members[guid];
            local member = self.roster[guid];
            for spellID, info in pairs(unitDATA.spells) do
                if ( self.cds[class][spellID] and self.cds[class][spellID].display )
                or ( self.anyCDs[spellID] and self.anyCDs[spellID].display ) then
                    
                    member.spells = member.spells or {};
                    member.spells[spellID] = member.spells[spellID] or {};
                    member.spells[spellID].cd = info.cd;
                    if ( info.exp and math.abs(info.exp - GetTime()) < info.cd ) then
                        member.spells[spellID].dst = info.dst;
                        member.spells[spellID].exp = info.exp;
                        member.spells[spellID].cd = info.cd;
                    end
                end
            end
            
            for invSlot, itemData in pairs(unitDATA.trinkets) do
                if ( self.anyCDs[itemData.spellID] and self.anyCDs[itemData.spellID].display ) then
                    self:AddTrinketInfo(guid, invSlot, itemData.itemName, itemData.itemID, itemData.spellID)
                end
            end
            for petGUID, petData in pairs(unitDATA.pet) do
                self.pet_roster[petGUID] = petData;
                for spellID, info in pairs(petData.spells) do
                    self:AddCooldownInfo(guid, spellID, info.cd)
                end
            end
            
            self.roster[guid] = member;
        end
    end
    
end
---------------------------------------------------------------------------------------------------------------------
local function GetSpellIcon(spellID, guid)
    local icon = select(3, GetSpellInfo(spellID));
    local data = PartyCooldownTracker.roster[guid];
    
    if ( data and data.trinkets ) then
        for slotID, slotINFO in pairs(data.trinkets) do
            if ( slotINFO.spellID == spellID ) then
                icon = GetItemIcon(slotINFO.itemID) or icon;
                break;
            end
        end
    end
    return icon;
end 

function PartyCooldownTracker.GetPetGUID(unitID)
    if ( unitID and unitID:match("party") ) then
        local i = (unitID):match("%d");
        local petID = "partypet"..i;
        if ( UnitExists(petID) ) then
            local petGUID = UnitGUID(petID);
            return petGUID;
        end
    end            
end

local function GetPetID(unitID)
    local i = (unitID):match("%d");
    if ( i and UnitExists("partypet"..i) ) then
        return "partypet"..i;
    end
end

function PartyCooldownTracker:AdditionalVerification(allstates, subEvent, guid, spellID, destGUID)
    if not ( subEvent == "SPELL_CAST_SUCCESS" ) then 
        return;
    end
    
    local class = self.roster[guid] and self.roster[guid].class;
    if ( self.relationship[class] and self.relationship[class][spellID] ) then
        if ( not self.roster[guid].spells[spellID] ) then 
            return true, self:Relationship(allstates, guid, spellID, destGUID);
        end
    end
end

function PartyCooldownTracker:SpellIsDisplay(guid, spellID, spellName)
    if ( self.roster[guid] and self.roster[guid].spells[spellID] ) then
        return guid;
    elseif ( self.pet_roster[guid] ) then
        guid = self.pet_roster[guid].unitGUID;
        if ( self.roster[guid] and self.roster[guid].spells[spellID] ) then
            return guid;
        end
    elseif ( self.roster[guid] and self.USS[spellName] and self.USS[spellName].display ) then
        return guid;
    else
        return false;
    end
end

function PartyCooldownTracker:AddInfo(guid, spellID, exp, dst)
    if not ( self.roster[guid] and self.roster[guid].spells[spellID] ) then 
        return;
    end
    
    self.roster[guid].spells[spellID].exp = exp;
    self.roster[guid].spells[spellID].dst = dst;
end

local C_PVP = {};
C_PVP[0] = true;

C_PVP.IsPVPMap = function() 
    return C_PVP[GetCurrentMapAreaID()];
end

function PartyCooldownTracker:Update(allstates)
    if ( not C_PVP.IsPVPMap() ) then 
        return
    end
    
    for _, state in pairs(allstates) do
        if ( state and state.show ) then
            state.changed=  true;
            state.expirationTime = GetTime();
            state.dst = false;
            state.isBuff = false;
            state.isCD = false;
            
            self:AddInfo(state.guid, state.spellID, state.expirationTime, state.dst);
        end
    end
    return true;
end
-- Checking spells that have one CD
function PartyCooldownTracker:Relationship(allstates, guid, spellID, destGUID) 
    local class = self.roster[guid].class;
    if ( self.relationship[class] and self.relationship[class][spellID] ) then
        
        if ( spellID == 10278 and guid ~= destGUID ) then 
            return
        end
        
        for id, cd in pairs(self.relationship[class][spellID]) do
            local state = allstates[guid..id];
            if ( state and (not state.isCD or state.expirationTime < cd + GetTime()) ) then
                
                state.show = true;
                state.changed = true;
                state.progressType = "timed";
                state.duration = cd;
                state.expirationTime = cd + GetTime();
                state.isCD = true;
                state.dst = config.des;
                
                allstates[guid..id] = state;
                self:AddInfo(guid, id, state.expirationTime, state.dst);
            end
        end
    end    
end      

function PartyCooldownTracker:GetHypothermia(allstates, guid, id)
    local state = allstates[guid..id];
    if ( not state ) then
        return;
    end
    
    local hypothermia = GetSpellInfo(41425);
    state.changed = true;
    
    if ( WA_GetUnitDebuff(state.unit, hypothermia) ) then
        state.expirationTime = select(7, UnitDebuff(state.unit, hypothermia));
        allstates[guid..id] = state;
        self:AddInfo(guid, id, state.expirationTime, state.dst);
    else
        state.dst = false;
        state.isCD = false;
        state.isBuff = false;
        state.expirationTime = GetTime();
        allstates[guid..id] = state;
        self:AddInfo(guid, id, state.expirationTime, state.dst);
    end 
end

function PartyCooldownTracker:RefreshState(allstates, guid, spellID) 
    for _, id in pairs(self.refresh[spellID]) do
        if ( id == 45438 ) then
            return self:GetHypothermia(allstates, guid, id);
        end
        
        if ( allstates[guid..id] ) then
            local state = allstates[guid..id];
            state.changed = true;
            state.expirationTime = GetTime();
            state.dst = false;
            state.isCD = false;
            state.isBuff = false;
            
            allstates[guid..id] = state;
            self:AddInfo(guid, id, state.expirationTime, state.dst);
        end
    end
end

function PartyCooldownTracker:SetDesaturated(allstates, guid, spellID)
    local state = allstates[guid..spellID];
    if ( not state ) then
        return;
    end
    
    if ( self.blacklist[spellID] ) then
        state.expirationTime = GetTime() + state.duration;
        state.dst = config.des;
        state.isCD = true;
        state.isBuff = false;
        
        self:AddInfo(guid, spellID, state.expirationTime, state.dst);
        
    elseif ( state.isCD and state.isBuff ) then
        state.expirationTime = state.expirationTime;
        state.isBuff = false;
        state.dst = config.des;
        
        self:AddInfo(guid, spellID, state.expirationTime, state.dst);
    end
    return true;
end

function PartyCooldownTracker:SetGlow(allstates, guid, spellID, duration)
    local state = allstates[guid..spellID];
    if ( not state ) then
        return;
    end
    
    state.isBuff = config.glow;
    state.dst = false;
    if ( not self.blacklist[spellID] and duration ) then
        if ( spellID == 43039 ) then duration = 60; end
        WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, duration,
            "COMBAT_LOG_EVENT_UNFILTERED", GetTime(), "SPELL_AURA_REMOVED", guid, nil, nil, nil, nil, nil, spellID);
    end
    return true
end
----------------------        CREATE FRAME      -------------------------------------------------------
-- created when the event is fired
function PartyCooldownTracker:EditState(allstates, guid, spellID, subEvent, destGUID) 
    allstates[guid..spellID] = allstates[guid..spellID] or {};
    local state = allstates[guid..spellID];
    local data = self.roster[guid];
    local unit = data.unitID;
    local class = data.class;
    
    if ( not data or not (data.spells and data.spells[spellID]) ) then 
        return;
    end
    
    state.show = true;
    state.changed = true;
    state.progressType = state.progressType or "timed";
    state.icon = state.icon or GetSpellIcon(spellID, guid);
    state.duration = data.spells[spellID].cd;
    state.expirationTime = GetTime() + state.duration;
    -- custom
    state.autoHide = config.show;
    state.isCD = true;
    state.dst = config.des;
    state.isBuff = false;
    state.unit = data.unitID;
    state.unitName = data.unitName;
    state.guid = guid;
    state.spellID = spellID;
    
    allstates[guid..spellID] = state;
    self:AddInfo(guid, spellID, state.expirationTime, state.dst);
    
    if ( self.refresh[spellID] and subEvent ~= "UNIT_DIED" ) then
        self:RefreshState(allstates, guid, spellID);
    elseif ( self.relationship[class] and self.relationship[class][spellID] ) then
        self:Relationship(allstates, guid, spellID, destGUID);
    end
    return true;
end
-- main create
function PartyCooldownTracker:CreateCDFrame(allstates, guid, spellID)
    local unitDATA = self.roster[guid];
    local spellDATA = unitDATA.spells[spellID];
    
    allstates[guid..spellID] = {
        show = true,
        changed = true,
        autoHide = config.show,
        icon = GetSpellIcon(spellID, guid), 
        progressType = "timed",
        duration = spellDATA.cd,
        expirationTime = spellDATA.exp or GetTime(),
        -- custom
        unit = unitDATA.unitID,
        isCD = ( spellDATA.exp and spellDATA.exp > GetTime() ) and true or false,
        unitName = unitDATA.unitName,
        dst = spellDATA.dst or false,
        isBuff = false,
        guid = guid,
        spellID = spellID,
    };
end

function PartyCooldownTracker:CreateFrame(allstates, guid)
    local unitDATA = self.roster[guid];
    for spellID in pairs(unitDATA.spells) do
        self:CreateCDFrame(allstates, guid, spellID);
    end
end

function PartyCooldownTracker:CreateFrames(allstates)
    for guid in pairs(self.roster) do
        self:CreateFrame(allstates, guid);
    end
end
--------------------------------------------------------------------------
function PartyCooldownTracker:AddCooldownInfo(guid, id, cd)
    self.roster[guid].spells[id] = self.roster[guid].spells[id] or {};
    self.roster[guid].spells[id].cd = cd;
end

function PartyCooldownTracker:AddTrinketInfo(guid, invSlot, itemName, itemID, spellID)
    self.roster[guid].trinkets[invSlot] = self.roster[guid].trinkets[invSlot] or {};
    self.roster[guid].trinkets[invSlot].itemName = itemName;
    self.roster[guid].trinkets[invSlot].spellID = spellID;
    self.roster[guid].trinkets[invSlot].itemID = itemID;
end

function PartyCooldownTracker:AddPetsInfo(unitGUID, petGUID, id, cd)
    self.roster[unitGUID].pet[petGUID].spells[id] = self.roster[unitGUID].pet[petGUID].spells[id] or {};
    self.roster[unitGUID].pet[petGUID].spells[id].cd = cd;
end
--------------------------------------------------------------------------
function PartyCooldownTracker:RemoveCooldownInfo(allstates, guid, spellID)
    self.roster[guid].spells[spellID] = nil;
    local state = allstates[guid..spellID];
    
    if ( not state ) then
        return;
    end
    
    state.show = false;
    state.changed = true;
    allstates[guid..spellID] = state;
    return true;
end

function PartyCooldownTracker:PetCooldownRemove(allstates, guid)
    local update = false;
    for petGUID, data in pairs(self.pet_roster) do
        if ( data.unitGUID == guid ) then
            for spellID in pairs(data.spells) do
                self:RemoveCooldownInfo(allstates, guid, spellID);
            end
            self.pet_roster[petGUID] = nil;
            self.roster[guid].pet[petGUID] = nil;
            update = true;
        end
    end
    return update;
end

function PartyCooldownTracker:PetCooldownInit(allstates, unitGUID, petGUID, petType)
    local createFrames = false;
    for spellID, data in pairs(self.pets[petType]) do
        if ( data.display ) then
            self.pet_roster[petGUID].spells[spellID] = true;
            self:AddPetsInfo(unitGUID, petGUID, spellID, data.cd);
            self:AddCooldownInfo(unitGUID, spellID, data.cd);
            self:CreateCDFrame(allstates, unitGUID, spellID);
            createFrames = true;
        end
    end
    return createFrames;
end

local function CreatePetRoster(unitGUID, petType)
    return { unitGUID = unitGUID, type = petType, spells = {} };
end

function PartyCooldownTracker:UnitPetCDInit(allstates, unit)
    local createFrame = false;
    local unitGUID = UnitGUID(unit);
    local petID = GetPetID(unit);
    
    if ( ( not petID ) or ( not self.roster[unitGUID] ) ) then
        return;
    end
    
    local petType = UnitCreatureFamily(petID);
    local petGUID = UnitGUID(petID);
    if ( self.pets[petType] and not self.pet_roster[petGUID] ) then
        self.pet_roster[petGUID] = CreatePetRoster(unitGUID, petType);
        self.roster[unitGUID].pet[petGUID] = CreatePetRoster(unitGUID, petType);
        if ( self:PetCooldownInit(allstates, unitGUID, petGUID, petType) ) then
            createFrame = true;
        end
    end
    
    return createFrame;
end

local function GetTableSize(object)
    local i = 0 ;
    for _ in pairs(object) do
        i = i + 1;
    end
    return i;
end

local function ScheduleTimer(duration, unit, guid, nilchek)
    WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, duration, "WA_INSPECT_READY", unit, guid, nilchek);
end

PartyCooldownTracker.detected = {};
function PartyCooldownTracker:UnitIsDetected(unit, guid, isDetected)
    if ( self.detected[guid] ) then
        self.detected[guid] = WeakAuras.timer:CancelTimer(self.detected[guid]);
    end
    if ( isDetected ) then
        self.detected[guid] = ScheduleTimer(0.05, unit, guid, true);
    else
        local duration = GetTableSize(self.detected) + 1;
        self.detected[guid] = ScheduleTimer(duration, unit, guid, false);
    end
end

local function CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown)
    PartyCooldownTracker:AddCooldownInfo(guid, spellID, cooldown);
    PartyCooldownTracker:AddTrinketInfo(guid, invSlot, itemName, itemID, spellID);
    PartyCooldownTracker:CreateCDFrame(allstates, guid, spellID);
    return true;
end

function PartyCooldownTracker:UnitItemInit(allstates, unit, guid)
    if ( not self.roster[guid] ) then
        return;
    end
    local createFrames = false;
    local invTrinkets = {};
    local check = false;
    local data = self.roster[guid];
    
    for invSlot = 13, 14 do
        local itemLink = GetInventoryItemLink(unit, invSlot) or "";
        local itemID = (itemLink):match("item:(%d+):") or "";
        local itemName = GetItemInfo(itemLink);
        
        if ( data.trinkets and data.trinkets[invSlot] ) then
            if ( itemName and itemName ~= data.trinkets[invSlot].itemName ) then
                local spellID = data.trinkets[invSlot].spellID;
                createFrames = self:RemoveCooldownInfo(allstates, guid, spellID);
                data.trinkets[invSlot] = nil;
            end
        end
        
        if itemName then 
            invTrinkets[itemName] = invSlot;
            check = true;
        end
    end
    
    if ( not check ) then
        return;
    end
    
    for spellID, info in pairs(self.anyCDs) do
        if ( info.display and info.trinket ) then
            if ( type(info.trinket) == "table" ) then
                for _, itemID in pairs(info.trinket) do
                    if ( invTrinkets[GetItemInfo(itemID)] ) then
                        local itemName = GetItemInfo(itemID);
                        local invSlot = invTrinkets[itemName];
                        local cooldown = info.cd;
                        createFrames = CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown)
                    end
                end
            else
                local itemName = GetItemInfo(info.trinket);
                if ( invTrinkets[itemName] ) then
                    local invSlot = invTrinkets[itemName];
                    local cooldown = info.cd;
                    local itemID = info.trinket;
                    createFrames = CreateTrinketFrame(allstates, guid, invSlot, itemName, itemID, spellID, cooldown);
                end
            end
        end
    end
    
    return createFrames;
end

function PartyCooldownTracker:GenerationGlyphsRoster(object, unit)
    local active = self.libGT:GetActiveTalentGroup(unit);
    for i = 1, 6 do 
        local glyph = select(i, self.libGT:GetUnitGlyphs(unit, active));
        if ( glyph ) then   
            object[glyph] = true;
        end
    end
    return object;
end

function PartyCooldownTracker:CheckTalents(allstates, unit, guid, createFrames)
    local update = createFrames;
    local class = self.roster[guid].class;
    local glyphs = self:GenerationGlyphsRoster({}, unit);
    
    for spellID, data in pairs(self.cds[class]) do
        if ( data.display and (data.tReq or data.minus or data.glyph) ) then   
            if ( not data.tReq
                or select(5, self.libGT:GetTalentInfo(unit, data.tabIndex, data.talentIndex)) ~= 0 ) then
                local cooldown = data.cd;
                local glyphSlot = data.glyph;
                
                if ( glyphSlot and glyphs[glyphSlot.glyphID] ) then
                    cooldown = cooldown - glyphSlot.minus;
                end
                
                if ( data.minus ) then
                    if ( type(data.minusTabIndex) == "table" ) then
                        for i = 1, #data.minusTabIndex do
                            local curRank = select(5, self.libGT:GetTalentInfo(unit, data.minusTabIndex[i], data.minusTalentIndex[i])) or 0;
                            cooldown = cooldown - curRank * data.minusPerPoint[i];
                        end
                    else
                        local curRank = select(5, self.libGT:GetTalentInfo(unit, data.minusTabIndex, data.minusTalentIndex)) or 0;
                        cooldown = cooldown - curRank * data.minusPerPoint;
                    end
                end
                
                if ( class == "HUNTER" ) then
                    for spell, spellData in pairs(self.relationship[class]) do
                        for spellId in pairs(spellData) do
                            if ( spellId == spellID ) then
                                self.relationship[class][spell][spellId] = cooldown;
                            end
                        end 
                    end
                end
                
                self:AddCooldownInfo(guid, spellID, cooldown);
                update = true;
            elseif ( self.roster[guid].spells[spellID] ) then
                update = self:RemoveCooldownInfo(allstates, guid, spellID);
            end
        end
    end
    
    if ( update ) then
        self:CreateFrame(allstates, guid);
    end
    WeakAuras.ScanEvents("UNIT_IS_VISIBLE", unit, guid);
    return update;
end

function PartyCooldownTracker:UnitCooldownsInit(allstates, unit, guid)
    local class = self.roster[guid].class;
    local race = self.roster[guid].race;
    local check = false;
    local createFrames = false;

    for spellID, data in pairs(self.cds[class]) do
        if ( data.display ) then
            if ( not data.tReq ) then
                self:AddCooldownInfo(guid, spellID, data.cd);
                createFrames = true;
            end
            
            if ( not check and (data.tReq or data.minus) ) then
                check = true;
            end
        end
    end  
    
    for spellID, data in pairs(self.anyCDs) do
        if ( data.display ) then
            if data.race == race then
                self:AddCooldownInfo(guid, spellID, data.cd);
                createFrames = true;
            end
        end
    end
    
    if ( check and self.libGT and self.libGT:GetUnitTalents(unit) ) then
        return self:CheckTalents(allstates, unit, guid, createFrames);
    elseif ( createFrames ) then
        self:CreateFrame(allstates, guid);
    end
    return createFrames;
end

function PartyCooldownTracker:GenerationRoster(unit)
    return { 
        spells = {}, 
        trinkets = {}, 
        pet = {},
        unitID = unit, 
        class =  select(2, UnitClass(unit)), 
        faction = UnitFactionGroup(unit), 
        race = select(2, UnitRace(unit)), 
        unitName = UnitName(unit),
    };
end

function PartyCooldownTracker:InitNewMembers(allstates)
    local updateFrames = false;
    for guid, unitData in pairs(self.roster) do
        if ( not UnitInParty(unitData.unitName) ) then
            if ( unitData.spells ) then
                for id in pairs(unitData.spells) do
                    self:RemoveCooldownInfo(allstates, guid, id);
                    self:PetCooldownRemove(allstates, guid);
                end 
            end
            self.roster[guid] = nil;
            updateFrames = true;
        end
    end
    
    for i = 1, self:GetNumPartyMembers() do
        local unit = "party"..i;
        local guid = UnitGUID(unit);
        local _, class = UnitClass(unit);
        if ( not self.roster[guid] and self.cds[class] ) then
            self.roster[guid] = self:GenerationRoster(unit);
            if ( self:UnitPetCDInit(allstates, unit) ) then
                updateFrames = true;
            end
            if ( self:UnitCooldownsInit(allstates, unit, guid) ) then
                updateFrames = true;
            end
        end
    end
    return updateFrames;
end
-------------- >> ANCHOR TO FRMAE << ----------------
local defaultFramePriorities = {
    -- raid frames
    [0] = nil,
    [1] = "^Vd1", -- vuhdo
    [2] = "^Vd2", -- vuhdo
    [3] = "^Vd3", -- vuhdo
    [4] = "^Vd4", -- vuhdo
    [5] = "^Vd5", -- vuhdo
    [6] = "^Vd", -- vuhdo
    [7] = "^HealBot", -- healbot
    [8] = "^GridLayout", -- grid
    [9] = "^Grid2Layout", -- grid2
    [10] = "^PlexusLayout", -- plexus
    [11] = "^ElvUF_RaidGroup", -- elv
    [12] = "^oUF_bdGrid", -- bdgrid
    [13] = "^oUF_.-Raid", -- generic oUF
    [14] = "^LimeGroup", -- lime
    [15] = "^SUFHeaderraid", -- suf
    -- party frames
    [16] = "^AleaUI_GroupHeader", -- Alea
    [17] = "^SUFHeaderparty", --suf
    [18] = "^ElvUF_PartyGroup", -- elv
    [19] = "^oUF_.-Party", -- generic oUF
    [20] = "^PitBull4_Groups_Party", -- pitbull4
    [21] = "^XPerl_party", -- xperl
    [22] = "^PartyMemberFrame", -- blizz
    [23] = "^CompactRaid", -- blizz
};

local defaultPartyTargetFrames = {
    "SUFChildpartytarget%d",
};

local attachIndex = ( config.frame - 1 );
local getFrameOptions = {
    framePriorities = {
        [1] = defaultFramePriorities[attachIndex],
    },
    ignorePartyTargetFrame = true,
    partyTargetFrames = defaultPartyTargetFrames,
};
if ( config.blizzFrame ) then
    getFrameOptions.ignoreFrames = {
        "PitBull4_Frames_Target's target's target",
        "ElvUF_PartyGroup%dUnitButton%dTarget",
        "ElvUF_FocusTarget",
        "PartyMemberFrame",
        "RavenButton",
    };
end

local growDirections = {
    [1] = "BOTTOM",
    [2] = "BOTTOMLEFT",
    [3] = "BOTTOMRIGHT",    
    [4] = "CENTER",
    [5] = "LEFT",
    [6] = "RIGHT",
    [7] = "TOP",
    [8] = "TOPLEFT",
    [9] = "TOPRIGHT",
};

PartyCooldownTracker.positionFrom = growDirections[config.anchor];
PartyCooldownTracker.positionTo = growDirections[config.anchorTo];
PartyCooldownTracker.spacing = config.spacing;
PartyCooldownTracker.xOffset = config.xOffset;
PartyCooldownTracker.yOffset = config.yOffset;
PartyCooldownTracker.column = config.column;
PartyCooldownTracker.auraCount = {};

local function setIconPosition(self, state, rowIdx)
    local unitToken;
    for i = 1, self:GetNumPartyMembers() do
        local unit = "party"..i;
        if ( UnitName(unit) == state.unitName ) then unitToken = unit; end
    end
    if ( not unitToken ) then
        state.show = false
        state.changed = true
    else
        state.unitID = unitToken;
        local region = WeakAuras.GetRegion(self.id, state.guid..state.spellID);
        local f = WeakAuras.GetUnitFrame(state.unitID, getFrameOptions);
        if ( f and region ) then
            self.auraCount[state.unitID] = self.auraCount[state.unitID] or {};
            self.auraCount[state.unitID].rowIdx = self.auraCount[state.unitID].rowIdx or 0;
            self.auraCount[state.unitID].column = self.auraCount[state.unitID].column or 0;
            self.auraCount[state.unitID].delta = self.auraCount[state.unitID].delta or 1;
            
            if ( self.auraCount[state.unitID].rowIdx == self.column ) then
                self.auraCount[state.unitID].column = self.auraCount[state.unitID].column + 1;
                self.auraCount[state.unitID].rowIdx = 0;
                self.auraCount[state.unitID].delta = rowIdx;
            end
            
            local order = self.auraCount[state.unitID].column;
            local xoffset, yoffset = 0, 0;
            local height, width = region:GetHeight() + self.spacing, region:GetWidth() + self.spacing;
            local delta = self.auraCount[state.unitID].delta;
            
            if ( config.direction == 1 ) then -- Влево, затем вниз
                yoffset = yoffset - (order * height);
                xoffset = xoffset - (rowIdx - delta) * width;
            elseif ( config.direction == 2 ) then -- Вправо, затем вниз
                yoffset = yoffset - (order * height);
                xoffset = xoffset + (rowIdx - delta) * width;
            elseif ( config.direction == 3 ) then -- Влево, затем вверх
                yoffset = yoffset + (order * height);
                xoffset = xoffset - (rowIdx - delta) * width;
            elseif ( config.direction == 4 ) then  -- Вправо, затем вверх
                yoffset = yoffset + (order * height);
                xoffset = xoffset + (rowIdx - delta) * width;
            end
            
            region:SetAnchor(self.positionFrom, f, self.positionTo);
            region:SetOffset(xoffset + self.xOffset, yoffset + self.yOffset);
            self.auraCount[state.unitID].rowIdx = self.auraCount[state.unitID].rowIdx + 1;
        else
            region:SetAnchor(self.positionFrom, _G.UIParent, self.positionTo);
            region:SetOffset(-3000, 0);
            if ( not config.lib_error ) then
                DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0PartyCooldownTracker|r: 404 frame not found. Calling the function again.")
            end
            self:scheduleUpdateEvent("INVISUS_COOLDOWNS", 0.5, "FRAME_UPDATE");
        end
    end
end

function PartyCooldownTracker:sort(allstates)
    local t = {};
    for _, state in pairs(allstates) do
        if ( state.spellID ) then
            t[#t+1] = state;
        end
    end
    table.sort(t, function (a,b)
        return ( a.spellID > b.spellID );
    end)
    
    return t;
end

PartyCooldownTracker.updateFrames = function(self, allstates)
    table.wipe(self.auraCount);
    local sortTable = self:sort(allstates);
    for guid in pairs(self.roster) do  
        local rowIdx = 0;
        for _, state in pairs(sortTable) do
            if ( state.show and state.guid == guid ) then
                rowIdx = rowIdx + 1;
                setIconPosition(self, state, rowIdx);
            end                
        end            
    end
end

do
    local timer;
    function PartyCooldownTracker:scheduleUpdateFrames(allstates, duration)
        if ( timer ) then WeakAuras.timer:CancelTimer(timer); end
        timer = WeakAuras.timer:ScheduleTimer(function()
                self:updateFrames(allstates) end, duration
            );
    end 
end

PartyCooldownTracker.Events = {};
function PartyCooldownTracker:scheduleUpdateEvent(event, duration, ...)
    if ( ( not event ) or (not duration ) ) then
        return
    end
    if ( self.Events[event] ) then
        self.Events[event] = WeakAuras.timer:CancelTimer(self.Events[event]);
    end

    self.Events[event] = WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, duration, event, ...);
end 

PartyCooldownTracker.cds = {
    ["DEATHKNIGHT"] = {
        [48707] = {
            ["cd"] = 45,
        },
        [51052] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 22,
            ["cd"] = 120,
        },
        [49016] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 19,
            ["cd"] = 180,
        },
        [48792] = {
            ["cd"] = 120,
        },
        [49005] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 15,
            ["cd"] = 180,
        },
        [48982] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 7,
            ["cd"] = 60,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 10,
            ["minusPerPoint"] = 10,
        },
        [55233] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 23,
            ["cd"] = 60,
        },
        [49576] = {
            ["cd"] = 35,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 6,
            ["minusPerPoint"] = 5,
        }, 
        [46584] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = {3, 3},
            ["minusTalentIndex"] = {13, 20},
            ["minusPerPoint"] = {45, 60},
        },  
        [42650] = {
            ["cd"] = 600,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 13,
            ["minusPerPoint"] = 120,
        },
        [47528] = {
            ["cd"] = 10,
        }, 
        [48743] = {
            ["cd"] = 120,
        }, 
        [47476] = {
            ["cd"] = 120,
            ["glyph"] = {["glyphID"] = 58618, ["minus"]= 20},
        }, 
        [49206] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 31,
            ["cd"] = 180,
        }, 
        [49203] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 20,
            ["cd"] = 180,
        }, 
        [49039] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 8,
            ["cd"] = 120
        },
        [51271] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 24,
            ["cd"] = 60,
        },
        [49937] = {
            ["cd"] = 30, 
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 5,
            ["minusPerPoint"] = 5,
        }, 
    },
    ["DRUID"] = {
        [29166] = {
            ["cd"] = 180,
        },
        [48477] = {
            ["cd"] = 600,
        },
        [48447] = {
            ["cd"] = 480,
        },
        [22812] = {
            ["cd"] = 60,
        },
        [61336] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 7,
            ["cd"] = 180,
        },
        [22842] = {
            ["cd"] = 180,
        },
        [8983] = {
            ["cd"] = 60,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 13,
            ["minusPerPoint"] = 15,
        },
        [53201] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 28,
            ["cd"] = 90,
            ["glyph"] = {["glyphID"] = 54828, ["minus"] = 30},
        }, 
        [61384] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 24,
            ["cd"] = 20,
            ["glyph"] = {["glyphID"] = 63056, ["minus"] = 3},
        },
        [33357] = {
            ["cd"] = 180,
            ["glyph"] = {["glyphID"] = 59219, ["minus"] = 36},
        }, 
        [49376] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 14,
            ["cd"] = 30,
        }, 
        [16979] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 14,
            ["cd"] = 15,
        }, 
        [50334] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 30,
            ["cd"] = 180,
        }, 
        [17116] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 12,
            ["cd"] = 180,
        },
        [18562] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 18,
            ["cd"] = 15,
        }, 
        [48438] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 27,
            ["cd"] = 6,
        }, 
        [33831] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 25,
            ["cd"] = 180,
        }, 
    },
    ["HUNTER"] = {
        [19263] = {
            ["cd"] = 60,
            ["glyph"] = {["glyphID"] = 56850, ["minus"] = 10},
        },
        [34477] = {
            ["cd"] = 30,
        },
        [53271] = {
            ["cd"] = 60,
        },
        [3045] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 10,
            ["minusPerPoint"] = 60,
        },
        [5384] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 11,
            ["minusPerPoint"] = 2,
            ["glyph"] = {["glyphID"] = 57903, ["minus"] = 5},
        },
        [781] = {
            ["cd"] = 25,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 11,
            ["minusPerPoint"] = 2,
            ["glyph"] = {["glyphID"] = 56844, ["minus"] = 5},
        },
        [63672] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 25,
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,
        },
        [49067] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,
        },
        [14311] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,
        },
        [60192] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,
        },
        [34600] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,     
        },
        [13809] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,     
        },
        [49056] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 2,      
        },
        [23989]  = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 14,
            ["cd"] = 180,
        }, 
        [19503]  = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 9,
            ["cd"] = 30,
        },
        [34490]  = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 24,
            ["cd"] = 20,
        },
        [1543]   = {
            ["cd"] = 20,
        },  
        [49012]  = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 20,
            ["cd"] = 60,
            ["glyph"] = {["glyphID"] = 56848, ["minus"] = 6},
        }, 
        [49048]  = {
            ["cd"] = 10,
            ["glyph"] = {["glyphID"] = 56836, ["minus"] = 1},
        }, 
        [19577]  = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 13,
            ["cd"] = 60,
        }, 
        [19574]  = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 18,
            ["cd"] = 100,
            ["glyph"] = {["glyphID"] = 56830, ["minus"] = 20},
        }, 
        [49050]  = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 9,
            ["cd"] = 8,
            ["glyph"] = {["glyphID"] = 56824, ["minus"] = 2},
        }, 
        [53209]  = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 27,
            ["cd"] = 10,
            ["glyph"] = {["glyphID"] = 63065, ["minus"] = 1},
        }, 
        [61006]  = {
            ["cd"] = 15,
            ["glyph"] = {["glyphID"] = 63067, ["minus"] = 6}, 
        }, 
    },
    ["MAGE"] = {
        [45438] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 3,
            ["minusPerPoint"] = 20,
        },
        [66] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 24,
            ["minusPerPoint"] = 27,
        },
        [12472] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 3,
            ["minusPerPoint"] = 12,
        },
        [42917] = {
            ["cd"] = 25,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 3,
            ["minusPerPoint"] = 1.666667,
        },        
        [42931] = {
            ["cd"] = 10,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 3,
            ["minusPerPoint"] = 0.7,    
        },   
        [2139]  = {
            ["cd"] = 24,
        }, 
        [55342] = {
            ["cd"] = 180,
        }, 
        [1953]  = {
            ["cd"] = 15,
        },
        [12051] = {
            ["cd"] = 240,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 24,
            ["minusPerPoint"] = 60,
        },
        [12043] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 16,
            ["cd"] = 120,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 24,
            ["minusPerPoint"] = 18,
        },
        [12042] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 22,
            ["cd"] = 120,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 24,
            ["minusPerPoint"] = 18,
        }, 
        [42945] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 16,
            ["cd"] = 30,
        },  
        [42950] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 25,
            ["cd"] = 20,
        }, 
        [11958] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 14,
            ["cd"] = 480,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 17,
            ["minusPerPoint"] = 48,
        },
        [43039] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 20,
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 17,
            ["minusPerPoint"] = 3,
        }, 
        [31687] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 25,
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 17,
            ["minusPerPoint"] = 15,
            ["glyph"] = {["glyphID"] = 56373, ["minus"] = 30},
        },
        [44572] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 28,
            ["cd"] = 30,
        },  
    },
    ["PALADIN"] = {
        [31821] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 6,
            ["cd"] = 120,
        },
        [498] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 14,
            ["minusPerPoint"] = 30,
        },
        [64205] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 6,
            ["cd"] = 120,
        },
        [642] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 14,
            ["minusPerPoint"] = 30,
        },
        [48788] = {
            ["cd"] = 1200,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 8,
            ["minusPerPoint"] = 120,
            ["glyph"] = {["glyphID"] = 57955, ["minus"] = 300},
        },
        [1044] = {
            ["cd"] = 25,
        },
        [54428] = {
            ["cd"] = 60,
        },
        [10278] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 4,
            ["minusPerPoint"] = 60,
        },
        [6940] = {
            ["cd"] = 120,
        },
        [1038] = {
            ["cd"] = 120,
        },
        [10308] = {
            ["cd"] = 60,
            ["minus"] = true,
            ["minusTabIndex"] = {2, 2},
            ["minusTalentIndex"] = {10, 25},
            ["minusPerPoint"] = {10, 5},
        },  
        [31884] = {
            ["cd"] = 180,
        }, 
        [48806] = {
            ["cd"] = 6,
        }, 
        [19752] = {
            ["cd"] = 600,
        }, 
        [31935] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 22,
            ["cd"] = 30,
        }, 
        [20066] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 18,
            ["cd"] = 60,
        },
        [48825] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 19,
            ["cd"] = 6,
            ["glyph"] = {["glyphID"] = 63224, ["minus"] = 1},
        }, 
        [20216] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 13,
            ["cd"] = 120,
        }, 
        [10326] = {
            ["cd"] = 1,
            ["glyph"] = {["glyphID"] = 54931, ["minus"] = -7},
        },
        [48817] = {
            ["cd"] = 30,
            ["glyph"] = {["glyphID"] = 56420, ["minus"]= 15},
        }, 
    },
    ["PRIEST"] = {
        [64843] = {
            ["cd"] = 480,
        },
        [48158] = {
            ["cd"] = 12,
        },
        [6346] = {
            ["cd"] = 180,
            ["glyph"] = {["glyphID"] = 55678, ["minus"] = 60},
        },
        [47788] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 27,
            ["cd"] = 180,
        },
        [64901] = {
            ["cd"] = 360,
        },
        [10060] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 19,
            ["cd"] = 120,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 23,
            ["minusPerPoint"] = 12,
        },
        [10890] = {
            ["cd"] = 27,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 2,
            ["glyph"] = {["glyphID"] = 55676, ["minus"] = -8},
        },
        [34433] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 10,
            ["minusPerPoint"] = 60,
        },
        [33206] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 25,
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 23,
            ["minusPerPoint"] = 18,
        },
        [48173] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 6,
            ["cd"] = 120,
        },   
        [53007] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 25,
            ["cd"] = 10,
            ["glyph"] = {["glyphID"] = 63235, ["minus"] = 2},
        },  
        [14751] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 8,
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 23,
            ["minusPerPoint"] = 18,
        },
        [64044] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 23,
            ["cd"] = 120,
        }, 
        [47585] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 27,
            ["cd"] = 120,
            ["glyph"] = {["glyphID"] = 63229, ["minus"]= 45},
        }, 
        [15487] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 13,
            ["cd"] = 45,
        }, 
    },
    ["ROGUE"]  = {
        [31224] = {
            ["cd"] = 90,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 15,
        },
        [26669] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 30,
        },
        [57934] = {
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 26,
            ["minusPerPoint"] = 5,
        }, 
        [26889] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 30,
        },
        [2094] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 30,
        },
        [14185] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 14,
            ["cd"] = 480,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 26,
            ["minusPerPoint"] = 90, 
        },
        [36554] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 25,
            ["cd"] = 30,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 26,
            ["minusPerPoint"] = 5,
            
        },
        [11305] = {
            ["cd"] = 180,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 7,
            ["minusPerPoint"] = 30,
        },
        [51722] = {
            ["cd"] = 60,
        },  
        [1766]  = {
            ["cd"] = 10,
        }, 
        [1776]  = {
            ["cd"] = 10,
        },  
        [8643]  = {
            ["cd"] = 20,
        },
        [51713] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 28,
            ["cd"] = 60,
        },  
        [51690] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 28,
            ["cd"] = 120,
            ["glyph"] = {["glyphID"] = 63252, ["minus"]= 45},
        },
        [14177] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 13,
            ["cd"] = 180,
        },  
    },
    ["SHAMAN"] = {
        [32182] = {
            ["cd"] = 300,
        },
        [2825] = {
            ["cd"] = 300,
        },
        [16190] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 17,
            ["cd"] = 300,
        },
        [20608] = {
            ["cd"] = 1800,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 3,
            ["minusPerPoint"] = 420,
        },
        [30823] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 26,
            ["cd"] = 60,
        },
        [57994] = {
            ["cd"] = 6,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 6,
            ["minusPerPoint"] = 0.2,
        }, 
        [8177]  = {
            ["cd"] = 15,
        },  
        [51514] = {
            ["cd"] = 45,
        }, 
        [59159] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 25,
            ["cd"] = 45,
            ["glyph"] = {["glyphID"] = 63270, ["minus"] = 10},
        }, 
        [51533] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 29,
            ["cd"] = 180,
        },  
        [2894]  = {
            ["cd"] = 600,
            ["glyph"] = {["glyphID"] = 55455, ["minus"] = 300},
            
        },  
        [2484]  = {
            ["cd"] = 15,
        }, 
        [16166] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 16,
            ["cd"] = 180,
            ["glyph"] = {["glyphID"] = 55452, ["minus"] = 30},
        }, 
    }, 
    ["WARLOCK"] = {
        [47877] = {
            ["cd"] = 120,
        },
        [48020] = {
            ["cd"] = 30,
            ["glyph"] = {["glyphID"] = 63309, ["minus"] = 4}, 
        }, 
        [1122]  = {
            ["cd"] = 600,
        },
        [61290] = {
            ["cd"] = 15,
        },
        [47827] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 7,
            ["cd"] = 15,
        },
        [59671] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 27,
            ["cd"] = 15,
        },
        [54785] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 27,
            ["cd"] = 45,
        },  
        [47860] = {
            ["cd"] = 120,
        }, 
        [17928] = {
            ["cd"] = 40,
            ["glyph"] = {["glyphID"] = 56217, ["minus"] = 8},
        },
        [50796] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 26,
            ["cd"] = 12,   
            ["glyph"] = {["glyphID"] = 63304, ["minus"] = 2},    
        },  
        [47847] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 23,
            ["cd"] = 20,
        }, 
        [18708] = {
            ["cd"] = 180,
        },
        [47139] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 19,
            ["cd"] = 60,  
        },
    },
    ["WARRIOR"] = {
        [55694] = {
            ["cd"] = 180,
        },
        [12975] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 6,
            ["cd"] = 180,
            ["glyph"] = {["glyphID"] = 58376, ["minus"] = 60},
        },
        [2565] = {
            ["cd"] = 60,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 8,
            ["minusPerPoint"] = 10,
        },
        [871] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 13,
            ["minusPerPoint"] = 30,
            ["glyph"] = {["glyphID"] = 63329, ["minus"] = 120},
        },
        [11578] = {
            ["cd"] = 15,
            ["minus"] = true,
            ["minusTabIndex"] = 1,
            ["minusTalentIndex"] = 24,
            ["minusPerPoint"] = -5,
        },  
        [676] = {
            ["cd"] = 60,
            ["minus"] = true,
            ["minusTabIndex"] = 3,
            ["minusTalentIndex"] = 11,
            ["minusPerPoint"] = 10,
        },
        [1719] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 33.333,
        },
        [20230] = {
            ["cd"] = 300,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 18,
            ["minusPerPoint"] = 33.333,
        },
        [20252] =  {
            ["cd"] = 25,
            ["minus"] = true,
            ["minusTabIndex"] = 2,
            ["minusTalentIndex"] = 15,
            ["minusPerPoint"] = 5,
        },
        [23920] = {
            ["cd"] = 10,
            ["glyph"] = {["glyphID"] = 63328, ["minus"] = 1},
        },
        [3411]  = {
            ["cd"] = 30,
        }, 
        [72]    = {
            ["cd"] = 12,
        }, 
        [6552]  = {
            ["cd"] = 10,            
        }, 
        [5246]  = {
            ["cd"] = 120,
        },
        [46924] = {
            ["tReq"] = true,
            ["tabIndex"] = 1,
            ["talentIndex"] = 31,
            ["cd"] = 90,
            ["glyph"] = {["glyphID"] = 63324, ["minus"] = 15},
        }, 
        [60970] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 23,
            ["cd"] = 45,
        },  
        [12809] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 14,
            ["cd"] = 30,
        }, 
        [46968] = {
            ["tReq"] = true,
            ["tabIndex"] = 3,
            ["talentIndex"] = 27,
            ["cd"] = 20,
            ["glyph"] = {["glyphID"] = 63325, ["minus"] = 3},
        },
        [12292] = {
            ["tReq"] = true,
            ["tabIndex"] = 2,
            ["talentIndex"] = 14,
            ["cd"] = 180,
        },
    },    
};

if ( config.cds ) then
    for class, classData in pairs(config.cds) do
        if ( PartyCooldownTracker.cds[class] ) then
            for spellID, enable in pairs(classData) do
                spellID = tonumber(spellID);
                local spellDATA = PartyCooldownTracker.cds[class][spellID];
                if ( spellDATA ) then
                    spellDATA.display = enable;
                end
            end
        end
    end
end

-- Heroism / Bloodlust
if ( UnitFactionGroup("player") == "Horde" ) then
    PartyCooldownTracker.cds["SHAMAN"][32182] = nil;
else
    PartyCooldownTracker.cds["SHAMAN"][2825] = nil;
end
-- preparation spells
PartyCooldownTracker.refresh = {
    [14185] = {26669, 11305, 26889, 14177, 36554, 13877, 51722, 1766}, -- ROGUE
    [23989] = {
        19263, 5384, 781, 19503, 34490, 1543, 34600, 3045, 
        49067, 49056, 14311, 60192, 13809, 63672, 49012,  
        49048, 19577, 49050,53209, 61006, 34477, 53721
    }, -- HUNTER
    [11958] = {42917, 45438, 43039, 31687, 44572, 12472}, -- MAGE
    [46584] = {47481}, -- DK
};

PartyCooldownTracker.anyCDs = {
    -- spellID                itemID/race                          
    [42292] = {["cd"] = 120, ["trinket"] = {51377, 51378, 46082}}, -- Медальон Альянса\Орды
    [71607] = {["cd"] = 120, ["trinket"] = {50726, 50354}}, -- Подвеска истинной крови
    [71586] = {["cd"] = 120, ["trinket"] = 50356}, -- Проржавевший костяной ключ
    [71638] = {["cd"] = 60,  ["trinket"] = 50364}, -- Безупречный клык Синдрагосы
    [75490] = {["cd"] = 120, ["trinket"] = 54573}, -- Светящаяся сумеречная чешуя
    [67596] = {["cd"] = 120, ["trinket"] = {42137, 42136, 42135, 42134, 42133}}, -- Ярость/Точность/Бодрость/Неистовство/Опустошение военачальника
    
    [59752] = {["cd"] = 120, ["race"] = "Human"}, -- Каждый за себя
    [58984] = {["cd"] = 120, ["race"] = "NightElf"}, -- Слиться с тенью
    [59547] = {["cd"] = 180, ["race"] = "Draenei"}, -- Дар наару
    [20594] = {["cd"] = 120, ["race"] = "Dwarf"}, -- Каменная форма
    [20589] = {["cd"] = 95,  ["race"] = "Gnome"}, -- Мастер побега
    [20572] = {["cd"] = 120, ["race"] = "Orc"}, -- Кровавое неистовство
    [7744]  = {["cd"] = 120, ["race"] = "Scourge"}, -- Воля Отрекшихся
    [20549] = {["cd"] = 120, ["race"] = "Tauren"}, -- Громовая поступь
    [26297] = {["cd"] = 180, ["race"] = "Troll"}, -- Берсерк
    [28730] = {["cd"] = 120, ["race"] = "BloodElf"}  -- Волшебный поток
};

if ( config.ANY ) then
    for spellID, enable in pairs(config.ANY) do
        spellID = tonumber(spellID);
        if ( PartyCooldownTracker.anyCDs[spellID] ) then
            PartyCooldownTracker.anyCDs[spellID].display = enable;
        end
    end
end
-- casting spells that can"t be read from CLEU
PartyCooldownTracker.USS = {
    [GetSpellInfo(48477)] = {
        display = PartyCooldownTracker.cds.DRUID[48477].display,
        id = 48477,
    },
    [GetSpellInfo(51514)] = {
        display = PartyCooldownTracker.cds.SHAMAN[51514].display,
        id = 51514,
    },
    [GetSpellInfo(61384)] = {
        display = PartyCooldownTracker.cds.DRUID[61384].display,
        id = 61384,
    },
    [GetSpellInfo(17928)] = {
        display = PartyCooldownTracker.cds.WARLOCK[17928].display,
        id = 17928,
    },
    [GetSpellInfo(50796)] = {
        display = PartyCooldownTracker.cds.WARLOCK[50796].display,
        id = 50796,
    }, 
    [GetSpellInfo(47877)] = {
        display = PartyCooldownTracker.cds.WARLOCK[47877].display,
        id = 47877,
    },
    [GetSpellInfo(53007)] = {
        display = PartyCooldownTracker.cds.PRIEST[53007].display,
        id = 53007
    }
};
-- spells that have one CD"s
PartyCooldownTracker.relationship = {
    ["PALADIN"] = {
        [498]   = {[31884] = 30, [642] = 120},
        [642]   = {[31884] = 30, [498] = 120},
        [31884] = {[642]   = 30, [498] = 30},
        [10278] = {[31884] = 30, [642] = 120, [498] = 120},
    },
    ["WARRIOR"] = {
        [72]    = {[6552] = 10},
        [6552]  = {[72] = 12}
    },
    ["HUNTER"]  = {
        [14311] = {[60192] = 30, [13809] = 30}, 
        [60192] = {[14311] = 30, [13809] = 30},
        [13809] = {[14311] = 30, [60192] = 30},
        [49056] = {[49067] = 30},
        [49067] = {[49056] = 30}
    },
    ["DRUID"]   = {
        [49376] = {[16979] = 15},
        [16979] = {[49376] = 15}
    }
};

local L = {};
if GetLocale() == "ruRU" then
    L["Felhunter"] = "Охотник Скверны"
    L["Voidwalker"] = "Демон Бездны"
    L["Ghoul"] = "Вурдалак"
    L["Spider"] = "Паук"
    L["Crab"] = "Краб"
    L["Wolf"] = "Волк"
    L["Worm"] = "Червь"   
    L["Chimaera"] = "Химера"
    L["Gorilla"] = "Горилла"
    L["Turtle"] = "Черепаха"
    L["Spirit Beast"] = "Дух зверя"
    L["Core Hound"] = "Гончая Недр"
    L["Bat"] = "Летучая мышь"
    L["Ravager"] = "Опустошитель"
else
    L["Felhunter"] = "Felhunter"
    L["Voidwalker"] = "Voidwalker"
    L["Ghoul"] = "Ghoul"
    L["Spider"] = "Spider"
    L["Crab"] = "Crab"
    L["Wolf"] = "Wolf"
    L["Worm"] = "Worm"   
    L["Chimaera"] = "Chimaera"
    L["Gorilla"] = "Gorilla"
    L["Turtle"] = "Turtle"
    L["Spirit Beast"] = "Spirit Beast"
    L["Core Hound"] = "Core Hound"
    L["Bat"] = "Bat"
    L["Ravager"] = "Ravager"
end
-- pet ability table (API return only localization)
PartyCooldownTracker.pets = {
    [L["Felhunter"]] = {
        [19647] = {["cd"] = 24},
        [48011] = {["cd"] = 8},
        [54053] = {["cd"] = 6},
    },
    [L["Voidwalker"]] = {
        [47986] = {["cd"] = 60},
        [47990] = {["cd"] = 120},
    },
    [L["Ghoul"]] = {
        [47482] = {["cd"] = 20},
        [47481] = {["cd"] = 60},
        [47484] = {["cd"] = 45},
    },
    [L["Spider"]] =  {
        [4167] = {["cd"] = 40},
    },
    [L["Crab"]] = { 
        [53548] = {["cd"] = 40},
        [53480] = {["cd"] = 60},
    },
    [L["Gorilla"]] = { 
        [26090] = {["cd"] = 30},
        [53480] = {["cd"] = 60},
    },
    [L["Turtle"]] = {
        [26064] = {["cd"] = 60},
        [53480] = {["cd"] = 60},
    },
    [L["Turtle"]] = {
        [55754] = {["cd"] = 10}, 
        [53480] = {["cd"] = 60},
    },
    [L["Wolf"]] = {
        [64495] = {["cd"] = 40}
    },
    [L["Chimaera"]] = {
        [55492] = {["cd"] = 10},
    },
    [L["Spirit Beast"]] = {
        [61198] = {["cd"] = 10},
    },
    [L["Core Hound"]] = {
        [58611] = {["cd"] = 10},
    },
    [L["Bat"]] = {
        [53568] = {["cd"] = 60}, 
    },
    [L["Ravager"]] = {
        [53561] = {["cd"] = 40},
        [53480] = {["cd"] = 60},
    },
};

for _, classData in pairs(config.cds) do
    if ( classData.pet ) then
        for spellID, enable in pairs(classData.pet) do
            spellID = tonumber(spellID);
            for type, data in pairs(PartyCooldownTracker.pets) do
                for spellId in pairs(data) do
                    if ( spellId == spellID ) then
                        PartyCooldownTracker.pets[type][spellID].display = enable;
                    end
                end
            end
        end
    end
end
--------------------------------------------------------------------------------------------------------
-- blacklist for CLUE:SPELL_CAST_SUCCESS
PartyCooldownTracker.blacklist = {
    [57934] = true, -- Маленькие хитрости
    [34477] = true, -- Перенаправление
    [14751] = true, -- Внутреннее сосредоточение
    [46584] = true, -- Воскрешение мертвых
    [20216] = true, -- Божественное одобрение
};