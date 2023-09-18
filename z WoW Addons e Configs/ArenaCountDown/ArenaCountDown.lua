local version = "1.0";

-- /script countdown = 60

local timeintv = 1;
local timeelapse = 0;
local hidden = false;
 countdown = -1;

function ACD_OnLoad()
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL");
	
	SA = {};
	SA['wispcache'] = {};
	
end


function ACD_OnLoaded() 

	DEFAULT_CHAT_FRAME:AddMessage("Arena Count Down loaded. (v"..version..") -- Coded by sammysnake" );
end

function ACD_OnUpdate( elapse )
	if (countdown > 0) then
		hidden = false;
		
		if ((math.floor(countdown) ~= math.floor(countdown - elapse)) and (math.floor(countdown - elapse) >= 0)) then
			local str = tostring(math.floor(countdown - elapse));
			
			if (math.floor(countdown - elapse) == 3) then			
				PlaySoundFile("Interface\\AddOns\\ArenaCountDown\\Sounds\\321.wav");
			end
			
			if (math.floor(countdown - elapse) == 0) then
				-- Show "." on 0 second
				ACDLarge:Hide();
				ACDNumTens:Hide();
				ACDNumOnes:Hide();		
				ACDNumOne:Hide();
										
			elseif (string.len(str) == 2) then			
				-- Display has 2 digits
				
				ACDNumTens:Show();
				ACDNumOnes:Show();
				
				ACDNumTens:SetTexture("Interface\\AddOns\\ArenaCountDown\\Artwork\\".. string.sub(str,0,1));
				ACDNumOnes:SetTexture("Interface\\AddOns\\ArenaCountDown\\Artwork\\".. string.sub(str,2,2));
			elseif (string.len(str) == 1) then		
				-- Display has 1 digit
				
				ACDNumOne:Show();
				ACDNumOne:SetTexture("Interface\\AddOns\\ArenaCountDown\\Artwork\\".. string.sub(str,0,1));				
				
				ACDNumOnes:Hide();
				ACDNumTens:Hide();
			end
			--
			--DEFAULT_CHAT_FRAME:AddMessage(math.floor(countdown - elapse) .. " seconds until Arena starts!");			
		end
		countdown = countdown - elapse;
	elseif (not hidden) then
		hidden = true;
		ACDNumTens:Hide();
		ACDNumOnes:Hide();
		ACDNumOne:Hide();
		ACDLarge:Hide();
	end
	
end

-- /script countdown = 60


function ACD_OnEvent( event )

	if ((event == "ADDON_LOADED") and (arg1 == "SpamAssasin")) then 
		
		ACD_OnLoaded();
			
	elseif (event == "CHAT_MSG_BG_SYSTEM_NEUTRAL") then
	
		if (string.find(arg1, "One minute until the Arena battle begins!")) then
			countdown = 61;
			return;
		end
		if (string.find(arg1, "Thirty seconds until the Arena battle begins!")) then
			countdown = 31;
			return;
		end
		if (string.find(arg1, "Fifteen seconds until the Arena battle begins!")) then
			countdown = 16;
			return;
		end		
		
		
  end
	
end
