-- show/add/reset items on the Vendor with these values (will show items with mintemporder >= '' and maxtemporder <= '' (5 items, if >= 1, <= 5) - amounts of items = min~max + 1 (box)
local mintemporder = 1
local maxtemporder = 7 -- +1 with Unclaimed Black Market Container
-- type '.reload bmah' after changing the min/max order (will reward bidders and then reset timers/items on the vendor)

-- commands:
-- .reload bmah (will reset the items orders/timers, and adds new items on the vendor)
-- .bmahtest    (sets current items timer to 82800, which means 23 hours on the items)

-- guids of Character that will send the mail items to the bid winners (if you set to 0 it will show the name "Unknown"
local BlackMarketPlayerGuid = 515
local ServerPlayerGuid = 503 -- player chamado Server

local PeriodicUpdateEvent = 3600000 -- [1h] - Every 1h add +1h timer on the items, after 24h a reset is done, rewarding winners and adding new items.
--local PeriodicUpdateEvent = 10000 -- every 10s, to test

local UnitEntry = 94178 -- id of the NPC
local currentDateTime = os.date("%Y-%m-%d %H:%M:%S")
local lastCacheTime = os.time()
local function formatTimeLeft(seconds)	
    local minutes = math.floor((seconds % 3600) / 60)
    local remainingSeconds = seconds % 60
    return string.format("h:%dm:%ds", minutes, remainingSeconds)
end

local function BlackMarketMenuOpen(event, player, object)	
    player:GossipSetText(string.format(" "))
    local unboughtItems = {}
    local boughtItems = {}
	local AddGossipsOrdered = CharDBQuery(string.format("SELECT itemID, icon, itemname, bidplayername, bidplayerguid, currentbidprice, bought, itemtimer FROM custom_black_market WHERE (temporaryOrder >= %d AND temporaryOrder <= %d) OR itemID = 32547 ORDER BY currentbidprice DESC", mintemporder, maxtemporder))
    if AddGossipsOrdered and AddGossipsOrdered:GetRowCount() > 0 then  -- 1       2          3              4               5            6        
        repeat
            local itemID = AddGossipsOrdered:GetUInt32(0)
            local icon = AddGossipsOrdered:GetString(1)
            local itemname = AddGossipsOrdered:GetString(2)
            local bidplayername = AddGossipsOrdered:GetString(3)
            local bidplayerguid = AddGossipsOrdered:GetString(4)
            local currentbidprice = AddGossipsOrdered:GetUInt32(5)
            local bought = AddGossipsOrdered:GetUInt32(6)
			local itemtimer = AddGossipsOrdered:GetUInt32(7)
			local formattedCurrentBidPrice = string.format("%.3f", currentbidprice / 1000):gsub(",", ".") .. "g"
            local itemInfo = 
			{
                itemID = itemID,
                itemname = itemname,
                icon = icon,
                itemname = itemname,
                bidplayername = bidplayername,
                bidplayerguid = bidplayerguid,
                formattedCurrentBidPrice = formattedCurrentBidPrice,
                currentbidprice = currentbidprice,
                bought = bought,
				itemtimer = itemtimer
            }
            if bought == 1 then
                table.insert(boughtItems, itemInfo)
            else
                table.insert(unboughtItems, itemInfo)
            end
        until not AddGossipsOrdered:NextRow()
    end
    table.sort(unboughtItems, function(a, b) -- se quiser inverter p aparecer os comprados primeiro, inverte esse sort e 'for _, itemInfo in ipairs(unboughtItems) do'
        return a.currentbidprice > b.currentbidprice
    end)
    table.sort(boughtItems, function(a, b)
        return a.currentbidprice > b.currentbidprice
    end)
	for _, itemInfo in ipairs(unboughtItems) do
		local itemID = itemInfo.itemID
		local itemname = itemInfo.itemname
		local icon = itemInfo.icon
		local Q = CharDBQuery(string.format("SELECT currentbidprice, itemtimer FROM custom_black_market WHERE itemID = %d", itemID))
		local currentbidprice = Q and Q:GetUInt32(0) or 0
		local itemtimer = Q and Q:GetUInt32(1) or 0
		formattedCurrentBidPrice = string.format("%.3f", currentbidprice / 1000):gsub(",", ".") .. "g"
		local hoursLeft = math.floor((23 * 3600 - itemtimer) / 3600) -- Calcula as horas restantes
		local formattedMinutesLeft = formatTimeLeft(PeriodicUpdateEvent - (os.time() - lastCacheTime))
		player:GossipMenuAddItem(6, string.format(" |TInterface\\icons\\%s:20:20:0:0|t %s|r\n Current Bid: |cffffff00%s|r |TInterface/Icons/Inv_misc_coin_02:15|t\n Time Left: %d%s \n_______________________________________", icon, itemname, formattedCurrentBidPrice, hoursLeft, formattedMinutesLeft), 0, itemID + 500000)
		--player:GossipMenuAddItem(6, string.format(" |TInterface\\icons\\%s:20:20:0:0|t |cFF0000FF%s|r\n Current Bid: |cffffff00%s|r |TInterface/Icons/Inv_misc_coin_02:15|t\n Time Left: %2d:%02d Hours \n_______________________________________", icon, itemname, formattedCurrentBidPrice, hoursLeft, minutesLeft), 0, itemID + 500000)
	end
    for _, itemInfo in ipairs(boughtItems) do
        local itemID = itemInfo.itemID
        local itemname = itemInfo.itemname
        local icon = itemInfo.icon
	    local Q = CharDBQuery(string.format("SELECT currentbidprice, itemtimer FROM custom_black_market WHERE itemID = %d", itemID))
		local currentbidprice = Q and Q:GetUInt32(0) or 0
		local itemtimer = Q and Q:GetUInt32(1) or 0
		formattedCurrentBidPrice = string.format("%.3f", currentbidprice / 1000):gsub(",", ".") .. "g"
		local hoursLeft = math.floor((23 * 3600 - itemtimer) / 3600) -- Calcula as horas restantes
		local minutesLeft = math.floor(((24 * 3600 - itemtimer) % 3600) / 60) -- Calcula os minutos restantes
		local secondsLeft = (24 * 3600 - itemtimer) % 60
		local formattedMinutesLeft = formatTimeLeft(PeriodicUpdateEvent - (os.time() - lastCacheTime))
		player:GossipMenuAddItem(9, string.format(" |TInterface\\icons\\%s:20:20:0:0|t %s|r \n Last Bid: |cffffff00%s|r  |TInterface/Icons/Inv_misc_coin_02:15|t   |cffff0000OUT OF STOCK!|r\n Time Left: %d%s |r\n_______________________________________", icon, itemname, formattedCurrentBidPrice, hoursLeft, formattedMinutesLeft), 0, 3)
    end
    player:GossipSendMenu(0x7FFFFFFF, object, menu_id)
end


function On_Top_Select(event, player, object, sender, intid, code)
    local itemname = ""
	-- Items Submenu
    if intid > 500000 then 	
        local itemID = intid - 500000
        local Q = CharDBQuery(string.format("SELECT buyoutprice, itemname, icon, bidplayername, bidplayerguid, currentbidprice FROM custom_black_market WHERE itemID = %d AND bought = 0", itemID))
        --if Q and Q:GetRowCount() > 0 then
		if Q then
			local buyoutprice = Q:GetUInt32(0) / 10000000
            local formattedbuyoutprice = buyoutprice >= 10 and string.format("%dk", buyoutprice) or string.format("%dg", buyoutprice * 1000)
            itemname = Q:GetString(1)
            local icon = Q:GetString(2)
			local bidplayername = Q:GetString(3)
			local bidplayerguid = Q:GetString(4)
			local currentbidprice = Q:GetString(5)
			local formattedCurrentBidPrice = string.format("%s.%s", currentbidprice:sub(1, -4), currentbidprice:sub(-3))
			local bidText = string.format("Last Bidder: [%s|r]", bidplayername)
			local minBidIncrease = currentbidprice * 0.05 -- 5% do valor atual
			local requiredBid = currentbidprice + minBidIncrease
			local requiredBidFormatted = string.format("%d", requiredBid):reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
			
			player:GossipSetText(string.format("\n\n   |cFF0000FFOfertar Item|r: \n\n   |TInterface\\icons\\%s:25|t |cFF0000FF%s|r\n   _____________________________________", icon, itemname))
            player:GossipMenuAddItem(6, string.format(" \nCurrent Bid:             [|cffffff00%s|r |TInterface/Icons/Inv_misc_coin_02:15|t]  \n\nMinimum Needed: [|cffffff00%s|r |TInterface/Icons/Inv_misc_coin_02:15|t]  \n\n%s\n_____________________________________", formattedCurrentBidPrice, requiredBidFormatted, bidText), 0, itemID + 200000, true, "Digite o valor que você deseja ofertar")
			player:GossipMenuAddItem(5, " ", 0, 2)
			player:GossipMenuAddItem(5, " |TInterface/PaperDollInfoFrame/UI-GearManager-Undo:17:17:0:0|t |cFF800000Voltar", 0, 2)
            player:GossipSendMenu(0x7FFFFFFF, object, menu_id)
        else
            player:SendBroadcastMessage("O item não foi encontrado ou já foi comprado.")
            player:GossipComplete()
        end
	end
	
	-- Handles bid and buying the item (items de id 1 até 150.000)
	if intid >= 200000 and intid <= 350000 then
		local itemID = intid - 200000
		local Bid = tonumber(code) -- Converta o código de string para número

		if Bid and Bid > 0 and Bid < 214000 then
			local playerid = player:GetGUIDLow()
			local BidQuery = CharDBQuery(string.format("SELECT itemname, currentbidprice, bidplayerguid, temporaryOrder FROM custom_black_market WHERE itemID = %d AND bought = 0", itemID))
			if BidQuery then                           --         0           1                2               3          
				local itemname = BidQuery:GetString(0)
				local currentbidprice = BidQuery:GetUInt32(1)
				local playerguid = BidQuery:GetUInt32(2)
				local temporaryOrder = BidQuery:GetUInt32(3)
				local minBidIncrease = currentbidprice * 0.05 -1 -- 5% do valor atual
				if playerguid == playerid then
					player:SendBroadcastMessage("Você não pode dar lance em cima do seu proprio lance.")
					player:GossipComplete()
					return 
				elseif temporaryOrder > maxtemporder then
					player:SendBroadcastMessage("Acabou o tempo do item selecionado.")
					player:GossipComplete()
					return 
				elseif Bid <= currentbidprice + minBidIncrease then
					local requiredBid = currentbidprice + minBidIncrease					
					local requiredBidFormatted = string.format("%.0f", requiredBid + 1):reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
					player:SendBroadcastMessage(string.format("O novo lance deve ser pelo menos 5%% maior que o último lance. \nO valor mínimo é %s gold.", requiredBidFormatted))
					player:GossipComplete()
					return
				end

				if player:GetCoinage() >= Bid * 10000 then
					player:SetCoinage(player:GetCoinage() - Bid * 10000)
					-- return gold to previous bidder
					SendMail("Outbided", string.format("You have been outbid on %s. \nHere's your gold.", itemname), playerguid, BlackMarketPlayerGuid, 0, 0, currentbidprice * 10000, 0, 9311, 1)
					local playerToSendMessage = GetPlayerByGUID(playerguid)
					if playerToSendMessage then
						playerToSendMessage:SendBroadcastMessage(string.format("Alguém fez uma oferta maior que a sua no item %s. \nVa para o correio para pegar seu gold de volta.", itemname))
						playerToSendMessage:PlayDirectSound(3081, player)
					end
				
					local playerClass = player:GetClass()
					local classColors = 
					{
						[1] = "|cff8B4513", -- Warr
						[2] = "|cffF48CBA", -- Pala
						[3] = "|cff3D8E3D", -- Hunter
						[4] = "|cffFFF468", -- Rogue
						[5] = "|cffFFFFFF", -- Priest
						[6] = "|cffC41F3B", -- DK
						[7] = "|cff0070DE", -- Shaman
						[8] = "|cff69CCF0", -- Mage
						[9] = "|cff9482C9", -- Warlock
						[11] = "|cffFF7C0A", -- Druid
					}
					local playerColor = classColors[playerClass] or "" -- Pega a cor da classe ou vazio se não encontrada
					local playerName = player:GetName()
					local playerNameWithColor = string.format("%s%s", playerColor, playerName)
					-- update table entries based on last bid
					CharDBExecute(string.format("UPDATE custom_black_market SET bidplayername = '%s', bidplayerguid = %d, currentbidprice = %d WHERE itemID = %d", playerNameWithColor, playerid, Bid, itemID))
					player:SendBroadcastMessage(string.format("Você deu uma oferta em '%s' por %d de gold.", itemname, Bid))
					player:PlayDirectSound(120, player)
					player:GossipComplete()
					-- log
					CharDBExecute(string.format("INSERT INTO custom_black_market_logs (data, itemid, bid, playername, playerguid, received) VALUES ('%s', %d, %d, '%s - Normal_bid', %d, '0')", currentDateTime, itemID, Bid, playerName, playerid))
				else
					player:SendBroadcastMessage("Você não tem gold suficiente para ofertar esse item.")
					player:GossipComplete()
				end
			else
				player:SendBroadcastMessage(string.format("Item: %s já foi comprado.", intid))
				player:GossipComplete()
			end
		-- instant win the auction if bid >= 214k and minimum bid <= 214k
		--elseif Bid and Bid >= 214748 then
		elseif Bid and Bid >= 214000 then
			local playerid = player:GetGUIDLow()
			
			local BidQuery = CharDBQuery(string.format("SELECT itemname, currentbidprice, bidplayerguid, temporaryOrder FROM custom_black_market WHERE itemID = %d AND bought = 0", itemID))
			if BidQuery then				     --               0              1             2              3       
				local itemname = BidQuery:GetString(0)
				local currentbidprice = BidQuery:GetUInt32(1)
				local playerguid = BidQuery:GetUInt32(2)
				local temporaryOrder = BidQuery:GetUInt32(3)
				local minBidIncrease = currentbidprice * 0.05 -1 -- valor minimo bid = >5% do bid atual
				if playerguid == playerid then
					player:SendBroadcastMessage("Você não pode dar lance em cima do seu proprio lance.")
					player:GossipComplete()
					return 
				elseif temporaryOrder > maxtemporder then
					player:SendBroadcastMessage("Acabou o tempo do item selecionado.")
					player:GossipComplete()
					return 
				elseif Bid <= currentbidprice + minBidIncrease then
					local requiredBid = currentbidprice + minBidIncrease					
					local requiredBidFormatted = string.format("%.0f", requiredBid + 1):reverse():gsub("(%d%d%d)", "%1."):reverse():gsub("^%.", "")
					player:SendBroadcastMessage(string.format("O novo lance deve ser pelo menos 5%% maior que o último lance. \nO valor mínimo é %s gold.", requiredBidFormatted))
					player:GossipComplete()
					return
				end
				
				--if player:GetCoinage() >= Bid * 10000 then
				if player:GetCoinage() >= 214000 * 10000 then
					player:SetCoinage(player:GetCoinage() - 214000 * 10000)
					--[[player:SendBroadcastMessage(string.format("Você está prestes a comprar '%s' por 214.000 gold.", itemname))
					player:GossipMenuAddItem(2, "Sim, confirmar a compra", 0, itemID + 300000) -- teria que criar um novo if intid
					player:GossipMenuAddItem(2, "Não, cancelar", 0, 2)
					player:GossipSendMenu(0x7FFFFFFF, object, menu_id)--]]
					
					-- return gold to previous bidder
					SendMail("Outbided", string.format("You have been outbid on %s. \nHere's your gold.", itemname), playerguid, BlackMarketPlayerGuid, 0, 0, currentbidprice * 10000, 0, 9311, 1)
					local playerToSendMessage = GetPlayerByGUID(playerguid)
					if playerToSendMessage then
						playerToSendMessage:SendBroadcastMessage(string.format("Alguém fez uma oferta maior que a sua no item %s. \nVa para o correio para pegar seu gold de volta.", itemname))
						playerToSendMessage:PlayDirectSound(3081, player)
					end
					
					-- mail item to buyer
					local playerName = player:GetName()
					SendMail(itemname, string.format("%s comprado atraves do Black Market por 214.000 gold.", itemname), playerid, BlackMarketPlayerGuid, 0, 0, 0, 0, itemID, 1)
					--SendMail(itemname, string.format("%s comprado atraves do Black Market por %s gold.", itemname, Bid), playerid, BlackMarketPlayerGuid, 0, 0, 0, 0, itemID, 1)
					player:SendBroadcastMessage(string.format("item: %s comprado com sucesso por 214.000 gold.", itemname))
					CharDBExecute(string.format("UPDATE custom_black_market SET bought = 1, bidplayername = '%s', bidplayerguid = '%d', currentbidprice = 214000 WHERE itemID = %d", playerName, playerid, itemID))
					--CharDBExecute(string.format("UPDATE custom_black_market SET bought = 1, bidplayername = '%s', bidplayerguid = '%d', currentbidprice = %d WHERE itemID = %d", playerName, playerid, Bid, itemID))
					player:PlayDirectSound(120, player)
					player:GossipComplete()
					-- log
					CharDBExecute(string.format("INSERT INTO custom_black_market_logs (data, itemid, bid, playername, playerguid, received) VALUES ('%s', %d, %d, '%s - Bought_bid', %d, '1')", currentDateTime, itemID, Bid, playerName, playerid))
				else
					player:SendBroadcastMessage("Você precisa ter pelo menos 214.000g.")
					player:GossipComplete()
				end
			else
				player:SendBroadcastMessage(string.format("Item: %s já foi comprado.", intid))
				player:GossipComplete()
			end
		else
			player:SendBroadcastMessage("Por favor, insira um numero válido.")
			player:GossipComplete()
		end
	end
	-- Sair/fechar gossip
    if(intid == 1) then
        player:GossipComplete()
	-- Voltar pro Menu principal
	elseif(intid == 2) then
        BlackMarketMenuOpen(event, player, object)
	-- Item já foi comprado
	elseif(intid == 3) then
        BlackMarketMenuOpen(event, player, object)  
		player:SendAreaTriggerMessage("\n\n\n\n\n\n\nItem já foi comprado.")
    end
end


local function PeriodicUpdateRandomItemsOnVendor(eventid, delay, repeats)
	--SendWorldMessage("|cFFFF4500[Black Market Vendor]:|r [TEST update]")

	-- adds 1h Timer on Items Orders and on Unclaimed Black Market Container
	CharDBExecute("UPDATE custom_black_market SET itemtimer = itemtimer + 3600 WHERE (temporaryOrder >= " .. mintemporder .. " AND temporaryOrder <= " .. maxtemporder .. " or itemID = 32547)")

	-- Send item to Bid Buyers and reset tables after itemTimer runs out. (needs a delay because of the the update above, otherwise its skipped)
	local delayedUpdate1 = function()
		local RewardBidders = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid, itemtimer, bought FROM custom_black_market WHERE bought = 0 ORDER BY bidplayerguid ASC")
	    if not RewardBidders then
			return
		end
		
		while RewardBidders:NextRow() do
			local itemid2 = RewardBidders:GetUInt32(0)
			local itemname2 = RewardBidders:GetString(1)
			local currentbidprice2 = RewardBidders:GetUInt32(2)
			local playerguid2 = RewardBidders:GetUInt32(3)
			local tempo = RewardBidders:GetUInt32(4)
			local bought = RewardBidders:GetUInt32(5)

			-- Reward Bid Winner
			if playerguid2 >= 1 and tempo >= 86400 and bought == 0 then
			
				-- Send Mail of item to Bid Winners
				SendMail(itemname2, string.format("%s comprado através do Black Market Auction House por %s gold.", itemname2, currentbidprice2), playerguid2, BlackMarketPlayerGuid, 0, 0, 0, 0, itemid2, 1)
				
				-- Sends Message to player to tell that he won the Bid
				local playerToSendMessage = GetPlayerByGUID(playerguid2)
				if playerToSendMessage then
					playerToSendMessage:PlayDirectSound(3081, player)
					playerToSendMessage:SendBroadcastMessage(string.format("Você ganhou o leilão do item %s por %s gold. Vá para o correio para pegar seu item.", itemname2, currentbidprice2))
				end
				
				-- reset columns after rewarding players
				CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bidplayerguid >= 1 AND itemtimer >= 86400 AND bought = 0")
			end
		end
		if RewardBidders.Close then
			RewardBidders:Close()  -- Feche a consulta após processar todas as linhas
		end
		
		-- Reset Bought Bids and Items without Bids
		CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bought = 1 AND itemtimer >= 86400")
		CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bidplayerguid = 0 AND itemtimer >= 86400")
		
	    -- Adds new "temporaryOrder", when there's none with min/max numbers (items on the vendor are based on the orders)
		local delayedUpdate5 = function()
			local updateitemsonpnc = CharDBQuery("SELECT itemID, temporaryOrder FROM custom_black_market WHERE itemID <> 32547") -- exceção para Unclaimed Black Market Container (sempre fica tempOrder = 0)
			if updateitemsonpnc then
				local tbl = {}
				repeat
					local item = 
					{
						itemID = updateitemsonpnc:GetUInt32(0),
						temporaryOrder = updateitemsonpnc:GetUInt32(1)
					}
					table.insert(tbl, item)
				until not updateitemsonpnc:NextRow()
			
				-- Verifica se há algum itemID com 'temporaryOrder' entre 'mintemporder' e 'maxtemporder', se nao tiver, entao cria novos
			local hasTemporaryOrder = false
				for _, item in ipairs(tbl) do
					if item.temporaryOrder >= mintemporder and item.temporaryOrder <= maxtemporder then
						hasTemporaryOrder = true
						break
					end
				end
			
				-- Adiciona aleatoriamente números na coluna temporaryOrder
				if not hasTemporaryOrder then
					local quantity = #tbl
					local uniqueNumbers = {}
					for i = 1, quantity do
						uniqueNumbers[i] = i
					end
					for i = quantity, 2, -1 do
						local j = math.random(i)
						uniqueNumbers[i], uniqueNumbers[j] = uniqueNumbers[j], uniqueNumbers[i]
					end
					for i, item in ipairs(tbl) do
						item.temporaryOrder = uniqueNumbers[i]
						CharDBExecute(string.format("UPDATE custom_black_market SET temporaryOrder = %d WHERE itemID = %d", item.temporaryOrder, item.itemID))
					end
				end
			end
		end
		local someDelay5 = 1500
		CreateLuaEvent(delayedUpdate5, someDelay5, 1)
		
	end
	local someDelay1 = 1000
	CreateLuaEvent(delayedUpdate1, someDelay1, 1)
end


-- chamado ao iniciar o server
local function OnStartUpUpdateItems()

	-- Send item to Bid Buyers if itemtimer >= 86400 (24h has passed), before vendor reset - in case the server has DC'd when rewarding the bids on update
	local delayedRewardOnStartUp = function()
		local RewardBidders = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid, itemtimer, bought FROM custom_black_market WHERE bought = 0 ORDER BY bidplayerguid ASC")
		if not RewardBidders then
			return
		end
		while RewardBidders:NextRow() do
			local itemid2 = RewardBidders:GetUInt32(0)
			local itemname2 = RewardBidders:GetString(1)
			local currentbidprice2 = RewardBidders:GetUInt32(2)
			local playerguid2 = RewardBidders:GetUInt32(3)
			local tempo = RewardBidders:GetUInt32(4)
			local bought = RewardBidders:GetUInt32(5)

			-- Reward Bid Winners
			if playerguid2 >= 1 and tempo >= 86400 and bought == 0 then
				SendMail(itemname2, string.format("%s comprado através do Black Market Auction House por %s gold.", itemname2, currentbidprice2), playerguid2, BlackMarketPlayerGuid, 0, 0, 0, 0, itemid2, 1)
				print(string.format("Black Market - enviado item %s On StartUp para o guid %s.", itemname2, playerguid2))
				-- reset columns after rewarding players
				CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bidplayerguid >= 1 AND itemtimer >= 86400 AND bought = 0")
			end
		end
		if RewardBidders.Close then
			RewardBidders:Close()
		end
		
		-- Reset Bought Bids and Items without Bids
		CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bought = 1 AND itemtimer >= 86400")
		CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bidplayerguid = 0 AND itemtimer >= 86400")
		
		-- Adds new "temporaryOrder", when there's none with min/max numbers (items on the vendor are based on the orders)
		local delayedUpdateTemporaryOrderStartUp = function()
			local updateitemsonpnc = CharDBQuery("SELECT itemID, temporaryOrder FROM custom_black_market WHERE itemID <> 32547")
			if updateitemsonpnc then
				local tbl = {}
				repeat
					local item = 
					{
						itemID = updateitemsonpnc:GetUInt32(0),
						temporaryOrder = updateitemsonpnc:GetUInt32(1)
					}
					table.insert(tbl, item)
				until not updateitemsonpnc:NextRow()
				local hasTemporaryOrder = false
				for _, item in ipairs(tbl) do
					if item.temporaryOrder >= mintemporder and item.temporaryOrder <= maxtemporder then
						hasTemporaryOrder = true
						break
					end
				end
				if not hasTemporaryOrder then
					local quantity = #tbl
					local uniqueNumbers = {}
					for i = 1, quantity do
						uniqueNumbers[i] = i
					end
					for i = quantity, 2, -1 do
						local j = math.random(i)
						uniqueNumbers[i], uniqueNumbers[j] = uniqueNumbers[j], uniqueNumbers[i]
					end
					for i, item in ipairs(tbl) do
						item.temporaryOrder = uniqueNumbers[i]
						CharDBExecute(string.format("UPDATE custom_black_market SET temporaryOrder = %d WHERE itemID = %d", item.temporaryOrder, item.itemID))
					end
				end
			end
		end
		local someDelayUpdateTemporaryOrderStartUp = 3500
		CreateLuaEvent(delayedUpdateTemporaryOrderStartUp, someDelayUpdateTemporaryOrderStartUp, 1)
		
	end
	local DelayRewardOnStartUp = 2500 -- 25 ms
	CreateLuaEvent(delayedRewardOnStartUp, DelayRewardOnStartUp, 1)
end


local function OnReloadCommand(event, player, command)

    if (command == "reload bmah") then
	    local accountLevel = player:GetGMRank()
		
		if (accountLevel >= 2) then
			SendWorldMessage("|cFFFF4500[Black Market Vendor]:|r [Reloading Vendor]")
			
			-- Send item to Bid Buyers and reset tables
			local RewardBidderss = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid, itemtimer, bought FROM custom_black_market WHERE bought = 0 ORDER BY bidplayerguid ASC")
			if not RewardBidderss then
				return
			end
		
			while RewardBidderss:NextRow() do
				local itemid4 = RewardBidderss:GetUInt32(0)
				local itemname4 = RewardBidderss:GetString(1)
				local currentbidprice2 = RewardBidderss:GetUInt32(2)
				local playerguid2 = RewardBidderss:GetUInt32(3)
				local tempo = RewardBidderss:GetUInt32(4)
				local bought = RewardBidderss:GetUInt32(5)
				
				-- Return gold to bidders
				if playerguid2 >= 1 and bought == 0 then
					SendMail("Outbided", string.format("You have been outbid on %s. \nHere's your gold.", itemname4), playerguid2, BlackMarketPlayerGuid, 0, 0, currentbidprice2 * 10000, 0, 9311, 1)
					CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bought = 0 AND bidplayerguid >= 1")
				end
			end
			if RewardBidderss.Close then
				RewardBidderss:Close()
			end
			
			CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bought = 1 or bidplayerguid = 0")
			
			-- Adiciona novos "temporaryOrder", caso não tenha nenhum com o min e max, e os temporaryOrder adicionam novos items no vendor
			local delayedUpdate5 = function()
				local updateitemsonpnc = CharDBQuery("SELECT itemID, temporaryOrder FROM custom_black_market WHERE itemID <> 32547") -- exceção para Unclaimed Black Market Container - sempre fica tempOrder = 0
				if updateitemsonpnc then
					local tbl = {}
					repeat
						local item = 
						{
							itemID = updateitemsonpnc:GetUInt32(0),
							temporaryOrder = updateitemsonpnc:GetUInt32(1)
						}
						table.insert(tbl, item)
					until not updateitemsonpnc:NextRow()
					-- Verifica se há algum itemID com 'temporaryOrder' entre 'mintemporder' e 'maxtemporder', se nao tiver, entao cria novos
					local hasTemporaryOrder = false
					for _, item in ipairs(tbl) do
						if item.temporaryOrder >= mintemporder and item.temporaryOrder <= maxtemporder then
							hasTemporaryOrder = true
							break
						end
					end
					-- Adiciona aleatoriamente números na coluna temporaryOrder
					if not hasTemporaryOrder then
						local quantity = #tbl
						local uniqueNumbers = {}
						for i = 1, quantity do
							uniqueNumbers[i] = i
						end
						for i = quantity, 2, -1 do
							local j = math.random(i)
							uniqueNumbers[i], uniqueNumbers[j] = uniqueNumbers[j], uniqueNumbers[i]
						end
						for i, item in ipairs(tbl) do
							item.temporaryOrder = uniqueNumbers[i]
							CharDBExecute(string.format("UPDATE custom_black_market SET temporaryOrder = %d WHERE itemID = %d", item.temporaryOrder, item.itemID))
						end
					end
				end
			end
			local someDelay5 = 1000
			CreateLuaEvent(delayedUpdate5, someDelay5, 1)
		end
		
    end
end

local function TestCommand(event, player, command)
	if (command == "bmahtest") then
        local accountLevel = player:GetGMRank()

        if (accountLevel >= 2) then
            SendWorldMessage("|cFFFF4500[Black Market Vendor]:|r [Adding 82800 Timer]")
			CharDBExecute("UPDATE custom_black_market SET itemtimer = 82800 WHERE temporaryOrder <= " .. maxtemporder .. " OR itemID = 32547") -- 79200 = faltando 2h
        end
    end
end

CreateLuaEvent(PeriodicUpdateRandomItemsOnVendor, PeriodicUpdateEvent, 0)
RegisterServerEvent(14, OnStartUpUpdateItems)
RegisterPlayerEvent(42, OnReloadCommand)
RegisterPlayerEvent(42, TestCommand)
RegisterCreatureGossipEvent(UnitEntry, 1, BlackMarketMenuOpen)
RegisterCreatureGossipEvent(UnitEntry, 2, On_Top_Select)




--[[ 

if (player:GetLevel() >= 80) then
  
print("Teste")

Comum (Common): 
|cffffffff

Incomum (Uncommon): 
|cffffffff

Raro (Rare): 
|cff0070dd

Épico (Epic): 
|cffa335ee

Lendário (Legendary): 
|cffff8000

------------------------------------------------------------------------------------------------------------
.mod money 2147483645 = 214.748g, 36s, 45c (gold cap)

itemtimer do item:
3600  = 1h - (se passou 1h que os items foram adicionados) - faltam 23h teoricamente
7200  = 2h - faltam 22h
10800 = 3  - faltam 21h
14400 = 4  - faltam 20h
18000 = 5  - faltam 19h
21600 = 6  - faltam 18h
25200 = 7  - faltam 17
28800 = 8  - faltam 16
32400 = 9  - faltam 15
36000 = 10 - faltam 14
39600 = 11 - faltam 13
43200 = 12 - faltam 12
46800 = 13 - faltam 11
50400 = 14 - faltam 10
54000 = 15 - faltam 9
57600 = 16 - faltam 8
61200 = 17 - faltam 7
64800 = 18 - faltam 6
68400 = 19 - faltam 5
72000 = 20 - faltam 4
75600 = 21 - faltam 3
79200 = 22 - faltam 2h
82800 = 23 - faltam 1h
86400 = 24 - faltam 0h - resetou! (pelo menos na teoria)

------------------------------------------------------------------------------------------------------------
UPDATE custom_black_market
SET itemtimer = 82800
WHERE temporaryOrder BETWEEN 1 AND 7 OR itemID = 32547;

------------------------------------------------------------------------------------------------------------

black market da blizz:

*a cada 24h tem item novo
*max bid = 9.999.999g
*auctions:

very long = >= 12h
long = 2~12 hours
medium = 30m~2hr
short = <= 30m

Mount bids start at 20,000g, with some exceptions.
Companion bids start between 1g and 20,000g, depending on the original source and how hard it is to get.
Vanity/misc items start between 10,000g and 15,000g.

*cada bid aumenta a duração do bid em 5 min, as long as you bid within 5 minutes of the previous bid, 
if its short you wanna keep biding

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

--RegisterServerEvent(15, OnShutdownUpdateItems)
--RegisterServerEvent(11, OnShutdownInitiateUpdateItems) - proca tanto no timer do server res, quanto do server shutdown

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

versao em ingles:

elseif intid > 10 and intid <= 150000 then
	if playerToSendMessage then
	--playerToSendMessage:SendBroadcastMessage(string.format("You have been outbid on '%s'. Go to the mail to retrieve your gold.", itemname))

--
if Bid and Bid > 0 and Bid <= 215000 then
	local playerToSendMessage = GetPlayerByGUID(playerguid)
	--playerToSendMessage:SendBroadcastMessage(string.format("You have been outbid on '%s'. Go to the mail to retrieve your gold.", itemname))

-- 
local function PeriodicUpdateRandomItemsOnVendor(eventid, delay, repeats)
	if playerToSendMessage then
	--playerToSendMessage:SendBroadcastMessage(string.format("Item purchased: '%s' on Black Market. Go to the mail to retrieve your item.", itemname2))

--
local function OnShutdownUpdateItems() 
	local itemname3 = ReturnBiddersGold:GetUInt32(2)
	--SendMail("Black Market", string.format("The server restarted before your bid on %s was completed. \nHere's your gold.", itemname3), playerguid3, BlackMarketPlayerGuid, 0, 0, currentbidprice3 * 10000, 0, 9311, 1)
	
	if RewardBidders
	--SendMail(itemname2, string.format("You won the bid on %s.", itemname2), playerguid3, BlackMarketPlayerGuid, 0, 0, 0, 0, itemid2, 1)
	
local RewardBidders = CharDBQuery
	--CharDBQuery("UPDATE custom_black_market SET bought = 4, bidplayername = '', bidplayerguid = NULL, currentbidprice = defaultbidprice WHERE itemID >= 1")


--
local function OnStartUpUpdateItems()

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
log ao receber items dps de 24h

				-- log
				local delayedLog = function()
					CharDBExecute(string.format("INSERT INTO custom_black_market_logs (data, itemid, bid, playername, playerguid, received) VALUES ('%s', '%d', '0', 'WonthebidAfter24H', %d, '1')", currentDateTime, itemid2, playerguid2))
				end
				local delayedLogTime = 1050
				CreateLuaEvent(delayedLog, delayedLogTime, 1)

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- antigo menuopen:
local function BlackMarketMenuOpen(event, player, object)	
    local timeRemaining = PeriodicUpdateEvent - (os.time() - lastCacheTime)
    local formattedTimeLeft = formatTimeLeft(timeRemaining)
    player:GossipSetText(string.format("   Next Time Left update in:\n    %s\n  ______________________________________", formattedTimeLeft))

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
		
		local ResetBoughtsAndUnbids = CharDBQuery("SELECT bidplayerguid, itemtimer, bought FROM custom_black_market WHERE itemID >= 1")
	    if not ResetBoughtsAndUnbids then
			return
		end
		while ResetBoughtsAndUnbids:NextRow() do
			local playerguid2 = ResetBoughtsAndUnbids:GetUInt32(0)
			local tempo = ResetBoughtsAndUnbids:GetUInt32(1)
			local bought = ResetBoughtsAndUnbids:GetUInt32(2)
			
			if bought == 1 and tempo >= 86400 then
				CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bought = 1 AND itemtimer >= 86400")
			elseif playerguid2 == 0 and tempo >= 86400 then
				CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', temporaryOrder = 0, bidplayerguid = 0, itemtimer = 0, currentbidprice = defaultbidprice WHERE bidplayerguid = 0 AND itemtimer >= 86400")
			end
		end
		if ResetBoughtsAndUnbids.Close then
			ResetBoughtsAndUnbids:Close()
		end
		
------------------------------------------------------------------------------------------------------------

	--CharDBExecute("UPDATE custom_black_market SET itemtimer = itemtimer + 3600 WHERE (temporaryOrder >= " .. mintemporder .. " AND temporaryOrder <= " .. maxtemporder .. " or itemID = 32547) AND itemtimer = 82800")

	(em baixo do function new tempOrders)
	--[[ aumenta o itemtimer em 3600 (1h) p/ items order >= 1 e <= 5 caso nao for o update de 23h para 24h.
	local delayedItemTimer = function()
		CharDBExecute("UPDATE custom_black_market SET itemtimer = itemtimer + 3600 WHERE (temporaryOrder >= " .. mintemporder .. " AND temporaryOrder <= " .. maxtemporder .. ") AND itemtimer != 82800")
	end
	local DelayTimerItem = 1700
    CreateLuaEvent(delayedItemTimer, DelayTimerItem, 1)
	
	-- deixa o itemtimer da Unclaimed Black Market Container igual dos temporaryOrders
	local delayedUpdate6 = function()
		local result = CharDBQuery(string.format("SELECT itemtimer FROM custom_black_market WHERE temporaryOrder >= %d AND temporaryOrder <= %d ORDER BY temporaryOrder ASC LIMIT 1", mintemporder, maxtemporder))
		if result then
			local itemtimerValue = result:GetUInt32(0)
			CharDBExecute("UPDATE custom_black_market SET itemtimer = " .. itemtimerValue .. " WHERE itemID = 32547")
		end
	end
	local someDelay6 = 2500
    CreateLuaEvent(delayedUpdate6, someDelay6, 1)--]]


------------------------------------------------------------------------------------------------------------

	--local RewardBidders = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid, itemtimer, bought FROM custom_black_market WHERE bought = 0 ORDER BY bidplayerguid ASC")

------------------------------------------------------------------------------------------------------------

		--[[
		
		-- Send item to Bid Buyers and reset tables
		local RewardBidderss = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid FROM custom_black_market WHERE bought = 0 ORDER BY bidplayerguid ASC")
		--local RewardBidderss = CharDBQuery("SELECT itemID, itemname, currentbidprice, bidplayerguid FROM custom_black_market WHERE bought = 0 ORDER BY currentbidprice ASC, bidplayerguid ASC")
		
		if not RewardBidderss then
			return
		end
		
		if RewardBidderss:NextRow() then
			repeat
				local itemid4 = RewardBidderss:GetUInt32(0)
				local itemname4 = RewardBidderss:GetString(1)
				local currentbidprice2 = RewardBidderss:GetUInt32(2)
				local playerguid2 = RewardBidderss:GetUInt32(3)

				-- Reward Bid Winner
				if playerguid2 >= 1 then
					SendMail("Black Market", string.format("%s comprado através do Black Market Auction House por %s gold.", itemname4, currentbidprice2), playerguid2, BlackMarketPlayerGuid, 0, 0, 0, 0, itemid4, 1)
					local playerToSendMessage = GetPlayerByGUID(playerguid2)
					if playerToSendMessage then
						playerToSendMessage:PlayDirectSound(3081, player)
						playerToSendMessage:SendBroadcastMessage(string.format("Você ganhou o leilão do item %s por %s gold. Vá para o correio para pegar seu item.", itemname4, currentbidprice2))
					end
				end
			until not RewardBidderss:NextRow()
    
			-- reset columns after rewarding players
			local delayedUpdate2 = function()
				CharDBExecute("UPDATE custom_black_market SET bought = 0, bidplayername = '', bidplayerguid = NULL, itemtimer = 0, temporaryOrder = 0, currentbidprice = defaultbidprice WHERE itemtimer >= 999999900")
			end
			local someDelay2 = 1500
			CreateLuaEvent(delayedUpdate2, someDelay2, 1)
    
			if RewardBidderss.Close then
				RewardBidderss:Close()
			end
		end
		--]
		----------------------------------
		----------------------------------

------------------------------------------------------------------------------------------------------------

 - opção de comprar o item
		-- Handles buying the item (items id: > 10 and <= 150.000)
		elseif intid > 10 and intid <= 150000 then
			local Q = CharDBQuery(string.format("SELECT buyoutprice, itemname, currentbidprice, bidplayerguid FROM custom_black_market WHERE itemID = %d AND bought = 0", intid))
			if Q then
				local buyoutprice = Q:GetUInt32(0)
				itemname = Q:GetString(1)
				local currentbidprice = Q:GetUInt32(2)
				local playerguid = Q:GetUInt32(3)

				if player:GetCoinage() >= buyoutprice then
					player:SetCoinage(player:GetCoinage() - buyoutprice)
				
					-- returns gold to bidders
					SendMail("Outbided", string.format("You have been outbid on %s. \nHere's your gold.", itemname), playerguid, BlackMarketPlayerGuid, 0, 0, currentbidprice * 10000, 0, 9311, 1)
					local playerToSendMessage = GetPlayerByGUID(playerguid)
					if playerToSendMessage then
						playerToSendMessage:SendBroadcastMessage(string.format("Alguém fez uma oferta maior que a sua no item %s. \nVa para o correio para pegar seu gold de volta.", itemname))
						playerToSendMessage:PlayDirectSound(3081, player)
					end
				
					CharDBQuery(string.format("UPDATE custom_black_market SET bought = 1, bidplayername = '', bidplayerguid = NULL WHERE itemID = %d", intid))

					SendMail(itemname, "Item comprado atraves do Black Market Auction House", player:GetGUIDLow(), BlackMarketPlayerGuid, 0, 0, 0, 0, intid, 1)
					player:SendBroadcastMessage(string.format("Item: %s comprado com sucesso por %d gold.", itemname, buyoutprice / 10000))
					player:PlayDirectSound(120, player)
					player:GossipComplete()
				else
					player:SendBroadcastMessage("Você não tem gold suficiente para comprar este item.")
					player:GossipComplete()
				end
			else
				player:SendBroadcastMessage(string.format("Item: %s já foi comprado.", intid))
				player:GossipComplete()
			end
			
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--]]

