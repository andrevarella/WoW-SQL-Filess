local UnitEntry = 94130

local function On_Top_Hello(event, player, creature)
    player:GossipSetText(" ")
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cff00ff00Affliction|r |cFF9932CCPvE|r |cFF4B0082Cor1|r |cFFDCDCDCCor2|r |cFFFF00FFCor3|r |cFF00CED1Cor4|r ",0, 1)
    player:GossipMenuAddItem(9,"#1: |cFF228B22the name doesnt matterrr|r  [|cffffff001322|r] \n        Win  Loss \n          |cFF228B226|r  -   |cFFFF63470|r  (|cFFDCDCDC100%|r WR)",0, 1)
    player:GossipMenuAddItem(9,"#1: |cFF228B22the name doesnt matterrr|r  [|cffffff001322|r] \n        Win  Loss \n          |cFF228B226|r  -   |cFFFF63470|r  (|cFFDCDCDC100%|r winrate)",0, 1)
    player:GossipMenuAddItem(9,"#1: |cFF228B22the name doesnt matterrr|r  [|cffffff001322|r] \n        Win  Loss \n          |cFF228B226|r  -   |cFFFF63470|r  (|cFFDCDCDC100%|r Winrate)",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF006400Talent|r |cFFD2B48CSlot|r 2 |cFF00FA9ACor1|r |cffff6060Cor2|r |cffff6060Cor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF20B2AATalent|r |cFFD8BFD8Slot|r 3 |cFF98FB98Cor1|r |cFF00FFFFCor2|r |cffff0000Cor31-2|r ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF8FBC8BTalent|r |cFFFF6347Slot|r 4 |cFF2E8B57Cor1|r |cFF8B0000Cor2|r |cFFE9967ACor3|r ",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF228B22Talent Slot|r 5 |cFF00FF7FCor1|r |cFFCD5C5CCor2|r |cFFFF6060Cor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF32CD32Talent Slot|r 6 |cFF9ACD32Cor1|r |cFFFF4500Cor21-2|r |cFFDB7093Cor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF3CB371Talent Slot|r 7 |cFFC71585Cor1|r |cFFFF0000Cor2|r |cFF9370DBCor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFFDCDCDCTalent Slot|r 8 |cFFBA55D3Cor1|r |cFF0000CDCor2|r |cFF191970Cor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF7CFC00Talent Slot|r 9 |cFF800080Cor1|r |cFF9370DBCor2|r |cFF66CDAACor3|r",0, 1)
    player:GossipMenuAddItem(6,"|TInterface\\icons\\Achievement_bg_returnxflags_def_wsg:25|t |cFF90EE90Talent Slot|r 1 |cFF800000Cor1|r |cFFFAF0E6Cor2|r |cffffff00Cor|r ",0, 1)
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