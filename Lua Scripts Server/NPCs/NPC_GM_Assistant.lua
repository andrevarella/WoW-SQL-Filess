local UnitEntry = 9000000

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(0," Serviços de GM",0, 1)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 80271)
   end
   
   	if(intid == 1) then
		player:GossipSetText(string.format(" "))
		player:GossipMenuAddItem(6," Trocar o Nome",0, 5)
		player:GossipMenuAddItem(6," Trocar a Aparencia",0, 6)
		player:GossipMenuAddItem(6," Trocar a Raça",0, 4)
		player:GossipMenuAddItem(6," Trocar a Facção",0, 3)
		player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

	if (intid == 3) then -- Trocar Facção
		player:SetAtLoginFlag(64) player:SendAreaTriggerMessage("Relogue para alterar sua facção.")
		player:GossipComplete()
	end
	if (intid == 4) then -- Alterar Raça
		player:SetAtLoginFlag(128) player:SendAreaTriggerMessage("Relogue para alterar sua raça.")
		player:GossipComplete()
	end
	if (intid == 5) then -- Alterar Nome
		player:SetAtLoginFlag(1) player:SendAreaTriggerMessage("Relogue para alterar seu nome.")
		player:GossipComplete()
	end
	if (intid == 6) then -- Alterar Aparência
		player:SetAtLoginFlag(8) player:SendAreaTriggerMessage("Relogue para alterar sua aparência.")
		player:GossipComplete()
	end
   
	if(intid == 499) then
		MultiVendor_Open(unit, player, creature)
	elseif(intid == 500) then
		player:GossipComplete()	
	end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)