local UnitEntry = 94127



local function On_Top_Hello(event, player, creature)
   player:GossipSetText(string.format(" Olá aventureiro! \n\n\nlink do discord do servidor: dsaijhg1298734"))

    player:GossipMenuAddItem(3, "Regras", 0, 1)
    player:GossipMenuAddItem(3, "Rates do Servidor", 0, 2)
    player:GossipMenuAddItem(7, "Comandos", 0, 3)
    -- Disponivel apenas para GMs, para nao esquecer
    if player:IsGM() then
        player:GossipMenuAddItem(0, "Comandos de GM", 0, 4)
    end
    player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

function On_Top_Select(event, player, creature, sender, intid, code)
if intid == 1 then
   player:GossipSetText(string.format("Regras teste \n \n teste \n teste \n teste \n teste"))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if intid == 2 then
   player:GossipSetText(string.format(" Rate de Gold = x10 \n Rate de Prof = x1 \n Rate de Drop = x1 \n Rate de Honor = X2 (rate de honor aumenta o ganho de XP em bg tbm) \n\nRates de XP: \n Kill = 8x, Quest = 5x"))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if intid == 3 then
   player:GossipSetText(string.format("Comandos disponiveis:  (sem os <  >)\n\n .chat <on/off> (para desativar o Global Chat) \n .chat TEXTO (para falar no chat) \n\n .settings announcer <arena/bg/autobroadcast> <on/off> \n(para desativar anuncio de Arena/BG/Autobroadcast no chat) \n\n .transmog <on/off> \n(relogue para ativar/desativar) \n\n .sp para utilizar o spectate arena \n /g .leave para sair do spectate) \n\n .cfbg race (apenas disponivel quando estiver jogando na outra facção em crossfaction BGs) \n\n .show arena/bg/skirmish (para ver a quantidade de pessoas no queue) \n\n .gear stats (com um target, para ver o average ilvl de alguém) \n\n .rbg queue (apenas do lvl 70 até 79) \n\n .account password SenhaAntiga NovaSenha NovaSenha "))
   player:GossipMenuAddItem(4,"|TInterface/PaperDollInfoFrame/UI-GearManager-Undo:27:27:0:0|t Voltar",0,998)
   player:GossipMenuAddItem(4,"|TInterface\\RaidFrame\\ReadyCheck-NotReady:22:22:0:0|t |cFF8B0000Sair",0,999)
   player:GossipSendMenu(0x7FFFFFFF, creature, menu_id)
end

if intid == 4 then
   player:GossipSetText(string.format("Comandos GM: \n \n .reload conf \n .ad i ou .ad i -1 p remove o item do target \n .pinfo (talvez pode crashar com mod anti hack) \n .freeze \n .morph \n .item restore \n .chat reload (module censure) \nobs: nao adicionar ou deletar palavras ingame, dá crash, apenas reload e adicionar atraves da database\n .skirmish \n .premiaçao de arena = .achiev add (vai dar title mount e achiev)\n .gob scale / .npc_scale \n .anticheat libertar, anticheat jail \n.npc guid \n .acc set gmlevel $account level (1 ate 3) -1 \n .server restart 30 Reason \n(tempo + motivo para o restart)\n .send items Aric ''Text'' ''Text'' 51571:1  (nome player, mail, textmail, itemID:quantidade) \n .da pra dar .gm fly on/off em players tbm e .mod speed tbm  \n ..account set password SenhaAntiga NovaSenha NovaSenha"))
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