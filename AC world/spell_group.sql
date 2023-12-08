-- WARLOCK
-- p mortal wound do Felguard nao stackar com outros tipos de heal reduction
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (1016, 25646, 0);


-- WARRIOR 

-- Enrages Warr + Backup
DELETE FROM `spell_group` WHERE `spell_id` = '57518'; -- Arms
DELETE FROM `spell_group` WHERE `spell_id` = '12880'; -- Fury
DELETE FROM `spell_group` WHERE `spell_id` = '57516'; -- Enrage Prot (nao tem na database)
-- Backup Enrages
-- INSERT INTO `acore_world`.`spell_group`(`id`, `spell_id`, `special_flag`) VALUES (1031, 57518, 0);
-- INSERT INTO `acore_world`.`spell_group`(`id`, `spell_id`, `special_flag`) VALUES (1031, 12880, 0);

-- Mudanças Enrages p nao stackarem (antes dessa mudança, eles stackam mas os efeitos nao acumulam)
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (2000, 57518, 0); -- Enrage Arms
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (2000, 57516, 0); -- enrage Prot
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (2000, 12880, 0); -- enrage fury



-- DRUID
-- Savage Roar Normal e Savage Roar Custom (set)
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (2000, 83122, 0);
INSERT INTO `spell_group`(`id`, `spell_id`, `special_flag`) VALUES (2000, 52610, 0);

