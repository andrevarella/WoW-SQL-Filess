/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 19/09/2023 21:30:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_categories
-- ----------------------------
DROP TABLE IF EXISTS `store_categories`;
CREATE TABLE `store_categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `requiredRank` int NULL DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT 0,
  `enabled` int UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_categories
-- ----------------------------
INSERT INTO `store_categories` VALUES (1, 'Novidades', 'inv_misc_token_boost_generic', 0, 3, 1);
INSERT INTO `store_categories` VALUES (2, 'Descontos', 'ability_racial_packhobgoblin', 0, 1, 0);
INSERT INTO `store_categories` VALUES (3, 'Serviços', 'vas_charactertransfer', 0, 0, 1);
INSERT INTO `store_categories` VALUES (4, 'Boosts', 'spell_holy_surgeoflight', 0, 0, 0);
INSERT INTO `store_categories` VALUES (5, 'Items', 'ability_warrior_challange', 0, 0, 1);
INSERT INTO `store_categories` VALUES (6, 'Transmogs', 'INV_Weapon_Glave_01', 0, 0, 1);
INSERT INTO `store_categories` VALUES (7, 'Mounts', 'inv_brontosaurusmount', 0, 0, 1);
INSERT INTO `store_categories` VALUES (8, 'Pets', 'inv_box_petcarrier_01', 0, 0, 1);
INSERT INTO `store_categories` VALUES (9, 'Toys', 'inv_misc_toy_10', 0, 0, 1);
INSERT INTO `store_categories` VALUES (10, 'VIP', 'inv_misc_note_03', 3, 0, 1);
INSERT INTO `store_categories` VALUES (11, 'Consumiveis', 'spell_holy_holynova', 0, 0, 0);
INSERT INTO `store_categories` VALUES (12, 'Heirlooms', 'INV_Jewelry_Talisman_08', 0, 0, 0);
INSERT INTO `store_categories` VALUES (13, 'Buffs', 'spell_holy_holynova', 0, 0, 0);
INSERT INTO `store_categories` VALUES (14, 'Titles', 'inv_scroll_11', 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
