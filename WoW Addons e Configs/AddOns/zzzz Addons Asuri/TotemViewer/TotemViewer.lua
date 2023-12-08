local Totems = {
    ["Totems"] = {
      [GetSpellInfo(8170)] = [[Interface\Icons\Spell_nature_diseasecleansingtotem]], --Cleansing Totem
      [GetSpellInfo(2484)] = [[Interface\Icons\Spell_nature_strengthofearthtotem02]], --Earthbind Totem
      [GetSpellInfo(8177)] = [[Interface\Icons\Spell_nature_groundingtotem]], --Grounding Totem
      [GetSpellInfo(8143)] = [[Interface\Icons\Spell_nature_tremortotem]], --Tremor Totem
	  [GetSpellInfo(16190)] = [[Interface\Icons\Spell_frost_summonwaterelemental]], --Mana Tide Totem
	  [GetSpellInfo(58774).." VIII"] = [[]],--[[Interface\Icons\Spell_nature_manaregentotem]] --Mana Spring Totem VIII
      [GetSpellInfo(58734).." VII"] = [[]],--[[Interface\Icons\Spell_fire_selfdestruct]] --Magma Totem VII
      [GetSpellInfo(58739).." VI"] = [[]],--[[Interface\Icons\Spell_fireresistancetotem_01]] --Fire Resistance Totem VI
      [GetSpellInfo(58656).." VIII"] = [[]],--[[Interface\Icons\Spell_nature_guardianward]] --Flametongue Totem VIII
      [GetSpellInfo(58745).." VI"] = [[]],--[[Interface\Icons\Spell_frostresistancetotem_01]] --Frost Resistance Totem VI
      [GetSpellInfo(58757).." IX"] = [[]],--[[Interface\Icons\Inv_spear_04]] --Healing Stream Totem IX
      [GetSpellInfo(58749).." VI"] = [[]],--[[Interface\Icons\Spell_nature_natureresistancetotem]] --Nature Resistance Totem VI
      [GetSpellInfo(58704).." X"] = [[]],--[[Interface\Icons\Spell_fire_searingtotem]] --Searing Totem X
      [GetSpellInfo(6495)] = [[]],--[[Interface\Icons\Spell_nature_removecurse]] --Sentry Totem
      [GetSpellInfo(58582).." X"] = [[]],--[[Interface\Icons\Spell_nature_stoneclawtotem]] --Stoneclaw Totem X
      [GetSpellInfo(58753).." X"] = [[]],--[[Interface\Icons\Spell_nature_stoneskintotem]] --Stoneskin Totem X
      [GetSpellInfo(58643).." VIII"] = [[]],--[[Interface\Icons\Spell_nature_earthbindtotem]] --Strength of Earth Totem VIII
      [GetSpellInfo(57722).." IV"] = [[]],--[[Interface\Icons\Spell_fire_totemofwrath]] --Totem of Wrath IV
      [GetSpellInfo(8512)] = [[]],--[[Interface\Icons\Spell_nature_windfury]] --Windfury Totem
      [GetSpellInfo(3738)] = [[]],--[[Interface\Icons\Spell_nature_slowingtotem]] --Wrath of Air Totem
	  [GetSpellInfo(2062)] = [[]],--[[Interface\Icons\Spell_nature_earthelemental_totem]] --Earth Elemental Totem
	  [GetSpellInfo(2894)] = [[]],--[[Interface\Icons\Spell_fire_elemental_totem]] --Fire Elemental Totem
   },
    ["Plates"] = {},
}
local function UpdateObjects(hp)
   frame = hp:GetParent()
   local threat, hpborder, cbshield, cbborder, cbicon, overlay, oldname, level, bossicon, raidicon, elite = frame:GetRegions()
   local name = oldname:GetText()

   overlay:SetAlpha(1)
   threat:Show()
   hpborder:Show(1)
   oldname:Show(1)
   level:Show()
   hp:SetAlpha(1)
   
   if frame.totem 
   then 
   frame.totem:Hide() 
   end

for totemname,totemicon in pairs(Totems["Totems"]) do
         if name == totemname 
		 then
         overlay:SetAlpha(0)
         threat:Hide()
         hpborder:Show()
         oldname:Hide()
         level:Hide()
         hp:SetAlpha(0)
         if not frame.totem then
            frame.totem = frame:CreateTexture(nil, "BACKGROUND")
            frame.totem:ClearAllPoints()
			local healthbar = frame:GetChildren()
			frame.totem:SetPoint("BOTTOM", healthbar, "TOP", 15, 15)
         else
            frame.totem:Show()
         end   
         frame.totem:SetTexture(totemicon)
         frame.totem:SetWidth(40)
         frame.totem:SetHeight(40)
		 frame.totem:SetAlpha(1)
         end
    end
end

local function SkinObjects(frame)
   local HealthBar = frame:GetChildren()
   HealthBar:HookScript("OnShow", UpdateObjects)
   HealthBar:HookScript("OnSizeChanged", UpdateObjects)

   UpdateObjects(HealthBar)
   Totems["Plates"][frame] = true
end

local select = select
local function HookFrames(...)
   for index = 1, select('#', ...) do
      local frame = select(index, ...)
      local region = frame:GetRegions()

      if not Totems["Plates"][frame] 
	  and not frame:GetName() 
	  and region 
	  and region:GetObjectType() == "Texture" 
	  and region:GetTexture() == "Interface\\TargetingFrame\\UI-TargetingFrame-Flash" 
	  then
         SkinObjects(frame)                  
         frame.region = region
      end
   end
end

local numChildren = -1
local Frame = CreateFrame("Frame")
Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
Frame:SetScript("OnUpdate", function()
	if ( WorldFrame:GetNumChildren() ~= numChildren ) then
		numChildren = WorldFrame:GetNumChildren()
		HookFrames(WorldFrame:GetChildren())      
	end
end)