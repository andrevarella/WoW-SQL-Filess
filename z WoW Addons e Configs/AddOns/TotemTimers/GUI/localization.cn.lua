local L = LibStub("AceLocale-3.0"):NewLocale("TotemTimers_GUI", "zhCN")
if not L then return end

L["Air"] = "空气"
L["Automatic"] = "Automatic" -- Requires localization
L["Bottom"] = "Bottom" -- Requires localization
L["Cast Button 1"] = "Cast Button 1" -- Requires localization
L["Cast Button 2"] = "Cast Button 2" -- Requires localization
L["Down"] = "Down" -- Requires localization
L["Earth"] = "大地"
L["Enable"] = "启用"
L["Fire"] = "火焰"
L["Left"] = "Left" -- Requires localization
L["none"] = "none" -- Requires localization
L["Right"] = "Right" -- Requires localization
L["Top"] = "Top" -- Requires localization
L["Totems"] = "Totems" -- Requires localization
L["TotemTimers"] = true
L["Up"] = "Up" -- Requires localization
L["Version"] = "版本"
L["vertical"] = "垂直显示"
L["Water"] = "水盾"

L["Blizz Style"] = "暴雪样式"
L["Color Timer Bars"] = "着色计时条"
L["Color Timer Bars according to their elements."] = "Color Timer Bars according to their elements." -- Requires localization
L["Debug"] = "除错"
L["Displays timer bars underneath times"] = "Displays timer bars underneath times" -- Requires localization
L["General"] = "综合"
L["Hide Blizzard Timers"] = "隐藏暴雪计时器"
L["Hide Default Totem Bar"] = "隐藏默认的图腾条"
L["Hide Default Totem Bar Desc"] = "If you uncheck this you should reload your interface." -- Requires localization
L["Hide In Vehicles"] = "在载具中时隐藏"
L["Hide In Vehicles Desc"] = "当在载具中时隐藏 TotemTimers 。当在驾驶时不要改动设置。"
L["Lock"] = "锁定"
L["Locks the position of TotemTimers"] = "锁定 TotemTimers 的位置"
L["RaidTotems"] = "RaidTotems" -- Requires localization
L["RaidTotems Desc"] = "Sets the multicast spell to which totems send by the RaidTotems addon are assigned." -- Requires localization
L["Red Flash Color"] = "Red Flash Color" -- Requires localization
L["RedFlash Desc"] = "If enabled expiring timers flash red, else they will fade in and out." -- Requires localization
L["Reset All"] = "Reset All" -- Requires localization
L["Reset Positions"] = "Reset Positions" -- Requires localization
L["Show Key Bindings"] = "Show Key Bindings" -- Requires localization
L["Shows key bindings on totem timers"] = "Shows key bindings on totem timers" -- Requires localization
L["Shows tooltips on timer and totem buttons"] = "Shows tooltips on timer and totem buttons" -- Requires localization
L["Show Timer Bars"] = "Show Timer Bars" -- Requires localization
L["Show Tooltips"] = "Show Tooltips" -- Requires localization
L["Stop Pulse"] = "Stop Pulse" -- Requires localization
L["Stop Pulse Desc"] = " \"If a timer stops its icon gives a big visible pulse\"" -- Requires localization
L["Time Color"] = "Time Color" -- Requires localization
L["Time Font"] = "计时字体"
L["Timer Bar Color"] = "Timer Bar Color" -- Requires localization
L["Timer Bar Texture"] = "Timer Bar Texture" -- Requires localization
L["Timers On Buttons"] = "Timers On Buttons" -- Requires localization
L["Tooltips At Buttons"] = "Tooltips At Buttons" -- Requires localization
L["Tooltips At Buttons Desc"] = "Shows Tooltips to the right of TT's buttons." -- Requires localization

L["Advanced Options"] = "Advanced Options" -- Requires localization
L["Always Visible Desc"] = "Totem menus are always visible and can be dragged around like action bars." -- Requires localization
L["Arrangement"] = "排列"
L["Basic layout of the four timer buttons, loose lets you move them individually"] = "Basic layout of the four timer buttons, loose lets you move them individually" -- Requires localization
L["box"] = "box" -- Requires localization
L["Button Size"] = "按钮大小"
L["Cast Button Position"] = "施法按钮位置"
L["Cast Button Position Desc"] = "Sets the position of the additional customizable totem buttons next to the totem timers" -- Requires localization
L["Cast Button Size"] = "施法按钮大小"
L["Cast Button Size Desc"] = "Sets the size of the addition customizable totem buttons relative to the size of the totem timers" -- Requires localization
L["Enable Pulse Bar"] = "启用脉动条"
L["Enables the four totem timer buttons and menus"] = "启用4个图腾计时器按钮和菜单"
L["horizontal"] = "水平"
L["Keybindings desc"] = "If enabled, totem buttons will have mapped the keys 1-9 to them if totem menus are shown|nYou have to relog for this setting to take effect." -- Requires localization
L["loose"] = "自由排列"
L["Mini Icons Desc"] = "Shows the small icons in the lower right of the timer buttons which indicate the totem assigned to the active multicast spell and the timer  button will cast." -- Requires localization
L["Open On Rightclick"] = "右键点击打开"
L["Player Range"] = "玩家距离"
L["Player Range Desc"] = "如果玩家超出距离时在图腾计时器上显示一个红点"
L["Pulse desc"] = "Shows a green status bar inside the timers that fills until a totem pulses." -- Requires localization
L["Raid Member Range"] = "团队成员距离"
L["Raid Range Tooltip"] = "Raid Range Tooltip" -- Requires localization
L["Range Desc"] = "Shows how many raid members do not get the buff of your totem in the lower left corner" -- Requires localization
L["Reverse Key Bindings"] = "Reverse Key Bindings" -- Requires localization
L["Reverse Key Desc"] = "Bind keys in order 9-1 instead of 1-9|nYou have to relog for this setting to take effect." -- Requires localization
L["Rightclick Desc"] = "Open the totem menus on a rightclick instead of hovering over the timer button. Totems can then be dismissed with the middle mouse button instead of a rightclick." -- Requires localization
L["RR Tooltip Desc"] = "Shows a list of raid members not in range of your totem on mouseover" -- Requires localization
L["Scales the timer buttons"] = "Scales the timer buttons" -- Requires localization
L["Scaling"] = "Scaling" -- Requires localization
L["Sets the font size of time strings"] = "Sets the font size of time strings" -- Requires localization
L["Sets the format in which times are displayed"] = "Sets the format in which times are displayed" -- Requires localization
L["Sets the space between timer buttons"] = "Sets the space between timer buttons" -- Requires localization
L["Sets the space between timer buttons and timer bars"] = "Sets the space between timer buttons and timer bars" -- Requires localization
L["Sets the width of timer bars."] = "Sets the width of timer bars." -- Requires localization
L["Show Mini Icons"] = "Show Mini Icons" -- Requires localization
L["Show Totem Cooldowns"] = "Show Totem Cooldowns" -- Requires localization
L["Spacing"] = "间距"
L["Timer Bar Position"] = "Timer Bar Position" -- Requires localization
L["Timer Bar Position Desc"] = "Sets at which side of the timer icons the times are displayed" -- Requires localization
L["Timer Bar Width"] = "Timer Bar Width" -- Requires localization
L["Timer Bar Width Desc"] = "Sets the width of the timer bars." -- Requires localization
L["Timer Button 1"] = "Timer Button 1" -- Requires localization
L["Timer Button 2"] = "Timer Button 2" -- Requires localization
L["Timer Button 3"] = "Timer Button 3" -- Requires localization
L["Timer Button 4"] = "Timer Button 4" -- Requires localization
L["Timers"] = "Timers" -- Requires localization
L["Timers On Buttons Desc"] = "Timers are displayed on the buttons instead of next to them. If enabled, the weapon tracker will only show the time for the main hand weapon when dual wielding." -- Requires localization
L["Time Size"] = "Time Size" -- Requires localization
L["Time Spacing"] = "Time Spacing" -- Requires localization
L["Time Style"] = "Time Style" -- Requires localization
L["Totem Cooldowns desc"] = "Shows cooldowns of all totems with longer cooldowns as additional timer bars." -- Requires localization
L["Totem menu direction"] = "Totem menu direction" -- Requires localization
L["Totem menu direction desc"] = "Sets the direction in which the totem menus open. Automatic determines the direction based on the timer's position." -- Requires localization
L["Totem Menu Key Bindings"] = "Totem Menu Key Bindings" -- Requires localization
L["Totem Menus Always Visible"] = "Totem Menus Always Visible" -- Requires localization
L["Totem Menu Spacing"] = "Totem Menu Spacing" -- Requires localization
L["Totem Menu Spacing Desc"] = "Sets the spacing of buttons in the totem menus. Only applies if menus are always visible." -- Requires localization

L["Ankh Tracker"] = "十字章追踪器"
L["Ankh Tracker Desc"] = "显示复生技能的剩余冷却时间以及你的背包内十字章的数量。也可以用来保存和加载图腾设置。"
L["Button 4"] = "按钮 4"
L["EarthShieldDesc"] = "显示大地之盾的剩余时间和次数。可以用来施放大地之盾"
L["EarthShieldOptionsDesc"] = "If 'recast' is selected as option for a mouse button, the shield is cast on the last person it was cast out of combat or the person assigned by the RaidTotems addon. Default Usage: Target you ES target and cast the spell on it by rightclicking the button out of combat. Then you can target somebody else, but the ES will still be cast on the same person by leftclicking, even in combat." -- Requires localization
L["Earth Shield Tracker"] = "大地之盾追踪器"
L["esrecast"] = "重新施放 (最后一个目标/团队图腾)"
L["Leftclick"] = "左键点击"
L["Middle Button"] = "鼠标中键"
L["Rightclick"] = "右键点击"
L["Shield Tracker"] = "萨满护盾追踪器"
L["Trackers"] = "追踪器"
L["Weapon Buff Tracker"] = "武器 Buff 追踪器"
L["WeaponDesc"] = "Shows the remaining time of your weapon buffs. Leftclick cast the selected weapon buff, rightclick opens a menu to select a buff. I an icon shows two buffs, the first leftclick cast the left buff and a second leftclick the right buff." -- Requires localization

L["Color"] = "Color" -- Requires localization
L["disabled warnings desc"] = "Even if a tracker is disabled, its warnings of expired buffs will still be shown" -- Requires localization
L["EarthShield warnings"] = "大地之盾警报"
L["Maelstrom notification"] = "漩涡武器提醒"
L["Messages"] = "信息"
L["Shield expiration warnings"] = "Shield expiration warnings" -- Requires localization
L["Show warnings of disabled trackers"] = "Show warnings of disabled trackers" -- Requires localization
L["Sound"] = "Sound" -- Requires localization
L["Totem Desctruction Desc"] = "Warning if a totem is destroyed before it is expired." -- Requires localization
L["Totem Destruction Message"] = "Totem Destruction Message" -- Requires localization
L["Totem Expiration Desc"] = "Warning after a totem expires." -- Requires localization
L["Totem Expiration Message"] = "Totem Expiration Message" -- Requires localization
L["Totem Expiration Warning"] = "Totem Expiration Warning" -- Requires localization
L["Totem Warning Desc"] = "Warns 10 secs before a totem expires." -- Requires localization
L["Warnings"] = "Warnings" -- Requires localization
L["Weapon buff warnings"] = "Weapon buff warnings" -- Requires localization

L["Menu Direction"] = "菜单方向"
L["Menu Key Bindings"] = "Menu Key Bindings" -- Requires localization
L["Multicast Button"] = "Multicast Button" -- Requires localization
L["MultiCast Keybinds Desc"] = "Assigns the buttons in the multicast menu key bindings from 1-3.|nYou have to relog for this setting to take effect." -- Requires localization
L["MultiCast Reverse Keybinds Desc"] = "Assigns key bindings from 9-6 instead of 1-3.|nYou have to relog for this setting to take effect." -- Requires localization
L["Same as totem menus"] = "Same as totem menus" -- Requires localization
L["Same as weapon buff menu"] = "Same as weapon buff menu" -- Requires localization

L["Duration"] = "Duration" -- Requires localization
L["ECD Button Size"] = "ECD Button Size" -- Requires localization
L["ECD Font Size"] = "ECD Font Size" -- Requires localization
L["EnhanceCDs"] = "EnhanceCDs" -- Requires localization
L["Hide OOC Desc"] = "Changing this setting will have effect after the next combat" -- Requires localization
L["Hide out of combat"] = "Hide out of combat" -- Requires localization
L["Maelstrom Bar Height"] = "Maelstrom Bar Height" -- Requires localization
L["OOC Alpha"] = "OOC Alpha" -- Requires localization
L["OOC Alpha Desc"] = "Controls the opacity of the buttons out of combat, 0 = transparent, 1 = opaque" -- Requires localization
L["Show OmniCC counters"] = "Show OmniCC counters" -- Requires localization



if( GetLocale() == "zhCN" ) then

TT_GUI_HEADER = "TotemTimers"
TT_GUI_TAB_GENERAL = "基本设置"
TT_GUI_TAB_TIMERS = "计时器设置"
TT_GUI_TAB_TIMERS2 = "快捷键设置"
TT_GUI_TAB_TRACKERS = "追踪器设置"
TT_GUI_TAB_TRACKERS2 = "追踪器设置2"
TT_GUI_TAB_SHOUTS = "随身呼"
TT_GUI_TAB_MESSAGES = "消息提示"

TT_GUI_CHECKSHOW = "显示计时器"
TT_GUI_CHECKLOCK = "锁定计时器位置"
TT_GUI_CHECKTOTEMWARNINGMSG = "到期警报"
TT_GUI_CHECKTOTEMEXPIRATIONMSG = "到期提示"
TT_GUI_CHECKTOTEMDESTROYEDMSG = "被摧毁提示"
TT_GUI_CHECKRECAST = "再次施放"
TT_GUI_CHECKFLASHRED = "红色闪动效果"
TT_GUI_CHECKPROCFLASH = "进度条"
TT_GUI_CHECKTOOLTIPS = "提示信息"
TT_GUI_CHECKMINIICONS = "微型图标"
TT_GUI_CHECKMOUSEOVER = "鼠标停留展开"
TT_GUI_CHECKEARTHSHOUT = "召唤土元素的随身呼"
TT_GUI_CHECKFIRESHOUT = "召唤火元素的随身呼"
TT_GUI_CHECKMANASHOUT = "施放法力之潮的随身呼"
TT_GUI_CHECKSHOWTOTEMSASBUFFS = "在BUFF位置显示图腾计时"
TT_GUI_CHECKSHOWEARTHELEMENTALBUTTON = "显示土元素图腾"
TT_GUI_CHECKSHOWFIREELEMENTALBUTTON = "显示火元素图腾"
TT_GUI_CHECKSHOWMANATIDEBUTTON = "显示法力之潮图腾"
TT_GUI_CHECKTOTEMTWISTING = "显示风怒图腾作用计时"
TT_GUI_CHECKSWITCHAGIWF = "优雅与风怒图腾循环切换"
TT_GUI_CHECKDISABLEMENUDELAY = "禁止菜单延迟"
TT_GUI_CHECKFOCUSELEMENTALS = "元素集中"
TT_GUI_CHECKCOLORTIMERBARS = "彩色时间条"
TT_GUI_CHECKHIDEBLIZZTIMERS = "隐藏游戏自身图腾框体"
TT_GUI_CHECKSHOWCOOLDOWNS = "显示图腾冷却时间"

TT_GUI_CHECKSETCASTTOTEMS = "重新施放上次的图腾"

TT_GUI_TOOLTIPMOUSEOVER = "|cffffd100鼠标停留展开|r|n启用时，图腾按钮当鼠标移到计时器上就会展开(右键摧毁)，否则右键点击计时器时展开(中键摧毁)。" 
TT_GUI_TOOLTIPREINCARNATION = "|cffffd100复生冷却时间|r|n显示复生的技能冷却时间和携带的十字章数量。"
TT_GUI_TOOLTIPMINIICONS = "|cffffd100微型图标|r|n在图腾图标的右下角显示可以再次施放的图腾微型图标。"
TT_GUI_TOOLTIPTOOLTIPS = "|cffffd100提示信息|r|n当鼠标移到计时器或图标上时显示提示信息。"
TT_GUI_TOOLTIPPROCFLASH = "|cffffd100进度条|r|n在计时器中显示绿色的进度条。"
TT_GUI_TOOLTIPFLASHRED = "|cffffd100红色闪动效果|r|n启用的时候图腾即将过期时有红色闪动效果，否则是淡入淡出效果。"
TT_GUI_TOOLTIPRECAST = "|cffffd100再次施放|r|n启用再次施放机制。"
TT_GUI_TOOLTIPEARTHSHOUT = "|cffffd100召唤土元素的随身呼|r|n召唤土元素时发送一条通知， 如果在团队中就向整个团队发送,如果在队伍里就向队伍发送。"
TT_GUI_TOOLTIPFIRESHOUT = "|cffffd100召唤火元素的随身呼|r|n召唤火元素时发送一条通知， 如果在团队中就向整个团队发送,如果在队伍里就向队伍发送。"
TT_GUI_TOOLTIPMANASHOUT = "|cffffd100施放法力之潮的随身呼|r|n施放法力之潮是向队伍发送一条通知"
TT_GUI_TOOLTIPSHOWTOTEMSASBUFFS = "|cffffd100在BUFF位置显示图腾计时|r|n在BUFF框架上显示图腾计时。本功能需要重新载入UI。|n也许会由于你的某些插件导致这个功能不正常."
TT_GUI_TOOLTIPDISABLEMENUDELAY = "禁止当鼠标移开图腾按钮后菜单自动关闭的延迟"
TT_GUI_TOOLTIPFOCUSELEMENTALS = "|cffffd100元素集中|r|n如果开启，双击会施放元素集中。|n需要重载插件使设置生效。（该项目翻译可能有错）"
TT_GUI_TOOLTIPCOLORTIMERBARS = "|cffffd100彩色计时条|r|n根据元素种类进行染色。"
TT_GUI_TOOLTIPSHOWCOOLDOWNS = "|cffffd100显示图腾冷却时间|r|n为冷却时间较长的图腾添加一个冷却计时条。"

TT_GUI_TOOLTIPSETCASTTOTEMS = "|cffffd100重新施放上次的图腾|r|n如果开启，非战斗时使用某图腾后，该图腾将被设为这个系默认使用的图腾，点击图腾条上相应位置即可施放。|n(战斗中使用该系其他图腾不会使得默认设置发生变化!)"

TT_GUI_TIMEFONT = "时间字体"
TT_GUI_TIMERBARTEXTURE = "计时条材质"

TT_GUI_CHECKSHOWTIMERBARS = "显示计时条背景"
TT_GUI_CHECKREVERSEBARBINDINGS = "反转图腾快捷键"
TT_GUI_CHECKBARBINDINGS = "启用图腾快捷键"
TT_GUI_CHECKSHOWPARTYBUFFS = "显示图腾作用到的小队成员"
TT_GUI_CHECKSHOWPLAYERBUFFDOT = "在图腾图标上显示自己是否被作用到"

TT_GUI_CHECKENHANCECDS = "显示增强萨满冷却计时器"
TT_GUI_ECDSIZE = "图标大小"
TT_GUI_ECDTIMEHEIGHT = "计时器高度"
TT_GUI_ECDMAELSTROMHEIGHT = "漩涡武器计时条高度"

TT_GUI_TOOLTIPSHOWBAR = "在计时器时间下显示计时条背景"
TT_GUI_TOOLTIPREVERSEBARBINDINGS = "使快捷键顺序改为9-1|n"
	.."你必须重新登陆以使设置生效。"
TT_GUI_TOOLTIPBARBINDINGS = "如果启用，你可以在展开的图腾动作条上使用1-9快捷键|n"
	.."你必须重新登陆以使设置生效。" 

TT_GUI_DROPDOWN_ARRANGE = "排列"
TT_GUI_VERTICAL = "纵向"
TT_GUI_HORIZONTAL = "横向"
TT_GUI_BOX = "正方"
TT_GUI_FREE = "自由"

TT_GUI_DROPDOWN_STYLE = "样式"
TT_GUI_BUFF = "Buff"
TT_GUI_FIXED = "Fixed"
TT_GUI_ELEMENT = "Element"
TT_GUI_STICKY = "Sticky"

TT_GUI_SPACING = "间距"
TT_GUI_TIMESPACING = "时间间距"
TT_GUI_TRACKERSPACING = TT_GUI_SPACING
TT_GUI_TRACKERTIMESPACING = TT_GUI_TIMESPACING

TT_GUI_DROPDOWN_TIME = "时间样式"
TT_GUI_CT = "ct"
TT_GUI_BLIZZARD = "blizz"

TT_GUI_DROPDOWN_TIMEPOS = "计时条位置"
TT_GUI_DROPDOWN_TRACKERTIMEPOS = TT_GUI_DROPDOWN_TIMEPOS

TT_GUI_DROPDOWN_MSG = "消息样式"
TT_GUI_TT = "TotemTimers"
TT_GUI_SCT = "sct"
TT_GUI_SCT2 = "sct 暴击"
TT_GUI_SCTMSG = "sct静态信息框"
TT_GUI_MSBT = "MSBT"
TT_GUI_PARROT = "Parrot"
TT_GUI_PARROTCRIT = "Parrot 暴击"
TT_GUI_CHAT = "聊天窗口"

TT_GUI_ORDER1 = "计时器1"
TT_GUI_ORDER2 = "计时器2"
TT_GUI_ORDER3 = "计时器3"
TT_GUI_ORDER4 = "计时器4"
TT_GUI_CHECKINMACRO1 = "宏"
TT_GUI_CHECKINMACRO2 = "宏"
TT_GUI_CHECKINMACRO3 = "宏"
TT_GUI_CHECKINMACRO4 = "宏"
TT_GUI_TIMERSIZE = "图标大小"
TT_GUI_TIMEHEIGHT = "时间大小"
TT_GUI_TRACKERSIZE = "图标大小"
TT_GUI_TRACKERTIMEHEIGHT = "时间大小"
TT_GUI_BARDIRECTION = "图腾动作条方向"
TT_GUI_OPENMENU = "展开图腾"

TT_GUI_AUTO = "自动"
TT_GUI_LEFT = "左侧"
TT_GUI_RIGHT = "右侧"
TT_GUI_UP = "上方"
TT_GUI_DOWN = "下方"
TT_GUI_TOP = "顶部"
TT_GUI_BOTTOM = "底部"

TT_GUI_DEBUG = "调试"
TT_GUI_RESET = "重置设置"
TT_GUI_RESETPOS = "缺省位置"

TT_GUI_CHECKANKHTRACKER = "复生计时器"
TT_GUI_CHECKSHIELDTRACKER = "显示盾追踪器"
TT_GUI_CHECKEARTHSHIELDTRACKER = "显示大地之盾追踪器"
TT_GUI_CHECKWEAPONTRACKER = "显示武器特效追踪器"
TT_GUI_CHECKSHIELDMSG = "盾特效到期提示"
TT_GUI_CHECKEARTHSHIELDMSG = "大地之盾提示"
TT_GUI_CHECKWEAPONMSG = "武器特效提示"
TT_GUI_CHECKMAELSTROMMSG = "漩涡武器特效提示"

TT_GUI_WEAPONBUFFLEFTCLICK = "主手([组合键]左键)"
TT_GUI_WEAPONBUFFRIGHTCLICK = "副手([组合键]右键)"
TT_GUI_WEAPONBUFFMODIFIER = "组合键"

TT_GUI_LEFTCLICK = "左键点击"
TT_GUI_RIGHTCLICK = "右键点击"
TT_GUI_MIDDLECLICK = "中键点击"
TT_GUI_BUTTON4CLICK = "鼠标按键4"
TT_GUI_MOUSEOVER = "鼠标指向"
TT_GUI_ALWAYS = "始终显示"

TT_GUI_SHIELDTRACKER = "盾追踪器"
TT_GUI_EARTHSHIELDTRACKER = "大地之盾追踪器"

TT_GUI_HIDE = "隐藏"

TT_GUI_TIMERBARWIDTH = "计时条长度"
TT_GUI_TOTEMMENUSPACING = "图腾菜单间距"

TT_GUI_CHECKCHECKPLAYERRANGE = "玩家距离"
TT_GUI_CHECKCHECKRAIDRANGE = "团队成员距离"
TT_GUI_CHECKSHOWRAIDRANGETOOLTIP = "团队成员距离鼠标提示"
TT_GUI_TOOLTIPCHECKPLAYERRANGE = "|cffffd100玩家距离|r|n如果玩家超出图腾有效范围，在图腾上显示一个红色圆点。"
TT_GUI_TOOLTIPCHECKRAIDRANGE = "|cffffd100团队成员距离|r|n在图腾的左下角显示有多少团队成员未获得该图腾效果。"
TT_GUI_TOOLTIPSHOWRAIDRANGETOOLTIP = "|cffffd100团队成员距离鼠标提示|r|n当你鼠标指向图腾时，在鼠标提示上显示未在该图腾有效范围内的玩家名单。"
TT_GUI_CHECKACTIVATEHIDDENTIMERS = "为已被关闭的追踪项目显示提示信息"
TT_GUI_TOOLTIPACTIVATEHIDDENTIMERS = "|cffffd100为已被关闭的追踪项目显示提示信息|r|n即使追踪已经被关闭，依旧会显示其到期提示信息。"

TT_GUI_ROLE_NAMES = {
		[0]="未知",
		[1]="近战",
		[2]="远程",
		[3]="施法者",
		[4]="治疗",
		[5]="增强"
	}
end