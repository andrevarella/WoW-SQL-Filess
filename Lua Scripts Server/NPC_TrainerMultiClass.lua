local UnitEntry = 93108
 
local function On_Top_Hello(event, player, creature)
player:GossipSetText(string.format(" "))
    player:GossipMenuAddItem(3,"Train me.",0, 1) 
    player:GossipMenuAddItem(2,"I wish to unlearn my talents.",0, 2, false, "Do you want to unlearn all your talents? This will unsummon any controlled pet.")
    --player:GossipMenuAddItem(2,"Unlearn pet talents.",0, 3, false, "Do you want to unlearn all your pet talents?") -- DA FATAL ERROR DPS DE UNS SEGS
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


function On_Top_Select(event, player, creature, sender, intid, code)

-- Warrior
if(intid == 1 and player:GetClass() == 1) then
   --player:LearnSpell(54753) --
   player:LearnSpell(58096) -- Glyph of Bloodrage
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end


--Paladin
if(intid == 1 and player:GetClass() == 2) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end


-- Hunter
if(intid == 1 and player:GetClass() == 3) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Rogue
if(intid == 1 and player:GetClass() == 4) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Priest
if(intid == 1 and player:GetClass() == 5) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Death Knight
if(intid == 1 and player:GetClass() == 6) then
   player:LearnSpell(54753)
   player:LearnSpell(60200) -- glyph of raise dead
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Shaman
if(intid == 1 and player:GetClass() == 7) then 
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Mage   
if(intid == 1 and player:GetClass() == 8) then 
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Warlock
if(intid == 1 and player:GetClass() == 9) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end
   
   
-- Druid
if(intid == 1 and player:GetClass() == 11) then
   player:LearnSpell(54753)
   player:SendBroadcastMessage("You have learned all available spells.")
   player:GossipComplete()
   end


-- Reset Player Talents
if (intid == 2) then
    player:ResetTalents()
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

