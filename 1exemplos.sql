DELETE FROM `spell_proc_event` WHERE `entry` = '71602';
DELETE FROM `spell_proc_event` WHERE `entry` = '75465';
DELETE FROM `spell_proc_event` WHERE `entry` = '71845';

UPDATE `command` SET `security` = '4' WHERE `name` = 'dismount';

ALTER TABLE mail DROP COLUMN auctionId;


p add coluna em tabela na DB com comment só pegar exemplo do spell regulator
.
ALTER TABLE npc_vendor ADD COLUMN Comment varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL AFTER VerifiedBuild;
- funciona mas pode bugar algumas tabelas, por exemplo npc_vendor n adicionava items ingame - sumia apos resetar o sv


UPDATE `item_template` SET `spellppmRate_1` = 10 WHERE (`entry` = '50353');
UPDATE `item_template` SET `spellppmRate_1` = 10 WHERE (`entry` = '50348');
UPDATE `item_template` SET `spellppmRate_1` = 2 WHERE (`entry` = '49992');

UPDATE `acore_string` SET `content_default` = 'test' WHERE `entry` = 726;

UPDATE `creature` SET `position_x` = 1678.99,`position_y` = 1667.86,`position_z` = 135.855, `orientation` = 3.76991 WHERE `id1` = 1568;

DELETE FROM `spell_custom_attr` WHERE `entry` IN (99, 1735, 5729, 43530,52744);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`)


ALTER TABLE `creature_template`
    ADD COLUMN `speed_swim` FLOAT NOT NULL DEFAULT '1' AFTER `speed_run`,
    ADD COLUMN `speed_flight` FLOAT NOT NULL DEFAULT '1' AFTER `speed_swim`;


ALTER TABLE `creature_template` DROP `InhabitType`;


teste
test2
test3
test4