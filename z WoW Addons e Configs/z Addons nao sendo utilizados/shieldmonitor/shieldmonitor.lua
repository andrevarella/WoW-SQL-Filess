local shieldmonitor_debugmsgs=false; -- switch to enable/disable debug messages
local shieldmonitor_MyGUID=0;
local shieldmonitor_myclass="";
local shieldpower = {} ; -- table for shield power cache -- REDUNDANT since 1.8.2
local shieldstore = {} ; -- where we store active shield info
local shieldmonitor_lastcritheal=0;
local shieldmonitor_elapsed =0;
local shieldstore_slotmax = 7;
local shieldmonitor_slotdisplayed=nil;
local shieldmonitor_enabled=true;
local shieldmonitor_timewarn=false;
local shieldmonitor_optionsedited=false;
local shieldmonitor_donetalentcheck=false;

local shieldmonitor_localeloaded = false;

-- all entries below need localisation

local SHIELDMONITOR_PWS = 'Power Word: Shield';
local SHIELDMONITOR_DA = 'Divine Aegis';
local SHIELDMONITOR_IB = 'Ice Barrier';


-- numbers in this table refers to the entry to use in the TIPREAD table and the spell bonus type to apply (if any)
-- slot is the priority of the shield to take damage, with 1 being the highest, school is only for mage ward/shadow ward and indicates it
-- can only absorb damage of the relevant schools. The tbx entries on PW:S are for the various talent boosts
-- r,g,b entries control the status bar colour and icon is of course then name of the icon to display.


local   SHIELDMONITOR_SPELLS = {
   -- priest
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Mana Shield']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
--    ['Fire Ward']={tip=1,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
--    ['Frost Ward']={tip=1,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    ['Mage Ward']={tip=3,slot=4,school=84,icon='Spell_Fire_TwilightFireWard',r=.9,g=.5,b=1},
    -- school for mage ward is 4:fire + 16:frost + 64:arcane = 84
    -- warlock
    ['Sacrifice']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['Shadow Ward']={tip=1,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Sacred Shield']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    ['Guarded by the Light']={tip=1,bonus=2,slot=2,icon='Ability_Paladin_GuardedbytheLight',r=.8,g=.5,b=.2},
    -- herbalist
   ['Fel Blossom']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  

-- what line and pattern we need to extract the shield's maximum damage absorbion from the tooltip
local   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="[aA]bsorb%a* (%d+) [^d]?%a*%s?damage" },   -- all spells use line 4, and (for English at least, this pattern)
   [2]= { line="3",pattern="Absorbs %d+ to (%d+) damage" }, -- only used by Fel Blossom, we take the most optimistic value for the shield
   [3]= { line="4",pattern="[aA]bsorb%a* (%d+) Fire, Frost or Arcane damage" }   -- Mage Ward uses different wording added in its own filter
};

local   SHIELDMONITOR_LOCKTXT = "Lock Window";
local   SHIELDMONITOR_UNLOCKTXT = "Unlock Window";
local   SHIELDMONITOR_USAGE = "unrecognised slash command. Valid commands are:\n/shieldmonitor options - access the options screen\n/shieldmonitor scale <num> - to scale the shieldmonitor frame (0.3 to 3)\n/shieldmonitor disable - to temporarily disable Shieldmonitor\n/shieldmonitor enable - to re-enable shieldmonitor\n(/sm can be used instead of /shieldmonitor)";
local   SHIELDMONITOR_ENABLED = "has been re-enabled.";
local   SHIELDMONITOR_DISABLED = "has been disabled for the rest of this session.\nUse /shieldmonitor enable - to re-enable shieldmonitor";
local   SHIELDMONITOR_DISABLEMNU = "Disable";
local   SHIELDMONITOR_BADSCALE = "scale out of range. Must be between 0.3 and 3";
local   SHIELDMONITOR_SETSCALE = "scale set to ";
local   SHIELDMONITOR_INIT = " active. Use '/shieldmonitor (or /sm) options' to configure";
local   SHIELDMONITOR_OPTIONMNU = "Options";
local   SHIELDMONITOR_BADTIME = "warning time out of range, must be between 2 and 10";
local   SHIELDMONITOR_BADPCT = "warning percent out of range, must be between 1 and 51";
local   SHIELDMONITOR_OPTTITLE = "Shieldmonitor Options";
local   SHIELDMONITOR_OPTTEXT1 = "Uncheck to disable Shieldmonitor (session setting only)";
local   SHIELDMONITOR_OPTTEXT2 = "Lock Window";
local   SHIELDMONITOR_OPTTEXT3 = "Enable warning if seconds on shield less than";
local   SHIELDMONITOR_OPTTEXT4 = "Enable warning if percent on shield less than";
local   SHIELDMONITOR_OPTTEXT5 = "Flash border on warnings";
local   SHIELDMONITOR_OPTTEXT6 = "Set window scale";
local   SHIELDMONITOR_OPTSMALL = "small";
local   SHIELDMONITOR_OPTBIG = "big";

local mylocale = GetLocale();

if (mylocale == "enUS") then

   shieldmonitor_localeloaded = true;

elseif (mylocale == "deDE") then   -- add extra locales like this

-- the 'local' keyword should not be used here as the variables are already declared above, they are just getting new values

    SHIELDMONITOR_PWS = 'Machtwort: Schild';
    SHIELDMONITOR_DA = 'G\195\182ttliche Aegis';
    SHIELDMONITOR_IB = 'Eisbarriere';

    SHIELDMONITOR_SPELLS = {
   -- priest
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Manaschild']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['Feuerzauberschutz']={tip=3,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
    ['Frostzauberschutz']={tip=4,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    -- warlock
    ['Opferung']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['Schattenzauberschutz']={tip=5,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Geheiligter Schild']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
    ['Teufelsbl\195\188te']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  

   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern=" (%d+) Schaden" },
   [2]= { line="3",pattern="bis (%d+) Schaden" },
   [3]= { line="4",pattern=" (%d+) Feuerschaden" },
   [4]= { line="4",pattern=" (%d+) Frostschaden" },
   [5]= { line="4",pattern=" (%d+) Schattenschaden" }
};


   SHIELDMONITOR_LOCKTXT = "Fenster festsetzen";
   SHIELDMONITOR_UNLOCKTXT = "Fenster freigeben";
   SHIELDMONITOR_USAGE = "Unbekanntes Slash Kommando. G\195\188ltige Kommandos sind:\n/shieldmonitor options - Ruft das Optionen-Fenster auf\n/shieldmonitor scale <num> - um das Fenster zu skalieren (O.3 bis 3)\n/shieldmonitor disable - um Shieldmonitor vor\195\188bergehend zu deaktivieren\n/shieldmonitor enable - um Shieldmonitor zu reaktivieren\n(anstatt /shieldmonitor kann auch einfach /sm benutzt werden)";
   SHIELDMONITOR_ENABLED = "wurde reaktiviert.";
   SHIELDMONITOR_DISABLED = "wurde f\195\188r den Rest der Sitzung deaktiviert.\nBenutze /shieldmonitor enable - um Shieldmonitor zu reaktivieren";
   SHIELDMONITOR_DISABLEMNU = "Deaktivieren";
   SHIELDMONITOR_BADSCALE = "Skalierung au\195\159erhalb des zul\195\164ssigen Bereichs. Muss zwischen O.3 und 3 liegen";
   SHIELDMONITOR_SETSCALE = "Skalierung gesetzt auf ";
   SHIELDMONITOR_INIT = " aktiv. Benutze '/shieldmonitor options' zur Konfiguration";
   SHIELDMONITOR_OPTIONMNU = "Optionen";
   SHIELDMONITOR_BADTIME = "Zeitwarnung au\195\159erhalb des g\195\188ltigen Bereichs, muss zwischen 2 und 10 liegen";
   SHIELDMONITOR_BADPCT = "Prozentwarnung au\195\159erhalb des g\195\188ltigen Bereichs, muss zwischen 1 und 51 liegen";
   SHIELDMONITOR_OPTTITLE = "Shieldmonitor Optionen";
   SHIELDMONITOR_OPTTEXT1 = "Shieldmonitor aktivieren (Sitzungseinstellung)";
   SHIELDMONITOR_OPTTEXT2 = "Fenster fixieren";
   SHIELDMONITOR_OPTTEXT3 = "Warnen, wenn Schilddauer kleiner wird als";
   SHIELDMONITOR_OPTTEXT4 = "Warnen, ab Schildhaltbarkeit % unter";
   SHIELDMONITOR_OPTTEXT5 = "Blinken bei Warnungen";
   SHIELDMONITOR_OPTTEXT6 = "Fensterskalierung";
   SHIELDMONITOR_OPTSMALL = "klein";
   SHIELDMONITOR_OPTBIG = "gro\195\159";


-- localisation must end with the line
   shieldmonitor_localeloaded = true;

elseif (mylocale == "koKR") then 

 SHIELDMONITOR_PWS = '신의 권능: 보호막';
 SHIELDMONITOR_DA = '신의 보호';
 SHIELDMONITOR_IB = '얼음 보호막';

   SHIELDMONITOR_SPELLS = {
     -- 사제
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- 마법사
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['마나 보호막']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['화염계 수호']={tip=2,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
    ['냉기계 수호']={tip=3,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    -- 흑마법사
    ['희생']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['암흑계 수호']={tip=4,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    -- 성기사
    ['성스러운 보호막']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- 연금술사
    ['지옥꽃']={tip=5,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};


   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="(%d+)의 피해를 흡수" },
   [2]= { line="4",pattern="(%d+)의 화염 피해를 흡수합니다." },
   [3]= { line="4",pattern="(%d+)의 냉기 피해를 흡수합니다." },
   [4]= { line="4",pattern="(%d+)의 암흑 피해를 흡수합니다." },
   [5]= { line="3",pattern="%d+~(%d+)의 피해를 흡수" },
};


   SHIELDMONITOR_LOCKTXT = "잠금";
   SHIELDMONITOR_UNLOCKTXT = "풀림";
   SHIELDMONITOR_USAGE = "잘못된 명령어입니다. 사용법:\n/sm options - 메뉴창 부르기\n/sm scale 숫자 - 크기 변경 숫자는 0.3 ~ 3\n/sm disable - 사용중지\n/shieldmonitor enable - 사용";
   SHIELDMONITOR_ENABLED = "다시 활성화 되었습니다.";
   SHIELDMONITOR_DISABLED = "사용이 중지되었습니다. \n'/sm enable' 로 다시 사용할 수 있습니다.";
   SHIELDMONITOR_DISABLEMNU = "사용안함";
   SHIELDMONITOR_BADSCALE = "크기 값은 0.3 ~ 3 범위내에서 가능합니다.";
   SHIELDMONITOR_SETSCALE = "크기 변경 => ";
   SHIELDMONITOR_INIT = " 활성화. 메뉴는 '/sm options' 명령어를 입력하세요. 인터페이스 설정창에서도 설정가능";
   SHIELDMONITOR_OPTIONMNU = "옵션";
   SHIELDMONITOR_BADTIME = "지정 가능한 시간(초)은 2 ~ 10 범위 입니다.";
   SHIELDMONITOR_BADPCT = "지정 가능한 퍼센트 수치는 1 ~ 51 범위입니다.";
   SHIELDMONITOR_OPTTITLE = "Shieldmonitor 옵션";
   SHIELDMONITOR_OPTTEXT1 = "사용";
   SHIELDMONITOR_OPTTEXT2 = "잠금";
   SHIELDMONITOR_OPTTEXT3 = "설정 지속시간 이하에서 경보 활성화: 설정(초) ";
   SHIELDMONITOR_OPTTEXT4 = "설정 퍼센트 이하에서 경보 활성화: 설정(%)  ";
   SHIELDMONITOR_OPTTEXT5 = "경보시 테두리 플래쉬 효과";
   SHIELDMONITOR_OPTTEXT6 = "크기 설정";
   SHIELDMONITOR_OPTSMALL = "작게";
   SHIELDMONITOR_OPTBIG = "크게";

   shieldmonitor_localeloaded = true;

elseif (mylocale == "zhTW") then 
    
  SHIELDMONITOR_PWS = '真言術:盾';
	SHIELDMONITOR_DA = '神禦之盾';
  SHIELDMONITOR_IB = '寒冰護體';

	SHIELDMONITOR_SPELLS = {
	   -- priest
	    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
	    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
	     -- mage
	    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
	    ['法力護盾']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
	    ['防護火焰結界']={tip=1,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
	    ['防護冰霜結界']={tip=1,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
	    -- warlock
	    ['犧牲']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
	    ['防護暗影結界']={tip=1,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Sacred Shield']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
	    -- herbalist
	   ['魔獄樹花']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
	};  

	-- what line and pattern we need to extract the shield's maximum damage absorbion from the tooltip
	SHIELDMONITOR_TIPREAD = {
	   [1]= { line="4",pattern="吸收(%d+)點(.*)傷害" },   -- all spells use line 4, and (for English at least, this pattern)
	   [2]= { line="3",pattern="吸收%d+至(%d+)點傷害"} -- only used by Fel Blossom, we take the most optimistic value for the shield
	};

	SHIELDMONITOR_LOCKTXT = "鎖定視窗";
	SHIELDMONITOR_UNLOCKTXT = "解鎖視窗";
	SHIELDMONITOR_USAGE = "無法識別的指令。正確的指令應該是：\n/shieldmonitor options - 開啟選項視窗。\n/shieldmonitor scale <num> - 調整 Shieldmoniter 框架大小 (0.3 - 3)\n/shieldmonitor disable - 暫時關閉 Shieldmonitor\n/shieldmonitor enable - 重新啟用 shieldmonitor\n(使用 /sm 可以取代 /shieldmonitor)";
	SHIELDMONITOR_ENABLED = "已重新啟用。";
	SHIELDMONITOR_DISABLED = "此執行階段已停用。\n輸入 /shieldmonitor enable - 重新啟用。";
	SHIELDMONITOR_DISABLEMNU = "停用";
	SHIELDMONITOR_BADSCALE = "大小已超出範圍。必須介於 0.3 - 3 之間。";
	SHIELDMONITOR_SETSCALE = "大小設定為 ";
	SHIELDMONITOR_INIT = " 已啟動。輸入 '/shieldmonitor (或 /sm) options' 進行設定。";
	SHIELDMONITOR_OPTIONMNU = "選項";
	SHIELDMONITOR_BADTIME = "警告的時間超出範圍，必須介於 2 - 10 之間。";
	SHIELDMONITOR_BADPCT = "警告的百分比超出範圍，必須介於 1 - 51 之間。";
	SHIELDMONITOR_OPTTITLE = "Shieldmonitor 選項";
	SHIELDMONITOR_OPTTEXT1 = "未選取則停用 Shieldmonitor (僅設定於此階段)";
	SHIELDMONITOR_OPTTEXT2 = "鎖定視窗";
	SHIELDMONITOR_OPTTEXT3 = "如果護盾少於？秒，啟用警告。";
	SHIELDMONITOR_OPTTEXT4 = "如果護頓少於？百分比，啟用警告。";
	SHIELDMONITOR_OPTTEXT5 = "警告時閃動邊框";
	SHIELDMONITOR_OPTTEXT6 = "設定視窗大小";
	SHIELDMONITOR_OPTSMALL = "小";
	SHIELDMONITOR_OPTBIG = "大";

   shieldmonitor_localeloaded = true;

elseif (mylocale == "zhCN") then

	SHIELDMONITOR_PWS = '真言术：盾';
	SHIELDMONITOR_DA = '神圣庇护';
	SHIELDMONITOR_IB = '寒冰护体';

    SHIELDMONITOR_SPELLS = {
   -- priest
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['法力护盾']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['防护火焰结界']={tip=3,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
    ['冰霜防护结界']={tip=4,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    -- warlock
    ['牺牲']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['暗影防护结界']={tip=5,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['圣洁之盾']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
    ['野魔花']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};

   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="吸收%a+ (%d+) [^d]?%a*%s?伤害" },   -- all spells use line 4, and (for English at least, this pattern)
   [2]= { line="3",pattern="吸收 %d+ 到 (%d+) 点伤害" } -- only used by Fel Blossom, we take the most optimistic value for the shield
};


   SHIELDMONITOR_LOCKTXT = "锁定窗口";
   SHIELDMONITOR_UNLOCKTXT = "解除窗口锁定";
   SHIELDMONITOR_USAGE = "不能识别的命令。正确的命令是：\n/shieldmonitor options - 进入选项窗口\n/shieldmonitor scale <num> - 对护盾监视器窗口缩放设定 (O.3 到 3)\n/shieldmonitor disable - 临时禁用护盾监视器\n/shieldmonitor enable - 重新启用护盾监视器\n(可以输入 /sm 代替/shieldmonitor)";
   SHIELDMONITOR_ENABLED = "已经重新启用";
   SHIELDMONITOR_DISABLED = "已经在此次登陆停用\n输入 /shieldmonitor enable - 来重新启用插件";
   SHIELDMONITOR_DISABLEMNU = "停用";
   SHIELDMONITOR_BADSCALE = "窗口缩放超出范围。必须介于 0.3 到 3 之间";
   SHIELDMONITOR_SETSCALE = "窗口缩放设定为";
   SHIELDMONITOR_INIT = " 激活。使用'/shieldmonitor (或者 /sm) options'来进行配置";
   SHIELDMONITOR_OPTIONMNU = "选项";
   SHIELDMONITOR_BADTIME = "所设定的警告时的护盾剩余时间超出范围, 必须介于2到10之间";
   SHIELDMONITOR_BADPCT = "所设定的警告时的护盾剩余百分比超出范围, 必须介于1到51之间";
   SHIELDMONITOR_OPTTITLE = "护盾监视器选项";
   SHIELDMONITOR_OPTTEXT1 = "取消禁用护盾监视器（仅对此次登陆有效）";
   SHIELDMONITOR_OPTTEXT2 = "锁定窗口";
   SHIELDMONITOR_OPTTEXT3 = "将提出警告在护盾剩余时间少于";
   SHIELDMONITOR_OPTTEXT4 = "将提出警告在护盾剩余比例少于";
   SHIELDMONITOR_OPTTEXT5 = "在警告的时候边框闪烁";
   SHIELDMONITOR_OPTTEXT6 = "设定窗口大小";
   SHIELDMONITOR_OPTSMALL = "小";
   SHIELDMONITOR_OPTBIG = "大";

   shieldmonitor_localeloaded = true;
   
elseif (mylocale == "ruRU") then

    SHIELDMONITOR_PWS = 'Слово силы: Щит';
    SHIELDMONITOR_DA = 'Божественнное покровительство';
    SHIELDMONITOR_IB = 'Ледяная преграда';

    SHIELDMONITOR_SPELLS = {
   -- priest
    [SHIELDMONITOR_PWS]={tip=3,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Щит маны']={tip=2,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
--    ['Защита от огня']={tip=2,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
--    ['Защита от магии льда']={tip=2,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    ['Магическая защита']={tip=2,slot=4,school=84,icon='Spell_Fire_TwilightFireWard',r=.9,g=.5,b=1},
    -- warlock
    ['Жертвоприношение']={tip=2,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['Защита от темной магии']={tip=2,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Священный щит']={tip=4,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
   ['Скверноцвет']={tip=5,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  

    SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="поглощающий (%d+) ед. урона" },
   [2]= { line="4",pattern="[Пп]оглощает (%d+) ед. урона" },
   [3]= { line="4",pattern="поглотить (%d+) ед. урона" },
   [4]= { line="4",pattern="поглощающим (%d+) ед. урона" },
   [5]= { line="3",pattern="Поглощение %d+ - (%d+) ед. урона" }
};

    SHIELDMONITOR_LOCKTXT = "Закрепить SM";
    SHIELDMONITOR_UNLOCKTXT = "Разблокировать";
    SHIELDMONITOR_USAGE = "нераспознаная команда. Допустимые значения:\n/shieldmonitor options - открыть экран настроек\n/shieldmonitor scale <num> - изменение размера фрейма shieldmonitor (от 0.3 до 3)\n/shieldmonitor disable - временно выключить Shieldmonitor\n/shieldmonitor enable - включить shieldmonitor\n(вместо /shieldmonitor можно использовать /sm)";
    SHIELDMONITOR_ENABLED = "включен.";
    SHIELDMONITOR_DISABLED = "временно выключен.\nИспользуйты /shieldmonitor enable - для включения shieldmonitor";
    SHIELDMONITOR_DISABLEMNU = "Выключить";
    SHIELDMONITOR_BADSCALE = "Недопустимый размер. Значение должно быть между 0.3 и 3";
    SHIELDMONITOR_SETSCALE = "установлен размер ";
    SHIELDMONITOR_INIT = " включен. Используйте '/shieldmonitor (или /sm) options' для настройки";
    SHIELDMONITOR_OPTIONMNU = "Настройки";
    SHIELDMONITOR_BADTIME = "Внимание недопустимое значение времени, должно быть между 2 и 10";
    SHIELDMONITOR_BADPCT = "Внимание недопустимое значение процент, должно быть между 1 и 51";
    SHIELDMONITOR_OPTTITLE = "Настройки Shieldmonitor";
    SHIELDMONITOR_OPTTEXT1 = "Выключение Shieldmonitor (только для данной сессии)";
    SHIELDMONITOR_OPTTEXT2 = "Закрепить SM";
    SHIELDMONITOR_OPTTEXT3 = "Предупр. если времени действия щита менее";
    SHIELDMONITOR_OPTTEXT4 = "Предупреждать если процент щита менее";
    SHIELDMONITOR_OPTTEXT5 = "Мигание границ при предупреджении";
    SHIELDMONITOR_OPTTEXT6 = "              Размер фрейма";
    SHIELDMONITOR_OPTSMALL = "меньше";
    SHIELDMONITOR_OPTBIG = "больше";


   shieldmonitor_localeloaded = true;

elseif (mylocale == "frFR") then

 SHIELDMONITOR_PWS = 'Mot de pouvoir : Bouclier';
 SHIELDMONITOR_DA = 'Egide divine';
 SHIELDMONITOR_IB = 'Barri\195\168re de glace';

   SHIELDMONITOR_SPELLS = {
     --priest
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Bouclier de mana']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['Gardien du mage']={tip=3,slot=4,school=84,icon='Spell_Fire_TwilightFireWard',r=.9,g=.5,b=1},
    -- warlock
    ['Sacrifice']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ["Gardien de l'ombre"]={tip=1,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Bouclier saint']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
    ['Gangrelys']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  

   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="[aA]bsorb%a* (%d+) points de d\195\169g\195\162ts" },   
   [2]= { line="3",pattern="Absorbe %d+ \195\160 (%d+) points de d\195\169g\195\162ts" },
   [3]= { line="4",pattern="Absorbe (%d+) points de d\195\169g\195\162ts de Feu, de Givre ou des Arcanes" } 
};

   SHIELDMONITOR_LOCKTXT = "V\195\169rouiller la fen\195\170tre";
   SHIELDMONITOR_UNLOCKTXT = "D\195\169verouiller la fen\195\170tre";
   SHIELDMONITOR_USAGE = "Commande non reconnue. Les commandes sont:\n/shieldmonitor options - afficher les options\n/shieldmonitor scale <num> - redimensionner ShieldMonitor (de 0.3 \195\160 3)\n/shieldmonitor disable - D\195\169sactiver temporairement ShieldMonitor\n/shieldmonitor enable - R\195\169activer ShieldMonitor\n(vous pouvez utiliser /sm au lieu de /shieldmonitor)";
   SHIELDMONITOR_ENABLED = "a \195\169t\195\169 r\195\169activ\195\169.";
   SHIELDMONITOR_DISABLED = "a \195\169t\195\169 d\195\169sactiv\195\169 pour la dur\195\169e de cette session.\nTapez /shieldmonitor enable - pour r\195\169activer ShieldMonitor";
   SHIELDMONITOR_DISABLEMNU = "D\195\169sactiver";
   SHIELDMONITOR_BADSCALE = "taille hors limite. Doit \195\170tre compris entre 0.3 et 3";
   SHIELDMONITOR_SETSCALE = "taille r\195\169gl\195\169e \195\160 ";
   SHIELDMONITOR_INIT = " actif. Tapez '/shieldmonitor (ou /sm) options' pour le configurer";
   SHIELDMONITOR_OPTIONMNU = "Options";
   SHIELDMONITOR_BADTIME = "attention temps hors limite, doit \195\170tre compris entre 2 et 10";
   SHIELDMONITOR_BADPCT = "attention pourcentage hors limite, doit \195\170tre compris entre 1 et 51";
   SHIELDMONITOR_OPTTITLE = "ShieldMonitor Options";
   SHIELDMONITOR_OPTTEXT1 = "D\195\169cochez pour d\195\169sactiver (pour cette session uniquement)";
   SHIELDMONITOR_OPTTEXT2 = "V\195\169rouiller la fen\195\170tre";
   SHIELDMONITOR_OPTTEXT3 = "Avertir si temps restant inf\195\169rieur \195\160";
   SHIELDMONITOR_OPTTEXT4 = "Avertir si pourcentage restant inf\195\169rieur \195\160";
   SHIELDMONITOR_OPTTEXT5 = "Flash de la bordure pour avertir";
   SHIELDMONITOR_OPTTEXT6 = "R\195\169gler la taille de la fen\195\170tre";
   SHIELDMONITOR_OPTSMALL = "petit";
   SHIELDMONITOR_OPTBIG = "grand";

   shieldmonitor_localeloaded = true;

elseif (mylocale == "esES") then
 
 SHIELDMONITOR_PWS = 'Palabra de poder: Escudo';
 SHIELDMONITOR_DA = '\195\137gida divina';
 SHIELDMONITOR_IB = 'Barrera de hielo';
 
   SHIELDMONITOR_SPELLS = {
     --priest
    [SHIELDMONITOR_PWS]={tip=1,bonus=2,slot=5,icon='Spell_Holy_PowerWordShield',r=.7,g=.7,b=.3,tb={[1]=0,[2]=0,[3]=0}},
    [SHIELDMONITOR_DA]={slot=3,icon='Spell_Holy_DevineAegis',r=.7,g=.7,b=.6,tb={[3]=0}},
     -- mage
    [SHIELDMONITOR_IB]={tip=1,bonus=5,slot=2,icon='Spell_Ice_Lament',r=0,g=.75,b=.75,gb=0},
    ['Escudo de man\195\161']={tip=1,bonus=7,slot=6,icon='Spell_Shadow_DetectLesserInvisibility',r=.9,g=0,b=.9},
    ['Resguardo contra el Fuego']={tip=1,bonus=3,slot=4,school=4,icon='Spell_Fire_FireArmor',r=.9,g=0,b=0},
    ['Resguardo contra la Escarcha']={tip=1,bonus=5,slot=4,school=16,icon='Spell_Frost_FrostWard',r=.5,g=.5,b=1},
    -- warlock
    ['Sacrificio']={tip=1,slot=2,icon='Spell_Shadow_SacrificialShield',r=.5,g=.5,b=0},
    ['Resguardo contra las Sombras']={tip=1,bonus=6,slot=4,school=32,icon='Spell_Shadow_AntiShadow',r=.6,g=0,b=.6},
    --paladin
    ['Escudo sacro']={tip=1,bonus=2,slot=1,icon='Ability_Paladin_BlessedMending',r=.8,g=.8,b=.2},
    -- herbalist
    ['Gangrelys']={tip=2,slot=3,icon='INV_Misc_Herb_Felblossom',r=0,g=.5,b=0}
};  
 
   SHIELDMONITOR_TIPREAD = {
   [1]= { line="4",pattern="[aA]mortigu%a* (%d+) p. de da\195\177o" },   
   [2]= { line="3",pattern="Amortigua (%d+) p. de da\195\177o" } 
};
 
	SHIELDMONITOR_LOCKTXT = "Bloquear la ventana";
	SHIELDMONITOR_UNLOCKTXT = "Desbloquear la ventana";
	SHIELDMONITOR_USAGE = "Comando desconocido. Los comando v\195\161lidos son:\n/shieldmonitor options - access the options screen\n/shieldmonitor scale <num> - to scale the shieldmonitor frame (0.3 to 3)\n/shieldmonitor disable - to temporarily disable Shieldmonitor\n/shieldmonitor enable - to re-enable shieldmonitor\n(/sm can be used instead of /shieldmonitor)";
	SHIELDMONITOR_ENABLED = "se ha reactivado.";
	SHIELDMONITOR_DISABLED = "se ha desactivado para el resto de la sesi\195\179n.\nUse /shieldmonitor enable - to re-enable shieldmonitor";
	SHIELDMONITOR_DISABLEMNU = "Desactivar";
	SHIELDMONITOR_BADSCALE = "tama\195\177o fuera de rango. Debe estar entre 0.3 y 3";
	SHIELDMONITOR_SETSCALE = "scale set to ";
	SHIELDMONITOR_INIT = " activo. Usa '/shieldmonitor (or /sm) options' para abrir la configuraci\195\179n";
	SHIELDMONITOR_OPTIONMNU = "Opciones";
	SHIELDMONITOR_BADTIME = "Tiempo de aviso fuera de rango, debe estar entre 2 y 10";
	SHIELDMONITOR_BADPCT = "Porcentaje de aviso fuera de rango, debe estar entre 1 y 51";
	SHIELDMONITOR_OPTTITLE = "Shieldmonitor Options";
	SHIELDMONITOR_OPTTEXT1 = "Desmarca la casilla para desactivar Shieldmonitor";
	SHIELDMONITOR_OPTTEXT2 = "Bloquear la ventana";
	SHIELDMONITOR_OPTTEXT3 = "Activar aviso si el tiempo de escudo es menos de";
	SHIELDMONITOR_OPTTEXT4 = "Activar aviso si el porcentaje de escudo es menos de";
	SHIELDMONITOR_OPTTEXT5 = "Borde centelleante en los avisos";
	SHIELDMONITOR_OPTTEXT6 = "Cambiar el tama\195\177o de la ventana";
	SHIELDMONITOR_OPTSMALL = "peque\195\177o";
	SHIELDMONITOR_OPTBIG = "grande";
 
   shieldmonitor_localeloaded = true;
   
end



function shieldmonitor_optionsOnLoad(panel)
panel.name ="Shieldmonitor v".. GetAddOnMetadata("shieldmonitor", "Version"); 
panel.okay = shieldmonitor_optionsokay;
panel.cancel = shieldmonitor_optionscancel;
InterfaceOptions_AddCategory(panel);
  shieldmonitor_optionsFrameScale:SetMinMaxValues(-1,1);
  shieldmonitor_optionsFrameScale:SetValueStep(0.1);
  shieldmonitor_optionsFrameScaleLow:SetText(SHIELDMONITOR_OPTSMALL);
  shieldmonitor_optionsFrameScaleHigh:SetText(SHIELDMONITOR_OPTBIG);
  shieldmonitor_optionsFrameTitle:SetText(SHIELDMONITOR_OPTTITLE);
  shieldmonitor_optionsFrameOpttext1:SetText(SHIELDMONITOR_OPTTEXT1);
  shieldmonitor_optionsFrameOpttext2:SetText(SHIELDMONITOR_OPTTEXT2);
  shieldmonitor_optionsFrameOpttext3:SetText(SHIELDMONITOR_OPTTEXT3);
  shieldmonitor_optionsFrameOpttext4:SetText(SHIELDMONITOR_OPTTEXT4);
  shieldmonitor_optionsFrameOpttext5:SetText(SHIELDMONITOR_OPTTEXT5);
  shieldmonitor_optionsFrameOpttext6:SetText(SHIELDMONITOR_OPTTEXT6);

end

function shieldmonitor_optionsokay()
if (shieldmonitor_optionsedited) then
  shieldmonitor_debug("okay pressed, options may have changed");
  shieldmonitor_setscale(exp(floor(shieldmonitor_optionsFrameScale:GetValue()*10+.5)/10));
  Shieldmonitor_Options["Lock"]=(shieldmonitor_optionsFrameLock:GetChecked()==1);
  Shieldmonitor_Options["enabletimewarn"]=(shieldmonitor_optionsFrameEnableTime:GetChecked()==1);
  Shieldmonitor_Options["enablepctwarn"]=(shieldmonitor_optionsFrameEnablePct:GetChecked()==1);
  Shieldmonitor_Options["flashborder"]=(shieldmonitor_optionsFrameFlashBorder:GetChecked()==1);
  local timetowarn=tonumber(shieldmonitor_optionsFrameTimetowarn:GetText());
  if (timetowarn > 0 and timetowarn < 11) then
     Shieldmonitor_Options["timetowarn"]=timetowarn;
  else
    shieldmonitor_print(SHIELDMONITOR_BADTIME);
  end   
  local pcttowarn=tonumber(shieldmonitor_optionsFramePcttowarn:GetText());
  if (pcttowarn > 0 and pcttowarn < 52) then
     Shieldmonitor_Options["pcttowarn"]=pcttowarn;
  else
    shieldmonitor_print(SHIELDMONITOR_BADPCT);
  end   
  local enabled=(shieldmonitor_optionsFrameEnable:GetChecked()==1);
  if (enabled ~= shieldmonitor_enabled) then
      if (enabled) then
        shieldmonitor_enable();
      else
        shieldmonitor_disable();
      end
  end
  shieldmonitor_optionsedited=false;
else
  shieldmonitor_debug("okay pressed, options unchanged");
end  
end

function shieldmonitor_optionscancel()
shieldmonitor_debug("cancel pressed on the options screen");
shieldmonitor_optionsedited=false;
end


function shieldmonitor_showoptions(self)
if (Shieldmonitor_Options and not shieldmonitor_optionsedited) then
  shieldmonitor_debug("showing the options screen");
  shieldmonitor_optionsFrameEnable:SetChecked(shieldmonitor_enabled);
  shieldmonitor_optionsFrameLock:SetChecked(Shieldmonitor_Options["Lock"]);
  shieldmonitor_optionsFrameEnableTime:SetChecked(Shieldmonitor_Options["enabletimewarn"]);
  shieldmonitor_optionsFrameEnablePct:SetChecked(Shieldmonitor_Options["enablepctwarn"]);
  shieldmonitor_optionsFrameFlashBorder:SetChecked(Shieldmonitor_Options["flashborder"]);
  shieldmonitor_optionsFrameTimetowarn:SetText(tostring(Shieldmonitor_Options["timetowarn"]));
  shieldmonitor_optionsFramePcttowarn:SetText(tostring(Shieldmonitor_Options["pcttowarn"]));
  shieldmonitor_optionsFrameScale:SetValue(log(Shieldmonitor_Options["scale"]));
  shieldmonitor_optionsedited=true;
end
end



function shieldmonitor_InitDropDown()
	local info;
	local version = GetAddOnMetadata("shieldmonitor", "Version"); 
	info = {};
	info.text = "Shieldmonitor v"..version;
	info.justifyH = "CENTER";
	info.isTitle = 1;
	info.notCheckable = 1;
	UIDropDownMenu_AddButton(info);
	
	
	info = {};
	if ( Shieldmonitor_Options["Lock"] ) then
		info.text = SHIELDMONITOR_UNLOCKTXT;
	else
		info.text = SHIELDMONITOR_LOCKTXT;
	end
	info.value = "LockMeter";
	info.notCheckable = 1;
	info.func = shieldmonitor_lockmenu;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = SHIELDMONITOR_DISABLEMNU;
	info.value = "disable";
	info.notCheckable = 1;
	info.func = shieldmonitor_disable;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = SHIELDMONITOR_OPTIONMNU;
	info.value = "options";
	info.notCheckable = 1;
	info.func = function(self) InterfaceOptionsFrame_OpenToCategory(shieldmonitor_optionsFrame) end;
	UIDropDownMenu_AddButton(info);

end

function shieldmonitor_OnLoad(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    SLASH_SHIELDMONITOR1 = "/shieldmonitor";
    SLASH_SHIELDMONITOR2 = "/sm";
    SlashCmdList["SHIELDMONITOR"] = shieldmonitor_slashcmd;
end

function shieldmonitor_slashcmd(msg)
   local msgchan = 2;
   if (msg == nil) then
      return nil;
   end

  local _,_, command, com2 = string.find (msg, "^(%w+)%s*(.*)$");
  
  command=string.lower(tostring(command));
  if (command=="scale") then
        shieldmonitor_setscale(tonumber(com2),true);
     return;
  elseif (command=="options") then
     InterfaceOptionsFrame_OpenToCategory(shieldmonitor_optionsFrame);
     return;
  elseif (command=="disable") then
     shieldmonitor_disable();
     return;
  elseif (command=="enable") then
     shieldmonitor_enable();
     return;
  elseif (command=="dbg") then
     shieldmonitor_debugmsgs = not shieldmonitor_debugmsgs;
     shieldmonitor_print("debug "..tostring(shieldmonitor_debugmsgs));
     return;   	
  elseif (command=="mdchannel") then
     if (com2) then
        Shieldmonitor_Options["mdchannel"] = string.upper(tostring(com2));
     end   
     return;
      
  end	
  shieldmonitor_print(SHIELDMONITOR_USAGE);
end

function shieldmonitor_enable()
     if (not shieldmonitor_enabled) then
        shieldmonitor_Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
        shieldmonitor_enabled=true;
     end
     shieldmonitor_print(SHIELDMONITOR_ENABLED);
end

function shieldmonitor_disable()
  if (shieldmonitor_enabled) then
     shieldmonitor_Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
     shieldmonitor_slotdisplayed=nil;      
     shieldmonitor_Frame:Hide();
     shieldmonitor_enabled=false;
  end       
  shieldmonitor_print(SHIELDMONITOR_DISABLED);
end

function shieldmonitor_setscale(scale,confirm)
     if (not scale or scale <.3 or scale > 3) then
        shieldmonitor_print(SHIELDMONITOR_BADSCALE);
     else
        shieldmonitor_Frame:SetScale(scale);
        Shieldmonitor_Options["scale"]=scale;
        if (confirm) then
          shieldmonitor_print(SHIELDMONITOR_SETSCALE..tostring(scale));
        end  
     end      
end

function shieldmonitor_optionclick(item)
-- click on an option check button
shieldmonitor_debug("state is ".. tostring(item:GetChecked()));
end

function shieldmonitor_classinit(self)  

  if (not shieldmonitor_localeloaded) then
    shieldmonitor_print("does not currently support your locale: '"..mylocale.."', sorry.");
  else
    shieldmonitor_print("v"..GetAddOnMetadata("shieldmonitor", "Version")..SHIELDMONITOR_INIT);
    shieldmonitor_MyGUID=UnitGUID("player");
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
    self:RegisterEvent("PLAYER_LEVEL_UP");
    self:RegisterEvent("PLAYER_TALENT_UPDATE");
        self:RegisterEvent("LFG_UPDATE");
--    self:RegisterEvent("CHAT_MSG_ADDON");
    shieldmonitor_debug("guid is "..shieldmonitor_MyGUID);
    _,shieldmonitor_myclass=UnitClass("player");
  end   
end

function shieldmonitor_checktalents()
-- the 'broadcast' stuff in here is for a possible future feature when in party or raid. It is not yet implemented.

if (shieldmonitor_debugmsgs) then
  local numglyphs=GetNumGlyphSockets();
  shieldmonitor_debug("reported glyph slots: "..tostring(numglyphs)); 
 for i = 1, numglyphs do
    local enabled,_, glyphSpellID,_ = GetGlyphSocketInfo(i);
      shieldmonitor_debug("got glyph: "..tostring(glyphSpellID).. "(enabled: "..tostring(enabled)..")"); 
  end
end

if (shieldmonitor_myclass=="MAGE") then  -- check for Ice barrier glyph
  SHIELDMONITOR_SPELLS[SHIELDMONITOR_IB].gb = 1; -- 1= no glyph
  local numglyphs=GetNumGlyphSockets();
  for i = 1, numglyphs do
    local enabled,_, glyphSpellID,_ = GetGlyphSocketInfo(i);
    if ( enabled and glyphSpellID==63095) then
      SHIELDMONITOR_SPELLS[SHIELDMONITOR_IB].gb = 1.3;
    end
  end
end
shieldmonitor_donetalentcheck=true; 
end


function shieldmonitor_getbuffexpire(spellid) 

        local spellname,spellrank = GetSpellInfo(spellid);
        local expires =0;

        if (spellid==58597) then -- sigh another fix for there being two buffs called Sacred Shield... ffs Blizz!!!
           local shieldTex = 'Interface\\Icons\\Ability_Paladin_GaurdedbytheLight'
           for i=1,40 do
               local _,_,imsiIcon,_,_,_,imsiTime = UnitBuff("player",i)
               if shieldTex == imsiIcon then
                   expires = imsiTime
               break;
           end
        end
       else   
          _,_,_,_,_,_,expires = UnitBuff("player",spellname,spellrank);
      end
   return(expires);
end



function shieldmonitor_shieldup(spellid,spelldata,caster_GUID,strength)
shieldmonitor_debug("aura from spell "..tostring(spellid))
  if (spellid==53601) then  -- fix for Sacred shield spell and actual shield having same name.
     return
  end;

  if (strength ~= nil and strength > 0) then -- Blizz now provide the shield strength directly in the combat log for some spells
  -- HOWEVER they also now send a SPELL_AURA_REFRESH whenever one of these shields takes damage
  -- so what we'll do is check to see if the shield is already up and if the expiretime has changed
  -- another tiny problem, when they send the REFRESH they change the expire time by a tiny amount,
  -- so we can't test for equality but check if the difference is less than a second
      local slot=spelldata.slot;
      
     if (shieldstore[slot] and shieldstore[slot].shieldspell and shieldstore[slot].shieldspell == spellid and abs(shieldmonitor_getbuffexpire(spellid) - shieldstore[slot].shieldexpires) < 1) then
      
           return; -- it's an update to the existing shield so ignore
      
      end
     
      
      shieldpower[spellid] = strength;
             
-- see if shield details are in the cache, if not get them
-- ignore cache since 1.8.2        
--  elseif (not shieldpower[spellid]) then
   else
--     talents / glyph checks no longer needed either     
--     if (not shieldmonitor_donetalentcheck) then
--       shieldmonitor_checktalents();
--     end     

  
-- ensure beginner tooltips are switched off
     local newbietips= GetCVar("ShowNewbieTips");
     SetCVar("ShowNewbieTips","0");
     shieldmonitorTooltip:ClearLines();
     shieldmonitorTooltip:SetHyperlink("spell:"..tostring(spellid));
     local tiplines = shieldmonitorTooltip:NumLines();
shieldmonitor_debug("tiplines "..tostring(tiplines));
     if (tiplines > 2) then
            local readline = ""
            -- fix for bg/arena preparation removing one line of the tooltip!
            if (tiplines < tonumber(SHIELDMONITOR_TIPREAD[spelldata.tip].line)) then
               readline = tostring(tonumber(SHIELDMONITOR_TIPREAD[spelldata.tip].line) - 1)
            else
               readline = SHIELDMONITOR_TIPREAD[spelldata.tip].line
            end      
            local mytext = getglobal("shieldmonitorTooltipTextLeft"..readline);
            local text = mytext:GetText();
            shieldmonitor_debug("line: "..text);
            local _,_,dmgab = strfind(text, SHIELDMONITOR_TIPREAD[spelldata.tip].pattern);
shieldmonitor_debug("dmgab "..tostring(dmgab));
            if (dmgab == nil) then
                shieldmonitor_print("SHIELDMONITOR ERROR: unable to read shield value from tooltip ");
                dmgab = -1;
            end                
            shieldpower[spellid] = tonumber(dmgab);
     else
shieldmonitor_debug("failed reading spell ");
            shieldpower[spellid] = -1;
     end
     -- restore the player's chosen tooltip setting
     SetCVar("ShowNewbieTips",newbietips);
          
  end
  local slot=spelldata.slot;
  local spellname,spellrank = GetSpellInfo(spellid);

  shieldstore[slot]={};

  shieldstore[slot].shieldexpires = shieldmonitor_getbuffexpire(spellid);
  
  shieldstore[slot].shieldduration = tostring(floor(shieldstore[slot].shieldexpires - GetTime() +.5));
shieldmonitor_debug("aura expires "..tostring(shieldstore[slot].shieldexpires).." duration "..shieldstore[slot].shieldduration)

--  tooltip includes spellpower and glyph bonus since patch 4.0.1
--  if (strength ==nil and spelldata.bonus) then  -- only check for a bonus if Blizz haven't given us a number in the combat log
--    if (spelldata.gb) then -- only Ice Barrier should pass here, add in glyph bonus
--       shieldstore[slot].shieldat = shieldpower[spellid] + floor(GetSpellBonusDamage(spelldata.bonus) * 0.8067 * spelldata.gb );
--    else
--      shieldstore[slot].shieldat = shieldpower[spellid] + floor(GetSpellBonusDamage(spelldata.bonus) * 0.8067);
--    end      
--  else
    shieldstore[slot].shieldat = shieldpower[spellid];
--  end
  shieldstore[slot].shieldmax = shieldstore[slot].shieldat;
  shieldstore[slot].shieldspell = spellid;
  shieldstore[slot].icon = spelldata.icon;
  shieldstore[slot].r=spelldata.r;
  shieldstore[slot].g=spelldata.g;
  shieldstore[slot].b=spelldata.b;
  if (spelldata.school) then
     shieldstore[slot].school = spelldata.school;
  end
  if (not shieldmonitor_slotdisplayed or shieldmonitor_slotdisplayed >= slot) then
     shieldmonitor_slotdisplayed = slot;

     shieldmonitor_FrameIcon1:SetTexture("Interface\\Icons\\"..spelldata.icon);
     shieldmonitor_Bar:SetStatusBarColor(spelldata.r,spelldata.g,spelldata.b,1);
     shieldmonitor_update(slot);
     shieldmonitor_Frame:Show();
  end   
end

function shieldmonitor_onupdate(self,elapsed)
  shieldmonitor_elapsed= shieldmonitor_elapsed + elapsed; 	
  if (shieldmonitor_elapsed > .25) then
      if (shieldstore[shieldmonitor_slotdisplayed].pendingdestroy) then
          shieldstore[shieldmonitor_slotdisplayed].shieldat = -1;
          shieldmonitor_update(shieldmonitor_slotdisplayed);
      else   
         shieldstore[shieldmonitor_slotdisplayed].shieldduration = tostring(floor(shieldstore[shieldmonitor_slotdisplayed].shieldexpires - GetTime() +.5));   
         shieldmonitor_FrameDuration:SetText(shieldstore[shieldmonitor_slotdisplayed].shieldduration.."s");
         if ((Shieldmonitor_Options["enabletimewarn"] and tonumber(shieldstore[shieldmonitor_slotdisplayed].shieldduration) < Shieldmonitor_Options["timetowarn"]) or (Shieldmonitor_Options["enablepctwarn"] and shieldstore[shieldmonitor_slotdisplayed].pct <Shieldmonitor_Options["pcttowarn"])) then
            shieldmonitor_timewarn = not shieldmonitor_timewarn;
            if (shieldmonitor_timewarn) then
               if (Shieldmonitor_Options["enabletimewarn"] and tonumber(shieldstore[shieldmonitor_slotdisplayed].shieldduration) < Shieldmonitor_Options["timetowarn"]) then
                  shieldmonitor_FrameDuration:SetTextColor(1,.3,.3,1);
               end   
               if (Shieldmonitor_Options["enablepctwarn"] and shieldstore[shieldmonitor_slotdisplayed].pct < Shieldmonitor_Options["pcttowarn"]) then
                  shieldmonitor_BarText:SetTextColor(1,.3,.3,1);
               end   
               if (Shieldmonitor_Options["flashborder"]) then
                  shieldmonitor_Frame:SetBackdropBorderColor(1,.3,.3,1);
               end   
            else
               shieldmonitor_FrameDuration:SetTextColor(1,1,1,1);            
               shieldmonitor_Frame:SetBackdropBorderColor(1,1,1,1);
               shieldmonitor_BarText:SetTextColor(1,1,1,1);
            end
         end
      end             
      shieldmonitor_elapsed= 0; 	
  end 
end


function shieldmonitor_shielddown(spellid,spelldata)
  if (spellid==53601) then  -- fix for Sacred shield spell and actual shield having same name.
     return
  end;   
  if (shieldstore[spelldata.slot]) then
    if (spelldata.slot==shieldmonitor_slotdisplayed) then -- fix for Blizz sending the remove aura before the last bit of damage
    -- we don't remove the shield now, but flag if for removal on the next Onupdate process
        shieldstore[spelldata.slot].pendingdestroy=1;
        -- set the timer for the next Onupdate processing to happen in 1/10 of a sec (when the counter reaches 0.25)
        -- hopefully that gives the server a chance to send us
        -- the last bit of damage before we remove it, while still not having the shield hang around too long.
        shieldmonitor_elapsed = 0.15;
    else
        shieldstore[spelldata.slot].shieldat = -1;
        shieldmonitor_update(spelldata.slot);
    end  
  end    
end

function shieldmonitor_shielddmg(amount,school)
  local i=1;
  if (school) then
     school= tonumber(school);
  else
     school = 0;
  end
shieldmonitor_debug("dmg is school: "..tostring(school));        
  while (i <= shieldstore_slotmax and amount > 0) do
    if (shieldstore[i] and (not shieldstore[i].school or (bit.band(shieldstore[i].school,school)))) then
       shieldstore[i].shieldat = shieldstore[i].shieldat - amount;
       if (shieldstore[i].shieldat < 0) then
         amount = - shieldstore[i].shieldat;
       else
         amount = 0;
       end    
       if (i == shieldmonitor_slotdisplayed) then 
          shieldmonitor_update(i);
       end      
    end
    i=i+1;
  end
  if ( amount > 0 ) then
     shieldmonitor_debug("dmg not allocated to a shield!: "..tostring(amount));
  end     
end

function shieldmonitor_update(slot)
if (shieldstore[slot].shieldat > -1 ) then
   shieldstore[slot].shieldduration = tostring(floor(shieldstore[slot].shieldexpires - GetTime() +.5));
   shieldmonitor_timewarn=false;
   shieldmonitor_FrameDuration:SetText(shieldstore[slot].shieldduration.."s");
   shieldmonitor_FrameDuration:SetTextColor(1,1,1,1);
   shieldmonitor_Frame:SetBackdropBorderColor(1,1,1,1);
   shieldmonitor_BarText:SetTextColor(1,1,1,1);
   local pct = floor((shieldstore[slot].shieldat / shieldstore[slot].shieldmax * 100) + 0.5);
   shieldstore[slot].pct = pct;

   shieldmonitor_BarText:SetText(tostring(pct).."% ("..tostring(shieldstore[slot].shieldat)..")");
   shieldmonitor_Bar:SetValue(pct)
else
   shieldstore[slot]=nil;
   -- check if any other shields currently up...
   local i=1;
   local found=false;
   while (i<=shieldstore_slotmax and not found) do
      if (shieldstore[i]) then
         found=true;
         shieldmonitor_slotdisplayed=i;
         shieldmonitor_FrameIcon1:SetTexture("Interface\\Icons\\"..shieldstore[i].icon);
         shieldmonitor_Bar:SetStatusBarColor(shieldstore[i].r,shieldstore[i].g,shieldstore[i].b,1);
      end
      i=i+1;   
   end
   if (found) then
      shieldmonitor_update(shieldmonitor_slotdisplayed);
   else
     shieldmonitor_slotdisplayed=nil;      
     shieldmonitor_Frame:Hide();
     shieldmonitor_BarText:SetText("no shield");
     shieldmonitor_Bar:SetValue(0)
   end
end        
end

function shieldmonitor_onevent(self,event,...)
local arg1,arg2,arg3,arg4,arg5,arg6,srcxtra,arg7,arg8,arg9,destxtra,arg10,arg11,arg12,arg13,arg14,arg15,arg16 = ...
      if (event=='COMBAT_LOG_EVENT_UNFILTERED') then
-- only interested in events that effect me...
-- shieldmonitor_debug(arg7); 
         -- Misdirection stuff - spellid 34477
          if (Shieldmonitor_Options["mdchannel"]~="OFF" and arg4==shieldmonitor_MyGUID and arg2=="SPELL_CAST_SUCCESS" and arg10==34477) then
             local t=UnitName("target");
             if (t and UnitIsEnemy("target","player")) then
               SendChatMessage(t.. " misdirected to "..arg8,Shieldmonitor_Options['mdchannel']);   
             else
               SendChatMessage("Misdirecting next target to "..arg8,Shieldmonitor_Options['mdchannel']);   
             end
          elseif (arg7~= shieldmonitor_MyGUID) then
             return  -- quick exit if not of interest, since so much data passes via this event
          end
           if ((arg2== 'SPELL_AURA_APPLIED' or arg2=='SPELL_AURA_REFRESH') and SHIELDMONITOR_SPELLS[arg11]) then
              shieldmonitor_shieldup(arg10,SHIELDMONITOR_SPELLS[arg11],arg4,arg14);
           elseif (tostring(arg10)=='ABSORB') then  -- melee absorbed
              shieldmonitor_shielddmg(tonumber(arg12),0);
           elseif (tostring(arg13)=='ABSORB') then -- ranged absorbed
              shieldmonitor_shielddmg(tonumber(arg15),arg12);
           elseif (arg2== 'ENVIRONMENTAL_DAMAGE' and arg16 and tonumber(arg16) > 0) then -- environment absorbed
              shieldmonitor_shielddmg(tonumber(arg16),arg13);
           elseif (arg2== 'SPELL_AURA_REMOVED' and SHIELDMONITOR_SPELLS[arg11]) then
              shieldmonitor_shielddown(arg10,SHIELDMONITOR_SPELLS[arg11]);
           elseif ((arg2== 'SPELL_HEAL' or arg2=='SPELL_PERIODIC_HEAL') and arg15) then
-- shieldmonitor_debug("heal "..tostring(arg13).." - "..tostring(arg14).." - "..tostring(arg15));
              shieldmonitor_lastcritheal=tonumber(arg13);
           end
           return
      elseif (event=='LFG_UPDATE') then
        local smmode,_ = GetLFGMode();
        if (smmode=='queued') then
            local _,smjp= GetCurrencyInfo(395);
            local _,smvp= GetCurrencyInfo(396);
            if (smjp > 3500 or smvp > 3500) then
      	       UIErrorsFrame:AddMessage("You are queueing for a dungeon with ".. smjp .. " JP and " .. smvp .." VP",1,.3,.3,1,10 );
      	       PlaySound("ReadyCheck");
      	    end  
      	end  
            
      elseif (event=='PLAYER_ENTERING_WORLD') then
            if (not Shieldmonitor_Options) then
               Shieldmonitor_Options = {};
-- set default options here               
               Shieldmonitor_Options["Lock"]=false;
               Shieldmonitor_Options["scale"]=1;
            end
            if (not Shieldmonitor_Options["version"] or Shieldmonitor_Options["version"] < 1.13) then
-- options new in this version
               Shieldmonitor_Options["timetowarn"]=4;
               Shieldmonitor_Options["enabletimewarn"]=true;
               Shieldmonitor_Options["pcttowarn"]=21;
               Shieldmonitor_Options["enablepctwarn"]=true;
               Shieldmonitor_Options["flashborder"]=true;
               Shieldmonitor_Options["version"]=1.13;            
               if (not Shieldmonitor_Options["scale"]) then
                  Shieldmonitor_Options["scale"]=1;
               end
            end
            if (Shieldmonitor_Options["version"] < 1.3) then
-- options new in this version
               Shieldmonitor_Options["mdchannel"]='OFF';
               Shieldmonitor_Options["version"]=1.3;            
            end
            shieldmonitor_setscale(tonumber(Shieldmonitor_Options["scale"]));  
            shieldmonitor_classinit(self);
            self:UnregisterEvent("PLAYER_ENTERING_WORLD");

           CreateFrame( "GameTooltip", "shieldmonitorTooltip" ); -- Tooltip name cannot be nil
           shieldmonitorTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
           shieldmonitorTooltip:AddFontStrings(
           shieldmonitorTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
           shieldmonitorTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
  
--	         UIDropDownMenu_Initialize(shieldmonitor_FrameDropDown, shieldmonitor_InitDropDown, "MENU");
	    
	         shieldmonitor_Bar:SetMinMaxValues(0,100);  
	           
      elseif (event=='CHAT_MSG_ADDON') then
      -- addon msg received
shieldmonitor_debug(tostring(GetTime())..":addonmsg from "..tostring(arg4).." in "..tostring(arg3).." ("..tostring(arg1)..") "..tostring(arg2));

      elseif (event=='PLAYER_LEVEL_UP' or event=='PLAYER_TALENT_UPDATE') then
          shieldmonitor_debug("event fired: "..event);
      -- levelling or talent changes/dual spec may change the shield values , so empty our cache and recheck the talents
         shieldpower = {};
         if (shieldmonitor_slotdisplayed) then 
            shieldmonitor_checkcurrentbuffs();
         end
         shieldmonitor_donetalentcheck=false;       
      end
end

function shieldmonitor_checkcurrentbuffs()
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
     shieldmonitor_slotdisplayed=nil;      
     shieldmonitor_Frame:Hide();
     shieldmonitor_BarText:SetText("no shield");
     shieldmonitor_Bar:SetValue(0);
  end
end


function shieldmonitor_lockmenu()
		Shieldmonitor_Options["Lock"] = not Shieldmonitor_Options["Lock"];
end

function shieldmonitor_print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("Shieldmonitor "..msg, 0.7, 0.7, 1.0);
end

function shieldmonitor_debug(msg)
if (shieldmonitor_debugmsgs) then
    DEFAULT_CHAT_FRAME:AddMessage("SHIELDMONITOR DEBUG: "..msg, 0.5, 0.5, 1.0);
end
end