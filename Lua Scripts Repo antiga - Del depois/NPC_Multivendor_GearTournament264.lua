local UnitEntry = 93153

local function On_Top_Hello(event, player, creature)

player:GossipSetText(string.format("test"))
    player:GossipMenuAddItem(6,"Wrathful Main Set ",0, 7)
    player:GossipMenuAddItem(6,"264 Cloths ",0, 1)
    player:GossipMenuAddItem(6,"264 Leather ",0, 2)
    player:GossipMenuAddItem(6,"264 Mail ",0, 3)
    player:GossipMenuAddItem(6,"264 Plate ",0, 4)
    player:GossipMenuAddItem(6,"264 Acessorios ",0, 5)
    player:GossipMenuAddItem(6,"264 Armas ",0, 6)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)

-- Wrathful Set
if(intid == 7) then   
   player:SendListInventory(creature, 80056)
   end

-- 264 Cloth
if(intid == 1) then
	player:GossipMenuAddItem(6,"Boots ",0, 8)
	player:GossipMenuAddItem(6,"Belt ",0, 9)
	player:GossipMenuAddItem(6,"Bracer ",0, 10)
	player:GossipMenuAddItem(6,"Main Pieces\n ",0, 11)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 8) then   
   player:SendListInventory(creature, 93135)
   end
if(intid == 9) then   
   player:SendListInventory(creature, 93136)
   end
if(intid == 10) then   
   player:SendListInventory(creature, 93134)
   end
if(intid == 11) then   
   player:SendListInventory(creature, 93149)
   end

-- 264 Leather
if(intid == 2) then
	player:GossipMenuAddItem(6,"Boots ",0, 12)
	player:GossipMenuAddItem(6,"Belt ",0, 13)
	player:GossipMenuAddItem(6,"Bracer ",0, 14)
	player:GossipMenuAddItem(6,"Main Pieces\n ",0, 15)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 12) then   
   player:SendListInventory(creature, 93138)
   end
if(intid == 13) then   
   player:SendListInventory(creature, 93139)
   end
if(intid == 14) then   
   player:SendListInventory(creature, 93137)
   end
if(intid == 15) then   
   player:SendListInventory(creature, 93150)
   end

-- 264 Mail
if(intid == 3) then
	player:GossipMenuAddItem(6,"Boots ",0, 16)
	player:GossipMenuAddItem(6,"Belt ",0, 17)
	player:GossipMenuAddItem(6,"Bracer ",0, 18)
	player:GossipMenuAddItem(6,"Main Pieces\n ",0, 19)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 16) then   
   player:SendListInventory(creature, 93141)
   end
if(intid == 17) then   
   player:SendListInventory(creature, 93142)
   end
if(intid == 18) then   
   player:SendListInventory(creature, 93140)
   end
if(intid == 19) then   
   player:SendListInventory(creature, 93151)
   end

-- 264 Plate
if(intid == 4) then
	player:GossipMenuAddItem(6,"Boots ",0, 20)
	player:GossipMenuAddItem(6,"Belt ",0, 21)
	player:GossipMenuAddItem(6,"Bracer ",0, 22)
	player:GossipMenuAddItem(6,"Main Pieces\n ",0, 23)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 20) then   
   player:SendListInventory(creature, 93144)
   end
if(intid == 21) then   
   player:SendListInventory(creature, 93145)
   end
if(intid == 22) then   
   player:SendListInventory(creature, 93143)
   end
if(intid == 23) then   
   player:SendListInventory(creature, 93152)
   end

-- 264 Acessorios
if(intid == 5) then
	player:GossipMenuAddItem(6,"Trinket ",0, 24)
	player:GossipMenuAddItem(6,"Ring ",0, 25)
	player:GossipMenuAddItem(6,"Capa e Neck\n ",0, 26)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 24) then   
   player:SendListInventory(creature, 93146)
   end
if(intid == 25) then   
   player:SendListInventory(creature, 93147)
   end
if(intid == 26) then   
   player:SendListInventory(creature, 93148)
   end

-- 264 Weapons
if(intid == 6) then
	player:GossipMenuAddItem(6,"Two Hand Weapon ",0, 27)
	player:GossipMenuAddItem(6,"One Hand Weapon ",0, 28)
	player:GossipMenuAddItem(6,"Off Hand Weapon ",0, 29)
	player:GossipMenuAddItem(6,"Bow, Crossbow, Gun, Thrown ",0, 30)
	player:GossipMenuAddItem(6,"Shield ",0, 31)
	player:GossipMenuAddItem(6,"Wand ",0, 32)
	player:GossipMenuAddItem(6,"Relics\n ",0, 33)
      player:GossipMenuAddItem(4,"Voltar",0,499)
	player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,500)
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)	
    end

if(intid == 27) then   
   player:SendListInventory(creature, 93154)
   end
if(intid == 28) then   
   player:SendListInventory(creature, 93155)
   end
if(intid == 29) then   
   player:SendListInventory(creature, 93159)
   end
if(intid == 30) then   
   player:SendListInventory(creature, 93158)
   end
if(intid == 31) then   
   player:SendListInventory(creature, 93156)
   end
if(intid == 32) then   
   player:SendListInventory(creature, 93157)
   end
if(intid == 33) then   
   player:SendListInventory(creature, 80246)
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