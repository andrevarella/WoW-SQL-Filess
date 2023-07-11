-- -------------------------------------------------------------------------------------------
-- Tabards:
-- blood knight tabard
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (5976, 'Guild Tabard', 25549, 'Blood Knight Tabard');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '5976';

-- tabard of the hand > guild tab
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (24344, 'Tabard of the Hand', 5976, 'Guild Tabard');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '24344';

-- stormpike battle tab > frostwolf
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (19032, 'Stormpike Battle Tabard', 19031, 'Frostwolf Battle Tabard');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '19032';

-- silverwing tab > warsong tab
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (19506, 'Silverwing Battle Tabard', 19505, 'Warsong Battle Tabard');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '19506';

-- arathor > battle tabard of the defilers
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (20132, 'Arathor Battle Tabard', 20131, 'Battle Tabard of the Defilers');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '20132';


-- -------------------------------------------------------------------------------------------
-- Tabards Novas (de outras Expansoes/Customs)

-- Fierce/Dominant/Dread/Corrupted Gladiator's Tabard
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80304, 'Fierce Gladiator\'s Tabard (A)', 80303, 'Fierce Gladiator\'s Tabard (H)');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80306, 'Dominant Gladiator\'s Tabard (A)', 80305, 'Dominant Gladiator\'s Tabard (H)');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80308, 'Dread Gladiator\'s Tabard (A)', 80307, 'Dread Gladiator\'s Tabard (H)');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80314, 'Corrupted Gladiator\'s Tabard (A)', 80313, 'Corrupted Gladiator\'s Tabard (H)');



-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- Mounts:

-- Palomino > Red Wolf
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (12354, 'Palomino Bridle', 12330, 'Horn of the Red Wolf');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '12354';

-- White Stallion > Arctic Wolf
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (12353, 'White Stallion Bridle', 12351, 'Horn of the Arctic Wolf');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '12351';

-- Frost Ram > Ivory Raptor
-- INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (13329, 'Frost Ram', 13317, 'Whistle of the Ivory Raptor');
DELETE FROM `player_factionchange_items` WHERE `alliance_id` = '13329';


-- -------------------------------------------------------------------------------------------
-- Mounts Cata+ (Customs)

INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80587, 'Armored Blue Dragonhawk', 80588, 'Armored Red Dragonhawk');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80610, 'Armored Kite String [Alliance]', 80609, 'Armored Kite String [Horde]');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80613, 'Stormwind Skychaser', 80612, 'Orgrimmar Interceptor');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80438, 'Vicious War Bear [Alliance]', 80439, 'Vicious War Bear [Horde]');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80432, 'Vicious War Fox [Ally]', 80433, 'Vicious War Fox [Horde]');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80732, 'Grand Armored Gryphon', 80733, 'Grand Armored Wyvern');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80737, 'Vicious Sabertooth [Ally]', 80736, 'Vicious Sabertooth [Horde]');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80291, 'Vicious War Lion', 80290, 'Vicious War Kodo');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80495, 'Champion\'s Treadblade', 80494, 'Warlord\'s Deathwheel');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80343, 'Prestigious War Steed', 80424, 'Prestigious War Wolf');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80342, 'Vicious War Steed', 80425, 'Vicious War Wolf');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80344, 'Vicious Silver War Steed', 80426, 'Vicious Blue War Wolf');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80368, 'Vicious Black Warsaber', 80294, 'Vicious Black Bonesteed');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80372, 'Vicious Kaldorei Warsaber', 80292, 'Vicious Skeletal Warhorse');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80370, 'Vicious White Warsaber', 80319, 'Vicious White Bonesteed');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80576, 'Smoldering reins of Teldarssil Hippo', 80735, 'War-Torn Reins of Undercity Plaguebat');
INSERT INTO `acore_world`.`player_factionchange_items`(`alliance_id`, `alliance_comment`, `horde_id`, `horde_comment`) VALUES (80753, 'Vicious War Spider (ally)', 80754, 'Vicious War Spider [Horde]');




