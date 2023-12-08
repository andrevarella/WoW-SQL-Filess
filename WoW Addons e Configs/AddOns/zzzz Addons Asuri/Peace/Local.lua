
--[[


		$project:		Give Me Peace
		$copyright:		© Copyright Michael Boyle.
						All Rights Reserved.
														
]]--


--
--	Setup localisation.
--
function Peace_Localisation()
	
	-- wheres this client then?
	local client_area = GetLocale();		

	-- this is the default silent whisper sent to players who were blocked.
	
	-- English/US
	if(client_area == "enUS") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- France
	elseif(client_area == "frFR") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- German
	elseif(client_area == "deDE") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Korean
	elseif(client_area == "koKR") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Chinese (simplified)
	elseif(client_area == "zhCN") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Chinese (traditional)
	elseif(client_area == "zhTW") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Russian
	elseif(client_area == "ruRU") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Spanish (Spain)
	elseif(client_area == "esES") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	-- Mexico
	elseif(client_area == "esMX") then 
		-- silent whisper sent to blocked players who send a message.	
		MSG_BLOCKED1 = "Important: Your whisper was rejected and hidden from %s because you are not on %s's list of authorised friends. If you feel you should be on %s's list then please send an in-game mail.";

	end;
	
end;
