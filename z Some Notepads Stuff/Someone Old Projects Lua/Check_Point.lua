-- You can make file name by "INSTANCE CHECK POINT SAVE.LUA"
-- This script is created by AMIGA.

-- this function is to save player's current position in custom table. 
-- if there is no custom table, below query will execute to create table.
-- you can save your position by write "#InstanceCheckPoint"  in chat window.
-- you can change the instructor "#InstanceCheckPoint" 


local function CheckPoint (event, player, msg, Type, lang)
        if (msg == "#InstanceCheckPoint") 
		then
                    if not(CharDBQuery("SHOW TABLES LIKE 'character_instance_checkpoint';")) 
    				then
                              CharDBQuery("CREATE TABLE `character_instance_checkpoint` (  `guid` int(10) unsigned NOT NULL DEFAULT '0',`mapid` int(10) unsigned NOT NULL DEFAULT '0',`x` float NOT NULL DEFAULT '0',`y` float NOT NULL DEFAULT '0',`z` float NOT NULL DEFAULT '0',`o` float NOT NULL DEFAULT '0') ENGINE=InnoDB DEFAULT CHARSET=utf8;")
                    end
    				
                CharDBQuery("DELETE FROM character_instance_checkpoint WHERE GUID = "..player:GetGUIDLow().." ;")
                CharDBQuery("INSERT INTO character_instance_checkpoint  ( guid,mapid,x,y,z,o ) VALUES ( "..player:GetGUIDLow()..", "..player:GetMapId()..", "..player:GetX()..", "..player:GetY()..", "..player:GetZ()..", "..player:GetO()..");")
                player:SendBroadcastMessage("Saved your current position. \n You can return previous location by using checkpoint teleportor  \n  [!!!WARNING!!!]   \n  If you saved your postion near mob, it will be very dangerous.")

        end
end	

RegisterPlayerEvent(18, CheckPoint)



-- teleporter's gossip & teleport function 


local NpcId = 60001
local pguid
local pmapid
local px
local py
local pz
local po


local function OnGossipHello(event, player, object)
    player:GossipClearMenu() 
    player:GossipMenuAddItem(0, "Teleport to your previous save point", 1, 1)
    player:GossipMenuAddItem(0, "Exit", 1, 2)
    player:GossipSendMenu(1, object, MenuId) 
end


local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
        local Q = CharDBQuery("SELECT * FROM character_instance_checkpoint  WHERE guid = "..player:GetGUIDLow().." ;")
    if (intid == 1) then
	    if not ( Q == nil ) then
        pmapid = Q:GetUInt32(1)
		px = Q:GetFloat(2)
		py = Q:GetFloat(3)
		pz = Q:GetFloat(4)
		po = Q:GetFloat(5)
				
		player:Teleport(pmapid, px, py, pz, po)		
		else
        player:GossipComplete()
		end

    elseif (intid == 2) then
        player:GossipComplete()
    
    end
end


RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)

