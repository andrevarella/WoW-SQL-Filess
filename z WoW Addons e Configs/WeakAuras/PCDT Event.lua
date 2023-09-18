function WeakAuras(allstates, event, ...)
    
    local self, WeakAuras = aura_env, WeakAuras;
    
    if ( event == "OPTIONS" ) then
        
        if ( WeakAuras.IsOptionsOpen() and self.loadedSession ) then
            self.loadedSession = false;
            self:SaveCurrentSession();
        end
        
        self:InitNewMembers(allstates);
        self:LoadLastSession();
        self:CreateFrames(allstates);
        self:scheduleUpdateFrames(allstates, 0.05);
        
    elseif ( event == "WA_INIT" ) then
        self.loadedSession = true;
        WeakAuras.ScanEvents("INVISUS_COOLDOWNS", "CD_UPDATE");
    elseif ( self.loadedSession ) then
        if ( event == "RAID_ROSTER_UPDATE" or event == "PARTY_MEMBERS_CHANGED" ) then
            if ( UnitInRaid("player") and event == "PARTY_MEMBERS_CHANGED" ) then 
                return;
            end

            WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, 1, "WA_PARTY_MEMBERS_UPDATE");
        elseif ( event == "WA_PARTY_MEMBERS_UPDATE" ) then
            return self:InitNewMembers(allstates);
        elseif ( event == "INVISUS_COOLDOWNS" ) then
            local subEvent = ...;
            if ( subEvent == "CD_UPDATE" ) then
                self:InitNewMembers(allstates);
                self:LoadLastSession();
                self:CreateFrames(allstates);
                return true;
            elseif ( subEvent == "LibGroupTalents_Update" ) then
                local unit, unitName = select(2, ...);
                local guid = UnitGUID(unit);
                if ( unit and unitName and self.roster[guid] ) then
                    self:UnitIsDetected(unit, guid);
                    return self:CheckTalents(allstates, unit, guid);
                end
            elseif ( subEvent == "FRAME_UPDATE" ) then
                self:scheduleUpdateFrames(allstates, 0.5);
            end 
        elseif ( event == "WA_INSPECT_READY" and ... ) then
            local unit, guid, nilcheck = ...;
            
            if ( not nilcheck and CanInspect(unit, true) ) then
                NotifyInspect(unit);
                self:UnitIsDetected(unit, guid, true);
            elseif ( nilcheck ) then
                return self:UnitItemInit(allstates, unit, guid);
            else
                self:UnitIsDetected(unit, guid);
            end
        elseif ( event == "UNIT_INVENTORY_CHANGED" and ... ) then
            local unit = ...;
            local guid = UnitGUID(unit);
            if ( self.roster[guid] ) then
                self:UnitIsDetected(unit, guid);
            end
        elseif ( event == "UNIT_IS_VISIBLE" and ... ) then
            return self.UnitPetCDInit(allstates, ...);
        elseif ( event == "ZONE_CHANGED_NEW_AREA" ) then
            return self:Update(allstates)
        elseif ( event == "UNIT_PET" and ... ) then
            if ( not (...):match("party") ) then
                return;
            end

            local unit = ...;
            local guid = UnitGUID(unit);
            local petGUID = self.GetPetGUID(unit);

            if ( not petGUID ) then
                self:PetCooldownRemove(allstates, guid);
            else
                self:UnitPetCDInit(allstates, unit);
            end
            return true;
        -- elseif ( event == "UNIT_FACTION" or event == "UNIT_NAME_UPDATE" ) and ... then
        --     local unit = ...;
        --     local guid = UnitGUID(unit);
        --     if ( unit and (unit):match("partypet") ) then
        --         return self:UnitPetCDInit(allstates, guid);
        --     end
        elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" and ... ) then
            local _, subEvent, sourceGUID, _, _, destGUID, _, _, spellID, spellName, _, type = ...;
            if ( self:SpellIsDisplay(sourceGUID, spellID) ) then
                local GUID =self:SpellIsDisplay(sourceGUID, spellID);
                
                if ( subEvent == "SPELL_RESURRECT" or subEvent == "SPELL_CAST_SUCCESS" ) 
                and not self.blacklist[spellID] then
                    return self:EditState( allstates, GUID, spellID, subEvent, destGUID);
                elseif ( subEvent == "SPELL_AURA_REMOVED" ) then
                    return self:SetDesaturated(allstates, sourceGUID, spellID);
                elseif ( subEvent == "SPELL_AURA_APPLIED" and type == "BUFF" ) then 
                    local duration = select(6, UnitAura(self.roster[GUID].unitID, spellName));
                    return self:SetGlow(allstates, GUID, spellID, duration);
                end
                
            elseif ( subEvent == "UNIT_DIED" and self.pet_roster[destGUID] ) then 
                if ( self.pet_roster[destGUID].type == "Вурдалак" 
                    or self.pet_roster[destGUID].type == "Ghoul" ) then
                    return self:EditState(allstates, self.pet_roster[destGUID].unitGUID, 46584, subEvent);
                end
                
            elseif ( self.roster[sourceGUID] ) then
                return self:AdditionalVerification(allstates, subEvent, sourceGUID, spellID, destGUID);
            end
            
        elseif ( event == "UNIT_SPELLCAST_SUCCEEDED" and ... ) then
            local srcUnit, spellName = ...;
            local guid = UnitGUID(srcUnit);
            
            if ( self:SpellIsDisplay(guid, nil, spellName) ) then 
                local spellID = self.USS[spellName].id;
                if ( self.roster[guid].spells[spellID] ) then
                    return self:EditState(allstates, guid, spellID, event);
                end
            end
            
        elseif ( event == "PLAYER_LOGOUT" ) then
            self:SaveCurrentSession();
            self:scheduleUpdateFrames(allstates, 0.05);
        end
    end
end

