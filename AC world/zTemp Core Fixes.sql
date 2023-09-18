

-- Core Fixes (apos atualizar o core, deleta-los)



-- Fix Scourlord Tyrannus bug em Pit of Saron (se wipar no ultimo boss, o boss some)
-- [flags_extra tava 3221225472] immunity_knockback e +2147483648	HARD_RESET
-- No update fica apenas IMMUNITY_KNOCKBACK
UPDATE `creature_template` SET `flags_extra` = `flags_extra` &~ 2147483648 WHERE `entry` IN (36658);


-- new ones 02 08 23
--fix(DB/Creature): Change CombatReach and Bounding Radius for Doom Lord Kazzak
UPDATE `creature_model_info` SET `BoundingRadius`=9, `CombatReach`=15.75 WHERE `DisplayID`=17887;


-- revert(DB/Warden): Remove the Warden checks recently added Because they cause random dcs
DELETE FROM `warden_checks` WHERE `id` IN (793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811);


-- fix(DB/BlackrockSpire): Add teleport trigger for crater
DELETE FROM `areatrigger_teleport` WHERE `ID` = 2068;
INSERT INTO `areatrigger_teleport` (`ID`, `Name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (2068, 'Blackrock Spire - Jump Exit', 0, -7558.39, -1309.43, 248.454, 1.5708);


-- Fix typo in wp show command description. 
SET @HELP_TEXT := 'Syntax: .wp show $option\nOptions:\non $pathid (or selected creature with loaded path) - Show path\noff - Hide path\ninfo $selected_waypoint - Show info for selected waypoint.';
UPDATE `command` SET `help` = @HELP_TEXT WHERE `name` = 'wp show';



-- item_template trinkets:

-- Soul Preserver
UPDATE `item_template` SET `spellcooldown_1` = -1 WHERE (`entry` = 37111);
-- The General's Heart
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcooldown_2` = -1, `spellcooldown_3` = -1 WHERE (`entry` = 45507);
-- blood of the old god
UPDATE `item_template` SET `spellcooldown_2` = -1, `spellcooldown_3` = -1 WHERE (`entry` = 45522);
-- Sif's Remembrance
UPDATE `item_template` SET `spellcooldown_2` = -1, `spellcooldown_3` = -1 WHERE (`entry` = 45929);
-- Mjolnir Runestone
UPDATE `item_template` SET `spellcooldown_2` = -1, `spellcooldown_3` = -1 WHERE (`entry` = 45931);
-- Elemental Focus Stone
UPDATE `item_template` SET `spelltrigger_2` = 0, `spellcooldown_2` = -1, `spellcooldown_3` = -1 WHERE (`entry` = 45866);
-- Dying Curse
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcategorycooldown_1` = 45000 WHERE (`entry` = 40255);
-- Extract of Necromantic Power
UPDATE `item_template` SET `spellcooldown_1` = -1 WHERE (`entry` = 40373);
-- Je'Tze's Bell
UPDATE `item_template` SET `spellcooldown_1` = 0, `spellcategorycooldown_1` = -1 WHERE (`entry` = 37835);
-- Embrace of the Spider
UPDATE `item_template` SET `spellcooldown_1` = 0, `spellcategorycooldown_1` = -1 WHERE (`entry` = 39229);
-- Meteorite Whetstone
UPDATE `item_template` SET `spellcooldown_1` = 0 WHERE (`entry` = 37390);
-- Spark of Life
UPDATE `item_template` SET `spellcooldown_1` = 0 WHERE (`entry` = 37657);
-- Forge Ember
UPDATE `item_template` SET `spellcooldown_1` = 0 WHERE (`entry` = 37660);

-- reign of the dead
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcategorycooldown_1` = 2000 WHERE (`entry` = 47477);
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcategorycooldown_1` = 2000 WHERE (`entry` = 47316);
-- reign of the unliving
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcategorycooldown_1` = 2000 WHERE (`entry` = 47182);
UPDATE `item_template` SET `spellcooldown_1` = -1, `spellcategorycooldown_1` = 2000 WHERE (`entry` = 47188);

-- Dislodged Foreign Object
UPDATE `item_template` SET `spellppmRate_1` = 0 WHERE (`entry` = 50348);
-- Dislodged Foreign Object
UPDATE `item_template` SET `spellppmRate_1` = 0 WHERE (`entry` = 50353);

-- Charred Twilight Scale
UPDATE `item_template` SET `spellppmRate_1` = 0 WHERE (`entry` = 54588);
-- Charred Normal (tava faltando no commit original)
UPDATE `item_template` SET `spellppmRate_1` = 0 WHERE (`entry` = 54572);



-- spell_proc_events

-- Tiny Abomination in a Jar 277
UPDATE `spell_proc_event` SET `CustomChance` = 45 WHERE `entry` = 71545; 
-- Deathbringer's Will 277
-- UPDATE `spell_proc_event` SET `CustomChance` = 35 WHERE `entry` = 71562;

-- Purified Lunar Dust
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 71585;
-- Show of Faith
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 64738;

-- Blood of the Old God
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 64792;
-- Flow of Knowledge
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 62114;

-- Tears of Bitter Anguish
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 58901;

-- Mirror of Truth / Coren's Chromium Coaster
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 33648;


-- Je'Tze's Bell
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 49622;
-- Pyrite Infuser
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 65013;

-- Sif's Remembrance
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 65002;
-- Anvil of Titans
-- UPDATE `spell_proc_event` SET `Cooldown` = 50000 WHERE `entry` = 62115;


-- Banner of Victory
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 67672;
-- Mirror of Truth
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 33648;


-- Essence of Gossamer
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 60221;
-- Spark of Life
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 60519;
-- Jouster's Fury
UPDATE `spell_proc_event` SET `Cooldown` = 45000 WHERE `entry` = 63251;



-- fix(DB/loot): Karazhan Boss Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` IN (16152, 16457, 17521, 18168, 15691, 15687, 15688, 16524, 15689, 15690)) AND (`Item` IN (29434, 23809, 30480));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(16152, 23809, 0, 8, 0, 1, 0, 1, 1, 'Attumen the Huntsman - Schematic: Stabilized Eternium Scope'),
(16152, 30480, 0, 1, 0, 1, 0, 1, 1, 'Attumen the Huntsman - Fiery Warhorse\'s Reins'),
(15687, 29434, 0, 100, 0, 1, 0, 1, 1, 'Moroes - Badge of Justice'),
(16457, 29434, 0, 100, 0, 1, 0, 1, 1, 'Maiden of Virtue - Badge of Justice'),
(17521, 29434, 0, 100, 0, 1, 0, 1, 1, 'The Big Bad Wolf - Badge of Justice'),
(18168, 29434, 0, 100, 0, 1, 0, 1, 1, 'The Crone - Badge of Justice'),
(15691, 29434, 0, 100, 0, 1, 0, 1, 1, 'The Curator - Badge of Justice'),
(15688, 29434, 0, 100, 0, 1, 0, 1, 1, 'Terestian Illhoof - Badge of Justice'),
(16524, 29434, 0, 100, 0, 1, 0, 1, 1, 'Shade of Aran - Badge of Justice'),
(15689, 29434, 0, 100, 0, 1, 0, 1, 1, 'Netherspite - Badge of Justice'),
(15690, 29434, 0, 100, 0, 1, 0, 2, 2, 'Prince Malchezaar - Badge of Justice');

DELETE FROM `gameobject_loot_template` WHERE (`Entry` = 20712) AND (`Item` IN (29434));
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(20712, 29434, 0, 100, 0, 1, 0, 1, 1, 'Dust Covered Chest - Badge of Justice');

DELETE FROM `reference_loot_template` WHERE (`Entry` = 12001) AND (`Item` IN (28745, 28746, 28747, 28748, 28749, 28750, 28751, 28752, 28753, 28754, 28755, 28756));
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(12001, 28745, 0, 0, 0, 1, 1, 1, 1, 'Mithril Chain of Heroism'),
(12001, 28746, 0, 0, 0, 1, 1, 1, 1, 'Fiend Slayer Boots'),
(12001, 28747, 0, 0, 0, 1, 1, 1, 1, 'Battlescar Boots'),
(12001, 28748, 0, 0, 0, 1, 1, 1, 1, 'Legplates of the Innocent'),
(12001, 28749, 0, 0, 0, 1, 1, 1, 1, 'King\'s Defender'),
(12001, 28750, 0, 0, 0, 1, 1, 1, 1, 'Girdle of Treachery'),
(12001, 28751, 0, 0, 0, 1, 1, 1, 1, 'Heart-Flame Leggings'),
(12001, 28752, 0, 0, 0, 1, 1, 1, 1, 'Forestlord Striders'),
(12001, 28753, 0, 0, 0, 1, 1, 1, 1, 'Ring of Recurrence'),
(12001, 28754, 0, 0, 0, 1, 1, 1, 1, 'Triptych Shield of the Ancients'),
(12001, 28755, 0, 0, 0, 1, 1, 1, 1, 'Bladed Shoulderpads of the Merciless'),
(12001, 28756, 0, 0, 0, 1, 1, 1, 1, 'Headdress of the High Potentate');


-- ACHIEVEMENT_CRITERIA_TYPE_OWN_RANK
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (707, 708, 709, 710, 711, 712, 713, 714, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(707, 23, 14, 0, ''),
(708, 23, 13, 0, ''),
(709, 23, 12, 0, ''),
(710, 23, 11, 0, ''),
(711, 23, 10, 0, ''),
(712, 23, 9, 0, ''),
(713, 23, 8, 0, ''),
(714, 23, 7, 0, ''),
(721, 23, 6, 0, ''),
(722, 23, 5, 0, ''),
(723, 23, 4, 0, ''),
(724, 23, 3, 0, ''),
(725, 23, 2, 0, ''),
(726, 23, 1, 0, ''),
(727, 23, 28, 0, ''),
(728, 23, 27, 0, ''),
(729, 23, 26, 0, ''),
(730, 23, 25, 0, ''),
(731, 23, 24, 0, ''),
(732, 23, 23, 0, ''),
(733, 23, 22, 0, ''),
(734, 23, 21, 0, ''),
(735, 23, 20, 0, ''),
(736, 23, 19, 0, ''),
(737, 23, 18, 0, ''),
(738, 23, 17, 0, ''),
(739, 23, 16, 0, ''),
(740, 23, 15, 0, '');


-- kz chess crossfaction
UPDATE `creature_template` SET `npcflag` = `npcflag` |1 WHERE `entry` IN (17469,17211,21748,21664,21750,21683,21747,21682,21726,21160,21752,21684);