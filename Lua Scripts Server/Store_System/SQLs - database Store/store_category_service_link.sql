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

 Date: 07/12/2023 22:12:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_category_service_link
-- ----------------------------
DROP TABLE IF EXISTS `store_category_service_link`;
CREATE TABLE `store_category_service_link`  (
  `category` int UNSIGNED NOT NULL,
  `service` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category`, `service`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store_category_service_link
-- ----------------------------
INSERT INTO `store_category_service_link` VALUES (3, 1, 'Faction Change');
INSERT INTO `store_category_service_link` VALUES (3, 2, 'Race Change');
INSERT INTO `store_category_service_link` VALUES (3, 3, 'Name Change');
INSERT INTO `store_category_service_link` VALUES (3, 4, 'Appearance Change');
INSERT INTO `store_category_service_link` VALUES (3, 5, 'Level Boost\r\n+10 Levels');
INSERT INTO `store_category_service_link` VALUES (3, 6, 'Level Boost\r\n+20 Levels');
INSERT INTO `store_category_service_link` VALUES (3, 7, 'Level 60 Boost');
INSERT INTO `store_category_service_link` VALUES (3, 8, 'Level 80 Boost');
INSERT INTO `store_category_service_link` VALUES (5, 100, '****   Items   ****');
INSERT INTO `store_category_service_link` VALUES (5, 101, '[Item] - Hersir\'s Greatspear');
INSERT INTO `store_category_service_link` VALUES (5, 102, '[Item] - Whispering Fanged Skull');
INSERT INTO `store_category_service_link` VALUES (6, 3000, '****   Transmogs   ****');
INSERT INTO `store_category_service_link` VALUES (6, 3001, '[Transmog] - Epic Purple Shirt');
INSERT INTO `store_category_service_link` VALUES (6, 3002, '[Transmog] - Tuxedo Set');
INSERT INTO `store_category_service_link` VALUES (6, 3004, '[Transmog] - Mantle of Crimson Blades');
INSERT INTO `store_category_service_link` VALUES (6, 3005, '[Transmog] - Mantle of the Forgemaster\'s Dark Blades');
INSERT INTO `store_category_service_link` VALUES (6, 3006, '[Transmog] - Mantle of Burnished Blades');
INSERT INTO `store_category_service_link` VALUES (6, 3007, '[Transmog] - Mantle of Court Blades');
INSERT INTO `store_category_service_link` VALUES (6, 3008, '[Transmog] - Discordant Wings of the Ascended');
INSERT INTO `store_category_service_link` VALUES (6, 3009, '[Transmog] - Harmonious Wings of the Ascended');
INSERT INTO `store_category_service_link` VALUES (6, 3010, '[Transmog] - Reverent Wings of the Ascended');
INSERT INTO `store_category_service_link` VALUES (6, 3011, '[Transmog] - Selfless Wings of the Ascended');
INSERT INTO `store_category_service_link` VALUES (6, 3012, '[Transmog] - Halo of the Harmonious');
INSERT INTO `store_category_service_link` VALUES (6, 3013, '[Transmog] - Halo of the Reverent');
INSERT INTO `store_category_service_link` VALUES (6, 3014, '[Transmog] - Halo of the Discordant');
INSERT INTO `store_category_service_link` VALUES (6, 3015, '[Transmog] - Halo of the Selfless');
INSERT INTO `store_category_service_link` VALUES (6, 3016, '[Transmog] - Discordant Sigil of the Archon');
INSERT INTO `store_category_service_link` VALUES (6, 3017, '[Transmog] - Harmonious Sigil of the Archon');
INSERT INTO `store_category_service_link` VALUES (6, 3018, '[Transmog] - Selfless Sigil of the Archon');
INSERT INTO `store_category_service_link` VALUES (6, 3019, '[Transmog] - Reverent Sigil of the Archon');
INSERT INTO `store_category_service_link` VALUES (6, 3020, '[Transmog] - Bladesworn Battle Standard');
INSERT INTO `store_category_service_link` VALUES (6, 3021, '[Transmog] - Standard of Death\'s Chosen');
INSERT INTO `store_category_service_link` VALUES (6, 3022, '[Transmog] - Standard of the Blackhound Warband');
INSERT INTO `store_category_service_link` VALUES (6, 3023, '[Transmog] - Faewoven Bulb');
INSERT INTO `store_category_service_link` VALUES (6, 3024, '[Transmog] - Winterwoven Bulb');
INSERT INTO `store_category_service_link` VALUES (6, 3025, '[Transmog] - Night Courtier\'s Bulb');
INSERT INTO `store_category_service_link` VALUES (6, 3026, '[Transmog] - Spirit Tender\'s Bulb');
INSERT INTO `store_category_service_link` VALUES (6, 3027, '[Transmog] - Winterwoven Pack');
INSERT INTO `store_category_service_link` VALUES (6, 3028, '[Transmog] - Spirit Tender\'s Pack');
INSERT INTO `store_category_service_link` VALUES (6, 3029, '[Transmog] - Faewoven Pack');
INSERT INTO `store_category_service_link` VALUES (6, 3030, '[Transmog] - Faewoven Branches');
INSERT INTO `store_category_service_link` VALUES (6, 3031, '[Transmog] - Night Courtier\'s Branches');
INSERT INTO `store_category_service_link` VALUES (6, 3032, '[Transmog] - Spirit Tender\'s Branches');
INSERT INTO `store_category_service_link` VALUES (6, 3033, '[Transmog] - Winterwoven Branches');
INSERT INTO `store_category_service_link` VALUES (6, 3035, '[Transmog] - Blazing Wings');
INSERT INTO `store_category_service_link` VALUES (6, 3036, '[Transmog] - Jina-Kang, Kindness of Chi-Ji');
INSERT INTO `store_category_service_link` VALUES (6, 3037, '[Transmog] - Xing-Ho, Breath of Yu\'lon');
INSERT INTO `store_category_service_link` VALUES (6, 3038, '[Transmog] - Qian-Le, Courage of Niuzao');
INSERT INTO `store_category_service_link` VALUES (6, 3039, '[Transmog] - Fen-Yu, Fury of Xuen');
INSERT INTO `store_category_service_link` VALUES (6, 3040, '[Transmog] - Black Dragonscale Backpack');
INSERT INTO `store_category_service_link` VALUES (6, 3041, '[Transmog] - Dark Ranger\'s Quiver');
INSERT INTO `store_category_service_link` VALUES (6, 3042, '[Transmog] - Field Warden\'s Torture Kit');
INSERT INTO `store_category_service_link` VALUES (6, 3043, '[Transmog] - Cold Burden of the Damned');
INSERT INTO `store_category_service_link` VALUES (6, 3044, '[Transmog] - Gilded Agony Cage');
INSERT INTO `store_category_service_link` VALUES (6, 3045, '[Transmog] - Tormentor\'s Manacled Backplate');
INSERT INTO `store_category_service_link` VALUES (6, 3046, '[Transmog] - Painbringer\'s Back-Prison');
INSERT INTO `store_category_service_link` VALUES (6, 3047, '[Transmog] - Cold Burden of the Damned 2');
INSERT INTO `store_category_service_link` VALUES (6, 3048, '[Transmog] - Exterminator\'s Crest of the Damned');
INSERT INTO `store_category_service_link` VALUES (6, 3049, '[Transmog] - Shadehunter\'s Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3050, '[Transmog] - Gilded Skull Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3051, '[Transmog] - Beastcaller\'s Skull Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3052, '[Transmog] - Beastcaller\'s Skull Crescent 2');
INSERT INTO `store_category_service_link` VALUES (6, 3053, '[Transmog] - Blackflame Skull Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3054, '[Transmog] - Watchful Eye of the Damned');
INSERT INTO `store_category_service_link` VALUES (6, 3055, '[Transmog] - Field Warden\'s Watchful Eye');
INSERT INTO `store_category_service_link` VALUES (6, 3056, '[Transmog] - Field Warden\'s Watchful Eye (Purple)');
INSERT INTO `store_category_service_link` VALUES (6, 3057, '[Transmog] - Gilded Eye Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3058, '[Transmog] - Borrowed Eye Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3059, '[Transmog] - Jailer\'s Eye Crescent');
INSERT INTO `store_category_service_link` VALUES (6, 3060, '[Transmog] - Standard of the Necrolords');
INSERT INTO `store_category_service_link` VALUES (6, 3061, '[Transmog] - Regrown Osteowings');
INSERT INTO `store_category_service_link` VALUES (6, 3062, '[Transmog] - Osteowings of the Necrolords');
INSERT INTO `store_category_service_link` VALUES (6, 3063, '[Transmog] - Trophy of the Reborn Bonelord');
INSERT INTO `store_category_service_link` VALUES (6, 3064, '[Transmog] - Barbarous Osteowings');
INSERT INTO `store_category_service_link` VALUES (6, 3069, '[Transmog] - Mantle of Crimson Blades (Gold)');
INSERT INTO `store_category_service_link` VALUES (6, 3070, '[Transmog] - D3 AngelWings Orange');
INSERT INTO `store_category_service_link` VALUES (6, 3071, '[Transmog] - D3 AngelWings Red');
INSERT INTO `store_category_service_link` VALUES (6, 3072, '[Transmog] - D3 AngelWings White');
INSERT INTO `store_category_service_link` VALUES (6, 3073, '[Transmog] - D3 DemonWing Blue');
INSERT INTO `store_category_service_link` VALUES (6, 3074, '[Transmog] - D3 DemonWing Cyan');
INSERT INTO `store_category_service_link` VALUES (6, 3075, '[Transmog] - D3 DemonWing Red');
INSERT INTO `store_category_service_link` VALUES (6, 3076, '[Transmog] - D3 DemonWing Yellow');
INSERT INTO `store_category_service_link` VALUES (6, 3077, '[Transmog] - D3 TwoToneWing Blue');
INSERT INTO `store_category_service_link` VALUES (6, 3078, '[Transmog] - D3 TwoToneWing Gold');
INSERT INTO `store_category_service_link` VALUES (6, 3079, '[Transmog] - D3 TwoToneWing Green');
INSERT INTO `store_category_service_link` VALUES (6, 3080, '[Transmog] - D3 TwoToneWing Purple');
INSERT INTO `store_category_service_link` VALUES (6, 3081, '[Transmog] - Ren\'dorei Wings');
INSERT INTO `store_category_service_link` VALUES (7, 11000, '****   Mounts   ****');
INSERT INTO `store_category_service_link` VALUES (7, 11003, '[Mount] - Swift Spectral Tiger');
INSERT INTO `store_category_service_link` VALUES (7, 11004, '[Mount] - Mighty Caravan Brutosaur');
INSERT INTO `store_category_service_link` VALUES (7, 11005, '[Mount] - Invincible\'s Reins');
INSERT INTO `store_category_service_link` VALUES (8, 20000, '****   Pets   ****');
INSERT INTO `store_category_service_link` VALUES (8, 20001, '[Pet] - Papa Hummel\'s Old-Fashioned Pet Biscuit');
INSERT INTO `store_category_service_link` VALUES (8, 20002, '[Pet] - Lil\' K.T.');
INSERT INTO `store_category_service_link` VALUES (8, 20003, '[Pet] - Lil\' XT');
INSERT INTO `store_category_service_link` VALUES (8, 20004, '[Pet] - Mini Diablo');
INSERT INTO `store_category_service_link` VALUES (8, 20005, '[Pet] - Mini Thor');
INSERT INTO `store_category_service_link` VALUES (8, 20006, '[Pet] - Zergling');
INSERT INTO `store_category_service_link` VALUES (8, 20007, '[Pet] - Grunty');
INSERT INTO `store_category_service_link` VALUES (8, 20008, '[Pet] - Murky');
INSERT INTO `store_category_service_link` VALUES (8, 20009, '[Pet] - Panda Cub');
INSERT INTO `store_category_service_link` VALUES (8, 20010, '[Pet] - Murkimus the Gladiator');
INSERT INTO `store_category_service_link` VALUES (8, 20011, '[Pet] - Lurky');
INSERT INTO `store_category_service_link` VALUES (8, 20012, '[Pet] - Prairie Chicken');
INSERT INTO `store_category_service_link` VALUES (9, 40000, '****   Toys   ****');
INSERT INTO `store_category_service_link` VALUES (9, 40001, '[Toy] - Foam Sword');
INSERT INTO `store_category_service_link` VALUES (9, 40002, '[Toy] - Toy Train Set');
INSERT INTO `store_category_service_link` VALUES (9, 40003, '[Toy] - Goblin Gumbo Kettle');
INSERT INTO `store_category_service_link` VALUES (9, 40004, '[Toy] - Instant Statue Pedestal');
INSERT INTO `store_category_service_link` VALUES (9, 40005, '[Toy] - The Flag of Ownership');
INSERT INTO `store_category_service_link` VALUES (9, 40006, '[Toy] - Murloc Costume');
INSERT INTO `store_category_service_link` VALUES (9, 40007, '[Toy] - Brazier of Dancing Flames');
INSERT INTO `store_category_service_link` VALUES (9, 40008, '[Toy] - Ogre Pinata');
INSERT INTO `store_category_service_link` VALUES (9, 40009, '[Toy] - D.I.S.C.O.');
INSERT INTO `store_category_service_link` VALUES (9, 40010, '[Toy] - Paper Flying Machine Kit');
INSERT INTO `store_category_service_link` VALUES (9, 40011, '[Toy] - Piccolo of the Flaming Fire');
INSERT INTO `store_category_service_link` VALUES (9, 40012, '[Toy] - Fishing Chair');
INSERT INTO `store_category_service_link` VALUES (9, 40013, '[Toy] - Imp in a Ball');
INSERT INTO `store_category_service_link` VALUES (9, 40014, '[Toy] - Orb of the Sin\'dorei');
INSERT INTO `store_category_service_link` VALUES (9, 40015, '[Toy] - Picnic Basket');
INSERT INTO `store_category_service_link` VALUES (9, 40016, '[Toy] - Firework Launcher');
INSERT INTO `store_category_service_link` VALUES (9, 40017, '[Toy] - Goblin Weather Machine - Prototype 01-B');
INSERT INTO `store_category_service_link` VALUES (9, 40018, '[Toy] - Ethereal Portal');
INSERT INTO `store_category_service_link` VALUES (10, 60000, '****    VIP   ****');
INSERT INTO `store_category_service_link` VALUES (10, 60001, 'VIP - Livro Vip');
INSERT INTO `store_category_service_link` VALUES (10, 60002, 'VIP - Livro Vip Eterno');

SET FOREIGN_KEY_CHECKS = 1;
