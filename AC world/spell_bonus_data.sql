-- Cloths Classes:

-- Warlock:
-- Unstable Affliction (antes tava 1,8 direct bonus) -  [buff no spell regu pra melhorar o scalling] (+ 35% dmg no spellregulator)
UPDATE `spell_bonus_data` SET `direct_bonus` = '1,25' WHERE `entry` = '31117';

-- Fel Fireball (fel flame?) (nao tinha no spell_bonus_data)
INSERT INTO `acore_world`.`spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (35913, 0.1, 0, 0, 0, 'Fel Fireball');
-- Custom Agony (soul swap)
INSERT INTO `acore_world`.`spell_bonus_data`(`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (83222, 0, 0.1, 0, 0, 'Agony Soul Swap');


-- Searing Pain mudei p 0,4586 (tava 0,4286)
-- DoT Unstable Affliction 0,216 (tava 0,2)
-- Shadowflame Rank2 (antes tava dot_bonus 0,0667)
--UPDATE `spell_bonus_data` SET `dot_bonus` = '0.1367' WHERE `entry` = '61291';

-- XXXXX
-- Leather Classes:

-- Druid:
-- Pounce DoT (nao tem na tabela)
INSERT INTO `acore_world`.`spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (49804, 0, 0, 0, 0.018, 'Druid - Pounce DoT');

-- Lacerate (antes AP bonus tava 0)
-- UPDATE `spell_bonus_data` SET `ap_bonus` = '0,05' WHERE `entry` = '48568';

-- XXXXX
-- Mail Classes:

-- Shaman:

-- Custom Lava Bust (mastery proc)
INSERT INTO `acore_world`.`spell_bonus_data`(`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (83245, 0.5714, 0, 0, 0, 'Shaman - Lava Burst');

-- XXXXX
-- Plate Classes:

-- Paladin:
-- Retri Aura (core atualmente nao tem o spell_bonus_data)
INSERT INTO `acore_world`.`spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (54043, 0.033, 0, 0, 0, 'Retribution Aura');

-- Death Knight:
-- Ebon Gargoyle dmg fix temporario direct_bonus tava 0,453 antes
-- (ta muito baixo atualmente) - aumentar 1 pouco o scalling e no spellregulator
UPDATE `spell_bonus_data` SET `direct_bonus` = '0,41' WHERE `entry` = '51963';

-- -----------------------











