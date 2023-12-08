--[[

local UnitEntry = 94148
local customDisplayID = 19844


local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(3," Test",0, 1)
	-- nao funciona mt bem, pq toda hora que reloga, ou ressar o pet, volta o display original
    player:GossipMenuAddItem(3," Morph Pet (Ravager)",0, 2)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

	
	-- Ravager	
	if(intid == 2) then
        local petguid = player:GetPetGUID()
        if (petguid) then
            local pet = player:GetMap():GetWorldObject(petguid)
            if (pet) then
                pet:SetDisplayId(customDisplayID) -- Define o novo displayID personalizado
                pet:SetScale(1.5)
                player:SendAreaTriggerMessage("Your pet's display has been changed.")
            end
        end
        player:GossipComplete()
    end
   
	if(intid == 500) then
		player:GossipComplete()	
	end	
end	   

local function On_Pet_Revived(event, player, pet)
    if (pet) then
        pet:SetDisplayId(customDisplayID) -- Define o displayID personalizado após a ressurreição
        pet:SetScale(1.5)
    end
end

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)
RegisterPlayerEvent(9, On_Pet_Revived) -- Registro do evento de ressurreição do pet


--]]