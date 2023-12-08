function RunInviteTimer()
-- Таймер приглашения на арену, поле боя
local frame = CreateFrame("Frame", nil, StaticPopup1)

local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
text:SetPoint("TOP", StaticPopup1, "BOTTOM", 0, 2)
text:SetTextHeight(11)

local text2 = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text2:SetPoint("TOP", StaticPopup1, "TOP", 0, 20.5)
text2:SetTextHeight(21)
text2:SetShadowOffset(1.5, -1.5)

--[[local ReverseBar -- Инвертируем статусбар, теперь происходит не заполнение а опустошение.
do
    local UpdaterOnUpdate = function(Updater)
        Updater:Hide()
        local b = Updater:GetParent()
        local texture = b:GetStatusBarTexture()
        texture:ClearAllPoints()
        texture:SetPoint("BOTTOMRIGHT")
        texture:SetPoint("TOPLEFT", b, "TOPRIGHT", (b:GetValue() / select(2, b:GetMinMaxValues() ) - 1) * b:GetWidth(), 0)
    end

    local OnChanged = function(bar)
        bar.Updater:Show()
    end

    function ReverseBar(Frame)
        local bar = CreateFrame("StatusBar", nil, Frame)
        bar.Updater = CreateFrame("Frame", nil, bar)
        bar.Updater:Hide()
        bar.Updater:SetScript("OnUpdate", UpdaterOnUpdate)
        bar:SetScript("OnSizeChanged", OnChanged)
        bar:SetScript("OnValueChanged", OnChanged)
        bar:SetScript("OnMinMaxChanged", OnChanged)
        return bar
    end
end]]

--local frame2 = ReverseBar(frame) -- замена для CreateFrame("StatusBar")
local frame2 = CreateFrame("StatusBar", nil, frame)
frame2:SetFrameStrata("HIGH")
frame2:SetWidth(400)
frame2:SetHeight(12)
frame2:SetPoint("TOP", StaticPopup1, "BOTTOM", 0, 2)
frame2:SetOrientation("HORIZONTAL")
frame2:SetMinMaxValues(0, 1)
frame2:SetStatusBarTexture("Interface\\Addons\\FriskesUI\\Media\\Textures\\RetailTimer\\Raid-Bar-Hp-Fill")
frame2:SetStatusBarColor(1, 0, 0, 1)
frame2:Hide()

local background = frame2:CreateTexture(nil, "BACKGROUND")
background:SetPoint("TOPRIGHT", frame2, "TOPRIGHT", 0, 0)
background:SetPoint("BOTTOMLEFT", frame2, "BOTTOMLEFT", 0, 0)
background:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
background:SetVertexColor(0, 0, 0, 0.5)

local Backdrop = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 9, edgeSize = 9,
	insets = { left = 2, right = 2, top = 3, bottom = 2 }
}

local border = CreateFrame("Frame", nil, frame2)
border:SetPoint("TOPRIGHT", frame2, "TOPRIGHT", 2, 2) -- право, верх
border:SetPoint("BOTTOMLEFT", frame2, "BOTTOMLEFT", -2, -1.5) -- лево, низ
border:SetBackdrop(Backdrop)
border:SetBackdropColor(0, 0, 0, 0.0) -- сделал отельный бэкграунд т.к. не смог вставить статус бар между слоями бэкдропа =|
border:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

local function InviteSound_OnEvent(self, event, ...)
    if GetBattlefieldStatus(1) == "confirm" then
        PlaySoundFile("Interface\\AddOns\\FriskesUI\\Media\\Sounds\\SndIncMsg.ogg", "Master")
    end
end
frame2:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
frame2:SetScript("OnEvent", InviteSound_OnEvent)

local function InviteTimer_OnEvent_and_OnUpdate(self, event, ...)

    for index = 1, MAX_BATTLEFIELD_QUEUES do

        local status, name, teamSize = GetBattlefieldStatus(index)

        if status == "confirm" then

            text:SetText(string.format("0:%.f", GetBattlefieldPortExpiration(index) ) )
            text2:SetText(string.format(name, GetBattlefieldStatus(index) ) )
            frame:Show()
            frame2:Show()
            frame2:SetScript("OnUpdate", frame2.OnUpdate)
        end
    end

    if event == "PLAYER_ENTERING_WORLD" then
        frame:Hide()
    end
end
frame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", InviteTimer_OnEvent_and_OnUpdate)

local frame3 = CreateFrame("Frame")

function frame2:OnUpdate()

    InviteTimer_OnEvent_and_OnUpdate()

    self:SetValue( (GetBattlefieldPortExpiration(1) / 60) % 1)
            --print( (GetBattlefieldPortExpiration(1) / 60) % 1)
            --print(GetBattlefieldPortExpiration(1) )

    if GetBattlefieldPortExpiration(1) <= 0 then
        frame3:OnUpdate()
    end
end

-- Добавляем долбаную секунду..
function frame3.OnUpdate(Frame)

    local Update = 1

    Frame:SetScript("OnUpdate", function(self, elapsed)

        Update = Update - elapsed

        if Update <= 0 then
            frame:Hide()
            self:SetScript("OnUpdate", nil)
        end
    end)
end

StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].hideOnEscape = false -- отключаем скрытие окна при нажатии кнопки ESCape

--[[StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow = function(self) -- отключаем кликабельность кнопок
    --self.button1:Disable()
    self.button2:Disable()
    StaticPopup1CloseButton:Disable()
end]]
end
