/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 07/12/2023 22:12:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_services
-- ----------------------------
DROP TABLE IF EXISTS `store_services`;
CREATE TABLE `store_services`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int UNSIGNED NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tooltipName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tooltipType` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tooltipText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `icon` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `currency` int NULL DEFAULT NULL,
  `hyperlinkId` int NULL DEFAULT NULL,
  `creatureEntry` int NULL DEFAULT NULL,
  `discountAmount` int NULL DEFAULT NULL,
  `flags` int NULL DEFAULT NULL,
  `reward_1` int UNSIGNED NULL DEFAULT NULL,
  `reward_2` int UNSIGNED NULL DEFAULT NULL,
  `reward_3` int UNSIGNED NULL DEFAULT NULL,
  `reward_4` int UNSIGNED NULL DEFAULT NULL,
  `reward_5` int UNSIGNED NULL DEFAULT NULL,
  `reward_6` int UNSIGNED NULL DEFAULT NULL,
  `reward_7` int UNSIGNED NULL DEFAULT NULL,
  `reward_8` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_1` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_2` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_3` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_4` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_5` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_6` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_7` int UNSIGNED NULL DEFAULT NULL,
  `rewardcount_8` int UNSIGNED NULL DEFAULT NULL,
  `new` int UNSIGNED NOT NULL DEFAULT 0,
  `enabled` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_services
-- ----------------------------
INSERT INTO `store_services` VALUES (1, 7, 'Faction Change', 'Faction Change', '', 'Allows you to change your characters faction. Available after relogging.', 'vas_factionchange', 30, 2, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (2, 7, 'Race Change', 'Race Change', '', 'Allows you to change your characters race. Available after relogging.', 'vas_racechange', 25, 2, 0, 0, 5, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (3, 7, 'Name Change', 'Name Change', '', 'Allows you to change your characters name. Available after relogging.', 'vas_namechange', 5, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (4, 7, 'Appearance Change', 'Appearance Change', '', 'Allows you to change your characters appearance. Available after relogging.', 'vas_appearancechange', 3, 2, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (5, 8, 'Level Boost\r\n+10 Levels', 'Level Boost', '', 'Increase your character level by 10.', 'achievement_level_10', 10, 2, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (6, 8, 'Level Boost\r\n+20 Levels', 'Level Boost', '', 'Increase your character level by 20.', 'achievement_level_20', 20, 2, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (7, 8, 'Level 60 Boost', 'Level Boost', '', 'Boosts your character to level 60!', 'achievement_level_60', 40, 2, 0, 0, 0, 1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (8, 8, 'Level 80 Boost', 'Level Boost', '', 'Increase your character to level 80!', 'achievement_level_80', 50, 2, 0, 0, 0, 1, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (100, 1, '5. ***********  ITEMS  *********************', '***  TEMPLATE  ***', 'item', '|cff00FFFFClick to preview!|r', 'inv_weapon_staff_109', 10, 2, 51857, 0, 0, 0, 51857, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (101, 1, 'Hersir\'s Greatspear', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_weapon_staff_109', 10, 2, 51857, 0, 0, 1, 51857, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (102, 1, 'Whispering Fanged Skull', '', 'item', '', 'inv_misc_bone_skull_02', 10, 2, 50343, 0, 0, 0, 50343, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (3000, 1, '6. ***********  TRANSMOGS  *************', '***  TEMPLATE  ***', 'item', '|cff00FFFFClick to preview!|r', 'inv_shirt_purple_01', 10, 2, 45037, 45037, 0, 1, 45037, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (3001, 1, 'Epic Purple Shirt', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_shirt_purple_01', 10, 2, 45037, 45037, 5, 1, 45037, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (3002, 1, 'Tuxedo Set', 'Tuxedo Set', '', 'Express your great fashion sense with this full Tuxedo set!\r\n\r\nContains the following:\r\n\r\n1x Tuxedo Jacket\r\n1x Tuxedo Shirt\r\n1x Tuxedo Pants', 'inv_shirt_black_01', 50, 2, 0, 0, 0, 1, 10036, 10035, 10034, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3004, 6, 'Mantle of Crimson Blades\n', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_revendreth_d_02', 30, 2, 71857, 45759, 0, 1, 71857, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3005, 6, 'Mantle of the Forgemaster\'s\nDark Blades', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_revendreth_d_02', 30, 2, 72045, 45760, 0, 1, 72045, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3006, 6, 'Mantle of Burnished Blades', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_revendreth_d_02', 30, 2, 72046, 45761, 0, 1, 72046, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3007, 6, 'Mantle of Court Blades', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_revendreth_d_02', 30, 2, 72047, 45762, 0, 1, 72047, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3008, 6, 'Discordant Wings\nof the Ascended', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_03', 30, 2, 72048, 45763, 0, 1, 72048, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3009, 6, 'Harmonious Wings\nof the Ascended', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_03', 30, 2, 72049, 45764, 0, 1, 72049, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3010, 6, 'Reverent Wings of the Ascended', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_03', 30, 2, 72050, 45765, 0, 1, 72050, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3011, 6, 'Selfless Wings\nof the Ascended', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_03', 30, 2, 72051, 45766, 0, 1, 72051, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3012, 6, 'Halo of the Harmonious', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_01', 30, 2, 72052, 45767, 0, 1, 72052, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3013, 6, 'Halo of the Reverent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_01', 30, 2, 72053, 45768, 0, 1, 72053, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3014, 6, 'Halo of the Discordant', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_01', 30, 2, 72054, 45769, 0, 1, 72054, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3015, 6, 'Halo of the Selfless', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_01', 30, 2, 72055, 45770, 0, 1, 72055, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3016, 6, 'Discordant Sigil of the Archon', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_02', 30, 2, 72056, 45771, 0, 1, 72056, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3017, 6, 'Harmonious Sigil\nof the Archon', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_02', 30, 2, 72057, 45772, 0, 1, 72057, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3018, 6, 'Selfless Sigil of the Archon', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_02', 30, 2, 72058, 45773, 0, 1, 72058, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3019, 6, 'Reverent Sigil of the Archon', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_bastion_d_02', 30, 2, 72059, 45774, 0, 1, 72059, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3020, 6, 'Bladesworn Battle Standard', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_01', 30, 2, 72060, 45775, 0, 1, 72060, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3021, 6, 'Standard of Death\'s Chosen', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_01', 30, 2, 72061, 45776, 0, 1, 72061, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3022, 6, 'Standard of the\nBlackhound Warband', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_01', 30, 2, 72062, 45777, 0, 1, 72062, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3023, 6, 'Faewoven Bulb', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_02', 30, 2, 72063, 45778, 0, 1, 72063, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3024, 6, 'Winterwoven Bulb', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_02', 30, 2, 72064, 45779, 0, 1, 72064, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3025, 6, 'Night Courtier\'s Bulb', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_02', 30, 2, 72065, 45780, 0, 1, 72065, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3026, 6, 'Spirit Tender\'s Bulb', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_02', 30, 2, 72066, 45781, 0, 1, 72066, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3027, 6, 'Winterwoven Pack', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_03', 30, 2, 72067, 45782, 0, 1, 72067, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3028, 6, 'Spirit Tender\'s Pack', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_03', 30, 2, 72068, 45783, 0, 1, 72068, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3029, 6, 'Faewoven Pack', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_03', 30, 2, 72069, 45784, 0, 1, 72069, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3030, 6, 'Faewoven Branches', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_01', 30, 2, 72070, 45785, 0, 1, 72070, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3031, 6, 'Night Courtier\'s Branches', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_01', 30, 2, 72071, 45786, 0, 1, 72071, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3032, 6, 'Spirit Tender\'s Branches', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_01', 30, 2, 72072, 45787, 0, 1, 72072, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3033, 6, 'Winterwoven Branches', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_ardenweald_d_01', 30, 2, 72073, 45788, 0, 1, 72073, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3035, 6, 'Blazing Wings', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_shoulder_leather_firelandsdruid_d_01', 30, 2, 72075, 45790, 0, 1, 72075, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3036, 1, 'Jina-Kang, Kindness of Chi-Ji', '', 'item', '', 'inv_cape_pandaria_cranehealer_d_02', 30, 2, 72076, 45791, 0, 0, 72076, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3037, 1, 'Xing-Ho, Breath of Yu\'lon', '', 'item', '', 'inv_cape_pandaria_dragoncaster_d_02', 30, 2, 72077, 45792, 0, 0, 72077, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3038, 1, 'Qian-Le, Courage of Niuzao', '', 'item', '', 'inv_cape_pandaria_oxtank_d_02', 30, 2, 72078, 45793, 0, 0, 72078, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3039, 1, 'Fen-Yu, Fury of Xuen', '', 'item', '', 'inv_cape_pandaria_tigermelee_d_02', 30, 2, 72079, 45794, 0, 0, 72079, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3040, 6, 'Black Dragonscale Backpack', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_backpack_wrathion_c_01', 30, 2, 72080, 45795, 0, 1, 72080, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3041, 6, 'Dark Ranger\'s Quiver', '', 'item', '|cff00FFFFClick to preview!|r', 'ability_hunter_wildquiver', 30, 2, 83567, 45796, 0, 1, 83567, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3042, 6, 'Field Warden\'s Torture Kit', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72082, 45797, 0, 1, 72082, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3043, 6, 'Cold Burden of the Damned', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72083, 45798, 0, 1, 72083, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3044, 6, 'Gilded Agony Cage', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72084, 45799, 0, 1, 72084, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3045, 6, 'Tormentor\'s Manacled\nBackplate', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72085, 45800, 0, 1, 72085, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3046, 6, 'Painbringer\'s Back-Prison', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72086, 45801, 0, 1, 72086, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3047, 6, 'Cold Burden of the Damned 2', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_c_01', 30, 2, 72087, 45802, 0, 1, 72087, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3048, 6, 'Exterminator\'s Crest\nof the Damned', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72088, 45803, 0, 1, 72088, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3049, 6, 'Shadehunter\'s Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72089, 45804, 0, 1, 72089, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3050, 6, 'Gilded Skull Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72090, 45805, 0, 1, 72090, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3051, 6, 'Beastcaller\'s Skull Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72091, 45806, 0, 1, 72091, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3052, 6, 'Beastcaller\'s Skull Crescent 2', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72092, 45807, 0, 1, 72092, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3053, 6, 'Blackflame Skull Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_01', 30, 2, 72093, 45808, 0, 1, 72093, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3054, 6, 'Watchful Eye of the Damned', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72094, 45809, 0, 1, 72094, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3055, 6, 'Field Warden\'s\nWatchful Eye', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72095, 45810, 0, 1, 72095, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3056, 6, 'Field Warden\'s\nWatchful Eye (Purple)', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72096, 45811, 0, 1, 72096, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3057, 6, 'Gilded Eye Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72097, 45812, 0, 1, 72097, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3058, 6, 'Borrowed Eye Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72098, 45813, 0, 1, 72098, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3059, 6, 'Jailer\'s Eye Crescent', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_domination_d_02', 30, 2, 72099, 45814, 0, 1, 72099, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3060, 6, 'Standard of the Necrolords', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_01', 30, 2, 72100, 45815, 0, 1, 72100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3061, 6, 'Regrown Osteowings', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_02', 30, 2, 72101, 45817, 0, 1, 72101, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3062, 6, 'Osteowings of the Necrolords', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_02', 30, 2, 72102, 45818, 0, 1, 72102, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3063, 6, 'Trophy of the\nReborn Bonelord', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_02', 30, 2, 72103, 45818, 0, 1, 72103, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3064, 6, 'Barbarous Osteowings', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_maldraxxus_d_02', 30, 2, 72104, 45820, 0, 1, 72104, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3069, 6, 'Mantle of Crimson Blades\n(Gold)', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_cape_special_revendreth_d_02', 30, 2, 73074, 45825, 0, 1, 73074, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3070, 6, 'D3 AngelWings Orange', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80767, 45826, 0, 1, 80767, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3071, 6, 'D3 AngelWings Red', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80768, 45827, 0, 1, 80768, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3072, 6, 'D3 AngelWings White', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80769, 45828, 0, 1, 80769, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3073, 6, 'D3 DemonWing Blue', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80770, 45829, 0, 1, 80770, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3074, 6, 'D3 DemonWing Cyan', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80771, 45830, 0, 1, 80771, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3075, 6, 'D3 DemonWing Red', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80772, 45831, 0, 1, 80772, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3076, 6, 'D3 DemonWing Yellow', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80773, 45832, 0, 1, 80773, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3077, 6, 'D3 TwoToneWing Blue', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80774, 45833, 0, 1, 80774, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3078, 6, 'D3 TwoToneWing Gold', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80775, 45834, 0, 1, 80775, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3079, 6, 'D3 TwoToneWing Green', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80776, 45835, 0, 1, 80776, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3080, 6, 'D3 TwoToneWing Purple', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_icon_wing06a', 30, 2, 80777, 45836, 0, 1, 80777, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (3081, 6, 'Ren\'dorei Wings', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_chest_armor_voidelf_d_01', 30, 2, 80792, 45837, 0, 1, 80792, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (11000, 3, '7. ***********  MOUNTS  *****************', '***  TEMPLATE  ***', 'spell', '|cff00FFFFClick to preview!|r', 'ability_mount_spectraltiger', 30, 2, 42777, 24004, 0, 0, 42777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (11001, 3, 'TEMPLATE - Swift Spectral Tiger - [da learn na spell]', 'reward_1 e hyperlink = spell Id', 'spell', '|cff00FFFFClick to preview!|r', 'ability_mount_spectraltiger', 30, 2, 49284, 24004, 0, 0, 49284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (11002, 6, 'TEMPLATE - Mighty Caravan Brutosaur [da o item]', 'reward_1 e hyperlink = item Id', 'item', '', 'inv_brontosaurusmount', 50, 2, 80406, 45184, 0, 0, 80406, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (11003, 6, 'Swift Spectral Tiger', '', 'item', '|cff00FFFFClick to preview!|r', 'ability_mount_spectraltiger', 30, 2, 49284, 24004, 0, 0, 49284, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (11004, 6, 'Mighty Caravan Brutosaur', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_brontosaurusmount', 50, 2, 80406, 45184, 0, 0, 80406, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (11005, 6, 'Invincible\'s Reins', '', 'item', '|cff00FFFFClick to preview!|r', 'spell_deathknight_summondeathcharger', 50, 2, 50818, 38260, 0, 0, 50818, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (20000, 4, '8. ***********  PETS  **********************', '***  TEMPLATE  ***', 'spell', '|cff00FFFFClick to preview!|r', 'spell_magic_polymorphchicken', 10, 2, 10686, 7392, 0, 0, 10686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (20001, 1, 'Papa Hummel\'s\nOld-Fashioned\nPet Biscuit\n\nx255', '', 'item', '|cff00FFFFClick to preview!|r', 'INV_Misc_Petbiscuit_01', 10, 2, 35223, 0, 0, 0, 35223, 0, 0, 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20002, 4, 'Lil\' K.T.', '', 'spell', '|cff00FFFFClick to preview!|r', 'achievement_boss_kelthuzad_01', 10, 2, 69677, 36979, 0, 0, 69677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20003, 4, 'Lil\' XT', '', 'spell', '|cff00FFFFClick to preview!|r', 'achievement_boss_xt002deconstructor_01', 10, 2, 75906, 40703, 0, 0, 75906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20004, 4, 'Mini Diablo', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_DiabloStone', 10, 2, 17708, 11326, 0, 0, 17708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20005, 4, 'Mini Thor', '', 'spell', '|cff00FFFFClick to preview!|r', 't_roboticon', 10, 2, 78381, 42078, 0, 0, 78381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20006, 4, 'Zergling', '', 'spell', '|cff00FFFFClick to preview!|r', 'Spell_Shadow_SummonFelHunter', 10, 2, 17709, 11327, 0, 0, 17709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20007, 4, 'Grunty', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_Egg_03', 10, 2, 66030, 34694, 0, 0, 66030, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20008, 4, 'Murky', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_Egg_03', 10, 2, 24696, 15186, 0, 0, 24696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20009, 4, 'Panda Cub', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_Belt_05', 10, 2, 17707, 11325, 0, 0, 17707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20010, 4, 'Murkimus the Gladiator', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_Spear_05', 10, 2, 75936, 40721, 0, 0, 75936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20011, 4, 'Lurky', '', 'spell', '|cff00FFFFClick to preview!|r', 'INV_Egg_03', 10, 2, 24988, 15358, 0, 0, 24988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (20012, 4, 'Prairie Chicken', '', 'spell', '|cff00FFFFClick to preview!|r', 'spell_magic_polymorphchicken', 10, 2, 10686, 7392, 0, 0, 10686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40000, 1, '9. ***********  TOYS  *********************', '***  TEMPLATE  ***', 'item', '|cff00FFFFClick to preview!|r', 'inv_sword_22', 10, 2, 45061, 0, 0, 0, 45061, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (40001, 1, 'Foam Sword', '', 'item', '|cff00FFFFClick to preview!|r', 'inv_sword_22', 10, 2, 45061, 0, 0, 1, 45061, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40002, 1, 'Toy Train Set', '', 'item', '', 'INV_Misc_Toy_10', 10, 2, 44606, 0, 0, 0, 44606, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40003, 1, 'Goblin Gumbo Kettle', '', 'item', '', 'INV_Drink_17', 10, 2, 33219, 0, 0, 0, 33219, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40004, 1, 'Instant Statue Pedestal', '', 'item', '', 'inv_misc_statue_02', 10, 2, 54212, 0, 0, 0, 54212, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40005, 1, 'The Flag of Ownership', '', 'item', '', 'INV_Banner_03', 10, 2, 38578, 0, 0, 0, 38578, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40006, 1, 'Murloc Costume', '', 'item', '', 'INV_Misc_Head_Murloc_01', 10, 2, 33079, 0, 0, 0, 33079, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40007, 1, 'Brazier of Dancing Flames', '', 'item', '', 'INV_Misc_FireDancer_01', 10, 2, 34686, 0, 0, 0, 34686, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40008, 1, 'Ogre Pinata', '', 'item', '', 'inv_misc_ogrepinata', 10, 2, 46780, 0, 0, 0, 46780, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40009, 1, 'D.I.S.C.O.', '', 'item', '', 'INV_Misc_DiscoBall_01', 10, 2, 38301, 0, 0, 0, 38301, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40010, 1, 'Paper Flying Machine Kit', '', 'item', '', 'INV_Misc_Toy_06', 10, 2, 34499, 0, 0, 0, 34499, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40011, 1, 'Piccolo of the Flaming Fire', '', 'item', '', 'INV_Misc_Flute_01', 10, 2, 13379, 0, 0, 0, 13379, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40012, 1, 'Fishing Chair', '', 'item', '', 'INV_FISHINGCHAIR', 10, 2, 33223, 0, 0, 0, 33223, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40013, 1, 'Imp in a Ball', '', 'item', '', 'INV_Potion_27', 10, 2, 32542, 0, 0, 0, 32542, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40014, 1, 'Orb of the Sin\'dorei', '', 'item', '', 'INV_Misc_Orb_02', 10, 2, 35275, 0, 0, 0, 35275, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40015, 1, 'Picnic Basket', '', 'item', '', 'INV_Box_01', 10, 2, 32566, 0, 0, 0, 32566, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40016, 1, 'Firework Launcher\n\nx100\n\n', '', 'item', '|cff00FFFFVem com 200 foguetes de cada cor!|r', 'INV_Musket_04', 10, 2, 21569, 0, 0, 0, 21569, 21589, 21592, 21595, 21591, 21593, 21590, 0, 100, 200, 200, 200, 200, 200, 200, 0, 0, 1);
INSERT INTO `store_services` VALUES (40017, 1, 'Goblin Weather Machine\n\n- Prototype 01-B', '', 'item', '', 'INV_Misc_Weathermachine_01', 10, 2, 35227, 0, 0, 0, 35227, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (40018, 1, 'Ethereal Portal', '', 'item', '', 'ability_mage_netherwindpresence', 10, 2, 54452, 0, 0, 0, 54452, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `store_services` VALUES (60000, 1, '10. **********  VIP  ************************', '***  TEMPLATE  ***', 'item', '', 'INV_Misc_Book_09', 10, 2, 83550, 0, 0, 1, 83550, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (60001, 1, 'Livro Vip', '', 'item', '', 'INV_Misc_Book_09', 50, 1, 61000, 0, 0, 0, 61000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (60002, 1, 'Livro Vip Eterno', '', 'item', '', 'INV_Misc_Book_09', 50, 1, 61001, 0, 0, 0, 61001, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO `store_services` VALUES (70000, 1, '11. **********  Consumiveis **************', '***  TEMPLATE  ***', 'item', '', 'inv_weapon_staff_109', 10, 2, 51857, 0, 0, 1, 51857, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (80000, 1, '12. **********  Heirlooms  ****************', '***  TEMPLATE  ***', 'item', '', 'inv_shirt_purple_01', 10, 2, 45037, 0, 0, 1, 45037, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (90000, 5, '13. **********  BUFFS  ********************', '***  TEMPLATE  ***', '', 'Buffs you with Blessing of Might.', 'spell_holy_fistofjustice', 1, 2, 0, 0, 0, 0, 27140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (90001, 5, 'Buff\r\nBlessing of Might', 'Buff', '', 'Buffs you with Blessing of Might.', 'spell_holy_fistofjustice', 1, 2, 0, 0, 0, 0, 27140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (90049, 9, '14. **********  TITLES  ********************', '***  TEMPLATE  ***', '', 'Gives you the title Champion of the Naaru.', 'inv_mace_51', 10, 2, 0, 0, 0, 0, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `store_services` VALUES (90050, 9, 'Title\r\nChampion of the Naaru', 'Title', '', 'Gives you the title Champion of the Naaru.', 'inv_mace_51', 10, 2, 0, 0, 0, 0, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
