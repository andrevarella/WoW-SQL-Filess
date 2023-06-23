SystemTos = {}
 
local MenuId = 999
local TosCooldown = 0
local TosCooldownId = 0
local TosTitle = ""
 
 
local function OnLogin(event, player)
    player:SetLuaCooldown(TosCooldown, TosCooldownId) -- 2 seconds
    SystemTos.ShowTos(event, player)
	--player:RegisterEvent(SystemTos.SendTos, 1000, player:GetLuaCooldown(TosCooldownId)) -- refresh para pegar quantidade de players, mas é chato imo
end
 
function SystemTos.ShowTos(event, player)
    
    local alliancePlayers, hordePlayers = GetPlayersInWorld(0), GetPlayersInWorld(1)
    local allianceCount = #alliancePlayers
    local hordeCount = #hordePlayers
    local totalCount = allianceCount + hordeCount
    local TosRules = "|TInterface\\icons\\Achievement_bg_masterofallbgs.60:60|t\n|cffffffffBem vindo ao |cffffff00[Eluna WoW]\n\n|cffffffffSite: |cffffff00Eluna-wow.com\n\n|cffffffffDiscord: |cffffff00discord.gg/8Gh7Y8BZRD\n\n|cffffffff------------------------------\n|cff00ccffInformations:\n|cffffffff------------------------------\n\n|cffffff00Level Cap: |cffff000080\n\n|cffffffff------------------------------\n|cff00ccffServer Status:\n|cffffffff------------------------------\n\n|cffffff00Online Players: |cffffffff[|cffff0000"..totalCount.."|cffffffff]\n\n|cffffff00 |TInterface\\PVPFrame\\Pvp-Currency-Alliance.png:18:18:-2:-2|tAlliance Online: |cffffffff[|cffff0000"..allianceCount.."|cffffffff]\n\n|cffffff00|TInterface\\PVPFrame\\Pvp-Currency-Horde.png:18:18:-2:-2|t Horde Online: |cffffffff[|cffff0000"..hordeCount.."|cffffffff]\n\n|cffffffffWould you like to talk in global chat?\n|cffffff00.chat(message)"
    local FooterCooldownText = ""
    if (player:GetLuaCooldown(TosCooldownId) > 1) then
        FooterCooldownText = TosTitle..TosRules.."\n\n|rEspere "..player:GetLuaCooldown(TosCooldownId).." segundos para aceitar."
    else
        FooterCooldownText = TosTitle..TosRules..""
    end
    
    player:GossipClearMenu()
    player:GossipMenuAddItem(1, "", 0, 1, false, FooterCooldownText)
    player:GossipSendMenu(0x7FFFFFFF, player, MenuId)
 
    if (player:HasAura(0, player) == false) then
        player:AddAura(0, player)
    end
end
 
function SystemTos.SendTos(event, delay, repeats, player)
    SystemTos.ShowTos(event, player)
end
 
function SystemTos.OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 1) then
        if (player:GetLuaCooldown(TosCooldownId) > 0) then
            SystemTos.ShowTos(event, player)
        else
            player:RemoveEvents()
			player:AddQuest(60012)
        end
    end
end
 
RegisterPlayerEvent(3, OnLogin)
RegisterPlayerGossipEvent(MenuId, 2, SystemTos.OnGossipSelect)