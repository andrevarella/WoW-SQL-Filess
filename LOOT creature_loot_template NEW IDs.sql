-- ICC
-- Lord Marrowgar 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34230, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lord Marrowgar - (ReferenceTable) 10n' WHERE `Entry` = 36612 AND `Item` = 1;
-- Lord Marrowgar 10h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34254, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Lord Marrowgar (2) - (ReferenceTable) 10h' WHERE `Entry` = 37958 AND `Item` = 1;
-- Lord Marrowgar 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34242, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lord Marrowgar (1) - (ReferenceTable) 25n' WHERE `Entry` = 37957 AND `Item` = 1;
-- Lord Marrowgar 25h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34266, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lord Marrowgar (3) - (ReferenceTable) 25h' WHERE `Entry` = 37959 AND `Item` = 1;

-- Lady Deathwhisper 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34231, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lady Deathwhisper - (ReferenceTable) 10n' WHERE `Entry` = 36855 AND `Item` = 1;
-- Lady Deathwhisper 10h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34255, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Lady Deathwhisper (2) - (ReferenceTable) 10h' WHERE `Entry` = 38296 AND `Item` = 1;
-- Lady Deathwhisper 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34243, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lady Deathwhisper (1) - (ReferenceTable) 25n' WHERE `Entry` = 38106 AND `Item` = 1;
-- Lady Deathwhisper 25h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34267, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Lady Deathwhisper (3) - (ReferenceTable) 25h' WHERE `Entry` = 38297 AND `Item` = 1;

-- PP 10N
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34234, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Professor Putricide - (ReferenceTable) 10n - itens' WHERE `Entry` = 36678 AND `Item` = 1;
-- PP 10H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34258, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Professor Putricide (2) - (ReferenceTable) 10hc - itens' WHERE `Entry` = 38585 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Professor Putricide (2) - (ReferenceTable) 10hc - mark' WHERE `Entry` = 38585 AND `Item` = 2;
-- PP 25N
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Professor Putricide (1) - (ReferenceTable) 25n - mark normal' WHERE `Entry` = 38431 AND `Item` = 1;
DELETE FROM `creature_loot_template` WHERE `entry` = '38431' and `Item` = '50067'; -- Del Astrylian's Sutured Cinch 25n
DELETE FROM `creature_loot_template` WHERE `entry` = '38431' and `Item` = '50179'; -- Del Last Word 25n
DELETE FROM `creature_loot_template` WHERE `entry` = '38431' and `Item` = '50069'; -- Del Professor's Bloodied Smock 25n
DELETE FROM `creature_loot_template` WHERE `entry` = '38431' and `Item` = '50068'; -- Del Rigormortis 25n
DELETE FROM `creature_loot_template` WHERE `entry` = '38431' and `Item` = '50351'; -- Del TAJ trinket 25n
-- PP 25H
UPDATE `creature_loot_template` SET `Reference` = 34279, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Professor Putricide (3) - (ReferenceTable) 25hc - mark hc' WHERE `Entry` = 38586 AND `Item` = 2;
UPDATE `creature_loot_template` SET `Reference` = 34278, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Professor Putricide (3) - (ReferenceTable) 25hc - mark normal' WHERE `Entry` = 38586 AND `Item` = 1;
DELETE FROM `creature_loot_template` WHERE `entry` = '38586' and `Item` = '50707'; -- Del Astrylian's Sutured Cinch 25H
DELETE FROM `creature_loot_template` WHERE `entry` = '38586' and `Item` = '50708'; -- Del Last Word 25H
DELETE FROM `creature_loot_template` WHERE `entry` = '38586' and `Item` = '50705'; -- Del Professor's Bloodied Smock 25H
DELETE FROM `creature_loot_template` WHERE `entry` = '38586' and `Item` = '50704'; -- Del Rigormortis 25H
DELETE FROM `creature_loot_template` WHERE `entry` = '38586' and `Item` = '50706'; -- Del TAJ trinket 25H

-- Rotface 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34233, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Rotface - (ReferenceTable) 10n' WHERE `Entry` = 36627 AND `Item` = 1;
-- Rotface 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34257, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Rotface (2) - (ReferenceTable) 10h' WHERE `Entry` = 38549 AND `Item` = 1;
-- Rotface 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34245, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Rotface (1) - (ReferenceTable) 25n' WHERE `Entry` = 38390 AND `Item` = 1;
-- Rotface 25hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34269, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Rotface (3) - (ReferenceTable) 25h' WHERE `Entry` = 38550 AND `Item` = 1;

-- Festergut 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34232, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Festergut - (ReferenceTable) 10n' WHERE `Entry` = 36626 AND `Item` = 1;
-- Fester 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34256, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Festergut (2) - (ReferenceTable) 10hc' WHERE `Entry` = 37505 AND `Item` = 1;
-- Fester 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34244, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Festergut (1) - (ReferenceTable) 25n' WHERE `Entry` = 37504 AND `Item` = 1;
-- Fester 25hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34268, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Festergut (3) - (ReferenceTable) 25hc' WHERE `Entry` = 37506 AND `Item` = 1;

-- Prince 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34235, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Prince Valanar - (ReferenceTable) - 10n' WHERE `Entry` = 37970 AND `Item` = 1;
-- Prince 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34259, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Prince Valanar (2) - (ReferenceTable) - 10hc' WHERE `Entry` = 38784 AND `Item` = 1;
-- Prince 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34248, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Prince Valanar (1) - (ReferenceTable) - 25n' WHERE `Entry` = 38401 AND `Item` = 1;
-- Prince 25hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34271, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Prince Valanar (3) - (ReferenceTable) - 25hc' WHERE `Entry` = 38785 AND `Item` = 1;

-- BQ 10N
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34236, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Blood-Queen Lana\'thel - (ReferenceTable) 10n' WHERE `Entry` = 37955 AND `Item` = 1;
-- BQ 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34260, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Blood-Queen Lana\'thel (2) - (ReferenceTable) 10hc' WHERE `Entry` = 38435 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Blood-Queen Lana\'thel (2) - (ReferenceTable) 10hc - mark normal' WHERE `Entry` = 38435 AND `Item` = 2;
-- BQ 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34247, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Blood-Queen Lana\'thel (1) - (ReferenceTable) 25n - loot' WHERE `Entry` = 38434 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Blood-Queen Lana\'thel (1) - (ReferenceTable) 25n - mark normal' WHERE `Entry` = 38434 AND `Item` = 2;
-- BQ 25H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34272, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Blood-Queen Lana\'thel (3) - (ReferenceTable) 25hc - loot' WHERE `Entry` = 38436 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34279, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Blood-Queen Lana\'thel (3) - (ReferenceTable) 25hc - mark hc' WHERE `Entry` = 38436 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 30, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Blood-Queen Lana\'thel (3) - (ReferenceTable) 25hc - mark normal' WHERE `Entry` = 38436 AND `Item` = 2;

-- Sindra 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34237, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Sindragosa - (ReferenceTable) 10n - loot' WHERE `Entry` = 36853 AND `Item` = 1;
-- Sindra 10h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34261, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Sindragosa (2) - (ReferenceTable) 10h - loot' WHERE `Entry` = 38266 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Sindragosa (2) - (ReferenceTable) 10h - mark n' WHERE `Entry` = 38266 AND `Item` = 2;
-- Sindra 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34249, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Sindragosa (1) - (ReferenceTable) 25n - loot' WHERE `Entry` = 38265 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 40, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Sindragosa (1) - (ReferenceTable) 25n - mark n' WHERE `Entry` = 38265 AND `Item` = 2;
-- Sindra 25h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34273, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Sindragosa (3) - (ReferenceTable) 25h - loot' WHERE `Entry` = 38267 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34279, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Sindragosa (3) - (ReferenceTable) 25h - mark hc' WHERE `Entry` = 38267 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Sindragosa (3) - (ReferenceTable) 25h - mark n' WHERE `Entry` = 38267 AND `Item` = 2;

-- Lich King 10N
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34238, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'The Lich King - (ReferenceTable) 10n' WHERE `Entry` = 36597 AND `Item` = 1;
-- Lich King 10H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34262, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 6, `Comment` = 'The Lich King (2) - (ReferenceTable) 10hc' WHERE `Entry` = 39167 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'The Lich King (2) - (ReferenceTable) 10h mark 264' WHERE `Entry` = 39167 AND `Item` = 2;
-- Lich King 25N
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34250, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'The Lich King (1) - (ReferenceTable) 25n' WHERE `Entry` = 39166 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'The Lich King (1) - (ReferenceTable) 25n mark n' WHERE `Entry` = 39166 AND `Item` = 2;
-- Lich King 25H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34274, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'The Lich King (3) - (ReferenceTable) 25hc' WHERE `Entry` = 39168 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34279, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'The Lich King (3) - (ReferenceTable) 25hc mark hc' WHERE `Entry` = 39168 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34278, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'The Lich King (3) - (ReferenceTable) 25hc mark n' WHERE `Entry` = 39168 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'The Lich King (3) 25H - PvE Heroic Token' WHERE `Entry` = 39168 AND `Item` = 47395; -- pve token

-- Ruby Sanctum
-- Halion 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34280, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Halion - (ReferenceTable) 10n off sets' WHERE `Entry` = 39863 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34280, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 3, `MaxCount` = 4, `Comment` = 'Halion - (ReferenceTable) 10n acessorios' WHERE `Entry` = 39863 AND `Item` = 2;
-- Halion 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34281, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Halion (2) - (ReferenceTable) 10hc off sets' WHERE `Entry` = 39944 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34281, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Halion (2) - (ReferenceTable) 10hc acessorios' WHERE `Entry` = 39944 AND `Item` = 2;
-- Halion 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34282, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Halion (1) - (ReferenceTable) 25n' WHERE `Entry` = 39864 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 45100, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Halion (1) - (ReferenceTable) 25n trinkets' WHERE `Entry` = 39864 AND `Item` = 2;
-- Halion 25H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34283, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Halion (3) - (ReferenceTable) Itens 25h' WHERE `Entry` = 39945 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 45101, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Halion (3) - (ReferenceTable) Trinkets 25h' WHERE `Entry` = 39945 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Halion (3) 25h - PvE Heroic Token' WHERE `Entry` = 39945 AND `Item` = 47395; -- pve token

-- Trial of the Grand Crusader:
-- Icehowl 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34294, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Icehowl - (ReferenceTable) 10n' WHERE `Entry` = 34797 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34300, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Icehowl - (ReferenceTable) 10n' WHERE `Entry` = 34797 AND `Item` = 2;
-- Icehowl 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34306, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (2) - (ReferenceTable) 10hc ally' WHERE `Entry` = 35448 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34313, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (2) - (ReferenceTable) 10h horde' WHERE `Entry` = 35448 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34312, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (2) - (ReferenceTable) 10hc' WHERE `Entry` = 35448 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34319, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (2) - (ReferenceTable) 10hc' WHERE `Entry` = 35448 AND `Item` = 4;
-- Icehowl 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34320, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (1) - (ReferenceTable) 25n ally' WHERE `Entry` = 35447 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34327, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (1) - (ReferenceTable) 25n horde' WHERE `Entry` = 35447 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34326, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (1) - (ReferenceTable) 25n recipe ally' WHERE `Entry` = 35447 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34333, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (1) - (ReferenceTable) 25n recipe horde' WHERE `Entry` = 35447 AND `Item` = 4;
-- Icehowl 25H
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34334, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (3) - (ReferenceTable) 25hc ally' WHERE `Entry` = 35449 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34341, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 8, `Comment` = 'Icehowl (3) - (ReferenceTable) 25hc horda' WHERE `Entry` = 35449 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34340, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (3) - (ReferenceTable) 25hc recipe ally' WHERE `Entry` = 35449 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34347, `Chance` = 15, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Icehowl (3) - (ReferenceTable) 25hc recipe horde' WHERE `Entry` = 35449 AND `Item` = 4;

-- Lord Jaraxxus 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34295, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Lord Jaraxxus - (ReferenceTable) 10n' WHERE `Entry` = 34780 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34301, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Lord Jaraxxus - (ReferenceTable) 10n' WHERE `Entry` = 34780 AND `Item` = 2;
-- Lord Jaraxxus 10hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34307, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (2) - (ReferenceTable) 10hc ally' WHERE `Entry` = 35268 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34314, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (2) - (ReferenceTable) 10hc horde' WHERE `Entry` = 35268 AND `Item` = 2;
-- Lord Jaraxxus 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34321, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (1) - (ReferenceTable) 25n ally' WHERE `Entry` = 35216 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34328, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (1) - (ReferenceTable) 25n horde' WHERE `Entry` = 35216 AND `Item` = 2;
-- Lord Jaraxxus 25hc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34335, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (3) - (ReferenceTable) 25h a' WHERE `Entry` = 35269 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34342, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lord Jaraxxus (3) - (ReferenceTable) 25h h' WHERE `Entry` = 35269 AND `Item` = 2;

-- Twin Valkyr 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34296, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Fjola Lightbane - (ReferenceTable) 10n Ally' WHERE `Entry` = 34497 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34302, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Fjola Lightbane - (ReferenceTable) 10n Horde' WHERE `Entry` = 34497 AND `Item` = 2;
-- Twin Valkyr 10h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34308, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Fjola Lightbane (2) - (ReferenceTable) 10hc Ally' WHERE `Entry` = 35351 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34315, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Fjola Lightbane (2) - (ReferenceTable) 10hc Horde' WHERE `Entry` = 35351 AND `Item` = 2;
-- Twin Valkyr 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34322, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Fjola Lightbane (1) - (ReferenceTable) 25n Ally' WHERE `Entry` = 35350 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34329, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Fjola Lightbane (1) - (ReferenceTable) 25n Horde' WHERE `Entry` = 35350 AND `Item` = 2;
-- Twin Valkyr 25h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34336, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Fjola Lightbane (3) - (ReferenceTable) 25hc ally' WHERE `Entry` = 35352 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34343, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Fjola Lightbane (3) - (ReferenceTable) 25hc horde' WHERE `Entry` = 35352 AND `Item` = 2;

-- Anub' Arak 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34298, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'arak - (ReferenceTable) 10n' WHERE `Entry` = 34564 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34304, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'arak - (ReferenceTable) 10n' WHERE `Entry` = 34564 AND `Item` = 2;
-- Anub' Arak 10h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34310, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'arak (2) - (ReferenceTable) 10hc ally' WHERE `Entry` = 35615 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34317, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'arak (2) - (ReferenceTable) 10hc horde' WHERE `Entry` = 35615 AND `Item` = 2;
-- Anub' Arak 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34324, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Anub\'arak (1) - (ReferenceTable) 25n Ally' WHERE `Entry` = 34566 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34331, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Anub\'arak (1) - (ReferenceTable) 25n Horde' WHERE `Entry` = 34566 AND `Item` = 2;
-- Anub' Arak 25h
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34338, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Anub\'arak (3) - (ReferenceTable) 25h Ally' WHERE `Entry` = 35616 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34345, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Anub\'arak (3) - (ReferenceTable) 25h Horde' WHERE `Entry` = 35616 AND `Item` = 2;

-- Onyxia 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34000, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Onyxia - (ReferenceTable) 10n' WHERE `Entry` = 10184 AND `Item` = 1;
-- Onyxia 25n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34001, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Onyxia (1) - (ReferenceTable) 25n' WHERE `Entry` = 36538 AND `Item` = 1;

-- Ulduar:
-- Flame Leviathan 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 - (ReferenceTable) 1 triumph' WHERE `Entry` = 33113 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34351, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Flame Leviathan 10m - (ReferenceTable)' WHERE `Entry` = 33113 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 2, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 - (ReferenceTable) 1 triumph' WHERE `Entry` = 33113 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 8, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 - (ReferenceTable) 1 triumph' WHERE `Entry` = 33113 AND `Item` = 4;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34154, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 8, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 - (ReferenceTable) patterns' WHERE `Entry` = 33113 AND `Item` = 5;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 4, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan - Runed Orb' WHERE `Entry` = 33113 AND `Item` = 45087;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 (Hard Mode) - Handguards of Potent Cures' WHERE `Entry` = 33113 AND `Item` = 45293;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 (Hard Mode) - Gilded Steel Legplates' WHERE `Entry` = 33113 AND `Item` = 45295;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 (Hard Mode) - Twirling Blades' WHERE `Entry` = 33113 AND `Item` = 45296;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 (Hard Mode) - Shimmering Seal' WHERE `Entry` = 33113 AND `Item` = 45297;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 10 (Hard Mode) - Mantle of Fiery Vengeance' WHERE `Entry` = 33113 AND `Item` = 45300;
-- Flame Leviathan 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) triumph' WHERE `Entry` = 34003 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34352, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) 25m' WHERE `Entry` = 34003 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34350, `Chance` = 5, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) runed orb' WHERE `Entry` = 34003 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34154, `Chance` = 5, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) recipes' WHERE `Entry` = 34003 AND `Item` = 4;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 2, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) triumph' WHERE `Entry` = 34003 AND `Item` = 5;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34350, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 4, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) runed orb' WHERE `Entry` = 34003 AND `Item` = 6;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34349, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 8, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable) triumph' WHERE `Entry` = 34003 AND `Item` = 7;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34154, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 8, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - (ReferenceTable)' WHERE `Entry` = 34003 AND `Item` = 8;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 8, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - Fragment of Val\'anyr' WHERE `Entry` = 34003 AND `Item` = 45038;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - Rising Sun 25' WHERE `Entry` = 34003 AND `Item` = 45086;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (1) - Titanguard 25' WHERE `Entry` = 34003 AND `Item` = 45110;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (Harde Mode) (1) - Golden Saronite Dragon 25' WHERE `Entry` = 34003 AND `Item` = 45132;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (Harde Mode) (1) - Pendant of Fiery Havoc 25' WHERE `Entry` = 34003 AND `Item` = 45133;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (Harde Mode) (1) - Plated Leggings of Ruination 25' WHERE `Entry` = 34003 AND `Item` = 45134;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (Harde Mode) (1) - Boots of Fiery Resolution 25' WHERE `Entry` = 34003 AND `Item` = 45135;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 16, `GroupId` = 1, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Flame Leviathan 25 (Harde Mode) (1) - Shoulderpads of Dormant Energies 25' WHERE `Entry` = 34003 AND `Item` = 45136;

-- Razorscale 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34355, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Razorscale 10n - (ReferenceTable)' WHERE `Entry` = 33186 AND `Item` = 1;
-- Razorscale 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34356, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Razorscale 25n - (ReferenceTable)' WHERE `Entry` = 33724 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34154, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Razorscale 25n Recipes' WHERE `Entry` = 33724 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 8, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Razorscale 25n - Fragment of Val\'anyr' WHERE `Entry` = 33724 AND `Item` = 45038;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Razorscale 25n - Emblem of Triumph' WHERE `Entry` = 33724 AND `Item` = 47241;
-- Ignis the Furnace Master 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34353, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Ignis the Furnace Master 10n - (ReferenceTable)' WHERE `Entry` = 33118 AND `Item` = 1;
-- Ignis the Furnace Master 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34354, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 8, `Comment` = 'Ignis the Furnace Master 25n - (ReferenceTable) items' WHERE `Entry` = 33190 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34154, `Chance` = 10, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Ignis the Furnace Master 25n - (ReferenceTable) recipes' WHERE `Entry` = 33190 AND `Item` = 3;

-- Xt-002 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34357, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'XT-002 Deconstructor 10n - (ReferenceTable)' WHERE `Entry` = 33293 AND `Item` = 1;
-- Xt-002 25m
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34358, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'XT-002 Deconstructor 25 - (ReferenceTable)' WHERE `Entry` = 33885 AND `Item` = 1;

-- The Iron Council 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34359, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Steelbreaker 10n - (ReferenceTable) The Iron Council' WHERE `Entry` = 32867 AND `Item` = 1;
-- The Iron Council 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34360, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Steelbreaker 25 - (ReferenceTable) The Iron Council' WHERE `Entry` = 33693 AND `Item` = 1;

-- Auriaya 10n
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34363, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Auriaya 10n - (ReferenceTable)' WHERE `Entry` = 33515 AND `Item` = 1;
-- Auriaya 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34364, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Auriaya 25n - (ReferenceTable)' WHERE `Entry` = 34175 AND `Item` = 1;

-- General Vezaxz 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34373, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'General Vezax - (ReferenceTable) 10n' WHERE `Entry` = 33271 AND `Item` = 1;
-- General Vezaxz 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34374, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'General Vezax (1) - (ReferenceTable) 25n' WHERE `Entry` = 33449 AND `Item` = 1;

-- Yogg Saron 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34375, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Yogg-Saron - (ReferenceTable) 10n' WHERE `Entry` = 33288 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 12034, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Yogg-Saron - (ReferenceTable) 10n Tokens' WHERE `Entry` = 33288 AND `Item` = 2;
-- Yogg Saron 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34376, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Yogg-Saron (1) - (ReferenceTable) 25n' WHERE `Entry` = 33955 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 12035, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Yogg-Saron (1) - (ReferenceTable) 25n Tokens' WHERE `Entry` = 33955 AND `Item` = 2;


-- Obsidian Sanctum
-- Sartharion 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 35086, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Sartharion 10n - Acessorios (ReferenceTable)' WHERE `Entry` = 28860 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 35087, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sartharion 10n Tokens - (ReferenceTable)' WHERE `Entry` = 28860 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 35088, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 2, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sartharion 10n One Drake Left - (ReferenceTable)' WHERE `Entry` = 28860 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 35089, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 4, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sartharion 10n Two Drakes Left - (ReferenceTable)' WHERE `Entry` = 28860 AND `Item` = 4;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 35090, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 8, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Sartharion 10n Reins of the Black Drake - (ReferenceTable)' WHERE `Entry` = 28860 AND `Item` = 5;
-- Sartharion 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34166, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Sartharion 25n Items - (ReferenceTable)' WHERE `Entry` = 31311 AND `Item` = 1;
UPDATE `lootacore_world`.`creature_loot_template` SET `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `MinCount` = 1, `MaxCount` = 2, `Comment` = 'Sartharion (1) - Gauntlets of the Lost Conqueror' WHERE `Entry` = 31311 AND `Item` = 40628 AND `Reference` = 0 AND `GroupId` = 1;
UPDATE `lootacore_world`.`creature_loot_template` SET `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `MinCount` = 1, `MaxCount` = 2, `Comment` = 'Sartharion (1) - Gauntlets of the Lost Protector' WHERE `Entry` = 31311 AND `Item` = 40629 AND `Reference` = 0 AND `GroupId` = 1;
UPDATE `lootacore_world`.`creature_loot_template` SET `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `MinCount` = 1, `MaxCount` = 2, `Comment` = 'Sartharion (1) - Gauntlets of the Lost Vanquisher' WHERE `Entry` = 31311 AND `Item` = 40630 AND `Reference` = 0 AND `GroupId` = 1;

-- Vault of Archavon
-- Archavon the Stone Watcher 10m (Hateful/T7)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34209, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 10, `Comment` = 'Archavon the Stone Watcher - (ReferenceTable)' WHERE `Entry` = 31125 AND `Item` = 1;
-- Archavon the Stone Watcher 25 (Deadly/T7.5)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34216, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 10, `Comment` = 'Archavon the Stone Watcher (1) - (ReferenceTable)' WHERE `Entry` = 31722 AND `Item` = 1;

-- Emalon the storm Watcher 10m (Deadly/T8)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34208, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 10, `Comment` = 'Emalon the Storm Watcher - (ReferenceTable)' WHERE `Entry` = 33993 AND `Item` = 1;
-- Emalon the storm Watcher 25m (Furious/T8.5)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34215, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 10, `Comment` = 'Emalon the Storm Watcher 25 - (ReferenceTable)' WHERE `Entry` = 33994 AND `Item` = 1;

-- Koralon the flame Watcher 10m (Furious/T9)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34204, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 10n - (ReferenceTable)' WHERE `Entry` = 35013 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34204, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 10n - (ReferenceTable)' WHERE `Entry` = 35013 AND `Item` = 2;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34204, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 3, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 10n - (ReferenceTable)' WHERE `Entry` = 35013 AND `Item` = 3;
-- Koralon the flame Watcher 25m (Relentless/T9.5)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34205, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 25 - (ReferenceTable)' WHERE `Entry` = 35360 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34205, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 25 - (ReferenceTable)' WHERE `Entry` = 35360 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34205, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 3, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Koralon the Flame Watcher 25 - (ReferenceTable)' WHERE `Entry` = 35360 AND `Item` = 4;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34203, `Chance` = 1, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Koralon the Flame Watcher 25 Mounts - (ReferenceTable)' WHERE `Entry` = 35360 AND `Item` = 2;

-- Toravon the ice Watcher 10m (Relentless/T10)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34206, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Toravon the Ice Watcher 10m - (ReferenceTable)' WHERE `Entry` = 38433 AND `Item` = 1;
-- Toravon the ice Watcher 25m (Wrathful/T10 264)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34207, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Toravon the Ice Watcher 25m - (ReferenceTable)' WHERE `Entry` = 38462 AND `Item` = 1;


-- Eye of Eternity
-- Malygos 10n
UPDATE `1acore_world`.`gameobject_loot_template` SET `Reference` = 34174, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Alexstrasza\'s Gift - Malygos 10n (ReferenceTable)' WHERE `Entry` = 26094 AND `Item` = 1;
-- Malygos 25n
UPDATE `1acore_world`.`gameobject_loot_template` SET `Reference` = 34175, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Alexstrasza\'s Gift - (ReferenceTable) 25n' WHERE `Entry` = 26097 AND `Item` = 1;


-- Naxxramas
-- Patchwerk 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34100, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Patchwerk - (ReferenceTable)' WHERE `Entry` = 16028 AND `Item` = 1;
-- Patchwerk 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34140, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Patchwerk 25 - (ReferenceTable)' WHERE `Entry` = 29324 AND `Item` = 1;

-- Grobbulus 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34101, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Grobbulus 10 - (ReferenceTable)' WHERE `Entry` = 15931 AND `Item` = 1;
-- Grobbulus 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34141, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Grobbulus 25 - (ReferenceTable)' WHERE `Entry` = 29373 AND `Item` = 1;

-- Gluth 10
-- Gluth 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34142, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Gluth 25m - (ReferenceTable)' WHERE `Entry` = 29417 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34383, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Gluth 25m - Tokens (ReferenceTable)' WHERE `Entry` = 29417 AND `Item` = 2;

-- Thaddius 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34143, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Thaddius 25 - (ReferenceTable)' WHERE `Entry` = 29448 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34380, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Thaddius 25 Tokens - (ReferenceTable)' WHERE `Entry` = 29448 AND `Item` = 2;

-- Anub'Rekhan 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34098, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'Rekhan 10m - (ReferenceTable)' WHERE `Entry` = 15956 AND `Item` = 1;
-- Anub'Rekhan 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34137, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Anub\'Rekhan 25m - (ReferenceTable)' WHERE `Entry` = 29249 AND `Item` = 1;

-- Grand Widow Faerlina 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34099, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Grand Widow Faerlina 10m - (ReferenceTable)' WHERE `Entry` = 15953 AND `Item` = 1;
-- Grand Widow Faerlina 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34138, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Grand Widow Faerlina 25m - (ReferenceTable)' WHERE `Entry` = 29268 AND `Item` = 1;

-- Maexxna
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34040, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Maexxna 10m - (ReferenceTable)' WHERE `Entry` = 15952 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34139, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Maexxna 25m - (ReferenceTable)' WHERE `Entry` = 29278 AND `Item` = 1;

-- Instructor Razuvious
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34102, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Instructor Razuvious 10m - (ReferenceTable)' WHERE `Entry` = 16061 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34144, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Instructor Razuvious 25m - (ReferenceTable)' WHERE `Entry` = 29940 AND `Item` = 1;

-- Gothik the Harvester
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34103, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Gothik the Harvester 10m (ReferenceTable)' WHERE `Entry` = 16060 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34145, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Gothik the Harvester 25m - (ReferenceTable)' WHERE `Entry` = 29955 AND `Item` = 1;

-- The Four Horsemen (gameobject)

-- Noth the Plaguebringer
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34042, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Noth the Plaguebringer 10m - (ReferenceTable)' WHERE `Entry` = 15954 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34147, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Noth the Plaguebringer 25m - (ReferenceTable)' WHERE `Entry` = 29615 AND `Item` = 1;

-- Heigan
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34041, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Heigan the Unclean 10m (ReferenceTable)' WHERE `Entry` = 15936 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34148, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Heigan the Unclean 25m - (ReferenceTable)' WHERE `Entry` = 29701 AND `Item` = 1;

-- Loatheb
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Loatheb 10- Spaulders of the Lost Conqueror' WHERE `Entry` = 16011 AND `Item` = 40622;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Loatheb 10- Spaulders of the Lost Protector' WHERE `Entry` = 16011 AND `Item` = 40623;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Loatheb 10- Spaulders of the Lost Vanquisher' WHERE `Entry` = 16011 AND `Item` = 40624;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34149, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Loatheb 25m - (ReferenceTable)' WHERE `Entry` = 29718 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34381, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Loatheb 25m - (ReferenceTable) t7 25n' WHERE `Entry` = 29718 AND `Item` = 2;

-- Sapphiron
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34043, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Sapphiron 10m - (ReferenceTable)' WHERE `Entry` = 15989 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34135, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Sapphiron 25m - (ReferenceTable)' WHERE `Entry` = 29991 AND `Item` = 1;

-- Kel Thuzad 10
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34044, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Kel\'Thuzad 10m - (ReferenceTable)' WHERE `Entry` = 15990 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Kel\'Thuzad - Helm of the Lost Conqueror' WHERE `Entry` = 15990 AND `Item` = 40616;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Kel\'Thuzad - Helm of the Lost Protector' WHERE `Entry` = 15990 AND `Item` = 40617;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Kel\'Thuzad - Helm of the Lost Vanquisher' WHERE `Entry` = 15990 AND `Item` = 40618;
-- Kel Thuzad 25
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34136, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Kel\'Thuzad 25m - (ReferenceTable)' WHERE `Entry` = 30061 AND `Item` = 1;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34133, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Kel\'Thuzad 25m - (ReferenceTable) T7' WHERE `Entry` = 30061 AND `Item` = 2;

-- Dungeons: Agora dão 3 frost e 5 triumph (dava 1 triumph e 0 frost)
-- Ahn'kahet (Herald Volazj)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Herald Volazj (1) - Emblem of Frost' WHERE `Entry` = 31464 AND `Item` = 49426;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Herald Volazj (1) - Emblem of Triumph' WHERE `Entry` = 31464 AND `Item` = 47241;
-- Azjol Nerub (Anub'Arak)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Anub\'arak 5Hc Azjol Nerub - Emblem of Frost' WHERE `Entry` = 31610 AND `Item` = 49426;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Anub\'arak 5Hc Azjol Nerub - Emblem of Triumph' WHERE `Entry` = 31610 AND `Item` = 47241;
-- Culling of Stratholme gameobjectX
-- Drak Tharon Keep (Prophet Tharon'ja)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'The Prophet Tharon\'ja (1) - Emblem of Triumph' WHERE `Entry` = 31360 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'The Prophet Tharon\'ja 5Hc - Emblem of Frost' WHERE `Entry` = 31360 AND `Item` = 49426;
-- Gundrak (Gal'darah)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Gal\'darah (1) - Emblem of Triumph' WHERE `Entry` = 31368 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Gal\'darah 5Hc - Emblem of Frost' WHERE `Entry` = 31368 AND `Item` = 49426;
-- Halls of Lightning (Loken)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Loken 5Hc - Emblem of Triumph' WHERE `Entry` = 31538 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Loken 5Hc - Emblem of Frost' WHERE `Entry` = 31538 AND `Item` = 49426;
-- Halls of Stone (Sjonnir the ironshaper)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Sjonnir The Ironshaper 5Hc - Emblem of Triumph' WHERE `Entry` = 31386 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sjonnir The Ironshaper 5Hc - Emblem of Frost' WHERE `Entry` = 31386 AND `Item` = 49426;
-- Halls of Reflection (the lich king) gameobject - n achei emblem of triumph
-- Pit of Saron (scourgelord tyrannus)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Scourgelord Tyrannus 5Hc - Emblem of Triumph' WHERE `Entry` = 36938 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Scourgelord Tyrannus 5Hc - Emblem of Frost' WHERE `Entry` = 36938 AND `Item` = 49426;
-- Forge of Souls (devourer of souls)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Devourer of Souls 5Hc - Emblem of Triumph' WHERE `Entry` = 37677 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Devourer of Souls 5Hc - Emblem of Frost' WHERE `Entry` = 37677 AND `Item` = 49426;
-- The Nexus (keristrasza)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Keristrasza 5Hc - Emblem of Triumph' WHERE `Entry` = 30540 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Keristrasza 5Hc - Emblem of Frost' WHERE `Entry` = 30540 AND `Item` = 49426;
-- The Oculus (ley-guardian eregos) gameobjectX
-- Trial of the Champion (the black knight)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'The Black Knight 5Hc - Emblem of Triumph' WHERE `Entry` = 35490 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'The Black Knight 5Hc - Emblem of Frost' WHERE `Entry` = 35490 AND `Item` = 49426;
-- Utgarde Keep (ingvar the plunderer)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Ingvar the Plunderer 5Hc - Emblem of Triumph' WHERE `Entry` = 31673 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Ingvar the Plunderer 5Hc - Emblem of Frost' WHERE `Entry` = 31673 AND `Item` = 49426;
-- Utgarde Pinnacle (king ymiron)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'King Ymiron 5Hc - Emblem of Triumph' WHERE `Entry` = 30788 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'King Ymiron 5Hc - Emblem of Frost' WHERE `Entry` = 30788 AND `Item` = 49426;
-- Violet Hold (cyanigosa)
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Cyanigosa 5Hc - Emblem of Triumph' WHERE `Entry` = 31506 AND `Item` = 47241;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Cyanigosa 5Hc - Emblem of Frost' WHERE `Entry` = 31506 AND `Item` = 49426;


---------------------------------------------------
---------------- TBC Raids/Dungeons: --------------

-- Sunwell Plateau -------------------------------------------
-- Kalecgos
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34082, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sathrovarr the Corruptor - (ReferenceTable) - T6' WHERE `Entry` = 24892 AND `Item` = 34082;
-- Brutallus
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34083, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Brutallus - (ReferenceTable) T6' WHERE `Entry` = 24882 AND `Item` = 34083;
-- Felmyst
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34084, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Felmyst - (ReferenceTable) T6' WHERE `Entry` = 25038 AND `Item` = 34084;
-- The eredar twins
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34085, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Grand Warlock Alythess - (ReferenceTable) - The Eredar Twins' WHERE `Entry` = 25166 AND `Item` = 34085;
-- m'uru
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34095, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Entropius - (ReferenceTable) - M\'uru' WHERE `Entry` = 25840 AND `Item` = 34095;
-- kil jaeden
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34096, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Kil\'jaeden - (ReferenceTable)' WHERE `Entry` = 25315 AND `Item` = 34096;

-- Black Temple -----------------------------------------------
-- Naj'enthus
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34070, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'High Warlord Naj\'entus - (ReferenceTable)' WHERE `Entry` = 22887 AND `Item` = 34070;
-- Supremus
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34071, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Supremus - (ReferenceTable)' WHERE `Entry` = 22898 AND `Item` = 34071;
-- Shade of Akama
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34072, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Shade of Akama - (ReferenceTable)' WHERE `Entry` = 22841 AND `Item` = 34072;
-- Teron Gorefiend
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34073, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Teron Gorefiend - (ReferenceTable)' WHERE `Entry` = 22871 AND `Item` = 34073;
-- Gurtogg Bloodboil
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34074, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Gurtogg Bloodboil - (ReferenceTable)' WHERE `Entry` = 22948 AND `Item` = 34074;
-- Essence of Souls
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34075, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Essence of Anger - (ReferenceTable) (essence of souls)' WHERE `Entry` = 23420 AND `Item` = 34075;
-- Mother Shahraz
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34076, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Mother Shahraz - (ReferenceTable) T6' WHERE `Entry` = 22947 AND `Item` = 34076;
-- The illidari Council
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'High Nethermancer Zerevor - Leggings of the Forgotten Conqueror' WHERE `Entry` = 22950 AND `Item` = 31098;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'High Nethermancer Zerevor - Leggings of the Forgotten Vanquisher' WHERE `Entry` = 22950 AND `Item` = 31099;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'High Nethermancer Zerevor - Leggings of the Forgotten Protector' WHERE `Entry` = 22950 AND `Item` = 31100;
-- Illidan Stormrage
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34077, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Illidan Stormrage - (ReferenceTable) - chest t6' WHERE `Entry` = 22917 AND `Item` = 34077;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34077, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Illidan Stormrage - (ReferenceTable) Loot' WHERE `Entry` = 22917 AND `Item` = 90077;

-- Karazhan ---------------------------------------------------
-- Attumen
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34016, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Attumen the Huntsman - (ReferenceTable)' WHERE `Entry` = 16152 AND `Item` = 34016;
-- moroes
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34017, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Moroes - (ReferenceTable)' WHERE `Entry` = 15687 AND `Item` = 34017;
-- maiden of virtue
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34018, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Maiden of Virtue - (ReferenceTable)' WHERE `Entry` = 16457 AND `Item` = 34018;
-- opera event/wizard of oz
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34023, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'The Crone - (ReferenceTable)' WHERE `Entry` = 18168 AND `Item` = 34023;
-- opera event/big bad wolf
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34031, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'The Big Bad Wolf - (ReferenceTable)' WHERE `Entry` = 17521 AND `Item` = 34031;
-- opera event/the Crone
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34023, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'The Crone - (ReferenceTable)' WHERE `Entry` = 18168 AND `Item` = 34023;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34031, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'The Big Bad Wolf - (ReferenceTable)' WHERE `Entry` = 17521 AND `Item` = 34031;
-- the curator
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'The Curator - Gloves of the Fallen Hero' WHERE `Entry` = 15691 AND `Item` = 29756;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'The Curator - Gloves of the Fallen Champion' WHERE `Entry` = 15691 AND `Item` = 29757;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'The Curator - Gloves of the Fallen Defender' WHERE `Entry` = 15691 AND `Item` = 29758;
-- terestian illh
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34019, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Terestian Illhoof - (ReferenceTable)' WHERE `Entry` = 15688 AND `Item` = 34019;
-- shade of aran
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34020, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Shade of Aran - (ReferenceTable)' WHERE `Entry` = 16524 AND `Item` = 34020;
-- netherspite
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34021, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Netherspite - (ReferenceTable)' WHERE `Entry` = 15689 AND `Item` = 34021;
-- nightbane
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34022, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 8, `MaxCount` = 8, `Comment` = 'Nightbane - (ReferenceTable)' WHERE `Entry` = 17225 AND `Item` = 34022;
-- chess event
-- prince malchezaar
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Prince Malchezaar - Helm of the Fallen Hero' WHERE `Entry` = 15690 AND `Item` = 29759;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Prince Malchezaar - Helm of the Fallen Champion' WHERE `Entry` = 15690 AND `Item` = 29760;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 0, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'Prince Malchezaar - Helm of the Fallen Defender' WHERE `Entry` = 15690 AND `Item` = 29761;

-- Serpentshrine Cavern ---------------------------------------
-- Hydross the Unstable
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34057, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 7, `Comment` = 'Hydross the Unstable - (ReferenceTable)' WHERE `Entry` = 21216 AND `Item` = 34057;
-- The Lurker Below
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34058, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'The Lurker Below - (ReferenceTable)' WHERE `Entry` = 21217 AND `Item` = 34058;
-- Leotheras the blind
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34059, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Leotheras the Blind - (ReferenceTable) t5 glov' WHERE `Entry` = 21215 AND `Item` = 34059;
-- fathom-lord karath
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34060, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Fathom-Lord Karathress - (ReferenceTable) calca t5' WHERE `Entry` = 21214 AND `Item` = 34060;
-- morogrim
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34061, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 7, `MaxCount` = 7, `Comment` = 'Morogrim Tidewalker - (ReferenceTable) gear' WHERE `Entry` = 21213 AND `Item` = 34061;
-- lady vashj
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34062, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 3, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Lady Vashj - (ReferenceTable) head t5' WHERE `Entry` = 21212 AND `Item` = 34062;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34062, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 4, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Lady Vashj - (ReferenceTable)' WHERE `Entry` = 21212 AND `Item` = 90062;

-- Zul'Aman ---------------------------------------------------
-- Nalorakk
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34151, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Nalorakk - (ReferenceTable)' WHERE `Entry` = 23576 AND `Item` = 1;
-- Akil'ZON
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34150, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Akil\'zon - (ReferenceTable)' WHERE `Entry` = 23574 AND `Item` = 1;
-- jan'alai
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34152, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Jan\'alai - (ReferenceTable)' WHERE `Entry` = 23578 AND `Item` = 1;
-- halazzi
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34153, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Halazzi - (ReferenceTable)' WHERE `Entry` = 23577 AND `Item` = 1;
-- hex lord malacr
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34078, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Hex Lord Malacrass - (ReferenceTable)' WHERE `Entry` = 24239 AND `Item` = 34078;
-- zul'jin
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34079, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Zul\'jin - (ReferenceTable)' WHERE `Entry` = 23863 AND `Item` = 34079;
-- timed reward chest (item rage/trollbane)

-- Hyjal ------------------------------------------------------
-- Rage Winterchil
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34064, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 6, `Comment` = 'Rage Winterchill - (ReferenceTable) gear' WHERE `Entry` = 17767 AND `Item` = 34064;
-- Anetheron
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34065, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 6, `Comment` = 'Anetheron - (ReferenceTable)' WHERE `Entry` = 17808 AND `Item` = 34065;
-- Kaz'rogal
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34066, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 6, `Comment` = 'Kaz\'rogal - (ReferenceTable)' WHERE `Entry` = 17888 AND `Item` = 34066;
-- Azgalor
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34067, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Azgalor - (ReferenceTable) t6' WHERE `Entry` = 17842 AND `Item` = 34067;
-- Archimonde
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34068, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Archimonde - (ReferenceTable) T6 head' WHERE `Entry` = 17968 AND `Item` = 190068;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34068, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 6, `Comment` = 'Archimonde - (ReferenceTable)' WHERE `Entry` = 17968 AND `Item` = 34068;

-- The Eye ----------------------------------------------------
-- Al'Ar
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34053, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Al\'ar - (ReferenceTable) - boss' WHERE `Entry` = 19514 AND `Item` = 1;
-- Void Reaver
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34054, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Void Reaver - (ReferenceTable) - t4 ou t5' WHERE `Entry` = 19516 AND `Item` = 34054;
-- High Astromancer SOlarian
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34055, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'High Astromancer Solarian - (ReferenceTable)' WHERE `Entry` = 18805 AND `Item` = 34055;
-- Kael'Thas
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34056, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 3, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Kael\'thas Sunstrider - (ReferenceTable) t5' WHERE `Entry` = 19622 AND `Item` = 34056;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34056, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 4, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Kael\'thas Sunstrider - (ReferenceTable) items' WHERE `Entry` = 19622 AND `Item` = 90056;

-- Magtheridom Lair -------------------------------------------
-- Magtheridon
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34039, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Magtheridon - (ReferenceTable) t4' WHERE `Entry` = 17257 AND `Item` = 34039;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34039, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Magtheridon - (ReferenceTable)' WHERE `Entry` = 17257 AND `Item` = 90039;

-- Gruul Lair -------------------------------------------------
-- High King Maulgar
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34050, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 2, `Comment` = 'High King Maulgar - (ReferenceTable) t4' WHERE `Entry` = 18831 AND `Item` = 34050;
-- Gruul
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34051, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Gruul the Dragonkiller - (ReferenceTable)' WHERE `Entry` = 19044 AND `Item` = 34051;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34051, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Gruul the Dragonkiller - (ReferenceTable) t4' WHERE `Entry` = 19044 AND `Item` = 190039;

-- Magisters Terrace (Dungeon) --------------------------------
-- Selin FIreheart
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25025, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Selin Fireheart - (ReferenceTable)' WHERE `Entry` = 24723 AND `Item` = 25025;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25025, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 3, `Comment` = 'Selin Fireheart (1) - (ReferenceTable)' WHERE `Entry` = 25562 AND `Item` = 25025;
-- Vexallus
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25026, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Vexallus - (ReferenceTable)' WHERE `Entry` = 24744 AND `Item` = 25026;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25026, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 3, `Comment` = 'Vexallus (1) - (ReferenceTable)' WHERE `Entry` = 25573 AND `Item` = 25026;
-- Priestress Delrissa
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25027, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Priestess Delrissa - (ReferenceTable)' WHERE `Entry` = 24560 AND `Item` = 25027;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25027, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 2, `MaxCount` = 3, `Comment` = 'Priestess Delrissa (1) - (ReferenceTable)' WHERE `Entry` = 25560 AND `Item` = 25027;
-- Kael'thas Sunstrider
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25028, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Kael\'thas Sunstrider 5N Blues - (ReferenceTable)' WHERE `Entry` = 24857 AND `Item` = 25028;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 25029, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Kael\'thas Sunstrider 5N Epics - (ReferenceTable)' WHERE `Entry` = 24857 AND `Item` = 25029;


---------------------------------------------------------------
-------------- Vanilla Raids/Dungeons: ------------------------

-- Blackwing Lair --------------------------------
-- Razorgore
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34032, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Razorgore the Untamed - (ReferenceTable)' WHERE `Entry` = 12435 AND `Item` = 34032;
-- Vaelastrasz the corrupt
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34033, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Vaelastrasz the Corrupt - (ReferenceTable)' WHERE `Entry` = 13020 AND `Item` = 34033;
-- broodlord lashlayer
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34034, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Broodlord Lashlayer - (ReferenceTable)' WHERE `Entry` = 12017 AND `Item` = 34034;
-- firemaw
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34035, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Firemaw - (ReferenceTable)' WHERE `Entry` = 11983 AND `Item` = 34035;
-- ebonroc
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34036, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Ebonroc - (ReferenceTable)' WHERE `Entry` = 14601 AND `Item` = 34036;
-- flamegor
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34037, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Flamegor - (ReferenceTable)' WHERE `Entry` = 11981 AND `Item` = 34037;
-- chromaggus
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34038, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'Chromaggus - (ReferenceTable)' WHERE `Entry` = 14020 AND `Item` = 34038;
-- nefarian
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34009, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Nefarian - (ReferenceTable) Head/Chest T3' WHERE `Entry` = 11583 AND `Item` = 3;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34010, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 4, `MaxCount` = 5, `Comment` = 'Nefarian - (ReferenceTable) Weapons' WHERE `Entry` = 11583 AND `Item` = 4;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34348, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Nefarian - (ReferenceTable) Head T3' WHERE `Entry` = 11583 AND `Item` = 5;

-- Zul'Gurub -------------------------------------
-- Hakkar
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34090, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Hakkar - (ReferenceTable)' WHERE `Entry` = 14834 AND `Item` = 34090;

-- Ahn Qiraj -------------------------------------
-- The Twin Emperors
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34045, `Chance` = 5, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 2, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Emperor Vek\'nilash - (ReferenceTable)' WHERE `Entry` = 15275 AND `Item` = 34045;
-- C'Thun
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34049, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 5, `MaxCount` = 5, `Comment` = 'C\'Thun - (ReferenceTable)' WHERE `Entry` = 15727 AND `Item` = 34049;


-- Molten Core -----------------------------------
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34012, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Lucifron - (ReferenceTable)' WHERE `Entry` = 12118 AND `Item` = 34012;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34013, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Magmadar - (ReferenceTable)' WHERE `Entry` = 11982 AND `Item` = 34013;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34014, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Gehennas - (ReferenceTable)' WHERE `Entry` = 12259 AND `Item` = 34014;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34015, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 4, `MaxCount` = 4, `Comment` = 'Garr - (ReferenceTable)' WHERE `Entry` = 12057 AND `Item` = 34015;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34026, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Shazzrah - (ReferenceTable)' WHERE `Entry` = 12264 AND `Item` = 34026;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34027, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Baron Geddon - (ReferenceTable)' WHERE `Entry` = 12056 AND `Item` = 34027;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34028, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Golemagg the Incinerator - (ReferenceTable)' WHERE `Entry` = 11988 AND `Item` = 34028;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34029, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 1, `MinCount` = 3, `MaxCount` = 3, `Comment` = 'Sulfuron Harbinger - (ReferenceTable)' WHERE `Entry` = 12098 AND `Item` = 34029;
-- Ragnaros
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 34030, `Chance` = 100, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 6, `MaxCount` = 6, `Comment` = 'Ragnaros Items - (ReferenceTable)' WHERE `Entry` = 11502 AND `Item` = 34030;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 40, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 9, `Comment` = 'Ragnaros - Essence of Fire' WHERE `Entry` = 11502 AND `Item` = 7078;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 3, `QuestRequired` = 0, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Ragnaros - Eye of Sulfuras' WHERE `Entry` = 11502 AND `Item` = 17204;
UPDATE `1acore_world`.`creature_loot_template` SET `Reference` = 0, `Chance` = 100, `QuestRequired` = 1, `LootMode` = 1, `GroupId` = 0, `MinCount` = 1, `MaxCount` = 1, `Comment` = 'Ragnaros - Essence of the Firelord' WHERE `Entry` = 11502 AND `Item` = 19017;

-- Stratholme ---------------------------------



-- UPDATE `creature_loot_template` SET `MinCount` = 8,`MaxCount` = 8,`position_z` = 135.855, `teste` = 55 WHERE `entry` = 36612;

-- INSERT INTO `1acore_world`.`creature_loot_template`(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (36612, 1, 34230, 100, 0, 1, 0, 8, 8, 'Lord Marrowgar - (ReferenceTable) 10n');


