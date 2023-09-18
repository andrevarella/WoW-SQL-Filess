Gnosis.LSet = {
	["default"] = "default (English)",
	["deDE"] = "deDE (Deutsch)",
	["frFR"] = "frFR (Français)",
	["koKR"] = "koKR (한국어/조선말)",
	["ruRU"] = "ruRU (русский язык)",
	["zhCN"] = "zhCN (简体中文)",
	["zhTW"] = "zhTW (繁体中文)",
}

function Gnosis:SetupLocale()
Gnosis.L = nil;
Gnosis.L = {};

if( self.s.strLocale == "deDE" ) then
-- deDE locale (german)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "Fokus"
Gnosis.L["CBSetGCD"] = "GCD" -- Requires localization
Gnosis.L["CBSetMirror"] = "Spiegel"
Gnosis.L["CBSetPet"] = "PetVehicle"
Gnosis.L["CBSetPlayer"] = "Spieler"
Gnosis.L["CBSetSwing"] = "Swing" -- Requires localization
Gnosis.L["CBSetTarget"] = "Ziel"
Gnosis.L["Horizontal"] = "Horizontal" -- Requires localization
Gnosis.L["IfCCSetup"] = "Create common setup" -- Requires localization
Gnosis.L["IfCCSString"] = [=[Gnosis can create a common castbar setup for you (bars for Player, Target, Focus, Mirror and Pet/Vehicle). The created bars will be unlocked and can be moved by dragging while holding down the left mouse button. Right clicking the bars will call the castbar configuration gui.

You should lock the bars when you are finished with moving and customizing. Both blizzard castbar and mirror castbar will be deactivated. You can also create a "Global Cooldown Indicator" and a "Swing Timer" (one handed melee and range including wand) by pressing the button below. The slash command to call the Gnosis gui is "/gnosis".
]=] -- Requires localization
Gnosis.L["IfCCTimers"] = "Create GCD/Swing timers" -- Requires localization
Gnosis.L["IfConfigs"] = "Configurations" -- Requires localization
Gnosis.L["IfCWAction"] = "Press button to close frame without taking any action" -- Requires localization
Gnosis.L["IfLFConigs"] = [=[
One or more stored configurations have been found. You can setup Gnosis by loading from any existing configuration, just press any of the buttons below (button name is the name of the configuration that will be loaded).
]=] -- Requires localization
Gnosis.L["IfNoCBs"] = "Keine Zauberleisten gefunden"
Gnosis.L["IfOpenGUI"] = "Open config GUI" -- Requires localization
Gnosis.L["MsgBlizCBIsDis"] = "Blizzard Castbar bereits durch anderes Addon deaktiviert"
Gnosis.L["MsgBlizCBRestored"] = "Blizzard Castbar wiederhergestellt (siehe Konfiguration)"
Gnosis.L["MsgDis"] = "(deaktiviert)"
Gnosis.L["MsgDisBlizCB"] = "Blizzard Castbar deaktiviert (siehe Konfiguration)"
Gnosis.L["MsgDisMirrCB"] = "Blizzard Spiegelleiste deaktiviert (siehe Konfiguration)"
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)" -- Requires localization
Gnosis.L["MsgEn"] = "(aktiviert)"
Gnosis.L["MsgLoaded"] = "geladen"
Gnosis.L["MsgMirrCBIsDis"] = "Spiegelleiste bereits durch anderes Addon deaktiviert"
Gnosis.L["MsgMirrCBRestored"] = "Standard-Spiegelleiste wiederhergestellt (siehe Konfiguration)"
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)" -- Requires localization
Gnosis.L["OptAddonDisabled_Name"] = "Addon deaktiviert, zum Zugriff auf Konfiguration aktivieren."
Gnosis.L["OptAddonEnable_Desc"] = "Gnosis öffnen/schließen"
Gnosis.L["OptAddonEnable_Name"] = "Addon aktivieren"
Gnosis.L["OptBarXYcoordDesc"] = "x,y-Koordinaten"
Gnosis.L["OptBarXYcoordName"] = "Position: x, y"
Gnosis.L["OptCBAddListElem"] = "Eintrag hinzufügen"
Gnosis.L["OptCBAdjIcon"] = "Symbolposition freigeben (wenn Leiste freigegeben ist)"
Gnosis.L["OptCBAdjLatTextCoord"] = "Latenztextposition"
Gnosis.L["OptCBAdjNamePos"] = "Position des Zaubernamens"
Gnosis.L["OptCBAlignName"] = "Zaubername anordnen"
Gnosis.L["OptCBAlignTime"] = "Zauberzeit anordnen"
Gnosis.L["OptCBAlignTimeCoord"] = "Position der Zauberzeit"
Gnosis.L["OptCBAlpha"] = "Zauberleiste Alpha"
Gnosis.L["OptCBBorderCol"] = "Rahmen"
Gnosis.L["OptCBBorderColInt"] = "Rahmen (nicht unterbrechbar)"
Gnosis.L["OptCBBorderSize"] = "Rahmengröße"
Gnosis.L["OptCBBWListedSpells"] = "Black-/whitelisted Zauber"
Gnosis.L["OptCBCBBgCol"] = "Hintergrund"
Gnosis.L["OptCBCBColFail"] = "Zauberleiste (failed)"
Gnosis.L["OptCBCBColInt"] = "Zauberleiste (unterbrochen)"
Gnosis.L["OptCBCBColor"] = "Zauberleiste"
Gnosis.L["OptCBCenterCB"] = "Zentriere Zauberleiste"
Gnosis.L["OptCBCopyCB_D"] = "Zauberleiste kopieren, ein gültiger Name muss angegeben werden."
Gnosis.L["OptCBCopyCB_N"] = "Zauberleiste kopieren"
Gnosis.L["OptCBEnCB"] = "Zauberleiste aktivieren"
Gnosis.L["OptCBEnList"] = "Aktiveren/Deaktivieren der Black-/Whitelist"
Gnosis.L["OptCBFadeout"] = "Ausblendzeit"
Gnosis.L["OptCBFillAtEnd"] = "Zauberleiste bei Zauberende auffüllen"
Gnosis.L["OptCBFixLatBox"] = "Fixierte Größe der Non-Player Tick Box [in %]"
Gnosis.L["OptCBFont"] = "Schrift"
Gnosis.L["OptCBFontOutline"] = "Schrift Kontur"
Gnosis.L["OptCBFontSizeLat"] = "Latenz Schriftgröße (0=automatic)"
Gnosis.L["OptCBFontSizeName"] = "Name Schriftgröße (0=automatic)"
Gnosis.L["OptCBFontSizeTime"] = "Timer Schriftgröße (0=automatic)"
Gnosis.L["OptCBForceLatAlign"] = "Latenzanordnung erzwingen"
Gnosis.L["OptCBFrameStrata"] = "Frame strata"
Gnosis.L["OptCBIconBorderSize"] = "Symbolrahmengröße (wenn freigegeben)"
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction" -- Requires localization
Gnosis.L["OptCBLatBoxCol"] = "Latenzbox"
Gnosis.L["OptCBListBlack"] = "blacklist"
Gnosis.L["OptCBListNeither"] = "neither"
Gnosis.L["OptCBListWhite"] = "whitelist"
Gnosis.L["OptCBMaxLatBox"] = "Maximalgröße der Latenzbox [in %]"
Gnosis.L["OptCBNewCB_D"] = "Neue Zauberleiste kreieren, ein gültiger Name muss angegeben werden."
Gnosis.L["OptCBNewCB_N"] = "Neue Zauberleiste"
Gnosis.L["OptCBNewCBName_D"] = "Name eingeben"
Gnosis.L["OptCBNewListElem_D"] = "Vor Hinzufügen eines neuen Zaubers Name eingeben"
Gnosis.L["OptCBOrient"] = "Orientation" -- Requires localization
Gnosis.L["OptCBRemCB"] = "Zauberleiste entfernen"
Gnosis.L["OptCBRemListElem"] = "Eintrag entfernen"
Gnosis.L["OptCBRotIcon"] = "Rotate Icon (°)" -- Requires localization
Gnosis.L["OptCBScaleBar"] = "Skalierung der Zauberleiste"
Gnosis.L["OptCBScaleIcon"] = "Skalierung des Zaubersymbols (wenn freigegeben)"
Gnosis.L["OptCBShowChanTicks"] = "Zeige kanalisierte Ticks"
Gnosis.L["OptCBShowIcon"] = "Zaubersymbol anzeigen"
Gnosis.L["OptCBShowLatBox"] = "Zeige Latenzbox"
Gnosis.L["OptCBShowSpark"] = "Zeige Zauberleisten-Funke"
Gnosis.L["OptCBSparkColor"] = "Zauberleisten-Funke"
Gnosis.L["OptCBSparkHeight"] = "Höhe Zauberleisten-Funke"
Gnosis.L["OptCBSparkWidth"] = "Breite Zauberleisten-Funke"
Gnosis.L["OptCBSWNC"] = "Zeige wenn nicht gezaubert wird"
Gnosis.L["OptCBTextAlignment"] = "Ausrichtung (Name zur Zeit)"
Gnosis.L["OptCBTextColLat"] = "Text (Latenz)"
Gnosis.L["OptCBTextColName"] = "Text (Name)"
Gnosis.L["OptCBTextColPB"] = "Text (unterbrochen)"
Gnosis.L["OptCBTextColTime"] = "Text (Zeit)"
Gnosis.L["OptCBTexture"] = "Textur der Zauberleiste"
Gnosis.L["OptCBUnit"] = "Unit"
Gnosis.L["OptCBUnl_D"] = "Zauberleiste freigeben"
Gnosis.L["OptCBUnl_N"] = "Zauberleiste freigeben"
Gnosis.L["OptCBUnlockIcon_D"] = "Symbol von Leiste lösen"
Gnosis.L["OptCBUnlockIcon_N"] = "Symbol freigeben"
Gnosis.L["OptClipWarn_Desc"] = "Warnen, wenn kurz vor dem Tick eines kanalisierten Zaubers unterbrochen wird (nicht AoE)."
Gnosis.L["OptClipWarn_Name"] = "Clipping Warnung [ms]"
Gnosis.L["OptCombTicks"] = "Ticks und Output im Kampftext vereinen"
Gnosis.L["OptConfDelConf"] = "Konfiguration entfernen"
Gnosis.L["OptConfLoadCBs"] = "Lade Zauberleisten"
Gnosis.L["OptConfLoadChan"] = "Lade Kanalisierte Zauber"
Gnosis.L["OptConfLoadCT"] = "Lade Kampftext/Cliptest Einstellungen"
Gnosis.L["OptConfLoadMain"] = "Lade Generelle Einstellungen"
Gnosis.L["OptConfName"] = "Name der Konfiguration"
Gnosis.L["OptConfSave"] = "Konfiguration speichern"
Gnosis.L["OptConfStoreCBs"] = "Sichere Zauberleisten"
Gnosis.L["OptConfStoreChan"] = "Sichere Kanalisierte Zauber"
Gnosis.L["OptConfStoreCT"] = "Sichere Kampftext/Cliptest Einstellungen"
Gnosis.L["OptConfStoreMain"] = "Sichere Generelle Einstellungen"
Gnosis.L["OptCopytonewbarExists"] = "eine Zauberleiste mit diesem Namen existiert bereits"
Gnosis.L["OptCopytonewbarInvalidName"] = "Gültigen Namen für kopierte Zauberleiste eingeben"
Gnosis.L["OptCreateCBSet"] = "Quick Start - Standard Zauberleisten erstellen"
Gnosis.L["OptCreatenewbarExists"] = "eine Zauberleiste mit diesem Namen existiert bereits"
Gnosis.L["OptCreatenewbarInvalidName"] = "Gültigen Namen für Zauberleiste eingeben"
Gnosis.L["OptCreateNewSpell"] = "Neuer Zauber"
Gnosis.L["OptCSFSClip"] = "Schriftgröße (clip, 0=default)"
Gnosis.L["OptCSFSNonClip"] = "Schriftgröße (non clip, 0=default)"
Gnosis.L["OptCSRemove"] = "Zauber entfernen"
Gnosis.L["OptCTO"] = "Kampftextausgabe"
Gnosis.L["OptCTO_Blizz"] = "Blizzard's Floating Combat Text"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text"
Gnosis.L["OptEn"] = "Aktivieren"
Gnosis.L["OptEnClipTest"] = "Clip test aktivieren"
Gnosis.L["OptFirstStartFrame"] = "Open first start frame" -- Requires localization
Gnosis.L["OptFirstTickInst"] = "Erster Tick sofort"
Gnosis.L["OptFontResizeLongName"] = "Bei langen Namen Schriftgröße ändern"
Gnosis.L["OptHeight"] = "Höhe"
Gnosis.L["OptHideAddonMsgs"] = "Gnosis Textausgabe verstecken"
Gnosis.L["OptHideBlizzCB"] = "Blizzard Zauberleiste verstecken"
Gnosis.L["OptHidecasttime"] = "Verstecke übrige Castdauer"
Gnosis.L["OptHidecasttimeTotal"] = "Verstecke totale Castdauer"
Gnosis.L["OptHideMirrorCB"] = "Blizzard Spiegelleiste verstecken"
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar" -- Requires localization
Gnosis.L["OptHidepushbackTime"] = "Verstecke Castverzögerung"
Gnosis.L["OptLocale"] = "Lokalisierung auswählen"
Gnosis.L["OptMergetradeskillDesc"] = "Itemherstellung durch Berufe zusammenführen (Spieler-Zauberleiste)."
Gnosis.L["OptMergetradeskillName"] = "Berufsherstellungen zusammenführen"
Gnosis.L["OptMusic"] = "Musik"
Gnosis.L["OptNameFormatStringDesc"] = [=[Folgende strings sind möglich

name: Zaubername
abbr<cnt>: verkürze Zaubername, falls länger als cnt, ansonsten wie name
rank<text>: Zeige Text bei Rängen
misc: Zeige versch. Info bei non-Rank Zaubern
arabic: Zauberrang in Arabischen Zahlen (z.B. 13)
roman: Zauberrang in Römischen Zahlen (z.B. XIII)
txr<text>: Zeige Text bei verfügbarer Zauberranginfo
txm<text>: Zeige Text bei sonstiger Info
target: Zeige Zielname falls verfügbar (nur Spieler)
tar<text>: Zeige Text wenn Zielinformationen verfügbar sind (nur Spieler)
who: Zeige Name der zaubernden Einheit

col<r,g,b[,a]>: z.B. col<1.0,1.0,0.0> um die Farbe zu ändern
col<school>: Farbe der Zauberschule (Schatten, Arkan...)
col<pre>: zur vorherigen Farbe wechseln

tscur: Zeige übrige Berufsitem-Herstellungen
tstot: Zeige Anzahl der Berufsitem-Herstellungen
txts<text>: Zeige Text, falls Berufsinformationen verfügbar sind

\n: neue Zeile]=]
Gnosis.L["OptNameFormatStringName"] = "Nameformat"
Gnosis.L["OptNameFormatToggleDesc"] = "ignoriert bei Aktivierung 'Zeige Zaubername' und 'Zeige Zauberrang'"
Gnosis.L["OptNameFormatToggleName"] = "Individuelles Nameformat"
Gnosis.L["OptOutputString"] = "Ausgabe"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "Musikdatei abspielen"
Gnosis.L["OptPlaySnd"] = "Sound abspielen"
Gnosis.L["OptPMoC"] = "Bei Clip Musik abspielen"
Gnosis.L["OptPSoC"] = "Bei Clip Sound abspielen"
Gnosis.L["OptResetPlayerData"] = "Werkseinstellung (lädt Interface neu)"
Gnosis.L["OptSaveconfigExists"] = "eine Konfiguration mit diesem Namen existiert bereits"
Gnosis.L["OptSaveconfigInvalidName"] = "Konfigurationsname eingeben"
Gnosis.L["OptShowasminutesDesc"] = "Minutenanzeige, falls länger als 60s."
Gnosis.L["OptShowasminutesName"] = "Zeige Minuten"
Gnosis.L["OptShowCastNameDesc"] = "Wird bei individuellem Nameformat nicht genutzt."
Gnosis.L["OptShowCastNameName"] = "Zeige Zaubername"
Gnosis.L["OptShowCastRankDesc"] = "Wird bei individuellem Nameformat nicht genutzt."
Gnosis.L["OptShowCastRankName"] = "Zeige Zauberrang"
Gnosis.L["OptShowPlayerLatency"] = "Zeige Latenz (ms)"
Gnosis.L["OptShowSpellIcon"] = "Zaubersymbol anzeigen"
Gnosis.L["OptSnd"] = "Sound"
Gnosis.L["OptSpellIsAoE"] = "Zauber ist AoE"
Gnosis.L["OptSpellNameOrId"] = "Zaubername oder Zauber ID"
Gnosis.L["OptStickyClips"] = "Sticky clips"
Gnosis.L["OptStrGapDesc"] = "Minimaler Abstand zwischen Zaubername und Zeit (legt Schriftverkleinerung fest)."
Gnosis.L["OptStrGapName"] = "Abstand (Name...Zeit)"
Gnosis.L["OptTicksToShow"] = "Ticks anzeigen"
Gnosis.L["OptTimeFormatStringDesc"] = [=[Folgende strings sind möglich

r<x>: Verbleibende Zeit in Sekunden mit x Kommastellen
t<x>: Gesamtzeit in Sekunden mit x Kommastellen
p<x>: Zauberverzögerung in Sekunden mit x Kommastellen

füge s für sing oder m um Zeiten über 60s in Minuten anzuzeigen hinzu
z.B. r<1m> oder p<2s>

col<r,g,b[,a]>: z.B. col<1.0,1.0,0.0> um die Farbe zu ändern
col<school>: Farbe der Zauberschule (Schatten, Arkan...)
col<pre>: zur vorherigen Farbe wechseln

\n: neue Zeile

Hinnweis: use col<r,g,b> Farbe der Zauberverzögerung ändern]=]
Gnosis.L["OptTimeFormatStringName"] = "Zeitformat"
Gnosis.L["OptTimeFormatToggleDesc"] = "bei Aktivierung werden andere Zeitformatoptionen ignoriert"
Gnosis.L["OptTimeFormatToggleName"] = "Individuelles Zeitformat"
Gnosis.L["OptTotTicks"] = "Ticks"
Gnosis.L["OptWfCL_Desc"] = "Verzögere Ausgabe/Clip Test in ms um Kampftextverzögerung entgegenzuwirken."
Gnosis.L["OptWfCL_Name"] = "Auf Kampftext warten [ms]"
Gnosis.L["OptWidth"] = "Breite"
Gnosis.L["Strata_BACK"] = "Lowest"
Gnosis.L["Strata_DIALOG"] = "Highest"
Gnosis.L["Strata_HIGH"] = "High"
Gnosis.L["Strata_LOW"] = "Low"
Gnosis.L["Strata_MEDIUM"] = "Medium"
Gnosis.L["TabAdaptToCT"] = "an Zaubertyp orientieren"
Gnosis.L["TabCapCENTER"] = "CENTER"
Gnosis.L["TabCapLEFT"] = "LINKS"
Gnosis.L["TabCapNONE"] = "KEINS"
Gnosis.L["TabCapRIGHT"] = "RECHTS"
Gnosis.L["TabCastbars"] = "Zauberleisten"
Gnosis.L["TabChanneledSpells"] = "Kanalisierte Zauber"
Gnosis.L["TabConfig"] = "Konfiguration"
Gnosis.L["TabCTClipTest"] = "Kampftext/Cliptest"
Gnosis.L["TabFreeAlign"] = "Freie Anordnung"
Gnosis.L["TabNameTime"] = "Name...Zeit"
Gnosis.L["TabTimeName"] = "Zeit...Name"
Gnosis.L["Vertical"] = "Vertical" -- Requires localization

elseif( self.s.strLocale == "zhCN" ) then
-- zhCN locale (simplified chinese)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "焦点"
Gnosis.L["CBSetGCD"] = "GCD" -- Requires localization
Gnosis.L["CBSetMirror"] = "镜像"
Gnosis.L["CBSetPet"] = "宠物载具"
Gnosis.L["CBSetPlayer"] = "玩家"
Gnosis.L["CBSetSwing"] = "Swing" -- Requires localization
Gnosis.L["CBSetTarget"] = "目标"
Gnosis.L["Horizontal"] = "Horizontal" -- Requires localization
Gnosis.L["IfCCSetup"] = "Create common setup" -- Requires localization
Gnosis.L["IfCCSString"] = [=[Gnosis can create a common castbar setup for you (bars for Player, Target, Focus, Mirror and Pet/Vehicle). The created bars will be unlocked and can be moved by dragging while holding down the left mouse button. Right clicking the bars will call the castbar configuration gui.

You should lock the bars when you are finished with moving and customizing. Both blizzard castbar and mirror castbar will be deactivated. You can also create a "Global Cooldown Indicator" and a "Swing Timer" (one handed melee and range including wand) by pressing the button below. The slash command to call the Gnosis gui is "/gnosis".
]=] -- Requires localization
Gnosis.L["IfCCTimers"] = "Create GCD/Swing timers" -- Requires localization
Gnosis.L["IfConfigs"] = "Configurations" -- Requires localization
Gnosis.L["IfCWAction"] = "Press button to close frame without taking any action" -- Requires localization
Gnosis.L["IfLFConigs"] = [=[
One or more stored configurations have been found. You can setup Gnosis by loading from any existing configuration, just press any of the buttons below (button name is the name of the configuration that will be loaded).
]=] -- Requires localization
Gnosis.L["IfNoCBs"] = "No castbars found" -- Requires localization
Gnosis.L["IfOpenGUI"] = "Open config GUI" -- Requires localization
Gnosis.L["MsgBlizCBIsDis"] = "暴雪施法条已经被其他插件所隐藏"
Gnosis.L["MsgBlizCBRestored"] = "暴雪施法条恢复 (详见图形配置界面选项)"
Gnosis.L["MsgDis"] = "(已禁用)"
Gnosis.L["MsgDisBlizCB"] = "禁用暴雪施法条 (详见图形配置界面选项)"
Gnosis.L["MsgDisMirrCB"] = "禁用默认镜像计时器 (详见图形配置界面选项)"
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)" -- Requires localization
Gnosis.L["MsgEn"] = "(已启用)"
Gnosis.L["MsgLoaded"] = "已加载"
Gnosis.L["MsgMirrCBIsDis"] = "默认镜像计时器已经被其他插件所隐藏"
Gnosis.L["MsgMirrCBRestored"] = "默认镜像计时器恢复 (详见图形配置界面选项)"
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)" -- Requires localization
Gnosis.L["OptAddonDisabled_Name"] = "插件已禁用, 启用来访问当前配置标签."
Gnosis.L["OptAddonEnable_Desc"] = "开启或关闭 Gnosis"
Gnosis.L["OptAddonEnable_Name"] = "启用插件"
Gnosis.L["OptBarXYcoordDesc"] = "x,y-坐标"
Gnosis.L["OptBarXYcoordName"] = "施法条位置: x, y"
Gnosis.L["OptCBAddListElem"] = "增加条目"
Gnosis.L["OptCBAdjIcon"] = "调整图标位置 (当解锁时)"
Gnosis.L["OptCBAdjLatTextCoord"] = "调整延迟文字位置"
Gnosis.L["OptCBAdjNamePos"] = "调整名字位置"
Gnosis.L["OptCBAlignName"] = "对齐施法名"
Gnosis.L["OptCBAlignTime"] = "对齐施法时间"
Gnosis.L["OptCBAlignTimeCoord"] = "调整时间位置"
Gnosis.L["OptCBAlpha"] = "施法条透明度"
Gnosis.L["OptCBBorderCol"] = "边框颜色"
Gnosis.L["OptCBBorderColInt"] = "边框颜色 (不可打断)"
Gnosis.L["OptCBBorderSize"] = "边框大小"
Gnosis.L["OptCBBWListedSpells"] = "黑/白名单中列表的法术"
Gnosis.L["OptCBCBBgCol"] = "施法条背景颜色"
Gnosis.L["OptCBCBColFail"] = "施法条颜色 (失败)"
Gnosis.L["OptCBCBColInt"] = "施法条颜色 (打断)"
Gnosis.L["OptCBCBColor"] = "施法条颜色"
Gnosis.L["OptCBCenterCB"] = "居中施法条"
Gnosis.L["OptCBCopyCB_D"] = "拷贝施法条, 请确保在新的施法条编辑框中输入一个可用的名字."
Gnosis.L["OptCBCopyCB_N"] = "拷贝施法条"
Gnosis.L["OptCBEnCB"] = "启用施法条"
Gnosis.L["OptCBEnList"] = "启用/禁用黑-白名单"
Gnosis.L["OptCBFadeout"] = "淡出时间"
Gnosis.L["OptCBFillAtEnd"] = "当施法结束时填充施法条"
Gnosis.L["OptCBFixLatBox"] = "非玩家跳数框精确尺寸 [% 施法条]"
Gnosis.L["OptCBFont"] = "字体"
Gnosis.L["OptCBFontOutline"] = "字体描边"
Gnosis.L["OptCBFontSizeLat"] = "延迟字体大小 (0=自动)"
Gnosis.L["OptCBFontSizeName"] = "名字字体大小 (0=自动)"
Gnosis.L["OptCBFontSizeTime"] = "时间字体大小 (0=自动)"
Gnosis.L["OptCBForceLatAlign"] = "强制延迟对齐"
Gnosis.L["OptCBFrameStrata"] = "框体层级"
Gnosis.L["OptCBIconBorderSize"] = "图标边框 (当解锁时)"
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction" -- Requires localization
Gnosis.L["OptCBLatBoxCol"] = "延迟框颜色"
Gnosis.L["OptCBListBlack"] = "黑名单"
Gnosis.L["OptCBListNeither"] = "都"
Gnosis.L["OptCBListWhite"] = "白名单"
Gnosis.L["OptCBMaxLatBox"] = "延迟框最大尺寸 [% 施法条]"
Gnosis.L["OptCBNewCB_D"] = "创建新的施法条必须给出一个可用的施法条名"
Gnosis.L["OptCBNewCB_N"] = "新的施法条"
Gnosis.L["OptCBNewCBName_D"] = "创建新的施法条前请输入可用的施法条名字"
Gnosis.L["OptCBNewListElem_D"] = "增加新的法术前先输入法术名字"
Gnosis.L["OptCBOrient"] = "Orientation" -- Requires localization
Gnosis.L["OptCBRemCB"] = "移除施法条"
Gnosis.L["OptCBRemListElem"] = "移除当前条目"
Gnosis.L["OptCBRotIcon"] = "Rotate Icon (°)" -- Requires localization
Gnosis.L["OptCBScaleBar"] = "缩放施法条"
Gnosis.L["OptCBScaleIcon"] = "缩放图标 (当解锁时)"
Gnosis.L["OptCBShowChanTicks"] = "显示通道法术跳数"
Gnosis.L["OptCBShowIcon"] = "显示施法图标"
Gnosis.L["OptCBShowLatBox"] = "显示延迟框"
Gnosis.L["OptCBShowSpark"] = "显示施法条火花"
Gnosis.L["OptCBSparkColor"] = "火花颜色"
Gnosis.L["OptCBSparkHeight"] = "火花高"
Gnosis.L["OptCBSparkWidth"] = "火花宽"
Gnosis.L["OptCBSWNC"] = "当不施法时也显示"
Gnosis.L["OptCBTextAlignment"] = "对齐 (名字到时间)"
Gnosis.L["OptCBTextColLat"] = "文字颜色 (延迟)"
Gnosis.L["OptCBTextColName"] = "文字颜色 (名字)"
Gnosis.L["OptCBTextColPB"] = "文字颜色 (打退)"
Gnosis.L["OptCBTextColTime"] = "文字颜色 (时间)"
Gnosis.L["OptCBTexture"] = "施法条材质"
Gnosis.L["OptCBUnit"] = "单位"
Gnosis.L["OptCBUnl_D"] = "解锁施法条 (总是显示)"
Gnosis.L["OptCBUnl_N"] = "解锁施法条"
Gnosis.L["OptCBUnlockIcon_D"] = "从施法条上解锁图标"
Gnosis.L["OptCBUnlockIcon_N"] = "解锁图标"
Gnosis.L["OptClipWarn_Desc"] = "Warn when clipping shortly before channel tick occurs on non aoe channeled spells." -- Needs review
Gnosis.L["OptClipWarn_Name"] = "Clipping warning [ms]" -- Needs review
Gnosis.L["OptCombTicks"] = "合并跳数并通过战斗文字输出"
Gnosis.L["OptConfDelConf"] = "移除配置"
Gnosis.L["OptConfLoadCBs"] = "加载施法条"
Gnosis.L["OptConfLoadChan"] = "加载通道法术"
Gnosis.L["OptConfLoadCT"] = "加载战斗文字/cliptest 设置"
Gnosis.L["OptConfLoadMain"] = "加载主标签设置"
Gnosis.L["OptConfName"] = "配置名字"
Gnosis.L["OptConfSave"] = "保存配置"
Gnosis.L["OptConfStoreCBs"] = "储存施法条"
Gnosis.L["OptConfStoreChan"] = "储存通道法术数据"
Gnosis.L["OptConfStoreCT"] = "储存战斗文字/cliptest 设置"
Gnosis.L["OptConfStoreMain"] = "储存插件主配置标签设置"
Gnosis.L["OptCopytonewbarExists"] = "施法条已经存在, 不能拷贝"
Gnosis.L["OptCopytonewbarInvalidName"] = "拷贝到一个新的施法条前请输入可用的施法条名字"
Gnosis.L["OptCreateCBSet"] = "创建基础施法条 (快速启动)"
Gnosis.L["OptCreatenewbarExists"] = "施法条已经存在, 不能创建"
Gnosis.L["OptCreatenewbarInvalidName"] = "创建新的施法条前请输入可用的施法条名字"
Gnosis.L["OptCreateNewSpell"] = "创建新的法术"
Gnosis.L["OptCSFSClip"] = "字体大小 (clip, 0=预设)"
Gnosis.L["OptCSFSNonClip"] = "字体大小 (non clip, 0=预设)"
Gnosis.L["OptCSRemove"] = "移除法术"
Gnosis.L["OptCTO"] = "战斗文字输出"
Gnosis.L["OptCTO_Blizz"] = "暴雪浮动战斗文字"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text"
Gnosis.L["OptEn"] = "启用"
Gnosis.L["OptEnClipTest"] = "Enable clip test" -- Needs review
Gnosis.L["OptFirstStartFrame"] = "Open first start frame" -- Requires localization
Gnosis.L["OptFirstTickInst"] = "首跳为瞬发"
Gnosis.L["OptFontResizeLongName"] = "重定义长字符大小"
Gnosis.L["OptHeight"] = "高"
Gnosis.L["OptHideAddonMsgs"] = "隐藏 Gnosis 文字信息"
Gnosis.L["OptHideBlizzCB"] = "隐藏暴雪施法条"
Gnosis.L["OptHidecasttime"] = "隐藏剩余施法时间"
Gnosis.L["OptHidecasttimeTotal"] = "隐藏总施法时间"
Gnosis.L["OptHideMirrorCB"] = "隐藏暴雪镜像计时条"
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar" -- Requires localization
Gnosis.L["OptHidepushbackTime"] = "隐藏施法打退时间"
Gnosis.L["OptLocale"] = "选择本地化文件"
Gnosis.L["OptMergetradeskillDesc"] = "合并交易技能 (仅玩家施法条)."
Gnosis.L["OptMergetradeskillName"] = "合并交易技能"
Gnosis.L["OptMusic"] = "音乐"
Gnosis.L["OptNameFormatStringDesc"] = [=[输入字符用来显示为名字

name: 法术名
abbr<cnt>: 缩写法术名如果字符长于一个数值, 除非和名字想通
rank<text>: 如果等级可用显示等级文字
misc: 如果没有等级则显示多种信息
arabic: 等级显示为阿拉伯数字 (e.g. 13)
roman: 等级显示为罗马数字 (e.g. XIII)
txr<text>: 如果等级信息可用显示等级文字
txm<text>: 如果多种信息可用显示多种信息文字
target: 如果可用显示目标名字 (仅玩家)
tar<text>: 如果目标信息可用显示目标信息文字 (仅玩家)
who: show name of casting unit

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> 来改变颜色
col<school>: 法术伤害类型是暗影, 奥术...
col<pre>: 修改颜色为上一个

tscur: 显示剩余的商业技能物品计数
tstot: 显示总的商业技能物品计数
txts<text>: 如果商业技能信息可用显示文字

\n: force new line]=] -- Needs review
Gnosis.L["OptNameFormatStringName"] = "名字格式字符"
Gnosis.L["OptNameFormatToggleDesc"] = "如果启用则 '显示施法名' 和 '显示施法等级' 选项将被忽略."
Gnosis.L["OptNameFormatToggleName"] = "启用名字格式字符Enable name format string"
Gnosis.L["OptOutputString"] = "输出字符"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "播放音乐文件"
Gnosis.L["OptPlaySnd"] = "播放音效"
Gnosis.L["OptPMoC"] = "Play music on clip" -- Needs review
Gnosis.L["OptPSoC"] = "Play sound on clip" -- Needs review
Gnosis.L["OptResetPlayerData"] = "重置玩家数据 (重载界面)"
Gnosis.L["OptSaveconfigExists"] = "配置已经存在, 请首先删除或者改名"
Gnosis.L["OptSaveconfigInvalidName"] = "没有给出配置名"
Gnosis.L["OptShowasminutesDesc"] = "如果时间长于60秒则显示分钟."
Gnosis.L["OptShowasminutesName"] = "显示分钟"
Gnosis.L["OptShowCastNameDesc"] = "如果名字格式字符启用选项将不可用."
Gnosis.L["OptShowCastNameName"] = "显示施法名"
Gnosis.L["OptShowCastRankDesc"] = "如果名字格式字符启用选项将不可用."
Gnosis.L["OptShowCastRankName"] = "显示施法等级"
Gnosis.L["OptShowPlayerLatency"] = "显示玩家延迟 (ms)"
Gnosis.L["OptShowSpellIcon"] = "显示法术图标"
Gnosis.L["OptSnd"] = "音效"
Gnosis.L["OptSpellIsAoE"] = "法术命中多个目标"
Gnosis.L["OptSpellNameOrId"] = "法术名或法术ID"
Gnosis.L["OptStickyClips"] = "Sticky clips" -- Needs review
Gnosis.L["OptStrGapDesc"] = "施法名和时间之间的最小间隔 (来决定是否重定义长字符的大小)."
Gnosis.L["OptStrGapName"] = "间隔 (名字...时间)"
Gnosis.L["OptTicksToShow"] = "要显示的跳数"
Gnosis.L["OptTimeFormatStringDesc"] = [=[输入字符用来显示为时间

r<x>: 剩余时间用 X 个小数位按秒来显示
t<x>: 总时间用 X 个小数位按秒来显示
p<x>: 打退时间用 X 个小数位按秒来显示

增加 s 为施法吟唱 或 m 为显示时间 > 60秒的法术
e.g. r<1m> 或 p<2s>

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> 来修改颜色
col<school>: 法术伤害类型是暗影, 奥术...
col<pre>: 修改颜色为上一个

\n: force new line

remark: 使用 col<r,g,b> 来修改法术打退的颜色如果需要的话]=] -- Needs review
Gnosis.L["OptTimeFormatStringName"] = "时间格式字符"
Gnosis.L["OptTimeFormatToggleDesc"] = "如果启用则所有其他时间格式选项将被忽略."
Gnosis.L["OptTimeFormatToggleName"] = "开启时间格式字符"
Gnosis.L["OptTotTicks"] = "总跳数"
Gnosis.L["OptWfCL_Desc"] = "Delay output/clip test after output/clip test request for given time in ms to account for possible combat log delay." -- Needs review
Gnosis.L["OptWfCL_Name"] = "等待战斗记录 [ms]"
Gnosis.L["OptWidth"] = "宽"
Gnosis.L["Strata_BACK"] = "最低"
Gnosis.L["Strata_DIALOG"] = "最高"
Gnosis.L["Strata_HIGH"] = "高"
Gnosis.L["Strata_LOW"] = "低"
Gnosis.L["Strata_MEDIUM"] = "中等"
Gnosis.L["TabAdaptToCT"] = "自适应施法类型"
Gnosis.L["TabCapCENTER"] = "中"
Gnosis.L["TabCapLEFT"] = "左"
Gnosis.L["TabCapNONE"] = "无"
Gnosis.L["TabCapRIGHT"] = "右"
Gnosis.L["TabCastbars"] = "施法条"
Gnosis.L["TabChanneledSpells"] = "通道法术"
Gnosis.L["TabConfig"] = "配置"
Gnosis.L["TabCTClipTest"] = "战斗文字/Cliptest"
Gnosis.L["TabFreeAlign"] = "自由对齐"
Gnosis.L["TabNameTime"] = "名字...时间"
Gnosis.L["TabTimeName"] = "时间...名字"
Gnosis.L["Vertical"] = "Vertical" -- Requires localization

elseif( self.s.strLocale == "zhTW" ) then
-- zhTW locale (traditional chinese)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "焦點"
Gnosis.L["CBSetGCD"] = "共用冷卻時間"
Gnosis.L["CBSetMirror"] = "鏡像"
Gnosis.L["CBSetPet"] = "寵物載具"
Gnosis.L["CBSetPlayer"] = "玩家"
Gnosis.L["CBSetSwing"] = "武器揮擊"
Gnosis.L["CBSetTarget"] = "目標"
Gnosis.L["Horizontal"] = "Horizontal" -- Requires localization
Gnosis.L["IfCCSetup"] = "產生泛用設定"
Gnosis.L["IfCCSString"] = [=[Gnosis 可以為您產生一個泛用的施法條設定方式 (包括 "player", "target", "focus", "mirror" , 還有 "pet=vehicle")。用此方法下產生之施法條可以用滑鼠左鍵拖曳其位置。 滑鼠右鍵則可以帶出施法條的選項視窗。 

您必須在設定好施法條位置以及其選項之後作"鎖定施法條"的動作。 此舉也會將遊戲預設的施法條停用。 您可以對UI中 "gcd", "gcd_reverse" 及 "*swing"的項目，設立共用冷卻時間以及武器揮擊的指示條。Gnosis 的對話框指令為 "/gnosis"。]=] -- Needs review
Gnosis.L["IfCCTimers"] = "產生 共用冷卻時間/武器揮擊 間隔指示條"
Gnosis.L["IfConfigs"] = "設定組態"
Gnosis.L["IfCWAction"] = "按下此按鈕，即不做任何動作並關閉視窗"
Gnosis.L["IfLFConigs"] = "搜尋到一個或者以上的設定好的組態，您可以讀取任何已存在的組態來設定Gnosis，下列按鈕即為設定好之組態(按鈕名稱為組態名稱)，按下按鈕即可用該名稱對應之組態來設定您的Gnosis。"
Gnosis.L["IfNoCBs"] = "沒有任何施法條"
Gnosis.L["IfOpenGUI"] = "開啟選項視窗"
Gnosis.L["MsgBlizCBIsDis"] = "暴雪施法條已經被其他插件所隱藏"
Gnosis.L["MsgBlizCBRestored"] = "暴雪施法條恢復 (詳見圖形配置界面選項)"
Gnosis.L["MsgDis"] = "(已禁用)"
Gnosis.L["MsgDisBlizCB"] = "禁用暴雪施法條 (詳見圖形配置界面選項)"
Gnosis.L["MsgDisMirrCB"] = "禁用默認鏡像計時器 (詳見圖形配置界面選項)"
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)" -- Requires localization
Gnosis.L["MsgEn"] = "(已啟用)"
Gnosis.L["MsgLoaded"] = "已加載"
Gnosis.L["MsgMirrCBIsDis"] = "默認鏡像計時器已經被其他插件所隱藏"
Gnosis.L["MsgMirrCBRestored"] = "默認鏡像計時器恢復 (詳見圖形配置界面選項)"
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)" -- Requires localization
Gnosis.L["OptAddonDisabled_Name"] = "插件已禁用, 啟用來訪問當前配置標簽."
Gnosis.L["OptAddonEnable_Desc"] = "開啟或關閉 Gnosis"
Gnosis.L["OptAddonEnable_Name"] = "啟用插件"
Gnosis.L["OptBarXYcoordDesc"] = "x,y-坐標"
Gnosis.L["OptBarXYcoordName"] = "施法條位置: x, y"
Gnosis.L["OptCBAddListElem"] = "增加條目"
Gnosis.L["OptCBAdjIcon"] = "調整圖標位置 (當解鎖時)"
Gnosis.L["OptCBAdjLatTextCoord"] = "調整延遲文字位置"
Gnosis.L["OptCBAdjNamePos"] = "調整名字位置"
Gnosis.L["OptCBAlignName"] = "對齊施法名"
Gnosis.L["OptCBAlignTime"] = "對齊施法時間"
Gnosis.L["OptCBAlignTimeCoord"] = "調整時間位置"
Gnosis.L["OptCBAlpha"] = "施法條透明度"
Gnosis.L["OptCBBorderCol"] = "邊框顏色"
Gnosis.L["OptCBBorderColInt"] = "邊框顏色 (不可打斷)"
Gnosis.L["OptCBBorderSize"] = "邊框大小"
Gnosis.L["OptCBBWListedSpells"] = "黑/白名單中列表的法術"
Gnosis.L["OptCBCBBgCol"] = "施法條背景顏色"
Gnosis.L["OptCBCBColFail"] = "施法條顏色 (失敗)"
Gnosis.L["OptCBCBColInt"] = "施法條顏色 (打斷)"
Gnosis.L["OptCBCBColor"] = "施法條顏色"
Gnosis.L["OptCBCenterCB"] = "居中施法條"
Gnosis.L["OptCBCopyCB_D"] = "拷貝施法條, 請確保在新的施法條編輯框中輸入壹個可用的名字."
Gnosis.L["OptCBCopyCB_N"] = "拷貝施法條"
Gnosis.L["OptCBEnCB"] = "啟用施法條"
Gnosis.L["OptCBEnList"] = "啟用/禁用黑-白名單"
Gnosis.L["OptCBFadeout"] = "淡出時間"
Gnosis.L["OptCBFillAtEnd"] = "當施法結束時填充施法條"
Gnosis.L["OptCBFixLatBox"] = "非玩家跳數框精確尺寸 [% 施法條]"
Gnosis.L["OptCBFont"] = "字型"
Gnosis.L["OptCBFontOutline"] = "字型描邊"
Gnosis.L["OptCBFontSizeLat"] = "延遲字型大小 (0=自動)"
Gnosis.L["OptCBFontSizeName"] = "名字字型大小 (0=自動)"
Gnosis.L["OptCBFontSizeTime"] = "時間字型大小 (0=自動)"
Gnosis.L["OptCBForceLatAlign"] = "強制延遲對齊"
Gnosis.L["OptCBFrameStrata"] = "框體層級"
Gnosis.L["OptCBIconBorderSize"] = "圖標邊框 (當解鎖時)"
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction" -- Requires localization
Gnosis.L["OptCBLatBoxCol"] = "延遲框顏色"
Gnosis.L["OptCBListBlack"] = "黑名單"
Gnosis.L["OptCBListNeither"] = "都"
Gnosis.L["OptCBListWhite"] = "白名單"
Gnosis.L["OptCBMaxLatBox"] = "延遲框最大尺寸 [% 施法條]"
Gnosis.L["OptCBNewCB_D"] = "創建新的施法條必須給出壹個可用的施法條名"
Gnosis.L["OptCBNewCB_N"] = "新的施法條"
Gnosis.L["OptCBNewCBName_D"] = "創建新的施法條前請輸入可用的施法條名字"
Gnosis.L["OptCBNewListElem_D"] = "增加新的法術前先輸入法術名字"
Gnosis.L["OptCBOrient"] = "Orientation" -- Requires localization
Gnosis.L["OptCBRemCB"] = "移除施法條"
Gnosis.L["OptCBRemListElem"] = "移除當前條目"
Gnosis.L["OptCBRotIcon"] = "旋轉圖示"
Gnosis.L["OptCBScaleBar"] = "縮放施法條"
Gnosis.L["OptCBScaleIcon"] = "縮放圖標 (當解鎖時)"
Gnosis.L["OptCBShowChanTicks"] = "顯示通道法術跳數"
Gnosis.L["OptCBShowIcon"] = "顯示施法圖標"
Gnosis.L["OptCBShowLatBox"] = "顯示延遲框"
Gnosis.L["OptCBShowSpark"] = "顯示施法條火花"
Gnosis.L["OptCBSparkColor"] = "火花顏色"
Gnosis.L["OptCBSparkHeight"] = "火花高"
Gnosis.L["OptCBSparkWidth"] = "火花寬"
Gnosis.L["OptCBSWNC"] = "當不施法時也顯示"
Gnosis.L["OptCBTextAlignment"] = "對齊 (名字到時間)"
Gnosis.L["OptCBTextColLat"] = "文字顏色 (延遲)"
Gnosis.L["OptCBTextColName"] = "文字顏色 (名字)"
Gnosis.L["OptCBTextColPB"] = "文字顏色 (打退)"
Gnosis.L["OptCBTextColTime"] = "文字顏色 (時間)"
Gnosis.L["OptCBTexture"] = "施法條材質"
Gnosis.L["OptCBUnit"] = "單位"
Gnosis.L["OptCBUnl_D"] = "解鎖施法條 (總是顯示)"
Gnosis.L["OptCBUnl_N"] = "解鎖施法條"
Gnosis.L["OptCBUnlockIcon_D"] = "從施法條上解鎖圖標"
Gnosis.L["OptCBUnlockIcon_N"] = "解鎖圖標"
Gnosis.L["OptClipWarn_Desc"] = "在非範圍作用之引導法術的第一跳之前，發出即將截短之警示"
Gnosis.L["OptClipWarn_Name"] = "Clipping warning [ms]" -- Needs review
Gnosis.L["OptCombTicks"] = "合並跳數並通過戰鬥文字輸出"
Gnosis.L["OptConfDelConf"] = "移除配置"
Gnosis.L["OptConfLoadCBs"] = "加載施法條"
Gnosis.L["OptConfLoadChan"] = "加載通道法術"
Gnosis.L["OptConfLoadCT"] = "加載戰鬥文字/cliptest 設定"
Gnosis.L["OptConfLoadMain"] = "加載主標簽設定"
Gnosis.L["OptConfName"] = "配置名字"
Gnosis.L["OptConfSave"] = "保存配置"
Gnosis.L["OptConfStoreCBs"] = "儲存施法條"
Gnosis.L["OptConfStoreChan"] = "儲存通道法術數據"
Gnosis.L["OptConfStoreCT"] = "儲存戰鬥文字/cliptest 設定"
Gnosis.L["OptConfStoreMain"] = "儲存插件主配置標簽設定"
Gnosis.L["OptCopytonewbarExists"] = "施法條已經存在, 不能拷貝"
Gnosis.L["OptCopytonewbarInvalidName"] = "拷貝到壹個新的施法條前請輸入可用的施法條名字"
Gnosis.L["OptCreateCBSet"] = "創建基礎施法條 (快速啟動)"
Gnosis.L["OptCreatenewbarExists"] = "施法條已經存在, 不能創建"
Gnosis.L["OptCreatenewbarInvalidName"] = "創建新的施法條前請輸入可用的施法條名字"
Gnosis.L["OptCreateNewSpell"] = "創建新的法術"
Gnosis.L["OptCSFSClip"] = "字型大小 (clip, 0=預設)"
Gnosis.L["OptCSFSNonClip"] = "字型大小 (non clip, 0=預設)"
Gnosis.L["OptCSRemove"] = "移除法術"
Gnosis.L["OptCTO"] = "戰鬥文字輸出"
Gnosis.L["OptCTO_Blizz"] = "暴雪浮動戰鬥文字"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text"
Gnosis.L["OptEn"] = "啟用"
Gnosis.L["OptEnClipTest"] = "Enable clip test" -- Needs review
Gnosis.L["OptFirstStartFrame"] = "Open first start frame" -- Requires localization
Gnosis.L["OptFirstTickInst"] = "首跳為瞬發"
Gnosis.L["OptFontResizeLongName"] = "重定義長字符大小"
Gnosis.L["OptHeight"] = "高"
Gnosis.L["OptHideAddonMsgs"] = "隱藏 Gnosis 文字信息"
Gnosis.L["OptHideBlizzCB"] = "隱藏暴雪施法條"
Gnosis.L["OptHidecasttime"] = "隱藏剩余施法時間"
Gnosis.L["OptHidecasttimeTotal"] = "隱藏總施法時間"
Gnosis.L["OptHideMirrorCB"] = "隱藏暴雪鏡像計時條"
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar" -- Requires localization
Gnosis.L["OptHidepushbackTime"] = "隱藏施法打退時間"
Gnosis.L["OptLocale"] = "選擇本地化檔案"
Gnosis.L["OptMergetradeskillDesc"] = "合並交易技能 (僅玩家施法條)."
Gnosis.L["OptMergetradeskillName"] = "合並交易技能"
Gnosis.L["OptMusic"] = "音樂"
Gnosis.L["OptNameFormatStringDesc"] = [=[輸入字符用來顯示為名字

name: 法術名
abbr<cnt>: 縮寫法術名如果字符長於壹個數值, 除非和名字想通
rank<text>: 如果等級可用顯示等級文字
misc: 如果沒有等級則顯示多種信息
arabic: 等級顯示為阿拉伯數字 (e.g. 13)
roman: 等級顯示為羅馬數字 (e.g. XIII)
txr<text>: 如果等級信息可用顯示等級文字
txm<text>: 如果多種信息可用顯示多種信息文字
target: 如果可用顯示目標名字 (僅玩家)
tar<text>: 如果目標信息可用顯示目標信息文字 (僅玩家)
who: show name of casting unit

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> 來改變顏色
col<school>: 法術傷害類型是暗影, 奧術...
col<pre>: 修改顏色為上壹個

tscur: 顯示剩余的商業技能物品計數
tstot: 顯示總的商業技能物品計數
txts<text>: 如果商業技能信息可用顯示文字

\n: force new line]=] -- Needs review
Gnosis.L["OptNameFormatStringName"] = "名字格式字符"
Gnosis.L["OptNameFormatToggleDesc"] = "如果啟用則 '顯示施法名' 和 '顯示施法等級' 選項將被忽略."
Gnosis.L["OptNameFormatToggleName"] = "啟用名字格式字符Enable name format string"
Gnosis.L["OptOutputString"] = "輸出字符"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "播放音樂檔案"
Gnosis.L["OptPlaySnd"] = "播放音效"
Gnosis.L["OptPMoC"] = "Play music on clip" -- Needs review
Gnosis.L["OptPSoC"] = "Play sound on clip" -- Needs review
Gnosis.L["OptResetPlayerData"] = "重置玩家數據 (重載界面)"
Gnosis.L["OptSaveconfigExists"] = "配置已經存在, 請首先刪除或者改名"
Gnosis.L["OptSaveconfigInvalidName"] = "沒有給出配置名"
Gnosis.L["OptShowasminutesDesc"] = "如果時間長於60秒則顯示分鐘."
Gnosis.L["OptShowasminutesName"] = "顯示分鐘"
Gnosis.L["OptShowCastNameDesc"] = "如果名字格式字符啟用選項將不可用."
Gnosis.L["OptShowCastNameName"] = "顯示施法名"
Gnosis.L["OptShowCastRankDesc"] = "如果名字格式字符啟用選項將不可用."
Gnosis.L["OptShowCastRankName"] = "顯示施法等級"
Gnosis.L["OptShowPlayerLatency"] = "顯示玩家延遲 (ms)"
Gnosis.L["OptShowSpellIcon"] = "顯示法術圖標"
Gnosis.L["OptSnd"] = "音效"
Gnosis.L["OptSpellIsAoE"] = "法術命中多個目標"
Gnosis.L["OptSpellNameOrId"] = "法術名或法術ID"
Gnosis.L["OptStickyClips"] = "Sticky clips" -- Needs review
Gnosis.L["OptStrGapDesc"] = "施法名和時間之間的最小間隔 (來決定是否重定義長字符的大小)."
Gnosis.L["OptStrGapName"] = "間隔 (名字...時間)"
Gnosis.L["OptTicksToShow"] = "要顯示的跳數"
Gnosis.L["OptTimeFormatStringDesc"] = [=[輸入字符用來顯示為時間

r<x>: 剩余時間用 X 個小數位按秒來顯示
t<x>: 總時間用 X 個小數位按秒來顯示
p<x>: 打退時間用 X 個小數位按秒來顯示

增加 s 為施法吟唱 或 m 為顯示時間 > 60秒的法術
e.g. r<1m> 或 p<2s>

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> 來修改顏色
col<school>: 法術傷害類型是暗影, 奧術...
col<pre>: 修改顏色為上壹個

\n: force new line

remark: 使用 col<r,g,b> 來修改法術打退的顏色如果需要的話]=] -- Needs review
Gnosis.L["OptTimeFormatStringName"] = "時間格式字符"
Gnosis.L["OptTimeFormatToggleDesc"] = "如果啟用則所有其他時間格式選項將被忽略."
Gnosis.L["OptTimeFormatToggleName"] = "開啟時間格式字符"
Gnosis.L["OptTotTicks"] = "總跳數"
Gnosis.L["OptWfCL_Desc"] = "Delay output/clip test after output/clip test request for given time in ms to account for possible combat log delay." -- Needs review
Gnosis.L["OptWfCL_Name"] = "等待戰鬥記錄 [ms]"
Gnosis.L["OptWidth"] = "寬"
Gnosis.L["Strata_BACK"] = "最低"
Gnosis.L["Strata_DIALOG"] = "最高"
Gnosis.L["Strata_HIGH"] = "高"
Gnosis.L["Strata_LOW"] = "低"
Gnosis.L["Strata_MEDIUM"] = "中等"
Gnosis.L["TabAdaptToCT"] = "自適應施法類型"
Gnosis.L["TabCapCENTER"] = "中"
Gnosis.L["TabCapLEFT"] = "左"
Gnosis.L["TabCapNONE"] = "無"
Gnosis.L["TabCapRIGHT"] = "右"
Gnosis.L["TabCastbars"] = "施法條"
Gnosis.L["TabChanneledSpells"] = "通道法術"
Gnosis.L["TabConfig"] = "配置"
Gnosis.L["TabCTClipTest"] = "戰鬥文字/Cliptest"
Gnosis.L["TabFreeAlign"] = "自由對齊"
Gnosis.L["TabNameTime"] = "名字...時間"
Gnosis.L["TabTimeName"] = "時間...名字"
Gnosis.L["Vertical"] = "Vertical" -- Requires localization

elseif( self.s.strLocale == "koKR" ) then
-- zhTW locale (traditional chinese)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "주시 대상"
Gnosis.L["CBSetGCD"] = "전역 재사용 대기시간(GCD)"
Gnosis.L["CBSetMirror"] = "미러"
Gnosis.L["CBSetPet"] = "소환수 차량"
Gnosis.L["CBSetPlayer"] = "플레이어"
Gnosis.L["CBSetSwing"] = "공속"
Gnosis.L["CBSetTarget"] = "대상"
Gnosis.L["Horizontal"] = "수평"
Gnosis.L["IfCCSetup"] = "일반 설정 생성"
Gnosis.L["IfCCSString"] = [=[Gnosis는 당신을 위해 일반 시전바 설정을 생성할 수 있습니다("플레이어", "대상", "주시 대상", "미러", "소환수=차량"을 위한 바). 생성된 바는 잠금이 해제된 상태이며 왼쪽 마우스 버튼을 누르고 있는 동안에 잡아 끌기를 통해 이동시킬 수 있습니다. 바를 우-클릭하게 되면 시전바 설정 gui를 불러오게 됩니다.

이동과 사용자화를 마친 연후에는 바를 잠궈야 합니다. 블리자드 시전바와 미러 시전바 둘다 비활성화될 것입니다. 유닛의 "gcd", "gcd_뒤집기"와 "공속"을 위한 바의 생성을 통해 전역 재사용 대기 지시기와 공속 타이머를 생성할 수 있습니다. Gnosis gui를 불러 들이기 위한 슬래시 명령어는 "/gnosis" 입니다. ]=] -- Needs review
Gnosis.L["IfCCTimers"] = "GCD/공속 타이머 생성"
Gnosis.L["IfConfigs"] = "설정"
Gnosis.L["IfCWAction"] = "어떠한 행동도 취하지 않고 프레임을 닫으려면 버튼을 누르세요."
Gnosis.L["IfLFConigs"] = "하나 혹은 그 이상의 저장된 설정을 찾았습니다. 이미 있는 설정중 해당되는 것을 불러들이는 것으로 Gnosis를 설정할 수 있습니다, 아래의 버튼중 해당되는 것을 누르면 됩니다(버튼 이름은 불러들인 설정의 이름입니다)."
Gnosis.L["IfNoCBs"] = "시전바가 없습니다"
Gnosis.L["IfOpenGUI"] = "설정 GUI 열기"
Gnosis.L["MsgBlizCBIsDis"] = "블리자드 시전바는 이미 다른 애드온에 의해 숨겨져 있습니다."
Gnosis.L["MsgBlizCBRestored"] = "블리자드 시전바가 복구되었습니다( gui 옵션을 보세요)"
Gnosis.L["MsgDis"] = "(비활성화)"
Gnosis.L["MsgDisBlizCB"] = "블리자드 시전바 비활성화(gui 옵션을 보세요)"
Gnosis.L["MsgDisMirrCB"] = "기본 미러 시전바 비활성화(gui 옵션을 보세요)"
Gnosis.L["MsgDisPetCB"] = "블리자드의 소환수/차량 시전바 비활성화(gui 옵션을 보세요)"
Gnosis.L["MsgEn"] = "(활성화)"
Gnosis.L["MsgLoaded"] = "불러들임"
Gnosis.L["MsgMirrCBIsDis"] = "기본 미러 시전바는 이미 다른 애드온에 의해 숨겨져 있습니다."
Gnosis.L["MsgMirrCBRestored"] = "기본 미러 시전바 복구(gui 옵션을 보세요)"
Gnosis.L["MsgPetCBIsDis"] = "블리자드 소환수/차량 시전바는 이미 다른 애드온에 의해 숨겨져 있습니다. "
Gnosis.L["MsgPetCBRestored"] = "블리자드 소환수/차량 시전바 복구(gui 옵션을 보세요)"
Gnosis.L["OptAddonDisabled_Name"] = "애드온 비활성화, 현재 설정 탭에서 활성화 할 수 있습니다."
Gnosis.L["OptAddonEnable_Desc"] = "Gnosis 전환"
Gnosis.L["OptAddonEnable_Name"] = "애드온 활성"
Gnosis.L["OptBarXYcoordDesc"] = "x,y-좌표"
Gnosis.L["OptBarXYcoordName"] = "바 위치: x, y"
Gnosis.L["OptCBAddListElem"] = "등록 추가"
Gnosis.L["OptCBAdjIcon"] = "아이콘 위치 조절(잠금을 해제한 경우에)"
Gnosis.L["OptCBAdjLatTextCoord"] = "지연률 문자 위치 조절"
Gnosis.L["OptCBAdjNamePos"] = "이름 위치 조절"
Gnosis.L["OptCBAlignName"] = "시전 이름 정렬"
Gnosis.L["OptCBAlignTime"] = "시전 시간 정렬"
Gnosis.L["OptCBAlignTimeCoord"] = "시간 위치 조절"
Gnosis.L["OptCBAlpha"] = "바 투명도"
Gnosis.L["OptCBBorderCol"] = "테두리 색상"
Gnosis.L["OptCBBorderColInt"] = "테두리 색상(차단 불가능한)"
Gnosis.L["OptCBBorderSize"] = "테두리 크기"
Gnosis.L["OptCBBWListedSpells"] = "주문의 차단/허용 목록화"
Gnosis.L["OptCBCBBgCol"] = "시전바 배경 색상"
Gnosis.L["OptCBCBColFail"] = "시전바 색상(실패)"
Gnosis.L["OptCBCBColInt"] = "시전바 색상(차단된)"
Gnosis.L["OptCBCBColor"] = "시전바 색상"
Gnosis.L["OptCBCenterCB"] = "시전바 중앙으로"
Gnosis.L["OptCBCopyCB_D"] = "시전바 복사, 시전바 이름 입력창에 정확한 이름을 입력하세요."
Gnosis.L["OptCBCopyCB_N"] = "시전바 복사"
Gnosis.L["OptCBEnCB"] = "시전바 활성"
Gnosis.L["OptCBEnList"] = "차단 혹은 허용목록 활성/비활성"
Gnosis.L["OptCBFadeout"] = "사라짐 시간"
Gnosis.L["OptCBFillAtEnd"] = "시전 끝나면 바를 채우기"
Gnosis.L["OptCBFixLatBox"] = "비플레이어 틱 박스의 크기 고정[바의 %]"
Gnosis.L["OptCBFont"] = "글꼴"
Gnosis.L["OptCBFontOutline"] = "글꼴 외곽선"
Gnosis.L["OptCBFontSizeLat"] = "지연률 글꼴 크기(0=자동으로)"
Gnosis.L["OptCBFontSizeName"] = "이름 글꼴 크기(0=자동으로)"
Gnosis.L["OptCBFontSizeTime"] = "타이머 글꼴 크기(0=자동으로)"
Gnosis.L["OptCBForceLatAlign"] = "지연률 정렬 강제"
Gnosis.L["OptCBFrameStrata"] = "프레임 계층"
Gnosis.L["OptCBIconBorderSize"] = "아이콘 테두리(잠금을 해제한 경우에)"
Gnosis.L["OptCBInvBarDir"] = "바 진행방향 반대로"
Gnosis.L["OptCBLatBoxCol"] = "지연률 박스 색상"
Gnosis.L["OptCBListBlack"] = "제외목록"
Gnosis.L["OptCBListNeither"] = "둘 다 안함"
Gnosis.L["OptCBListWhite"] = "허용목록"
Gnosis.L["OptCBMaxLatBox"] = "지연률 박스의 최대 크기[바의 %]"
Gnosis.L["OptCBNewCB_D"] = "새 시전바를 생성하기에, 유효한 이름이 주어져야 합니다."
Gnosis.L["OptCBNewCB_N"] = "새 시전바"
Gnosis.L["OptCBNewCBName_D"] = "새 시전바를 생성하기 전에 이름을 입력합니다."
Gnosis.L["OptCBNewListElem_D"] = "새 주문을 추가하기 전에 이름을 입력하세요."
Gnosis.L["OptCBOrient"] = "방향"
Gnosis.L["OptCBRemCB"] = "시전바 제거"
Gnosis.L["OptCBRemListElem"] = "현재 등록 제거"
Gnosis.L["OptCBRotIcon"] = "아이콘 회전(°)"
Gnosis.L["OptCBScaleBar"] = "바 비율"
Gnosis.L["OptCBScaleIcon"] = "아이콘 비율(잠금을 해제한 경우에)"
Gnosis.L["OptCBShowChanTicks"] = "채널링 틱 보이기"
Gnosis.L["OptCBShowIcon"] = "시전 아이콘 보이기"
Gnosis.L["OptCBShowLatBox"] = "지연률 박스 보이기"
Gnosis.L["OptCBShowSpark"] = "시전바 섬광 보이기"
Gnosis.L["OptCBSparkColor"] = "섬광 색상"
Gnosis.L["OptCBSparkHeight"] = "섬광 높이"
Gnosis.L["OptCBSparkWidth"] = "섬광 너비"
Gnosis.L["OptCBSWNC"] = "시전 중이 아닌 경우 보이기"
Gnosis.L["OptCBTextAlignment"] = "정렬 (이름-시간 순)"
Gnosis.L["OptCBTextColLat"] = "문자 색상(지연률)"
Gnosis.L["OptCBTextColName"] = "문자 색상(이름)"
Gnosis.L["OptCBTextColPB"] = "문자 색상(시전 밀림)"
Gnosis.L["OptCBTextColTime"] = "문자 색상(시간)"
Gnosis.L["OptCBTexture"] = "시전바 텍스쳐"
Gnosis.L["OptCBUnit"] = "유닛"
Gnosis.L["OptCBUnl_D"] = "시전바 잠금 해제(항상 보임)"
Gnosis.L["OptCBUnl_N"] = "시전바 잠금 해제"
Gnosis.L["OptCBUnlockIcon_D"] = "바에서 아이콘 잠금 해제"
Gnosis.L["OptCBUnlockIcon_N"] = "아이콘 잠금 해제"
Gnosis.L["OptClipWarn_Desc"] = "비 광역 채널링 주문의 틱이 끊어지면 경고합니다."
Gnosis.L["OptClipWarn_Name"] = "틱 끊김 경고 [ms]"
Gnosis.L["OptCombTicks"] = "틱과 출력을 전투 메시지에 포함시킵니다"
Gnosis.L["OptConfDelConf"] = "설정 제거"
Gnosis.L["OptConfLoadCBs"] = "시전바 불러오기"
Gnosis.L["OptConfLoadChan"] = "채널링 주문 불러오기"
Gnosis.L["OptConfLoadCT"] = "전투문자/cliptest 설정 불러오기"
Gnosis.L["OptConfLoadMain"] = "메인 탭 설정 불러오기"
Gnosis.L["OptConfName"] = "설정 이름"
Gnosis.L["OptConfSave"] = "설정 저장"
Gnosis.L["OptConfStoreCBs"] = "시전바 저장"
Gnosis.L["OptConfStoreChan"] = "채널링 주문 자료 저장"
Gnosis.L["OptConfStoreCT"] = "전투문자/cliptest 설정 저장"
Gnosis.L["OptConfStoreMain"] = "애드온 메인 설정 탭 설정 저장"
Gnosis.L["OptCopytonewbarExists"] = "바가 이미 있어, 주어진 이름으로 바를 복사할 수 없습니다."
Gnosis.L["OptCopytonewbarInvalidName"] = "새 바로 복사하기 전에 유효한 바 이름을 입력하세요."
Gnosis.L["OptCreateCBSet"] = "기본 시전바 세트 생성(빠른 출발)"
Gnosis.L["OptCreatenewbarExists"] = "바가 이미 있어, 주어진 이름으로 바를 생성할 수 없습니다. "
Gnosis.L["OptCreatenewbarInvalidName"] = "새 바를 생성하기 전에 유효한 바 이름을 입력하세요."
Gnosis.L["OptCreateNewSpell"] = "새 주문 생성"
Gnosis.L["OptCSFSClip"] = "글꼴 크기(clip, 0=기본)"
Gnosis.L["OptCSFSNonClip"] = "글꼴 크기(non clip, 0=기본)"
Gnosis.L["OptCSRemove"] = "주문 제거"
Gnosis.L["OptCTO"] = "전투 문자 출력"
Gnosis.L["OptCTO_Blizz"] = "블리자드 기본 전투 문자(BFCT)"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text(MSBT)"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text(SCT)"
Gnosis.L["OptEn"] = "활성"
Gnosis.L["OptEnClipTest"] = "clip 테스트 활성"
Gnosis.L["OptFirstStartFrame"] = "첫번째 시작 틀 열기"
Gnosis.L["OptFirstTickInst"] = "시전과 동시에 첫 틱"
Gnosis.L["OptFontResizeLongName"] = "긴 구문열 크기 조절"
Gnosis.L["OptHeight"] = "높이"
Gnosis.L["OptHideAddonMsgs"] = "Gnosis 문자 메시지 숨기기"
Gnosis.L["OptHideBlizzCB"] = "블리자드의 시전바 숨기기"
Gnosis.L["OptHidecasttime"] = "남은 시전시간 숨기기"
Gnosis.L["OptHidecasttimeTotal"] = "전체 시전시간 숨기기"
Gnosis.L["OptHideMirrorCB"] = "블리자드의 미러 시전바 숨기기"
Gnosis.L["OptHidePetCB"] = "블리자드의 소환수/차량 시전바 숨기기"
Gnosis.L["OptHidepushbackTime"] = "시전 밀림 시간 숨기기"
Gnosis.L["OptLocale"] = "언어 지역 선택"
Gnosis.L["OptMergetradeskillDesc"] = "전문기술 병합(플레이어 시전바에 한해)."
Gnosis.L["OptMergetradeskillName"] = "전문기술 병합"
Gnosis.L["OptMusic"] = "음악"
Gnosis.L["OptNameFormatStringDesc"] = [=[구문 입력 방법

name: 주문이름
abbr<cnt>: 주문이름이 cnt보다 길면 줄여씁니다, 짧으면 이름 그대로 표시
rank<text>: 주문 레벨 표시가 가능하면 레벨을 표시합니다
misc: 주문 레벨이 없는 주문에 기타 정보를 표시합니다
arabic: 주문 레벨을 아라비아 숫자로 표시 (예. 13)
roman: 주문 레벨을 로마 숫자로 표시 (예. XIII)
txr<text>: 주문 레벨 정보가 있으면 표시합니다
txm<text>: 기타 정보가 있으면 표시합니다
target: 대상의 이름을 표시합니다 (플레이어만 해당)
tar<text>: 대상 정보가 있으면 표시합니다 (플레이어만 해당)
who: show name of casting unit

col<r,g,b[,a]>: 예. col<1.0,1.0,0.0> 색상 바꾸기
col<school>: 주문 속성 별 표시...암흑,비전 등
col<pre>: 이전 색상으로 바꿉니다

tscur: 전문기술 제작시 남은 횟수를 표시합니다
tstot: 전문기술 제작시 총 횟수를 표시합니다
txts<text>: 전문기술 정보가 있으면 표시합니다

\n: force new line]=] -- Needs review
Gnosis.L["OptNameFormatStringName"] = "이름 형식 문자열"
Gnosis.L["OptNameFormatToggleDesc"] = "활성화하면 '시전 이름 보이기'와 '시전 레벨 보이기' 설정은 무시됩니다."
Gnosis.L["OptNameFormatToggleName"] = "이름 형식 구문열 활성"
Gnosis.L["OptOutputString"] = "출력 구문열"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "음악 파일 재생"
Gnosis.L["OptPlaySnd"] = "소리 재생"
Gnosis.L["OptPMoC"] = "clip시 음악 재생"
Gnosis.L["OptPSoC"] = "clip시 소리 재생"
Gnosis.L["OptResetPlayerData"] = "플레이어 자료 초기화(인터페이스 재시작)"
Gnosis.L["OptSaveconfigExists"] = "설정이 이미 있습니다. 이전 것을 삭제하거나 이름을 변경하기 바랍니다."
Gnosis.L["OptSaveconfigInvalidName"] = "주어진 설정 이름이 없습니다."
Gnosis.L["OptShowasminutesDesc"] = "60초 보다 길다면 초 대신에 분 보이기"
Gnosis.L["OptShowasminutesName"] = "분 보이기"
Gnosis.L["OptShowCastNameDesc"] = "이름 형식 구문열이 활성화되면 옵션은 사용할 수 없습니다. "
Gnosis.L["OptShowCastNameName"] = "시전 이름 보이기"
Gnosis.L["OptShowCastRankDesc"] = "이름 형식 구문열이 활성화되면 옵션은 사용할 수 없습니다."
Gnosis.L["OptShowCastRankName"] = "시전 레벨 보이기"
Gnosis.L["OptShowPlayerLatency"] = "플레이어 지연률(ms) 보이기"
Gnosis.L["OptShowSpellIcon"] = "주문 아이콘 보이기"
Gnosis.L["OptSnd"] = "소리"
Gnosis.L["OptSpellIsAoE"] = "광역 공격 주문"
Gnosis.L["OptSpellNameOrId"] = "주문 이름 혹은 주문 ID"
Gnosis.L["OptStickyClips"] = "틱 끊김 고정"
Gnosis.L["OptStrGapDesc"] = "시전 이름과 시간 사이에 최소한의 공간 두기 (긴 형식의 문자열 조절을 결정합니다)."
Gnosis.L["OptStrGapName"] = "공간 (이름...시간)"
Gnosis.L["OptTicksToShow"] = "보여줄 틱"
Gnosis.L["OptTimeFormatStringDesc"] = [=[Enter string to show as time

r<x>: remaining time in seconds with x decimals
t<x>: total time in seconds with x decimals
p<x>: pushback time in seconds with x decimals
c<x>: total-remaining => counting towards total

add s for sing or m for displaying time > 60s in minutes
e.g. r<1m> or p<2s>

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one

\n: force new line

remark: use col<r,g,b> to change color of spell pushback if needed]=] -- Requires localization
Gnosis.L["OptTimeFormatStringName"] = "시간 형식 구문열"
Gnosis.L["OptTimeFormatToggleDesc"] = "활성화하면 모든 다른 시간 형식화 옵션은 무시됩니다."
Gnosis.L["OptTimeFormatToggleName"] = "시간 형식 구문열 활성"
Gnosis.L["OptTotTicks"] = "전체 틱"
Gnosis.L["OptWfCL_Desc"] = "Delay output/clip test after output/clip test request for given time in ms to account for possible combat log delay." -- Requires localization
Gnosis.L["OptWfCL_Name"] = "전투 기록을 위한 대기[ms]"
Gnosis.L["OptWidth"] = "너비"
Gnosis.L["Strata_BACK"] = "가장 낮음"
Gnosis.L["Strata_DIALOG"] = "가장 높음"
Gnosis.L["Strata_HIGH"] = "높음"
Gnosis.L["Strata_LOW"] = "낮음"
Gnosis.L["Strata_MEDIUM"] = "중간"
Gnosis.L["TabAdaptToCT"] = "시전 유형에 맞춤"
Gnosis.L["TabCapCENTER"] = "정중앙"
Gnosis.L["TabCapLEFT"] = "왼쪽"
Gnosis.L["TabCapNONE"] = "해당 없음"
Gnosis.L["TabCapRIGHT"] = "오른쪽"
Gnosis.L["TabCastbars"] = "시전바"
Gnosis.L["TabChanneledSpells"] = "채널링 주문"
Gnosis.L["TabConfig"] = "설정"
Gnosis.L["TabCTClipTest"] = "전투문자/Cliptest"
Gnosis.L["TabFreeAlign"] = "임의 정렬"
Gnosis.L["TabNameTime"] = "이름...시간"
Gnosis.L["TabTimeName"] = "시간...이름"
Gnosis.L["Vertical"] = "수직"

elseif( self.s.strLocale == "ruRU" ) then
-- ruRU locale (russian)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "Фокус"
Gnosis.L["CBSetGCD"] = "GCD" -- Requires localization
Gnosis.L["CBSetMirror"] = "Зеркало"
Gnosis.L["CBSetPet"] = "ПитомецТранспорт"
Gnosis.L["CBSetPlayer"] = "Игрок"
Gnosis.L["CBSetSwing"] = "Взмах"
Gnosis.L["CBSetTarget"] = "Цель"
Gnosis.L["Horizontal"] = "Horizontal" -- Requires localization
Gnosis.L["IfCCSetup"] = "Create common setup" -- Requires localization
Gnosis.L["IfCCSString"] = [=[Gnosis can create a common castbar setup for you (bars for Player, Target, Focus, Mirror and Pet/Vehicle). The created bars will be unlocked and can be moved by dragging while holding down the left mouse button. Right clicking the bars will call the castbar configuration gui.

You should lock the bars when you are finished with moving and customizing. Both blizzard castbar and mirror castbar will be deactivated. You can also create a "Global Cooldown Indicator" and a "Swing Timer" (one handed melee and range including wand) by pressing the button below. The slash command to call the Gnosis gui is "/gnosis".
]=] -- Requires localization
Gnosis.L["IfCCTimers"] = "Создать таймер взмаха/GCD"
Gnosis.L["IfConfigs"] = "Конфигурации"
Gnosis.L["IfCWAction"] = "Нажмите на кнопку, чтобы закрыть фрейм без каких-либо действий"
Gnosis.L["IfLFConigs"] = [=[
One or more stored configurations have been found. You can setup Gnosis by loading from any existing configuration, just press any of the buttons below (button name is the name of the configuration that will be loaded).
]=] -- Requires localization
Gnosis.L["IfNoCBs"] = "Полосок заклинаний не найдено"
Gnosis.L["IfOpenGUI"] = "Открыть интерфейс настроек"
Gnosis.L["MsgBlizCBIsDis"] = "полоска заклинаний уже скрыта другой модификацией"
Gnosis.L["MsgBlizCBRestored"] = "полоска заклинаний blizzard восстанавлена (загляниете в настройки)"
Gnosis.L["MsgDis"] = "(отключен)"
Gnosis.L["MsgDisBlizCB"] = "полоску заклинаний blizzard отключена (загляниете в настройки)"
Gnosis.L["MsgDisMirrCB"] = "полоска заклинаний зеркала по умолчанию, отключена (загляниете в настройки)"
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)" -- Requires localization
Gnosis.L["MsgEn"] = "(включен)"
Gnosis.L["MsgLoaded"] = "загружен"
Gnosis.L["MsgMirrCBIsDis"] = "полоска заклинаний зеркала уже скрыта другой модификацией"
Gnosis.L["MsgMirrCBRestored"] = "полоска заклинаний зеркала по умолчанию, восстановлена (загляниете в настройки)"
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)" -- Requires localization
Gnosis.L["OptAddonDisabled_Name"] = "Модификация отключена, для доступа к настройкам включите её."
Gnosis.L["OptAddonEnable_Desc"] = "Включить/выключить Gnosis"
Gnosis.L["OptAddonEnable_Name"] = "Включить"
Gnosis.L["OptBarXYcoordDesc"] = "Координаты - x,y"
Gnosis.L["OptBarXYcoordName"] = "Позиция полосы: x, y"
Gnosis.L["OptCBAddListElem"] = "Добавить запись"
Gnosis.L["OptCBAdjIcon"] = "Регулировка позиции иконки (когда разблок.)"
Gnosis.L["OptCBAdjLatTextCoord"] = "Регулировка позиции текста задержки"
Gnosis.L["OptCBAdjNamePos"] = "Регулировка позиции название"
Gnosis.L["OptCBAlignName"] = "Выравнивание название произнесения"
Gnosis.L["OptCBAlignTime"] = "Выравнивание времени произнесения"
Gnosis.L["OptCBAlignTimeCoord"] = "Регулировка позиции времени"
Gnosis.L["OptCBAlpha"] = "Прозрачность полосы"
Gnosis.L["OptCBBorderCol"] = "Цвет границы"
Gnosis.L["OptCBBorderColInt"] = "Цвет границы (не прерываемый)"
Gnosis.L["OptCBBorderSize"] = "Размер границы"
Gnosis.L["OptCBBWListedSpells"] = "Заклинания черного / белого списка"
Gnosis.L["OptCBCBBgCol"] = "Цвет фона полоски заклинаний"
Gnosis.L["OptCBCBColFail"] = "Цвет полоски заклинаний (не удалось)"
Gnosis.L["OptCBCBColInt"] = "Цвет полоски заклинаний (прервано)"
Gnosis.L["OptCBCBColor"] = "Цвет полоски заклинаний"
Gnosis.L["OptCBCenterCB"] = "Полоска заклинаний по центру"
Gnosis.L["OptCBCopyCB_D"] = "Копировать полоску заклинаний, убедитесь в вводе правильного имя в новые окна редактирования полоски заклинаний."
Gnosis.L["OptCBCopyCB_N"] = "Копировать полоску заклинаний"
Gnosis.L["OptCBEnCB"] = "Включить полоску заклинаний"
Gnosis.L["OptCBEnList"] = "Включить черный- или белый список"
Gnosis.L["OptCBFadeout"] = "Время исчезновения"
Gnosis.L["OptCBFillAtEnd"] = "Заполнение полосы к концу произнесения"
Gnosis.L["OptCBFixLatBox"] = "Fixed size of non player tick box [% of bar]" -- Requires localization
Gnosis.L["OptCBFont"] = "Шрифт"
Gnosis.L["OptCBFontOutline"] = "Контур шрифта"
Gnosis.L["OptCBFontSizeLat"] = "Размер шрифта задержки (0=авто)"
Gnosis.L["OptCBFontSizeName"] = "Размер шрифта названия (0=авто)"
Gnosis.L["OptCBFontSizeTime"] = "Размер шрифта времени (0=авто)"
Gnosis.L["OptCBForceLatAlign"] = "Выравнивание задержки"
Gnosis.L["OptCBFrameStrata"] = "Слой фрейма"
Gnosis.L["OptCBIconBorderSize"] = "Границы иконки (когда разблокировано)"
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction" -- Requires localization
Gnosis.L["OptCBLatBoxCol"] = "Цвет блока задержки"
Gnosis.L["OptCBListBlack"] = "черный список"
Gnosis.L["OptCBListNeither"] = "никакой"
Gnosis.L["OptCBListWhite"] = "белый список"
Gnosis.L["OptCBMaxLatBox"] = "Maximum size of latency box [% of bar]" -- Requires localization
Gnosis.L["OptCBNewCB_D"] = "Создание новой полоски заклинаний, должно быть задано допустимое название"
Gnosis.L["OptCBNewCB_N"] = "Новая полоска заклинаний"
Gnosis.L["OptCBNewCBName_D"] = "Введите название перед создание новой полоски заклинаний"
Gnosis.L["OptCBNewListElem_D"] = "Введите название перед добавление нового заклинания"
Gnosis.L["OptCBOrient"] = "Orientation" -- Requires localization
Gnosis.L["OptCBRemCB"] = "Удалить полоску заклинаний"
Gnosis.L["OptCBRemListElem"] = "Удалить текущую запись"
Gnosis.L["OptCBRotIcon"] = "Повернуть иконку (°)"
Gnosis.L["OptCBScaleBar"] = "Масштаб полоски"
Gnosis.L["OptCBScaleIcon"] = "Масштаб иконки (когда разблок.)"
Gnosis.L["OptCBShowChanTicks"] = "Показать такт потокового закл."
Gnosis.L["OptCBShowIcon"] = "Показать иконку произнесения"
Gnosis.L["OptCBShowLatBox"] = "Показать блок задержки"
Gnosis.L["OptCBShowSpark"] = "Показать искру полоски заклинания"
Gnosis.L["OptCBSparkColor"] = "Цвет искры"
Gnosis.L["OptCBSparkHeight"] = "Высота искры"
Gnosis.L["OptCBSparkWidth"] = "Ширина искры"
Gnosis.L["OptCBSWNC"] = "Показать когда неичего не произносится"
Gnosis.L["OptCBTextAlignment"] = "Выравнивание (названия к времени)"
Gnosis.L["OptCBTextColLat"] = "Цвет текста (задержки)"
Gnosis.L["OptCBTextColName"] = "Цвет текста (названия)"
Gnosis.L["OptCBTextColPB"] = "Цвет текста (оттеснения)" -- Needs review
Gnosis.L["OptCBTextColTime"] = "Цвет текста (времени)"
Gnosis.L["OptCBTexture"] = "Текстура полоски заклинаний"
Gnosis.L["OptCBUnit"] = "Объект"
Gnosis.L["OptCBUnl_D"] = "Разблокировать полоску заклинаний (всегда показывать)"
Gnosis.L["OptCBUnl_N"] = "Разблок. полоску заклинаний"
Gnosis.L["OptCBUnlockIcon_D"] = "Разблокировать иконку от полоски"
Gnosis.L["OptCBUnlockIcon_N"] = "Разблок. иконку"
Gnosis.L["OptClipWarn_Desc"] = "Предупредить о обрывании перед тактом потокового заклинания на потоковых не AoE заклинаниях."
Gnosis.L["OptClipWarn_Name"] = "Предупреждение обрывания [мс]" -- Needs review
Gnosis.L["OptCombTicks"] = "Объединять такты и вывод через текст боя."
Gnosis.L["OptConfDelConf"] = "Удалить настройки"
Gnosis.L["OptConfLoadCBs"] = "Загрузить полоски заклинаний"
Gnosis.L["OptConfLoadChan"] = "Загрузить потоковые заклинания"
Gnosis.L["OptConfLoadCT"] = "Загрузить настройки текста боя/тест обрывания"
Gnosis.L["OptConfLoadMain"] = "Загрузить настройки основной вкладки"
Gnosis.L["OptConfName"] = "Название конфикурации"
Gnosis.L["OptConfSave"] = "Сохранить конфикурацию"
Gnosis.L["OptConfStoreCBs"] = "Сохранить полоски заклинаний"
Gnosis.L["OptConfStoreChan"] = "Сохранить данные потоковых заклинаний"
Gnosis.L["OptConfStoreCT"] = "Сохранить текст боя/тест обрывания"
Gnosis.L["OptConfStoreMain"] = "Сохранить настройки основной закладки модификации"
Gnosis.L["OptCopytonewbarExists"] = "полоска уже существует, не может скопировать полоску и задать название"
Gnosis.L["OptCopytonewbarInvalidName"] = "введите допустимое название полоски перед копированием новой полоски"
Gnosis.L["OptCreateCBSet"] = "Создать базовый набор полоски (быстрое начало)"
Gnosis.L["OptCreatenewbarExists"] = "полоска уже существует, не можно создать полоски с задонным названием"
Gnosis.L["OptCreatenewbarInvalidName"] = "введите допустимое название полоски перед созданием новой"
Gnosis.L["OptCreateNewSpell"] = "Создать новое заклинание"
Gnosis.L["OptCSFSClip"] = "Размер шрифта (обрывание, 0=по умолчанию)"
Gnosis.L["OptCSFSNonClip"] = "Размер шрифта (без обрывания, 0=по умолчанию)"
Gnosis.L["OptCSRemove"] = "Удалить заклинание"
Gnosis.L["OptCTO"] = "Вывод текста боя"
Gnosis.L["OptCTO_Blizz"] = "Текст боя Blizzard"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text"
Gnosis.L["OptEn"] = "Включить"
Gnosis.L["OptEnClipTest"] = "Включить тест обрывания"
Gnosis.L["OptFirstStartFrame"] = "Open first start frame" -- Requires localization
Gnosis.L["OptFirstTickInst"] = "Первый такт, мгновенный"
Gnosis.L["OptFontResizeLongName"] = "Изменить размер длинных строк"
Gnosis.L["OptHeight"] = "Высота"
Gnosis.L["OptHideAddonMsgs"] = "Скрыть текстовые сообщения Gnosis'а"
Gnosis.L["OptHideBlizzCB"] = "Скрыть полоску заклинаний Blizzard"
Gnosis.L["OptHidecasttime"] = "Скрыть остаток времени" -- Needs review
Gnosis.L["OptHidecasttimeTotal"] = "Скрыть общее время" -- Needs review
Gnosis.L["OptHideMirrorCB"] = "Скрыть зеркало полоски заклинаний Blizzard"
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar" -- Requires localization
Gnosis.L["OptHidepushbackTime"] = "Скрытьвремя оттеснения" -- Needs review
Gnosis.L["OptLocale"] = "Выберите локализацию"
Gnosis.L["OptMergetradeskillDesc"] = "Объединить ремесла (только полоска игрока)"
Gnosis.L["OptMergetradeskillName"] = "Объединить ремесла"
Gnosis.L["OptMusic"] = "Музыка"
Gnosis.L["OptNameFormatStringDesc"] = [=[Введите строку для показа в качестве названия

name: название заклинания
abbr<cnt>: сокращение названия заклинания если оно длинеее чем cnt, тоже что и название
rank<text>: показать уровень если доступен
misc: показать разную информацию если нет уровня
arabic: уровень арабскими цифрами (пример: 13)
roman: уровень римскими цифрами (пример: XIII)
txr<text>: показать текст, если доступна информация о уровне
txm<text>: показать текст, если доступна разная информация
target: показать название цели, если доступно (только игрок)
tar<text>: показать текст если доступна информация о цели (только игрок)
who: show name of casting unit

col<r,g,b[,a]>: Пример - col<1.0,1.0,0.0> изменяет цвет
col<school>: какая школа, темная магия, огонь...
col<pre>: изменить цвет на предыдущий

tscur: показать количество оставшихся предметов ремесла
tstot: показать общее количество предметов ремесла
txts<text>: показать текст если доступна информация о ремесле

\n: force new line]=] -- Needs review
Gnosis.L["OptNameFormatStringName"] = "Формат строк названия"
Gnosis.L["OptNameFormatToggleDesc"] = "Если включено 'Показать название заклинания' и 'Показать уровень заклинания' то выбор будет игнорироваться."
Gnosis.L["OptNameFormatToggleName"] = "Включить формат строк названия"
Gnosis.L["OptOutputString"] = "Строка вывода"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "Проиграть файл музыки"
Gnosis.L["OptPlaySnd"] = "Приграть звук"
Gnosis.L["OptPMoC"] = "Проиграть музыку при обрывании"
Gnosis.L["OptPSoC"] = "Проиграть звук при обрывании"
Gnosis.L["OptResetPlayerData"] = "Сброс данных игрока (перезагрузка интерфейса)"
Gnosis.L["OptSaveconfigExists"] = "конфигурация уже существует, удалите или измените название"
Gnosis.L["OptSaveconfigInvalidName"] = "не задано название конфигурации"
Gnosis.L["OptShowasminutesDesc"] = "Показать минуты вместо секунд, если больше чем 60с."
Gnosis.L["OptShowasminutesName"] = "Показать минуты"
Gnosis.L["OptShowCastNameDesc"] = "Настройка не будет использоваться если включен формат строки названия."
Gnosis.L["OptShowCastNameName"] = "Показать название заклинания"
Gnosis.L["OptShowCastRankDesc"] = "Настройка не будет использоваться если включен формат строки названия."
Gnosis.L["OptShowCastRankName"] = "Показать уровень заклинания"
Gnosis.L["OptShowPlayerLatency"] = "Показать задержку игрока (мс)"
Gnosis.L["OptShowSpellIcon"] = "Показать иконку заклинания"
Gnosis.L["OptSnd"] = "Звук"
Gnosis.L["OptSpellIsAoE"] = "Попадание закл. по нескольким существам" -- Needs review
Gnosis.L["OptSpellNameOrId"] = "Название или ID заклинания"
Gnosis.L["OptStickyClips"] = "Фиксация обрывания"
Gnosis.L["OptStrGapDesc"] = "Минимальный промежуток между название заклинания и времени (решение изменения размера длинной строки)."
Gnosis.L["OptStrGapName"] = "Промежуток (название..время)"
Gnosis.L["OptTicksToShow"] = "Показать такт" -- Needs review
Gnosis.L["OptTimeFormatStringDesc"] = [=[Введите строку для показа в качестве времени

r<x>: остаток времени в секундах с x десятичными
t<x>: общее время в секундах с x десятичными
p<x>: время оттеснения в секундах с x десятичными

add s for sing or m for displaying time > 60s in minutes
e.g. r<1m> or p<2s>

col<r,g,b[,a]>: Пример - col<1.0,1.0,0.0> изменяет цвет
col<school>: какая школа, темная магия, огонь...
col<pre>: изменить цвет на предыдущий

\n: force new line

remark: используйте col<r,g,b> чтобы изменить цвет оттеснения заклинания, если нужно]=] -- Needs review
Gnosis.L["OptTimeFormatStringName"] = "Строки формата времени"
Gnosis.L["OptTimeFormatToggleDesc"] = "Если включено, все другие настройки формата времени будут игнорироваться."
Gnosis.L["OptTimeFormatToggleName"] = "Включитьстроки формата времени"
Gnosis.L["OptTotTicks"] = "Всего тактов" -- Needs review
Gnosis.L["OptWfCL_Desc"] = "Задержка вывода/теста обрывания, после вывода/теста обрывания, требуется заданное время в миллисекундах для учета возможных задержек в журнале боя." -- Needs review
Gnosis.L["OptWfCL_Name"] = "Ожидание журнала боя [мс]"
Gnosis.L["OptWidth"] = "Ширина"
Gnosis.L["Strata_BACK"] = "Нижний"
Gnosis.L["Strata_DIALOG"] = "Наивысший"
Gnosis.L["Strata_HIGH"] = "Высокий"
Gnosis.L["Strata_LOW"] = "Низкий"
Gnosis.L["Strata_MEDIUM"] = "Средний"
Gnosis.L["TabAdaptToCT"] = "Адаптировать к типу заклинания" -- Needs review
Gnosis.L["TabCapCENTER"] = "ЦЕНТР"
Gnosis.L["TabCapLEFT"] = "ЛЕВО"
Gnosis.L["TabCapNONE"] = "НЕТУ"
Gnosis.L["TabCapRIGHT"] = "ПРАВО"
Gnosis.L["TabCastbars"] = "Полоски заклинаний"
Gnosis.L["TabChanneledSpells"] = "Потоковые заклинания"
Gnosis.L["TabConfig"] = "Настройки"
Gnosis.L["TabCTClipTest"] = "Текст боя/обрывания"
Gnosis.L["TabFreeAlign"] = "Свободное выравнивание"
Gnosis.L["TabNameTime"] = "Название...Время"
Gnosis.L["TabTimeName"] = "Время...Название"
Gnosis.L["Vertical"] = "Vertical" -- Requires localization

elseif( self.s.strLocale == "frFR" ) then
-- frFR locale (french)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "Focus"
Gnosis.L["CBSetGCD"] = "GCD" -- Requires localization
Gnosis.L["CBSetMirror"] = "Miroir"
Gnosis.L["CBSetPet"] = "PetVehicle" -- Requires localization
Gnosis.L["CBSetPlayer"] = "Joueur"
Gnosis.L["CBSetSwing"] = "Swing" -- Requires localization
Gnosis.L["CBSetTarget"] = "Cible"
Gnosis.L["Horizontal"] = "Horizontal" -- Requires localization
Gnosis.L["IfCCSetup"] = "Create common setup" -- Requires localization
Gnosis.L["IfCCSString"] = [=[Gnosis can create a common castbar setup for you (bars for Player, Target, Focus, Mirror and Pet/Vehicle). The created bars will be unlocked and can be moved by dragging while holding down the left mouse button. Right clicking the bars will call the castbar configuration gui.

You should lock the bars when you are finished with moving and customizing. Both blizzard castbar and mirror castbar will be deactivated. You can also create a "Global Cooldown Indicator" and a "Swing Timer" (one handed melee and range including wand) by pressing the button below. The slash command to call the Gnosis gui is "/gnosis".
]=] -- Requires localization
Gnosis.L["IfCCTimers"] = "Create GCD/Swing timers" -- Requires localization
Gnosis.L["IfConfigs"] = "Configurations" -- Requires localization
Gnosis.L["IfCWAction"] = "Press button to close frame without taking any action" -- Requires localization
Gnosis.L["IfLFConigs"] = [=[
One or more stored configurations have been found. You can setup Gnosis by loading from any existing configuration, just press any of the buttons below (button name is the name of the configuration that will be loaded).
]=] -- Requires localization
Gnosis.L["IfNoCBs"] = "No castbars found" -- Requires localization
Gnosis.L["IfOpenGUI"] = "Open config GUI" -- Requires localization
Gnosis.L["MsgBlizCBIsDis"] = "Barre de cast blizzard est déjà caché par un autre addon"
Gnosis.L["MsgBlizCBRestored"] = "blizzard castbar restored (see gui options)" -- Requires localization
Gnosis.L["MsgDis"] = "(disabled)" -- Requires localization
Gnosis.L["MsgDisBlizCB"] = "disabled blizzard castbar (see gui options)" -- Requires localization
Gnosis.L["MsgDisMirrCB"] = "disabled default mirror castbar (see gui options)" -- Requires localization
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)" -- Requires localization
Gnosis.L["MsgEn"] = "(enabled)" -- Requires localization
Gnosis.L["MsgLoaded"] = "loaded" -- Requires localization
Gnosis.L["MsgMirrCBIsDis"] = "default mirror castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgMirrCBRestored"] = "default mirror castbar restored (see gui options)" -- Requires localization
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon" -- Requires localization
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)" -- Requires localization
Gnosis.L["OptAddonDisabled_Name"] = "Addon disabled, enable to access current config tab." -- Requires localization
Gnosis.L["OptAddonEnable_Desc"] = "Toggle Gnosis" -- Requires localization
Gnosis.L["OptAddonEnable_Name"] = "Enable Addon" -- Requires localization
Gnosis.L["OptBarXYcoordDesc"] = "x,y-coordinate" -- Requires localization
Gnosis.L["OptBarXYcoordName"] = "Bar position: x, y" -- Requires localization
Gnosis.L["OptCBAddListElem"] = "Add entry" -- Requires localization
Gnosis.L["OptCBAdjIcon"] = "Adjust icon position (when unlocked)" -- Requires localization
Gnosis.L["OptCBAdjLatTextCoord"] = "Adjust latency text position" -- Requires localization
Gnosis.L["OptCBAdjNamePos"] = "Adjust name position" -- Requires localization
Gnosis.L["OptCBAlignName"] = "Align castname" -- Requires localization
Gnosis.L["OptCBAlignTime"] = "Align casttime" -- Requires localization
Gnosis.L["OptCBAlignTimeCoord"] = "Adjust time position" -- Requires localization
Gnosis.L["OptCBAlpha"] = "Bar alpha" -- Requires localization
Gnosis.L["OptCBBorderCol"] = "Border color" -- Requires localization
Gnosis.L["OptCBBorderColInt"] = "Border color (non interruptible)" -- Requires localization
Gnosis.L["OptCBBorderSize"] = "Border size" -- Requires localization
Gnosis.L["OptCBBWListedSpells"] = "Black-/whitelisted spells" -- Requires localization
Gnosis.L["OptCBCBBgCol"] = "Castbar background color" -- Requires localization
Gnosis.L["OptCBCBColFail"] = "Castbar color (failed)" -- Requires localization
Gnosis.L["OptCBCBColInt"] = "Castbar color (interrupted)" -- Requires localization
Gnosis.L["OptCBCBColor"] = "Castbar color" -- Requires localization
Gnosis.L["OptCBCenterCB"] = "Center castbar" -- Requires localization
Gnosis.L["OptCBCopyCB_D"] = "Copy castbar, make sure to enter valid name in New castbar edit box." -- Requires localization
Gnosis.L["OptCBCopyCB_N"] = "Copy castbar" -- Requires localization
Gnosis.L["OptCBEnCB"] = "Enable castbar" -- Requires localization
Gnosis.L["OptCBEnList"] = "Enable/disable black- or whitelist" -- Requires localization
Gnosis.L["OptCBFadeout"] = "Fadeout time" -- Requires localization
Gnosis.L["OptCBFillAtEnd"] = "Fill bar up at castend" -- Requires localization
Gnosis.L["OptCBFixLatBox"] = "Fixed size of non player tick box [% of bar]" -- Requires localization
Gnosis.L["OptCBFont"] = "Font" -- Requires localization
Gnosis.L["OptCBFontOutline"] = "Font outline" -- Requires localization
Gnosis.L["OptCBFontSizeLat"] = "Latency font size (0=automatic)" -- Requires localization
Gnosis.L["OptCBFontSizeName"] = "Name font size (0=automatic)" -- Requires localization
Gnosis.L["OptCBFontSizeTime"] = "Timer font size (0=automatic)" -- Requires localization
Gnosis.L["OptCBForceLatAlign"] = "Force latency alignment" -- Requires localization
Gnosis.L["OptCBFrameStrata"] = "Frame strata" -- Requires localization
Gnosis.L["OptCBIconBorderSize"] = "Icon border (when unlocked)" -- Requires localization
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction" -- Requires localization
Gnosis.L["OptCBLatBoxCol"] = "Latency box color" -- Requires localization
Gnosis.L["OptCBListBlack"] = "blacklist" -- Requires localization
Gnosis.L["OptCBListNeither"] = "neither" -- Requires localization
Gnosis.L["OptCBListWhite"] = "whitelist" -- Requires localization
Gnosis.L["OptCBMaxLatBox"] = "Maximum size of latency box [% of bar]" -- Requires localization
Gnosis.L["OptCBNewCB_D"] = "Create new castbar, valid name must be given" -- Requires localization
Gnosis.L["OptCBNewCB_N"] = "New castbar" -- Requires localization
Gnosis.L["OptCBNewCBName_D"] = "Enter name before creating new castbar" -- Requires localization
Gnosis.L["OptCBNewListElem_D"] = "Enter name before adding new spell" -- Requires localization
Gnosis.L["OptCBOrient"] = "Orientation" -- Requires localization
Gnosis.L["OptCBRemCB"] = "Remove castbar" -- Requires localization
Gnosis.L["OptCBRemListElem"] = "Remove current entry" -- Requires localization
Gnosis.L["OptCBRotIcon"] = "Rotate Icon (°)" -- Requires localization
Gnosis.L["OptCBScaleBar"] = "Scale bar" -- Requires localization
Gnosis.L["OptCBScaleIcon"] = "Scale icon (when unlocked)" -- Requires localization
Gnosis.L["OptCBShowChanTicks"] = "Show channeled ticks" -- Requires localization
Gnosis.L["OptCBShowIcon"] = "Show cast icon" -- Requires localization
Gnosis.L["OptCBShowLatBox"] = "Show latency box" -- Requires localization
Gnosis.L["OptCBShowSpark"] = "Show castbar spark" -- Requires localization
Gnosis.L["OptCBSparkColor"] = "Spark color" -- Requires localization
Gnosis.L["OptCBSparkHeight"] = "Spark height" -- Requires localization
Gnosis.L["OptCBSparkWidth"] = "Spark width" -- Requires localization
Gnosis.L["OptCBSWNC"] = "Show when not casting" -- Requires localization
Gnosis.L["OptCBTextAlignment"] = "Alignment (name to time)" -- Requires localization
Gnosis.L["OptCBTextColLat"] = "Text color (latency)" -- Requires localization
Gnosis.L["OptCBTextColName"] = "Text color (name)" -- Requires localization
Gnosis.L["OptCBTextColPB"] = "Text color (pushback)" -- Requires localization
Gnosis.L["OptCBTextColTime"] = "Text color (time)" -- Requires localization
Gnosis.L["OptCBTexture"] = "Castbar texture" -- Requires localization
Gnosis.L["OptCBUnit"] = "Unit" -- Requires localization
Gnosis.L["OptCBUnl_D"] = "Unlock castbar (always shown)" -- Requires localization
Gnosis.L["OptCBUnl_N"] = "Unlock castbar" -- Requires localization
Gnosis.L["OptCBUnlockIcon_D"] = "Unlock icon from bar" -- Requires localization
Gnosis.L["OptCBUnlockIcon_N"] = "Unlock icon" -- Requires localization
Gnosis.L["OptClipWarn_Desc"] = "Warn when clipping shortly before channel tick occurs on non aoe channeled spells." -- Requires localization
Gnosis.L["OptClipWarn_Name"] = "Clipping warning [ms]" -- Requires localization
Gnosis.L["OptCombTicks"] = "Combine ticks and output via combat text" -- Requires localization
Gnosis.L["OptConfDelConf"] = "Remove config" -- Requires localization
Gnosis.L["OptConfLoadCBs"] = "Load castbars" -- Requires localization
Gnosis.L["OptConfLoadChan"] = "Load channeled spells" -- Requires localization
Gnosis.L["OptConfLoadCT"] = "Load combattext/cliptest settings" -- Requires localization
Gnosis.L["OptConfLoadMain"] = "Load main tab settings" -- Requires localization
Gnosis.L["OptConfName"] = "Configuration name" -- Requires localization
Gnosis.L["OptConfSave"] = "Save configuration" -- Requires localization
Gnosis.L["OptConfStoreCBs"] = "Store castbars" -- Requires localization
Gnosis.L["OptConfStoreChan"] = "Store channeled spells data" -- Requires localization
Gnosis.L["OptConfStoreCT"] = "Store combattext/cliptest settings" -- Requires localization
Gnosis.L["OptConfStoreMain"] = "Store addon main config tab settings" -- Requires localization
Gnosis.L["OptCopytonewbarExists"] = "bar already exists, cannot copy bar to given name" -- Requires localization
Gnosis.L["OptCopytonewbarInvalidName"] = "enter valid bar name before copying to a new bar" -- Requires localization
Gnosis.L["OptCreateCBSet"] = "Create basic castbar set (quick start)" -- Requires localization
Gnosis.L["OptCreatenewbarExists"] = "bar already exists, cannot create bar with given name" -- Requires localization
Gnosis.L["OptCreatenewbarInvalidName"] = "enter valid bar name before creating new bar" -- Requires localization
Gnosis.L["OptCreateNewSpell"] = "Create new spell" -- Requires localization
Gnosis.L["OptCSFSClip"] = "Font size (clip, 0=default)" -- Requires localization
Gnosis.L["OptCSFSNonClip"] = "Font size (non clip, 0=default)" -- Requires localization
Gnosis.L["OptCSRemove"] = "Remove spell" -- Requires localization
Gnosis.L["OptCTO"] = "Combat text output" -- Requires localization
Gnosis.L["OptCTO_Blizz"] = "Blizzard's Floating Combat Text" -- Requires localization
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text" -- Requires localization
Gnosis.L["OptCTO_Parrot"] = "Parrot" -- Requires localization
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text" -- Requires localization
Gnosis.L["OptEn"] = "Enable" -- Requires localization
Gnosis.L["OptEnClipTest"] = "Enable clip test" -- Requires localization
Gnosis.L["OptFirstStartFrame"] = "Open first start frame" -- Requires localization
Gnosis.L["OptFirstTickInst"] = "First tick is instant" -- Requires localization
Gnosis.L["OptFontResizeLongName"] = "Resize long strings" -- Requires localization
Gnosis.L["OptHeight"] = "Height" -- Requires localization
Gnosis.L["OptHideAddonMsgs"] = "Hide Gnosis text messages" -- Requires localization
Gnosis.L["OptHideBlizzCB"] = "Hide Blizzard's castbar" -- Requires localization
Gnosis.L["OptHidecasttime"] = "Hide casttime left" -- Requires localization
Gnosis.L["OptHidecasttimeTotal"] = "Hide casttime total" -- Requires localization
Gnosis.L["OptHideMirrorCB"] = "Hide Blizzard's mirror castbar" -- Requires localization
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar" -- Requires localization
Gnosis.L["OptHidepushbackTime"] = "Hide pushback time" -- Requires localization
Gnosis.L["OptLocale"] = "Select localization" -- Requires localization
Gnosis.L["OptMergetradeskillDesc"] = "Merge tradeskill (player castbar only)." -- Requires localization
Gnosis.L["OptMergetradeskillName"] = "Merge tradeskill" -- Requires localization
Gnosis.L["OptMusic"] = "Music" -- Requires localization
Gnosis.L["OptNameFormatStringDesc"] = [=[Enter string to show as name

name: spellname
abbr<cnt>: abbreviated spellname if longer than cnt, otherwise same as name
rank<text>: show text if rank available
misc: show miscellaneous info if non rank
arabic: rank as arabic numeral (e.g. 13)
roman: rank as roman numeral (e.g. XIII)
txr<text>: show text if rank info available
txm<text>: show text if misc info available
target: show target name if available (player only)
tar<text>: show text if target information avaiable (player only)
who: show name of casting unit

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one

tscur: show remaining tradeskill item count
tstot: show total tradeskill item count
txts<text>: show text if tradeskill information available

\n: force new line]=] -- Requires localization
Gnosis.L["OptNameFormatStringName"] = "Name format string" -- Requires localization
Gnosis.L["OptNameFormatToggleDesc"] = "If enabled 'Show cast name' and 'Show cast rank' selections ignored." -- Requires localization
Gnosis.L["OptNameFormatToggleName"] = "Enable name format string" -- Requires localization
Gnosis.L["OptOutputString"] = "Output string" -- Requires localization
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=] -- Requires localization
Gnosis.L["OptPlayMusic"] = "Play music file" -- Requires localization
Gnosis.L["OptPlaySnd"] = "Play sound" -- Requires localization
Gnosis.L["OptPMoC"] = "Play music on clip" -- Requires localization
Gnosis.L["OptPSoC"] = "Play sound on clip" -- Requires localization
Gnosis.L["OptResetPlayerData"] = "Reset player data (reloads interface)" -- Requires localization
Gnosis.L["OptSaveconfigExists"] = "configuration already exists, please delete first or change name" -- Requires localization
Gnosis.L["OptSaveconfigInvalidName"] = "no configuration name given" -- Requires localization
Gnosis.L["OptShowasminutesDesc"] = "Show minutes instead of seconds if longer than than 60s." -- Requires localization
Gnosis.L["OptShowasminutesName"] = "Show minutes" -- Requires localization
Gnosis.L["OptShowCastNameDesc"] = "Option not used if name format string enabled." -- Requires localization
Gnosis.L["OptShowCastNameName"] = "Show cast name" -- Requires localization
Gnosis.L["OptShowCastRankDesc"] = "Option not used if name format string enabled." -- Requires localization
Gnosis.L["OptShowCastRankName"] = "Show cast rank" -- Requires localization
Gnosis.L["OptShowPlayerLatency"] = "Show player latency (ms)" -- Requires localization
Gnosis.L["OptShowSpellIcon"] = "Show spell icon" -- Requires localization
Gnosis.L["OptSnd"] = "Sound" -- Requires localization
Gnosis.L["OptSpellIsAoE"] = "Spell hits multiple mobs" -- Requires localization
Gnosis.L["OptSpellNameOrId"] = "Spellname or Spell ID" -- Requires localization
Gnosis.L["OptStickyClips"] = "Sticky clips" -- Requires localization
Gnosis.L["OptStrGapDesc"] = "Minimal gap between castname and time strings (to decide whether to resize long string)." -- Requires localization
Gnosis.L["OptStrGapName"] = "Gap (name...time)" -- Requires localization
Gnosis.L["OptTicksToShow"] = "Ticks to show" -- Requires localization
Gnosis.L["OptTimeFormatStringDesc"] = [=[Enter string to show as time

r<x>: remaining time in seconds with x decimals
t<x>: total time in seconds with x decimals
p<x>: pushback time in seconds with x decimals
c<x>: total-remaining => counting towards total

add s for sing or m for displaying time > 60s in minutes
e.g. r<1m> or p<2s>

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one

\n: force new line

remark: use col<r,g,b> to change color of spell pushback if needed]=] -- Requires localization
Gnosis.L["OptTimeFormatStringName"] = "Time format string" -- Requires localization
Gnosis.L["OptTimeFormatToggleDesc"] = "If enabled all other time formatting options are ignored." -- Requires localization
Gnosis.L["OptTimeFormatToggleName"] = "Enable time format string" -- Requires localization
Gnosis.L["OptTotTicks"] = "Total ticks" -- Requires localization
Gnosis.L["OptWfCL_Desc"] = "Delay output/clip test after output/clip test request for given time in ms to account for possible combat log delay." -- Requires localization
Gnosis.L["OptWfCL_Name"] = "Wait for combat log [ms]" -- Requires localization
Gnosis.L["OptWidth"] = "Width" -- Requires localization
Gnosis.L["Strata_BACK"] = "Lowest" -- Requires localization
Gnosis.L["Strata_DIALOG"] = "Highest" -- Requires localization
Gnosis.L["Strata_HIGH"] = "High" -- Requires localization
Gnosis.L["Strata_LOW"] = "Low" -- Requires localization
Gnosis.L["Strata_MEDIUM"] = "Medium" -- Requires localization
Gnosis.L["TabAdaptToCT"] = "Adapt to casttype" -- Requires localization
Gnosis.L["TabCapCENTER"] = "CENTER" -- Requires localization
Gnosis.L["TabCapLEFT"] = "LEFT" -- Requires localization
Gnosis.L["TabCapNONE"] = "NONE" -- Requires localization
Gnosis.L["TabCapRIGHT"] = "RIGHT" -- Requires localization
Gnosis.L["TabCastbars"] = "Castbars" -- Requires localization
Gnosis.L["TabChanneledSpells"] = "Channeled Spells" -- Requires localization
Gnosis.L["TabConfig"] = "Configurations" -- Requires localization
Gnosis.L["TabCTClipTest"] = "Combattext/Cliptest" -- Requires localization
Gnosis.L["TabFreeAlign"] = "Free alignment" -- Requires localization
Gnosis.L["TabNameTime"] = "Name...Time" -- Requires localization
Gnosis.L["TabTimeName"] = "Time...Name" -- Requires localization
Gnosis.L["Vertical"] = "Vertical" -- Requires localization

else
-- default locale (english)
Gnosis.L["AddonName"] = "Gnosis"
Gnosis.L["CBSetFocus"] = "Focus"
Gnosis.L["CBSetGCD"] = "GCD"
Gnosis.L["CBSetMirror"] = "Mirror"
Gnosis.L["CBSetPet"] = "PetVehicle"
Gnosis.L["CBSetPlayer"] = "Player"
Gnosis.L["CBSetSwing"] = "Swing"
Gnosis.L["CBSetTarget"] = "Target"
Gnosis.L["Horizontal"] = "Horizontal"
Gnosis.L["IfCCSetup"] = "Create common setup"
Gnosis.L["IfCCSString"] = [=[Gnosis can create a common castbar setup for you (bars for Player, Target, Focus, Mirror and Pet/Vehicle). The created bars will be unlocked and can be moved by dragging while holding down the left mouse button. Right clicking the bars will call the castbar configuration gui.

You should lock the bars when you are finished with moving and customizing. Both blizzard castbar and mirror castbar will be deactivated. You can also create a "Global Cooldown Indicator" and a "Swing Timer" (one handed melee and range including wand) by pressing the button below. The slash command to call the Gnosis gui is "/gnosis".
]=]
Gnosis.L["IfCCTimers"] = "Create GCD/Swing timers"
Gnosis.L["IfConfigs"] = "Configurations"
Gnosis.L["IfCWAction"] = "Press button to close frame without taking any action"
Gnosis.L["IfLFConigs"] = [=[
One or more stored configurations have been found. You can setup Gnosis by loading from any existing configuration, just press any of the buttons below (button name is the name of the configuration that will be loaded).
]=]
Gnosis.L["IfNoCBs"] = "No castbars found"
Gnosis.L["IfOpenGUI"] = "Open config GUI"
Gnosis.L["MsgBlizCBIsDis"] = "blizzard castbar already hidden by another addon"
Gnosis.L["MsgBlizCBRestored"] = "blizzard castbar restored (see gui options)"
Gnosis.L["MsgDis"] = "(disabled)"
Gnosis.L["MsgDisBlizCB"] = "disabled blizzard castbar (see gui options)"
Gnosis.L["MsgDisMirrCB"] = "disabled default mirror castbar (see gui options)"
Gnosis.L["MsgDisPetCB"] = "disabled blizzard pet/vehicle castbar (see gui options)"
Gnosis.L["MsgEn"] = "(enabled)"
Gnosis.L["MsgLoaded"] = "loaded"
Gnosis.L["MsgMirrCBIsDis"] = "default mirror castbar already hidden by another addon"
Gnosis.L["MsgMirrCBRestored"] = "default mirror castbar restored (see gui options)"
Gnosis.L["MsgPetCBIsDis"] = "blizzard pet/vehicle castbar already hidden by another addon"
Gnosis.L["MsgPetCBRestored"] = "blizzard pet/vehicle castbar restored (see gui options)"
Gnosis.L["OptAddonDisabled_Name"] = "Addon disabled, enable to access current config tab."
Gnosis.L["OptAddonEnable_Desc"] = "Toggle Gnosis"
Gnosis.L["OptAddonEnable_Name"] = "Enable Addon"
Gnosis.L["OptBarXYcoordDesc"] = "x,y-coordinate"
Gnosis.L["OptBarXYcoordName"] = "Bar position: x, y"
Gnosis.L["OptCBAddListElem"] = "Add entry"
Gnosis.L["OptCBAdjIcon"] = "Adjust icon position (when unlocked)"
Gnosis.L["OptCBAdjLatTextCoord"] = "Adjust latency text position"
Gnosis.L["OptCBAdjNamePos"] = "Adjust name position"
Gnosis.L["OptCBAlignName"] = "Align castname"
Gnosis.L["OptCBAlignTime"] = "Align casttime"
Gnosis.L["OptCBAlignTimeCoord"] = "Adjust time position"
Gnosis.L["OptCBAlpha"] = "Bar alpha"
Gnosis.L["OptCBBorderCol"] = "Border color"
Gnosis.L["OptCBBorderColInt"] = "Border color (non interruptible)"
Gnosis.L["OptCBBorderSize"] = "Border size"
Gnosis.L["OptCBBWListedSpells"] = "Black-/whitelisted spells"
Gnosis.L["OptCBCBBgCol"] = "Castbar background color"
Gnosis.L["OptCBCBColFail"] = "Castbar color (failed)"
Gnosis.L["OptCBCBColInt"] = "Castbar color (interrupted)"
Gnosis.L["OptCBCBColor"] = "Castbar color"
Gnosis.L["OptCBCenterCB"] = "Center castbar"
Gnosis.L["OptCBCopyCB_D"] = "Copy castbar, make sure to enter valid name in New castbar edit box."
Gnosis.L["OptCBCopyCB_N"] = "Copy castbar"
Gnosis.L["OptCBEnCB"] = "Enable castbar"
Gnosis.L["OptCBEnList"] = "Enable/disable black- or whitelist"
Gnosis.L["OptCBFadeout"] = "Fadeout time"
Gnosis.L["OptCBFillAtEnd"] = "Fill bar up at castend"
Gnosis.L["OptCBFixLatBox"] = "Fixed size of non player tick box [% of bar]"
Gnosis.L["OptCBFont"] = "Font"
Gnosis.L["OptCBFontOutline"] = "Font outline"
Gnosis.L["OptCBFontSizeLat"] = "Latency font size (0=automatic)"
Gnosis.L["OptCBFontSizeName"] = "Name font size (0=automatic)"
Gnosis.L["OptCBFontSizeTime"] = "Timer font size (0=automatic)"
Gnosis.L["OptCBForceLatAlign"] = "Force latency alignment"
Gnosis.L["OptCBFrameStrata"] = "Frame strata"
Gnosis.L["OptCBIconBorderSize"] = "Icon border (when unlocked)"
Gnosis.L["OptCBInvBarDir"] = "Invert bar direction"
Gnosis.L["OptCBLatBoxCol"] = "Latency box color"
Gnosis.L["OptCBListBlack"] = "blacklist"
Gnosis.L["OptCBListNeither"] = "neither"
Gnosis.L["OptCBListWhite"] = "whitelist"
Gnosis.L["OptCBMaxLatBox"] = "Maximum size of latency box [% of bar]"
Gnosis.L["OptCBNewCB_D"] = "Create new castbar, valid name must be given"
Gnosis.L["OptCBNewCB_N"] = "New castbar"
Gnosis.L["OptCBNewCBName_D"] = "Enter name before creating new castbar"
Gnosis.L["OptCBNewListElem_D"] = "Enter name before adding new spell"
Gnosis.L["OptCBOrient"] = "Orientation"
Gnosis.L["OptCBRemCB"] = "Remove castbar"
Gnosis.L["OptCBRemListElem"] = "Remove current entry"
Gnosis.L["OptCBRotIcon"] = "Rotate Icon (°)"
Gnosis.L["OptCBScaleBar"] = "Scale bar"
Gnosis.L["OptCBScaleIcon"] = "Scale icon (when unlocked)"
Gnosis.L["OptCBShowChanTicks"] = "Show channeled ticks"
Gnosis.L["OptCBShowIcon"] = "Show cast icon"
Gnosis.L["OptCBShowLatBox"] = "Show latency box"
Gnosis.L["OptCBShowSpark"] = "Show castbar spark"
Gnosis.L["OptCBSparkColor"] = "Spark color"
Gnosis.L["OptCBSparkHeight"] = "Spark height"
Gnosis.L["OptCBSparkWidth"] = "Spark width"
Gnosis.L["OptCBSWNC"] = "Show when not casting"
Gnosis.L["OptCBTextAlignment"] = "Alignment (name to time)"
Gnosis.L["OptCBTextColLat"] = "Text color (latency)"
Gnosis.L["OptCBTextColName"] = "Text color (name)"
Gnosis.L["OptCBTextColPB"] = "Text color (pushback)"
Gnosis.L["OptCBTextColTime"] = "Text color (time)"
Gnosis.L["OptCBTexture"] = "Castbar texture"
Gnosis.L["OptCBUnit"] = "Unit"
Gnosis.L["OptCBUnl_D"] = "Unlock castbar (always shown)"
Gnosis.L["OptCBUnl_N"] = "Unlock castbar"
Gnosis.L["OptCBUnlockIcon_D"] = "Unlock icon from bar"
Gnosis.L["OptCBUnlockIcon_N"] = "Unlock icon"
Gnosis.L["OptClipWarn_Desc"] = "Warn when clipping shortly before channel tick occurs on non aoe channeled spells."
Gnosis.L["OptClipWarn_Name"] = "Clipping warning [ms]"
Gnosis.L["OptCombTicks"] = "Combine ticks and output via combat text"
Gnosis.L["OptConfDelConf"] = "Remove config"
Gnosis.L["OptConfLoadCBs"] = "Load castbars"
Gnosis.L["OptConfLoadChan"] = "Load channeled spells"
Gnosis.L["OptConfLoadCT"] = "Load combattext/cliptest settings"
Gnosis.L["OptConfLoadMain"] = "Load main tab settings"
Gnosis.L["OptConfName"] = "Configuration name"
Gnosis.L["OptConfSave"] = "Save configuration"
Gnosis.L["OptConfStoreCBs"] = "Store castbars"
Gnosis.L["OptConfStoreChan"] = "Store channeled spells data"
Gnosis.L["OptConfStoreCT"] = "Store combattext/cliptest settings"
Gnosis.L["OptConfStoreMain"] = "Store addon main config tab settings"
Gnosis.L["OptCopytonewbarExists"] = "bar already exists, cannot copy bar to given name"
Gnosis.L["OptCopytonewbarInvalidName"] = "enter valid bar name before copying to a new bar"
Gnosis.L["OptCreateCBSet"] = "Create basic castbar set (quick start)"
Gnosis.L["OptCreatenewbarExists"] = "bar already exists, cannot create bar with given name"
Gnosis.L["OptCreatenewbarInvalidName"] = "enter valid bar name before creating new bar"
Gnosis.L["OptCreateNewSpell"] = "Create new spell"
Gnosis.L["OptCSFSClip"] = "Font size (clip, 0=default)"
Gnosis.L["OptCSFSNonClip"] = "Font size (non clip, 0=default)"
Gnosis.L["OptCSRemove"] = "Remove spell"
Gnosis.L["OptCTO"] = "Combat text output"
Gnosis.L["OptCTO_Blizz"] = "Blizzard's Floating Combat Text"
Gnosis.L["OptCTO_MSBT"] = "Mik's Scrolling Battle Text"
Gnosis.L["OptCTO_Parrot"] = "Parrot"
Gnosis.L["OptCTO_SCT"] = "Scrolling Combat Text"
Gnosis.L["OptEn"] = "Enable"
Gnosis.L["OptEnClipTest"] = "Enable clip test"
Gnosis.L["OptFirstStartFrame"] = "Open first start frame"
Gnosis.L["OptFirstTickInst"] = "First tick is instant"
Gnosis.L["OptFontResizeLongName"] = "Resize long strings"
Gnosis.L["OptHeight"] = "Height"
Gnosis.L["OptHideAddonMsgs"] = "Hide Gnosis text messages"
Gnosis.L["OptHideBlizzCB"] = "Hide Blizzard's castbar"
Gnosis.L["OptHidecasttime"] = "Hide casttime left"
Gnosis.L["OptHidecasttimeTotal"] = "Hide casttime total"
Gnosis.L["OptHideMirrorCB"] = "Hide Blizzard's mirror castbar"
Gnosis.L["OptHidePetCB"] = "Hide Blizzard's pet/vehicle castbar"
Gnosis.L["OptHidepushbackTime"] = "Hide pushback time"
Gnosis.L["OptLocale"] = "Select localization"
Gnosis.L["OptMergetradeskillDesc"] = "Merge tradeskill (player castbar only)."
Gnosis.L["OptMergetradeskillName"] = "Merge tradeskill"
Gnosis.L["OptMusic"] = "Music"
Gnosis.L["OptNameFormatStringDesc"] = [=[Enter string to show as name

name: spellname
abbr<cnt>: abbreviated spellname if longer than cnt, otherwise same as name
rank<text>: show text if rank available
misc: show miscellaneous info if non rank
arabic: rank as arabic numeral (e.g. 13)
roman: rank as roman numeral (e.g. XIII)
txr<text>: show text if rank info available
txm<text>: show text if misc info available
target: show target name if available (player only)
tar<text>: show text if target information avaiable (player only)
who: show name of casting unit

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one

tscur: show remaining tradeskill item count
tstot: show total tradeskill item count
txts<text>: show text if tradeskill information available

\n: force new line]=]
Gnosis.L["OptNameFormatStringName"] = "Name format string"
Gnosis.L["OptNameFormatToggleDesc"] = "If enabled 'Show cast name' and 'Show cast rank' selections ignored."
Gnosis.L["OptNameFormatToggleName"] = "Enable name format string"
Gnosis.L["OptOutputString"] = "Output string"
Gnosis.L["OptOutputStringDesc"] = [=[Enter string to show as combat text output

spellname: name of channeled spell
dmg: amount of dmg or heal done by channel
eh: effective heal (= heal-overheal)
dps: dps or hps of channel
target: target name of channel
clipped: information whether unintentional clip occured
cliptext<your text>: text string that replaces clipped if needed

hits: number of hits
crits: number of crits
ticks: number of ticks
tickscrits: outputs number of ticks and crits

above use following identifiers which are added to the displayed numbers
hittext<your text>: identifier for hits
crittext<your text>: identifier for crits
ticktext<your text>: identifier for ticks

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one]=]
Gnosis.L["OptPlayMusic"] = "Play music file"
Gnosis.L["OptPlaySnd"] = "Play sound"
Gnosis.L["OptPMoC"] = "Play music on clip"
Gnosis.L["OptPSoC"] = "Play sound on clip"
Gnosis.L["OptResetPlayerData"] = "Reset player data (reloads interface)"
Gnosis.L["OptSaveconfigExists"] = "configuration already exists, please delete first or change name"
Gnosis.L["OptSaveconfigInvalidName"] = "no configuration name given"
Gnosis.L["OptShowasminutesDesc"] = "Show minutes instead of seconds if longer than than 60s."
Gnosis.L["OptShowasminutesName"] = "Show minutes"
Gnosis.L["OptShowCastNameDesc"] = "Option not used if name format string enabled."
Gnosis.L["OptShowCastNameName"] = "Show cast name"
Gnosis.L["OptShowCastRankDesc"] = "Option not used if name format string enabled."
Gnosis.L["OptShowCastRankName"] = "Show cast rank"
Gnosis.L["OptShowPlayerLatency"] = "Show player latency (ms)"
Gnosis.L["OptShowSpellIcon"] = "Show spell icon"
Gnosis.L["OptSnd"] = "Sound"
Gnosis.L["OptSpellIsAoE"] = "Spell hits multiple mobs"
Gnosis.L["OptSpellNameOrId"] = "Spellname or Spell ID"
Gnosis.L["OptStickyClips"] = "Sticky clips"
Gnosis.L["OptStrGapDesc"] = "Minimal gap between castname and time strings (to decide whether to resize long string)."
Gnosis.L["OptStrGapName"] = "Gap (name...time)"
Gnosis.L["OptTicksToShow"] = "Ticks to show"
Gnosis.L["OptTimeFormatStringDesc"] = [=[Enter string to show as time

r<x>: remaining time in seconds with x decimals
t<x>: total time in seconds with x decimals
p<x>: pushback time in seconds with x decimals
c<x>: total-remaining => counting towards total

add s for sing or m for displaying time > 60s in minutes
e.g. r<1m> or p<2s>

col<r,g,b[,a]>: e.g. col<1.0,1.0,0.0> to change color
col<school>: where school is shadow,arcane...
col<pre>: change color to previous one

\n: force new line

remark: use col<r,g,b> to change color of spell pushback if needed]=]
Gnosis.L["OptTimeFormatStringName"] = "Time format string"
Gnosis.L["OptTimeFormatToggleDesc"] = "If enabled all other time formatting options are ignored."
Gnosis.L["OptTimeFormatToggleName"] = "Enable time format string"
Gnosis.L["OptTotTicks"] = "Total ticks"
Gnosis.L["OptWfCL_Desc"] = "Delay output/clip test after output/clip test request for given time in ms to account for possible combat log delay."
Gnosis.L["OptWfCL_Name"] = "Wait for combat log [ms]"
Gnosis.L["OptWidth"] = "Width"
Gnosis.L["Strata_BACK"] = "Lowest"
Gnosis.L["Strata_DIALOG"] = "Highest"
Gnosis.L["Strata_HIGH"] = "High"
Gnosis.L["Strata_LOW"] = "Low"
Gnosis.L["Strata_MEDIUM"] = "Medium"
Gnosis.L["TabAdaptToCT"] = "Adapt to casttype"
Gnosis.L["TabCapCENTER"] = "CENTER"
Gnosis.L["TabCapLEFT"] = "LEFT"
Gnosis.L["TabCapNONE"] = "NONE"
Gnosis.L["TabCapRIGHT"] = "RIGHT"
Gnosis.L["TabCastbars"] = "Castbars"
Gnosis.L["TabChanneledSpells"] = "Channeled Spells"
Gnosis.L["TabConfig"] = "Configurations"
Gnosis.L["TabCTClipTest"] = "Combattext/Cliptest"
Gnosis.L["TabFreeAlign"] = "Free alignment"
Gnosis.L["TabNameTime"] = "Name...Time"
Gnosis.L["TabTimeName"] = "Time...Name"
Gnosis.L["Vertical"] = "Vertical"

end
end
