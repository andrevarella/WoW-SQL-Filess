local ChatPrefix = "'g";
local WorldChannelName = "Global";
local CooldownTimer = 2.5;

local Class = {
    [1] = "C79C6E", -- Warrior
    [2] = "F58CBA", -- Paladin
    [3] = "ABD473", -- Hunter
    [4] = "FFF569", -- Rogue
    [5] = "FFFFFF", -- Priest
    [6] = "C41F3B", -- Death Knight
    [7] = "0070DE", -- Shaman
    [8] = "69CCF0", -- Mage
    [9] = "9482C9", -- Warlock
    [11] = "FF7D0A" -- Druid
};

local Rank = {
    [0] = "E7A200", -- cor que aparece em 'global'
    [1] = "E7A200",
    [2] = "E7A200",
    [3] = "E7A200",
    [4] = "E7A200"
};

local GMIcons = {
    [2] = " |cFF00FAF6Moderador|r", -- Ícone de GM para nível 3
    [3] = " |cFF00FAF6GM|r", -- Ícone de GM para nível 3
	[4] = " |cFF00ADEFADM|r" -- Ícone de GM para nível 4 em azul claro
};

local IconSpacing = ""; -- Espaçamento entre o ícone e o nome do jogador

if (ChatPrefix:sub(-1) ~= " ") then
    ChatPrefix = ChatPrefix.." ";
end

local RCD = {};

function ChatSystem(event, player, msg, _, lang)
    if (RCD[player:GetGUIDLow()] == nil) then
        RCD[player:GetGUIDLow()] = 0;
    end
    if (msg:sub(1, ChatPrefix:len()) == ChatPrefix) then
        local r = RCD[player:GetGUIDLow()] - os.clock();
        if (0 < r) then
            local s = string.format("|cFFFF0000You must wait %i second(s) before sending another chat message!|r", math.floor(r));
            player:SendAreaTriggerMessage(s);
        else
            RCD[player:GetGUIDLow()] = os.clock() + CooldownTimer;
            local playerName = player:GetName();
            local classColor = Class[player:GetClass()];
            local rankColor = Rank[player:GetGMRank()] or Rank[0];
            local rankIcon = GMIcons[player:GetGMRank()] or ""; -- Adiciona o ícone de GM se existir para o nível de GM
            local factionPrefix = "";
            local factionPrefix = "";
			local factionPrefix = "";
			if player:GetTeam() == 0 then -- Alliance
			factionPrefix = " |cFF0070FF[Alliance]|r ";
			elseif player:GetTeam() == 1 then -- 
			factionPrefix = " |cFFFF0000[Horde]|r "
		end

	local playerName = player:GetName();
	local classColor = Class[player:GetClass()];

local nameAndClass = string.format("|cff%s%s|r%s", classColor, playerName, IconSpacing);

local formattedMessage = string.format("|cff%s[%s]|r%s%s: |cFFFFFFFF%s|r", rankColor, WorldChannelName, rankIcon, factionPrefix .. nameAndClass, msg:sub(ChatPrefix:len() + 1));
            SendWorldMessage(formattedMessage);
        end
        return false;
    end
end

RegisterPlayerEvent(18, ChatSystem);
RegisterPlayerEvent(4, function(_, player) RCD[player:GetGUIDLow()] = 0; end);
