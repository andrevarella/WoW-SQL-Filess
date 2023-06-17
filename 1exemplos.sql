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


--teste
--test2
--test3
--test4

-- para colocar/mudar o extendedcost para 1500 em todos os items do entry 102345
UPDATE npc_vendor
SET extendedcost = 1500
WHERE entry = 1012345;


-- para adicionar no npc_vendor items com ilvl 251, com nome lasherweave e statscount not 0
SET @Entry := 1001040;
SET @iLvL := '251';

INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost)
SELECT @Entry, 0, entry, 0, 0, 0
FROM item_template
WHERE ItemLevel = @iLvL
    AND name LIKE '%lasherweave%'
    AND StatsCount NOT LIKE '%0%';
	
	
-- para colocar ' tem que colocar dois ', exemplo:
-- AND name LIKE '%Frost Witch''s%'


-- do carlin
-- Para mudar o custo de itens no multivendor
UPDATE npc_vendor SET extendedcost=2619 WHERE entry in(80261);
--executar no console no navicat (na tabela world)
.reload npc_vendor 
=======================================================
SET @Entry :=80264;
SET @iLvL :='264';
INSERT INTO npc_vendor (entry, slot, item, maxcount, incrtime, ExtendedCost)
SELECT @Entry, 0, entry, 0, 0, 0 FROM item_template WHERE ItemLevel=@iLvL and  not name like "%Wrathful Gladiator's%" and (InventoryType='11');

--not name like = Items que você quer ignorar, quando for adicionar no npc;
@Entry = ID do npc;
@Ilvl, item do level que você quer adicionar
--InventoryType = Id do slot do item