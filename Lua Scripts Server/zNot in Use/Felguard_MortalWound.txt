--[[
local function OnCast(event, player, spell)
    local map = player:GetMap()
    local spellID = spell:GetEntry()

	if not map:IsDungeon() or map:IsRaid() then
		if spellID == 47994 or spellID == 47815 then
			print("Spell called")
			player:CastSpell(target, 25646, true)
			--player:AddAura(25646, target)
		end
	end
end

RegisterPlayerEvent(5, OnCast)

--]]