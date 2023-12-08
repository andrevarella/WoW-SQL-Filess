local UnitEntry = 55011

local Class = { 
    [1] = "|cff3B170B Warrior", -- Warrior
    [2] = "|cffF58CBA Paladin", -- Paladin
    [3] = "|cffABD473 Hunter", -- Hunter
    [4] = "|cffFFF569 Rogue", -- Rogue
    [5] = "|cffFFFFFF Priest", -- Priest
    [6] = "|cffC41F3B Dk", -- Death Knight
    [7] = "|cff0070DE Shaman", -- Shaman
    [8] = "|cff69CCF0 Mage", -- Mage
    [9] = "|cff9482C9 Warlock", -- Warlock
    [11] = "|cffFF7D0A Druid" -- Druid
};

local function OnGossipHello(event, player, creature)
local Getdp = WorldDBQuery("SELECT vp From blizzcms.users WHERE "..player:GetAccountId().." = id;");
quantidadedonate1 = Getdp:GetUInt32(0);
quantidadedonate = quantidadedonate1
local GetTime = CharDBQuery("SELECT totaltime FROM characters WHERE guid= "..player:GetGUIDLow().." ;");
		nSeconds = GetTime:GetUInt32(0);
nHours = string.format("%02.f", math.floor(nSeconds/3600));
nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));
player:GossipSetText(string.format(" --------------------------------------------\n                   Character Informations:\n --------------------------------------------\n Name:|cffffffff "..player:GetName().."|cFF000000         Class:"..Class[player:GetClass()].."|cFF000000\n\n           |cFF0B6138•      |cFF000000Vote Points:|cFF0B6138 "..quantidadedonate.."|cFF000000  \n\n                     Total Played Time \n --------------------------------------------\n   |cFF0B6138"..nHours.."|cFF000000 hour(s) |cFF0B6138"..nMins.."|cFF000000 minutes n |cFF0B6138"..nSecs.."|cFF000000 seconds\n --------------------------------------------"))
player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF0B6138Vote |cFF000000Points - |cffffffff[point Convertion]",0, 1)
player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Nevermind",0,500)
player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

local function OnGossipSelect(event, player, creature, sender, intid, code)
	local Getdp = WorldDBQuery("SELECT vp From blizzcms.users WHERE "..player:GetAccountId().." = id;");
    quantidadedonate1 = Getdp:GetUInt32(0);
    quantidadedonate = quantidadedonate1
        if(intid == 1) then
        player:GossipSetText(string.format(" --------------------------------------------\n                   Character Informations:\n --------------------------------------------\n Name:|cffffffff "..player:GetName().."|cFF000000         Class:"..Class[player:GetClass()].."|cFF000000\n\n           |cFF0B6138•      |cFF000000Vote Points:|cFF0B6138 "..quantidadedonate.."|cFF000000  \n\n|cFF000000Menu dedicated to |cFF0B6138convert |cFF000000your online |cFF0B6138Votes Points|cFF000000, from our |cFF0B6138Website|cFF000000 https://Elegant-WoW.com/, into in-game |cFF0B6138points|cFF000000.\n\n\n|cFF0B6138Note|cFF000000: new options can be implemented, as long as we need."))
		player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF04B486Take |cFF0B6138Vote |cFF000000Points - |cffffffff[1 point]",0, 2, false, "   \n\n|TInterface\\icons\\F_W_V:40:40:0:20|t\n|cffF78181Would you like to exchange|cffffffff: \n\n |cFF0B6138• 1 |cFF8A2BE2Vote Point\n\n   |cffF78181for\n\n |cFF0B6138• 1 |cFF8A2BE2Vote Points|cffffffff?\n\n|cffF78181Are you sure, you want to continue|cffffffff?")
		player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF04B486Take |cFF0B6138Vote |cFF000000Points - |cffffffff[5 points]",0, 3, false, "   \n\n|TInterface\\icons\\F_W_V:40:40:0:20|t\n|cffF78181Would you like to exchange|cffffffff: \n\n |cFF0B6138• 5 |cFF8A2BE2Vote Point\n\n   |cffF78181for\n\n |cFF0B6138• 5 |cFF8A2BE2Vote Points|cffffffff?\n\n|cffF78181Are you sure, you want to continue|cffffffff?")
		player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF04B486Take |cFF0B6138Vote |cFF000000Points - |cffffffff[10 points]",0, 4, false, "   \n\n|TInterface\\icons\\F_W_V:40:40:0:20|t\n|cffF78181Would you like to exchange|cffffffff: \n\n |cFF0B6138• 10 |cFF8A2BE2Vote Point\n\n   |cffF78181for\n\n |cFF0B6138• 10 |cFF8A2BE2Vote Points|cffffffff?\n\n|cffF78181Are you sure, you want to continue|cffffffff?")
		player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF04B486Take |cFF0B6138Vote |cFF000000Points - |cffffffff[50 points]",0, 5, false, "   \n\n|TInterface\\icons\\F_W_V:40:40:0:20|t\n|cffF78181Would you like to exchange|cffffffff: \n\n |cFF0B6138• 50 |cFF8A2BE2Vote Point\n\n   |cffF78181for\n\n |cFF0B6138• 50 |cFF8A2BE2Vote Points|cffffffff?\n\n|cffF78181Are you sure, you want to continue|cffffffff?")
		player:GossipMenuAddItem(6,"|TInterface\\icons\\F_W_V:27|t |cFF04B486Take |cFF0B6138Vote |cFF000000Points - |cffffffff[100 points]",0, 6, false, "   \n\n|TInterface\\icons\\F_W_V:40:40:0:20|t\n|cffF78181Would you like to exchange|cffffffff: \n\n |cFF0B6138• 100 |cFF8A2BE2Vote Point\n\n   |cffF78181for\n\n |cFF0B6138• 100 |cFF8A2BE2Vote Points|cffffffff?\n\n|cffF78181Are you sure, you want to continue|cffffffff?")
		player:GossipMenuAddItem(3,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t |cFF8B0000Back",0,499)
        player:GossipMenuAddItem(3,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:27:27:0:0|t |cFF8B0000Nevermind",0,500)		
        player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)  		
        end
		
if(intid == 2) then
  if(quantidadedonate>=1) then
     WorldDBQuery("UPDATE  blizzcms.users SET vp = (vp-1) WHERE "..player:GetAccountId().." = id;");  
     player:AddItem(90025, 1) 
     player:SendBroadcastMessage("|cffF78181Purchase successfully done: |cFF0B61381 |cFF8A2BE2Vote Point |cffF78181for |cFF0B61381 |cFF8A2BE2Vote Points|cffF78181.")        
     player:GossipComplete()
   else
     player:SendBroadcastMessage("|cffF78181You do not have the requirements to make this purchase, visit our donate page, and get more |cFF0B6138Votes Points|cffF78181.")
     player:GossipComplete()
   end
end

if(intid == 3) then
  if(quantidadedonate>=5) then
     WorldDBQuery("UPDATE  blizzcms.users SET vp = (vp-5) WHERE "..player:GetAccountId().." = id;");  
     player:AddItem(90025, 5) 
     player:SendBroadcastMessage("|cffF78181Purchase successfully done: |cFF0B61385 |cFF8A2BE2Vote Point |cffF78181for |cFF0B61385 |cFF8A2BE2Vote Points|cffF78181.")        
     player:GossipComplete()
   else
     player:SendBroadcastMessage("|cffF78181You do not have the requirements to make this purchase, visit our donate page, and get more |cFF0B6138Votes Points|cffF78181.")
     player:GossipComplete()
   end
end 

if(intid == 4) then
  if(quantidadedonate>=10) then
     WorldDBQuery("UPDATE  blizzcms.users SET vp = (vp-10) WHERE "..player:GetAccountId().." = id;");  
     player:AddItem(90025, 10) 
     player:SendBroadcastMessage("|cffF78181Purchase successfully done: |cFF0B613810 |cFF8A2BE2Vote Point |cffF78181for |cFF0B613810 |cFF8A2BE2Vote Points|cffF78181.")        
     player:GossipComplete()
   else
     player:SendBroadcastMessage("|cffF78181You do not have the requirements to make this purchase, visit our donate page, and get more |cFF0B6138Votes Points|cffF78181.")
     player:GossipComplete()
   end
end 

if(intid == 5) then
  if(quantidadedonate>=50) then
     WorldDBQuery("UPDATE  blizzcms.users SET vp = (vp-50) WHERE "..player:GetAccountId().." = id;");  
     player:AddItem(90025, 50) 
     player:SendBroadcastMessage("|cffF78181Purchase successfully done: |cFF0B613850 |cFF8A2BE2Vote Point |cffF78181for |cFF0B613850 |cFF8A2BE2Vote Points|cffF78181.")        
     player:GossipComplete()
   else
     player:SendBroadcastMessage("|cffF78181You do not have the requirements to make this purchase, visit our donate page, and get more |cFF0B6138Votes Points|cffF78181.")
     player:GossipComplete()
   end
end 

if(intid == 6) then
  if(quantidadedonate>=100) then
     WorldDBQuery("UPDATE  blizzcms.users SET vp = (vp-100) WHERE "..player:GetAccountId().." = id;");  
     player:AddItem(90025, 100) 
     player:SendBroadcastMessage("|cffF78181Purchase successfully done: |cFF0B6138100 |cFF8A2BE2Vote Point |cffF78181for |cFF0B6138100 |cFF8A2BE2Vote Points|cffF78181.")        
     player:GossipComplete()
   else
     player:SendBroadcastMessage("|cffF78181You do not have the requirements to make this purchase, visit our donate page, and get more |cFF0B6138Votes Points|cffF78181.")
     player:GossipComplete()
   end
end

if (intid == 499) then
   OnGossipHello(event, player, creature)
   end

if (intid == 500) then
   player:GossipComplete()	
   end		
end		

RegisterCreatureGossipEvent(UnitEntry, 1, OnGossipHello)
RegisterCreatureGossipEvent(UnitEntry, 2, OnGossipSelect)
