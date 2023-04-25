local UnitEntry = 94133

local function On_Top_Hello(event, player, creature)
	player:GossipSetText(string.format("test"))
	
    if player:GetClass() == 5 then
    player:GossipMenuAddItem(6,"Glyphs",0, 1) -- Priest
	end
	if player:GetClass() == 8 then
	player:GossipMenuAddItem(6,"Glyphs",0, 2) -- Mage
	end
	if player:GetClass() == 9 then
    player:GossipMenuAddItem(6,"Glyphs",0, 3) -- Warlock
	end
	if player:GetClass() == 11 then
	player:GossipMenuAddItem(6,"Glyphs",0, 4) -- Druid
	end
	if player:GetClass() == 4 then
    player:GossipMenuAddItem(6,"Glyphs",0, 5) -- Rogue
	end
	if player:GetClass() == 3 then
	player:GossipMenuAddItem(6,"Glyphs",0, 6) -- Hunter
	end
	if player:GetClass() == 7 then
    player:GossipMenuAddItem(6,"Glyphs",0, 7) -- Shaman
	end
	if player:GetClass() == 1 then
	player:GossipMenuAddItem(6,"Glyphs",0, 8) -- Warrior
	end
	if player:GetClass() == 2 then
    player:GossipMenuAddItem(6,"Glyphs",0, 9) -- Paladin
	end
	if player:GetClass() == 6 then
	player:GossipMenuAddItem(6,"Glyphs",0, 10) -- Death Knight
	end
    player:GossipMenuAddItem(6,"Gems",0, 11)
    player:GossipMenuAddItem(6,"Enchants",0, 12)
    player:GossipMenuAddItem(6,"Prof Reagents",0, 13)
	--player:GossipMenuAddItem(6,"Change Faction, Race or Name",0, 14)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


function On_Top_Select(event, player, creature, sender, intid, code)

if(intid == 1) then -- Priest Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 100)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 101) -- Criar NPC Minor Glyphs
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 100) then
   player:SendListInventory(creature, 80009)
   end

if(intid == 101) then   
   player:SendListInventory(creature, 94145)
   end

if(intid == 2) then -- Mage Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 102)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 103)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 102) then
   player:SendListInventory(creature, 80003)
   end
if(intid == 103) then   
   player:SendListInventory(creature, 94143)
   end
   
if(intid == 3) then -- Warlock Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 104)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 105)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 104) then
   player:SendListInventory(creature, 80007)
   end
if(intid == 105) then   
   player:SendListInventory(creature, 94144)
   end

if(intid == 4) then -- Druid Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 106)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 107)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 106) then
   player:SendListInventory(creature, 80001)
   end
if(intid == 107) then   
   player:SendListInventory(creature, 94141)
   end	

if(intid == 5) then -- Rogue Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 108)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 109)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 108) then
   player:SendListInventory(creature, 80005)
   end
if(intid == 109) then   
   player:SendListInventory(creature, 94142)
   end
	
if(intid == 6) then -- Hunter Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 110)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 111)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 110) then
   player:SendListInventory(creature, 80002)
   end
if(intid == 111) then   
   player:SendListInventory(creature, 94139)
   end
	
if(intid == 7) then -- Shaman Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 112)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 113)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 112) then
   player:SendListInventory(creature, 80006)
   end
if(intid == 113) then   
   player:SendListInventory(creature, 94140)
   end

if(intid == 8) then -- Warrior Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 114)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 115)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 114) then
   player:SendListInventory(creature, 80008)
   end
if(intid == 115) then   
   player:SendListInventory(creature, 94137)
   end
   
if(intid == 9) then -- Pala Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 116)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 117)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 116) then
   player:SendListInventory(creature, 80004)
   end
if(intid == 117) then   
   player:SendListInventory(creature, 94138)
   end
	
if(intid == 10) then -- DK Glyphs
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Major Glyphs",0, 118)
	player:GossipMenuAddItem(6,"Minor Glyphs",0, 119)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
if(intid == 118) then
   player:SendListInventory(creature, 80000)
   end
if(intid == 119) then   
   player:SendListInventory(creature, 94136)
   end


if(intid == 11) then -- Gemas
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Yellow Gem",0, 200)
	player:GossipMenuAddItem(6,"Red Gem",0, 201)
	player:GossipMenuAddItem(6,"Orange Gem",0, 202)
	player:GossipMenuAddItem(6,"Blue Gem",0, 203)
	player:GossipMenuAddItem(6,"Purple Gem",0, 204)
    player:GossipMenuAddItem(6,"Green Gem",0, 205)
	player:GossipMenuAddItem(6,"Prismatic Gem",0, 206)
	player:GossipMenuAddItem(6,"Meta Gem",0, 207)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end
	
if(intid == 200) then -- Yellow Gem
   player:SendListInventory(creature, 80017)
   end
if(intid == 201) then -- Red Gem
   player:SendListInventory(creature, 80015)
   end
if(intid == 202) then -- Orange
   player:SendListInventory(creature, 80013)
   end
if(intid == 203) then -- Blue
   player:SendListInventory(creature, 80010)
   end
if(intid == 204) then -- Purple
   player:SendListInventory(creature, 80016)
   end
if(intid == 205) then -- Green
   player:SendListInventory(creature, 80011)
   end
if(intid == 206) then -- Prismatic (Criar NPC)
   player:SendListInventory(creature, 94134)
   end
if(intid == 207) then -- Meta
   player:SendListInventory(creature, 80012)
   end
	
	
if(intid == 12) then -- Enchants
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"1 Hand Weapon",0, 300)
	player:GossipMenuAddItem(6,"2 Hand Weapon",0, 301)
	player:GossipMenuAddItem(6,"Off Hand",0, 302)
	player:GossipMenuAddItem(6,"Ranged Weapon",0, 303)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 300) then -- 
   player:SendListInventory(creature, 80012)
   end

if(intid == 13) then -- Prof Reagents
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Ores",0, 400)
	player:GossipMenuAddItem(6,"Herb",0, 401)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 400) then -- 
   player:SendListInventory(creature, 80012)
   end

if(intid == 14) then -- Change Race/Faction/Name
player:GossipSetText(string.format(" "))
	player:GossipMenuAddItem(6,"Change Name",0, 500)
	player:GossipMenuAddItem(6,"Change Race",0, 501)
    player:GossipMenuAddItem(6,"Change Faction",0, 502)
    player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:20:20:0:0|t |cFF800000Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end


if(intid == 499) then -- Voltar
   On_Top_Hello(event, player, creature)
   end

if(intid == 500) then -- Sair
   player:GossipComplete()	
   end	
end	   

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)