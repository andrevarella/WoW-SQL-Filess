Gnosis.tCastbarEvents = {
	"UNIT_SPELLCAST_CHANNEL_START",
	"UNIT_SPELLCAST_CHANNEL_STOP",
	"UNIT_SPELLCAST_CHANNEL_UPDATE",
	"UNIT_SPELLCAST_START",
	"UNIT_SPELLCAST_STOP",
	"UNIT_SPELLCAST_DELAYED",
	"UNIT_SPELLCAST_INTERRUPTIBLE",
	"UNIT_SPELLCAST_NOT_INTERRUPTIBLE",
	"UNIT_SPELLCAST_INTERRUPTED",
	"UNIT_SPELLCAST_FAILED",
	"UNIT_SPELLCAST_FAILED_QUIET",
	"UNIT_SPELLCAST_SUCCEEDED"
};

Gnosis.tMiscEvents = {
	"PLAYER_REGEN_DISABLED",
	"PLAYER_REGEN_ENABLED",
	"COMBAT_LOG_EVENT_UNFILTERED",
	"UNIT_SPELLCAST_SENT",
	"PLAYER_ENTERING_WORLD",
	"PLAYER_FOCUS_CHANGED",
	"PLAYER_TARGET_CHANGED",
};

Gnosis.tMirrorEvents = {
	"MIRROR_TIMER_START",
	"MIRROR_TIMER_STOP",
	"PLAYER_UNGHOST",
	"PLAYER_ALIVE",
};

Gnosis.tSwingEvents = {
	"PLAYER_ENTER_COMBAT",
	"PLAYER_LEAVE_COMBAT",
	"START_AUTOREPEAT_SPELL",
	"STOP_AUTOREPEAT_SPELL"
};

Gnosis.tMirrorIcons = {
	["BREATH"] = "Interface\\Icons\\Spell_Shadow_DemonBreath",
	["EXHAUSTION"] = "Interface\\Icons\\Ability_Suffocate",
	["FEIGNDEATH"] = "Interface\\Icons\\Ability_Rogue_FeignDeath",
};

function Gnosis:StartupVariables()

	local fCurTime = GetTime() * 1000;

	self.ver = 1.90;
	self.optver = 1.50;
	self.build = "v1.90";
	self.addonname = "Gnosis";
	local strVer = string.format( "v%.2f", self.ver );
	if( self.build == strVer ) then
		self.title = string.format( "%s %s", self.addonname, strVer );
	else
		self.title = string.format( "%s %s (%s)", self.addonname, strVer, self.build );
	end

	-- latency
	self.lag = 0.0;
	self.lastSpellSent = fCurTime;

	-- castbars
	self.castbars = {};		-- castbars
	self.activebars = {};	-- currently active bars (performance reasons)
	self.fadeoutbars = {};	-- bars to fade out
	self.cb_fl = {};

	-- (LibSharedMedia)
	self.bartexnames = {};
	self.bartextures = {};
	self.fonts = {};
	self.fontnames = {};
	self.music = {};
	self.musicnames = {};

	-- events registered to blizzard castbar
	self.blizzcastbar = {};
	self.petcastbar = {};

	-- events registered to blizzard mirror castbar
	self.blizzmirrorcastbar = {};

	-- clip test
	self.curchannel = nil;	-- currently channeling spell
	self.nextchannel = nil;	--

	-- default variables
	self.tDefaults = {
		bAddonEn = true,
		bHideBlizz = false,
		bHideMirror = false,
		bHidePetVeh = false,
		bHideAddonMsgs = false,

		-- castbar configs
		cbconf = {},
		nameNewBar = "",

		-- channeled spells
		channeledspells = {},

		-- combat text/clip
		ct = {
			bsound = true,
			bmusic = false,
			sound = "MONEYFRAMEOPEN",
			music = nil,
		},

		configs = {
			name = "",
			bsavecastbars = true,
			bsavespell = true,
			bsavedefaultopt = true,
			bsavectct = true,
		},

		-- clip test
		wfcl = 1000,	-- wait for combat log data (in ms), combat log timing tends to be bitchy (well, at least on Frostwolf)
		ctt = 300,		-- clip test time (in ms)
	};

	-- set default combat text addon, if multiple addons found than MSBT > Parrot > SCT
	self.tDefaults.ct.addon = (MikSBT and "MSBT" or (Parrot and "Parrot" or (SCT and "SCT" or "Blizz")));

	-- swing timer
	self.iSwing = 0;				-- 1 == melee (onehand), 2 == range
	self.bSwingBar = false;	-- combat log event unfiltered registered
	self.iExtraSwings = 0;
	self.bNextSwingNotExtra = false;
	_, self.class = UnitClass( "player" );
	self.bIsDruid = self.class == "DRUID";

	-- spells that reset swing timer
	self.tSwingReset = {
		-- warrior
		[GetSpellInfo( 47450 )] = true,		-- heroic strike
		[GetSpellInfo( 47520 )] = true,		-- cleave
		-- hunter
		[GetSpellInfo( 48996 )] = true,		-- raptor strike
		-- druid
		[GetSpellInfo( 48480 )] = true, 	-- maul
		-- dk
		[GetSpellInfo( 56815 )] = true, 	-- rune strike
	};

	self.tCastbarDefaults = {
		-- castbar options v
		cboptver = self.optver,

		-- default unit
		unit = "player",

		-- bar geometry
		width = 250,
		height = 20,
		border = 1.0,
		bordericon = 1.0,
		scale = 1.0,
		scaleicon = 1.0,
		alpha = 1.0,
		fadeout = 0.3;
		latbarsize = 0.15;
		latbarfixed = 0.02;

		-- coordinates
		coord = {
			castname = { x = 2, y = 0 },
			casttime = { x = -2, y = 0 },
			casticon = { x = 0, y = 0 },
			latency = { x = 1, y = 1 },
		},

		-- alignments
		alignment = "NAMETIME",	-- new alignment options for name and time (v1.30)
		alignname = "LEFT",		--
		aligntime = "RIGHT", 	--
		alignlat = "ADAPT",		--

		-- spark modifiers
		fSparkHeightMulti = 1.0,
		fSparkWidthMulti = 1.0,

		-- default bar colors (v1.30+)
		colBar = { 0.20, 0.30, 0.50, 0.70 },
		colBarBg = { 0.10, 0.10, 0.35, 0.40 },
		colLagBar  = { 0.35, 0.65, 0.90, 0.65 },
		colBorder = { 0.00, 0.00, 0.00, 0.75 },
		colBorderNI = { 1.00, 0.80, 0.00, 0.75 },
		colText = { 1.00, 1.00, 1.00, 1.00 },
		colTextTime = { 1.00, 1.00, 1.00, 1.00 },
		colTextLag = { 1.00, 0.00, 0.00, 1.00 },
		colTextPB = { 1.00, 0.00, 0.00, 1.00 },
		colInterrupted = { 0.55, 0.40, 0.30, 0.75 },
		colFailed = { 0.70, 0.30, 0.20, 0.75 },
		colSpark = { 1.00, 1.00, 1.00, 1.00 },

		-- default statusbar texture
		bartexture = "Waterline",

		-- bar settings
		anchor = nil,
		bEn = true,
		bShowWNC = false,	-- show when not casting
		bShowLat = true,	-- show latency box
		bShowCBS = true,	-- show castbar spark
		bShowTicks = true,	-- show channeled ticks
		bUnlocked = true,	-- unlocked when first created
		bShowCastname = true,	-- show both name
		bShowCastrank = true,	-- and spell rank
		bFillup = false,		-- fill bar up at end of cast
		iconside = "LEFT",		-- where to draw icon
		fontoutline = "NONE", 	-- font outline
		font = "Desyrel",		-- Desyrel font as default (v1.30)
		fontsize = 0,			-- automatic
		fontsize_timer = 0,		-- automatic
		fontsize_lat = 0,		-- automatic

		bnwtypesel = 1,			-- neither black-/whitelist
		bnwlist = {},			-- empty list to begin with
		bnwlistnew = "",		-- new entry box
		bResizeLongName = true,	-- automatic resize of long spell names
		strata = "MEDIUM",		-- medium frame strata
		bHideCasttime = false,	-- hide cast time
		bHideCasttimeTotal = false,	-- hide total casttime
		bHidePushbackTime = false, -- hide pushback time

		bUseNameFormat = true,	-- use castname string on default
		strNameFormat = "namecol<1.0,0.0,0.0>rank< R>arabictxm< (>misctxm<)>col<pre>txts< (>tscurtxts</>tstottxts<)>",	-- default castname string, rank text in red, tradeskill total cnt
		bUseTimeFormat = true,	-- use casttime string on default
		strTimeFormat = "col<1,0,0>p<2s>col<pre> r<1m> / t<2m>",	-- default casttime string
		bShowPlayerLatency = true,	-- do not show text latency information
		bShowAsMinutes = true,	-- show timer in minutes if longer than 60s
		bMergeTrade = true,		-- merge tradeskill information
		bIconUnlocked = false,	-- option to unlock icon (v1.31)
		strGap = 25,			-- minimum distance between name and time text

		rotateicon = 0,			-- rotate icon (degrees)
		orient = 1,				-- castbar orientation (horizontal, vertical)
		bInvDir = false,		-- invert bar direction
	};

	self.strAutoShot, _, self.iconAutoShot = GetSpellInfo( 75 );
	self.strAutoAttack, _, self.iconAutoAttack = GetSpellInfo( 6603 );
	self.strShootWand, _, self.iconShootWand = GetSpellInfo( 5019 );

	self.toyIcon = "Interface\\Icons\\Inv_Misc_Toy_07";

	if( not GnosisConfigs ) then
		GnosisConfigs = {};
	end
end

-- sound files
Gnosis.BlizzSounds = {
	["PVPENTERQUEUE"] = "PVPENTERQUEUE",
	["PVPTHROUGHQUEUE"] = "PVPTHROUGHQUEUE",
	["GAMEABILITYBUTTONMOUSEDOWN"] = "GAMEABILITYBUTTONMOUSEDOWN",
	["GAMESPELLBUTTONMOUSEDOWN"] = "GAMESPELLBUTTONMOUSEDOWN",
	["GAMETARGETFRIENDLYUNIT"] = "GAMETARGETFRIENDLYUNIT",
	["GAMETARGETHOSTILEUNIT"] = "GAMETARGETHOSTILEUNIT",
	["GAMETARGETNEUTRALUNIT"] = "GAMETARGETNEUTRALUNIT",
	["ACTIONBARBUTTONDOWN"] = "ACTIONBARBUTTONDOWN",
	["MINIMAPZOOMOUT"] = "MINIMAPZOOMOUT",
	["MINIMAPZOOMIN"] = "MINIMAPZOOMIN",
	["MINIMAPOPEN"] = "MINIMAPOPEN",
	["BAGMENUBUTTONPRESS"] = "BAGMENUBUTTONPRESS",
	["ITEMWEAPONSOUND"] = "ITEMWEAPONSOUND",
	["ITEMARMORSOUND"] = "ITEMARMORSOUND",
	["ITEMGENERICSOUND"] = "ITEMGENERICSOUND",
	["LEVELUPSOUND"] = "LEVELUPSOUND",
	["GLUECREATECHARACTERBUTTON"] = "GLUECREATECHARACTERBUTTON",
	["GLUEENTERWORLDBUTTON"] = "GLUEENTERWORLDBUTTON",
	["SPELLBOOKOPEN"] = "SPELLBOOKOPEN",
	["SPELLBOOKCLOSE"] = "SPELLBOOKCLOSE",
	["SPELLBOOKCHANGEPAGE"] = "SPELLBOOKCHANGEPAGE",
	["PAPERDOLLOPEN"] = "PAPERDOLLOPEN",
	["PAPERDOLLCLOSE"] = "PAPERDOLLCLOSE",
	["QUESTADDED"] = "QUESTADDED",
	["QUESTCOMPLETED"] = "QUESTCOMPLETED",
	["QUESTLOGOPEN"] = "QUESTLOGOPEN",
	["QUESTLOGCLOSE"] = "QUESTLOGCLOSE",
	["SHEATHINGSHIELDSHEATHE"] = "SHEATHINGSHIELDSHEATHE",
	["SHEATHINGWOODWEAPONSHEATHE"] = "SHEATHINGWOODWEAPONSHEATHE",
	["SHEATHINGMETALWEAPONSHEATHE"] = "SHEATHINGMETALWEAPONSHEATHE",
	["SHEATHINGWOODWEAPONUNSHEATHE"] = "SHEATHINGWOODWEAPONUNSHEATHE",
	["SHEATHINGMETALWEAPONUNSHEATHE"] = "SHEATHINGMETALWEAPONUNSHEATHE",
	["SHEATHINGSHIELDUNSHEATHE"] = "SHEATHINGSHIELDUNSHEATHE",
	["GAMEERRORUNABLETOEQUIP"] = "GAMEERRORUNABLETOEQUIP",
	["ITEMGENERICSOUND"] = "ITEMGENERICSOUND",
	["GAMEERRORINVALIDTARGET"] = "GAMEERRORINVALIDTARGET",
	["LEVELUP"] = "LEVELUP",
	["GAMEERROROUTOFRANGE"] = "GAMEERROROUTOFRANGE",
	["QUESTADDED"] = "QUESTADDED",
	["MONEYFRAMEOPEN"] = "MONEYFRAMEOPEN",
	["MONEYFRAMECLOSE"] = "MONEYFRAMECLOSE",
	["LOOTWINDOWOPEN"] = "LOOTWINDOWOPEN",
	["LOOTWINDOWCLOSE"] = "LOOTWINDOWCLOSE",
	["LOOTWINDOWCOINSOUND"] = "LOOTWINDOWCOINSOUND",
	["GAMEHIGHLIGHTHOSTILEUNIT"] = "GAMEHIGHLIGHTHOSTILEUNIT",
	["GAMEHIGHLIGHTNEUTRALUNIT"] = "GAMEHIGHLIGHTNEUTRALUNIT",
	["GAMEHIGHLIGHTFRIENDLYUNIT"] = "GAMEHIGHLIGHTFRIENDLYUNIT",
	["INTERFACESOUND_LOSTTARGETUNIT"] = "INTERFACESOUND_LOSTTARGETUNIT",
	["INTERFACESOUND_CURSORGRABOBJECT"] = "INTERFACESOUND_CURSORGRABOBJECT",
	["INTERFACESOUND_CURSORDROPOBJECT"] = "INTERFACESOUND_CURSORDROPOBJECT",
	["GAMESCREENMEDIUMBUTTONMOUSEDOWN"] = "GAMESCREENMEDIUMBUTTONMOUSEDOWN",
	["GAMEABILITYACTIVATE"] = "GAMEABILITYACTIVATE",
	["GAMESPELLACTIVATE"] = "GAMESPELLACTIVATE",
	["gsTitleEnterWorld"] = "gsTitleEnterWorld",
	["gsTitleOptions"] = "gsTitleOptions",
	["gsTitleQuit"] = "gsTitleQuit",
	["gsTitleCredits"] = "gsTitleCredits",
	["gsTitleIntroMovie"] = "gsTitleIntroMovie",
	["gsTitleOptionScreenResolution"] = "gsTitleOptionScreenResolution",
	["gsTitleOption16bit"] = "gsTitleOption16bit",
	["gsTitleOption32bit"] = "gsTitleOption32bit",
	["gsTitleOptionOpenGL"] = "gsTitleOptionOpenGL",
	["gsTitleOptionDirect3D"] = "gsTitleOptionDirect3D",
	["gsTitleOptionFullScreenMode"] = "gsTitleOptionFullScreenMode",
	["gsTitleOptionOK"] = "gsTitleOptionOK",
	["gsTitleOptionExit"] = "gsTitleOptionExit",
	["gsLogin"] = "gsLogin",
	["gsLoginNewAccount"] = "gsLoginNewAccount",
	["gsLoginChangeRealm"] = "gsLoginChangeRealm",
	["gsLoginExit"] = "gsLoginExit",
	["gsLoginChangeRealmOK"] = "gsLoginChangeRealmOK",
	["gsLoginChangeRealmSelect"] = "gsLoginChangeRealmSelect",
	["gsLoginChangeRealmCancel"] = "gsLoginChangeRealmCancel",
	["gsCharacterSelection"] = "gsCharacterSelection",
	["gsCharacterSelectionEnterWorld"] = "gsCharacterSelectionEnterWorld",
	["gsCharacterSelectionDelCharacter"] = "gsCharacterSelectionDelCharacter",
	["gsCharacterSelectionAcctOptions"] = "gsCharacterSelectionAcctOptions",
	["gsCharacterSelectionExit"] = "gsCharacterSelectionExit",
	["gsCharacterSelectionCreateNew"] = "gsCharacterSelectionCreateNew",
	["gsCharacterCreationClass"] = "gsCharacterCreationClass",
	["gsCharacterCreationRace"] = "gsCharacterCreationRace",
	["gsCharacterCreationGender"] = "gsCharacterCreationGender",
	["gsCharacterCreationLook"] = "gsCharacterCreationLook",
	["gsCharacterCreationCreateChar"] = "gsCharacterCreationCreateChar",
	["gsCharacterCreationCancel"] = "gsCharacterCreationCancel",
	["UChatScrollButton"] = "UChatScrollButton",
	["Deathbind Sound"] = "Deathbind Sound",
	["LOOTWINDOWOPENEMPTY"] = "LOOTWINDOWOPENEMPTY",
	["TaxiNodeDiscovered"] = "TaxiNodeDiscovered",
	["UnwrapGift"] = "UnwrapGift",
	["TellMessage"] = "TellMessage",
	["WriteQuest"] = "WriteQuest",
	["MapPing"] = "MapPing",
	["igBonusBarOpen"] = "igBonusBarOpen",
	["FriendJoinGame"] = "FriendJoinGame",
	["Fishing Reel in"] = "Fishing Reel in",
	["HumanExploration"] = "HumanExploration",
	["OrcExploration"] = "OrcExploration",
	["UndeadExploration"] = "UndeadExploration",
	["TaurenExploration"] = "TaurenExploration",
	["TrollExploration"] = "TrollExploration",
	["NightElfExploration"] = "NightElfExploration",
	["GnomeExploration"] = "GnomeExploration",
	["DwarfExploration"] = "DwarfExploration",
	["igPVPUpdate"] = "igPVPUpdate",
	["ReadyCheck"] = "ReadyCheck",
	["RaidWarning"] = "RaidWarning",
	["AuctionWindowOpen"] = "AuctionWindowOpen",
	["AuctionWindowClose"] = "AuctionWindowClose"
};
