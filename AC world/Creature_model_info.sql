DELETE FROM `spell_proc_event` WHERE `entry` = '71845';

UPDATE `command` SET `security` = '4' WHERE `name` = 'dismount';

-- Bosses:

-- ICC:

-- lord marrowgar 31119
UPDATE `creature_model_info` SET `BoundingRadius` = '2.9',`CombatReach` = '11.9' WHERE `DisplayID` = '31119';
-- Lady Deathwhisper 30893
-- Deathbringer Saurfang 30790
-- Festergut, 31006
-- Rotface, 31005
-- Professor Putricide, 30881
-- Sindragosa 30362
UPDATE `creature_model_info` SET `BoundingRadius` = '0,75',`CombatReach` = '11.2' WHERE `DisplayID` = '30362';
-- The Lich King 30721
UPDATE `creature_model_info` SET `BoundingRadius` = '1.6',`CombatReach` = '2.7' WHERE `DisplayID` = '30721';


-- ##########
-- Ruby Sanctum:
-- Savianna Ragefire 31577
-- General Zarithrian 32179
-- Halion 31952
UPDATE `creature_model_info` SET `BoundingRadius` = '1.8',`CombatReach` = '9.1' WHERE `DisplayID` = '31952';

-- ##########
-- Trial of the Grand Crusader:
-- ##########
-- Onyxia's Lair:
-- ##########
-- Ulduar:
-- ##########
-- Naxxramas:
-- ##########
-- Eye of Eternity:
-- ##########
-- Vault of Archavon:
-- ##########
-- ##########
-- Raids The Burning Crusade
-- ##########
-- Sunwell PLateau:
-- ##########
-- Black Temple:

-- CreatureDisplayInfos - Novos Ids: