local NpcId = 94148

local MenuId = 123



local function OnGossipHello(event, player, object)
	player:GossipClearMenu() -- nao deletar, se nao repete os gossips
	player:GossipMenuAddItem(6," test vendor",0, 3)
	player:GossipMenuAddItem(6," test ",0, 4)
	player:GossipSendMenu(2, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if(intid == 4) then   
		player:GossipComplete()
		player:SendBroadcastMessage("test")
	end
end

local function OnPlayerCommand(event, player, command)
    if (command == "testtesttesttesttesttesttest") then
        OnGossipHello(event, player, player)
        return false
    end
end


--RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
--RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)
--RegisterPlayerEvent(42, OnPlayerCommand)

--RegisterPlayerGossipEvent(MenuId, 2, OnGossipSelect)