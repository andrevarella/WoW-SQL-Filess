/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : acore_characters

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 07/12/2023 22:01:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for custom_black_market
-- ----------------------------
DROP TABLE IF EXISTS `custom_black_market`;
CREATE TABLE `custom_black_market`  (
  `itemID` int NOT NULL,
  `buyoutprice` int NOT NULL,
  `defaultbidprice` int NULL DEFAULT NULL,
  `itemname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bought` tinyint(1) NULL DEFAULT 0,
  `bidplayername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bidplayerguid` int NULL DEFAULT NULL,
  `currentbidprice` int NOT NULL,
  `itemtimer` int NULL DEFAULT NULL,
  `temporaryOrder` int NOT NULL,
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of custom_black_market
-- ----------------------------
INSERT INTO `custom_black_market` VALUES (8492, 500, 10000, '|cffa335eeParrot Cage (Green Wing Macaw)|r', 'spell_nature_forceofnature', 0, '', 0, 10000, 0, 12);
INSERT INTO `custom_black_market` VALUES (13086, 500, 10000, '|cffa335eeWinterspring Frostsaber|r', 'ability_mount_pinktiger', 0, '', 0, 10000, 0, 52);
INSERT INTO `custom_black_market` VALUES (13335, 500, 10000, '|cffa335eeDeathcharger\'s Reins|r', 'ability_mount_undeadhorse', 0, '', 0, 10000, 0, 40);
INSERT INTO `custom_black_market` VALUES (19054, 500, 10000, '|cffa335eeRed Dragon Orb (Companion)|r', 'inv_misc_orb_05', 0, '', 0, 10000, 0, 56);
INSERT INTO `custom_black_market` VALUES (19055, 500, 10000, '|cffa335eeGreen Dragon Orb (Companion)|r', 'inv_misc_orb_01', 0, '', 0, 10000, 0, 84);
INSERT INTO `custom_black_market` VALUES (19872, 500, 10000, '|cffa335eeSwift Razzashi Raptor|r', 'ability_mount_raptor', 0, '', 0, 10000, 0, 114);
INSERT INTO `custom_black_market` VALUES (19902, 500, 10000, '|cffa335eeSwift Zulian Tiger|r', 'ability_mount_jungletiger', 0, '', 0, 10000, 0, 51);
INSERT INTO `custom_black_market` VALUES (22416, 500, 10000, '|cffa335eeDreadnaught Breastplate|r', 'INV_Chest_Plate02', 0, '', 0, 10000, 0, 71);
INSERT INTO `custom_black_market` VALUES (22417, 500, 10000, '|cffa335eeDreadnaught Legplates|r', 'INV_Pants_Plate_05', 0, '', 0, 10000, 0, 42);
INSERT INTO `custom_black_market` VALUES (22418, 500, 10000, '|cffa335eeDreadnaught Helmet|r', 'INV_Helmet_58', 0, '', 0, 10000, 0, 39);
INSERT INTO `custom_black_market` VALUES (22419, 500, 10000, '|cffa335eeDreadnaught Pauldrons|r', 'inv_Shoulder_29', 0, '', 0, 10000, 0, 17);
INSERT INTO `custom_black_market` VALUES (22420, 500, 10000, '|cffa335eeDreadnaught Sabatons|r', 'INV_Boots_Plate_06', 0, '', 0, 10000, 0, 2);
INSERT INTO `custom_black_market` VALUES (22421, 500, 10000, '|cffa335eeDreadnaught Gauntlets|r', 'INV_Gauntlets_28', 0, '', 0, 10000, 0, 68);
INSERT INTO `custom_black_market` VALUES (22422, 500, 10000, '|cffa335eeDreadnaught Waistguard|r', 'INV_Belt_27', 0, '', 0, 10000, 0, 91);
INSERT INTO `custom_black_market` VALUES (22425, 500, 10000, '|cffa335eeRedemption Tunic|r', 'INV_Chest_Chain_15', 0, '', 0, 10000, 0, 50);
INSERT INTO `custom_black_market` VALUES (22426, 500, 10000, '|cffa335eeRedemption Handguards|r', 'INV_Gauntlets_25', 0, '', 0, 10000, 0, 15);
INSERT INTO `custom_black_market` VALUES (22427, 500, 10000, '|cffa335eeRedemption Legguards|r', 'INV_Pants_Mail_15', 0, '', 0, 10000, 0, 20);
INSERT INTO `custom_black_market` VALUES (22428, 500, 10000, '|cffa335eeRedemption Headpiece|r', 'INV_Helmet_15', 0, '', 0, 10000, 0, 10);
INSERT INTO `custom_black_market` VALUES (22429, 500, 10000, '|cffa335eeRedemption Spaulders|r', 'INV_Shoulder_14', 0, '', 0, 10000, 0, 112);
INSERT INTO `custom_black_market` VALUES (22430, 500, 10000, '|cffa335eeRedemption Boots|r', 'INV_Boots_Chain_05', 0, '', 0, 10000, 0, 44);
INSERT INTO `custom_black_market` VALUES (22431, 500, 10000, '|cffa335eeRedemption Girdle|r', 'INV_Belt_22', 0, '', 0, 10000, 0, 77);
INSERT INTO `custom_black_market` VALUES (22436, 500, 10000, '|cffa335eeCryptstalker Tunic|r', 'INV_Chest_Chain_15', 0, '', 0, 10000, 0, 69);
INSERT INTO `custom_black_market` VALUES (22437, 500, 10000, '|cffa335eeCryptstalker Legguards|r', 'INV_Pants_Mail_15', 0, '', 0, 10000, 0, 54);
INSERT INTO `custom_black_market` VALUES (22438, 500, 10000, '|cffa335eeCryptstalker Headpiece|r', 'INV_Helmet_15', 0, '', 0, 10000, 0, 22);
INSERT INTO `custom_black_market` VALUES (22439, 500, 10000, '|cffa335eeCryptstalker Spaulders|r', 'INV_Shoulder_14', 0, '', 0, 10000, 0, 27);
INSERT INTO `custom_black_market` VALUES (22440, 500, 10000, '|cffa335eeCryptstalker Boot|r', 'INV_Boots_Chain_05', 0, '', 0, 10000, 0, 49);
INSERT INTO `custom_black_market` VALUES (22441, 500, 10000, '|cffa335eeCryptstalker Handguards|r', 'INV_Gauntlets_25', 0, '', 0, 10000, 0, 73);
INSERT INTO `custom_black_market` VALUES (22442, 500, 10000, '|cffa335eeCryptstalker Girdle|r', 'INV_Belt_22', 0, '', 0, 10000, 0, 41);
INSERT INTO `custom_black_market` VALUES (22464, 500, 10000, '|cffa335eeEarthshatter Tunic|r', 'INV_Chest_Chain_15', 0, '', 0, 10000, 0, 16);
INSERT INTO `custom_black_market` VALUES (22465, 500, 10000, '|cffa335eeEarthshatter Legguards|r', 'INV_Pants_Mail_15', 0, '', 0, 10000, 0, 80);
INSERT INTO `custom_black_market` VALUES (22466, 500, 10000, '|cffa335eeEarthshatter Headpiece|r', 'INV_Helmet_15', 0, '', 0, 10000, 0, 99);
INSERT INTO `custom_black_market` VALUES (22467, 500, 10000, '|cffa335eeEarthshatter Spaulders|r', 'INV_Shoulder_14', 0, '', 0, 10000, 0, 7);
INSERT INTO `custom_black_market` VALUES (22468, 500, 10000, '|cffa335eeEarthshatter Boots|r', 'INV_Boots_Chain_05', 0, '', 0, 10000, 0, 29);
INSERT INTO `custom_black_market` VALUES (22469, 500, 10000, '|cffa335eeEarthshatter Handguards|r', 'INV_Gauntlets_25', 0, '', 0, 10000, 0, 18);
INSERT INTO `custom_black_market` VALUES (22470, 500, 10000, '|cffa335eeEarthshatter Girdle|r', 'INV_Belt_22', 0, '', 0, 10000, 0, 79);
INSERT INTO `custom_black_market` VALUES (22476, 500, 10000, '|cffa335eeBonescythe Tunic|r', 'INV_Chest_Plate02', 0, '', 0, 10000, 0, 36);
INSERT INTO `custom_black_market` VALUES (22477, 500, 10000, '|cffa335eeBonescythe Legguard|r', 'INV_Pants_Plate_05', 0, '', 0, 10000, 0, 97);
INSERT INTO `custom_black_market` VALUES (22478, 500, 10000, '|cffa335eeBonescythe Headpiece|r', 'INV_Helmet_58', 0, '', 0, 10000, 0, 92);
INSERT INTO `custom_black_market` VALUES (22479, 500, 10000, '|cffa335eeBonescythe Spaulders|r', 'INV_Shoulder_29', 0, '', 0, 10000, 0, 81);
INSERT INTO `custom_black_market` VALUES (22480, 500, 10000, '|cffa335eeBonescythe Sabatons|r', 'INV_Boots_Plate_06', 0, '', 0, 10000, 0, 90);
INSERT INTO `custom_black_market` VALUES (22481, 500, 10000, '|cffa335eeBonescythe Handguards|r', 'INV_Gauntlets_28', 0, '', 0, 10000, 0, 55);
INSERT INTO `custom_black_market` VALUES (22482, 500, 10000, '|cffa335eeBonescythe Girdle|r', 'INV_Belt_27', 0, '', 0, 10000, 0, 82);
INSERT INTO `custom_black_market` VALUES (22488, 500, 10000, '|cffa335eeDreamwalker Tunic|r', 'INV_Chest_Chain_15', 0, '', 0, 10000, 0, 14);
INSERT INTO `custom_black_market` VALUES (22489, 500, 10000, '|cffa335eeDreamwalker Legguards|r', 'INV_Pants_Mail_15', 0, '', 0, 10000, 0, 95);
INSERT INTO `custom_black_market` VALUES (22490, 500, 10000, '|cffa335eeDreamwalker Headpiece|r', 'INV_Helmet_15', 0, '', 0, 10000, 0, 65);
INSERT INTO `custom_black_market` VALUES (22491, 500, 10000, '|cffa335eeDreamwalker Spaulders|r', 'INV_Shoulder_14', 0, '', 0, 10000, 0, 23);
INSERT INTO `custom_black_market` VALUES (22492, 500, 10000, '|cffa335eeDreamwalker Boots|r', 'INV_Boots_Chain_05', 0, '', 0, 10000, 0, 3);
INSERT INTO `custom_black_market` VALUES (22493, 500, 10000, '|cffa335eeDreamwalker Handguards|r', 'INV_Gauntlets_25', 0, '', 0, 10000, 0, 9);
INSERT INTO `custom_black_market` VALUES (22494, 500, 10000, '|cffa335eeDreamwalker Girdle|r', 'INV_Belt_22', 0, '', 0, 10000, 0, 24);
INSERT INTO `custom_black_market` VALUES (22496, 500, 10000, '|cffa335eeFrostfire Robe|r', 'INV_Chest_Cloth_43', 0, '', 0, 10000, 0, 48);
INSERT INTO `custom_black_market` VALUES (22497, 500, 10000, '|cffa335eeFrostfire Leggings|r', 'INV_Pants_Cloth_05', 0, '', 0, 10000, 0, 87);
INSERT INTO `custom_black_market` VALUES (22498, 500, 10000, '|cffa335eeFrostfire Circlet|r', 'INV_Crown_01', 0, '', 0, 10000, 0, 72);
INSERT INTO `custom_black_market` VALUES (22499, 500, 10000, '|cffa335eeFrostfire Shoulderpads|r', 'INV_Boots_Chain_05', 0, '', 0, 10000, 0, 78);
INSERT INTO `custom_black_market` VALUES (22500, 500, 10000, '|cffa335eeFrostfire Sandals|r', 'INV_Boots_Fabric_01', 0, '', 0, 10000, 0, 5);
INSERT INTO `custom_black_market` VALUES (22501, 500, 10000, '|cffa335eeFrostfire Gloves|r', 'INV_Gauntlets_17', 0, '', 0, 10000, 0, 31);
INSERT INTO `custom_black_market` VALUES (22502, 500, 10000, '|cffa335eeFrostfire Belt|r', 'INV_Belt_03', 0, '', 0, 10000, 0, 53);
INSERT INTO `custom_black_market` VALUES (22504, 500, 10000, '|cffa335eePlagueheart Tunic|r', 'INV_Chest_Cloth_43', 0, '', 0, 10000, 0, 111);
INSERT INTO `custom_black_market` VALUES (22505, 500, 10000, '|cffa335eePlagueheart Legguards|r', 'INV_Pants_Cloth_05', 0, '', 0, 10000, 0, 58);
INSERT INTO `custom_black_market` VALUES (22506, 500, 10000, '|cffa335eePlagueheart Headpiece|r', 'INV_Crown_01', 0, '', 0, 10000, 0, 96);
INSERT INTO `custom_black_market` VALUES (22507, 500, 10000, '|cffa335eePlagueheart Spaulders|r', 'INV_Shoulder_25', 0, '', 0, 10000, 0, 37);
INSERT INTO `custom_black_market` VALUES (22508, 500, 10000, '|cffa335eePlagueheart Boots|r', 'INV_Boots_Fabric_01', 0, '', 0, 10000, 0, 86);
INSERT INTO `custom_black_market` VALUES (22509, 500, 10000, '|cffa335eePlagueheart Handguards|r', 'INV_Gauntlets_17', 0, '', 0, 10000, 0, 106);
INSERT INTO `custom_black_market` VALUES (22510, 500, 10000, '|cffa335eePlagueheart Girdle|r', 'INV_Belt_03', 0, '', 0, 10000, 0, 21);
INSERT INTO `custom_black_market` VALUES (22512, 500, 10000, '|cffa335eeRobe of Faith|r', 'INV_Chest_Cloth_43', 0, '', 0, 10000, 0, 107);
INSERT INTO `custom_black_market` VALUES (22513, 500, 10000, '|cffa335eeLeggings of Faith|r', 'INV_Pants_Cloth_05', 0, '', 0, 10000, 0, 101);
INSERT INTO `custom_black_market` VALUES (22514, 500, 10000, '|cffa335eeCirclet of Faith|r', 'INV_Crown_01', 0, '', 0, 10000, 0, 26);
INSERT INTO `custom_black_market` VALUES (22515, 500, 10000, '|cffa335eeShoulderpads of Faith|r', 'INV_Shoulder_25', 0, '', 0, 10000, 0, 1);
INSERT INTO `custom_black_market` VALUES (22516, 500, 10000, '|cffa335eeSandals of Faith|r', 'INV_Boots_Fabric_01', 0, '', 0, 10000, 0, 103);
INSERT INTO `custom_black_market` VALUES (22517, 500, 10000, '|cffa335eeGloves of Faith|r', 'INV_Gauntlets_17', 0, '', 0, 10000, 0, 88);
INSERT INTO `custom_black_market` VALUES (22518, 500, 10000, '|cffa335eeBelt of Faith|r', 'INV_Belt_08', 0, '', 0, 10000, 0, 104);
INSERT INTO `custom_black_market` VALUES (32235, 500, 10000, '|cffa335eeCursed Vision of Sargeras|r', 'INV_Misc_Bandana_03', 0, '', 0, 10000, 0, 57);
INSERT INTO `custom_black_market` VALUES (32458, 500, 10000, '|cffa335eeAshes of Al\'ar|r', 'inv_misc_summerfest_brazierorange', 0, '', 0, 10000, 0, 83);
INSERT INTO `custom_black_market` VALUES (32547, 500, 10000, '|cffa335eeUnclaimed Black Market Container|r', 'inv_misc_lockbox_1', 0, '', 0, 10000, 0, 0);
INSERT INTO `custom_black_market` VALUES (33809, 500, 10000, '|cffa335eeAmani War Bear|r', 'ability_druid_challangingroar', 0, '', 0, 10000, 0, 75);
INSERT INTO `custom_black_market` VALUES (37012, 500, 10000, '|cffa335eeThe Horseman\'s Reins|r', 'inv_belt_12', 0, '', 0, 10000, 0, 100);
INSERT INTO `custom_black_market` VALUES (37297, 500, 10000, '|cffa335eeGold Medallion (Companion)|r ', 'inv_jewelry_amulet_03', 0, '', 0, 10000, 0, 32);
INSERT INTO `custom_black_market` VALUES (38578, 500, 10000, '|cff0070ddThe Flag of Ownership|r', 'INV_Banner_03', 0, '', 0, 10000, 0, 108);
INSERT INTO `custom_black_market` VALUES (39286, 500, 10000, '|cffa335eeFrosty (Companion)|r', 'inv_pet_frostwyrm', 0, '', 0, 10000, 0, 62);
INSERT INTO `custom_black_market` VALUES (39769, 500, 10000, '|cffa335eeArcanite Ripper|r', 'inv_axe_09', 0, '', 0, 10000, 0, 93);
INSERT INTO `custom_black_market` VALUES (41133, 500, 10000, '|cffa335eeUnhatched Mr. Chilly (Companion)|r', 'inv_misc_penguinpet', 0, '', 0, 10000, 0, 70);
INSERT INTO `custom_black_market` VALUES (43599, 500, 10000, '|cffa335eeBig Blizzard Bear|r', 'ability_mount_bigblizzardbear', 0, '', 0, 10000, 0, 25);
INSERT INTO `custom_black_market` VALUES (44151, 500, 10000, '|cffa335eeBlue Proto-Drake|r', 'ability_mount_drake_proto', 0, '', 0, 10000, 0, 19);
INSERT INTO `custom_black_market` VALUES (44168, 500, 10000, '|cffa335eeTime-Lost Proto-Drake|r', 'ability_mount_drake_proto', 0, '', 0, 10000, 0, 59);
INSERT INTO `custom_black_market` VALUES (44721, 500, 10000, '|cffa335eeProto-Drake Whelp (Companion)|r', 'ability_mount_drake_proto', 0, '', 0, 10000, 0, 38);
INSERT INTO `custom_black_market` VALUES (44819, 500, 10000, '|cffa335eeBaby Blizzard Bear (Companion)|r', 'inv_pet_babyblizzardbear', 0, '', 0, 10000, 0, 85);
INSERT INTO `custom_black_market` VALUES (46102, 500, 10000, '|cffa335eeWhistle of the Venomhide Ravasaur|r', 'ability_mount_raptor', 0, '', 0, 10000, 0, 110);
INSERT INTO `custom_black_market` VALUES (46778, 500, 10000, '|cffa335eeMagic Rooster Egg|r', 'inv_egg_03', 0, '', 0, 10000, 0, 66);
INSERT INTO `custom_black_market` VALUES (49343, 500, 10000, '|cffa335eeSpectral Tiger Cub (Companion)|r', 'ability_mount_spectraltiger', 0, '', 0, 10000, 0, 76);
INSERT INTO `custom_black_market` VALUES (49362, 500, 10000, '|cffa335eeOnyxian Whelpling (Companion)|r', 'inv_misc_head_dragon_black', 0, '', 0, 10000, 0, 4);
INSERT INTO `custom_black_market` VALUES (49636, 500, 10000, '|cffa335eeOnyxian Drake|r', 'achievement_boss_onyxia', 0, '', 0, 10000, 0, 34);
INSERT INTO `custom_black_market` VALUES (49646, 500, 10000, '|cffa335eeCore Hound Pup (Companion)|r', 'ability_hunter_pet_corehound', 0, '', 0, 10000, 0, 33);
INSERT INTO `custom_black_market` VALUES (49665, 500, 10000, '|cffa335eePandaren Monk (Companion)|r', 'inv_misc_pet_03', 0, '', 0, 10000, 0, 98);
INSERT INTO `custom_black_market` VALUES (54068, 500, 10000, '|cffa335eeWooly White Rhino|r', 'ability_hunter_pet_rhino', 0, '', 0, 10000, 0, 28);
INSERT INTO `custom_black_market` VALUES (80335, 500, 10000, '|cffa335eeBridle of the Ironbound Wraithcharger|r', 'ability_mount_steelwarhorse', 0, '', 0, 10000, 0, 11);
INSERT INTO `custom_black_market` VALUES (80341, 500, 10000, '|cffa335eeSpectral Steed|r', 'inv_mount_spectralhorse', 0, '', 0, 10000, 0, 63);
INSERT INTO `custom_black_market` VALUES (80365, 500, 10000, '|cffa335eeWhite Fossilized Raptor|r', 'ability_mount_fossilizedraptor', 0, '', 0, 10000, 0, 94);
INSERT INTO `custom_black_market` VALUES (80366, 500, 10000, '|cffa335eeSnowfeather Hunter|r', 'inv_falcosauroswhite', 0, '', 0, 10000, 0, 74);
INSERT INTO `custom_black_market` VALUES (80367, 500, 10000, '|cffa335eePredatory Bloodgazer|r', 'inv_falcosaurosblack', 0, '', 0, 10000, 0, 89);
INSERT INTO `custom_black_market` VALUES (80379, 500, 10000, '|cffa335eeBlue Myonix|r', 'inv_saber2mount', 0, '', 0, 10000, 0, 43);
INSERT INTO `custom_black_market` VALUES (80389, 500, 10000, '|cffa335eeSandy Nightsaber|r', 'inv_nightsaber2mountyellow', 0, '', 0, 10000, 0, 67);
INSERT INTO `custom_black_market` VALUES (80400, 500, 10000, '|cffa335eeGreen Sabertron|r', 'inv_mechanicaltiger_grey', 0, '', 0, 10000, 0, 113);
INSERT INTO `custom_black_market` VALUES (80401, 500, 10000, '|cffa335eeOrange Sabertron|r', 'inv_mechanicaltiger_grey', 0, '', 0, 10000, 0, 45);
INSERT INTO `custom_black_market` VALUES (80406, 500, 10000, '|cffa335eeReins of the Mighty Caravan Brutosaur|r', 'inv_brontosaurusmount', 0, '', 0, 10000, 0, 6);
INSERT INTO `custom_black_market` VALUES (80428, 500, 10000, '|cffa335eeSpectral Wolf|r', 'inv_mount_spectralwolf', 0, '', 0, 10000, 0, 61);
INSERT INTO `custom_black_market` VALUES (80461, 500, 10000, '|cffa335eeRed Qiraji Battle Tank|r', 'INV_Misc_QirajiCrystal_02', 0, '', 0, 10000, 0, 60);
INSERT INTO `custom_black_market` VALUES (80462, 500, 10000, '|cffa335eeBlue Qiraji Battle Tank|r', 'INV_Misc_QirajiCrystal_04', 0, '', 0, 10000, 0, 8);
INSERT INTO `custom_black_market` VALUES (80472, 500, 10000, '|cffa335eeBloodfang Cocoon|r', 'inv_spidermount', 0, '', 0, 10000, 0, 46);
INSERT INTO `custom_black_market` VALUES (80551, 500, 10000, '|cffa335eeJeweled Onyx Panther|r', 'ability_mount_onyxpanther', 0, '', 0, 10000, 0, 64);
INSERT INTO `custom_black_market` VALUES (80563, 500, 10000, '|cffa335eeGhastly Charger\'s Skull|r', 'inv_ghostlycharger', 0, '', 0, 10000, 0, 102);
INSERT INTO `custom_black_market` VALUES (80684, 500, 10000, '|cffa335eeLife-Binder\'s Handmaiden|r', 'ability_mount_drake_red', 0, '', 0, 10000, 0, 35);
INSERT INTO `custom_black_market` VALUES (80694, 500, 10000, '|cffa335eeBlack Kor\'kron Proto Drake|r', 'inv_belt_44a', 0, '', 0, 10000, 0, 105);
INSERT INTO `custom_black_market` VALUES (80695, 500, 10000, '|cffa335eeReins of Galakras|r', 'inv_belt_44a', 0, '', 0, 10000, 0, 109);
INSERT INTO `custom_black_market` VALUES (80699, 500, 10000, '|cffa335eeFeldrake|r', 'ability_mount_feldrake', 0, '', 0, 10000, 0, 30);
INSERT INTO `custom_black_market` VALUES (80700, 500, 10000, '|cffa335eeMottled Drake|r', 'ability_mount_drake_bronze', 0, '', 0, 10000, 0, 47);
INSERT INTO `custom_black_market` VALUES (80794, 500, 10000, '|cffa335eeReins of the Grand Expedition Yak|r', 'ability_mount_travellersyakmount', 0, '', 0, 10000, 0, 13);

SET FOREIGN_KEY_CHECKS = 1;
