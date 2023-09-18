--[[ my notes

grounding totem similar to reflect
killing blow for warr only
display what my intervene takes
revenge stun proc, warlock nightfall glyph
imp hs, hs glyph
warlock eradication (spell haste)
druid aoe taunt and dk/pal taunt etc
mage spell steal like sham purge
2 diff type of dispell resists

warnings on adrenaline rush
reckless 
shield wall
retal if rogue

3/13 13:54:39.633  UNIT_DIED,0x0000000000000000,nil,0x80000000,0xF13000172504787F,"Grounding Totem",0x2111
totem dying, add totem stomp warnings for all diff events

spell reflects on others, intervenes

--]]


function SpellNotifications_OnLoad()
_,SpellNotifications_Class = UnitClass("player");
this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
this:RegisterEvent("UNIT_HEALTH");
this:RegisterEvent("PLAYER_TARGET_CHANGED");
this:RegisterEvent("PLAYER_REGEN_DISABLED"); -- enter combat
this:RegisterEvent("PLAYER_REGEN_ENABLED"); -- leave combat
this:RegisterEvent("PLAYER_ENTERING_WORLD");
end

function SpellNotifications_OnEvent(event,...)

if event=="PLAYER_ENTERING_WORLD" then
	COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"].show = nil;
	COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"].show = nil;
	COMBAT_TEXT_TYPE_INFO["HEAL"].show = nil;
	COMBAT_TEXT_TYPE_INFO["DAMAGE_CRIT"].show = nil;
	COMBAT_TEXT_TYPE_INFO["DAMAGE"].show = nil;
	COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE"].show = nil;
	COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE_CRIT"].show = nil;
	COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"].show = nil;
	COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"].show = nil;
	COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"].show = nil;
end

local timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags = select(1,...)
--        1       2        3           4            5          6         7          8

if type=="SPELL_CAST_SUCCESS" or type=="SPELL_AURA_REMOVED" then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if spellName=="Abolish Poison" or spellName=="Abolish Disease" then
			if type=="SPELL_CAST_SUCCESS" then
				SpellNotifications_Abolished[destName] = true
			else
				SpellNotifications_Abolished[destName] = false
			end
		end
	end
end

if (type=="SPELL_DISPEL") then
	local spellName,_,_,extraSpellName = select(10,...)
	if spellName=="Abolish Poison" or spellName=="Abolish Disease" then
		if SpellNotifications_Abolished[destName] ~= nil then
			if SpellNotifications_Abolished[destName] then
				if bit.band(destFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0 then
					SpellNotifications_DisplaySmall("Dispelled "..extraSpellName..".","white") -- friendly target
					SendChatMessage("Dispelled "..extraSpellName..".", "PARTY");
				end
			end
		end
	end
end

if (type=="SPELL_DISPEL") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName,_,_,extraSpellName = select(10,...)
		if spellName~="Abolish Poison" and spellName~="Abolish Disease" then
			if bit.band(destFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0 then
				SpellNotifications_DisplaySmall("Dispelled "..extraSpellName..".","white") -- friendly target
				SendChatMessage("Dispelled "..extraSpellName..".", "PARTY");
			else
				SpellNotifications_DisplaySmall("Dispelled "..extraSpellName..".","yellow") -- enemy target
				SendChatMessage("Dispelled "..extraSpellName..".", "PARTY");
			end
		end
	end
end

if (type=="SPELL_STOLEN") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName,_,_,extraSpellName = select(10,...)
		SpellNotifications_DisplaySmall("Stole "..extraSpellName..".","yellow") -- enemy target
	end
end

if (type=="SPELL_DAMAGE") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (spellName=="Unfair Advantage") then
			SpellNotifications_PlaySound("cling")
		end
	end
end

--1/23 12:17:59.705  SPELL_AURA_REMOVED,0x0500000003581096,"Cowpun",0x511,0x0500000003581096,"Cowpun",0x511,49281,"Lightning Shield",0x8,BUFF
if (type=="SPELL_AURA_REMOVED") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (spellName=="Lightning Shield") then
			SpellNotifications_PlaySound("buzz")
		end
	end
end

if (type=="SPELL_AURA_APPLIED") or (type=="SPELL_AURA_APPLIED_DOSE") or (type=="SPELL_EXTRA_ATTACKS") then
	if bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellId,spellName = select(9,...)
		if (type=="SPELL_AURA_APPLIED_DOSE") then
			amount = select(13,...)
		end
		
		--Death Knight
		if (spellName=="Killing Machine") then
			--SpellNotifications_DisplayBig("Killing Machine!","green") -- or say icy touch maybe
			--SpellNotifications_PlaySound("cling")
		elseif (spellName=="Freezing Fog") then
			SpellNotifications_DisplayBig("Howling Blast!","blue")
			SpellNotifications_PlaySound("ding")
		elseif (spellName=="Death Trance!") then
			SpellNotifications_DisplayBig("Death Coil!","green")
			SpellNotifications_PlaySound("ding")
		
		--Druid
		elseif (spellId==48517) then
			SpellNotifications_DisplayBig("Wrath!","green")
			SpellNotifications_PlaySound("ding")
		elseif (spellId==48518) or (spellName=="Wrath of Elune") then
			SpellNotifications_DisplayBig("Starfire!","green")
			SpellNotifications_PlaySound("ding")
		elseif (spellName=="Nature's Grace") then
			SpellNotifications_PlaySound("cling")
		elseif (spellName=="Clearcasting") and (SpellNotifications_Class=="DRUID") then
			SpellNotifications_DisplayBig("Clearcast!","green")
			SpellNotifications_PlaySound("ding")
		
		--Hunter
		elseif (spellName=="Lock and Load") then
			SpellNotifications_DisplayBig("Arcane Shot!","green") -- maybe say lock n load for explosive shot also
			SpellNotifications_PlaySound("ding")
		
		--Mage
		elseif (spellName=="Clearcasting") and (SpellNotifications_Class=="MAGE") then
			--SpellNotifications_DisplayBig("Clearcast!","green")
			--SpellNotifications_PlaySound("cling")
		elseif (spellName=="Fingers of Frost") then
			--SpellNotifications_DisplayBig("Fingers of Frost!","blue")
			SpellNotifications_PlaySound("cling")
		elseif (spellName=="Fireball!") then
			--SpellNotifications_DisplayBig("Fireball!","orange")
			--SpellNotifications_PlaySound("ding")
		elseif (spellName=="Firestarter") then
			SpellNotifications_DisplayBig("Flamestrike!","orange")
			SpellNotifications_PlaySound("ding")
		elseif (spellName=="Hot Streak") then
			SpellNotifications_DisplayBig("Pyroblast!","orange")
			SpellNotifications_PlaySound("ding")
		elseif (spellName=="Missile Barrage") then
			--SpellNotifications_DisplayBig("Arcane Missiles!","green")
			--SpellNotifications_PlaySound("ding")
		
		--Paladin
		
		--Priest
		
		--Rogue
		elseif (spellName=="Sword Specialization") or (spellName=="Hand of Justice") or (string.find(spellName,"Thrash")) then
			SpellNotifications_PlaySound("cling")
		
		--Shaman
		elseif (spellName=="Maelstrom Weapon") and (amount==5) and (type=="SPELL_AURA_APPLIED_DOSE") then
			--SpellNotifications_DisplayBig("Maelstrom!","green")
			SpellNotifications_PlaySound("ding")
		
		--Warlock
		elseif (spellName=="Shadow Trance") then
			--SpellNotifications_DisplayBig("Shadow Bolt!","purple")
			--SpellNotifications_PlaySound("ding")
		elseif (spellName=="Backlash") then
			SpellNotifications_DisplayBig("Incinerate!","orange")
			SpellNotifications_PlaySound("ding")
		
		--Warrior
		elseif (spellName=="Sword and Board") then
			SpellNotifications_DisplayBig("Shield Slam!","green")
			SpellNotifications_PlaySound("ding")
		elseif (spellName=="Slam!") then
			--SpellNotifications_DisplayBig("Slam!","green")
			--SpellNotifications_PlaySound("ding")
		elseif (spellName=="Sudden Death") then
			--SpellNotifications_DisplayBig("Execute!","green")
			--SpellNotifications_PlaySound("cling")
		elseif spellName=="Taste for Blood" then
			--SpellNotifications_DisplayBig("Overpower!","green")
			--SpellNotifications_PlaySound("ding")
		
		end
	end
end

--1/12 20:09:21.644  SPELL_AURA_APPLIED,0x0500000003580F5F,"Veev",0x511,0xF130007F9A002B25,"Expert's Training Dummy",0x10a28,64382,"Shattering Throw",0x1,DEBUFF
if (type=="SPELL_AURA_APPLIED") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (spellName=="Improved Hamstring") or (spellName=="Glyph of Hamstring") then
			SpellNotifications_PlaySound("cling")
		end
	end
end



--4/27 18:22:29.177  SPELL_MISSED,0x05000000027EF48C,"Veev",0x511,0x050000000285EB2D,"Valrathlol",0x10548,1715,"Hamstring",0x1,DODGE
--1/12 20:09:21.644  SPELL_AURA_APPLIED,0x0500000003580F5F,"Veev",0x511,0xF130007F9A002B25,"Expert's Training Dummy",0x10a28,64382,"Shattering Throw",0x1,DEBUFF
if (SpellNotifications_Class=="WARRIOR") then
	if (type=="SWING_MISSED") or (type=="SPELL_MISSED") then
		if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
			if (type=="SWING_MISSED") then
				missType = select(9,...)
			else
				missType = select(12,...)
			end
			if (missType=="DODGE") then
				--SpellNotifications_PlaySound("ding")
			end
		end
	elseif type=="SPELL_AURA_APPLIED" then
		if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
			local spellName = select(10,...)
			if (spellName=="Shattering Throw") then
				--SendChatMessage("Shattering Throw up on "..destName.."!", "YELL");
			end
		end
	end
end


--3/13 14:00:54.839  SPELL_PERIODIC_DAMAGE,0x000000000280B239,"Vèéx",0x511,0x0000000002967F3C,"Yødå",0x10548,47857,"Drain Life",0x20,414,0,32,46,0,0,nil,nil,nil
--3/13 14:01:00.244  SPELL_PERIODIC_LEECH,0x000000000280B239,"Vèéx",0x511,0x0000000002967F3C,"Yødå",0x10548,5138,"Drain Mana",0x20,389,0,389
if (type=="SPELL_CAST_SUCCESS") or (type=="SPELL_PERIODIC_DAMAGE") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (spellName=="Drain Soul") or (spellName=="Mind Flay") then
			if (type=="SPELL_CAST_SUCCESS") then
				SpellNotifications_DrainCount = 0
			elseif (type=="SPELL_PERIODIC_DAMAGE") then
				SpellNotifications_DrainCount = SpellNotifications_DrainCount + 1
				if (SpellNotifications_DrainColor=="orange") or (SpellNotifications_DrainColor==nil) then
					SpellNotifications_DrainColor = "blue"
				elseif (SpellNotifications_DrainColor=="blue") then
					SpellNotifications_DrainColor = "purple"
				elseif (SpellNotifications_DrainColor=="purple") then
					SpellNotifications_DrainColor = "red"
				elseif (SpellNotifications_DrainColor=="red") then
					SpellNotifications_DrainColor = "orange"
				end
				SpellNotifications_DisplaySmall("Tick "..SpellNotifications_DrainCount..".",SpellNotifications_DrainColor)
				if (spellName=="Drain Soul") then
					SpellNotifications_PlaySound("bell")
				end
			end
		end
	end
end


if (event=="UNIT_HEALTH") then
	if (not SpellNotifications_ExecuteWarn) then
		if (UnitClassification("target")=="worldboss") then
			if (SpellNotifications_Class=="WARLOCK") then
				if (((UnitHealth("target") / UnitHealthMax("target")) * 100) <= 25) then
					RaidNotice_AddMessage(RaidBossEmoteFrame, "Drain Soul now!", ChatTypeInfo["RAID_WARNING"])
					SpellNotifications_PlaySound("lock_execute")
					SpellNotifications_ExecuteWarn = true;
				end
			end
		end
	end
end

if (event=="PLAYER_TARGET_CHANGED") then
	SpellNotifications_ExecuteWarn = false;
end



	
if (type=="SPELL_INTERRUPT") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local extraSchool = select(14,...)
		if (extraSchool==1) then
			SpellSchool = "physical"
		elseif (extraSchool==2) then
			SpellSchool = "holy"
		elseif (extraSchool==4) then
			SpellSchool = "fire"
		elseif (extraSchool==8) then
			SpellSchool = "nature"
		elseif (extraSchool==12) then
			SpellSchool = "firestorm"
		elseif (extraSchool==16) then
			SpellSchool = "frost"
		elseif (extraSchool==20) then
			SpellSchool = "frostfire"
		elseif (extraSchool==24) then
			SpellSchool = "froststorm"
		elseif (extraSchool==32) then
			SpellSchool = "shadow"
		elseif (extraSchool==40) then
			SpellSchool = "shadowstorm"
		elseif (extraSchool==48) then
			SpellSchool = "shadowfrost"
		elseif (extraSchool==64) then
			SpellSchool = "arcane"
		elseif (extraSchool==68) then
			SpellSchool = "spellfire"
		else
			SpellSchool = "unknown spell school"
		end
		if SpellSchool==nil then
			SpellSchool = "unknown spell school"
		end
		SpellNotifications_DisplaySmall("Interrupted "..SpellSchool..".","green")
	end
end


--4/25 02:32:33.564  SPELL_AURA_APPLIED,0x0500000000284BB9,"Galdin-Black Dragonflight",0x528,0x05000000020F9CC7,"Nerishana-Steamwheedle Cartel",0x514,64850,"Unrelenting Assault",0x1,DEBUFF
if (type=="SPELL_AURA_APPLIED") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (spellName=="Unrelenting Assault") then
			SpellNotifications_DisplaySmall("Reduced spell power.","green")
		end
	end
end




if (type=="SPELL_MISSED") then
--	if (bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0) or (bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_PARTY) > 0) then
	if (bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0) then
		local spellName,_,missType = select(10,...)
		if (missType=="REFLECT") then
			SpellNotifications_DisplaySmall("Reflected "..spellName..".","white")
			SendChatMessage("Reflected "..spellName..".", "PARTY");
		elseif (destName=="Grounding Totem") and (bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0) then
			SpellNotifications_DisplaySmall("Grounded "..spellName..".","white")
			SendChatMessage("Grounded "..spellName..".", "PARTY");
		end
	end
end
if (type=="SPELL_DAMAGE") then
	if bit.band(destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		local spellName = select(10,...)
		if (destName=="Grounding Totem") then
			SpellNotifications_DisplaySmall("Grounded "..spellName..".","white")
			SendChatMessage("Grounded "..spellName..".", "PARTY");
		end
	end
end



if (type=="SPELL_MISSED") then
	if bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) > 0 then
		if (destGUID==UnitGUID("target")) or (destGUID==UnitGUID("targettarget")) or (destGUID==UnitGUID("focus")) or (destGUID==UnitGUID("player")) or (destGUID==UnitGUID("pet")) or (destGUID==UnitGUID("pettarget")) or (destGUID==UnitGUID("mouseover")) or (destGUID==UnitGUID("mouseovertarget")) or (destGUID==UnitGUID("arena1")) or (destGUID==UnitGUID("arena2")) or (destGUID==UnitGUID("arena3")) or (destGUID==UnitGUID("arena4")) or (destGUID==UnitGUID("arena5")) or (destGUID==UnitGUID("party1")) or (destGUID==UnitGUID("party2")) or (destGUID==UnitGUID("party3")) or (destGUID==UnitGUID("party4")) or (destGUID==UnitGUID("party5")) then -- makes sure dest targ wasn't some random aoe
			local spellName,_,missType = select(10,...)
			local lowspell = string.lower(spellName)
			
			if (string.find(lowspell,"pvp trinket")) or (string.find(lowspell,"every man for himself")) or (string.find(lowspell,"soul fragment")) or (string.find(lowspell,"chaos bane")) or (string.find(lowspell,"frostforged")) or (string.find(lowspell,"berserk"))
			--Death Knight
			
			--Druid
			
			--Hunter
			
			--Mage
			or (string.find(lowspell,"frostbite")) or ((string.find(lowspell,"deep freeze")) and missType=="IMMUNE") or (string.find(lowspell,"frost nova")) or (string.find(lowspell,"shattered barrier")) or (string.find(lowspell,"waterbolt"))
			
			--Paladin
			or (string.find(lowspell,"seal of "))
			
			--Priest
			
			--Rogue
			or (string.find(lowspell," poison"))
			
			--Shaman
			
			--Warlock
			or (string.find(lowspell,"torment")) or (string.find(lowspell,"shadow bite"))
			
			--Warrior			
			or (string.find(lowspell,"retaliation")) or (string.find(lowspell,"gag order")) or (string.find(lowspell,"heroic strike")) or (string.find(lowspell,"cleave")) or (string.find(lowspell,"deep wound")) or (string.find(lowspell,"enrage")) or (string.find(lowspell,"taste for blood"))
			
			then
				return;
			end
				
			if (string.find(lowspell,"charge")) then
				spellName = "Charge"
			elseif (string.find(lowspell,"intercept")) then
				spellName = "Intercept"
			end				
			if (missType=="ABSORB") then
				return;
			elseif (destName=="Grounding Totem") then
				ResistMethod = "grounded"
				MySpellGrounded = true;
			elseif (missType=="REFLECT") then
				ResistMethod = "reflected"
				MySpellReflected = true;
			elseif (missType=="IMMUNE") then
				ResistMethod = "immune"
			elseif (missType=="EVADE") then
				ResistMethod = "evaded"
			elseif (missType=="PARRY") then
				ResistMethod = "parried"
			elseif (missType=="DODGE") then
				ResistMethod = "dodged"
			elseif (missType=="BLOCK") then
				ResistMethod = "blocked"
			elseif (missType=="DEFLECT") then
				ResistMethod = "deflected"
			elseif (missType=="RESIST") then
				ResistMethod = "resisted"
			end
			
			if (ResistMethod=="immune") and (spellName=="Shattering Throw") then
				SpellNotifications_DisplayBig("Shattered!","green")	
				return;
			end
			
			if (ResistMethod=="immune") or (ResistMethod=="evaded") then
				SpellNotifications_DisplayBig(""..spellName.." "..ResistMethod..".","red")
			else
				SpellNotifications_DisplayBig(""..spellName.." "..ResistMethod..".","white")
				SpellNotifications_PlaySound("thud")
			end
			if (ResistMethod ~= "immune") then
				if (spellName=="Mocking Blow") or (spellName=="Challenging Shout") or (spellName=="Taunt") or (spellName=="Growl") or (spellName=="Challenging Roar") then
					lowerspellName = string.lower(spellName)
					if (SpellNotifications_Class=="WARRIOR") or (SpellNotifications_Class=="DRUID") or (SpellNotifications_Class=="PALADIN") or (SpellNotifications_Class=="DEATHKNIGHT") then
						if (ResistMethod ~= "missed") then
							SendChatMessage("My "..lowerspellName.." was "..ResistMethod..".");
						else
							SendChatMessage("My "..lowerspellName.." "..ResistMethod..".");
						end
					end
				end
			end
		end
	end
end

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	





end



function SpellNotifications_DisplayBig(text,color)
ZoneTextString:SetText(text);
PVPInfoTextString:SetText("");
ZoneTextFrame.startTime = GetTime()
ZoneTextFrame.fadeInTime = 0
ZoneTextFrame.holdTime = 1
ZoneTextFrame.fadeOutTime = 2
if (color=="red") then
	ZoneTextString:SetTextColor(1,0,0);
elseif (color=="orange") then
	ZoneTextString:SetTextColor(1,0.5,0);
elseif (color=="yellow") then
	ZoneTextString:SetTextColor(1,1,0);
elseif (color=="green") then
	ZoneTextString:SetTextColor(0,1,0);
elseif (color=="blue") then
	ZoneTextString:SetTextColor(0,0.75,1);
elseif (color=="purple") then
	ZoneTextString:SetTextColor(1,0,1);
else -- white
	ZoneTextString:SetTextColor(1,1,1);
end
ZoneTextFrame:Show()
end

function SpellNotifications_DisplaySmall(text,color)
if (color=="red") then
	UIErrorsFrame:AddMessage(text,1,0,0);
elseif (color=="orange") then
	UIErrorsFrame:AddMessage(text,1,0.5,0);
elseif (color=="yellow") then
	UIErrorsFrame:AddMessage(text,1,1,0);
elseif (color=="green") then
	UIErrorsFrame:AddMessage(text,0,1,0);
elseif (color=="blue") then
	UIErrorsFrame:AddMessage(text,0,0.75,1);
elseif (color=="purple") then
	UIErrorsFrame:AddMessage(text,1,0,1);
else -- white
	UIErrorsFrame:AddMessage(text,1,1,1);
end
end

function SpellNotifications_PlaySound(sound)
PlaySoundFile("Interface\\AddOns\\SpellNotifications\\Sounds\\"..sound..".wav");
end

function SpellNotifications_ErrorsFrame_AddMessage(self,msg,...)
local lowermsg = string.lower(msg)
if (string.find(lowermsg,"not enough")) or (string.find(lowermsg,"not ready")) or (string.find(lowermsg,"nothing to attack")) or (string.find(lowermsg,"can't attack")) or (string.find(lowermsg,"can't do")) or (string.find(lowermsg,"unable to move")) or (string.find(lowermsg,"must equip")) or (lowermsg=="interrupted") or (string.find(lowermsg,"target is dead")) or (string.find(lowermsg,"invalid target")) or (string.find(lowermsg,"line of sight")) or (string.find(lowermsg,"you are dead")) or (string.find(lowermsg,"no target")) or (string.find(lowermsg,"another action")) or (string.find(lowermsg,"you are stunned")) or (string.find(lowermsg,"wrong way")) or (string.find(lowermsg,"out of range")) or (string.find(lowermsg,"front of you")) or (string.find(lowermsg,"you cannot attack")) or (string.find(lowermsg,"too far away")) or (string.find(lowermsg,"must be in")) or (string.find(lowermsg,"too close")) or (string.find(lowermsg,"requires combo")) or (string.find(lowermsg,"in combat")) or (string.find(lowermsg,"not in control")) or (string.find(lowermsg,"must have")) or (string.find(lowermsg,"nothing to dispel")) or (string.find(lowermsg,"in an arena")) or (string.find(lowermsg,"while pacified")) then
	return; 
end 
return self:SpellNotifications_Orig_AddMessage(msg,...); 
end 
 
function SpellNotifications_HookErrorsFrame() 
local ef = getglobal("UIErrorsFrame"); 
ef.SpellNotifications_Orig_AddMessage = ef.AddMessage; 
ef.AddMessage = SpellNotifications_ErrorsFrame_AddMessage; 
end
