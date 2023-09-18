function Gnosis:OptCreateBasicTables()
	Gnosis.tUnits = { player = "Player", target = "Target", focus = "Focus", pet = "Pet/Vehicle",
		party1 = "Party 1", party2 = "Party 2", party3 = "Party 3", party4 = "Party 4", party5 = "Party 5",
		raid1 = "Raid 1", raid2 = "Raid 2", raid3 = "Raid 3", raid4 = "Raid 4", raid5 = "Raid 5",
		arena1 = "Arena 1", arena2 = "Arena 2", arena3 = "Arena 3", arena4 = "Arena 4", arena5 = "Arena 5",
		mirror = "Mirror Bar", gcd = "GCD Indicator", sm = "Swing Melee", sr = "Swing Range", smr = "Swing Melee&Range",
		targettarget = "Target's Target", focustarget = "Focus' Target", pettarget = "Pet's Target",
		targettargettarget = "Target's Target's Target",
		arena1target = "Arena 1's Target", arena2target = "Arena 2's Target", arena3target = "Arena 3's Target",
		arena4target = "Arena 4's Target", arena5target = "Arena 5's Target",
		party1target = "Party 1's Target", party2target = "Party 2's Target", party3target = "Party 3's Target",
		party4target = "Party 4's Target", party5target = "Party 5's Target",
	};

	Gnosis.fontoutlines = { NONE = Gnosis.L["TabCapNONE"], OUTLINE = "OUTLINE", THICKOUTLINE = "THICKOUTLINE", MONOCHROME = "MONOCHROME" };
	Gnosis.tIconSide = { LEFT = Gnosis.L["TabCapLEFT"], RIGHT = Gnosis.L["TabCapRIGHT"], NONE = Gnosis.L["TabCapNONE"] };
	Gnosis.tAlignment = { NAMETIME = Gnosis.L["TabNameTime"], TIMENAME = Gnosis.L["TabTimeName"], FREE = Gnosis.L["TabFreeAlign"] };
	Gnosis.tAlignName = { LEFT = Gnosis.L["TabCapLEFT"], CENTER = Gnosis.L["TabCapCENTER"], RIGHT = Gnosis.L["TabCapRIGHT"] };
	Gnosis.tAlignTime = { LEFT = Gnosis.L["TabCapLEFT"], CENTER = Gnosis.L["TabCapCENTER"], RIGHT = Gnosis.L["TabCapRIGHT"] };
	Gnosis.tAlignLat = { LEFT = Gnosis.L["TabCapLEFT"], RIGHT = Gnosis.L["TabCapRIGHT"], ADAPT = Gnosis.L["TabAdaptToCT"] };

	Gnosis.tStrata = {
		BACKGROUND = Gnosis.L["Strata_BACK"],
		LOW = Gnosis.L["Strata_LOW"],
		MEDIUM = Gnosis.L["Strata_MEDIUM"],
		HIGH = Gnosis.L["Strata_HIGH"],
		DIALOG = Gnosis.L["Strata_DIALOG"],
	};

	Gnosis.tOrientation = {
		[1] = Gnosis.L["Horizontal"],
		[2] = Gnosis.L["Vertical"],
	};

	Gnosis.optempty = {
		cmdHidden = true,
		name = Gnosis.L["AddonName"],
		type = "group",
		args = {
			disabled = {
				type = "description",
				name = Gnosis.L["OptAddonDisabled_Name"],
			},
		},
	};

	Gnosis.optdisabled = {
		cmdHidden = true,
		name = Gnosis.L["AddonName"],
		type = "group",
		args = {
			enable = {
				order = 1,
				name = Gnosis.L["OptAddonEnable_Name"],
				desc = Gnosis.L["OptAddonEnable_Desc"],
				type = "toggle",
				get = function(info) return Gnosis.s.bAddonEn; end,
				set = function(info,val)
					Gnosis.s.bAddonEn = val;
					Gnosis:Enable( val );
				end,
			},
		},
	};

	Gnosis.opt = {
		name = Gnosis.L["AddonName"],
		type = "group",
		args = {
			enable = {
				order = 1,
				name = Gnosis.L["OptAddonEnable_Name"],
				desc = Gnosis.L["OptAddonEnable_Desc"],
				type = "toggle",
				get = function(info) return Gnosis.s.bAddonEn; end,
				set = function(info,val)
					Gnosis.s.bAddonEn = val;
					Gnosis:Enable( val );
				end,
				width = "full",
			},
			hideblizz = {
				order = 2,
				name = Gnosis.L["OptHideBlizzCB"],
				type = "toggle",
				get = function(info) return Gnosis.s.bHideBlizz; end,
				set = function(info,val)
					Gnosis.s.bHideBlizz = val;
					Gnosis:HideBlizzardCastbar( val );
				end,
				width = "full",
			},
			hidemirror = {
				order = 3,
				name = Gnosis.L["OptHideMirrorCB"],
				type = "toggle",
				get = function(info) return Gnosis.s.bHideMirror; end,
				set = function(info,val)
					Gnosis.s.bHideMirror = val;
					Gnosis:HideBlizzardMirrorCastbar( val );
				end,
				width = "full",
			},
			hidepet = {
				order = 4,
				name = Gnosis.L["OptHidePetCB"],
				type = "toggle",
				get = function(info) return Gnosis.s.bHidePetVeh; end,
				set = function(info,val)
					Gnosis.s.bHidePetVeh = val;
					Gnosis:HideBlizzardPetCastbar( val );
				end,
				width = "full",
			},
			hideaddonmsgs = {
				order = 5,
				name = Gnosis.L["OptHideAddonMsgs"],
				type = "toggle",
				get = function(info) return Gnosis.s.bHideAddonMsgs; end,
				set = function(info,val)
					Gnosis.s.bHideAddonMsgs = val;
				end,
				width = "full",
			},
			locale = {
				order = 6,
				name = Gnosis.L["OptLocale"],
				type = "select",
				values = Gnosis.LSet,
				get = function(info) return Gnosis.s.strLocale; end,
				set = function(info,val)
					Gnosis.s.strLocale = val;
					Gnosis:RedoLocalization();
				end,
				style = "dropdown",
				width = "full",
			},
			fsframe = {
				order = 7,
				name = Gnosis.L["OptFirstStartFrame"],
				type = "execute",
				func = function()
					Gnosis:CheckForFirstStart( true );
				end,
				width = "full",
			},
			ccbset = {
				order = 8,
				name = Gnosis.L["OptCreateCBSet"],
				type = "execute",
				func = function()
					Gnosis:CreateBasicCastbarSet();
				end,
				width = "full",
			},
			respd = {
				order = 9,
				name = Gnosis.L["OptResetPlayerData"],
				type = "execute",
				func = function()
					Gnosis.db:ResetDB( Gnosis.db:GetCurrentProfile() );
					ReloadUI();
				end,
				width = "full",
			},
		},
	};

	Gnosis.opt_ctclip = {
		name = Gnosis.L["TabCTClipTest"],
		type = "group",
		args = {},
	};

	Gnosis.opt_cbs = {
		name = Gnosis.L["TabCastbars"],
		type = "group",
		args = {},
	};

	Gnosis.opt_css = {
		name = Gnosis.L["TabChanneledSpells"],
		type = "group",
		args = {},
	};

	Gnosis.opt_configs = {
		name = Gnosis.L["TabConfig"],
		type = "group",
		args = {},
	};
end

function Gnosis:OptCreateCTpage()
	Gnosis.opt_ctclip.args = {
		ctaddon = {
			order = 1,
			name = Gnosis.L["OptCTO"],
			type = "select",
			values = {
				["Blizz"] = Gnosis.L["OptCTO_Blizz"],
				["MSBT"] = Gnosis.L["OptCTO_MSBT"],
				["SCT"] = Gnosis.L["OptCTO_SCT"],
				["Parrot"] = Gnosis.L["OptCTO_Parrot"],
			},
			get = function(info) return Gnosis.s.ct.addon; end,
			set = function(info,val) Gnosis.s.ct.addon = val; end,
			style = "dropdown",
			width = "full",
		},
		bsound = {
			order = 2,
			name = Gnosis.L["OptPSoC"],
			type = "toggle",
			get = function(info) return Gnosis.s.ct.bsound; end,
			set = function(info,val) Gnosis.s.ct.bsound = val; end,
		},
		bmusic = {
			order = 3,
			name = Gnosis.L["OptPMoC"],
			type = "toggle",
			get = function(info) return Gnosis.s.ct.bmusic; end,
			set = function(info,val) Gnosis.s.ct.bmusic = val; end,
		},
		sound = {
			order = 4,
			name = Gnosis.L["OptSnd"],
			type = "select",
			values = Gnosis.BlizzSounds,
			get = function(info) return Gnosis.s.ct.sound; end,
			set = function(info,val) Gnosis.s.ct.sound = val; end,
			style = "dropdown",
		},
		music = {
			order = 5,
			name = Gnosis.L["OptMusic"],
			type = "select",
			values = Gnosis.musicnames,
			get = function(info) return Gnosis.s.ct.music; end,
			set = function(info,val) Gnosis.s.ct.music = val; end,
			style = "dropdown",
		},
		playsound = {
			order = 6,
			name = Gnosis.L["OptPlaySnd"],
			type = "execute",
			func = function() if( Gnosis.s.ct.sound ) then
				 PlaySound( Gnosis.s.ct.sound ); end
			end,
		},
		playmusic = {
			order = 7,
			name = Gnosis.L["OptPlayMusic"],
			type = "execute",
			func = function() if( Gnosis.s.ct.music and Gnosis.music[Gnosis.s.ct.music] ) then
				PlaySoundFile( Gnosis.music[Gnosis.s.ct.music] ); end
			end,
		},
		wfcl = {
			order = 9,
			name = Gnosis.L["OptWfCL_Name"],
			desc = Gnosis.L["OptWfCL_Desc"],
			type = "range",
			min = 0, max = 1500,
			step = 10, bigStep = 10,
			get = function(info) return Gnosis.s.wfcl; end,
			set = function(info,val) Gnosis.s.wfcl = val; end,
			isPercent = false,
		},
		ctt = {
			order = 10,
			name = Gnosis.L["OptClipWarn_Name"],
			desc = Gnosis.L["OptClipWarn_Desc"],
			type = "range",
			min = 0, max = 500,
			step = 10, bigStep = 10,
			get = function(info) return Gnosis.s.ctt; end,
			set = function(info,val) Gnosis.s.ctt = val; end,
			isPercent = false,
		},
	};
end

function Gnosis:OptCreateNewCastbar( passedname, passedunit )
	local name = passedname and passedname or self.s.nameNewBar;

	if( name == "" ) then
		self:Print( self.L["OptCreatenewbarInvalidName"] );
	elseif( self.castbars[name] ~= nil ) then
		self:Print( self.L["OptCreatenewbarExists"] );
	else
		self.s.cbconf[name] = self:CreateDefaultBarTable( passedunit and passedunit or "player" );
		self.castbars[name] = self:CreateBarFrame( name, nil, 0, 1.0 );
		self:SetBarParams( name );

		self:CreateCastbarsOpt();
		self:CreateCBTables();
	end
end

function Gnosis:OptCreateNewAndCopyCastbar( key )
	local name = self.s.nameNewBar;

	if( name == "" ) then
		self:Print( self.L["OptCopytonewbarInvalidName"] );
	elseif( self.castbars[name] ~= nil ) then
		self:Print( self.L["OptCopytonewbarExists"] );
	else
		self.s.cbconf[name] = self:deepcopy( self.s.cbconf[key] );
		self.castbars[name] = self:CreateBarFrame( name, nil, 0, 1.0 );
		self:SetBarParams( name );

		self:CreateCastbarsOpt();
		self:CreateCBTables();
	end
end

function Gnosis:OptCreateNewChanneledSpell()
	local id = tonumber(self.s.nameNewSpell);

	if( id == nil ) then
		self:AddChanneledSpellByName( self.s.nameNewSpell, 1, 1, false, false );
	else
		self:AddChanneledSpellById( id, 1, 1, false, false );
	end

	self:CreateChannelSpellsOpt();
end

function Gnosis:CreateChannelSpellsOpt()
	local iCount = 4;
	local tCSs = {};

	tCSs.newbarbutton = {
		order = 1,
		name = Gnosis.L["OptCreateNewSpell"],
		type = "execute",
		func = function() Gnosis:OptCreateNewChanneledSpell(); end,
	};

	tCSs.newbarname = {
		order = 2,
		name = Gnosis.L["OptSpellNameOrId"],
		type = "input",
		get = function(info) return Gnosis.s.nameNewSpell; end,
		set = function(info,val) Gnosis.s.nameNewSpell = val; end,
	};

	-- created sorted table
	local tSorted = {};
	for key, value in pairs(self.s.channeledspells) do
		table.insert( tSorted, key );
	end
	table.sort( tSorted );

	for keyindex, key in ipairs(tSorted) do
		iCount = iCount + 1;
		tCSs[key] = {
			order = iCount,
			name = key,
			type = "group",
			width = "half",
			args = {
				ben = {
					order = 1,
					name = Gnosis.L["OptEn"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].ben; end,
					set = function(info,val) Gnosis.s.channeledspells[key].ben = val; end,
				},
				ticks = {
					order = 2,
					name = Gnosis.L["OptTotTicks"],
					type = "range",
					min = 1, max = 15,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.channeledspells[key].ticks; end,
					set = function(info,val) Gnosis.s.channeledspells[key].ticks = val; end,
					isPercent = false,
				},
				bars = {
					order = 3,
					name = Gnosis.L["OptTicksToShow"],
					type = "range",
					min = 1, max = 15,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.channeledspells[key].bars; end,
					set = function(info,val) Gnosis.s.channeledspells[key].bars = val; end,
					isPercent = false,
				},
				binit = {
					order = 4,
					name = Gnosis.L["OptFirstTickInst"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].binit; end,
					set = function(info,val) Gnosis.s.channeledspells[key].binit = val; end,
				},
				baoe = {
					order = 5,
					name = Gnosis.L["OptSpellIsAoE"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].baoe; end,
					set = function(info,val) Gnosis.s.channeledspells[key].baoe = val; end,
				},
				bclip = {
					order = 6,
					name = Gnosis.L["OptEnClipTest"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].bcliptest; end,
					set = function(info,val) Gnosis.s.channeledspells[key].bcliptest = val; end,
				},
				bcombattext = {
					order = 7,
					name = Gnosis.L["OptCombTicks"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].bcombattext; end,
					set = function(info,val) Gnosis.s.channeledspells[key].bcombattext = val; end,
				},
				ctoutput = {
					order = 8,
					name = Gnosis.L["OptOutputString"],
					desc = Gnosis.L["OptOutputStringDesc"],
					type = "input",
					get = function(info) return  Gnosis.s.channeledspells[key].ctstring; end,
					set = function(info,val) Gnosis.s.channeledspells[key].ctstring = val; end,
				},
				bicon = {
					order = 9,
					name = Gnosis.L["OptShowSpellIcon"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].bicon; end,
					set = function(info,val) Gnosis.s.channeledspells[key].bicon = val; end,
				},
				bsticky = {
					order = 10,
					name = Gnosis.L["OptStickyClips"],
					type = "toggle",
					get = function(info) return Gnosis.s.channeledspells[key].bsticky; end,
					set = function(info,val) Gnosis.s.channeledspells[key].bsticky = val; end,
				},
				fontsizeclip = {
					order = 11,
					name = Gnosis.L["OptCSFSClip"],
					type = "range",
					min = 0, max = 34,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.channeledspells[key].fontsizeclip; end,
					set = function(info,val) Gnosis.s.channeledspells[key].fontsizeclip = val; end,
					isPercent = false,
				},
				fontsizenclip = {
					order = 12,
					name = Gnosis.L["OptCSFSNonClip"],
					type = "range",
					min = 0, max = 34,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.channeledspells[key].fontsizenclip; end,
					set = function(info,val) Gnosis.s.channeledspells[key].fontsizenclip = val; end,
					isPercent = false,
				},
				remove = {
					order = 15,
					name = Gnosis.L["OptCSRemove"],
					type = "execute",
					func = function() Gnosis:RemoveChanneledSpell( key ); end,
				},
			},
		};
	end

	Gnosis.opt_css.args = tCSs;
end

local iCurTableIndex;
function Gnosis:GetNextTableIndex( resetto )
	if( resetto ) then
		iCurTableIndex = resetto;
	else
		iCurTableIndex = iCurTableIndex + 1;
	end

	return iCurTableIndex;
end

function Gnosis:CreateCastbarsOpt()
	local iCount = 4;
	local tCBs = {};

	tCBs.newbarbutton = {
		order = 1,
		name = Gnosis.L["OptCBNewCB_N"],
		desc = Gnosis.L["OptCBNewCB_D"],
		type = "execute",
		func = function() Gnosis:OptCreateNewCastbar(); end,
	};

	tCBs.newbarname = {
		order = 2,
		name = "",
		desc = Gnosis.L["OptCBNewCBName_D"],
		type = "input",
		get = function(info) return Gnosis.s.nameNewBar; end,
		set = function(info,val) Gnosis.s.nameNewBar = val; end,
	};

	-- created sorted table
	local tSorted = {};
	for key, value in pairs(self.castbars) do
		table.insert( tSorted, key );
	end
	table.sort( tSorted );

	for keyindex, key in ipairs(tSorted) do
		self:GetNextTableIndex( 0 );
		iCurCnt = 0;
		iCount = iCount + 1;
		tCBs[key] = {
			order = iCount,
			name = key,
			type = "group",
			width = "half",
			args = {
				enable = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBEnCB"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bEn; end,
					set = function(info,val)
						Gnosis.s.cbconf[key].bEn = val;
						Gnosis:SetBarParams( key );
						Gnosis:CreateCBTables();
					end,
				},
				movable = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBUnl_N"],
					desc = Gnosis.L["OptCBUnl_D"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bUnlocked; end,
					set = function(info,val) Gnosis.s.cbconf[key].bUnlocked = val; Gnosis:SetBarParams( key ); end,
				},
				showwnc = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBSWNC"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowWNC; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowWNC = val; Gnosis:SetBarParams( key ); end,
				},
				seltype = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBUnit"],
					type = "select",
					values = Gnosis.tUnits,
					get = function(info) return Gnosis.s.cbconf[key].unit; end,
					set = function(info,val)
							Gnosis.s.cbconf[key].unit = val;
							Gnosis:CreateCBTables();
							Gnosis:SetBarParams( key );
						end,
					style = "dropdown",
				},
				orientation = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBOrient"],
					type = "select",
					values = Gnosis.tOrientation,
					get = function(info) return Gnosis.s.cbconf[key].orient; end,
					set = function(info,val) Gnosis.s.cbconf[key].orient = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				bartex = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTexture"],
					type = "select",
					values = Gnosis.bartexnames,
					get = function(info) return Gnosis.s.cbconf[key].bartexture; end,
					set = function(info,val) Gnosis.s.cbconf[key].bartexture = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				framestrata = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFrameStrata"],
					type = "select",
					values = Gnosis.tStrata,
					get = function(info) return Gnosis.s.cbconf[key].strata; end,
					set = function(info,val) Gnosis.s.cbconf[key].strata = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				iconside = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBShowIcon"],
					type = "select",
					values = Gnosis.tIconSide,
					get = function(info) return Gnosis.s.cbconf[key].iconside; end,
					set = function(info,val) Gnosis.s.cbconf[key].iconside = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				unlockicon = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBUnlockIcon_N"],
					desc = Gnosis.L["OptCBUnlockIcon_D"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bIconUnlocked; end,
					set = function(info,val) Gnosis.s.cbconf[key].bIconUnlocked = val; Gnosis:SetBarParams( key ); end,
				},
				iconcoord_x_y = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAdjIcon"],
					desc = Gnosis.L["OptBarXYcoordDesc"],
					type = "input",
					get = function(info) return string.format( "%.2f, %.2f", Gnosis.s.cbconf[key].coord.casticon.x, Gnosis.s.cbconf[key].coord.casticon.y ); end,
					set = function(info,val) Gnosis.s.cbconf[key].coord.casticon.x, Gnosis.s.cbconf[key].coord.casticon.y = Gnosis:GetCoordinatesFromString( val ); Gnosis:SetBarParams( key ); end,
				},
				invbar = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBInvBarDir"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bInvDir; end,
					set = function(info,val) Gnosis.s.cbconf[key].bInvDir = val; Gnosis:SetBarParams( key ); end,
				},
				showcbs = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBShowSpark"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowCBS; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowCBS = val; Gnosis:SetBarParams( key ); end,
				},
				showlatbox = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBShowLatBox"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowLat; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowLat = val; Gnosis:SetBarParams( key ); end,
				},
				showticks = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBShowChanTicks"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowTicks; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowTicks = val; Gnosis:SetBarParams( key ); end,
				},
				showcastname = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptShowCastNameName"],
					desc = Gnosis.L["OptShowCastNameDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowCastname; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowCastname = val; Gnosis:SetBarParams( key ); end,
				},
				showcastrank = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptShowCastRankName"],
					desc = Gnosis.L["OptShowCastRankDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowCastrank; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowCastrank = val; Gnosis:SetBarParams( key ); end,
				},
				usecastnamestring = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptNameFormatToggleName"],
					desc = Gnosis.L["OptNameFormatToggleDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bUseNameFormat; end,
					set = function(info,val) Gnosis.s.cbconf[key].bUseNameFormat = val; Gnosis:SetBarParams( key ); end,
				},
				castnamestring = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptNameFormatStringName"],
					desc = Gnosis.L["OptNameFormatStringDesc"],
					type = "input",
					get = function(info) return Gnosis.s.cbconf[key].strNameFormat; end,
					set = function(info,val) Gnosis.s.cbconf[key].strNameFormat = val; end,
				},
				alignment = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTextAlignment"],
					type = "select",
					values = Gnosis.tAlignment,
					get = function(info) return Gnosis.s.cbconf[key].alignment; end,
					set = function(info,val) Gnosis.s.cbconf[key].alignment = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				alignname = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAlignName"],
					type = "select",
					values = Gnosis.tAlignName,
					get = function(info) return Gnosis.s.cbconf[key].alignname; end,
					set = function(info,val) Gnosis.s.cbconf[key].alignname = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				namecoord_x_y = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAdjNamePos"],
					desc = Gnosis.L["OptBarXYcoordDesc"],
					type = "input",
					get = function(info) return string.format( "%.2f, %.2f", Gnosis.s.cbconf[key].coord.castname.x, Gnosis.s.cbconf[key].coord.castname.y ); end,
					set = function(info,val) Gnosis.s.cbconf[key].coord.castname.x, Gnosis.s.cbconf[key].coord.castname.y = Gnosis:GetCoordinatesFromString( val ); Gnosis:SetBarParams( key ); end,
				},
				aligntime = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAlignTime"],
					type = "select",
					values = Gnosis.tAlignTime,
					get = function(info) return Gnosis.s.cbconf[key].aligntime; end,
					set = function(info,val) Gnosis.s.cbconf[key].aligntime = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				timecoord_x_y = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAlignTimeCoord"],
					desc = Gnosis.L["OptBarXYcoordDesc"],
					type = "input",
					get = function(info) return string.format( "%.2f, %.2f", Gnosis.s.cbconf[key].coord.casttime.x, Gnosis.s.cbconf[key].coord.casttime.y ); end,
					set = function(info,val) Gnosis.s.cbconf[key].coord.casttime.x, Gnosis.s.cbconf[key].coord.casttime.y = Gnosis:GetCoordinatesFromString( val ); Gnosis:SetBarParams( key ); end,
				},
				mergetradeskill = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptMergetradeskillName"],
					desc = Gnosis.L["OptMergetradeskillDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bMergeTrade; end,
					set = function(info,val) Gnosis.s.cbconf[key].bMergeTrade = val; Gnosis:SetBarParams( key ); end,
				},
				showasminutes = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptShowasminutesName"],
					desc = Gnosis.L["OptShowasminutesDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowAsMinutes; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowAsMinutes = val; Gnosis:SetBarParams( key ); end,
				},
				hidecasttime = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptHidecasttime"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bHideCasttime; end,
					set = function(info,val) Gnosis.s.cbconf[key].bHideCasttime = val; Gnosis:SetBarParams( key ); end,
				},
				hidecasttimetotal = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptHidecasttimeTotal"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bHideCasttimeTotal; end,
					set = function(info,val) Gnosis.s.cbconf[key].bHideCasttimeTotal = val; Gnosis:SetBarParams( key ); end,
				},
				hidepushbacktime = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptHidepushbackTime"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bHidePushbackTime; end,
					set = function(info,val) Gnosis.s.cbconf[key].bHidePushbackTime = val; Gnosis:SetBarParams( key ); end,
				},
				usecasttimestring = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptTimeFormatToggleName"],
					desc = Gnosis.L["OptTimeFormatToggleDesc"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bUseTimeFormat; end,
					set = function(info,val) Gnosis.s.cbconf[key].bUseTimeFormat = val; Gnosis:SetBarParams( key ); end,
				},
				casttimestring = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptTimeFormatStringName"],
					desc = Gnosis.L["OptTimeFormatStringDesc"],
					type = "input",
					get = function(info) return Gnosis.s.cbconf[key].strTimeFormat; end,
					set = function(info,val) Gnosis.s.cbconf[key].strTimeFormat = val; end,
				},
				showplayerlatency  = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptShowPlayerLatency"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bShowPlayerLatency; end,
					set = function(info,val) Gnosis.s.cbconf[key].bShowPlayerLatency = val; Gnosis:SetBarParams( key ); end,
				},
				alignlattext = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBForceLatAlign"],
					type = "select",
					values = Gnosis.tAlignLat,
					get = function(info) return Gnosis.s.cbconf[key].alignlat; end,
					set = function(info,val) Gnosis.s.cbconf[key].alignlat = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				latcoord_x_y = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAdjLatTextCoord"],
					desc = Gnosis.L["OptBarXYcoordDesc"],
					type = "input",
					get = function(info) return string.format( "%.2f, %.2f", Gnosis.s.cbconf[key].coord.latency.x, Gnosis.s.cbconf[key].coord.latency.y ); end,
					set = function(info,val) Gnosis.s.cbconf[key].coord.latency.x, Gnosis.s.cbconf[key].coord.latency.y = Gnosis:GetCoordinatesFromString( val ); Gnosis:SetBarParams( key ); end,
				},
				fillclearbar = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFillAtEnd"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bFillup; end,
					set = function(info,val) Gnosis.s.cbconf[key].bFillup = val; end,
				},
				barwidth = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptWidth"],
					type = "range",
					min = 0, max = 2000,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].width; end,
					set = function(info,val) Gnosis.s.cbconf[key].width = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				barheight = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptHeight"],
					type = "range",
					min = 0, max = 2000,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].height; end,
					set = function(info,val) Gnosis.s.cbconf[key].height = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				barscale = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBScaleBar"],
					type = "range",
					min = 0.1, max = 5,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].scale; end,
					set = function(info,val) Gnosis.s.cbconf[key].scale = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				iconcale = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBScaleIcon"],
					type = "range",
					min = 0.1, max = 5,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].scaleicon; end,
					set = function(info,val) Gnosis.s.cbconf[key].scaleicon = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				roticon = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBRotIcon"],
					type = "range",
					min = -180, max = 180,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].rotateicon; end,
					set = function(info,val) Gnosis.s.cbconf[key].rotateicon = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				bordersize = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBBorderSize"],
					type = "range",
					min = 0, max = 10,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].border; end,
					set = function(info,val) Gnosis.s.cbconf[key].border = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				bordersizeicon = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBIconBorderSize"],
					type = "range",
					min = 0, max = 10,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].bordericon; end,
					set = function(info,val) Gnosis.s.cbconf[key].bordericon = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				fadeout = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFadeout"],
					type = "range",
					min = 0, max = 5,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].fadeout; end,
					set = function(info,val) Gnosis.s.cbconf[key].fadeout = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				sparkheight = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBSparkHeight"],
					type = "range",
					min = 0, max = 5,
					step = 0.05, bigStep = 0.05,
					get = function(info) return Gnosis.s.cbconf[key].fSparkHeightMulti; end,
					set = function(info,val) Gnosis.s.cbconf[key].fSparkHeightMulti = val; Gnosis:SetBarParams( key ); end,
					isPercent = true,
				},
				sparkwidth = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBSparkWidth"],
					type = "range",
					min = 0, max = 5,
					step = 0.05, bigStep = 0.05,
					get = function(info) return Gnosis.s.cbconf[key].fSparkWidthMulti; end,
					set = function(info,val) Gnosis.s.cbconf[key].fSparkWidthMulti = val; Gnosis:SetBarParams( key ); end,
					isPercent = true,
				},
				coord_x_y = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptBarXYcoordName"],
					desc = Gnosis.L["OptBarXYcoordDesc"],
					type = "input",
					get = function(info) return string.format( "%.2f, %.2f", Gnosis.s.cbconf[key].anchor.x, Gnosis.s.cbconf[key].anchor.y ); end,
					set = function(info,val) Gnosis.s.cbconf[key].anchor.x, Gnosis.s.cbconf[key].anchor.y = Gnosis:GetCoordinatesFromString( val ); Gnosis:AnchorBar( key ); end,
				},
				butcenterbar = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCenterCB"],
					type = "execute",
					func = function() Gnosis:CenterCastbar( key ); end,
				},
				barcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCBColor"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colBar ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colBar = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				barcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colBar ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colBar = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				barintcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCBColInt"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colInterrupted ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colInterrupted = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				barintcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colInterrupted ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colInterrupted = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				barfailedcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCBColFail"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colFailed ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colFailed = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				barfailedcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colFailed ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colFailed = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				barbgcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCBBgCol"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colBarBg ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colBarBg = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				barbgcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colBarBg ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colBarBg = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				bordercolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBBorderCol"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colBorder ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colBorder = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				bordercolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colBorder ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colBorder = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				bordercolorunint = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBBorderColInt"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colBorderNI ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colBorderNI = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				bordercolorunint_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colBorderNI ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colBorderNI = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				lagbarcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBLatBoxCol"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colLagBar ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colLagBar = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				lagbarcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colLagBar ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colLagBar = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				textcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTextColName"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colText ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colText = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				textcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colText ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colText = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				textcolortime = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTextColTime"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colTextTime ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colTextTime = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				textcolortime_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colTextTime ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colTextTime = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				textcolorlag = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTextColLat"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colTextLag ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colTextLag = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				textcolorlag_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colTextLag ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colTextLag = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				textcolorpb = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBTextColPB"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colTextPB ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colTextPB = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				textcolorpb_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colTextPB ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colTextPB = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				sparkcolor = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBSparkColor"],
					type = "color",
					get = function(info) return unpack( Gnosis.s.cbconf[key].colSpark ); end,
					set = function(info,r,g,b,a) Gnosis.s.cbconf[key].colSpark = { r, g, b, a }; Gnosis:SetBarParams( key ); end,
					hasAlpha = true,
				},
				sparkcolor_text = {
					order = self:GetNextTableIndex(),
					name = "",
					type = "input",
					get = function(info) return Gnosis:CreateColorString( unpack( Gnosis.s.cbconf[key].colSpark ) ) end,
					set = function(info,val)
						local r, g, b, a = Gnosis:GetColorsFromString( val );
						if( r ) then
							Gnosis.s.cbconf[key].colSpark = { r, g, b, a };
							Gnosis:SetBarParams( key );
						end
					end,
				},
				font = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFont"],
					type = "select",
					values = Gnosis.fontnames,
					get = function(info) return Gnosis.s.cbconf[key].font; end,
					set = function(info,val) Gnosis.s.cbconf[key].font = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				fontoutline = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFontOutline"],
					type = "select",
					values = Gnosis.fontoutlines,
					get = function(info) return Gnosis.s.cbconf[key].fontoutline; end,
					set = function(info,val) Gnosis.s.cbconf[key].fontoutline = val; Gnosis:SetBarParams( key ); end,
					style = "dropdown",
				},
				fontsize = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFontSizeName"],
					type = "range",
					min = 0, max = 40,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].fontsize; end,
					set = function(info,val) Gnosis.s.cbconf[key].fontsize = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				fontsizetime = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFontSizeTime"],
					type = "range",
					min = 0, max = 40,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].fontsize_timer; end,
					set = function(info,val) Gnosis.s.cbconf[key].fontsize_timer = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				fontsizelat = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFontSizeLat"],
					type = "range",
					min = 0, max = 40,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].fontsize_lat; end,
					set = function(info,val) Gnosis.s.cbconf[key].fontsize_lat = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				resizelong = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptFontResizeLongName"],
					type = "toggle",
					get = function(info) return Gnosis.s.cbconf[key].bResizeLongName; end,
					set = function(info,val) Gnosis.s.cbconf[key].bResizeLongName = val; Gnosis:SetBarParams( key ); end,
				},
				strgap = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptStrGapName"],
					desc = Gnosis.L["OptStrGapDesc"],
					type = "range",
					min = 0, max = 100,
					step = 1, bigStep = 1,
					get = function(info) return Gnosis.s.cbconf[key].strGap; end,
					set = function(info,val) Gnosis.s.cbconf[key].strGap = val; end,
					isPercent = false,
				},
				baralpha = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAlpha"],
					type = "range",
					min = 0.1, max = 1,
					step = 0.1, bigStep = 0.1,
					get = function(info) return Gnosis.s.cbconf[key].alpha; end,
					set = function(info,val) Gnosis.s.cbconf[key].alpha = val; Gnosis:SetBarParams( key ); end,
					isPercent = false,
				},
				latbarsize = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBMaxLatBox"],
					type = "range",
					min = 0.05, max = 0.33,
					step = 0.01, bigStep = 0.01,
					get = function(info) return Gnosis.s.cbconf[key].latbarsize; end,
					set = function(info,val) Gnosis.s.cbconf[key].latbarsize = val; end,
					isPercent = true,
				},
				latbarfixed = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBFixLatBox"],
					type = "range",
					min = 0.01, max = 0.1,
					step = 0.01, bigStep = 0.01,
					get = function(info) return Gnosis.s.cbconf[key].latbarfixed; end,
					set = function(info,val) Gnosis.s.cbconf[key].latbarfixed = val; end,
					isPercent = true,
				},
				bnwtypesel = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBEnList"],
					type = "select",
					values = {
						[1] = Gnosis.L["OptCBListNeither"],
						[2] = Gnosis.L["OptCBListBlack"],
						[3] = Gnosis.L["OptCBListWhite"],
					},
					get = function(info) return Gnosis.s.cbconf[key].bnwtypesel; end,
					set = function(info,val) Gnosis.s.cbconf[key].bnwtypesel = val; end,
					style = "dropdown",
					width = "full",
				},
				bnwinputnew = {
					order = self:GetNextTableIndex(),
					name = "",
					desc = Gnosis.L["OptCBNewListElem_D"],
					type = "input",
					get = function(info) return Gnosis.s.cbconf[key].bnwlistnew; end,
					set = function(info,val) Gnosis.s.cbconf[key].bnwlistnew = val; end,
				},
				bnwaddnew = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBAddListElem"],
					type = "execute",
					func = function()
						if( not Gnosis.s.cbconf[key].bnwlist ) then
							Gnosis.s.cbconf[key].bnwlist = {};
						end
						if( Gnosis.s.cbconf[key].bnwlistnew ) then
							table.insert( Gnosis.s.cbconf[key].bnwlist, Gnosis.s.cbconf[key].bnwlistnew );
							table.sort( Gnosis.s.cbconf[key].bnwlist );
							Gnosis:CreateCastbarsOpt();
						end
					end,
				},
				bnwlist = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBBWListedSpells"],
					type = "select",
					values = Gnosis.s.cbconf[key].bnwlist,
					get = function(info) return Gnosis.s.cbconf[key].bnwlistcursel; end,
					set = function(info,val) Gnosis.s.cbconf[key].bnwlistcursel = val; end,
					style = "dropdown",
					width = "full",
				},
				bnwremove = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBRemListElem"],
					type = "execute",
					func = function() if( Gnosis.s.cbconf[key].bnwlistcursel and Gnosis.s.cbconf[key].bnwlist ) then
							table.remove( Gnosis.s.cbconf[key].bnwlist, Gnosis.s.cbconf[key].bnwlistcursel );
						end
					end,
				},
				copycb = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBCopyCB_N"],
					desc = Gnosis.L["OptCBCopyCB_D"],
					type = "execute",
					func = function() Gnosis:OptCreateNewAndCopyCastbar( key ); end,
				},
				removecb = {
					order = self:GetNextTableIndex(),
					name = Gnosis.L["OptCBRemCB"],
					type = "execute",
					func = function() Gnosis:RemoveCastbar( key ); end,
				},
			},
		};
	end

	Gnosis.opt_cbs.args = tCBs;
end

function Gnosis:deepcopy( object )
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object;
        elseif lookup_table[object] then
            return lookup_table[object];
        end
        local new_table = {};
        lookup_table[object] = new_table;
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy( value );
        end
        return setmetatable( new_table, _copy( getmetatable(object) ) );
    end
    return _copy(object);
end

function Gnosis:LoadConfig( name, bMainTab, bCastbars, bChanneledSpells, bClipTest )
	local bStatus = true;

	if( GnosisConfigs and GnosisConfigs[name] ) then
		if( bMainTab and GnosisConfigs[name].maintab ) then
			local c = GnosisConfigs[name].maintab;
			Gnosis.s.bAddonEn = c.bAddonEn;			-- already enabled
			Gnosis.s.bHideAddonMsgs = c.bHideAddonMsgs;

			local strLocale = c.strLocale and c.strLocale or nil;
			if( strLocale and Gnosis.s.strLocale ~= strLocale ) then
				Gnosis.s.strLocale = strLocale;
				Gnosis:RedoLocalization();
			end

			Gnosis:HideBlizzardCastbarIfStatusChange( c.bHideBlizz );
			Gnosis:HideBlizzardMirrorCastbarIfStatusChange( c.bHideMirror );
			Gnosis:HideBlizzardPetCastbarIfStatusChange( c.bHidePetVeh );
		elseif( bMainTab ) then
			bStatus = false;
		end

		if( bCastbars and GnosisConfigs[name].cbconf ) then
			Gnosis.s.cbconf = Gnosis:deepcopy( GnosisConfigs[name].cbconf );
			Gnosis:RecreateAllBars();
			Gnosis:CreateCastbarsOpt();
		elseif( bCastbars ) then
			bStatus = false;
		end

		if( bChanneledSpells and GnosisConfigs[name].channeledspells ) then
			Gnosis.s.channeledspells = Gnosis:deepcopy( GnosisConfigs[name].channeledspells );
			Gnosis:CreateChannelSpellsOpt();
		elseif( bChanneledSpells ) then
			bStatus = false;
		end

		if( bClipTest and GnosisConfigs[name].ct ) then
			Gnosis.s.ct = Gnosis:deepcopy( GnosisConfigs[name].ct );
			Gnosis.s.wfcl = GnosisConfigs[name].ct.wfcl;
			Gnosis.s.ctt = GnosisConfigs[name].ct.ctt;
			Gnosis:OptCreateCTpage();
		elseif( bClipTest ) then
			bStatus = false;
		end
	else
		bStatus = false;
	end

	return bStatus;
end

function Gnosis:OptCreateConfigurations()
	local iCount = 9;

	Gnosis.opt_configs.args = {
		saveconf = {
			order = 1,
			name = Gnosis.L["OptConfSave"],
			type = "execute",
			func = function() Gnosis:OptSaveNewConfig(); end,
		},
		confname = {
			order = 2,
			name = Gnosis.L["OptConfName"],
			type = "input",
			get = function(info) return Gnosis.s.configs.name; end,
			set = function(info,val) Gnosis.s.configs.name = val; end,
		},
		bsmt = {
			order = 3,
			name = Gnosis.L["OptConfStoreMain"],
			type = "toggle",
			get = function(info) return Gnosis.s.configs.bsavedefaultopt and Gnosis.s.configs.bsavedefaultopt or false; end,
			set = function(info,val) Gnosis.s.configs.bsavedefaultopt = val; end,
		},
		bscb = {
			order = 4,
			name = Gnosis.L["OptConfStoreCBs"],
			type = "toggle",
			get = function(info) return Gnosis.s.configs.bsavecastbars; end,
			set = function(info,val) Gnosis.s.configs.bsavecastbars = val; end,
		},
		bssp = {
			order = 5,
			name = Gnosis.L["OptConfStoreChan"],
			type = "toggle",
			get = function(info) return Gnosis.s.configs.bsavespell; end,
			set = function(info,val) Gnosis.s.configs.bsavespell = val; end,
		},
		bsct = {
			order = 6,
			name = Gnosis.L["OptConfStoreCT"],
			type = "toggle",
			get = function(info) return Gnosis.s.configs.bsavectct and Gnosis.s.configs.bsavectct or false; end,
			set = function(info,val) Gnosis.s.configs.bsavectct = val; end,
		},
	};

	-- created sorted table
	local key, value;
	local tSorted = {};
	for key, value in pairs(GnosisConfigs) do
		table.insert( tSorted, key );
	end
	table.sort( tSorted );

	for keyindex, key in ipairs(tSorted) do
		iCount = iCount + 1;
		Gnosis.opt_configs.args[key] = {
			order = iCount,
			name = key,
			type = "group",
			width = "half",
			args = {
			},
		};

		if( GnosisConfigs[key].maintab ) then
			Gnosis.opt_configs.args[key].args.maintab = {
				order = 1,
				name = Gnosis.L["OptConfLoadMain"],
				type = "execute",
				func = function()
					Gnosis:LoadConfig( key, true, false, false, false );
				end,
			};
		end

		if( GnosisConfigs[key].cbconf ) then
			Gnosis.opt_configs.args[key].args.cbconf = {
				order = 2,
				name = Gnosis.L["OptConfLoadCBs"],
				type = "execute",
				func = function()
					Gnosis:LoadConfig( key, false, true, false, false );
				end,
			};
		end

		if( GnosisConfigs[key].channeledspells ) then
			Gnosis.opt_configs.args[key].args.channeledspells = {
				order = 3,
				name = Gnosis.L["OptConfLoadChan"],
				type = "execute",
				func = function()
					Gnosis:LoadConfig( key, false, false, true, false );
				end,
			};
		end

		if( GnosisConfigs[key].ct ) then
			Gnosis.opt_configs.args[key].args.ct = {
				order = 4,
				name = Gnosis.L["OptConfLoadCT"],
				type = "execute",
				func = function()
					Gnosis:LoadConfig( key, false, false, false, true );
				end,
			};
		end

		Gnosis.opt_configs.args[key].args.butreschanneledspells = {
			order = 10,
			name = Gnosis.L["OptConfDelConf"],
			type = "execute",
			func = function()
				GnosisConfigs[key] = nil;
				Gnosis:OptCreateConfigurations();
			end,
		};
	end
end

function Gnosis:OptSaveNewConfig()
	if( Gnosis.s.configs.name ~= "" ) then
		if( GnosisConfigs[Gnosis.s.configs.name] ) then
			self:Print( self.L["OptSaveconfigExists"] );
		else
			GnosisConfigs[Gnosis.s.configs.name] = {};

			if( self.s.configs.bsavedefaultopt ) then
				GnosisConfigs[Gnosis.s.configs.name].maintab = {};
				GnosisConfigs[Gnosis.s.configs.name].maintab.bAddonEn = self.s.bAddonEn;
				GnosisConfigs[Gnosis.s.configs.name].maintab.bHideBlizz = self.s.bHideBlizz;
				GnosisConfigs[Gnosis.s.configs.name].maintab.bHidePetVeh = self.s.bHidePetVeh;
				GnosisConfigs[Gnosis.s.configs.name].maintab.bHideMirror = self.s.bHideMirror;
				GnosisConfigs[Gnosis.s.configs.name].maintab.bHideAddonMsgs = self.s.bHideAddonMsgs;
				GnosisConfigs[Gnosis.s.configs.name].maintab.strLocale = self.s.strLocale;
			end

			if( self.s.configs.bsavecastbars ) then
				GnosisConfigs[Gnosis.s.configs.name].cbconf = Gnosis:deepcopy( self.s.cbconf );
			end

			if( self.s.configs.bsavespell ) then
				GnosisConfigs[Gnosis.s.configs.name].channeledspells = Gnosis:deepcopy( self.s.channeledspells );
			end

			if( self.s.configs.bsavectct ) then
				GnosisConfigs[Gnosis.s.configs.name].ct = Gnosis:deepcopy( self.s.ct );
				GnosisConfigs[Gnosis.s.configs.name].ct.wfcl = Gnosis.s.wfcl;
				GnosisConfigs[Gnosis.s.configs.name].ct.ctt = Gnosis.s.ctt;
			end

			self:OptCreateConfigurations();
		end
	else
		self:Print( self.L["OptSaveconfigInvalidName"] );
	end
end
