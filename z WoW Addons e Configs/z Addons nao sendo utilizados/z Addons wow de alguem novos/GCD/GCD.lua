local select, pairs, sort, UnitGUID, UnitExists, GetSpellInfo = select, pairs, table.sort, UnitGUID, UnitExists, GetSpellInfo

local showAnchors = false
local units = {
    ["player"] = {siz = 30,sp = 2, growth = "RIGHT", limit = 6, hold = 5, x = -420, y = -390},
    ["target"] = {siz = 0, sp = 2, growth = "RIGHT", limit = 10, hold = 4, x = -100, y = 280},
    ["focus"] = {siz = 0, sp = 2, growth = "RIGHT", limit = 10, hold = 4, x = -100, y = 30},
}

local f = CreateFrame"frame"

local frames = {}
for unit, cfg in pairs(units) do
    local anc = CreateFrame("Frame", nil, UIParent)
    anc:SetSize(cfg.siz, cfg.siz)
    anc:SetPoint("CENTER", cfg.x, cfg.y)
    if showAnchors then
        anc.tex = anc:CreateTexture()
        anc.tex:SetAllPoints()
        anc.tex:SetTexture(1,1,1)
    end
    frames[unit] = anc
end

local OnUpdate = function(self, elapsed)
    self.hold = self.hold - elapsed

    if self.hold < 0 then
        self:Hide()
    else
        self:SetAlpha(self.hold)
    end
end

local Compare = function(a, b)
    if a and b then
        return a.hold > b.hold
    end
end

local UpdatePosition = function(self, cfg)
    sort(self, Compare)

    local g, siz = cfg.growth, cfg.siz+cfg.sp
    for i = 1, #self do
        local icon = self[i]
        
        if not icon then return end
        icon:ClearAllPoints()
        local col = (i - 1)
        icon:SetPoint("CENTER", self, ((g=="LEFT" and -1) or (g=="RIGHT" and 1) or 0)*col*siz, ((g=="DOWN" and -1) or (g=="UP" and 1) or 0)*col*siz)
    end
end

local CreateIcon = function(self, siz)
    local icon = CreateFrame("frame", nil, self)
    icon:Hide()
    icon:SetSize(siz, siz)
    
    local tex = icon:CreateTexture()
    tex:SetAllPoints()
    icon.tex = tex
    
    icon.hold = 0
    icon.parent = self
    
    icon:SetScript("OnUpdate", OnUpdate)
    
    table.insert(self, icon)
    
    return icon
end

local UpdateIcons = function(self, texture, cfg)

    local index = 1
    local icon
    
    for i = 1 , cfg.limit do
        local tmp = self[i] or CreateIcon(self, cfg.siz)
        
        if tmp:IsShown() then
            index = index + 1
        else
            icon = self[index]
        end
    end
    
    if not icon then return end
    
    icon.tex:SetTexture(texture)
    icon.hold = cfg.hold
    icon:SetAlpha(1)
    icon:Show()
    
    UpdatePosition(self, cfg)
end

f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(self, event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
    if eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_HEAL" or eventType == "SPELL_DAMAGE" then
        local spellID = ...
        for unit, cfg in pairs(units) do
            if UnitExists(unit) then
                if UnitGUID(unit) == sourceGUID then
                    UpdateIcons(frames[unit], select(3, GetSpellInfo(spellID)), cfg)
                end
            end
        end
    end
end)  