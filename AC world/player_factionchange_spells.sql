

-- backups:
-- INSERT INTO `acore_world`.`player_factionchange_spells` (`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (17229, 'Winterspring Frostsaber', 64659, 'Venomhide Ravasaur');
-- INSERT INTO `acore_world`.`player_factionchange_spells` (`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (17460, 'Frost Ram', 17450, 'Ivory Raptor');
-- INSERT INTO `acore_world`.`player_factionchange_spells` (`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (17461, 'Black Ram', 16084, 'Mottled Red Raptor');


-- Frost Ram > Ivory Raptor
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` IN (17460); 
-- winterspring frostsaber > venomhide
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '17229';
-- Stormpike battle charger > frostwolf howler
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '23510';

-- Palomino / Red Wolf
-- INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (16082, 'Palomino', 16080, 'Red Wolf');
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '16082';

-- white stallion > winter wolf (white stallion n faz mt sentido p usar na horda imo)
-- INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (16083, 'White Stallion', 16081, 'Winter Wolf');
-- DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '16083';


-- -------------------------------------

-- Mounts Honor (10k Honor)
-- black ram > mottled red raptor
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '17461';
-- black war steed
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '22717';
-- black battlestrider
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '22719';
-- black war ram
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '22720';
-- black war tiger
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '22723';

-- 100 moedas toc
-- Darnassian Nightsaber
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '63637';
-- Exodar Elekk
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '63639';
-- Gnomeregan Mechanostrider
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '63638';
-- Ironforge Ram
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '63636';
-- Stormwind Steed
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '63232';

-- 5 moedas toc
-- Great Red Elekk
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '65637';
-- Swift Gray Steed
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '65640';
-- Swift Moonsaber
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '65638';
-- Swift Violet Ram
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '65643';
-- Turbostrider
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` = '65642';




-- --------------------------------------------------
-- Mounts Cata+
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84372, 'Champion\'s Treadblade', 84371, 'Warlord\'s Deathwheel');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84530, 'Vicious War Lion', 84383, 'Vicious War Kodo');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (85089, 'Vicious Sabertooth [Ally]', 85088, 'Vicious Sabertooth [Horda]');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84379, 'Prestigious War Steed', 84344, 'Prestigious War Wolf');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84378, 'Vicious War Steed', 84342, 'Vicious War Wolf');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84382, 'Vicious Silver War Steed', 84345, 'Vicious Blue War Wolf');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84393, 'Vicious Kaldorei Warsaber', 84531, 'Vicious Skeletal Warhorse');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84390, 'Vicious Black Warsaber', 84532, 'Vicious Black Bonesteed');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84559, 'Vicious White Warsaber', 84338, 'Vicious White Bonesteed');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84724, 'Stormwind Skychaser', 84721, 'Orgrimmar Interceptor');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (85076, 'Grand Armored Gryphon', 85079, 'Grand Armored Wyvern');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84538, 'Vicious War Fox (ally)', 84539, 'Vicious War Fox (horde');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84384, 'Vicious War Bear', 84385, 'Vicious War Bear');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84697, 'Armored Blue Dragonhawk', 84700, 'Armored Red Dragonhawk');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (85003, 'Armored Kite String [Alliance]', 85000, 'Armored Kite String [Horde]');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84667, 'Teldarssil Hippo', 85085, 'Undercity Plaguebat');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84435, 'Blue Dragonhawk', 84433, 'Red Dragonhawk');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (84439, 'Silver Covenant Hippogryph', 84437, 'Sunreaver Dragonhawk');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (85105, 'Vicious War Spider - ally', 85104, 'Vicious War Spider - horde');
INSERT INTO `acore_world`.`player_factionchange_spells`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (85147, 'Paladin Dwarf Ram', 85145, 'Paladin Tauren Sunwalker Kodo');
