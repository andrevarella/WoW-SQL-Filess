local UnitEntry = 93079

local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" test "))
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Affliction PvE ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 2 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 3 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 4 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 5 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 6 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 7 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 8 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 9 (Empty) ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t Talent Slot 10 (Empty) ",0, 1)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function Multivendor_Select(event, player, creature, sender, intid, code)
if(intid == 1) then   
   player:SendListInventory(creature, 80271)
   end


if(intid == 499) then
   On_Top_Hello(event, player, creature)
   end

if(intid == 500) then
   player:GossipComplete()	
   end	
end	   
RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)