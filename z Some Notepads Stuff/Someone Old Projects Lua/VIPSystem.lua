--------------------------------------------
	-- 			 VIP System		      --
	-- 	  	Created by Synz	      --
--------------------------------------------









--------------------------------------------
	-- 			CONFIGURATION		  --
	------------------------------------
	------------------------------------
	--		  [Item Activator]		  --
	local itemId_Activator = 63021
	local itemId_Key = 313370
	local itemAmount_Key = 1
	------------------------------------
	--		   [XP Creatures]		  --
	local creatureId_XP1 = 17370
	local creatureId_XP2 = 17371
	local creatureId_XP3 = 17395
	local creatureId_XP4 = 17396
	local creatureId_XP5 = 17397
	local creatureId_XP6 = 17398
	local creatureId_XP7 = 17414
	local creatureId_XP8 = 17477
	local creatureId_XP9 = 17491
	local creatureId_XP10 = 17624
	local creatureId_XP11 = 17626
	local creatureId_XP12 = 17653
	local creatureId_XP13 = 18894
	------------------------------------
	--		 	  [Buffs]			  --
	-- Rank 1			  
	local spellId_Buff_Rank1_1 = 300002
	
	-- Rank 2
	local spellId_Buff_Rank2_1 = 633650
	local spellId_Buff_Rank2_2 = 300003
	
	-- Rank 3
	local spellId_Buff_Rank3_1 = 633651
	local spellId_Buff_Rank3_2 = 17629
	local spellId_Buff_Rank3_3 = 300004
	
	-- Rank 4
	local spellId_Buff_Rank4_1 = 633651
	local spellId_Buff_Rank4_2 = 17548
	local spellId_Buff_Rank4_3 = 17629
	local spellId_Buff_Rank4_4 = 300005
	
	-- Rank 5
	local spellId_Buff_Rank5_1 = 633651
	local spellId_Buff_Rank5_2 = 633660
	local spellId_Buff_Rank5_3 = 36004
	local spellId_Buff_Rank5_4 = 17629
	local spellId_Buff_Rank5_5 = 300006
	
	-- Rank 6
	local spellId_Buff_Rank6_1 = 633651
	local spellId_Buff_Rank6_2 = 633661
	local spellId_Buff_Rank6_3 = 17548
	local spellId_Buff_Rank6_4 = 17629
	local spellId_Buff_Rank6_5 = 53915
	local spellId_Buff_Rank6_6 = 300007
	------------------------------------
	--		 	   [Rates]			  --
	local vip_xp_per_kill = 25					-- vip_xp_per_kill values over minimum required_xp_rank is not recommended
	------------------------------------
	--	  	  [XP Requirement]	 	  --
	local required_xp_rank2 = 5000
	local required_xp_rank3 = 15000
	local required_xp_rank4 = 20000
	local required_xp_rank5 = 25000
	local required_xp_rank6 = 35000
--------------------------------------------









--------------------------------------------
	-- 	  	  Do not edit below	      --
--------------------------------------------


function VIP_ItemOnUse(event, player, item, target)
	local plrAccountId = player:GetAccountId()
	
	local CCC = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..plrAccountId )
	if ( CCC == nil ) then
		return;
	end
	local plr_vipRank = CCC:GetUInt32(0)
	local plr_vipXP = CCC:GetUInt32(1)
	
	if ( plr_vipRank < 1 ) then
		AuthDBQuery("UPDATE account SET vipRank = 1 WHERE id = "..plrAccountId)
		AuthDBQuery("INSERT INTO `account_access` (`id`, `gmlevel`, `RealmID`) VALUES ("..plrAccountId..", 1, -1);")
		player:RemoveItem( itemId_Activator, 1 )
		player:SendBroadcastMessage( "VIP Rank Bronze activated" )
		return false
	end
end
RegisterItemEvent( itemId_Activator, 2, VIP_ItemOnUse )

function VIP_OnCommand(event, player, command)
	local playerAccountId = player:GetAccountId()
	local playerCharacterId = player:GetGUIDLow()
	
	local AAA = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..playerAccountId )
	if ( AAA == nil ) then
		return;
	end
	local player_vipRank = AAA:GetUInt32(0)
	local player_vipXP = AAA:GetUInt32(1)
	
    if (string.lower(command) == "vip" or string.lower(command) == "vip info" or string.lower(command) == "vip infos") then
		if ( player_vipRank > 0 and player_vipRank < 6) then
			if ( player_vipRank == 1 ) then
				player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffXP|cffffffff:|r|cff81F79F "..player_vipXP.." |cffffffff/|r|cff81F79F "..required_xp_rank2.."\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
			elseif ( player_vipRank == 2 ) then
				player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffXP|cffffffff:|r|cff81F79F "..player_vipXP.." |cffffffff/|r|cff81F79F "..required_xp_rank3.."\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
			elseif ( player_vipRank == 3 ) then
				player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffXP|cffffffff:|r|cff81F79F "..player_vipXP.." |cffffffff/|r|cff81F79F "..required_xp_rank4.."\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
			elseif ( player_vipRank == 4 ) then
				player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffXP|cffffffff:|r|cff81F79F "..player_vipXP.." |cffffffff/|r|cff81F79F "..required_xp_rank5.."\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
			elseif ( player_vipRank == 5 ) then
				player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffXP|cffffffff:|r|cff81F79F "..player_vipXP.." |cffffffff/|r|cff81F79F "..required_xp_rank6.."\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
			end
		elseif ( player_vipRank > 5 ) then
			player:SendBroadcastMessage( "|cffffffff--------------------------------------------------------------------\n|cffffffff[|cff00FFBFVIP|cffffffff]\n|cff58ACFARank|cffffffff:|cffF79F81 "..player_vipRank.."\n|cffffffffMaxed out\n|cffffffff--------------------------------------------------------------------\n|cffffffff[|r|cff58ACFAMore info|cffffffff]\n|cffffffffType '.vip commands' to view available commands\n|cffffffff--------------------------------------------------------------------")
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r |cffffffffRank 1 Bronze to use this command" )
		end
		return false
		
    elseif (string.lower(command) == "vip commands" or string.lower(command) == "vip command") then
		if ( player_vipRank > 0 ) then
			player:SendBroadcastMessage( "|cffffffff[|cff81BEF7Commands|cffffffff]\n|cffffffff.vip activate\n|cffffffff.vip island\n|cffffffff.vip key\n|cffffffff.vip buff\n|cffffffff.vip maxskills\n|cffffffff.repair\n|cffffffff.mailbox\n|cffffffff.whisper" )
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r |cffffffffRank 1 to use this command" )
		end
		return false
		
    elseif (string.lower(command) == "vip delevel") then
		if ( player:IsGM() == true ) then
			if ( player_vipRank > 0 ) then
				AuthDBQuery("UPDATE account SET vipRank = vipRank - 1 WHERE id = "..playerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..playerAccountId)
				local spellVIPRankUp = 47292
				player:CastSpell( self, spellVIPRankUp, true )
				local vipRankShow = player_vipRank - 1
				player:SendBroadcastMessage( "You're now |cff00FFBFVIP|r Rank "..vipRankShow.."")
				return false
			else
				player:SendBroadcastMessage( "|cffffffffYou're already at the lowest |cff00FFBFVIP|r|cffffffff rank" )
				return false
			end
		else
			return;
		end
		
    elseif (string.lower(command) == "vip level" or string.lower(command) == "vl") then
		if ( player:IsGM() == true ) then
			if ( player_vipRank > -1 and player_vipRank < 6 ) then
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..playerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..playerAccountId)
				local spellVIPRankUp = 47292
				player:CastSpell( self, spellVIPRankUp, true )
				local vipRankDisplay = player_vipRank + 1
				player:SendBroadcastMessage( "|cffffffffYou're now |cff00FFBFVIP|r|cffffffff Rank "..vipRankDisplay.."")
				return false
			elseif ( player_vipRank > 6 ) then
				AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..playerAccountId)
			else
				player:SendBroadcastMessage( "|cffffffffYou're already at the maximum |cff00FFBFVIP|r|cffffffff rank" )
				return false
			end
		else
			return;
		end
		
	elseif (string.lower(command) == "vip island" or string.lower(command) == "vip islands") then
		if ( player_vipRank > 0 ) then
			player:Teleport( 571, 8515.202148, 761.108276, 558.568970, 1.524530 )
			player:SendBroadcastMessage( "|cffffffffYou've been teleported to the island" )
			return false
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r|cffffffff Rank 1 to use this command" )
			return false
		end
		
	elseif (string.lower(command) == "vip key") then
		if ( player_vipRank > 0 ) then
			player:AddItem( itemId_Key, itemAmount_Key )
			player:SendBroadcastMessage( "|cffffffffYou've been given the key item" )
			return false
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r|cffffffff Rank 1 to use this command" )
			return false
		end
		
	elseif (string.lower(command) == "vip buffs" or string.lower(command) == "vip buff") then
		if( player_vipRank == 1 ) then
			player:CastSpell( self, spellId_Buff_Rank1_1, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 1 buffed" )
			return false
			
		elseif( player_vipRank == 2 ) then
			player:CastSpell( self, spellId_Buff_Rank2_1, true )
			player:CastSpell( self, spellId_Buff_Rank2_2, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 2 buffed" )
			return false
			
		elseif( player_vipRank == 3 ) then
			player:CastSpell( self, spellId_Buff_Rank3_1, true )
			player:CastSpell( self, spellId_Buff_Rank3_2, true )
			player:CastSpell( self, spellId_Buff_Rank3_3, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 3 buffed" )
			return false
			
		elseif( player_vipRank == 4 ) then
			player:CastSpell( self, spellId_Buff_Rank4_1, true )
			player:CastSpell( self, spellId_Buff_Rank4_2, true )
			player:CastSpell( self, spellId_Buff_Rank4_3, true )
			player:CastSpell( self, spellId_Buff_Rank4_4, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 4 buffed" )
			return false
			
		elseif( player_vipRank == 5 ) then
			player:CastSpell( self, spellId_Buff_Rank5_1, true )
			player:CastSpell( self, spellId_Buff_Rank5_2, true )
			player:CastSpell( self, spellId_Buff_Rank5_3, true )
			player:CastSpell( self, spellId_Buff_Rank5_4, true )
			player:CastSpell( self, spellId_Buff_Rank5_5, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 5 buffed" )
			return false
			
		elseif( player_vipRank == 6 ) then
			player:CastSpell( self, spellId_Buff_Rank6_1, true )
			player:CastSpell( self, spellId_Buff_Rank6_2, true )
			player:CastSpell( self, spellId_Buff_Rank6_3, true )
			player:CastSpell( self, spellId_Buff_Rank6_4, true )
			player:CastSpell( self, spellId_Buff_Rank6_5, true )
			player:CastSpell( self, spellId_Buff_Rank6_6, true )
			player:SendBroadcastMessage( "|cff00FFBFVIP|r |cffffffffRank 6 buffed" )
			return false
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r|cffffffff Rank 1 to use this command" )
			return false
		end
		
	elseif (string.lower(command) == "vip maxskill" or string.lower(command) == "vip maxskills") then
		if ( player_vipRank > 0 ) then
			player:AdvanceSkillsToMax()
			player:SendBroadcastMessage( "|cffffffffYour skills are maxed out" )
			return false
		else
			player:SendBroadcastMessage( "|cffffffffYou must be at least |cff00FFBFVIP|r|cffffffff Rank 1 to use this command" )
			return false
		end
    end
end
RegisterPlayerEvent(42, VIP_OnCommand)

function VIP_Creature1OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAB = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAB == nil ) then
		return;
	end
	local killer_vipRank = AAB:GetUInt32(0)
	local killer_vipXP = AAB:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP1, 4, VIP_Creature1OnDied )

function VIP_Creature2OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAC = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAC == nil ) then
		return;
	end
	local killer_vipRank = AAC:GetUInt32(0)
	local killer_vipXP = AAC:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP2, 4, VIP_Creature2OnDied )

function VIP_Creature3OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAD = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAD == nil ) then
		return;
	end
	local killer_vipRank = AAD:GetUInt32(0)
	local killer_vipXP = AAD:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP3, 4, VIP_Creature3OnDied )

function VIP_Creature4OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAE = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAE == nil ) then
		return;
	end
	local killer_vipRank = AAE:GetUInt32(0)
	local killer_vipXP = AAE:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP4, 4, VIP_Creature4OnDied )

function VIP_Creature5OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP5, 4, VIP_Creature5OnDied )

function VIP_Creature6OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP6, 4, VIP_Creature6OnDied )

function VIP_Creature7OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP7, 4, VIP_Creature7OnDied )

function VIP_Creature8OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP8, 4, VIP_Creature8OnDied )

function VIP_Creature9OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP9, 4, VIP_Creature9OnDied )

function VIP_Creature10OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP10, 4, VIP_Creature10OnDied )

function VIP_Creature11OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP11, 4, VIP_Creature11OnDied )

function VIP_Creature12OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP12, 4, VIP_Creature12OnDied )

function VIP_Creature13OnDied(event, creature, killer)
	local killerAccountId = killer:GetAccountId()
	local vipXPRate = vip_xp_per_kill
	
	local AAF = AuthDBQuery( "SELECT vipRank, vipXP FROM account WHERE id = "..killerAccountId )
	if ( AAF == nil ) then
		return;
	end
	local killer_vipRank = AAF:GetUInt32(0)
	local killer_vipXP = AAF:GetUInt32(1)
	
	local spellVIPRankUp = 47292
	
	if ( killer_vipRank < 6 ) then
		local vip_xp_total = killer_vipXP + vipXPRate
		if ( killer_vipRank < 1 ) then
			return;
		elseif ( killer_vipRank < 2 ) then
			if ( vip_xp_total >= required_xp_rank2 ) then
				xp_extra = vip_xp_total - required_xp_rank2
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 2" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 3 ) then
			if ( vip_xp_total >= required_xp_rank3 ) then
				xp_extra = vip_xp_total - required_xp_rank3
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 3" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 4 ) then
			if ( vip_xp_total >= required_xp_rank4 ) then
				xp_extra = vip_xp_total - required_xp_rank4
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 4" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 5 ) then
			if ( vip_xp_total >= required_xp_rank5 ) then
				xp_extra = vip_xp_total - required_xp_rank5
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 + "..xp_extra.." WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 5" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		elseif ( killer_vipRank < 6 ) then
			if ( vip_xp_total >= required_xp_rank6 ) then
				xp_extra = vip_xp_total - required_xp_rank6
				AuthDBQuery("UPDATE account SET vipRank = vipRank + 1 WHERE id = "..killerAccountId)
				AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
				killer:CastSpell( self, spellVIPRankUp, true )
				killer:SendBroadcastMessage( "|cffffffffYou've reached |cff00FFBFVIP|r |cffffffffRank 6" )
				return false
			else
				AuthDBQuery("UPDATE account SET vipXP = vipXP + "..vipXPRate.." WHERE id = "..killerAccountId)
			end
		end
	elseif ( killer_vipRank >= 6 ) then
		AuthDBQuery("UPDATE account SET vipRank = 6 WHERE id = "..killerAccountId)
		AuthDBQuery("UPDATE account SET vipXP = 0 WHERE id = "..killerAccountId)
	else
		return;
	end
end
RegisterCreatureEvent( creatureId_XP13, 4, VIP_Creature13OnDied )
