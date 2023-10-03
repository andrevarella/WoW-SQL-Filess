local UnitEntry = 93108
 
local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(3,"Train me.",0, 1) 
    player:GossipMenuAddItem(2,"I wish to unlearn my talents.",0, 2, false, "Do you want to unlearn all your talents? This will unsummon any controlled pet.")
    if (player:GetClass() == 3) then
		player:GossipMenuAddItem(2,"Unlearn pet talents.",0, 3, false, "Do you want to unlearn all your pet talents?")
    end
	if player:GetClass() == 11 then
		if not player:HasSpell(40120) then -- checka se nao tem Swift Flight Form aprendido, entao mostra o gossip
			player:GossipMenuAddItem(3, "Treinar Swift Flight Form", 0, 4)
		end
	end
	
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


function On_Top_Select(event, player, creature, sender, intid, code)

-- Warrior
if(intid == 1 and player:GetClass() == 1) then
   if not player:HasSpell(1715) then -- Hamstring
       player:LearnSpell(1715)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end


--Paladin
if(intid == 1 and player:GetClass() == 2) then
   if not player:HasSpell(4987) then -- Cleanse
       player:LearnSpell(4987)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end


-- Hunter
if(intid == 1 and player:GetClass() == 3) then
   if not player:HasSpell(34600) then -- Snake Trap
       player:LearnSpell(34600)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Rogue
if(intid == 1 and player:GetClass() == 4) then
   if not player:HasSpell(1784) then -- Stealth
       player:LearnSpell(1784)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Priest
if(intid == 1 and player:GetClass() == 5) then
   if not player:HasSpell(6346) then -- Fear Ward
       player:LearnSpell(6346)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Death Knight
if(intid == 1 and player:GetClass() == 6) then
   if not player:HasSpell(48707) then -- Anti Magic Shell
       player:LearnSpell(48707)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Shaman
if(intid == 1 and player:GetClass() == 7) then 
   if not player:HasSpell(33736) then -- Water Shield rank 8
       player:LearnSpell(33736)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Mage   
if(intid == 1 and player:GetClass() == 8) then 
   if not player:HasSpell(1459) then -- Arcane Intelect (Rank 1)
       player:LearnSpell(1459)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Warlock
if(intid == 1 and player:GetClass() == 9) then
   if not player:HasSpell(5500) then -- Sense Demons
   	   player:LearnSpell(5500)
   else
   	   player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end
   
   
-- Druid
if(intid == 1 and player:GetClass() == 11) then
   player:LearnSpell(22812)           -- Barkskin
   if player:HasSpell(34091) then     -- 300 Riding (280%)
   	    player:LearnSpell(40120)      -- Swift Flight Form
   else
       player:SendBroadcastMessage("You already know all available spells.")
   end
   player:GossipComplete()
end


if(intid == 4 and player:GetClass() == 11) then
   if player:HasSpell(34091) then     -- 300 Riding (280%)
   	    player:LearnSpell(40120)      -- Swift Flight Form
   else
       player:SendBroadcastMessage("Você precisa do riding de 280% para aprender a Swift Flight Form.")
   end
   player:GossipComplete()
end


-- Reset Player Talents
if (intid == 2) then
    player:ResetTalents()
	player:SendBroadcastMessage("Seus Talentos foram resetados.")
    player:GossipComplete()
    end
end



function UnlearnPetTalent_Select(event, player, creature, sender, intid, code)

-- Reset Pet Talents 
if intid == 3 and player:GetClass() == 3 then
    player:ResetPetTalents()
    player:GossipComplete()
   end
end

RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)
RegisterCreatureGossipEvent(UnitEntry, 2, UnlearnPetTalent_Select)

