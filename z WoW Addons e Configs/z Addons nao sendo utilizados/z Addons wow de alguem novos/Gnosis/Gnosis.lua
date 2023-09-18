Gnosis = LibStub( "AceAddon-3.0" ):NewAddon( "Gnosis", "AceConsole-3.0", "AceEvent-3.0" );
Gnosis.gui = LibStub( "AceGUI-3.0" );
Gnosis.lsm = LibStub( "LibSharedMedia-3.0", 1 );
if( Gnosis.lsm ) then
	Gnosis.lsm:Register( "statusbar", "Waterline", "Interface\\Addons\\Gnosis\\Textures\\Waterline" );
	Gnosis.lsm:Register( "font", "Desyrel", "Interface\\Addons\\Gnosis\\Fonts\\DESYREL_.ttf" );
end

function Gnosis:InitialConfig()
	self.optFrame = LibStub( "AceConfigDialog-3.0" ):AddToBlizOptions( "Gnosis", self.L["AddonName"] );
	self.optCBs = LibStub( "AceConfigDialog-3.0" ):AddToBlizOptions( "Gnosis Castbars", Gnosis.L["TabCastbars"], "Gnosis" );
	LibStub( "AceConfigDialog-3.0" ):AddToBlizOptions( "Gnosis Channeled Spells", Gnosis.L["TabChanneledSpells"], "Gnosis" );
	LibStub( "AceConfigDialog-3.0" ):AddToBlizOptions( "Gnosis Combattext/Clip test", Gnosis.L["TabCTClipTest"], "Gnosis" );
	LibStub( "AceConfigDialog-3.0" ):AddToBlizOptions( "Gnosis Configurations", Gnosis.L["TabConfig"], "Gnosis" );
end

function Gnosis:Enable( status )
	if( status ) then
		-- enable addon
		LibStub("AceConfig-3.0"):RegisterOptionsTable( "Gnosis", self.opt );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Castbars", self.opt_cbs );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Channeled Spells", self.opt_css );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Combattext/Clip test", self.opt_ctclip );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Configurations", self.opt_configs );

		self:RegisterEvents();
		self:DefaultAllBars();

		-- blizzard castbar
		if( self.s.bHideBlizz ) then
			self:HideBlizzardCastbar( true );
		end
		-- mirror castbar
		if( self.s.bHideMirror ) then
			self:HideBlizzardMirrorCastbar( true );
		end
		-- pet/vehicle castbar
		if( self.s.bHidePetVeh ) then
			self:HideBlizzardPetCastbar( true );
		end
	else
		-- disable addon
		LibStub("AceConfig-3.0"):RegisterOptionsTable( "Gnosis", self.optdisabled );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Castbars", self.optempty );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Channeled Spells", self.optempty );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Combattext/Clip test", self.optempty );
		LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable( "Gnosis Configurations", self.optempty );

		self:UnregisterEvents();
		self:HideAllBars();

		-- blizzard castbar
		if( self.s.bHideBlizz ) then
			self:HideBlizzardCastbar( false );
		end
		-- mirror castbar
		if( self.s.bHideMirror ) then
			self:HideBlizzardMirrorCastbar( false );
		end
		-- pet/vehicle castbar
		if( self.s.bHidePetVeh ) then
			self:HideBlizzardPetCastbar( false );
		end
	end
end

function Gnosis:HideBlizzardCastbarIfStatusChange( status )
	if( self.s.bHideBlizz ~= status ) then
		self.s.bHideBlizz = status;
		self:HideBlizzardCastbar( self.s.bHideBlizz );
	end
end

function Gnosis:HideBlizzardCastbar( status )
	if( status ) then	-- hide castbar
		for key, value in pairs(self.tCastbarEvents) do
			if( CastingBarFrame:IsEventRegistered( value ) ) then
				table.insert( self.blizzcastbar, value );
			end
			CastingBarFrame:UnregisterEvent( value );
		end
		for key, value in pairs(self.tMiscEvents) do
			if( CastingBarFrame:IsEventRegistered( value ) ) then
				table.insert( self.blizzcastbar, value );
			end
			CastingBarFrame:UnregisterEvent( value );
		end
		if( #self.blizzcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgDisBlizCB"] );
			end
		else
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgBlizCBIsDis"] );
			end
		end
	else	-- restore castbar events, it might not actually enable the blizzard castbar if another addon hides it
		for key, value in pairs(self.blizzcastbar) do
			CastingBarFrame:RegisterEvent( value );
		end
		if( #self.blizzcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgBlizCBRestored"] );
			end
		end
		self.blizzcastbar = {};
	end
end

function Gnosis:HideBlizzardPetCastbarIfStatusChange( status )
	if( status == nil ) then
		status = false;
	end

	if( self.s.bHidePetVeh ~= status ) then
		self.s.bHidePetVeh = status;
		self:HideBlizzardPetCastbar( self.s.bHidePetVeh );
	end
end

function Gnosis:HideBlizzardMirrorCastbarIfStatusChange( status )
	if( self.s.bHideMirror ~= status ) then
		self.s.bHideMirror = status;
		self:HideBlizzardMirrorCastbar( self.s.bHideMirror );
	end
end

function Gnosis:HideBlizzardPetCastbar( status )
	if( status ) then	-- hide pet castbar
		for key, value in pairs(self.tCastbarEvents) do
			if( PetCastingBarFrame:IsEventRegistered( value ) ) then
				table.insert( self.petcastbar, value );
			end
			PetCastingBarFrame:UnregisterEvent( value );
		end
		for key, value in pairs(self.tMiscEvents) do
			if( PetCastingBarFrame:IsEventRegistered( value ) ) then
				table.insert( self.petcastbar, value );
			end
			PetCastingBarFrame:UnregisterEvent( value );
		end
		if( #self.petcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgDisPetCB"] );
			end
		else
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgPetCBIsDis"] );
			end
		end
	else	-- restore pet castbar events, it might not actually enable the blizzard castbar if another addon hides it
		for key, value in pairs(self.petcastbar) do
			PetCastingBarFrame:RegisterEvent( value );
		end
		if( #self.petcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgPetCBRestored"] );
			end
		end
		self.petcastbar = {};
	end
end

function Gnosis:HideBlizzardMirrorCastbar( status )
	if( status ) then	-- hide castbar
		for key, value in pairs(self.tMirrorEvents) do
			if( UIParent:IsEventRegistered( value ) ) then
				table.insert( self.blizzmirrorcastbar, value );
			end
			UIParent:UnregisterEvent( value );
		end
		if( #self.blizzmirrorcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgDisMirrCB"] );
			end
		else
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgMirrCBIsDis"] );
			end
		end
	else	-- restore mirror castbar events, it might not actually enable the blizzard mirror castbar if another addon hides it
		for key, value in pairs(self.blizzmirrorcastbar) do
			UIParent:RegisterEvent( value );
		end
		if( #self.blizzmirrorcastbar > 0 ) then
			if( not self.s.bHideAddonMsgs ) then
				self:Print( Gnosis.L["MsgMirrCBRestored"] );
			end
		end
		self.blizzmirrorcastbar = {};
	end
end

function Gnosis:OnInitialize()
	local unitkey = UnitName( "player" ) .. " - " .. GetRealmName();
	if( GnosisDB and GnosisDB.profiles and GnosisDB.profiles[unitkey] and
		GnosisDB.profileKeys and GnosisDB.profileKeys[unitkey] ) then
		-- copy to new char only based profile (to heavily cut down on mem usage)
		if( not GnosisChar ) then GnosisChar = {}; end
		if( not GnosisChar.profileKeys ) then GnosisChar.profileKeys = {}; end
		if( not GnosisChar.profiles ) then GnosisChar.profiles = {}; end
		GnosisChar.profileKeys[unitkey] = unitkey;
		GnosisChar.profiles[unitkey] = self:deepcopy( GnosisDB.profiles[unitkey] );
		GnosisDB.profileKeys[unitkey] = nil;
		GnosisDB.profiles[unitkey] = nil;

		-- fully remove from db if empty
		if( self:tsize( GnosisDB.profiles ) == 0 ) then
			GnosisDB.profiles = nil;
		end
		if( self:tsize( GnosisDB.profileKeys ) == 0 ) then
			GnosisDB.profileKeys = nil;
		end
	end

	self.db = LibStub("AceDB-3.0"):New( "GnosisChar", defaults );
	self.s = self.db.profile;

	self:RegisterChatCommand( "gnosis", "HandleChatCommand" );

	-- tradeskill hooking
	hooksecurefunc( "DoTradeSkill", function( index, num )
			Gnosis.bNewTradeSkill = tonumber(num) and true or nil;
			Gnosis.iLastTradeSkillCnt = tonumber(num);
		end );
end

function Gnosis:OnEnable()
	-- set init values
	self:StartupVariables();

	-- load localization
	if( not self.s.strLocale and self.LSet[GetLocale()] ) then
		self.s.strLocale = GetLocale();
	elseif( not self.s.strLocale ) then
		self.s.strLocale = "default";
	end
	self:SetupLocale();

	-- basic tables
	self:OptCreateBasicTables();

	-- set default saved variables
	if( self.s.bAddonEn == nil ) then
		self.s.optver = self.optver;
	end
	for key, value in pairs( self.tDefaults ) do
		if( self.s[key] == nil ) then
			self.s[key] = value;
		end
	end

	if( not self.s.bHideAddonMsgs ) then
		self:Print( self.title .. " " .. Gnosis.L["MsgLoaded"] .. " " .. (self.s.bAddonEn and Gnosis.L["MsgEn"] or Gnosis.L["MsgDis"]) );
	end

	-- create table containing global libsharedmedia files
	self:CreateLSMTable();

	-- check castbar options
	self:CheckStoredCastbarOptions();

	-- first start?
	self:CheckForFirstStart();

	-- create saved castbars
	self:InitialCreateCastbars();

	-- add channeled spells to table
	self:SetupChanneledSpellsTable();

	-- create castbar options table
	self:CreateCastbarsOpt();
	self:CreateChannelSpellsOpt();
	self:OptCreateCTpage();
	self:OptCreateConfigurations();

	-- enable/disable addon
	self:InitialConfig();
	self:Enable( self.s.bAddonEn );

	-- get player GUID
	self.guid = UnitGUID( "player" );
end

function Gnosis:HandleChatCommand( cmd )
	InterfaceOptionsFrame_OpenToCategory( self.optFrame );
end

function Gnosis:RecreateAllBars()
	self:HideAllBars();

	self.castbars = {};
	self:CheckStoredCastbarOptions();
	self:InitialCreateCastbars();
end

function Gnosis:DefaultAllBars()
	for key, value in pairs( self.s.cbconf ) do
		self:SetBarParams( key );
	end
end

function Gnosis:HideAllBars()
	self.activebars = {};
	self.fadeoutbars = {};

	for key, value in pairs( self.castbars ) do
		value:Hide();
	end
end

function Gnosis:CreateLSMTable()
	local defaultdd, defaultlsmt = {
	 	["Waterline"] = "Waterline",
	},
	{
		["Waterline"] = "Interface\\Addons\\Gnosis\\Textures\\Waterline",
	};

	if( self.lsm ) then
		for _, name in next, self.lsm:List( "statusbar" ) do
			local dir = self.lsm:Fetch( "statusbar", name );

			if( dir ) then
				self.bartextures[name] = dir;
				self.bartexnames[name] = name;
			end
		end

		for _, name in next, self.lsm:List( "font" ) do
			local dir = self.lsm:Fetch( "font", name );

			self.fonts[""] = "";
			self.fontnames[""] = "";

			if( dir ) then
				self.fonts[name] = dir;
				self.fontnames[name] = name;
			end
		end

		for _, name in next, self.lsm:List( "sound" ) do
			local dir = self.lsm:Fetch( "sound", name );

			if( dir ) then
				self.music[name] = dir;
				self.musicnames[name] = name;
			end
		end

		if( self.bartextures == nil or self.bartextures == {} ) then
			self.bartextures = defaultlsmt;
			self.bartexnames = defaultdd;
		end
	else
		self.bartextures = defaultlsmt;
		self.bartexnames = defaultdd;
	end
end

function Gnosis:RegisterEvents()
	local key, value;

	for key, value in pairs(Gnosis.tCastbarEvents) do
		self:RegisterEvent( value );
	end

	for key, value in pairs(Gnosis.tMiscEvents) do
		self:RegisterEvent( value );
	end

	for key, value in pairs(Gnosis.tMirrorEvents) do
		self:RegisterEvent( value );
	end

	for key, value in pairs(Gnosis.tSwingEvents) do
		self:RegisterEvent( value );
	end
end

function Gnosis:UnregisterEvents()
	local key, value;

	for key, value in pairs(Gnosis.tCastbarEvents) do
		self:UnregisterEvent( value );
	end

	for key, value in pairs(Gnosis.tMiscEvents) do
		self:UnregisterEvent( value );
	end

	for key, value in pairs(Gnosis.tMirrorEvents) do
		self:UnregisterEvent( value );
	end

	for key, value in pairs(Gnosis.tSwingEvents) do
		self:UnregisterEvent( value );
	end
end

function Gnosis:RemoveChanneledSpell( name )
	if( self.s.channeledspells[name] ~= nil ) then
		 self.s.channeledspells[name] = nil;
		 self:CreateChannelSpellsOpt();
	end
end

function Gnosis:AddChanneledSpellByName( name, tickcount, bars, binit, baoe, school, bheal )
	if( name ) then
		if( bheal ) then
			tx = "col<0,1,0>(spellname - col<1,1,1>targetcol<pre>col<0,1,0>) [tickscrits] +eh <dmg> col<pre>dps HPShittext< Hits>crittext< Crits>ticktext< Ticks>";
		else
			if( school ) then
				tx = "col<" .. school .. ">dmg col<pre>col<1,1,0>(spellname) [tickscrits]col<pre>clipped dps DPScliptext<(Clipped) >hittext< Hits>crittext< Crits>ticktext< Ticks>";
			else
				tx = "dmg col<1,1,0>(spellname) [tickscrits]col<pre>clipped dps DPScliptext<(Clipped) >hittext< Hits>crittext< Crits>ticktext< Ticks>";
			end
		end

		-- do not overwrite (possibly user edited) entry
		if( self.s.channeledspells[name] == nil ) then
			self.s.channeledspells[name] = {
				ben = true,
				ticks = tickcount,
				bars = bars,
				binit = binit,
				baoe = baoe,
				bcliptest = false,
				bcombattext = false,
				bicon = true,
				bsticky = true,
				fontsizeclip = 0,
				fontsizenclip = 0,
				ctstring = tx,
			};
		end
	end
end

function Gnosis:AddChanneledSpellById( id, tickcount, bars, binit, baoe, school, bheal )
	name = GetSpellInfo( id );
	self:AddChanneledSpellByName( name, tickcount, bars, binit, baoe, school, bheal );
end

function Gnosis:SetupChanneledSpellsTable()
	-- ( spellid, #ticks, #shown ticks, first tick instant, multi mob (therefore no clipping detection), isheal )

	-- priest
	self:AddChanneledSpellById( 48156, 3, 3, false, false, "shadow" ); 	-- mind flay
	self:AddChanneledSpellById( 53023, 5, 5, false, true, "shadow" ); 	-- mind sear
	self:AddChanneledSpellById( 52985, 3, 2, true, false, "holy", true ); 	-- penance, first tick instant
	self:AddChanneledSpellById( 64843, 4, 4, false, true, "holy", true ); 	-- divine hymn
	self:AddChanneledSpellById( 64901, 4, 4, false, true, "holy" ); 	-- hymn of hope

	-- mage
	self:AddChanneledSpellById( 42940, 8, 8, false, true, "frost" ); 	-- blizzard
	self:AddChanneledSpellById( 42846, 5, 5, false, false, "arcane" );	-- arcane missles
	self:AddChanneledSpellById( 12051, 4, 4, false, false, "arcane" );	-- evocation

	-- warlock
	self:AddChanneledSpellById( 47855, 5, 5, false, false, "shadow" );	-- drain soul
	self:AddChanneledSpellById( 47857, 5, 5, false, false, "shadow" );	-- drain life
	self:AddChanneledSpellById( 5138, 5, 5, false, false, "shadow" );	-- drain mana
	self:AddChanneledSpellById( 47820, 4, 4, false, true, "fire" );		-- rain of fire
	self:AddChanneledSpellById( 47823, 15, 15, false, true, "fire" );	-- hellfire

	-- druid
	self:AddChanneledSpellById( 48447, 4, 4, false, true, "nature", true );	-- tranquility
	self:AddChanneledSpellById( 48467, 10, 10, false, true, "nature" );	-- hurricane

	-- hunter
	self:AddChanneledSpellById( 58434, 6, 6, false, true, "arcane" );	-- volley
end

Gnosis.colSchools = {
	physical	= "1, 1, 1, 1",
	holy		= "1, 1, 0.627, 1",
	fire		= "1, 0.5, 0.5, 1",
	nature		= "0.5, 1, 0.5, 1",
	frost		= "0.5, 0.5, 1, 1",
	shadow		= "0.628, 0, 0.628, 1",
	arcane		= "1, 0.725, 1, 1",
	frostfire	= "0.824, 0.314, 0.471, 1",
};

function Gnosis:CreateColorString( r, g, b, a )
	if( not (tonumber( r ) and tonumber( g ) and tonumber( b ) and tonumber ( a )) ) then
		return "";
	end

	local str = string.format( "%.2f, %.2f, %.2f, %.2f", r, g, b, a );
	return str;
end

function Gnosis:GetCoordinatesFromString( str )
	str = str .. ",0.0,0.0";	-- append safety net, also default coordinate

	local x, y = string.match( str, ".-([%+%-%.%d]+).-([%+%-%.%d]+)" );

	if( not(x and y and tonumber(x) and tonumber(y)) ) then
		return 0.0, 0.0;
	else
		return tonumber(x), tonumber(y);
	end
end

function Gnosis:GetColorsFromString( str, dst )
	str = str .. ",1.0,1.0,1.0,1.0";	-- append safety net (also default if illegal r,g,b values given
	local r, g, b, a = string.match( str, ".-([%+%-%.%d]+).-([%+%-%.%d]+).-([%+%-%.%d]+).-([%+%-%.%d]+)" );

	if( not (tonumber( r ) and tonumber( g ) and tonumber( b ) and tonumber ( a )) ) then
		r, g, b, a = nil, nil, nil, nil;
	else
		r, g, b, a = tonumber( r ), tonumber( g ), tonumber( b ), tonumber( a );
	end

	if( dst and r ) then
		dst.r, dst.g, dst.b, dst.a = r, g, b, a;
	end

	return r, g, b, a;
end

function Gnosis:ReplaceColorStrings( str )
	-- replace col<pre> with |r (messed up documention with both pre and prev, therefore both are valid)
		-- pre is preferred from 1.22 onwards
	str = string.gsub( str, "col<pre>", "|r" );
	str = string.gsub( str, "col<prev>", "|r" );

	local cnt = 0;	-- maximize loop cnt to make sure no lock ups can occur
					-- never had a lock up, just a precaution
	while cnt < 30 do
		cnt = cnt + 1;
		local colstr;
		local sub = string.match( str, "col<(.-)>" );
		if( not sub ) then
			break;
		end

		if( self.colSchools[sub] ) then
			colstr = self.colSchools[sub];
		else
			colstr = sub;
		end

		colstr = colstr .. ",1.0,1.0,1.0,1.0";	-- append safety net (also default if illegal r,g,b values given
		local r, g, b, a = string.match( colstr, ".-([%+%-%.%d]+).-([%+%-%.%d]+).-([%+%-%.%d]+).-([%+%-%.%d]+)" );

		r = tonumber( r ) * 255;
		g = tonumber( g ) * 255;
		b = tonumber( b ) * 255;
		a = tonumber ( a ) * 255;

		colstr = string.format( "|c%02x%02x%02x%02x", a, r, g, b );
		str = string.gsub( str, "col<" .. sub .. ">", colstr );
	end

	return str;
end

function Gnosis:GenerateCombattext( cc, cs, bClip )
	-- substitute strings
	local str = cs.ctstring;
	local sub;
	local clipped, hit, crit, tick;

	-- spell school colors, format is col<r,g,b[,a]> or col<spellschool>
		-- e.g. col<1.0,0.5,0.5,1.0>; col<shadow>
	str = string.gsub( str, "col<prev>", "|r" );
	str = self:ReplaceColorStrings( str );

	-- clipped text
	clipped = string.match( str, "cliptext<(.-)>" );
	clipped = clipped and clipped or "";
	str = string.gsub( str, "cliptext<(.-)>", "" );
	hit = string.match( str, "hittext<(.-)>" );
	hit = hit and hit or "";
	str = string.gsub( str, "hittext<(.-)>", "" );
	crit = string.match( str, "crittext<(.-)>" );
	crit = crit and crit or "";
	str = string.gsub( str, "crittext<(.-)>", "" );
	tick = string.match( str, "ticktext<(.-)>" );
	tick = tick and tick or "";
	str = string.gsub( str, "ticktext<(.-)>", "" );

	-- hits, crits, ticks, dmg, dps, clipped
	local dpstime = 1000 / (cc.freqtest and min(cc.freqtest-cc.starttime,cc.duration) or cc.duration);
	local tickscrits = string.format( "%d%s", cc.ticks, tick );
	if( cc.crits > 0 ) then tickscrits = string.format( "%s, %d%s", tickscrits, cc.crits, crit ); end

	str = string.gsub( str, "tickscrits", tickscrits );
	str = string.gsub( str, "spellname", string.format( "%s", cc.spell ) );
	str = string.gsub( str, "hits", string.format( "%d", cc.hits ) .. hit );
	str = string.gsub( str, "crits", string.format( "%d", cc.crits ) .. crit );
	str = string.gsub( str, "ticks", string.format( "%d", cc.ticks ) .. tick );
	str = string.gsub( str, "dmg", string.format( "%d", cc.dmg ) );
	str = string.gsub( str, "dps", string.format( "%d", cc.dmg * dpstime ) );
	str = string.gsub( str, "eh", string.format( "%d", cc.eh ) );
	str = string.gsub( str, "target", cc.target or "" );
	if( bClip )	then
		str = string.gsub( str, "clipped", clipped );
	else
		str = string.gsub( str, "clipped", "" );
	end

	-- string ready for combat text output
	local strTex = nil;
	local bSticky = nil;
	if( cs.bicon ) then strTex = cc.texture; end
	if( cs.bsticky and bClip ) then bSticky = true; end

	-- font size
	local fs = nil;
	if( bClip and cs.fontsizeclip > 0 ) then
		fs = cs.fontsizeclip;
	elseif( not bClip and cs.fontsizenclip > 0 ) then
		fs = cs.fontsizenclip;
	end

	if( self.s.ct.addon == "MSBT" and MikSBT and MikSBT.IsModDisabled() == nil ) then
		MikSBT.DisplayMessage( str, MikSBT.DISPLAYTYPE_OUTGOING, bSticky, nil, nil, nil, fs, nil, nil, strTex );
	elseif( self.s.ct.addon == "SCT" and SCT ) then
		SCT:DisplayText( str, nil, bSticky, "damage", cc.type and SCT.FRAME2 or SCT.FRAME3, nil, nil, strTex );
	elseif( self.s.ct.addon == "Parrot" and Parrot ) then
		Parrot:ShowMessage( str, "Outgoing", bSticky, 1, 1, 1, nil, fs, nil, strTex );
	elseif( self.s.ct.addon == "Blizz" and tostring(SHOW_COMBAT_TEXT) ~= "0" ) then
		CombatText_AddMessage( str, CombatText_StandardScroll, 1, 1, 1, bSticky, false );
	end
end

-- clip test
function Gnosis:SetupChannelData( fCurTime, name, startTime, endTime, texture )
	local cc = {};
	local cs = self.s.channeledspells[name];

	if( cs and cs.ben and (cs.bcliptest or cs.bcombattext) ) then
		local fTick = (endTime - startTime) / (cs.binit and (cs.ticks-1) or cs.ticks);

		cc.spell = name;
		cc.ftick = fTick;
		cc.endtime = endTime;
		cc.starttime = startTime;
		cc.duration = endTime - startTime;
		cc.maxticks = cs.ticks;
		cc.testtime = endTime + self.s.wfcl;
		cc.pushback = 0;
		cc.dmg = 0;
		cc.eh = 0;
		cc.ticks = 0;
		cc.hits = 0;
		cc.crits = 0;
		cc.bcliptest = cs.bcliptest;
		cc.baeo = cs.baoe;
		cc.texture = texture;
		cc.target = self.strLastTarget;

		if( self.curchannel ) then
			self.nextchannel = cc;
		else
			self.curchannel = cc;
		end
	end
end

function Gnosis:RequestClipTest( fCurTime )
	local cc, nc = self.curchannel, self.nextchannel;
	if( cc ) then
		if( nc and cc.spell == nc.spell ) then
			-- same spell, make sure ticks of spells don't overlap cliptest
			cc.freqtest = cc.freqtest and min(cc.freqtest,fCurTime) or fCurTime;
			cc.fforcedtest = cc.fforcedtest and min(cc.fforcedtest,nc.starttime + min( self.s.wfcl, nc.ftick )) or (nc.starttime + min( self.s.wfcl, nc.ftick ));
		else
			cc.freqtest = cc.freqtest and min(cc.freqtest,fCurTime) or fCurTime;
			cc.fforcedtest = cc.fforcedtest and min(cc.fforcedtest,fCurTime + self.s.wfcl) or (fCurTime + self.s.wfcl);
		end
	end
end

function Gnosis:ClipTest( fCurTime )
	local cc, nc = self.curchannel, self.nextchannel;

	if( cc ) then
		local cs = self.s.channeledspells[cc.spell];
		local bClip, bOutput = false, false;

		if( (not cs.baoe and cc.ticks == cc.maxticks) or fCurTime >= cc.testtime ) then
			-- check spell out, no clipping
			bOutput = true;
		elseif( cs.bcliptest and cc.fforcedtest and fCurTime >= cc.fforcedtest ) then	-- clip test requested
			-- test for clipping
		 	if( (not cs.baoe) and (((cc.ticks+1) * cc.ftick + cc.starttime) - cc.freqtest) <= self.s.ctt ) then
		 		-- probably unintentional clip, test for spell pushback
		 		if( ((cc.ticks+1) * cc.ftick) > (cc.duration - cc.pushback) ) then
		 			-- clipping impossible due to spell pushback
		 		else
		 			-- unintentional clipping detected, do not output as clip if player had no target when clip test was requested
					local tarname = UnitName( "target" );
					if( tarname and not UnitIsDead( "target" ) ) then
						bClip = true;
					end
		 		end
		 	end
		 	bOutput = true;
 		end

		if( bOutput ) then
			-- play clip sound and output to combat text
		  	if( bClip and cs.bcliptest ) then
		  		if( self.s.ct.bsound and self.s.ct.sound ) then
		  			PlaySound( self.s.ct.sound );
		  		end
		  		if( self.s.ct.bmusic and self.s.ct.music and Gnosis.music[self.s.ct.music] ) then
		  			PlaySoundFile( Gnosis.music[self.s.ct.music] );
		  		end
		 	end

		 	if( cs.bcombattext and cc.ticks > 0 ) then
		 		self:GenerateCombattext( cc, cs, bClip );
		 	end

		 	-- done, next channeled spell in queue
		 	self.curchannel = nil;
		 	self.curchannel = self.nextchannel;
		 	self.nextchannel = nil;
		end

	elseif( nc ) then
		self.curchannel = nil;
		self.curchannel = self.nextchannel;
		self.nextchannel = nil;
	end
end

function Gnosis:AddBasicCastbar( name, unit, movefactor_y, movefactor_x )
	local fScale = UIParent:GetScale();
	local cfg;

	if( self.s.cbconf[name] ) then
		self:RemoveCastbar( name );
	end

	self:OptCreateNewCastbar( name, unit );

	cfg = self.s.cbconf[name];
	cfg.anchor.y = cfg.anchor.y + movefactor_y * (self.tCastbarDefaults.height + 2) * fScale;
	cfg.anchor.x = cfg.anchor.x + movefactor_x * (self.tCastbarDefaults.height + self.tCastbarDefaults.width + 2) * fScale;
	self:AnchorBar( name );
end

function Gnosis:CreateBasicCastbarSet()
	self:AddBasicCastbar( self.L["CBSetPlayer"], "player", 2, 0 );
	self:AddBasicCastbar( self.L["CBSetTarget"], "target", 1, 0 );
	self:AddBasicCastbar( self.L["CBSetFocus"], "focus", 0, 0 );
	self:AddBasicCastbar( self.L["CBSetPet"], "pet", -2, 0 );
	self:AddBasicCastbar( self.L["CBSetMirror"], "mirror", 4, 0 );
end

function Gnosis:CreateMadnessSet()
	for i = 1, 99 do
		self:AddBasicCastbar( "Player " .. i, "player", 10-i%20, -2+floor(i/20) );
	end
end

function Gnosis:CreateGCDSwingTimers()
	self:AddBasicCastbar( self.L["CBSetGCD"], "gcd", -3, 0 );
	self:AddBasicCastbar( self.L["CBSetSwing"], "smr", -4, 0 );

	local cfg = self.s.cbconf[self.L["CBSetGCD"]];
	cfg.height = 3;
	cfg.border = 0;
	cfg.colBar = { 0.85, 0.85, 0.85, 0.70 };
	cfg.strNameFormat = "";
	cfg.strTimeFormat = "";
	cfg.iconside = "NONE";
	self:SetBarParams( self.L["CBSetGCD"] );

	cfg = self.s.cbconf[self.L["CBSetSwing"]];
	cfg.height = 3;
	cfg.border = 0;
	cfg.colBar = { 0.85, 0.85, 0.85, 0.70 };
	cfg.strNameFormat = "";
	cfg.strTimeFormat = "r<1>";
	cfg.fontsize_timer = 14;
	cfg.coord.casttime.y = -6;
	cfg.iconside = "NONE";
	self:SetBarParams( self.L["CBSetSwing"] );
end

function Gnosis:RedoLocalization()
	self:SetupLocale();
	-- recreate tables
	self:OptCreateBasicTables();
	self:CreateCastbarsOpt();
	self:CreateChannelSpellsOpt();
	self:OptCreateCTpage();
	self:OptCreateConfigurations();

	local hide = self.s.bHideAddonMsgs;
	self.s.bHideAddonMsgs = true;
	-- reload most of the addon for localization
	self:Enable( false );
	self:Enable( true );
	self.s.bHideAddonMsgs = hide;
end

function Gnosis:tsize( t )
	local i = 0;
	if( t and type( t ) == "table" ) then
		for k, v in pairs( t ) do
			i = i + 1;
		end
	end

	return i;
end

function Gnosis:CheckForFirstStart( bForce )
	if( self.s.bAddonEn and (bForce or ((not Gnosis.s) or self:tsize( Gnosis.s.cbconf ) == 0)) ) then
		local f = self.gui:Create( "Window" );
		f:SetCallback( "OnClose", function( w ) Gnosis.gui:Release( w ); end );
		f:SetTitle( Gnosis.L["AddonName"] );
		f:SetStatusText( Gnosis.L["IfCWAction"] );
		f:SetLayout( "Flow" );
		f:SetWidth( 500 );
		f:SetFullHeight( true );

		local h1 = self.gui:Create( "Heading" );
		if( (not Gnosis.s) or self:tsize( Gnosis.s.cbconf ) == 0 ) then
			h1:SetText( Gnosis.L["IfNoCBs"] );
		end
		h1.width = "fill";
		f:AddChild( h1 );

		local msg = self.gui:Create( "Label" );
		msg:SetText( Gnosis.L["IfCCSString"] );
		msg:SetFullWidth( true );
		f:AddChild( msg );

		local btnLCS = self.gui:Create( "Button" );
		btnLCS:SetWidth( 230 );
		btnLCS:SetText( Gnosis.L["IfCCSetup"] );
		btnLCS:SetCallback( "OnClick", function()
				Gnosis:CreateBasicCastbarSet();
				Gnosis:HideBlizzardCastbarIfStatusChange( true );
				Gnosis:HideBlizzardMirrorCastbarIfStatusChange( true );
				Gnosis:HideBlizzardPetCastbarIfStatusChange( true );
			end
		);
		f:AddChild( btnLCS );

		local btnLCS = self.gui:Create( "Button" );
		btnLCS:SetWidth( 230 );
		btnLCS:SetText( Gnosis.L["IfCCTimers"] );
		btnLCS:SetCallback( "OnClick", function()
				Gnosis:CreateGCDSwingTimers();
			end
		);
		f:AddChild( btnLCS );

		if( self:tsize( GnosisConfigs ) > 0 ) then
			local h2 = self.gui:Create( "Heading" );
			h2:SetText( Gnosis.L["IfConfigs"] );
			h2.width = "fill";
			f:AddChild( h2 );

			local msg2 = self.gui:Create( "Label" );
			msg2:SetText( Gnosis.L["IfLFConigs"] );
			msg2:SetFullWidth( true );
			f:AddChild( msg2 );

			for key, value in pairs(GnosisConfigs) do
				local butCfg = self.gui:Create( "Button" );
				butCfg:SetWidth( 230 );
				butCfg:SetText( key );
				butCfg:SetCallback( "OnClick", function()
						Gnosis:LoadConfig( key, true, true, true, true );
					end
				);
				f:AddChild( butCfg );
			end
		end

		local h3 = self.gui:Create( "Heading" );
		h3:SetText( "" );
		h3.width = "fill";
		f:AddChild( h3 );

		local btnGUI = self.gui:Create( "Button" );
		btnGUI:SetWidth( 230 );
		btnGUI:SetText( Gnosis.L["IfOpenGUI"] );
		btnGUI:SetCallback( "OnClick", function()
				InterfaceOptionsFrame_OpenToCategory( Gnosis.optFrame );
			end
		);
		f:AddChild( btnGUI );


		self.IntroFrame = f;
	end
end
