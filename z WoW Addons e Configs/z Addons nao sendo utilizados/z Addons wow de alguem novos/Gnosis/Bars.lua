function Gnosis:UpgradeTable( dst, src )
	for key, value in pairs( src ) do
		if( dst[key] == nil ) then
			dst[key] = value;
		elseif( type(value) == "table" ) then
			self:UpgradeTable( dst[key], value );
		end
	end
end

function Gnosis:CheckStoredCastbarOptions()
	local iUpgrade150 = 0;
	local strUpgrade150 = "upgrading bars to v1.50+ options:\n  ";

	for cbname, cbopt in pairs( self.s.cbconf ) do
			-- upgrade castbar if needed
		if( not cbopt.cboptver and cbopt.width and cbopt.height and cbopt.anchor ) then	-- v1.50
			iUpgrade150 = iUpgrade150 + 1;
			strUpgrade150 = strUpgrade150 .. cbname .. "  ";

			cbopt.cboptver = 1.50;
			cbopt.width = cbopt.width - cbopt.height;
			if( cbopt.anchor and cbopt.anchor.s ) then
				cbopt.anchor.x = cbopt.anchor.x + cbopt.height / 2 * cbopt.anchor.s;
			end
		end

		-- add missing option values
		self:UpgradeTable( cbopt, self.tCastbarDefaults );

		if( cbopt.unit == "gcd_reverse" ) then
			-- remove gcd_reverse unit (-> to gcd with inversed bar direction)
			cbopt.unit = "gcd";
			cbopt.bInvDir = not cbopt.bInvDir;
		end

		-- new unit names for swing timers
		if( cbopt.unit == "mel" ) then
			cbopt.unit = "sm";
		elseif( cbopt.unit == "rng" ) then
			cbopt.unit = "sr";
		elseif( cbopt.unit == "melrng" ) then
			cbopt.unit = "smr";
		end
	end

	if( iUpgrade150 > 0 ) then
		strUpgrade150 = strUpgrade150 .. "\n  ..." .. iUpgrade150 .. " bars upgraded to v1.50+ options\n  ...please check those bars options";
		self:Print( strUpgrade150 );
	end

	self:CreateCBTables();
end

function Gnosis:CreateCBTables()
	-- table for units to scan (no events)
	self:SetupScanUnits();

	-- create fast lookup table
	self:CreateFastLookupCastbars();
end

function Gnosis:SetupScanUnits()
	self.bScan = false;
	self.scan = {};

	for cbname, cbopt in pairs( self.s.cbconf ) do
		if( cbopt.bEn ) then
			local u = string.match( cbopt.unit, "(.+)target" );
			if( u ) then
				self.scan[cbopt.unit] = {};
				self.bScan = true;
			end
		end
	end
end

function Gnosis:ScanUnits()
	if( self.bScan ) then
		for key, value in pairs(self.scan) do
			self:ScanUnit( key, value );
		end
	end
end

function Gnosis:ScanUnit( unit, nfo )
	local name, rank, displayName, texture, startTime, endTime, isTradeSkill, id, notInterruptible;

	name, rank, displayName, texture, startTime, endTime, isTradeSkill, id, notInterruptible = UnitCastingInfo( unit );
	if( name ) then
		-- casting
		if( nfo.name and nfo.name == name and nfo.startTime == startTime ) then
			-- not interruptible?
			if( nfo.notInt ~= notInterruptible ) then
				nfo.notInt = notInterruptible;
				if( notInterruptible ) then
					self:UNIT_SPELLCAST_NOT_INTERRUPTIBLE( "UNIT_SPELLCAST_NOT_INTERRUPTIBLE", unit );
				else
					self:UNIT_SPELLCAST_INTERRUPTIBLE( "UNIT_SPELLCAST_INTERRUPTIBLE", unit );
				end
			end
		elseif( nfo.name and nfo.name == name and nfo.startTime < startTime and startTime < nfo.endTime ) then
			nfo.startTime = startTime;
			nfo.endTime = endTime;
			self:UNIT_SPELLCAST_DELAYED( "UNIT_SPELLCAST_DELAYED", unit );
		else
			if( nfo.isChannel ) then
				self:UNIT_SPELLCAST_CHANNEL_STOP( "UNIT_SPELLCAST_CHANNEL_STOP", unit, name );
			else
				self:UNIT_SPELLCAST_STOP( "UNIT_SPELLCAST_STOP", unit, name );
			end

			nfo.name = name;
			nfo.isChannel = false;
			nfo.startTime = startTime;
			nfo.endTime = endTime;
			nfo.notInt = notInterruptible;

			self:UNIT_SPELLCAST_START( "UNIT_SPELLCAST_START", unit, name, rank );
		end

		return;
	end

	name, rank, displayName, texture, startTime, endTime, isTradeSkill, notInterruptible = UnitChannelInfo( unit );
	if( name ) then
		-- channeling
		if( nfo.name and nfo.name == name and nfo.endTime == endTime ) then
			-- not interruptible?
			if( nfo.notInt ~= notInterruptible ) then
				nfo.notInt = notInterruptible;
				if( notInterruptible ) then
					self:UNIT_SPELLCAST_NOT_INTERRUPTIBLE( "UNIT_SPELLCAST_NOT_INTERRUPTIBLE", unit );
				else
					self:UNIT_SPELLCAST_INTERRUPTIBLE( "UNIT_SPELLCAST_INTERRUPTIBLE", unit );
				end
			end
		elseif( nfo.name and nfo.name == name and startTime < nfo.startTime and endTime < nfo.endTime ) then
			nfo.startTime = startTime;
			nfo.endTime = endTime;
			self:UNIT_SPELLCAST_CHANNEL_UPDATE( "UNIT_SPELLCAST_CHANNEL_UPDATE", unit );
		else
			if( nfo.isChannel ) then
				self:UNIT_SPELLCAST_CHANNEL_STOP( "UNIT_SPELLCAST_CHANNEL_STOP", unit, name );
			else
				self:UNIT_SPELLCAST_STOP( "UNIT_SPELLCAST_STOP", unit, name );
			end

			nfo.name = name;
			nfo.isChannel = true;
			nfo.startTime = startTime;
			nfo.endTime = endTime;
			nfo.notInt = notInterruptible;

			self:UNIT_SPELLCAST_CHANNEL_START( "UNIT_SPELLCAST_CHANNEL_START", unit, name );
		end

		return;
	end

	if( nfo.name ) then
		-- stop, no interrupt or failed detection
		if( nfo.isChannel ) then
			self:UNIT_SPELLCAST_CHANNEL_STOP( "UNIT_SPELLCAST_CHANNEL_STOP", unit, name );
		else
			self:UNIT_SPELLCAST_STOP( "UNIT_SPELLCAST_STOP", unit, name );
		end

		nfo.name = nil;
	end
end

function Gnosis:InitialCreateCastbars()
	for key, value in pairs( self.s.cbconf ) do
		self.castbars[key] = self:CreateBarFrame( key, nil, 0, 1.0 );
		self:SetBarParams( key );
	end
	self:CreateCBTables();
end

function Gnosis:CreateFastLookupCastbars()
	self.cb_fl = {};

	for key, value in pairs( self.castbars ) do
		local conf = Gnosis.s.cbconf[key];
		value.conf = conf;

		if( conf.bEn ) then
			if( not self.cb_fl[conf.unit] ) then
				self.cb_fl[conf.unit] = {};
			end

			table.insert( self.cb_fl[conf.unit], value );
		end
	end
end

local iFindCB;
local tFindCB;
function Gnosis:FindCB( unit )
	tFindCB = self.cb_fl[unit];

	iFindCB = 1;
	if( tFindCB ) then
		return tFindCB[iFindCB];
	end

	return nil;
end

function Gnosis:FindCBNext( unit )
	iFindCB = iFindCB + 1;
	return tFindCB[iFindCB];
end

function Gnosis:FindGCDBars( spell, rank, fCurTime )
	local cb = self:FindCB( "gcd" );
	while( cb ) do
		self:SetupGCDbar( cb, spell, rank, fCurTime, false );
		cb = self:FindCBNext( "gcd" );
	end
end

function Gnosis:FindSwingTimers( unit, spell, icon, fCurTime, bType )
	local cb = self:FindCB( unit );
	while( cb ) do
		self:SetupSwingBar( cb, spell, icon, fCurTime, bType );
		cb = self:FindCBNext( unit );
	end
end

function Gnosis:FindSwingTimersParry( unit, fCurTime )
	local cb = self:FindCB( unit );
	while( cb ) do
		self:SetupSwingBarForParry( cb, fCurTime )
		cb = self:FindCBNext( unit );
	end
end

function Gnosis:FontString( bar, height )
	local fs = bar:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmallOutline" );
	fs:SetFont( GameFontNormal:GetFont(), height );
	return fs;
end

function Gnosis:SetBorderColor( name, colBorder, colBarBg )
	local bar = self.castbars[name];

	if( not bar ) then
		return;
	end

	bar.btop:SetTexture( unpack( colBorder ) );
	bar.bbottom:SetTexture( unpack( colBorder ) );
	bar.bleft:SetTexture( unpack( colBorder ) );
	bar.bright:SetTexture( unpack( colBorder ) );
	bar.bbg:SetTexture( unpack( colBarBg ) );
	bar.bicon:SetTexture( unpack( colBorder ) );
end

function Gnosis:SetBarParams( name )
	local bar = self.castbars[name];
	local tParams = self.s.cbconf[name];

	-- setup bar parameters
	bar:SetWidth( tParams.width );
	bar:SetHeight( tParams.height );

	-- status bar
	bar.barwidth = tParams.width;
	bar.barheight = tParams.height;
	bar.bar:SetHeight( tParams.height );
	bar.bar:SetWidth( tParams.width );

	-- bar texture
	bar.bar:SetStatusBarTexture( self.bartextures[tParams.bartexture], "BORDER" );
	bar.bar:SetStatusBarColor( unpack( tParams.colBar ) );

	-- statusbar orienation
	if( tParams.orient == 2 ) then
		bar.bar:SetOrientation( "VERTICAL", tParams.bInvDir );
	else
		bar.bar:SetOrientation( "HORIZONTAL", tParams.bInvDir );
	end

	bar.bar:ClearAllPoints();
	bar.bar:SetAllPoints( bar );

	-- bar border
	local bsize, bnsize = tParams.border, -tParams.border;
	local bisize, binsize = tParams.bIconUnlocked and tParams.bordericon or bsize, tParams.bIconUnlocked and -tParams.bordericon or bnsize;
	bar.btop:ClearAllPoints();
	bar.btop:SetPoint( "TOPLEFT", bar, "TOPLEFT", bnsize, bsize );
	bar.btop:SetPoint( "BOTTOMRIGHT", bar, "TOPRIGHT", bsize, 0 );
	bar.bbottom:ClearAllPoints();
	bar.bbottom:SetPoint( "TOPLEFT", bar, "BOTTOMLEFT", bnsize, 0 );
	bar.bbottom:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", bsize, bnsize );
	bar.bleft:ClearAllPoints();
	bar.bleft:SetPoint( "TOPLEFT", bar, "TOPLEFT", bnsize, 0 );
	bar.bleft:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMLEFT", 0, 0 );
	bar.bright:ClearAllPoints();
	bar.bright:SetPoint( "TOPLEFT", bar, "TOPRIGHT", 0, 0 );
	bar.bright:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", bsize, 0 );

	-- bar background
	bar.bbg:ClearAllPoints();
	bar.bbg:SetAllPoints( bar );

	-- icon
	local fRemoveLeftIconBorder, fRemoveRightIconBorder, fScaleIcon, bShowIcon =
		(tParams.iconside == "RIGHT" and not tParams.bIconUnlocked) and 0 or 1,
		(tParams.iconside == "LEFT" and not tParams.bIconUnlocked) and 0 or 1,
		tParams.bIconUnlocked and tParams.scaleicon or 1,
		(tParams.iconside == "LEFT" or tParams.iconside == "RIGHT") and true or false;
	local reverseside, movex, movey =
		bShowIcon and (tParams.iconside == "LEFT" and "RIGHT" or "LEFT") or nil,
		tParams.bIconUnlocked and tParams.coord.casticon.x or 0,
		tParams.bIconUnlocked and tParams.coord.casticon.y or 0;

	if( bShowIcon ) then
		bar.icon:ClearAllPoints();
		bar.bicon:ClearAllPoints();
		bar.icon:SetPoint( reverseside, bar, tParams.iconside, ((tParams.iconside == "LEFT" and binsize or bisize)+movex) * fScaleIcon, movey * fScaleIcon );
		bar.icon:SetWidth( (tParams.bIconUnlocked and min(tParams.height,tParams.width) or tParams.height) * fScaleIcon );
		bar.icon:SetHeight( (tParams.bIconUnlocked and min(tParams.height,tParams.width) or tParams.height) * fScaleIcon );
		bar.bicon:ClearAllPoints();
		bar.bicon:SetPoint( "TOPLEFT", bar.icon, "TOPLEFT", binsize * fScaleIcon * fRemoveLeftIconBorder, bisize * fScaleIcon );
		bar.bicon:SetPoint( "BOTTOMRIGHT", bar.icon, "BOTTOMRIGHT", bisize * fScaleIcon * fRemoveRightIconBorder, binsize * fScaleIcon );
		bar.icon:SetTexture( tParams.bUnlocked and self.toyIcon or nil );

		bar.icon:Show();
		bar.bicon:Show();
	else
		bar.icon:Hide();
		bar.bicon:Hide();
	end

	-- icon rotate
	self:Rotate( bar.ian, tParams.bIconUnlocked and tParams.rotateicon or 0 );
	self:Rotate( bar.bian, tParams.bIconUnlocked and tParams.rotateicon or 0 );

	local curFont = GameFontNormal:GetFont();
	if( tParams.font ~= nil and tParams.font ~= "" and self.fonts[tParams.font] ) then
		curFont = self.fonts[tParams.font];
	end
	local fo = nil;
	if( tParams.fontoutline and self.fontoutlines[tParams.fontoutline] and self.fontoutlines[tParams.fontoutline] ~= "NONE" ) then
		fo = self.fontoutlines[tParams.fontoutline];
	end
	local fssizeparam = tParams.orient == 2 and tParams.width or tParams.height;
	local fs = fssizeparam <= (40/0.65) and fssizeparam or (40/0.65);
	if( tParams.fontsize and tParams.fontsize > 0 ) then
		fs = tParams.fontsize;
		bar.ctext:SetFont( curFont, fs, fo );
	else
		bar.ctext:SetFont( curFont, max(fs*0.65,1), fo );
	end

	bar.defFont = curFont;
	bar.defFS = fs;
	bar.defFO = fo;

	fs = fssizeparam <= (40/0.65) and fssizeparam or (40/0.65);
	-- timer
	if( tParams.fontsize_timer and tParams.fontsize_timer > 0 ) then
		bar.rtext:SetFont( curFont, max(tParams.fontsize_timer*0.65,1), fo );
	else
		bar.rtext:SetFont( curFont, max(fs*0.55,1), fo );
	end
	-- latency
	if( tParams.fontsize_lat and tParams.fontsize_lat > 0 ) then
		bar.brtext:SetFont( curFont, max(tParams.fontsize_lat*0.65,1), fo );
		bar.bltext:SetFont( curFont, max(tParams.fontsize_lat*0.65,1), fo );
	else
		bar.brtext:SetFont( curFont, max(fs/2*0.85,1), fo );
		bar.bltext:SetFont( curFont, max(fs/2*0.85,1), fo );
	end

	for i = 1, 15 do
		if( tParams.orient == 2 ) then
			bar.lb[i]:SetWidth( tParams.width );
		else
			bar.lb[i]:SetHeight( tParams.height );
		end
		bar.lb[i]:SetTexture( unpack( tParams.colLagBar ) );
	end

	-- castbar spark
	if( tParams.orient == 2 ) then
		bar.cbs:SetWidth( tParams.fSparkHeightMulti * tParams.width * 0.3 );
		bar.cbs:SetHeight( tParams.fSparkWidthMulti * tParams.width * 1.6 );
		self:Rotate( bar.cbsan, 90 );
	else
		bar.cbs:SetWidth( tParams.fSparkWidthMulti * tParams.height * 0.35 );
		bar.cbs:SetHeight( tParams.fSparkHeightMulti * tParams.height * 1.5 );
		self:Rotate( bar.cbsan, 0 );
	end
	bar.cbs:SetVertexColor( unpack( tParams.colSpark ) );
	bar:SetScale( tParams.scale );

	-- set border color
	self:SetBorderColor( name, tParams.colBorder, tParams.colBarBg );

	-- text colors
	bar.ctext:SetTextColor( unpack( tParams.colText ) );
	bar.rtext:SetTextColor( unpack( tParams.colTextTime and tParams.colTextTime or tParams.colText ) );
	bar.brtext:SetTextColor( unpack( tParams.colTextLag and tParams.colTextLag or tParams.colText ) );
	bar.bltext:SetTextColor( unpack( tParams.colTextLag and tParams.colTextLag or tParams.colText ) );

	self:AnchorBar( name );

	-- bar alpha
	bar:SetAlpha( tParams.alpha );

	-- setup by bar type
	bar.ctext:ClearAllPoints();
	bar.rtext:ClearAllPoints();

	if( tParams.alignment == "FREE" ) then
		bar.rtext:SetPoint( tParams.aligntime, bar, tParams.coord["casttime"].x, tParams.coord["casttime"].y );
		bar.ctext:SetPoint( tParams.alignname, bar, tParams.coord["castname"].x, tParams.coord["castname"].y );
	elseif( tParams.alignment == "TIMENAME" ) then
		bar.rtext:SetPoint( tParams.aligntime, bar, tParams.coord["casttime"].x, tParams.coord["casttime"].y );
		bar.ctext:SetPoint( tParams.alignname, bar, tParams.coord["castname"].x, tParams.coord["castname"].y );
		bar.rtext:SetPoint( "RIGHT", bar.ctext, "LEFT", 0, 0 );
	else
		bar.rtext:SetPoint( tParams.aligntime, bar, tParams.coord["casttime"].x, tParams.coord["casttime"].y );
		bar.ctext:SetPoint( tParams.alignname, bar, tParams.coord["castname"].x, tParams.coord["castname"].y );
		bar.ctext:SetPoint( "RIGHT", bar.rtext, "LEFT", 0, 0 );
	end

	bar.ctext:SetJustifyH( tParams.alignname );
	bar.rtext:SetJustifyH( tParams.aligntime );

	-- latency text blocks
	bar.brtext:SetPoint( "BOTTOMRIGHT", bar, -tParams.coord["latency"].x, tParams.coord["latency"].y );
	bar.bltext:SetPoint( "BOTTOMLEFT", bar, tParams.coord["latency"].x, tParams.coord["latency"].y );

	if( tParams.strata ) then
		bar:SetFrameStrata( tParams.strata );
	end

	if( not tParams.bEn ) then
		bar:Hide();		-- bar disabled
	else
		if( tParams.bUnlocked ) then
			self:MakeBarMovable( name, true );
			bar:Show();
		elseif(	tParams.bShowWNC ) then
			self:MakeBarMovable( name, false );
			bar:Show();
		elseif( not bar.bIsActive ) then
			self:MakeBarMovable( name, false );
			bar:Hide();
		end
	end

	-- castbar? if not set bnIsCB to true
	if( tParams.unit == "gcd" or tParams.unit == "sm" or tParams.unit == "sr"
		or tParams.unit == "smr" or tParams.unit == "mirror" ) then
		bar.bnIsCB = true;
	else
		bar.bnIsCB = nil;
	end
end

function Gnosis:RAG( tex )
	local ag = tex:CreateAnimationGroup();
	local an = ag:CreateAnimation( "Rotation" );

	return ag, an;
end

function Gnosis:RotateOnUpgrade()
	self:Pause();
end

function Gnosis:Rotate( an, degrees, pt )
	an:Stop();

	if( degrees ~= 0 ) then
		an:SetOrigin( pt and pt or "CENTER", 0, 0 );
		an:SetDegrees( degrees );
		an:SetDuration( 0 );
		an:SetEndDelay( 100 );
		an:SetScript( "OnUpdate", Gnosis.RotateOnUpgrade );
		an:Play();
	end
end

function Gnosis:CreateBarFrame( name, iconpath, minval, maxval )
	local f = CreateFrame( "Frame", name, UIParent );
	f:SetFrameStrata( "MEDIUM" );	-- default, correct value will be set when calling Gnosis:SetBarParams()
	f.name = name;

	-- border textures
	f.btop, f.bbottom, f.bleft, f.bright, f.bbg = f:CreateTexture( nil, "BACKGROUND" ), f:CreateTexture( nil, "BACKGROUND" ), f:CreateTexture( nil, "BACKGROUND" ), f:CreateTexture( nil, "BACKGROUND" ), f:CreateTexture( nil, "BACKGROUND" );

	--local bar = CreateFrame( "StatusBar", nil, f );
	local bar = self:CreateStatusBar( f );
	bar:SetMinMaxValues( minval, maxval );
	bar:SetValue( 0.0001 );
	f.bar = bar;

	f:Hide();

	f.bicon = f.bar:CreateTexture( nil, "ARTWORK" );
	local icon = f.bar:CreateTexture( nil, "OVERLAY" );
	icon:SetTexCoord( 0.09, 0.91, 0.09, 0.91 );
	icon:SetTexture( iconpath );
	icon:Show();
	f.icon = icon;

	f.ctext = self:FontString( f.bar, 20*0.65 );
	f.rtext = self:FontString( f.bar, 20*0.55 );
	f.brtext = self:FontString( f.bar, 20/2*0.95 );
	f.bltext = self:FontString( f.bar, 20/2*0.95 );

	f.ctext:SetText( name );

	-- latency bar
	f.lb = {};
	for i = 1, 15 do		-- might be a bit extreme (hellfire ticks 15x)
		f.lb[i] = f.bar:CreateTexture( nil, "ARTWORK" );
		f.lb[i]:SetPoint( "LEFT", (i-1)*0.2, 0 );
		f.lb[i]:Hide();
	end

	local cbs = f.bar:CreateTexture( nil, "OVERLAY" );
	cbs:SetTexture( "Interface\\CastingBar\\UI-CastingBar-Spark" );
	cbs:SetBlendMode( "ADD" );
	cbs:Hide();
	f.cbs = cbs;

	-- animations for rotations
	f.iag, f.ian = self:RAG( f.icon );
	f.ibag, f.bian = self:RAG( f.bicon );
	f.cbsag, f.cbsan = self:RAG( f.cbs );

	return f;
end

function Gnosis:CreateDefaultBarTable( unit )
	local tBar = self:deepcopy( self.tCastbarDefaults );
	tBar["unit"] = unit;

	return tBar;
end

function Gnosis:AnchorBar( name )
	if( self.s.cbconf[name].anchor ) then
		if( not( tonumber(self.s.cbconf[name].anchor.s) and tonumber(self.s.cbconf[name].anchor.x) and tonumber(self.s.cbconf[name].anchor.y) ) ) then
			self.s.cbconf[name].anchor = nil;
			self.castbars[name]:ClearAllPoints();
			self.castbars[name]:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 );
		else
			local s = self.s.cbconf[name].anchor.s;
			local x, y = self.s.cbconf[name].anchor.x / s, self.s.cbconf[name].anchor.y / s;
			self.castbars[name]:ClearAllPoints();
			self.castbars[name]:SetPoint( "CENTER", UIParent, "BOTTOMLEFT", x, y );
		end
	else
		self.castbars[name]:ClearAllPoints();
		self.castbars[name]:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 );
	end

	if( not self.s.cbconf[name].anchor ) then
		local s = self.castbars[name]:GetEffectiveScale();
		local x,y = self.castbars[name]:GetCenter();

		self.s.cbconf[name].anchor = {
				["x"] = x*s,
				["y"] = y*s,
				["s"] = s,
		};
	end
end

function Gnosis:CenterCastbar( key )
	self.s.cbconf[key].anchor = nil;
	self:AnchorBar( key );
end

function Gnosis:RemoveCastbar( key )
	if( self.activebars[key] ) then
		self.activebars[key] = nil;	-- remove bar so it won't be updated
	end
	self.castbars[key]:Hide();
	self.castbars[key] = nil;
	self.s.cbconf[key] = nil;

	-- update config options
	self:CreateCastbarsOpt();

	-- new castbar lookup tables
	self:CreateCBTables();
end

function Gnosis:OnDragStart()
	self:StartMoving();
end

function Gnosis:OnDragStop()
	self:StopMovingOrSizing();
	local s = self:GetEffectiveScale();
	local x,y = self:GetCenter();

	Gnosis.s.cbconf[self.name].anchor = {
			["x"] = x*s,
			["y"] = y*s,
			["s"] = s,
	};

	-- update coordinates of config options
	if( Gnosis.optCBs:IsShown() ) then
		Gnosis.optCBs:Hide();
		Gnosis.optCBs:Show();
	end
end

function Gnosis:OnMouseUp( button )
	if( button == "RightButton" ) then
		InterfaceOptionsFrame_OpenToCategory( Gnosis.optCBs );
	end
end

function Gnosis:MakeBarMovable( name, status )
	self.castbars[name]:EnableMouse( status );
	self.castbars[name]:SetMovable( status );
	self.castbars[name]:RegisterForDrag( "LeftButton" );
	self.castbars[name]:SetScript( "OnDragStart", Gnosis.OnDragStart );
	self.castbars[name]:SetScript( "OnDragStop", Gnosis.OnDragStop );
	self.castbars[name]:SetScript( "OnMouseUp", Gnosis.OnMouseUp );
end

function Gnosis:SetupSwingBarForParry( cb, fCurTime )
	local barname, cfg = cb.name, cb.conf;

	if( not self.activebars[barname] or cb.hasted ) then
		return;
	end

	local timeremain = cb.endTime - fCurTime;
	local timeremainperc = timeremain / cb.duration;

	-- information taken from http://elitistjerks.com/f31/t15257-melee_combat_riddle_me_parry_mechanics/
		-- accuracy of the given formulae and latency problems can screw up parry haste estimations quite badly
	if( timeremainperc >= 0.6 ) then
		cb.endTime = cb.endTime - cb.duration * 0.4;
		cb.duration = (cb.endTime - fCurTime) / timeremainperc;
	elseif( timeremainperc >= 0.2 ) then
		cb.endTime = cb.endTime - cb.duration / (1 + 2.5*timeremainperc*timeremainperc - 0.36*timeremainperc - 0.005);
		cb.duration = (cb.endTime - fCurTime) / timeremainperc;
	end
end

function Gnosis:SetupSwingBar( cb, spell, icon, fCurTime, bMeleeSwing )
	local barname, cfg = cb.name, cb.conf;

	if( self.activebars[barname] or self.fadeoutbars[barname] ) then
		self:CleanupCastbar( cb );
	end

	cb.channel = false;
	cb.duration = (bMeleeSwing and UnitAttackSpeed( "player" ) or UnitRangedDamage( "player" )) * 1000;
	cb.endTime = fCurTime + cb.duration;
	cb.icon:SetTexture( icon );
	cb.id = nil;
	cb.hasted = false;	-- do not allow more than one parry haste per swing (even though that might be wrong)

	cb.ctext:SetText( self:CreateCastname( cb, cfg, spell, "" ) );
	cb.castname = "";

	local val = (cb.endTime - fCurTime) / (cb.duration);
	cb.bar:SetValue( (cb.channel and (1-val) or val) );
	cb:SetAlpha( cfg.alpha );
	cb:Show();

	-- initial time
	local tx = Gnosis:GenerateTimerString( cb, cfg, fCurTime );
	cb.rtext:SetText( tx );

	-- adjust text size (long strings)
	if( cfg.bResizeLongName ) then
		cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65, cb.defFO );
		local factor = (cb.bar:GetWidth() - (cb.rtext:GetStringWidth() + 20)) / cb.ctext:GetStringWidth();
		if( factor < 1.0 and factor > 0.0 ) then
			cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65 * factor, cb.defFO );
		end
	end

	-- castbar spark
	if( cfg.bShowCBS ) then
		cb.cbs:SetPoint( "CENTER", cb.bar, "LEFT", (cb.channel and (1-val) or val) * cb.barwidth, 0 );
		cb.cbs:Show();
	end

	-- pushback (also vital for clipping test)
	cb.pushback = 0;

	-- set bar active
	cb.bActive = true;
	self.activebars[barname] = cb;
end

function Gnosis:SetupGCDbar( cb, spell, rank, fCurTime, right2left )
	local barname, cfg = cb.name, cb.conf;

	local start, cd = GetSpellCooldown( spell );
	if( not start or not( cd > 0 and cd <= 1.5) ) then
		return;
	end

	-- blacklisted?
	if( cfg.bnwtypesel == 2 and cfg.bnwlist ) then
		for key, value in pairs(cfg.bnwlist) do
			if( value == spell ) then
				return;
			end
		end
	-- not whitelisted?
	elseif( cfg.bnwtypesel == 3 and cfg.bnwlist ) then
		local bReturn = true;
		for key, value in pairs(cfg.bnwlist) do
			if( value == spell ) then
				bReturn = false;
				break;
			end
		end

		if( bReturn ) then
			return;
		end
	end

	if( self.activebars[barname] ~= nil or self.fadeoutbars[barname] ~= nil ) then
		self:CleanupCastbar( cb );
	end

	local _, _, icon = GetSpellInfo( spell );
	cb.channel = right2left;
	cb.duration = cd * 1000;
	cb.endTime = start * 1000 + cd * 1000;
	cb.icon:SetTexture( icon );
	cb.id = nil;

	cb.ctext:SetText( self:CreateCastname( cb, cfg, spell, rank ) );
	cb.castname = "";

	local val = (cb.endTime - fCurTime) / (cb.duration);
	cb.bar:SetValue( (cb.channel and (1-val) or val) );
	cb:SetAlpha( cfg.alpha );
	cb:Show();

	-- initial time
	local tx = Gnosis:GenerateTimerString( cb, cfg, fCurTime );
	cb.rtext:SetText( tx );

	-- adjust text size (long strings)
	if( cfg.bResizeLongName ) then
		cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65, cb.defFO );
		local factor = (cb.bar:GetWidth() - (cb.rtext:GetStringWidth() + 20)) / cb.ctext:GetStringWidth();
		if( factor < 1.0 and factor > 0.0 ) then
			cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65 * factor, cb.defFO );
		end
	end

	-- castbar spark
	if( cfg.bShowCBS ) then
		cb.cbs:SetPoint( "CENTER", cb.bar, "LEFT", (cb.channel and (1-val) or val) * cb.barwidth, 0 );
		cb.cbs:Show();
	end

	-- pushback (also vital for clipping test)
	cb.pushback = 0;

	-- set bar active
	cb.bActive = true;
	self.activebars[barname] = cb;
end

function Gnosis:SetupMirrorbar( cb, label, channel, curval, maxval, fCurTime, timer )
	local barname, cfg = cb.name, cb.conf;

	-- blacklisted?
	if( cfg.bnwtypesel == 2 and cfg.bnwlist ) then
		for key, value in pairs(cfg.bnwlist) do
			if( value == label ) then
				return false;
			end
		end
	-- not whitelisted?
	elseif( cfg.bnwtypesel == 3 and cfg.bnwlist ) then
		local bReturn = true;
		for key, value in pairs(cfg.bnwlist) do
			if( value == label ) then
				bReturn = false;
				break;
			end
		end

		if( bReturn ) then
			return false;
		end
	end

	if( self.activebars[barname] ~= nil or self.fadeoutbars[barname] ~= nil ) then
		self:CleanupCastbar( cb );
	end

	cb.channel = channel;
	cb.duration = maxval;
	cb.endTime = channel and fCurTime + curval or fCurTime + maxval - curval;
	cb.icon:SetTexture( self.tMirrorIcons[timer] );
	cb.id = nil;

	cb.ctext:SetText( self:CreateCastname( cb, cfg, label, "" ) );
	cb.castname = timer;

	cb.bar:SetValue( curval );
	cb:SetAlpha( cfg.alpha );
	cb:Show();

	-- initial time
	local tx = Gnosis:GenerateTimerString( cb, cfg, fCurTime );
	cb.rtext:SetText( tx );

	-- adjust text size (long strings)
	if( cfg.bResizeLongName ) then
		cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65, cb.defFO );
		local factor = (cb.bar:GetWidth() - (cb.rtext:GetStringWidth() + 20)) / cb.ctext:GetStringWidth();
		if( factor < 1.0 and factor > 0.0 ) then
			cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65 * factor, cb.defFO );
		end
	end

	-- castbar spark
	if( cfg.bShowCBS ) then
		cb.cbs:SetPoint( "CENTER", cb.bar, "LEFT", (channel and curval or maxval - curval) * cb.barwidth, 0 );
		cb.cbs:Show();
	end

	-- pushback (also vital for clipping test)
	cb.pushback = 0;

	-- set bar active
	cb.bActive = true;
	self.activebars[barname] = cb;

	return true;
end

function Gnosis:CreateCastname( cb, cfg, name, rank )
	local castname = "";
	if( cfg.bUseNameFormat ) then
		if( cfg.strNameFormat ~= "" ) then
			castname = self:CreateCastnameFromString( name, rank, cb, cfg );
		end
	elseif( cfg.bShowCastname and cfg.bShowCastrank ) then
		castname = name .. ((rank ~= "") and (" (" .. rank .. ")") or "");
	elseif( cfg.bShowCastname ) then
		castname = name;
	elseif( cfg.bShowCastrank ) then
		castname = rank;
	end

	return castname;
end

function Gnosis:CreateCastnameFromString( name, rank, cb, cfg )
	-- substitute strings
	local bRank = false;
	local bOther = false;
	local iRank, strRankArabic;
	local strRankRoman = "";
	local lenname;
	local strFormat, unit = cfg.strNameFormat, cfg.unit;
	local uname = UnitName( unit );
	local str = strFormat;

	-- spell school colors, format is col<r,g,b[,a]> or col<spellschool>
		-- e.g. col<1.0,0.5,0.5,1.0>; col<shadow>
		-- col<prev> will be replace with "|r"
	str = self:ReplaceColorStrings( str );

	strRankArabic = string.match( rank, "(%d+)" );
	if( strRankArabic ) then
		local i;
		iRank = tonumber( strRankArabic );

		-- create roman numeral 1..38, since 50 'L' is not supported (yet)
		while( true ) do
			if( iRank > 38 ) then
				-- probably no rank! abort
				break;
			elseif( iRank >= 9 ) then
				strRankRoman = strRankRoman .. "X";
				iRank = iRank - 10;
			elseif( iRank >= 4 ) then
				strRankRoman = strRankRoman .. "V";
				iRank = iRank - 5;
			elseif( iRank >= 1 ) then
				strRankRoman = strRankRoman .. "I";
				iRank = iRank - 1;
			elseif( iRank == 0 ) then
				-- done
				bRank = true;
				break;
			elseif( iRank >= -4 ) then
				strRankRoman = "I" .. strRankRoman;
				iRank = iRank + 1;
			elseif( iRank >= -9 ) then
				strRankRoman = "V" .. strRankRoman;
				iRank = iRank + 5;
			end
		end
	end

	if( not bRank and rank and rank ~= "" ) then
		bOther = true;
	end

	lenname = string.match( str, "abbr<(%d*)>" );
	str = string.gsub( str, "abbr<([^>]*)>", "abbr" );

	lenname = tonumber( lenname ) and tonumber( lenname ) or nil;
	if( lenname ) then
		local bMulti = false;

		if( string.len( name ) > lenname ) then
			-- string too long, abbreviate
			local abbrstr = "";
			local ncpy = name;
			local i = 0;

			while i < 10 do
				i = i + 1;	-- maximize word count to 10, also make sure while loop won't lock client up (especially with specific locales)

				local ltmp = string.match( ncpy, "([^%s%-%/%_%:%.]+)" );

				if( not ltmp ) then
					break;
				end

				ncpy = string.gsub( ncpy, ltmp, "" );

				if( not bMulti and string.match( ncpy, "([^%s]+)" ) ) then
					bMulti = true;
				end

				if( bMulti ) then
					abbrstr = abbrstr .. (string.match( ltmp, "(%u+)" ) and string.match( ltmp, "(%u+)" ) or string.match( ltmp, "(%l?)" ));
				else
					abbrstr = string.sub( ltmp, 1, lenname );
				end
			end

			str = string.gsub( str, "abbr", abbrstr );
		else
			str = string.gsub( str, "abbr", name );
		end
	end

	str = string.gsub( str, "name", name );
	if( bRank ) then
		str = string.gsub( str, "arabic", strRankArabic );
		str = string.gsub( str, "roman", strRankRoman );
		str = string.gsub( str, "rank<([^>]+)>", "%1" );
		str = string.gsub( str, "txr<([^>]+)>", "%1" );
	else
		str = string.gsub( str, "arabic", "" );
		str = string.gsub( str, "roman", "" );
		str = string.gsub( str, "rank<([^>]+)>", "" );
		str = string.gsub( str, "txr<([^>]+)>", "" );
	end

	if( bOther ) then
		str = string.gsub( str, "misc", rank );
		str = string.gsub( str, "txm<([^>]+)>", "%1" );
	else
		str = string.gsub( str, "misc", "" );
		str = string.gsub( str, "txm<([^>]+)>", "" );
	end

	if( cb.bIsTrade ) then
		str = string.gsub( str, "tscur", string.format( "%.0f", cb.tscnt ) );
		str = string.gsub( str, "tstot", string.format( "%.0f", cb.tstot ) );
		str = string.gsub( str, "txts<([^>]+)>", "%1" );
	else
		str = string.gsub( str, "tscur", "" );
		str = string.gsub( str, "tstot", "" );
		str = string.gsub( str, "txts<([^>]+)>", "" );
	end

	-- target information (player castbar only)
	local strTarget = nil;
	if( unit == "player" and self.strLastTarget and string.len(self.strLastTarget) > 0 ) then
		strTarget = self.strLastTarget;
	end

	if( strTarget ) then
		str = string.gsub( str, "tar<([^>]+)>", "%1" );
		str = string.gsub( str, "target", strTarget );
	else
		str = string.gsub( str, "tar<([^>]+)>", "" );
		str = string.gsub( str, "target", "" );
	end

	-- unit name
	if( uname ) then
		str = string.gsub( str, "who", uname );
	else
		str = string.gsub( str, "who", "" );
	end

	-- new line
	str = string.gsub( str, "\\n", "\n" );

	return str;
end

function Gnosis:ReplaceStringWithTime( strSrc, strCmd, fTime, bRemove )
	local rep, sub, n, repstr, bMin, bSign, subs;
	rep = string.match( strSrc, strCmd .. "<(.-)>" );

	if( rep ) then
		sub, subs = string.gsub( rep, "m", "" );
		bMin = subs > 0;
		sub, subs = string.gsub( sub, "s", "" );
		bSign = subs > 0;

		if( bRemove ) then
			strSrc = string.gsub( strSrc, strCmd .. "<" .. rep .. ">", "" );
		else
			n = tonumber( sub );
			if( n ) then
				strf = "%" .. (bSign and "+" or "") .. "." .. n .. "f";

				if( bMin and fTime > 60.0 ) then
					repstr = string.format( "%.0f:%02.0f", floor(fTime / 60.0), floor(fTime) % 60.0 )
				else
					repstr = string.format( strf, fTime );
				end
				strSrc = string.gsub( strSrc, strCmd .. "<" .. rep .. ">", repstr );
			else
				strSrc = string.gsub( strSrc, strCmd .. "<" .. rep .. ">", "" );
			end
		end
	end

	return strSrc;
end

function Gnosis:GenerateTimerString( cb, conf, fCurTime )
	local val = (cb.endTime - fCurTime) / (cb.duration);
	local valleft, valtot = (cb.endTime - fCurTime) / 1000, cb.duration / 1000;

	local tx;
	-- add timer
	if( conf.bUseTimeFormat ) then
		local str, sub, n;
		-- add times
		tx = self:ReplaceColorStrings( conf.strTimeFormat );
		tx = self:ReplaceStringWithTime( tx, "r", valleft );
		tx = self:ReplaceStringWithTime( tx, "t", valtot );
		tx = self:ReplaceStringWithTime( tx, "c", valtot - valleft );

		-- new line
		tx = string.gsub( tx, "\\n", "\n" );

		if( cb.pushback and cb.pushback ~= 0.0 ) then
			tx = self:ReplaceStringWithTime( tx, "p", cb.pushback / 1000 );
		else
			tx = self:ReplaceStringWithTime( tx, "p", nil, true );
		end
	else
		if( conf.bHideCasttime and conf.bHideCasttimeTotal ) then
			tx = "";
		elseif( conf.bHideCasttimeTotal ) then
			if( conf.bShowAsMinutes and valleft >= 60.0 ) then
				tx = string.format( "%.0f:%02.0f", floor(valleft / 60.0), floor(valleft) % 60.0 );
			else
				tx = string.format( "%.1f", valleft );
			end
		elseif( conf.bHideCasttime ) then
			if( conf.bShowAsMinutes and valtot >= 60.0 ) then
				tx = string.format( "%.0f:%02.0f", floor(valtot / 60.0), floor(valtot) % 60.0 );
			else
				tx = string.format( "%.2f", valtot );
			end
		else
			if( conf.bShowAsMinutes ) then
				if( valleft >= 60.0 ) then
					tx = string.format( "%.0f:%02.0f / ", floor(valleft / 60.0), floor(valleft) % 60.0 );
				else
					tx = string.format( "%.1f / ", valleft );
				end

				if( valtot >= 60.0 ) then
					tx = tx .. string.format( "%.0f:%02.0f", floor(valtot / 60.0), floor(valtot) % 60.0 );
				else
					tx = tx .. string.format( "%.2f", valtot );
				end
			else
				tx = string.format( "%.1f / %.2f", valleft, valtot );
			end
		end

		-- add pushback text
		if( cb.pushback and cb.pushback ~= 0.0 and (not conf.bHidePushbackTime) ) then
			local r, g, b = unpack( conf.colTextPB );
			r, g, b = r*255, g*255, b*255;
			tx = string.format( "|cff%02x%02x%02x%+.2f|r ", r, g, b, cb.pushback / 1000 ) .. tx;
		end
	end

	return tx;
end

function Gnosis:SetupCastbar( cb, bIsChannel, fCurTime )
	local barname, cfg = cb.name, cb.conf;

	local name, rank, displayName, texture, startTime, endTime, isTradeSkill, notInterruptible, id;
	if( bIsChannel ) then
		name, rank, displayName, texture, startTime, endTime, isTradeSkill, notInterruptible = UnitChannelInfo( cfg.unit );
	else
		name, rank, displayName, texture, startTime, endTime, isTradeSkill, id, notInterruptible = UnitCastingInfo( cfg.unit );
	end

	if( not name ) then
		return;
	end

	-- blacklisted?
	if( cfg.bnwtypesel == 2 and cfg.bnwlist ) then
		for key, value in pairs(cfg.bnwlist) do
			if( value == name ) then
				return;
			end
		end
	-- not whitelisted?
	elseif( cfg.bnwtypesel == 3 and cfg.bnwlist ) then
		local bReturn = true;
		for key, value in pairs(cfg.bnwlist) do
			if( value == name ) then
				bReturn = false;
				break;
			end
		end

		if( bReturn ) then
			return;
		end
	end

	-- tradeskill stuff
	local bDoResize = true;
	local bnTS = true;
	if( cfg.unit == "player" and cfg.bMergeTrade ) then
		if( isTradeSkill ) then
			bnTS = false;
			cb.tscnt = self.iLastTradeSkillCnt and self.iLastTradeSkillCnt or 1;
			if( cb.bIsTrade and (not self.bNewTradeSkill) ) then
				-- tradeskill in progress
				cb.duration = (fCurTime - cb.starttime) * cb.tstot / (cb.tstot - cb.tscnt);
				cb.endTime = cb.duration + cb.starttime;

				bDoResize = false;
			elseif( cb.tscnt > 1 and self.bNewTradeSkill ) then
				-- new tradeskill merge, don't start if repeat count less than 2
				if( (self.activebars[barname] or self.fadeoutbars[barname]) ) then
					self:CleanupCastbar( cb );
				end

				cb.bIsTrade = true;
				cb.starttime = fCurTime;
				cb.tstot = cb.tscnt;
				cb.duration = (endTime - startTime) * cb.tscnt + self.lag * (cb.tscnt - 1);
				cb.endTime = cb.duration + cb.starttime;
			else
				cb.bIsTrade = nil;

				if( (self.activebars[barname] or self.fadeoutbars[barname]) ) then
					self:CleanupCastbar( cb );
				end

				cb.duration = endTime - startTime;
				cb.endTime = endTime;
			end
		else
			self.bNewTradeSkill = nil;
			self.iLastTradeSkillCnt = nil;
		end
	end

	if( bnTS ) then
		cb.bIsTrade = nil;

		if( (self.activebars[barname] or self.fadeoutbars[barname]) ) then
			self:CleanupCastbar( cb );
		end

		cb.duration = endTime - startTime;
		cb.endTime = endTime;
	end

	-- castbar values
	cb.channel = bIsChannel;
	cb.icon:SetTexture( texture );
	cb.id = id;

	-- show castbar text
	cb.ctext:SetText( self:CreateCastname( cb, cfg, name, rank ) );
	cb.castname = name;

	-- set statusbar value
	local val = (cb.endTime - fCurTime) / (cb.duration);
	val = cb.channel and val or (1 - val);
	cb.bar:SetValue( val );
	cb:SetAlpha( cfg.alpha );
	cb:Show();

	-- initial time
	local tx = self:GenerateTimerString( cb, cfg, fCurTime );
	cb.rtext:SetText( "0" );	-- safety width
	local rtadd = cb.rtext:GetStringWidth();
	cb.rtext:SetText( tx );

	-- adjust text size (long strings)
	if( cfg.bResizeLongName and bDoResize ) then
		local gap = cfg.strGap;
		cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65, cb.defFO );
		local factor = (cb.barwidth - (cb.rtext:GetStringWidth() + gap + rtadd)) / cb.ctext:GetStringWidth();
		if( factor < 1.0 and factor > 0.0 ) then
			cb.ctext:SetFont( cb.defFont, cb.defFS * 0.65 * factor, cb.defFO );
		end
	end

	-- border color
	if( notInterruptible ) then
		self:SetBorderColor( barname, cfg.colBorderNI, cfg.colBarBg );
	else
		self:SetBorderColor( barname, cfg.colBorder, cfg.colBarBg );
	end

	-- castbar spark
	if( cfg.bShowCBS ) then
		cb.cbs:SetPoint( "CENTER", cb.bar, "LEFT", val * cb.barwidth, 0 );
		cb.cbs:Show();
	end

	-- latency & ticks
	local cs = self.s.channeledspells[cb.castname];
	if( cs and cs.ben ) then
		local ftbt = cs.binit and (1/(cs.ticks-1)) or (1/cs.ticks);
		local valLBperc = ((cfg.unit == "player") and min( self.lag / cb.duration, cfg.latbarsize ) or cfg.latbarfixed);
		-- never create latency box larger than half of distance between ticks
		-- vital for long channels with high number of ticks (e.g. hellfire with 15 ticks)
		valLBperc = min( valLBperc, ftbt * 0.5 );
		local valLB = (cfg.orient == 2 and cb.barheight or cb.barwidth) * valLBperc;

		if( cfg.bShowTicks ) then
			for i = 1, cs.ticks do
				if( i <= cs.bars ) then
					cb.lb[i]:ClearAllPoints();
					if( cfg.orient == 2 ) then
						if( cfg.bInvDir ) then
							cb.lb[i]:SetPoint( "TOP", 0, -cb.barheight * (i-1) * ftbt );
						else
							cb.lb[i]:SetPoint( "BOTTOM", 0, cb.barheight * (i-1) * ftbt );
						end
						cb.lb[i]:SetHeight( valLB );
					else
						if( cfg.bInvDir ) then
							cb.lb[i]:SetPoint( "RIGHT", -cb.barwidth * (i-1) * ftbt, 0 );
						else
							cb.lb[i]:SetPoint( "LEFT", cb.barwidth * (i-1) * ftbt, 0 );
						end
						cb.lb[i]:SetWidth( valLB );
					end
					cb.lb[i]:Show();
				end
			end
		end

		-- spell is channeled, store tick information for possible clip test
		cb.ticks = {};
		for i = 1, cs.ticks do
			cb.ticks[i] = cb.endTime - (i-1) * ftbt * cb.duration;
		end
	end

	if( cfg.unit == "player" and self.lag < 10000 ) then
		-- < 10000ms should filter latency for most summoning stone timers, also hide latency when just too extreme

		-- latency box, played only
		if( not(cs and cs.ben and cfg.bShowTicks) and cfg.bShowLat ) then
			cb.lb[1]:ClearAllPoints();
			if( cfg.orient == 2 ) then
				cb.lb[1]:SetHeight( cb.barheight * min( self.lag / cb.duration, cfg.latbarsize ) );
				if( cfg.bInvDir ) then
					cb.lb[1]:SetPoint( cb.channel and "TOP" or "BOTTOM" );
				else
					cb.lb[1]:SetPoint( cb.channel and "BOTTOM" or "TOP" );
				end
			else
				cb.lb[1]:SetWidth( cb.barwidth * min( self.lag / cb.duration, cfg.latbarsize ) );
				if( cfg.bInvDir ) then
					cb.lb[1]:SetPoint( cb.channel and "RIGHT" or "LEFT" );
				else
					cb.lb[1]:SetPoint( cb.channel and "LEFT" or "RIGHT" );
				end
			end
			cb.lb[1]:Show();
		end

		-- latency text
		if( cfg.bShowPlayerLatency ) then
			-- < 10000ms should filter latency for most summoning stone timers, also hide latency when just too extreme
			if( cfg.alignlat == "LEFT" ) then
				cb.bltext:SetText( string.format( "%d", self.lag ) );
			elseif( cfg.alignlat == "RIGHT" ) then
				cb.brtext:SetText( string.format( "%d", self.lag ) );
			else
				if( cb.channel ) then
					cb.bltext:SetText( string.format( "%d", self.lag ) );
				else
					cb.brtext:SetText( string.format( "%d", self.lag ) );
				end
			end
		end
	end

	-- pushback (also vital for clipping test)
	cb.pushback = 0;

	-- set bar active
	cb.bActive = true;
	self.activebars[barname] = cb;
end

function Gnosis:UpdateCastbar( cb, startTime, endTime, spell )
	local barname, cfg = cb.name, cb.conf;

	local fSPB = endTime - cb.endTime;		-- added spell pushback
	cb.pushback = cb.pushback + fSPB;
	cb.endTime = endTime;

	local cs = self.s.channeledspells[cb.castname];
	if( cfg.bShowTicks and cs and cs.ben ) then
		for i = 1, cs.ticks do
			if( i <= cs.bars ) then
				if( cb.ticks[i] > cb.endTime ) then
					cb.lb[i]:Hide();
				else
					cb.lb[i]:ClearAllPoints();

					if( cfg.orient == 2 ) then
						if( cfg.bInvDir ) then
							cb.lb[i]:SetPoint( "TOP", 0, -cb.barheight * (cb.endTime-cb.ticks[i])/cb.duration );
						else
							cb.lb[i]:SetPoint( "BOTTOM", 0, cb.barheight * (cb.endTime-cb.ticks[i])/cb.duration );
						end
					else
						if( cfg.bInvDir ) then
							cb.lb[i]:SetPoint( "RIGHT", -cb.barwidth * (cb.endTime-cb.ticks[i])/cb.duration, 0 );
						else
							cb.lb[i]:SetPoint( "LEFT", cb.barwidth * (cb.endTime-cb.ticks[i])/cb.duration, 0 );
						end
					end
				end
			end
		end
	end
end

function Gnosis:PrepareCastbarForFadeout( cb, fCurTime )
	local barname, cfg = cb.name, cb.conf;

	if( self.activebars[barname] ) then
		cb.bActive = false;
		self.activebars[barname] = nil;
		self.fadeoutbars[barname] = cb;
		cb.endTime = fCurTime + cfg.fadeout * 1000;
		cb.duration = cfg.fadeout * 1000;
		cb.alpha = cfg.alpha;

		if( cfg.bFillup ) then
			cb.bar:SetValue( cb.channel and 0 or 1.0 );
			cb.cbs:Hide();
		end
	end
end

function Gnosis:CleanupCastbar( cb )
	local barname, cfg = cb.name, cb.conf;

	if( not cb ) then
		return;
	end

	cb.bActive = false;
	if( self.activebars[barname] ) then
		self.activebars[barname] = nil;
	end
	if( self.fadeoutbars[barname] ) then
		self.fadeoutbars[barname] = nil;
	end

	for i = 1, 15 do cb.lb[i]:Hide(); end
	cb.cbs:Hide();

	cb.ctext:SetText( cb.name );
	cb.rtext:SetText( "" );
	cb.bltext:SetText( "" );
	cb.brtext:SetText( "" );
	cb.icon:SetTexture( cfg.bUnlocked and self.toyIcon or nil );
	cb.bar:SetValue( 0.0001 );

	cb.bar:SetStatusBarColor( unpack( cfg.colBar ) );
	self:SetBorderColor( barname, cfg.colBorder, cfg.colBarBg );

	cb.bIsTrade = nil;
	cb.tscnt = 0;
	cb.tstot = 0;
end
