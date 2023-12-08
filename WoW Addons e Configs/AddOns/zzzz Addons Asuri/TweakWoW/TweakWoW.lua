
-- Console Variables

local LibSimpleOptions = LibStub("LibSimpleOptions-1.0")

-- Options

local function Options(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_PLEASECHOOSE)
end

-- GAME Options

local function OptionsGame(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_GAME)
	
	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			SetCVar("violencelevel", 2)	-- [1]
			SetCVar("screenshotQuality", 3)	-- [2]
			SetCVar("screenshotFormat", "jpeg")	-- [3]
			SetCVar("ObjectSelectionCircle", 1)	-- [4]
			SetCVar("alwaysCompareItems", 0)	-- [5]
			SetCVar("autoDismount", 1)	-- [6]
			SetCVar("autoDismountFlying", 1)	-- [7]
			SetCVar("autoStand", 1)	-- [8]
			SetCVar("autoUnshift", 1)	-- [9]
			ConsoleExec( "pitchlimit 89" )	-- [10] 
				TweakWoWDB.Pitchlimit = 'ONE'
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
	
	local TweakWowGameSlider1 = self:MakeSlider(	-- [1]
		'name', TWEAKWOW_VIOLENCELEVEL_TITLE,
	    'description', TWEAKWOW_VIOLENCELEVEL_DESCRIPTION,
	    'minText', '1',
	    'maxText', '5',
	    'minValue', 0,
	    'maxValue', 5,
	    'step', 1,
	    'default', 2,
		'getFunc', function(value) value = GetCVar("violencelevel")+0 return GetCVar("violencelevel")+0 end,
	    'setFunc', function(value) SetCVar("violencelevel", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowGameSlider2 = self:MakeSlider(	-- [2]
	    'name', TWEAKWOW_SCREENSHOTQUALITY_TITLE,
	    'description', TWEAKWOW_SCREENSHOTQUALITY_DESCRIPTION,
	    'minText', '1',
	    'maxText', '10',
	    'minValue', 1,
	    'maxValue', 10,
	    'step', 1,
	    'default', 3,
		'getFunc', function(value) value = GetCVar("screenshotQuality")+0 return GetCVar("screenshotQuality")+0 end,
	    'setFunc', function(value) SetCVar("screenshotQuality", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSlider2:SetPoint("TOPLEFT", TweakWowGameSlider1, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSlider3 = self:MakeDropDown(	-- [3]
	    'name', TWEAKWOW_SCREENSHOTFORMAT_TITLE,
	    'description', TWEAKWOW_SCREENSHOTFORMAT_DESCRIPTION,
	    'values', {
	        'jpeg', TWEAKWOW_SCREENSHOTFORMAT_OPT_ONE,
	        'tga', TWEAKWOW_SCREENSHOTFORMAT_OPT_TWO,
	     },
	    'default', 'jpeg',
		'getFunc', function() 
			return GetCVar("screenshotFormat") 
			end,
	    'setFunc', function(value)
			if value == 'jpeg' or value == 'tga' then SetCVar("screenshotFormat", value) end
			end)
	TweakWowGameSlider3:SetPoint("TOPLEFT", TweakWowGameSlider2, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSlider4 = self:MakeSlider(	-- [4]
	    'name', TWEAKWOW_OBJECTSELECTIONCIRCLE_TITLE,
	    'description', TWEAKWOW_OBJECTSELECTIONCIRCLE_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("ObjectSelectionCircle")+0 return GetCVar("ObjectSelectionCircle")+0 end,
	    'setFunc', function(value) SetCVar("ObjectSelectionCircle", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSlider4:SetPoint("TOPLEFT", TweakWowGameSlider3, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSlider5 = self:MakeSlider(	-- [5]
	    'name', TWEAKWOW_ALWAYSCOMPAREITEMS_TITLE,
	    'description', TWEAKWOW_ALWAYSCOMPAREITEMS_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 0,
		'getFunc', function(value) value = GetCVar("alwaysCompareItems")+0 return GetCVar("alwaysCompareItems")+0 end,
	    'setFunc', function(value) SetCVar("alwaysCompareItems", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSlider5:SetPoint("TOPLEFT", TweakWowGameSlider4, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSlider6 = self:MakeDropDown(	-- [TODO]
	    'name', TWEAKWOW_GXRESOLUTION_TITLE,
	    'description', TWEAKWOW_GXRESOLUTION_DESCRIPTION,
	    'values', {
	        'CURRENT', TWEAKWOW_GXRESOLUTION_CURRENT,
	        'UP', "-25%",
			'DOWN', "+25%",
	     },
	    'default', 'CURRENT',
		'getFunc', function() 
			return "CURRENT" 
			end,
	    'setFunc', function(value)
				SwitchRatio(value)
		end)
	TweakWowGameSlider6:SetPoint("TOPLEFT", TweakWowGameSlider5, "BOTTOMLEFT", 0, -25)		
	
	local TweakWowGameSliderb1 = self:MakeSlider(	-- [6]
	    'name', TWEAKWOW_AUTODISMOUNT_TITLE,
	    'description', TWEAKWOW_AUTODISMOUNT_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("autoDismount")+0 return GetCVar("autoDismount")+0 end,	
	    'setFunc', function(value) SetCVar("autoDismount", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSliderb1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 200, -25)	

	local TweakWowGameSliderb2 = self:MakeSlider(	-- [7]
	    'name', TWEAKWOW_AUTODISMOUNTFLYING_TITLE,
	    'description', TWEAKWOW_AUTODISMOUNTFLYING_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1, 
	    'default', 1,
		'getFunc', function(value) value = GetCVar("autoDismountFlying")+0 return GetCVar("autoDismountFlying")+0 end,
	    'setFunc', function(value) SetCVar("autoDismountFlying", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSliderb2:SetPoint("TOPLEFT", TweakWowGameSliderb1, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSliderb3 = self:MakeSlider(	-- [8]
	    'name', TWEAKWOW_AUTOSTAND_TITLE,
	    'description', TWEAKWOW_AUTOSTAND_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("autoStand")+0 return GetCVar("autoStand")+0 end,
	    'setFunc', function(value) SetCVar("autoStand", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSliderb3:SetPoint("TOPLEFT", TweakWowGameSliderb2, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSliderb4 = self:MakeSlider(	-- [9]
	    'name', TWEAKWOW_AUTOUNSHIFT_TITLE,
	    'description', TWEAKWOW_AUTOUNSHIFT_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("autoUnshift")+0 return GetCVar("autoUnshift")+0 end,
	    'setFunc', function(value) SetCVar("autoUnshift", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGameSliderb4:SetPoint("TOPLEFT", TweakWowGameSliderb3, "BOTTOMLEFT", 0, -25)	

	local TweakWowGameSliderb5 = self:MakeDropDown(	-- [10]
	    'name', TWEAKWOW_PITCHLIMIT_TITLE,
	    'description', TWEAKWOW_PITCHLIMIT_DESCRIPTION,
	    'values', {
	        'ONE', TWEAKWOW_PITCHLIMIT_OPT_ONE,
			'TWO', TWEAKWOW_PITCHLIMIT_OPT_TWO,
	     },
	    'default', 'ONE',
		'getFunc', function()
			return TweakWoWDB.Pitchlimit
			end,
	    'setFunc', function(value)
			if value == 'ONE' then 
				ConsoleExec( "pitchlimit 89" ) 
				TweakWoWDB.Pitchlimit = value
			else 
				if value == 'TWO' then 
					ConsoleExec( "pitchlimit 449" )
					TweakWoWDB.Pitchlimit = value
				end
			end
		end)
	TweakWowGameSliderb5:SetPoint("TOPLEFT", TweakWowGameSliderb4, "BOTTOMLEFT", 0, -25)	
	
end

-- SYNCHRONIZE Options

local function OptionsSynchronize(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_SYNCHRONIZE)
	
	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			SetCVar("synchronizeSettings", 1)	-- [1]
			SetCVar("synchronizeConfig", 1)	-- [2]
			SetCVar("synchronizeBindings", 1)	-- [3]
			SetCVar("synchronizeMacros", 1)	-- [4]	
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
	
	local TweakWowSynchronizeSlider1 = self:MakeSlider(	-- [1]
	    'name', TWEAKWOW_SYNCHRONIZESETTINGS_TITLE,
	    'description', TWEAKWOW_SYNCHRONIZESETTINGS_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("synchronizeSettings")+0 return GetCVar("synchronizeSettings")+0 end,
	    'setFunc', function(value) SetCVar("synchronizeSettings", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowSynchronizeSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowSynchronizeSlider2 = self:MakeSlider(	-- [2]
	    'name', TWEAKWOW_SYNCHRONIZECONFIG_TITLE,
	    'description', TWEAKWOW_SYNCHRONIZECONFIG_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("synchronizeConfig")+0 return GetCVar("synchronizeConfig")+0 end,
	    'setFunc', function(value) SetCVar("synchronizeConfig", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowSynchronizeSlider2:SetPoint("TOPLEFT", TweakWowSynchronizeSlider1, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowSynchronizeSlider3 = self:MakeSlider(	-- [3]
	    'name', TWEAKWOW_SYNCHRONIZEBINDINGS_TITLE,
	    'description', TWEAKWOW_SYNCHRONIZEBINDINGS_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("synchronizeBindings")+0 return GetCVar("synchronizeBindings")+0 end,
	    'setFunc', function(value) SetCVar("synchronizeBindings", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowSynchronizeSlider3:SetPoint("TOPLEFT", TweakWowSynchronizeSlider2, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowSynchronizeSlider4 = self:MakeSlider(	-- [4]
	    'name', TWEAKWOW_SYNCHRONIZEMACROS_TITLE,
	    'description', TWEAKWOW_SYNCHRONIZEMACROS_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("synchronizeMacros")+0 return GetCVar("synchronizeMacros")+0 end,
	    'setFunc', function(value) SetCVar("synchronizeMacros", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowSynchronizeSlider4:SetPoint("TOPLEFT", TweakWowSynchronizeSlider3, "BOTTOMLEFT", 0, -25)	
	
end

-- CAMERA Options

local function OptionsCamera(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_CAMERA)
	
	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			SetCVar("CameraDistanceMax", 15)-- [1]
			SetCVar("CameraDistanceMaxFactor", 1)-- [2]
			SetCVar("cameraViewBlendStyle", 1)-- [3]
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
	
	local TweakWowCameraSlider1 = self:MakeSlider(	-- [1]
	    'name', TWEAKWOW_CAMERADISTANCEMAX_TITLE,
	    'description', TWEAKWOW_CAMERADISTANCEMAX_DESCRIPTION,
	    'minText', '1',
	    'maxText', '25',
	    'minValue', 0,
	    'maxValue', 25,
	    'step', 1,
	    'default', 15,
		'getFunc', function(value) value = GetCVar("CameraDistanceMax")+0 return GetCVar("CameraDistanceMax")+0 end,
	    'setFunc', function(value) SetCVar("CameraDistanceMax", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowCameraSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowCameraSlider2 = self:MakeSlider(	-- [2]
	    'name', TWEAKWOW_CAMERADISTANCEMAXFACTOR_TITLE,
	    'description', TWEAKWOW_CAMERADISTANCEMAXFACTOR_DESCRIPTION,
	    'minText', '1',
	    'maxText', '2',
	    'minValue', 1,
	    'maxValue', 2,
	    'step', 0.5,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("CameraDistanceMaxFactor")+0 return GetCVar("CameraDistanceMaxFactor")+0 end,	
	    'setFunc', function(value) SetCVar("CameraDistanceMaxFactor", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowCameraSlider2:SetPoint("TOPLEFT", TweakWowCameraSlider1, "BOTTOMLEFT", 0, -25)	
			
	local TweakWowCameraSlider3 = self:MakeSlider(	-- [3]
	    'name', TWEAKWOW_CAMERAVIEWBLENDSTYLE_TITLE,
	    'description', TWEAKWOW_CAMERAVIEWBLENDSTYLE_DESCRIPTION,
	    'minText', '1',
	    'maxText', '2',
	    'minValue', 1,
	    'maxValue', 2,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("cameraViewBlendStyle")+0 return GetCVar("cameraViewBlendStyle")+0 end,	
	    'setFunc', function(value) SetCVar("cameraViewBlendStyle", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowCameraSlider3:SetPoint("TOPLEFT", TweakWowCameraSlider2, "BOTTOMLEFT", 0, -25)	
	
end

-- GRAPHIC Options

local function OptionsGraphics(self, anchor)

	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_GRAPHIC)

	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			SetCVar("farclipoverride", 0)	--[1]
			SetCVar("farclip", 727)	--[2]
			SetCVar("gxtextureCacheSize", 0)	-- [3]
			SetCVar("textureCacheSize", 32)	-- [4]
			SetCVar("M2Faster", 1)	-- [5]
			SetCVar("groundeffectdensity", 24)	-- [6]
			SetCVar("environmentDetail", 1)	-- [8]
			ConsoleExec( "characterAmbient 0")	-- [9]
				TweakWoWDB.CharacterAmbient = 0
			SetCVar("spellEffectLevel", 9)-- [10]
			SetCVar("skycloudlod", 1)	-- [11]
			SetCVar("shadowLOD", 1)	-- [12]
			SetCVar("MaxFPS", 0)	-- [13]
			SetCVar("MaxFPSbk", 30)	-- [16]
			SetCVar("objectFade", 1) -- [14]
			oldvalue = GetCVar("mapShadows")+0  -- [15]
			SetCVar("mapShadows", 1)
				if oldvalue ~=  1 then 
					ConsoleExec( "gxrestart" ) 
				end 
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
	
	local TweakWowGraphicsSlider2 = self:MakeSlider(	-- [2]
	    'name', TWEAKWOW_FARCLIP_TITLE,
	    'description', TWEAKWOW_FARCLIP_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1600',
	    'minValue', 0,
	    'maxValue', 1600,
	    'step', 100,
	    'default', 727,
		'getFunc', function(value) value = GetCVar("farclip")+0 return GetCVar("farclip")+0 end,
	    'setFunc', function(value) SetCVar("farclip", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGraphicsSlider2:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSlider3 = self:MakeSlider(	-- [3]
	    'name', TWEAKWOW_GXTEXTURECACHESIZE_TITLE,
	    'description', TWEAKWOW_GXTEXTURECACHESIZE_DESCRIPTION,
	    'minText', 'Auto',
	    'maxText', '512',
	    'minValue', 0,
	    'maxValue', 512,
	    'step', 32,
	    'default', 0,
		'getFunc', function(value) value = GetCVar("gxtextureCacheSize")+0 return GetCVar("gxtextureCacheSize")+0 end,
	    'setFunc', function(value) SetCVar("gxtextureCacheSize", value) end,
	    'currentTextFunc', function(value) 
								if value == 0 then
									return ("Auto")
								else
									return ("%.1f MB"):format(value) 
								end
							return
	end)
	TweakWowGraphicsSlider3:SetPoint("TOPLEFT", TweakWowGraphicsSlider2, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSlider5 = self:MakeSlider(	-- [5]
	    'name', TWEAKWOW_M2FASTER_TITLE,
	    'description', TWEAKWOW_M2FASTER_DESCRIPTION,
	    'minText', '0',
	    'maxText', '3',
	    'minValue', 0,
	    'maxValue', 3,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("M2Faster")+0 return GetCVar("M2Faster")+0 end,	
	    'setFunc', function(value) SetCVar("M2Faster", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGraphicsSlider5:SetPoint("TOPLEFT", TweakWowGraphicsSlider3, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSlider6 = self:MakeSlider(	-- [6]
	    'name', TWEAKWOW_GROUNDEFFECTDENSITY_TITLE,
	    'description', TWEAKWOW_GROUNDEFFECTDENSITY_DESCRIPTION,
	    'minText', '0',
	    'maxText', '256',
	    'minValue', 0,
	    'maxValue', 256,
	    'step', 16,
	    'default', 24,
		'getFunc', function(value) value = GetCVar("groundeffectdensity")+0 return GetCVar("groundeffectdensity")+0 end,
	    'setFunc', function(value) SetCVar("groundeffectdensity", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGraphicsSlider6:SetPoint("TOPLEFT", TweakWowGraphicsSlider5, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSlider8 = self:MakeDropDown(	-- [TODO]
	    'name', TWEAKWOW_GXAPI_TITLE,
	    'description', TWEAKWOW_GXAPI_DESCRIPTION,
	    'values', {
	        'CURRENT', TWEAKWOW_GXAPI_CURRENT,
	        'D3D9', "D3D9",
			'D3D9EX', "D3D9EX",
			'D3D11', "D3D11",
			'OPENGL', "OPENGL",
	     },
	    'default', 'CURRENT',
		'getFunc', function() 
					ischanged = GetCVar("gxapi") 
					return GetCVar("gxapi") 
				end,
	    'setFunc', function(value)
			if value == 'D3D9' or value == 'D3D9EX' or value == 'D3D11' or value == 'OPENGL' then 
				if ischanged ~= value then
					SetCVar("gxapi", value)
					ConsoleExec ("gxRestart")
					ischanged = value 
				end
			end
		end)
	TweakWowGraphicsSlider8:SetPoint("TOPLEFT", TweakWowGraphicsSlider6, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowGraphicsSliderb1 = self:MakeSlider(	-- [14]
	    'name', TWEAKWOW_OBJECTFADE_TITLE,
	    'description', TWEAKWOW_OBJECTFADE_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("objectFade")+0 return GetCVar("objectFade")+0 end,	
	    'setFunc', function(value) SetCVar("objectFade", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value / 1024 / 1024) 
	end)
	TweakWowGraphicsSliderb1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 200, -25)	
		
	local TweakWowGraphicsSliderb2 = self:MakeSlider(	-- [8]
	    'name', TWEAKWOW_ENVIRONMENTDETAIL_TITLE,
	    'description', TWEAKWOW_ENVIRONMENTDETAIL_DESCRIPTION,
	    'minText', '0',
	    'maxText', '2',
	    'minValue', 0,
	    'maxValue', 2,
	    'step', 0.5,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("environmentDetail")+0 return GetCVar("environmentDetail")+0 end,	
	    'setFunc', function(value) SetCVar("environmentDetail", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGraphicsSliderb2:SetPoint("TOPLEFT", TweakWowGraphicsSliderb1, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSliderb3 = self:MakeSlider(	-- [9]
	    'name', TWEAKWOW_CHARACTERAMBIENT_TITLE,
	    'description', TWEAKWOW_CHARACTERAMBIENT_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', -0.1,
	    'maxValue', 1,
	    'step', 0.1,
	    'default', 0,
		'getFunc', function(value) value = TweakWoWDB.CharacterAmbient return TweakWoWDB.CharacterAmbient end,	
	    'setFunc', function(value) 
				if value < 0 then
					ConsoleExec( "characterAmbient" )
				else
					ConsoleExec( "characterAmbient " ..value )
				end
				TweakWoWDB.CharacterAmbient = value
			end,
	    'currentTextFunc', function(value) 
		if value < 0 then
			return "Disabled"
		else
			return ("%.1f"):format(value)
		end
	end)
	TweakWowGraphicsSliderb3:SetPoint("TOPLEFT", TweakWowGraphicsSliderb2, "BOTTOMLEFT", 0, -25)	

	local TweakWowGraphicsSliderb4 = self:MakeSlider(	-- [11]
	    'name', TWEAKWOW_SKYCLOUDLOD_TITLE,
	    'description', TWEAKWOW_SKYCLOUDLOD_DESCRIPTION,
	    'minText', '0',
	    'maxText', '3',
	    'minValue', 0,
	    'maxValue', 3,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("skycloudlod")+0 return GetCVar("skycloudlod")+0 end,	
	    'setFunc', function(value) SetCVar("skycloudlod", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowGraphicsSliderb4:SetPoint("TOPLEFT", TweakWowGraphicsSliderb3, "BOTTOMLEFT", 0, -25)	

end

-- CPU Options

local function OptionsCPU(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_CPU)
	
	local TweakWowCPUResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			if GetCVar("coresDetected")+0 > 1 then
				SetCVar("processAffinityMask", 3)
			else
				SetCVar("processAffinityMask", 1)
			end
		end)
	TweakWowCPUResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
		
	local TweakWowCPUSlider1 = self:MakeDropDown(	-- [1]
	    'name', TWEAKWOW_PROCESSAFFINITYMASK_TITLE,
	    'description', TWEAKWOW_PROCESSAFFINITYMASK_DESCRIPTION,
	    'values', {
	        'SINGLE', TWEAKWOW_PROCESSAFFINITYMASK_SINGLE,
	        'DUAL', TWEAKWOW_PROCESSAFFINITYMASK_DUAL,
			'QUAD', TWEAKWOW_PROCESSAFFINITYMASK_QUAD,
			'EIGHT', TWEAKWOW_PROCESSAFFINITYMASK_EIGHT,
	     },
	    'default', 'DUAL',
		'getFunc', function(value) 
			if GetCVar("processAffinityMask")+0 == 255 then 
				value = "EIGHT" 
			else
				if GetCVar("processAffinityMask")+0 == 15 then 
					value = "QUAD" 
				else 
					if GetCVar("processAffinityMask")+0 == 3 then 
						value = "DUAL" 
					else
						if GetCVar("processAffinityMask")+0 == 1 then 
							value =	"SINGLE"  
						end
					end
				end
			end
			return value end,
	    'setFunc', function(value)
			if value == "EIGHT" then 
				SetCVar("processAffinityMask", 255)
			else
				if value == "QUAD" then 
					SetCVar("processAffinityMask", 15)
				else 
					if value == "DUAL"  then 
						SetCVar("processAffinityMask", 3) 
					else
						if value ==	"SINGLE" then 
							SetCVar("processAffinityMask", 1) 
						end
					end
				end	
			end
		end)
	TweakWowCPUSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
end

-- SOUND Options

local function OptionsSound(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_SOUND)
	
	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			SetCVar("Sound_ListenerAtCharacter", 1)	-- [1]
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
	
	local TweakWowSoundSlider1 = self:MakeSlider(	-- [1]
	    'name', TWEAKWOW_SOUNDLISTENERATCHARACTER_TITLE,
	    'description', TWEAKWOW_SOUNDLISTENERATCHARACTER_DESCRIPTION,
	    'minText', '0',
	    'maxText', '1',
	    'minValue', 0,
	    'maxValue', 1,
	    'step', 1,
	    'default', 1,
		'getFunc', function(value) value = GetCVar("Sound_ListenerAtCharacter")+0 return GetCVar("Sound_ListenerAtCharacter")+0 end,	
	    'setFunc', function(value) SetCVar("Sound_ListenerAtCharacter", value) end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowSoundSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
end

-- COLOR Options

local function OptionsColors(self, anchor)
	local title, subText = self:MakeTitleTextAndSubText("TweakWoW", TWEAKWOW_SUBMENU_COLOR)
	
	local TweakWowGraphicsResetButton = self:MakeButton(
	    'name', TWEAKWOW_RESETBUTTON,
	    'description', TWEAKWOW_RESETBUTTON_DESCRIPTION,
	    'func', function() 
			TweakWoWDB.CopperRed = 1	-- [1]
			TweakWoWDB.CopperGreen = 1
			TweakWoWDB.CopperBlue = 1
			TweakWoWDB.CopperAlpha = 1
			CopperSetColor(r,g,b,a)
			TweakWoWDB.CopperDragon = 0 
			CopperSetColor()-- [2]
			self:Refresh()
		end)
	TweakWowGraphicsResetButton:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 225, 32)	
		
	local TweakWowColorSlider1 = self:MakeColorPicker(	-- [1]
	    'name', TWEAKWOW_INTERFACECOLOR_TITLE,
	    'description', TWEAKWOW_INTERFACECOLOR_DESCRIPTION,
	    'hasAlpha', true,
	    'defaultR', 1,
	    'defaultG', 1,
	    'defaultB', 1,
	    'defaultA', 1,
		'getFunc', function() return TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha end,
	    'setFunc', function (r,g,b,a) 
			TweakWoWDB.CopperRed = r
			TweakWoWDB.CopperGreen = g
			TweakWoWDB.CopperBlue = b
			TweakWoWDB.CopperAlpha = a
			CopperSetColor(r,g,b,a)
		end)
	TweakWowColorSlider1:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -25)	
	
	local TweakWowColorSlider2 = self:MakeSlider(	-- [2]
	    'name', TWEAKWOW_RAREFRAME_TITLE,
	    'description', TWEAKWOW_RAREFRAME_DESCRIPTION,
	    'minText', '0',
	    'maxText', '2',
	    'minValue', 0,
	    'maxValue', 2,
	    'step', 1,
	    'default', 0,
		'getFunc', function(value) value = TweakWoWDB.CopperDragon return TweakWoWDB.CopperDragon end,	
	    'setFunc', function(value) TweakWoWDB.CopperDragon = value CopperSetColor() end,
	    'currentTextFunc', function(value) return ("%.1f"):format(value) 
	end)
	TweakWowColorSlider2:SetPoint("TOPLEFT", TweakWowColorSlider1, "BOTTOMLEFT", 0, -25)	

end

-- Copper

function CopperSetColor(r,g,b,a)
	-- Playerframe Dragon
	if TweakWoWDB.CopperDragon == 1 then
		PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare.blp");
	else
		if TweakWoWDB.CopperDragon == 2 then
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp")
		else
			PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame.blp");
		end
	end
	-- Playerframe
	PlayerFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PetFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- Targetframe
	TargetFrameTextureFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	TargetFrameToTTextureFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- Focusframe
	FocusFrameTextureFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	FocusFrameToTTextureFrameTexture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- Partyframe
	PartyMemberFrame1Texture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PartyMemberFrame2Texture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PartyMemberFrame3Texture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PartyMemberFrame4Texture:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- Minimap
	MinimapBorderTop:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.1, TweakWoWDB.CopperBlue + 0.1, TweakWoWDB.CopperAlpha);
	MinimapBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	-- MinimapButtons
	MiniMapMailBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	MiniMapBattlefieldBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
--	MiniMapWorldBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	MiniMapLFGFrameBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	MiniMapRecordingBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	MiniMapTrackingButtonBorder:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
--	MiniMapZoomOut:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
--	MiniMapZoomIn:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
--	TimeManagerClockButton:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
--	GameTimeFrame:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.2, TweakWoWDB.CopperBlue + 0.2, TweakWoWDB.CopperAlpha);
	--  MainmenuBar
	MainMenuBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuBarTexture2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuBarTexture3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- MainmenuBar & ShapeshiftBar
--	BonusActionBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
--	BonusActionBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ShapeshiftBarLeft:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ShapeshiftBarMiddle:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ShapeshiftBarRight:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PossessBackground1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	PossessBackground2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- Gryphons
	MainMenuBarLeftEndCap:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.1, TweakWoWDB.CopperBlue + 0.1, TweakWoWDB.CopperAlpha);
	MainMenuBarRightEndCap:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.1, TweakWoWDB.CopperBlue + 0.1, TweakWoWDB.CopperAlpha);
	-- Reputation- & XPBar
	ReputationWatchBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationWatchBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationWatchBarTexture2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationWatchBarTexture3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationXPBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationXPBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationXPBarTexture2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ReputationXPBarTexture3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
--	MainMenuXPBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
--	MainMenuXPBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
--	MainMenuXPBarTexture2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
--	MainMenuXPBarTexture3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuMaxLevelBar0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuMaxLevelBar1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuMaxLevelBar2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	MainMenuMaxLevelBar3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	ExhaustionTickNormal:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha);
	-- PetBar
	SlidingActionBarTexture0:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.1, TweakWoWDB.CopperBlue + 0.1, TweakWoWDB.CopperAlpha);
	SlidingActionBarTexture1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen + 0.1, TweakWoWDB.CopperBlue + 0.1, TweakWoWDB.CopperAlpha);
	-- IPopBar Addon Support
	if (IsAddOnLoaded("IPopBar")) then
		IPopBarFrame.t2a:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha)
		IPopBarFrameBar.bg1:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha)
		IPopBarFrameBar.bg2:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha)
		IPopBarFrameBar.bg3:SetVertexColor(TweakWoWDB.CopperRed, TweakWoWDB.CopperGreen, TweakWoWDB.CopperBlue, TweakWoWDB.CopperAlpha)
	end
end

-- Helpers

function SwitchFullscreen()
	SetCVar("gxWindow", 1 - GetCVar("gxWindow"))
	ConsoleExec( "gxrestart" )
end

function SwitchMaximized()
	SetCVar("gxWindow", 1)
	SetCVar("gxMaximize", 1 - GetCVar("gxMaximize"))
	ConsoleExec( "gxrestart" )
end

function SwitchRatio(value)
	y = string.sub((GetCVar("gxResolution")),string.sub(string.find(GetCVar("gxResolution"),"x"),1)+1)
	x = string.sub((GetCVar("gxResolution")),0, string.sub(string.find(GetCVar("gxResolution"),"x"),1)-1)
	if value == "UP" then 
		SetCVar("gxWindow", 1)
		SetCVar ("gxResolution", x.. "x" ..y * 0.75)
		ConsoleExec ("gxRestart")
	else
		if value == "DOWN" then
			SetCVar("gxWindow", 1)
			SetCVar ("gxResolution", x.. "x" ..y / 0.75)  
			ConsoleExec ("gxRestart")
		end
	end
end
	
function RatioB(value)
	y = string.sub((GetCVar("gxResolution")),string.sub(string.find(GetCVar("gxResolution"),"x"),1)+1)
	x = string.sub((GetCVar("gxResolution")),0, string.sub(string.find(GetCVar("gxResolution"),"x"),1)-1)
	if value == "UP" then 
		SetCVar("gxWindow", 1)
		SetCVar ("gxResolution", x.. "x" ..y * 0.75)
		ConsoleExec ("gxRestart")
	else
		if value == "DOWN" then
			SetCVar("gxWindow", 1)
			SetCVar ("gxResolution", x.. "x" ..y / 0.75)  
			ConsoleExec ("gxRestart")
		end
	end
end

-- Start
	
local function OnEvent(self, name)
	-- Is this TweakWow?
	if(name ~= 'TweakWoW') then return end 
	-- Initialize Variables 
	TweakWoWDB = TweakWoWDB or {graphic = {}}
	-- Initialize Variables (Color Options)
	if TweakWoWDB.CopperRed == nil then TweakWoWDB.CopperRed = 1 end
	if TweakWoWDB.CopperGreen == nil then TweakWoWDB.CopperGreen = 1 end
	if TweakWoWDB.CopperBlue == nil then TweakWoWDB.CopperBlue = 1 end
	if TweakWoWDB.CopperDragon == nil then TweakWoWDB.CopperDragon = 0 end
	if TweakWoWDB.CopperAlpha == nil then TweakWoWDB.CopperAlpha = 1 end
	-- Initialize Variables (no CVar stuff)
	if TweakWoWDB.Pitchlimit == nil then TweakWoWDB.Pitchlimit = "ONE" end
	if TweakWoWDB.CharacterAmbient == nil then TweakWoWDB.CharacterAmbient = 0 end 
	-- Restore PitchLimit
	if TweakWoWDB.Pitchlimit == 'TWO' then 
		ConsoleExec( "pitchlimit 449" )
	end
	-- Restore CharacterAmbient
	if TweakWoWDB.CharacterAmbient < 0 then
		ConsoleExec( "characterAmbient" )
	else
		ConsoleExec( "characterAmbient " ..TweakWoWDB.CharacterAmbient )
	end
	-- Restore Colors
	CopperSetColor(r,g,b,a)
	-- Initialize OptionsPanels
	LibSimpleOptions.AddOptionsPanel("TweakWoW", function(self) Options(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_GAME, function(self) OptionsGame(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_SYNCHRONIZE, function(self) OptionsSynchronize(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_CAMERA, function(self) OptionsCamera(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_GRAPHIC, function(self) OptionsGraphics(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_CPU, function(self) OptionsCPU(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_SOUND, function(self) OptionsSound(self, anchor) end)
	LibSimpleOptions.AddSuboptionsPanel("TweakWoW", TWEAKWOW_SUBMENU_COLOR, function(self) OptionsColors(self, anchor) end)
	LibSimpleOptions.AddSlashCommand("TweakWoW", "/tweakwow", "/tweak")
	self:UnregisterEvent("ADDON_LOADED")
end

-- Create Frame etc.

local event = CreateFrame("Frame")
event:RegisterEvent("ADDON_LOADED") 
event:SetScript("OnEvent", function(self, event, ...) OnEvent(self, ...) end)