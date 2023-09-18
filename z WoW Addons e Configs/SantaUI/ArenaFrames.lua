local AddOn = CreateFrame("Frame")
local OnEvent = function(self, event, ...) self[event](self, event, ...) end
AddOn:SetScript("OnEvent", OnEvent)

local function PLAYER_ENTERING_WORLD()

	local _, type = GetInstanceInfo()
	if type == "arena" then

		for i=1,MAX_ARENA_ENEMIES do 
			_G["ArenaEnemyFrame"..i]:SetScale(1.5)
			_G["ArenaEnemyFrame"..i.."PetFrame"]:SetScale(1.5)
		end	

		ArenaEnemyFrame1:SetPoint("TOPRIGHT", -80, -75)
	end
end

AddOn:RegisterEvent("PLAYER_ENTERING_WORLD")
AddOn["PLAYER_ENTERING_WORLD"] = PLAYER_ENTERING_WORLD