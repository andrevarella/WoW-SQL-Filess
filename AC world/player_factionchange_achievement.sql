-- Mounts:
-- Winterspring Frostsaber / Venomhide Ravasaur faction -1
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id` = '3356';

-- Asd:


-- Custom Achievements:

-- We're Going to Need More Saddles (150 mounts) + mount kite
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10072, 10071);

-- Mount Parade (200 mounts) + Armored Red Dragonhawk(horde) / Armored Blue Dragonhawk(ally)
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10074, 10073);

-- Mountacular (250 mounts) + Felfire Hawk
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10076, 10075);

-- Lord of the Reins (300 mounts + title) + Heavenly Azure Cloud Serpent
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10078, 10077);

-- No Stable Big Enough (350 mounts) + Biting Frostshard Core
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10080, 10079);

-- A Horde of Hoofbeats (400 mounts) + Frenzied Feltalon
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10082, 10081);

-- Thanks for the Carry! (500 mounts) + Otterworldly Ottuk Carrier ou Otto
INSERT INTO `acore_world`.`player_factionchange_achievement`(`alliance_id`, `horde_id`) VALUES (10084, 10083);
