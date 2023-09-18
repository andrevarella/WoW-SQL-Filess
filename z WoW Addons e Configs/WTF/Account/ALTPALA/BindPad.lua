
BindPadVars = {
	{
		["type"] = "CLICK",
		["name"] = "Faerie Fire",
		["macrotext"] = "/cast Faerie Fire",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Faerie Fire",
		["texture"] = "Interface\\Icons\\Spell_Nature_FaerieFire",
	}, -- [1]
	{
		["type"] = "CLICK",
		["name"] = "FF focus",
		["macrotext"] = "/cast [target=focus] Faerie Fire",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:FF focus",
		["texture"] = "Interface\\Icons\\Spell_Nature_FaerieFire",
	}, -- [2]
	{
		["type"] = "CLICK",
		["name"] = "Flight Form",
		["macrotext"] = "/cast Swift Flight Form",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Flight Form",
		["texture"] = "Interface\\Icons\\Ability_Druid_FlightForm",
	}, -- [3]
	{
	}, -- [4]
	{
		["type"] = "CLICK",
		["name"] = "innervate pt1",
		["fastTrigger"] = true,
		["macrotext"] = "/cast [target=Hydramistv] innervate\n/cast [target=party1] innervate\n/p innervate em vc!!!",
		["action"] = "CLICK BindPadFastMacro:innervate pt1",
		["texture"] = "Interface\\Icons\\Spell_Nature_Lightning",
	}, -- [5]
	{
		["type"] = "CLICK",
		["name"] = "Cancel aura",
		["macrotext"] = "/cancelaura dire bear form\n/cancelaura cat form\n/cancelaura travel form\n/cancelaura Tree of Life\n/cancelaura swift flight form\n/cancelaura moonkin form\n/cancelaura Invincible",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Cancel aura",
		["texture"] = "Interface\\Icons\\Spell_Shaman_StaticShock",
	}, -- [6]
	{
		["type"] = "CLICK",
		["name"] = "root1",
		["macrotext"] = "/cast [target=arena1] entangling roots",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:root1",
		["texture"] = "Interface\\Icons\\Spell_Nature_StrangleVines",
	}, -- [7]
	{
		["type"] = "CLICK",
		["name"] = "root2",
		["macrotext"] = "/cast [target=arena2] entangling roots",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:root2",
		["texture"] = "Interface\\Icons\\Spell_Nature_StrangleVines",
	}, -- [8]
	{
		["type"] = "CLICK",
		["name"] = "root3",
		["macrotext"] = "/cast [target=arena3] entangling roots",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:root3",
		["texture"] = "Interface\\Icons\\Spell_Nature_StrangleVines",
	}, -- [9]
	{
	}, -- [10]
	{
	}, -- [11]
	{
		["type"] = "CLICK",
		["name"] = "inspect",
		["macrotext"] = "/inspect",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:inspect",
		["texture"] = "Interface\\Icons\\Spell_unused2",
	}, -- [12]
	{
		["type"] = "CLICK",
		["name"] = "target pet enemy",
		["macrotext"] = "/target [@arenapet1, exists][@arenapet2, exists][@arenapet3, exists][harm]\n",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:target pet enemy",
		["texture"] = "Interface\\Icons\\Ability_Creature_Disease_03",
	}, -- [13]
	{
	}, -- [14]
	{
	}, -- [15]
	{
	}, -- [16]
	{
		["type"] = "CLICK",
		["name"] = "Nourish Resto",
		["macrotext"] = "/cast Nourish",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Nourish Resto",
		["texture"] = "Interface\\Icons\\Ability_Druid_Nourish",
	}, -- [17]
	{
		["type"] = "CLICK",
		["name"] = "Lacerate/Rake/LF",
		["macrotext"] = "/cast [form:1] Lacerate\n/cast [stealth] Pounce\n/cast [form:3] rake\n/cast [noform] Lifebloom\n/cast [form:5] lifebloom",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Lacerate/Rake/LF",
		["texture"] = "Interface\\Icons\\Ability_Druid_Disembowel",
	}, -- [18]
	{
		["type"] = "CLICK",
		["name"] = "TAR A1 / nitro",
		["macrotext"] = "/target arena1\n/use 8\n",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:TAR A1 / nitro",
		["texture"] = "Interface\\Icons\\Ability_Hunter_MasterTactitian",
	}, -- [19]
	{
		["type"] = "CLICK",
		["name"] = "tar a2 / cinto",
		["macrotext"] = "/target arena2\n/use 6",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:tar a2 / cinto",
		["texture"] = "Interface\\Icons\\Ability_Hunter_MasterTactitian",
	}, -- [20]
	{
		["type"] = "CLICK",
		["name"] = "tar a3 / capa",
		["macrotext"] = "/target arena3\n/use 15",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:tar a3 / capa",
		["texture"] = "Interface\\Icons\\Ability_Hunter_MasterTactitian",
	}, -- [21]
	{
	}, -- [22]
	{
	}, -- [23]
	{
		["type"] = "CLICK",
		["name"] = "Racial Pounce",
		["fastTrigger"] = true,
		["macrotext"] = "#showtooltip pounce\n/cancelaura shadowmeld\n/stopattack\n/cast [combat] Shadowmeld\n/cast [noform:3] !Cat Form\n/cast [form:3] !Prowl\n/cast pounce\n",
		["action"] = "CLICK BindPadFastMacro:Racial Pounce",
		["texture"] = "Interface\\Icons\\Ability_Druid_CatFormAttack",
	}, -- [24]
	{
		["type"] = "CLICK",
		["name"] = "focus a1",
		["macrotext"] = "/focus [target=arena1]\n/cast [target=arena1] savage roar",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:focus a1",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	}, -- [25]
	{
		["type"] = "CLICK",
		["name"] = "focus a2",
		["macrotext"] = "/focus [target=arena2]\n/cast [target=arena2] savage roar",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:focus a2",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	}, -- [26]
	{
		["type"] = "CLICK",
		["name"] = "focus a3",
		["macrotext"] = "/focus [target=arena3]\n/cast [target=arena3] savage roar",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:focus a3",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pathfinding",
	}, -- [27]
	{
	}, -- [28]
	{
	}, -- [29]
	{
		["type"] = "CLICK",
		["name"] = "Charge catbear",
		["macrotext"] = "/cast [form:1] feral charge - bear\n/cast [stealth] feral charge - cat\n/cast [form:3] feral charge - cat\n",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Charge catbear",
		["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
	}, -- [30]
	{
		["type"] = "CLICK",
		["name"] = "Rebirth",
		["macrotext"] = "/cast Rebirth",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:Rebirth",
		["texture"] = "Interface\\Icons\\Spell_Nature_Reincarnation",
	}, -- [31]
	{
	}, -- [32]
	{
	}, -- [33]
	{
	}, -- [34]
	{
	}, -- [35]
	{
	}, -- [36]
	{
		["type"] = "CLICK",
		["name"] = "charge a1",
		["macrotext"] = "/cancelaura hand of protection\n/cast [nostance:1] dire bear form\n/cast [target=arena1] feral charge - bear\n/cast [target=arena1] growl",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:charge a1",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pet_Bear",
	}, -- [37]
	{
		["type"] = "CLICK",
		["name"] = "a2",
		["macrotext"] = "/cancelaura hand of protection\n/cast [nostance:1] dire bear form\n/cast [target=arena2] feral charge - bear\n/cast [target=arena2] growl",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:a2",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pet_Bear",
	}, -- [38]
	{
		["type"] = "CLICK",
		["name"] = "a3",
		["macrotext"] = "/cancelaura hand of protection\n/cast [nostance:1] dire bear form\n/cast [target=arena3] feral charge - bear\n/cast [target=arena3] growl",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:a3",
		["texture"] = "Interface\\Icons\\Ability_Hunter_Pet_Bear",
	}, -- [39]
	{
	}, -- [40]
	{
	}, -- [41]
	{
		["type"] = "CLICK",
		["name"] = "cancel grasp",
		["macrotext"] = "/cancelaura Nature's Grasp",
		["fastTrigger"] = true,
		["action"] = "CLICK BindPadFastMacro:cancel grasp",
		["texture"] = "Interface\\Icons\\Spell_Nature_NaturesWrath",
	}, -- [42]
	["tab"] = 1,
	["PROFILE_Heroes Of Wow_Priestbolado"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [1]
		["profileForTalentGroup"] = {
			1, -- [1]
		},
	},
	["PROFILE_Heroes Of Wow_Laasker"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:charge"] = "ALT-A",
				["CLICK BindPadFastMacro:TAR A1 / nitro"] = "F1",
				["CLICK BindPadFastMacro:root2"] = "CTRL-W",
				["CLICK BindPadFastMacro:a3"] = "ALT-D",
				["CLICK BindPadFastMacro:focus a2"] = "SHIFT-2",
				["CLICK BindPadFastMacro:Rebirth"] = "CTRL-Y",
				["CLICK BindPadFastMacro:200ag"] = "ALT-MOUSEWHEELDOWN",
				["CLICK BindPadFastMacro:Flight Form"] = "NUMPADMULTIPLY",
				["CLICK BindPadFastMacro:focus a3"] = "SHIFT-3",
				["CLICK BindPadFastMacro:Faerie Fire"] = "CTRL-C",
				["CLICK BindPadFastMacro:idol1"] = "ALT-MOUSEWHEELUP",
				["CLICK BindPadFastMacro:FF focus"] = "ALT-G",
				["CLICK BindPadFastMacro:root3"] = "CTRL-E",
				["CLICK BindPadFastMacro:thorns"] = "SHIFT-F1",
				["CLICK BindPadFastMacro:focus a1"] = "SHIFT-1",
				["CLICK BindPadFastMacro:a2"] = "ALT-S",
				["CLICK BindPadFastMacro:innervate pt1"] = "SHIFT-4",
				["CLICK BindPadFastMacro:tar a2 / cinto"] = "F2",
				["CLICK BindPadFastMacro:root1"] = "CTRL-Q",
				["CLICK BindPadFastMacro:tar a3 / capa"] = "F3",
				["CLICK BindPadFastMacro:cancel grasp"] = "7",
			},
		}, -- [1]
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:tar a2"] = "F2",
				["CLICK BindPadFastMacro:thorns"] = "SHIFT-F1",
				["CLICK BindPadFastMacro:TAR A1"] = "F1",
				["CLICK BindPadFastMacro:tar a3"] = "F3",
				["CLICK BindPadFastMacro:root1"] = "CTRL-Q",
				["CLICK BindPadFastMacro:root3"] = "CTRL-E",
				["CLICK BindPadFastMacro:root2"] = "CTRL-W",
			},
		}, -- [2]
		["profileForTalentGroup"] = {
			1, -- [1]
			1, -- [2]
		},
	},
	["PROFILE_Heroes Of Wow_Unstopabull"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [1]
		["profileForTalentGroup"] = {
			1, -- [1]
			2, -- [2]
		},
	},
	["PROFILE_Heroes Of Wow_Easyclass"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [1]
		["profileForTalentGroup"] = {
			1, -- [1]
		},
	},
	["PROFILE_Azeroth Legends_Dopelemon"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:Charge catbear"] = "C",
				["CLICK BindPadFastMacro:FF focus"] = "ALT-G",
				["CLICK BindPadFastMacro:Racial Pounce"] = "SHIFT-G",
				["CLICK BindPadFastMacro:Lacerate/Rake/LF"] = "E",
				["CLICK BindPadFastMacro:root2"] = "CTRL-W",
				["CLICK BindPadFastMacro:a3"] = "ALT-D",
				["CLICK BindPadFastMacro:focus a2"] = "SHIFT-2",
				["CLICK BindPadFastMacro:charge a1"] = "ALT-A",
				["CLICK BindPadFastMacro:innervate pt1"] = "SHIFT-4",
				["CLICK BindPadFastMacro:inspect"] = "NUMPADPLUS",
				["CLICK BindPadFastMacro:FF"] = "B",
				["CLICK BindPadFastMacro:Flight Form"] = "NUMPADMULTIPLY",
				["CLICK BindPadFastMacro:TAR A1 / nitro"] = "F1",
				["CLICK BindPadFastMacro:cancel grasp"] = "7",
				["CLICK BindPadFastMacro:Cancel aura"] = "ALT-F",
				["CLICK BindPadFastMacro:focus a1"] = "SHIFT-1",
				["CLICK BindPadFastMacro:root3"] = "CTRL-E",
				["CLICK BindPadFastMacro:target pet enemy"] = "ALT-V",
				["CLICK BindPadFastMacro:focus a3"] = "SHIFT-3",
				["CLICK BindPadFastMacro:a2"] = "ALT-S",
				["CLICK BindPadFastMacro:Rebirth"] = "CTRL-Y",
				["CLICK BindPadFastMacro:tar a2 / cinto"] = "F2",
				["CLICK BindPadFastMacro:root1"] = "CTRL-Q",
				["CLICK BindPadFastMacro:tar a3 / capa"] = "F3",
				["CLICK BindPadFastMacro:Faerie Fire"] = "CTRL-C",
			},
		}, -- [1]
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:inspect"] = "NUMPADPLUS",
				["CLICK BindPadFastMacro:TAR A1 / nitro"] = "F1",
				["CLICK BindPadFastMacro:tar a2 / cinto"] = "F2",
				["CLICK BindPadFastMacro:target pet enemy"] = "ALT-V",
				["CLICK BindPadFastMacro:Nourish Resto"] = "E",
				["CLICK BindPadFastMacro:tar a3 / capa"] = "F3",
			},
		}, -- [2]
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:inspect"] = "NUMPADPLUS",
				["CLICK BindPadFastMacro:TAR A1 / nitro"] = "F1",
				["CLICK BindPadFastMacro:tar a2 / cinto"] = "F2",
				["CLICK BindPadFastMacro:target pet enemy"] = "ALT-V",
				["CLICK BindPadFastMacro:tar a3 / capa"] = "F3",
			},
		}, -- [3]
		["profileForTalentGroup"] = {
			1, -- [1]
			2, -- [2]
		},
	},
	["triggerOnKeydown"] = true,
	["showHotkey"] = true,
	["PROFILE_Heroes Of Wow_Nevercleanse"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [1]
		{
			{
				["type"] = "CLICK",
				["name"] = "pet",
				["macrotext"] = "/target [@arenapet1, exists][@arenapet2, exists][@arenapet3, exists][harm]\n",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:pet",
				["texture"] = "Interface\\Icons\\Ability_Creature_Cursed_03",
			}, -- [1]
			{
				["type"] = "CLICK",
				["name"] = "sac",
				["macrotext"] = "/cast [@Feralmore] hand of sacrifice\n/cast [@Serpentinng] hand of sacrifice",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:sac",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [2]
			{
				["type"] = "CLICK",
				["name"] = "freedom",
				["macrotext"] = "/cast [@Feralmore] hand of freedom\n/cast [@Serpentinng] hand of freedom",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:freedom",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [3]
			{
				["type"] = "CLICK",
				["name"] = "dispel",
				["macrotext"] = "/cast [@Feralmore] cleanse\n/cast [@Serpentinng] cleanse",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:dispel",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [4]
			{
				["type"] = "CLICK",
				["name"] = "bop",
				["macrotext"] = "/cast [@Feralmore] hand of protection\n/cast [@Serpentinng] hand of protection",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:bop",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [5]
			{
				["type"] = "CLICK",
				["name"] = "pt2 sacred",
				["macrotext"] = "/cast [@Feralmore] sacred shield\n/cast [@Serpentinng] sacred shield",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:pt2 sacred",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [6]
			{
				["type"] = "CLICK",
				["name"] = "MO taunt",
				["macrotext"] = "/cast [@mouseover] hand of reckoning",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:MO taunt",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [7]
			{
				["type"] = "CLICK",
				["name"] = "targ nine",
				["macrotext"] = "/target ",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:targ nine",
				["texture"] = "Interface\\Icons\\Ability_Druid_EarthandSky",
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
				["type"] = "CLICK",
				["name"] = "arena1",
				["macrotext"] = "/target arena1",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:arena1",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [13]
			{
				["type"] = "CLICK",
				["name"] = "arena2",
				["macrotext"] = "/target arena2",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:arena2",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [14]
			{
				["type"] = "CLICK",
				["name"] = "arena3",
				["macrotext"] = "/target arena3",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:arena3",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
				["type"] = "CLICK",
				["name"] = "Target HEITOR",
				["macrotext"] = "/target Koizuk",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:Target HEITOR",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [19]
			{
				["type"] = "CLICK",
				["name"] = "target RAFAA",
				["macrotext"] = "/target Skooby",
				["fastTrigger"] = true,
				["action"] = "CLICK BindPadFastMacro:target RAFAA",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:pt2 sacred"] = "CTRL-Q",
				["CLICK BindPadFastMacro:arena3"] = "F3",
				["CLICK BindPadFastMacro:arena1"] = "F1",
				["CLICK BindPadFastMacro:MO taunt"] = "BUTTON5",
				["CLICK BindPadFastMacro:dispel"] = "B",
				["CLICK BindPadFastMacro:bop"] = "CTRL-T",
				["CLICK BindPadFastMacro:sac"] = "CTRL-R",
				["CLICK BindPadFastMacro:targ nine"] = "BUTTON4",
				["CLICK BindPadFastMacro:freedom"] = "CTRL-E",
				["CLICK BindPadFastMacro:arena2"] = "F2",
				["CLICK BindPadFastMacro:pet"] = "ALT-V",
			},
		}, -- [2]
		{
			{
				["type"] = "CLICK",
				["name"] = "pet",
				["fastTrigger"] = true,
				["macrotext"] = "/target [@arenapet1, exists][@arenapet2, exists][@arenapet3, exists][harm]\n",
				["action"] = "CLICK BindPadFastMacro:pet",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [1]
			{
				["type"] = "CLICK",
				["name"] = "sac",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@Nastinho] hand of sacrifice\n/cast [@Serpentinng] hand of sacrifice",
				["action"] = "CLICK BindPadFastMacro:sac",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [2]
			{
				["type"] = "CLICK",
				["name"] = "freedom",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@Nastinho] hand of freedom\n/cast [@Serpentinng] hand of freedom",
				["action"] = "CLICK BindPadFastMacro:freedom",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [3]
			{
				["type"] = "CLICK",
				["name"] = "dispel",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@Nastinho] cleanse\n/cast [@Serpentinng] cleanse",
				["action"] = "CLICK BindPadFastMacro:dispel",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [4]
			{
				["type"] = "CLICK",
				["name"] = "bop",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@Nastinho] hand of protection\n/cast [@Serpentinng] hand of protection",
				["action"] = "CLICK BindPadFastMacro:bop",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [5]
			{
				["type"] = "CLICK",
				["name"] = "pt2 sacred",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@Nastinho] sacred shield\n/cast [@Serpentinng] sacred shield",
				["action"] = "CLICK BindPadFastMacro:pt2 sacred",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [6]
			{
				["type"] = "CLICK",
				["name"] = "MO taunt",
				["fastTrigger"] = true,
				["macrotext"] = "/cast [@mouseover] hand of reckoning",
				["action"] = "CLICK BindPadFastMacro:MO taunt",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
				["type"] = "CLICK",
				["name"] = "arena1",
				["fastTrigger"] = true,
				["macrotext"] = "/target arena1",
				["action"] = "CLICK BindPadFastMacro:arena1",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [13]
			{
				["type"] = "CLICK",
				["name"] = "arena2",
				["fastTrigger"] = true,
				["macrotext"] = "/target arena2",
				["action"] = "CLICK BindPadFastMacro:arena2",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [14]
			{
				["type"] = "CLICK",
				["name"] = "arena3",
				["fastTrigger"] = true,
				["macrotext"] = "/target arena3",
				["action"] = "CLICK BindPadFastMacro:arena3",
				["texture"] = "Interface\\Icons\\INV_Misc_QuestionMark",
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:pt2 sacred"] = "CTRL-Q",
				["CLICK BindPadFastMacro:arena3"] = "F3",
				["CLICK BindPadFastMacro:arena1"] = "F1",
				["CLICK BindPadFastMacro:MO taunt"] = "BUTTON5",
				["CLICK BindPadFastMacro:dispel"] = "B",
				["CLICK BindPadFastMacro:bop"] = "CTRL-T",
				["CLICK BindPadFastMacro:sac"] = "CTRL-R",
				["CLICK BindPadFastMacro:freedom"] = "CTRL-E",
				["CLICK BindPadFastMacro:arena2"] = "F2",
				["CLICK BindPadFastMacro:pet"] = "ALT-V",
			},
		}, -- [3]
		["profileForTalentGroup"] = {
			2, -- [1]
			2, -- [2]
		},
	},
	["version"] = 1.3,
	["PROFILE_Heroes Of Wow_Howtoferal"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
				["CLICK BindPadFastMacro:Flight Form"] = "NUMPADMULTIPLY",
				["CLICK BindPadFastMacro:Faerie Fire"] = "CTRL-C",
			},
		}, -- [1]
		["profileForTalentGroup"] = {
			1, -- [1]
			2, -- [2]
		},
	},
	["PROFILE_Heroes Of Wow_Maedoazde"] = {
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [1]
		{
			{
			}, -- [1]
			{
			}, -- [2]
			{
			}, -- [3]
			{
			}, -- [4]
			{
			}, -- [5]
			{
			}, -- [6]
			{
			}, -- [7]
			{
			}, -- [8]
			{
			}, -- [9]
			{
			}, -- [10]
			{
			}, -- [11]
			{
			}, -- [12]
			{
			}, -- [13]
			{
			}, -- [14]
			{
			}, -- [15]
			{
			}, -- [16]
			{
			}, -- [17]
			{
			}, -- [18]
			{
			}, -- [19]
			{
			}, -- [20]
			{
			}, -- [21]
			{
			}, -- [22]
			{
			}, -- [23]
			{
			}, -- [24]
			{
			}, -- [25]
			{
			}, -- [26]
			{
			}, -- [27]
			{
			}, -- [28]
			{
			}, -- [29]
			{
			}, -- [30]
			{
			}, -- [31]
			{
			}, -- [32]
			{
			}, -- [33]
			{
			}, -- [34]
			{
			}, -- [35]
			{
			}, -- [36]
			{
			}, -- [37]
			{
			}, -- [38]
			{
			}, -- [39]
			{
			}, -- [40]
			{
			}, -- [41]
			{
			}, -- [42]
			{
			}, -- [43]
			{
			}, -- [44]
			{
			}, -- [45]
			{
			}, -- [46]
			{
			}, -- [47]
			{
			}, -- [48]
			{
			}, -- [49]
			{
			}, -- [50]
			{
			}, -- [51]
			{
			}, -- [52]
			{
			}, -- [53]
			{
			}, -- [54]
			{
			}, -- [55]
			{
			}, -- [56]
			{
			}, -- [57]
			{
			}, -- [58]
			{
			}, -- [59]
			{
			}, -- [60]
			{
			}, -- [61]
			{
			}, -- [62]
			{
			}, -- [63]
			{
			}, -- [64]
			{
			}, -- [65]
			{
			}, -- [66]
			{
			}, -- [67]
			{
			}, -- [68]
			{
			}, -- [69]
			{
			}, -- [70]
			{
			}, -- [71]
			{
			}, -- [72]
			{
			}, -- [73]
			{
			}, -- [74]
			{
			}, -- [75]
			{
			}, -- [76]
			{
			}, -- [77]
			{
			}, -- [78]
			{
			}, -- [79]
			{
			}, -- [80]
			{
			}, -- [81]
			{
			}, -- [82]
			{
			}, -- [83]
			{
			}, -- [84]
			{
			}, -- [85]
			{
			}, -- [86]
			{
			}, -- [87]
			{
			}, -- [88]
			{
			}, -- [89]
			{
			}, -- [90]
			{
			}, -- [91]
			{
			}, -- [92]
			{
			}, -- [93]
			{
			}, -- [94]
			{
			}, -- [95]
			{
			}, -- [96]
			{
			}, -- [97]
			{
			}, -- [98]
			{
			}, -- [99]
			{
			}, -- [100]
			{
			}, -- [101]
			{
			}, -- [102]
			{
			}, -- [103]
			{
			}, -- [104]
			{
			}, -- [105]
			{
			}, -- [106]
			{
			}, -- [107]
			{
			}, -- [108]
			{
			}, -- [109]
			{
			}, -- [110]
			{
			}, -- [111]
			{
			}, -- [112]
			{
			}, -- [113]
			{
			}, -- [114]
			{
			}, -- [115]
			{
			}, -- [116]
			{
			}, -- [117]
			{
			}, -- [118]
			{
			}, -- [119]
			{
			}, -- [120]
			{
			}, -- [121]
			{
			}, -- [122]
			{
			}, -- [123]
			{
			}, -- [124]
			{
			}, -- [125]
			{
			}, -- [126]
			["keys"] = {
			},
		}, -- [2]
		["profileForTalentGroup"] = {
			1, -- [1]
			2, -- [2]
		},
	},
}
