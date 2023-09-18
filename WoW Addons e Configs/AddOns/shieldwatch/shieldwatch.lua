local shieldwatch_debugmsgs=false; -- switch to enable/disable debug messages
local shieldwatch_MyGUID=0;
local shieldwatch_myclass="";
local shieldpower = {} ; -- table for shield power cache
local shieldstore = {} ; -- where we store active shield info
local shieldwatch_lastcritheal=0;
local shieldwatch_elapsed =0;
local shieldstore_slotmax = 7;
local shieldwatch_slotdisplayed=nil;
local shieldwatch_enabled=true;
local shieldwatch_timewarn=false;
local shieldwatch_optionsedited=false;
local shieldwatch_donetalentcheck=false;

local shieldwatch_localeloaded = false;

-- all entries below need localisation

local shieldwatch_PWS = 'Power Word: Shield';
local shieldwatch_DA = 'Divine Aegis';
local shieldwatch_IB = 'Ice Barrier';


-- numbers in this table refers to the entry to use in the TIPREAD table and the spell bonus type to apply (if any)
-- slot is the priority of the shield to take damage, with 1 being the highest, school is only for fire/frost ward and indicates they
-- can only absorb damage of that school. The tbx entries on PW:S are for the various talent boosts
-- r,g,b entries control the status bar colour and icon is of course then name of the icon to display.


local   shieldwatch_SPELLS = {
   -- priest
    [shieldwatch_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [shieldwatch_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[4]=0}},
     -- mage
    [shieldwatch_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Mana Shield']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['Fire Ward']={tip=1,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
    ['Frost Ward']={tip=1,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    -- warlock
    ['Sacrifice']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['Shadow Ward']={tip=1,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Sacred Shield']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
   ['Fel Blossom']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  

-- what line and pattern we need to extract the shield's maximum damage absorbion from the tooltip
local   shieldwatch_TIPREAD = {
   [1]= { line="4",pattern="[aA]bsorb%a* (%d+) [^d]?%a*%s?damage" },   -- all spells use line 4, and (for English at least, this pattern)
   [2]= { line="3",pattern="Absorbs %d+ to (%d+) damage" } -- only used by Fel Blossom, we take the most optimistic value for the shield
};

local   shieldwatch_LOCKTXT = "Lock Window";
local   shieldwatch_UNLOCKTXT = "Unlock Window";
local   shieldwatch_USAGE = "Error! Valid commands are:\n/shieldwatch options - access the options screen\n/shieldwatch scale <num> - to scale the shieldwatch frame (0.3 to 3)\n/shieldwatch disable - to temporarily disable Shieldwatch\n/shieldwatch enable - to re-enable shieldwatch\n(/swh can be used instead of /shieldwatch)";
local   shieldwatch_ENABLED = "has been re-enabled.";
local   shieldwatch_DISABLED = "has been disabled for the rest of this session.\nUse /shieldwatch enable - to re-enable shieldwatch";
local   shieldwatch_DISABLEMNU = "Disable";
local   shieldwatch_BADSCALE = "scale out of range. Must be between 0.3 and 3";
local   shieldwatch_SETSCALE = "scale set to ";
local   shieldwatch_INIT = " active. Use '/shieldwatch (or /swh) options' to configure";
local   shieldwatch_OPTIONMNU = "Options";
local   shieldwatch_BADTIME = "warning time out of range, must be between 2 and 10";
local   shieldwatch_BADPCT = "warning percent out of range, must be between 1 and 51";
local   shieldwatch_OPTTITLE = "shieldwatch Options";
local   shieldwatch_OPTTEXT1 = "Enable ShieldWatch (Re-Enables every session!)";
local   shieldwatch_OPTTEXT2 = "Lock Window";
local   shieldwatch_OPTTEXT3 = "Warn if seconds on shield less than";
local   shieldwatch_OPTTEXT4 = "Warn if percent on shield less than";
local   shieldwatch_OPTTEXT5 = "Flash Bars Border When Warnings Occur";
local   shieldwatch_OPTTEXT6 = "Adjust Bar Scale";
local   shieldwatch_OPTSMALL = "Small";
local   shieldwatch_OPTBIG = "Big";

local mylocale = GetLocale();

if (mylocale == "enUS") then

   shieldwatch_localeloaded = true;
   
end

-- talent names do not need to be localised now

local shieldwatch_talentchecks = {
[1]= {tab=1,pos=2,name='Twin Disciplines',rankboost=0.01,spell=shieldwatch_PWS},
[2]= {tab=1,pos=9,name='Improved Power Word: Shield',rankboost=0.05,spell=shieldwatch_PWS},
[3]= {tab=1,pos=27,name='Borrowed Time',rankboost=0.0975,spell=shieldwatch_PWS},
[4]= {tab=1,pos=24,name='Divine Aegis',rankboost=0.1,spell=shieldwatch_DA}
};
local shieldwatch_talentstocheck =4;


function shieldwatch_optionsOnLoad(panel)
panel.name ="shieldwatch v".. GetAddOnMetadata("shieldwatch", "Version"); 
panel.okay = shieldwatch_optionsokay;
panel.cancel = shieldwatch_optionscancel;
InterfaceOptions_AddCategory(panel);
  shieldwatch_optionsFrameScale:SetMinMaxValues(-1,1);
  shieldwatch_optionsFrameScale:SetValueStep(0.1);
  shieldwatch_optionsFrameScaleLow:SetText(shieldwatch_OPTSMALL);
  shieldwatch_optionsFrameScaleHigh:SetText(shieldwatch_OPTBIG);
  shieldwatch_optionsFrameTitle:SetText(shieldwatch_OPTTITLE);
  shieldwatch_optionsFrameOpttext1:SetText(shieldwatch_OPTTEXT1);
  shieldwatch_optionsFrameOpttext2:SetText(shieldwatch_OPTTEXT2);
  shieldwatch_optionsFrameOpttext3:SetText(shieldwatch_OPTTEXT3);
  shieldwatch_optionsFrameOpttext4:SetText(shieldwatch_OPTTEXT4);
  shieldwatch_optionsFrameOpttext5:SetText(shieldwatch_OPTTEXT5);
  shieldwatch_optionsFrameOpttext6:SetText(shieldwatch_OPTTEXT6);

end

function shieldwatch_optionsokay()
if (shieldwatch_optionsedited) then
  shieldwatch_debug("okay pressed, options may have changed");
  shieldwatch_setscale(exp(floor(shieldwatch_optionsFrameScale:GetValue()*10+.5)/10));
  shieldwatch_Options["Lock"]=(shieldwatch_optionsFrameLock:GetChecked()==1);
  shieldwatch_Options["enabletimewarn"]=(shieldwatch_optionsFrameEnableTime:GetChecked()==1);
  shieldwatch_Options["enablepctwarn"]=(shieldwatch_optionsFrameEnablePct:GetChecked()==1);
  shieldwatch_Options["flashborder"]=(shieldwatch_optionsFrameFlashBorder:GetChecked()==1);
  local timetowarn=tonumber(shieldwatch_optionsFrameTimetowarn:GetText());
  if (timetowarn > 0 and timetowarn < 11) then
     shieldwatch_Options["timetowarn"]=timetowarn;
  else
    shieldwatch_print(shieldwatch_BADTIME);
  end   
  local pcttowarn=tonumber(shieldwatch_optionsFramePcttowarn:GetText());
  if (pcttowarn > 0 and pcttowarn < 52) then
     shieldwatch_Options["pcttowarn"]=pcttowarn;
  else
    shieldwatch_print(shieldwatch_BADPCT);
  end   
  local enabled=(shieldwatch_optionsFrameEnable:GetChecked()==1);
  if (enabled ~= shieldwatch_enabled) then
      if (enabled) then
        shieldwatch_enable();
      else
        shieldwatch_disable();
      end
  end
  shieldwatch_optionsedited=false;
else
  shieldwatch_debug("okay pressed, options unchanged");
end  
end

function shieldwatch_optionscancel()
shieldwatch_debug("cancel pressed on the options screen");
shieldwatch_optionsedited=false;
end


function shieldwatch_showoptions(self)
if (shieldwatch_Options and not shieldwatch_optionsedited) then
  shieldwatch_debug("showing the options screen");
  shieldwatch_optionsFrameEnable:SetChecked(shieldwatch_enabled);
  shieldwatch_optionsFrameLock:SetChecked(shieldwatch_Options["Lock"]);
  shieldwatch_optionsFrameEnableTime:SetChecked(shieldwatch_Options["enabletimewarn"]);
  shieldwatch_optionsFrameEnablePct:SetChecked(shieldwatch_Options["enablepctwarn"]);
  shieldwatch_optionsFrameFlashBorder:SetChecked(shieldwatch_Options["flashborder"]);
  shieldwatch_optionsFrameTimetowarn:SetText(tostring(shieldwatch_Options["timetowarn"]));
  shieldwatch_optionsFramePcttowarn:SetText(tostring(shieldwatch_Options["pcttowarn"]));
  shieldwatch_optionsFrameScale:SetValue(log(shieldwatch_Options["scale"]));
  shieldwatch_optionsedited=true;
end
end



function shieldwatch_InitDropDown()
	local info;
	local version = GetAddOnMetadata("shieldwatch", "Version"); 
	info = {};
	info.text = "shieldwatch v"..version;
	info.justifyH = "CENTER";
	info.isTitle = 1;
	info.notCheckable = 1;
	UIDropDownMenu_AddButton(info);
	
	
	info = {};
	if ( shieldwatch_Options["Lock"] ) then
		info.text = shieldwatch_UNLOCKTXT;
	else
		info.text = shieldwatch_LOCKTXT;
	end
	info.value = "LockMeter";
	info.notCheckable = 1;
	info.func = shieldwatch_lockmenu;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = shieldwatch_DISABLEMNU;
	info.value = "disable";
	info.notCheckable = 1;
	info.func = shieldwatch_disable;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = shieldwatch_OPTIONMNU;
	info.value = "options";
	info.notCheckable = 1;
	info.func = function(self) InterfaceOptionsFrame_OpenToCategory(shieldwatch_optionsFrame) end;
	UIDropDownMenu_AddButton(info);

end

function shieldwatch_OnLoad(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    SLASH_shieldwatch1 = "/shieldwatch";
    SLASH_shieldwatch2 = "/swh";
    SlashCmdList["shieldwatch"] = shieldwatch_slashcmd;
end

function shieldwatch_slashcmd(msg)
   if (msg == nil) then
      return nil;
   end

  local _,_, command, com2 = string.find (msg, "^(%w+)%s*(.*)$");
  
  command=string.lower(tostring(command));
  if (command=="scale") then
        shieldwatch_setscale(tonumber(com2),true);
     return;
  elseif (command=="options") then
     InterfaceOptionsFrame_OpenToCategory(shieldwatch_optionsFrame);
     return;
  elseif (command=="disable") then
     shieldwatch_disable();
     return;
  elseif (command=="enable") then
     shieldwatch_enable();
     return;
  elseif (command=="dbg") then
     shieldwatch_debugmsgs = not shieldwatch_debugmsgs;
     shieldwatch_print("debug "..tostring(shieldwatch_debugmsgs));
     return;	
  elseif (command=="mdchannel") then
     if (com2) then
        shieldwatch_Options["mdchannel"] = string.upper(tostring(com2));
     end   
     return;
  end	
  shieldwatch_print(shieldwatch_USAGE);
end

function shieldwatch_enable()
     if (not shieldwatch_enabled) then
        shieldwatch_Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
        shieldwatch_enabled=true;
     end
     shieldwatch_print(shieldwatch_ENABLED);
end

function shieldwatch_disable()
  if (shieldwatch_enabled) then
     shieldwatch_Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
     shieldwatch_slotdisplayed=nil;      
     shieldwatch_Frame:Hide();
     shieldwatch_enabled=false;
  end       
  shieldwatch_print(shieldwatch_DISABLED);
end

function shieldwatch_setscale(scale,confirm)
     if (not scale or scale <.3 or scale > 3) then
        shieldwatch_print(shieldwatch_BADSCALE);
     else
        shieldwatch_Frame:SetScale(scale);
        shieldwatch_Options["scale"]=scale;
        if (confirm) then
          shieldwatch_print(shieldwatch_SETSCALE..tostring(scale));
        end  
     end      
end

function shieldwatch_optionclick(item)
-- click on an option check button
shieldwatch_debug("state is ".. tostring(item:GetChecked()));
end

function shieldwatch_classinit(self)  

  if (not shieldwatch_localeloaded) then
    shieldwatch_print("does not currently support your locale: '"..mylocale.."', sorry.");
  else
    shieldwatch_print("v"..GetAddOnMetadata("shieldwatch", "Version")..shieldwatch_INIT);
    shieldwatch_MyGUID=UnitGUID("player");
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:RegisterEvent("PLAYER_LEVEL_UP");
    self:RegisterEvent("PLAYER_TALENT_UPDATE");
--    self:RegisterEvent("CHAT_MSG_ADDON");
    shieldwatch_debug("guid is "..shieldwatch_MyGUID);
    _,shieldwatch_myclass=UnitClass("player");
  end   
end

function shieldwatch_checktalents()
-- the 'broadcast' stuff in here is for a possible future feature when in party or raid. It is not yet implemented.

if (shieldwatch_debugmsgs) then
  local numglyphs=GetNumGlyphSockets();
  shieldwatch_debug("reported glyph slots: "..tostring(numglyphs)); 
 for i = 1, numglyphs do
    local enabled,_, glyphSpellID,_ = GetGlyphSocketInfo(i);
      shieldwatch_debug("got glyph: "..tostring(glyphSpellID).. "(enabled: "..tostring(enabled)..")"); 
  end
end

if (shieldwatch_myclass=="MAGE") then  -- check for Ice barrier glyph
  shieldwatch_SPELLS[shieldwatch_IB].gb = 1; -- 1= no glyph
  local numglyphs=GetNumGlyphSockets();
  for i = 1, numglyphs do
    local enabled,_, glyphSpellID,_ = GetGlyphSocketInfo(i);
    if ( enabled and glyphSpellID==63095) then
      shieldwatch_SPELLS[shieldwatch_IB].gb = 1.3;
    end
  end
elseif (shieldwatch_myclass=="PRIEST") then -- we need to check the priest's talents as they may boost PW:S
local broadcast="1,"..tostring(shieldwatch_MyGUID)..","..tostring(GetSpellBonusDamage(2));
  for i=1,shieldwatch_talentstocheck,1 do
   local check = shieldwatch_talentchecks[i];
   local nameTalent,_,_,_, currentRank = GetTalentInfo(check.tab,check.pos);
shieldwatch_debug("talent "..i.." name "..nameTalent.." rank "..tostring(currentRank));
 -- name check only for debugging - commented out as will not work for any language other than English
--   if (nameTalent == check.name) then
      shieldwatch_SPELLS[check.spell].tb[i] = (currentRank * check.rankboost);
      broadcast = broadcast ..","..tostring(shieldwatch_SPELLS[check.spell].tb[i]);
shieldwatch_debug("talent boost "..tostring(i).." is ".. tostring(shieldwatch_SPELLS[check.spell].tb[i])); 
--   else
--shieldwatch_debug("talent name mismatch ".. check.name); 
--   end         
  end
--  SendAddonMessage("Shieldmon",tostring(GetTime())..":"..broadcast,"RAID");
end
shieldwatch_donetalentcheck=true; 
end


function shieldwatch_shieldup(spellid,spelldata,caster_GUID)
shieldwatch_debug("aura from spell "..tostring(spellid))
  if (spellid==53601) then  -- fix for Sacred shield spell and actual shield having same name.
     return
  end;
  if (not shieldwatch_donetalentcheck) then
    shieldwatch_checktalents();
  end     
  if (not spelldata.tip) then -- it's divine aegis
     local stackshield=0;   
     if (shieldstore[spelldata.slot] and shieldstore[spelldata.slot].shieldspell and shieldstore[spelldata.slot].shieldspell==spellid and shieldstore[spelldata.slot].shieldat > 0) then -- handle shield stacking if DA already active add remaining shield to new shield
        stackshield = shieldstore[spelldata.slot].shieldat; 
        shieldwatch_debug("stacking divine aegis, existing shield remaining: "..tostring(stackshield));        
     end     
     if (caster_GUID == shieldwatch_MyGUID) then  
        shieldpower[spellid] = floor(shieldwatch_lastcritheal * spelldata.tb[4]) + stackshield;  -- if selfcast rank is got from talents
     else
        shieldpower[spellid] = floor(shieldwatch_lastcritheal * 0.3) + stackshield;  -- if not selfcast then assume highest rank... no way to be sure
     end
     
     if (shieldpower[spellid] > 10000) then
       shieldpower[spellid] = 10000 -- handle 10k cap on DA
     end  
       
     
-- see if shield details are in the cache, if not get them        
  elseif (not shieldpower[spellid]) then
     shieldwatchTooltip:ClearLines();
     shieldwatchTooltip:SetHyperlink("spell:"..tostring(spellid));
     local tiplines = shieldwatchTooltip:NumLines();
shieldwatch_debug("tiplines "..tostring(tiplines));
     if (tiplines > 2) then
            local readline = ""
            -- fix for bg/arena preparation removing one line of the tooltip!
            if (tiplines < tonumber(shieldwatch_TIPREAD[spelldata.tip].line)) then
               readline = tostring(tonumber(shieldwatch_TIPREAD[spelldata.tip].line) - 1)
            else
               readline = shieldwatch_TIPREAD[spelldata.tip].line
            end      
            local mytext = getglobal("shieldwatchTooltipTextLeft"..readline);
            local text = mytext:GetText();
            shieldwatch_debug("line: "..text);
            local _,_,dmgab = strfind(text, shieldwatch_TIPREAD[spelldata.tip].pattern);
shieldwatch_debug("dmgab "..tostring(dmgab));
            shieldpower[spellid] = tonumber(dmgab);
     else
shieldwatch_debug("failed reading spell ");
            shieldpower[spellid] = -1;
     end     
  end
  local slot=spelldata.slot;
  local spellname,spellrank = GetSpellInfo(spellid);

  shieldstore[slot]={};
if (spellid==58597) then -- sigh another fix for there being two buffs called Sacred Shield... ffs Blizz!!!
    local shieldTex = 'Interface\\Icons\\Ability_Paladin_GaurdedbytheLight'
    for i=1,40 do
       local _,_,imsiIcon,_,_,_,imsiTime = UnitBuff("player",i)
       if shieldTex == imsiIcon then
          shieldstore[slot].shieldexpires = imsiTime
          break;
       end
    end
else   
  _,_,_,_,_,_,shieldstore[slot].shieldexpires = UnitBuff("player",spellname,spellrank);
end
  shieldstore[slot].shieldduration = tostring(floor(shieldstore[slot].shieldexpires - GetTime() +.5));
shieldwatch_debug("aura expires "..tostring(shieldstore[slot].shieldexpires).." duration "..shieldstore[slot].shieldduration)

  if (spelldata.bonus) then
    if (spelldata.gb) then -- only Ice Barrier should pass here, add in glyph bonus
       shieldstore[slot].shieldat = shieldpower[spellid] + floor(GetSpellBonusDamage(spelldata.bonus) * 0.8067 * spelldata.gb );
    else
       shieldstore[slot].shieldat = shieldpower[spellid] + floor(GetSpellBonusDamage(spelldata.bonus) * 0.8067);
    end      
  else
    shieldstore[slot].shieldat = shieldpower[spellid];
  end
  if (spelldata.tb and spelldata.tip) then -- only PW:S should pass here
     shieldstore[slot].shieldat = shieldstore[slot].shieldat + floor(shieldstore[slot].shieldat * spelldata.tb[1]);
     shieldstore[slot].shieldat = shieldstore[slot].shieldat + floor(shieldstore[slot].shieldat * spelldata.tb[2]);
     shieldstore[slot].shieldat = shieldstore[slot].shieldat + floor(GetSpellBonusDamage(spelldata.bonus) * spelldata.tb[3]);

  end   
  shieldstore[slot].shieldmax = shieldstore[slot].shieldat;
  shieldstore[slot].shieldspell = spellid;
  shieldstore[slot].icon = spelldata.icon;
  shieldstore[slot].r=spelldata.r;
  shieldstore[slot].g=spelldata.g;
  shieldstore[slot].b=spelldata.b;
  if (spelldata.school) then
     shieldstore[slot].school = spelldata.school;
  end
  if (not shieldwatch_slotdisplayed or shieldwatch_slotdisplayed >= slot) then
     shieldwatch_slotdisplayed = slot;

     shieldwatch_FrameIcon1:SetTexture("Interface\\Icons\\"..spelldata.icon);
     shieldwatch_Bar:SetStatusBarColor(spelldata.r,spelldata.g,spelldata.b,1);
     shieldwatch_update(slot);
     shieldwatch_Frame:Show();
  end   
end

function shieldwatch_onupdate(self,elapsed)
  shieldwatch_elapsed= shieldwatch_elapsed + elapsed; 	
  if (shieldwatch_elapsed > .25) then
      if (shieldstore[shieldwatch_slotdisplayed].pendingdestroy) then
          shieldstore[shieldwatch_slotdisplayed].shieldat = -1;
          shieldwatch_update(shieldwatch_slotdisplayed);
      else   
         shieldstore[shieldwatch_slotdisplayed].shieldduration = tostring(floor(shieldstore[shieldwatch_slotdisplayed].shieldexpires - GetTime() +.5));   
         shieldwatch_FrameDuration:SetText(shieldstore[shieldwatch_slotdisplayed].shieldduration.."s");
         if ((shieldwatch_Options["enabletimewarn"] and tonumber(shieldstore[shieldwatch_slotdisplayed].shieldduration) < shieldwatch_Options["timetowarn"]) or (shieldwatch_Options["enablepctwarn"] and shieldstore[shieldwatch_slotdisplayed].pct <shieldwatch_Options["pcttowarn"])) then
            shieldwatch_timewarn = not shieldwatch_timewarn;
            if (shieldwatch_timewarn) then
               if (shieldwatch_Options["enabletimewarn"] and tonumber(shieldstore[shieldwatch_slotdisplayed].shieldduration) < shieldwatch_Options["timetowarn"]) then
                  shieldwatch_FrameDuration:SetTextColor(1,.3,.3,1);
               end   
               if (shieldwatch_Options["enablepctwarn"] and shieldstore[shieldwatch_slotdisplayed].pct < shieldwatch_Options["pcttowarn"]) then
                  shieldwatch_BarText:SetTextColor(1,.3,.3,1);
               end   
               if (shieldwatch_Options["flashborder"]) then
                  shieldwatch_Frame:SetBackdropBorderColor(1,.3,.3,1);
               end   
            else
               shieldwatch_FrameDuration:SetTextColor(1,1,1,1);            
               shieldwatch_Frame:SetBackdropBorderColor(1,1,1,1);
               shieldwatch_BarText:SetTextColor(1,1,1,1);
            end
         end
      end             
      shieldwatch_elapsed= 0; 	
  end 
end


function shieldwatch_shielddown(spellid,spelldata)
  if (spellid==53601) then  -- fix for Sacred shield spell and actual shield having same name.
     return
  end;   
  if (shieldstore[spelldata.slot]) then
    if (spelldata.slot==shieldwatch_slotdisplayed) then -- fix for Blizz sending the remove aura before the last bit of damage
    -- we don't remove the shield now, but flag if for removal on the next Onupdate process
        shieldstore[spelldata.slot].pendingdestroy=1;
        -- set the timer for the next Onupdate processing to happen in 1/10 of a sec (when the counter reaches 0.25)
        -- hopefully that gives the server a chance to send us
        -- the last bit of damage before we remove it, while still not having the shield hang around too long.
        shieldwatch_elapsed = 0.15;
    else
        shieldstore[spelldata.slot].shieldat = -1;
        shieldwatch_update(spelldata.slot);
    end  
  end    
end

function shieldwatch_shielddmg(amount,school)
  local i=1;
  if (school) then
     school= tonumber(school);
  else
     school = 0;
  end
shieldwatch_debug("dmg is school: "..tostring(school));        
  while (i <= shieldstore_slotmax and amount > 0) do
    if (shieldstore[i] and (not shieldstore[i].school or (bit.band(shieldstore[i].school,school)))) then
       shieldstore[i].shieldat = shieldstore[i].shieldat - amount;
       if (shieldstore[i].shieldat < 0) then
         amount = - shieldstore[i].shieldat;
       else
         amount = 0;
       end    
       if (i == shieldwatch_slotdisplayed) then 
          shieldwatch_update(i);
       end      
    end
    i=i+1;
  end
  if ( amount > 0 ) then
     shieldwatch_debug("dmg not allocated to a shield!: "..tostring(amount));
  end     
end

function shieldwatch_update(slot)
if (shieldstore[slot].shieldat > -1 ) then
   shieldstore[slot].shieldduration = tostring(floor(shieldstore[slot].shieldexpires - GetTime() +.5));
   shieldwatch_timewarn=false;
   shieldwatch_FrameDuration:SetText(shieldstore[slot].shieldduration.."s");
   shieldwatch_FrameDuration:SetTextColor(1,1,1,1);
   shieldwatch_Frame:SetBackdropBorderColor(1,1,1,1);
   shieldwatch_BarText:SetTextColor(1,1,1,1);
   local pct = floor((shieldstore[slot].shieldat / shieldstore[slot].shieldmax * 100) + 0.5);
   shieldstore[slot].pct = pct;

   shieldwatch_BarText:SetText(tostring(pct).."% ("..tostring(shieldstore[slot].shieldat)..")");
   shieldwatch_Bar:SetValue(pct)
else
   shieldstore[slot]=nil;
   -- check if any other shields currently up...
   local i=1;
   local found=false;
   while (i<=shieldstore_slotmax and not found) do
      if (shieldstore[i]) then
         found=true;
         shieldwatch_slotdisplayed=i;
         shieldwatch_FrameIcon1:SetTexture("Interface\\Icons\\"..shieldstore[i].icon);
         shieldwatch_Bar:SetStatusBarColor(shieldstore[i].r,shieldstore[i].g,shieldstore[i].b,1);
      end
      i=i+1;   
   end
   if (found) then
      shieldwatch_update(shieldwatch_slotdisplayed);
   else
     shieldwatch_slotdisplayed=nil;      
     shieldwatch_Frame:Hide();
     shieldwatch_BarText:SetText("no shield");
     shieldwatch_Bar:SetValue(0)
   end
end        
end

function shieldwatch_onevent(self,event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15)
      if (event=='COMBAT_LOG_EVENT_UNFILTERED') then
-- only interested in events that effect me...
-- shieldwatch_debug(arg6); 
         -- Misdirection stuff - spellid 34477
          if (shieldwatch_Options["mdchannel"]~="OFF" and arg3==shieldwatch_MyGUID and arg2=="SPELL_CAST_SUCCESS" and arg9==34477) then
             local t=UnitName("target");
             if (t and UnitIsEnemy("target","player")) then
               SendChatMessage(t.. " misdirected to "..arg7,shieldwatch_Options['mdchannel']);   
             else
               SendChatMessage("Misdirecting next target to "..arg7,shieldwatch_Options['mdchannel']);   
             end
          elseif (arg6~= shieldwatch_MyGUID) then
             return  -- quick exit if not of interest, since so much data passes via this event
          end
           if ((arg2== 'SPELL_AURA_APPLIED' or arg2=='SPELL_AURA_REFRESH') and shieldwatch_SPELLS[arg10]) then
              shieldwatch_shieldup(arg9,shieldwatch_SPELLS[arg10],arg3);
           elseif (tostring(arg9)=='ABSORB') then  -- melee absorbed
              shieldwatch_shielddmg(tonumber(arg10),0);
           elseif (tostring(arg12)=='ABSORB') then -- ranged absorbed
              shieldwatch_shielddmg(tonumber(arg13),arg11);
           elseif (arg2== 'ENVIRONMENTAL_DAMAGE' and arg15 and tonumber(arg15) > 0) then -- environment absorbed
              shieldwatch_shielddmg(tonumber(arg15),arg12);
           elseif (arg2== 'SPELL_AURA_REMOVED' and shieldwatch_SPELLS[arg10]) then
              shieldwatch_shielddown(arg9,shieldwatch_SPELLS[arg10]);
           elseif ((arg2== 'SPELL_HEAL' or arg2=='SPELL_PERIODIC_HEAL') and arg14) then
-- shieldwatch_debug("heal "..tostring(arg12).." - "..tostring(arg13).." - "..tostring(arg14));
              shieldwatch_lastcritheal=tonumber(arg12);
           end
           return
              
      elseif (event=='PLAYER_ENTERING_WORLD') then
            if (not shieldwatch_Options) then
               shieldwatch_Options = {};
-- set default options here               
               shieldwatch_Options["Lock"]=false;
               shieldwatch_Options["scale"]=1;
            end
            if (not shieldwatch_Options["version"] or shieldwatch_Options["version"] < 1.13) then
-- options new in this version
               shieldwatch_Options["timetowarn"]=4;
               shieldwatch_Options["enabletimewarn"]=true;
               shieldwatch_Options["pcttowarn"]=21;
               shieldwatch_Options["enablepctwarn"]=true;
               shieldwatch_Options["flashborder"]=true;
               shieldwatch_Options["version"]=1.13;            
               if (not shieldwatch_Options["scale"]) then
                  shieldwatch_Options["scale"]=1;
               end
            end
            if (shieldwatch_Options["version"] < 1.3) then
-- options new in this version
               shieldwatch_Options["mdchannel"]='OFF';
               shieldwatch_Options["version"]=1.3;            
            end
            shieldwatch_setscale(tonumber(shieldwatch_Options["scale"]));  
            shieldwatch_classinit(self);
            self:UnregisterEvent("PLAYER_ENTERING_WORLD");

           CreateFrame( "GameTooltip", "shieldwatchTooltip" ); -- Tooltip name cannot be nil
           shieldwatchTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
           shieldwatchTooltip:AddFontStrings(
           shieldwatchTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
           shieldwatchTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
  
	         UIDropDownMenu_Initialize(shieldwatch_FrameDropDown, shieldwatch_InitDropDown, "MENU");
	    
	         shieldwatch_Bar:SetMinMaxValues(0,100);  
	           
      elseif (event=='CHAT_MSG_ADDON') then
      -- addon msg received
shieldwatch_debug(tostring(GetTime())..":addonmsg from "..tostring(arg4).." in "..tostring(arg3).." ("..tostring(arg1)..") "..tostring(arg2));

      elseif (event=='PLAYER_LEVEL_UP' or event=='PLAYER_TALENT_UPDATE') then
          shieldwatch_debug("event fired: "..event);
      -- levelling or talent changes/dual spec may change the shield values , so empty our cache and recheck the talents
         shieldpower = {};
         if (shieldwatch_slotdisplayed) then 
            shieldwatch_checkcurrentbuffs();
         end
         shieldwatch_donetalentcheck=false;       
      end
end

function shieldwatch_checkcurrentbuffs()
-- see if the buffs the player currently has match our shieldstore info
  local i=1
  local havebuffs = true;
  while (i <= shieldstore_slotmax and havebuffs) do
     if (shieldstore[i] and shieldstore[i].shieldspell) then
         local spellname,spellrank = GetSpellInfo(shieldstore[i].shieldspell);
         havebuffs = UnitBuff("player",spellname,spellrank);         
     end
     i=i+1;  
  end   
  if (not havebuffs) then -- a buff was missing, therefore assume all shields are down
     shieldstore={};
     shieldwatch_slotdisplayed=nil;      
     shieldwatch_Frame:Hide();
     shieldwatch_BarText:SetText("no shield");
     shieldwatch_Bar:SetValue(0);
  end
end


function shieldwatch_lockmenu()
		shieldwatch_Options["Lock"] = not shieldwatch_Options["Lock"];
end

function shieldwatch_print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("shieldwatch "..msg, 0.7, 0.7, 1.0);
end

function shieldwatch_debug(msg)
if (shieldwatch_debugmsgs) then
    DEFAULT_CHAT_FRAME:AddMessage("shieldwatch DEBUG: "..msg, 0.5, 0.5, 1.0);
end
end