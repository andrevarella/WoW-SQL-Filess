local UnitEntry = 94127



local function On_Top_Hello(event, player, creature)
   player:GossipSetText(string.format(" Olá aventureiro! \n\n\nlink do discord do servidor: dsaijhg1298734"))

    player:GossipMenuAddItem(3, "Regras", 0, 1)
    player:GossipMenuAddItem(3, "Rates do Servidor", 0, 2)
    player:GossipMenuAddItem(7, "Comandos", 0, 3)
    if player:IsGMVisible() then -- Disponivel apenas para GMs
        player:GossipMenuAddItem(0, "Comandos de GM [só aparece p/ GM]", 0, 4)
    end
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
-- Regras
if intid == 1 then
   player:GossipSetText(string.format("Regras teste \n \n teste \n teste \n teste \n teste"))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- Rates do Servidor
if intid == 2 then
   player:GossipSetText(string.format(" Rate de Gold = 1.5x \n Rate Reputation = 1.5x \n Rate de Prof = x1 \n Rate de Drop = x1 \n Rate de Honor = X4 \n\nRates de XP: \n Kill = 2x, Quest = 9x"))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- Comandos
if intid == 3 then
   player:GossipSetText(string.format("Comandos disponiveis: \n\n 'g \n ('g + texto, para falar no chat global)\n\n .settings announcer <arena/bg/autobroadcast> <on/off> \n(para desativar anuncio de Arena/BG/Autobroadcast no chat) \n\n .transmog <on/off> \n(relogue para ativar/desativar) \n\n .sp (para utilizar o spectate arena) \n /g .leave (para sair do spectate) \n\n .cfbg race (apenas disponivel quando estiver jogando na outra facção em crossfaction BGs) \n\n .show arena/bg/skirmish (para ver a quantidade de pessoas no queue) \n\n .gear stats (com um target, para ver o average ilvl de alguém) \n\n .rbg queue (a partir do level 51) \n\n .account password SenhaAntiga NovaSenha NovaSenha "))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

-- Comandos GM
if intid == 4 then
   player:GossipSetText(string.format("Comandos GM: \n \n .character changeaccount \n\n .reload conf \n\n .ad i ou .ad i -1 p remove o item do target \n\n .pinfo \n\n .freeze \n\n .morph \n\n .item restore \n\n .skirmish \n\n .premiaçao de arena = .achiev add (vai dar title mount e achiev)\n .gob scale / .npc_scale \n\n .anticheat libertar, anticheat jail \n.npc guid \n .acc set gmlevel $account level (1 ate 3) -1 \n .server restart 30 Reason \n(tempo + motivo para o restart)\n\n .send items Aric ''Text'' ''Text'' 51571:1  (nome player, mail, textmail, itemID:quantidade) \n\n .da pra dar .gm fly on/off em players tbm e .mod speed tbm  \n\n .des \n(para remover deserter) \n\n .account set password Account SenhaAntiga NovaSenha NovaSenha \n\n .instance unbind all\n .instance (listbinds) / unbind <mapID> difficulty"))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end


if (intid == 998) then
   On_Top_Hello(event, player, creature)
   end
   
if (intid == 999) then
   player:GossipComplete()	
   end	
end


RegisterCreatureGossipEvent(UnitEntry, 1, On_Top_Hello)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)