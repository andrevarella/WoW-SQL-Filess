--
-- casta battle/def/berserker stance on login, se nao tiver em nenhuma stance
-- as vezes, apos relogar fica sem stance e sem a barra de stance

function OnLoginCastStance(event, player)
	local battlestance = 2457
	local defensivestance = 71
	local berserkerstance = 2458
	local mortalstrike = 47486
	local bloodthirst = 23881
	local shockwave = 46968
 
	local bloodpresence = 48266
	local frostpresence = 48263
	local unholypresence = 48265
	local heartstrike = 55050
	local froststrike = 55268
	local scourgestrike = 55271

	-- Warrior
	if player:GetClass() == 1 then
		--if not player:HasAura(battlestance) or not player:HasAura(defensivestance) or not player:HasAura(berserkerstance) then
		if not player:HasAura(battlestance or defensivestance or berserkerstance) then
			if player:HasSpell(mortalstrike) then
				player:AddAura(battlestance, player)
			elseif player:HasSpell(bloodthirst) then
				player:AddAura(berserkerstance, player)
			elseif player:HasSpell(shockwave) then
				player:AddAura(defensivestance, player)
			end
		end
	end
	
	-- Death Knight
	if player:GetClass() == 6 then
		if not player:HasAura(bloodpresence or frostpresence or unholypresence) then
			if player:HasSpell(heartstrike) then
				player:AddAura(frostpresence, player)
			elseif player:HasSpell(froststrike) then
				player:AddAura(unholypresence, player)
			elseif player:HasSpell(scourgestrike) then
				player:AddAura(unholypresence, player)
			end
		end
    end
end
	
	
RegisterPlayerEvent(3, OnLoginCastStance)

