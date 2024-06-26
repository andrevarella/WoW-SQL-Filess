-- Geral:
-- Module GoMove
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (27651, 'GOMove_spell_place');



-- Classes:

-- overrides
UPDATE `spell_script_names` SET `ScriptName` = 'spell_dru_omen_of_clarity_module' WHERE `spell_id` = '16864';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_dru_berserk_module' WHERE `spell_id` = '50334';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_warr_shattering_throw_module' WHERE `spell_id` = '64380';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_warr_shattering_throw_module' WHERE `spell_id` = '65941';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pal_seal_of_righteousness_module' WHERE `spell_id` = '20154';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pal_seal_of_righteousness_module' WHERE `spell_id` = '21084';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pri_mind_control_module' WHERE `spell_id` = '605';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pri_shadowfiend_scaling_module' WHERE `spell_id` = '35661';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pri_shadowfiend_scaling_module' WHERE `spell_id` = '35662';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pri_shadowfiend_scaling_module' WHERE `spell_id` = '35663';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_pri_shadowfiend_scaling_module' WHERE `spell_id` = '35664';


-- * Por enquanto só é usado pelo PW:S de priest Holy
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (83089, 'spell_gen_remove_slow_impairing_auras');

-- ========= CLOTH ==============
-- ▸▸ Mage    ---
-- ▸▸ Priest  ---

-- ▸▸ Warlock ---
-- Cleave do Felguard proca Mortal Wound
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (47994, 'spell_warl_cleave_mortalwound');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (30213, 'spell_warl_cleave_mortalwound');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (30219, 'spell_warl_cleave_mortalwound');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (30223, 'spell_warl_cleave_mortalwound');

-- ========= LEATHER ==============
-- 
-- ▸▸ Druid: ---

-- * Custom Savage Roar que proca ao sair do prowl
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (83122, 'spell_dru_savage_roar');

-- Stampeding Roar (casta Cat)
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (83214, 'spell_druid_stampedingroar');

-- soms ao castar algumas formas
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (83350, 'spell_druid_formsounds');


-- glyph of omen of clarity
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (83293, 'spell_druid_glyph_omen_of_clarity');

-- * Custom Passive Spell - ao ganhar Wrath of Elune, reduz o cd do starfall em 3s (Wrath of Elune só é renovado se o buff é consumido)
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (83253, 'spell_druid_balance_starfall_custom_cdreduction');

-- skull_bash
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (83028, 'spell_druid_skull_bash');

-- wild charge
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (83369, 'spell_druid_wild_charge');
--
-- ========= MAIL ==============
-- 
-- ▸▸ Shaman: ---
--
-- * Custom 3.3.5b AT based Enhance Spell -4s Cooldown Feral Spirit on Stormstrike use
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (83252, 'spell_sha_item_enhance_custom_bonus');
--
-- * Custom Proc que reseta o CD do lava burst
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (83241, 'spell_gen_lava_burst_cd_reset');
--
-- ▸▸ Hunter: ---
-- 
-- ========= PLATE ==============
--
-- ▸▸ Paladin:      ---
-- ▸▸ Warrior:      ---
-- ▸▸ Death Knight: ---



-- ----------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------
-- MOUNTS

-- item template - old mounts
UPDATE `item_template` SET `spellid_2` = '84405' WHERE `entry` = '35225'; -- x-51 - old spell 46197
UPDATE `item_template` SET `spellid_2` = '84405' WHERE `entry` = '49285'; -- x-51 - old spell 46197
UPDATE `item_template` SET `spellid_2` = '84407' WHERE `entry` = '35226'; -- x-51 xt - old spell 46199
UPDATE `item_template` SET `spellid_2` = '84407' WHERE `entry` = '49286'; -- x-51 xt - old spell 46199
UPDATE `item_template` SET `spellid_2` = '84411' WHERE `entry` = '49636'; -- onyxian - old spell 69395
UPDATE `item_template` SET `spellid_2` = '84413' WHERE `entry` = '32458'; -- ashes of alar - old spell 40192
UPDATE `item_template` SET `spellid_2` = '84415' WHERE `entry` = '45693'; -- mimiron - old spell 63796
UPDATE `item_template` SET `spellid_2` = '84417' WHERE `entry` = '30609'; -- nether drake - old spell 37015
UPDATE `item_template` SET `spellid_2` = '84419' WHERE `entry` = '34092'; -- s2 - old spell 44744
UPDATE `item_template` SET `spellid_2` = '84421' WHERE `entry` = '37676'; -- s3 - old spell 49193
UPDATE `item_template` SET `spellid_2` = '84423' WHERE `entry` = '43516'; -- s4 - old spell 58615
UPDATE `item_template` SET `spellid_2` = '84425' WHERE `entry` = '46708'; -- s5 - old spell 64927
UPDATE `item_template` SET `spellid_2` = '84427' WHERE `entry` = '46171'; -- s6 - old spell 65439
UPDATE `item_template` SET `spellid_2` = '84429' WHERE `entry` = '47840'; -- s7 - old spell 67336
UPDATE `item_template` SET `spellid_2` = '84431' WHERE `entry` = '50435'; -- s8 - old spell 71810
UPDATE `item_template` SET `spellid_2` = '84480' WHERE `entry` = '44842'; -- red dragonhawk - old spell 61997
UPDATE `item_template` SET `spellid_2` = '84482' WHERE `entry` = '44843'; -- blue dragonhawk - old spell 61996
UPDATE `item_template` SET `spellid_2` = '84437' WHERE `entry` = '44814'; -- sunreaver drag - old spell 66088
UPDATE `item_template` SET `spellid_2` = '84439' WHERE `entry` = '46813'; -- silver covenant hi - old spell 66087
UPDATE `item_template` SET `spellid_2` = '84443' WHERE `entry` = '33999'; -- cenarion war hi - old spell 43927
UPDATE `item_template` SET `spellid_2` = '84445' WHERE `entry` = '44168'; -- time-lost pr - old spell 60002
UPDATE `item_template` SET `spellid_2` = '84447' WHERE `entry` = '44151'; -- blue proto - old spell 59996
UPDATE `item_template` SET `spellid_2` = '84449' WHERE `entry` = '44160'; -- red proto - old spell 59961
UPDATE `item_template` SET `spellid_2` = '84451' WHERE `entry` = '45801'; -- ironbound pr - old spell 63956
UPDATE `item_template` SET `spellid_2` = '84453' WHERE `entry` = '45802'; -- rusted proto - old spell 63963
UPDATE `item_template` SET `spellid_2` = '84458' WHERE `entry` = '44177'; -- violet proto - old spell 60024
UPDATE `item_template` SET `spellid_2` = '84460' WHERE `entry` = '44175'; -- plagued proto - old spell 60021
UPDATE `item_template` SET `spellid_2` = '84462' WHERE `entry` = '44164'; -- black proto - old spell 59976
UPDATE `item_template` SET `spellid_2` = '84464' WHERE `entry` = '44707'; -- green proto - old spell 61294
UPDATE `item_template` SET `spellid_2` = '84466' WHERE `entry` = '44178'; -- albino drake - old spell 60025
UPDATE `item_template` SET `spellid_2` = '84468' WHERE `entry` = '43951'; -- bronze drake - old spell 59569
UPDATE `item_template` SET `spellid_2` = '84470' WHERE `entry` = '43952'; -- azure drake - old spell 59567
UPDATE `item_template` SET `spellid_2` = '84476' WHERE `entry` = '43954'; -- twilight drake - old spell 59571
UPDATE `item_template` SET `spellid_2` = '84478' WHERE `entry` = '43986'; -- black drake - old spell 59650
UPDATE `item_template` SET `spellid_2` = '84480' WHERE `entry` = '43955'; -- red drake - old spell 59570
UPDATE `item_template` SET `spellid_2` = '84482' WHERE `entry` = '43953'; -- blue drake - old spell 59568
UPDATE `item_template` SET `spellid_2` = '84484' WHERE `entry` = '32857'; -- onyx netherwing - old spell 41513
UPDATE `item_template` SET `spellid_2` = '84486' WHERE `entry` = '32860'; -- purple netherwing - old spell 41516
UPDATE `item_template` SET `spellid_2` = '84488' WHERE `entry` = '32859'; -- cobalt netherwing - old spell 41515
UPDATE `item_template` SET `spellid_2` = '84490' WHERE `entry` = '32862'; -- violet netherwing - old spell 41518
UPDATE `item_template` SET `spellid_2` = '84492' WHERE `entry` = '32861'; -- veridian netherwing - old spell 41517
UPDATE `item_template` SET `spellid_2` = '84494' WHERE `entry` = '32858'; -- azure netherwing - old spell 41514
UPDATE `item_template` SET `spellid_2` = '84496' WHERE `entry` = '34061'; -- turbo-charged - old spell 44151
UPDATE `item_template` SET `spellid_2` = '84498' WHERE `entry` = '44558'; -- magnificent flying - old spell 61309
UPDATE `item_template` SET `spellid_2` = '84500' WHERE `entry` = '54797'; -- frosty flying - old spell 75596
UPDATE `item_template` SET `spellid_2` = '84502' WHERE `entry` = '54798'; -- flying carpet - old spell 75597
UPDATE `item_template` SET `spellid_2` = '84504' WHERE `entry` = '32316'; -- purple nether - old spell 39801
UPDATE `item_template` SET `spellid_2` = '84506' WHERE `entry` = '32319'; -- blue nether - old spell 39803
UPDATE `item_template` SET `spellid_2` = '84508' WHERE `entry` = '32318'; -- silver nether ray - old spell 39802
UPDATE `item_template` SET `spellid_2` = '84510' WHERE `entry` = '32317'; -- red nether ray - old spell 39800
UPDATE `item_template` SET `spellid_2` = '84512' WHERE `entry` = '32314'; -- green nether ray - old spell 39798


-- x-53 e Hippogryph 100% - usavel fora de Outland/Northrend
UPDATE `spell_script_names` SET `ScriptName` = 'spell_x53_touring_rocket_new' WHERE `spell_id` = '75973';
UPDATE `spell_script_names` SET `ScriptName` = 'spell_blazing_hippogryph_new' WHERE `spell_id` = '74856';


-- mounts tbc
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84504, 'spell_NETHERRAY1');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84506, 'spell_NETHERRAY2');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84508, 'spell_NETHERRAY3');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84510, 'spell_NETHERRAY4');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84512, 'spell_NETHERRAY5');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84413, 'spell_ashes');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84443, 'spell_CENARIONWAR');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84484, 'spell_NETHERWING1');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84486, 'spell_NETHERWING2');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84488, 'spell_NETHERWING3');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84490, 'spell_NETHERWING4');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84492, 'spell_NETHERWING5');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84494, 'spell_NETHERWING6');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84496, 'spell_TURBOCHARGED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84405, 'spell_X51');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84407, 'spell_X51XT');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84417, 'spell_s1');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84419, 'spell_s2');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84421, 'spell_s3');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84423, 'spell_s4');

-- mounts wotlk
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84425, 'spell_s5');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84427, 'spell_s6');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84429, 'spell_s7');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84431, 'spell_s8');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84411, 'spell_onyxian');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84415, 'spell_mimiron');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84433, 'spell_redDRAGONHAWK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84435, 'spell_BLUEDRAGONHAWK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84437, 'spell_SUNREAVERDRAG');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84439, 'spell_SILVERCOVENANT');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84441, 'spell_ARGENTHIPPO');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84445, 'spell_TIMELOST');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84447, 'spell_BLUEPROTO');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84449, 'spell_REDPROTO');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84451, 'spell_IRONBOUNDPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84453, 'spell_RUSTEDPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84458, 'spell_VIOLETPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84460, 'spell_PLAGUEDPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84462, 'spell_BLACKPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84464, 'spell_GREENPROTODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84466, 'spell_ALBINODRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84468, 'spell_BRONZEDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84470, 'spell_AZUREDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84472, 'spell_TWILIGHTPURPLEDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84476, 'spell_TWILIGHTDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84478, 'spell_BLACKDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84480, 'spell_REDDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84482, 'spell_BLUEDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84498, 'spell_MAGNIFICENTCARPET');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84500, 'spell_FROSTYFLYING');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84502, 'spell_FLYINGCARPET');


-- -------------------------------------------------------------------------------------------------------------------------------------
-- MOUNTS CUSTOM/ACIMA DO WOTLK: -------------------------------------------------------------------------------------------------------
-- mounts cata
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84054, 'spell_VICIOUSGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84057, 'spell_RUTHLESSGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84060, 'spell_CATAGLAD');


INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84063, 'spell_VICIOUSGLADMOTTLED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84084, 'spell_VICIOUSGLADBRONZE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84066, 'spell_VICIOUSGLADBLUE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84069, 'spell_VICIOUSGLADAZURE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84072, 'spell_VICIOUSGLADAQUA');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84075, 'spell_VICIOUSGLADEMERALD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84078, 'spell_VICIOUSGLADALBINO');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84081, 'spell_VICIOUSGLADBLACK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84087, 'spell_VICIOUSGLADPINK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84090, 'spell_VICIOUSGLADRED');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84093, 'spell_LEGIONDARKBLUEGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84096, 'spell_LEGIONBLUEGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84102, 'spell_LEGIONGLADWHITE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84105, 'spell_LEGIONGLADEMERALD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84108, 'spell_LEGIONGLADGREEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84111, 'spell_LEGIONGLADBLACK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84114, 'spell_LEGIONGLADRED');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84010, 'spell_tyraelcharger');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84299, 'spell_CATAFLYINGPANTHER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84157, 'spell_WINGEDGUARDIAN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84132, 'spell_FELDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84117, 'spell_BLAZINGDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84120, 'spell_LIFEBINDERHANDMAIDEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84123, 'spell_TWILIGHTHARBINGER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84166, 'spell_PUREBLOODFIREHAWK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84169, 'spell_FELFIREHAWK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84172, 'spell_CORRUPTEDFIREHAWK');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts mop --------------------------------------------------------------------------------------------------------------------------
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84254, 'spell_S12GLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84257, 'spell_S13GLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84260, 'spell_S14GLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84263, 'spell_S15GLAD');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84221, 'spell_HEAVENLYONYX');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84224, 'spell_HEAVENLYGOLDEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84227, 'spell_HEAVENLYBLUE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84230, 'spell_HEAVENLYGREEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84233, 'spell_HEAVENLYRED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84236, 'spell_THUNDERINGCOBALT');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84239, 'spell_RAJANIWARSERPENT');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84242, 'spell_THUNDERINGAUGUST');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84245, 'spell_THUNDERINGJADE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84248, 'spell_THUNDERINGONYX');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84251, 'spell_THUNDERINGRUBY');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84402, 'spell_ASTRALCLOUD');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84182, 'spell_JCPANTHERBLACK');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84185, 'spell_JCPANTHERRED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84188, 'spell_JCPANTHERBLUE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84191, 'spell_JCPANTHERGREEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84194, 'spell_JCPANTHERYELLOW');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84160, 'spell_HEARTHSTEED');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts wod --------------------------------------------------------------------------------------------------------------------------
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84197, 'spell_DREADRAVEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84302, 'spell_RAVAGERMOUNT');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84218, 'spell_WARFORGEDNIGHTMARE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84679, 'spell_PURPLEDREADRAVEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84163, 'spell_CINDERMANECHARGER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84126, 'spell_INFINITETIMEREAVER');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts legion -----------------------------------------------------------------------------------------------------------------------
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84033, 'spell_VINDICTIVEGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84036, 'spell_FEARLESSGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84039, 'spell_CRUELGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84042, 'spell_FEROCIOUSGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84045, 'spell_FIERCEGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84048, 'spell_DOMINANTGLAD');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84200, 'spell_KARAZHANDRAKE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84147, 'spell_HUNTMASTERLOYALWOLFHAWK1');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84151, 'spell_HUNTMASTERLOYALWOLFHAWK2');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84154, 'spell_HUNTMASTERLOYALWOLFHAWK3');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84175, 'spell_FELHOUNDMOUNTRED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84178, 'spell_FELHOUNDMOUNTPURPLE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84305, 'spell_DREADSTEEDGREEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84308, 'spell_DREADSTEEDRED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84311, 'spell_DREADSTEEDPURPLE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84293, 'spell_RAGINGTEMPESTFIRE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84296, 'spell_RAGINGTEMPESTRESTO');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts bfa --------------------------------------------------------------------------------------------------------------------------
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84266, 'spell_DREADGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84269, 'spell_SINISTERGLADIATOR');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84272, 'spell_NOTORIOUSGLADIATOR');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84275, 'spell_CORRUPTEDGLADIATOR');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84206, 'spell_GLACIALTIDESTORM');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84209, 'spell_TIDESTORMGREEN');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84212, 'spell_TIDESTORMPURPLE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84215, 'spell_TIDESTORMRED');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84373, 'spell_SQUEAKERS');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84129, 'spell_OBSIDIANWORLDBREAKER');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts shadowlands ------------------------------------------------------------------------------------------------------------------
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84015, 'spell_sinfulglad');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84021, 'spell_COSMICGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84024, 'spell_ETERNALGLAD');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84027, 'spell_UNCHAINEDGLAD');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84278, 'spell_SOULTWISTEDDEATHWALKER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84281, 'spell_SINTOUCHEDDEATHWALKER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84284, 'spell_SOULTWISTEDDEATHWALKERRECOLOR');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84287, 'spell_WASTEWARPEDDEATHWALKER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84290, 'spell_RESTORATIONDEATHWALKER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84203, 'spell_VENGEANCE');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84135, 'spell_TAZAVESHGEARGLIDER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84138, 'spell_PILFEREDGEARGLIDER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84141, 'spell_CARTELMASTERGEARGLIDER');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (84144, 'spell_CARTELMASTERGEARGLIDERSILVER');

-- mounts DF/SL/BFA
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85099, 'spell_ASHADAR');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85110, 'spell_DIVINEKISSOFOHNAHRA');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85113, 'spell_SUNWARMEDFURLINE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85116, 'spell_VULPINEFAMILIAR');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85120, 'spell_PALADINHIGHLORDPURPLE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85126, 'spell_PALADINHIGHLORDBLUE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85123, 'spell_PALADINHIGHLORDRED');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85130, 'spell_PALADINHIGHLORDYELLOW');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85133, 'spell_VULPINEFAMILIARYELLOW');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85136, 'spell_ZENETHATCHLING');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85141, 'spell_ZENETHATCHLINGBLUE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85149, 'spell_HIGHLAND_DRAKE_GREY');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85152, 'spell_HIGHLAND_DRAKE_YELLOW');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85155, 'spell_HIGHLAND_DRAKE_RED');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85158, 'spell_HIGHLAND_DRAKE_BLUE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85165, 'spell_HIGHLAND_DRAKE_BLACK');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85168, 'spell_HIGHLAND_DRAKE_GREEN');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85161, 'spell_NZOTHSERP');

-- -------------------------------------------------------------------------------------------------------------------------------------
-- mounts dragonflight
-- Mounts novas x/03/2023

-- sabers

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES
(84634, 'spell_BANLU'),
(84637, 'spell_LUMINOUSSTAR'),
(84649, 'spell_MYSTICRSABER'),
(84640, 'spell_ARCANISTMANASABER'),
(84643, 'spell_SILVERWINDLARION'),
(84646, 'spell_HIGHWINDDARKMANE'),
(84652, 'spell_WENLO'),
(85099, 'spell_ASHADAR');

-- flying horses
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`)
VALUES 
(84515, 'spell_GHASTLYCHARGER'),
(84709, 'spell_TEMPESTSKYTALION'),
(85093, 'spell_SWIFTWINDSTEED');

-- birds
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84655, 'spell_CLUTCHOFJIKUN');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84658, 'SPELL_CLUTCH_OF_HALI');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84661, 'SPELL_CRIMSON_PHOENIX');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84670, 'SPELL_ASHEN_PHOENIX');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84712, 'SPELL_VIOLET_PHOENIX');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84664, 'SPELL_FLAMEWARD_GRYPH');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84667, 'SPELL_TELDRASSIL_GRYPH');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84676, 'SPELL_STORMCROW');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84673, 'SPELL_SOLAR_SPIREHAWK');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84682, 'SPELL_SHARKBAIT');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84685, 'SPELL_SQUAWKS');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84691, 'SPELL_QUAWKS');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84688, 'SPELL_BLU');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84694, 'SPELL_MURDEROUS_OMEN');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84706, 'SPELL_SPECTRAL_PHOENIX');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84703, 'SPELL_DARK_PHOENIX');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84715, 'SPELL_SAPPHIRE_SKYBLAZER');
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES (84718, 'SPELL_AMBER_SKYBLAZER');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES
(84700, 'SPELL_ARMORED_RED_DRAGONHAWK'),
(84697, 'SPELL_ARMORED_BLUE_DRAGONHAWK'),
(85076, 'SPELL_GRAND_ARMORED_GRYPHON'),
(85079, 'SPELL_GRAND_ARMORED_WYVERN');

-- rockets
INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES
(84721, 'SPELL_ORGRIMMAR_INTERCEPTOR'),
(84724, 'SPELL_STORMWIND_SKYCHASER'),
(84727, 'SPELL_DREADWAKE'),
(84730, 'SPELL_DARKMOON_DIRIGIBLE'),
(84742, 'SPELL_AERIAL_UNIT_R21'),
(84739, 'SPELL_EXPLORER_JUNGLE_HOPPER'),
(84733, 'SPELL_DEPLETED_KYPARIUM_ROCKET'),
(84736, 'SPELL_GEOSYNC_WORLD_SPINNER'),
(84996, 'SPELL_JADE_PANDAREN_KITE_STRING'),
(85003, 'SPELL_PANDAREN_KITE_ALLIANCE'),
(85000, 'SPELL_PANDAREN_KITE_HORDE'),
(84770, 'SPELL_BLUE_FLYING_CLOUD'),
(84766, 'SPELL_RED_FLYING_CLOUD'),
(84773, 'SPELL_GOLD_FLYING_CLOUD'),
(84763, 'SPELL_ARCHMAGE_PRISM_DISCFROST'),
(84760, 'SPELL_ARCHMAGE_PRISM_DISCFIRE'),
(84757, 'SPELL_ARCHMAGE_PRISM_DISCARCANE');

-- outros
INSERT INTO acore_world.spell_script_names(spell_id, ScriptName) VALUES
(84800, 'SPELL_THE_HIVEMIND'),
(84803, 'SPELL_FATHOM_DWELLER'),
(84535, 'SPELL_SHAMAN_MOUNT_ENHANCE'),
(84780, 'SPELL_SHAMAN_MOUNT_BLUE'),
(84783, 'SPELL_SHAMAN_MOUNT_PURPLE'),
(84776, 'SPELL_SHAMAN_MOUNT_SAND'),
(84786, 'SPELL_IRON_SKYREAVER'),
(84790, 'SPELL_GRUESOME_FLAYEDWING'),
(84793, 'SPELL_SILVERTIP_DREDWING'),
(85085, 'SPELL_UNDERCITY_PLAGUEBAT'),
(84796, 'SPELL_HARVESTER_DREDWING'),
(85082, 'SPELL_ARMORED_BLOODWING');

-- outros
INSERT INTO acore_world.spell_script_names(spell_id, ScriptName) VALUES
(84826, 'SPELL_HEART_OF_THE_ASPECTS'),
(84830, 'SPELL_ABYSS_WORM'),
(84833, 'SPELL_RIDDLER_MIND_WORM'),
(84836, 'SPELL_NAZJATAR_BLOOD_SERPENT'),
(84823, 'SPELL_MAGENTA_CLOUD_SERPENT'),
(84840, 'SPELL_NETHER_GORGED_GREATWYRM'),
(84846, 'SPELL_NETHER_GORGED_GREATWYRM_BLACK'),
(84843, 'SPELL_NETHER_GORGED_GREATWYRM_SILVER'),
(84850, 'SPELL_NETHER_GORGED_GREATWYRM_PURPLE');

-- dragoes
INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84853, 'SPELL_STEAMSCALE_INCINERATOR');
INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84856, 'SPELL_TANGLED_DREAMWEAVER');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84860, 'SPELL_BATTLELORD_BLOODTHIRSTY_1');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84863, 'SPELL_BATTLELORD_BLOODTHIRSTY_2');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84866, 'SPELL_BATTLELORD_BLOODTHIRSTY_3');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84870, 'SPELL_RED_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84873, 'SPELL_BLUE_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84876, 'SPELL_BLACK_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84880, 'SPELL_RAZORSCALE_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84883, 'SPELL_RUSTED_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84886, 'SPELL_BLACK_KORKRON_PROTO_DRAKE');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84890, 'SPELL_SPAWN_OF_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84893, 'SPELL_TIME_LOST_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84896, 'SPELL_GREEN_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84903, 'SPELL_VIOLET_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84900, 'SPELL_PLAGUED_GALAKRAS');

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES (84910, 'SPELL_MOTTLED_DRAKE');


INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`)
VALUES 
    (84913, 'SPELL_TWILIGHT_AVENGER'),
    (84916, 'SPELL_EMERALD_DRAKE'),
    (84920, 'SPELL_ENCHANTED_FEY_DRAGON'),
    (84923, 'SPELL_UNCORRUPTED_VOIDWING'),
    (84926, 'SPELL_VOID_DRAGON_MOUNT'),
    (84953, 'SPELL_VALARJAR_STORMWING'),
    (84936, 'SPELL_ISLAND_THUNDERSCALE'),
    (84099, 'SPELL_TEAL_STORMDRAGON'),
    (84956, 'SPELL_DEATHLORD_VILEBROOD_GREEN'),
    (84960, 'SPELL_DEATHLORD_VILEBROOD_BLUE'),
    (84963, 'SPELL_DEATHLORD_VILEBROOD_RED'),
    (84966, 'SPELL_TARECGOSA'),
    (84970, 'SPELL_DRAKE_OF_EAST_WIND'),
    (84973, 'SPELL_DRAKE_OF_SOUTH_WIND'),
    (84976, 'SPELL_DRAKE_OF_FOUR_WINDS'),
    (84980, 'SPELL_DRAKE_OF_NORTH_WIND'),
    (84983, 'SPELL_SYLVERIAN_DREAMER'),
    (84986, 'SPELL_SYLVERIAN_DREAMER_GREEN'),
    (84990, 'SPELL_SYLVERIAN_DREAMER_RED'),
    (84993, 'SPELL_SYLVERIAN_DREAMER_ORANGE');
	
-- pvp

INSERT INTO acore_world.spell_script_names(spell_id, ScriptName)
VALUES
(85016, 'SPELL_CUSTOM_MALEVOLENT_CLOUD_SERP'),
(85023, 'SPELL_CUSTOM_TYRANNICAL_CLOUD_SERP'),
(85036, 'SPELL_CUSTOM_VIOLET_GLADIATOR_SERP'),
(85033, 'SPELL_CUSTOM_GREEN_GLADIATOR_SERP'),
(85040, 'SPELL_CUSTOM_VINDICTIVE_GLAD'),
(85043, 'SPELL_CUSTOM_FEARLESS_GLAD'),
(85046, 'SPELL_CUSTOM_CRUEL_GLAD'),
(85050, 'SPELL_CUSTOM_DOMINANT_GLAD'),
(85090, 'SPELL_DEMONIC_GLADIATOR_GLAD'),
(85053, 'SPELL_BFA_PALE_PROTO_DRAKE'),
(84030, 'SPELL_UNCHAINED_GLAD_SOULEATER_GREEN'),
(85056, 'SPELL_CRIMSON_GLADIATOR_DRAKE'),
(85060, 'SPELL_DF_S2_GLAD'),
(85063, 'SPELL_DF_S3_GLAD'),
(85066, 'SPELL_DF_S4_GLAD'),
(85070, 'SPELL_DF_S5_GLAD'),
(85073, 'SPELL_DF_S6_GLAD');


INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (84633, 'spell_MECHAGONPEACEK');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85204, 'spell_GROTTONETHERWING');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85198, 'spell_ELEMENTIUMDRAKE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85177, 'spell_AZUREWORLDCH');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85195, 'spell_AMALGAMRAGE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85201, 'spell_GRAVEWINGPALE');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85180, 'spell_GRAVEWINGSINFALL');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85183, 'spell_GRAVEWINGOBSIDIAN');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85189, 'spell_RAPTORASWOOPER');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85186, 'spell_MAWDAPTEDRAPTORA');
INSERT INTO `acore_world`.`spell_script_names` (`spell_id`, `ScriptName`) VALUES (85192, 'spell_DESERTWINGHUNTER');













