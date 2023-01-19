/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : 1acore_characters

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 19/01/2023 07:23:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for template_npc_glyphs
-- ----------------------------
DROP TABLE IF EXISTS `template_npc_glyphs`;
CREATE TABLE `template_npc_glyphs`  (
  `playerClass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `playerSpec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slot` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `glyph` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `comment` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Templates' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of template_npc_glyphs
-- ----------------------------
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 0, 733, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 1, 464, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 2, 468, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 3, 405, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 4, 469, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Assassination', 5, 411, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 0, 166, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 1, 0, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 2, 0, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 3, 676, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 4, 551, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Feral', 5, 671, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 0, 676, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 1, 433, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 2, 435, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 3, 178, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 4, 551, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Ballance', 5, 176, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 0, 709, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 1, 461, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 2, 459, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 3, 257, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 4, 463, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Holy', 5, 266, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 0, 329, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 2, 447, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 1, 446, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 3, 315, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 4, 451, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Arcane', 5, 314, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 0, 329, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 1, 446, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 2, 447, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 3, 315, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 4, 451, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Fire', 5, 697, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 0, 183, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 1, 453, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 2, 455, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 3, 192, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 4, 456, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Retribution', 5, 707, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 0, 191, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 1, 456, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 2, 457, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 3, 704, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 4, 452, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Protection', 5, 192, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 0, 754, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 2, 475, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 1, 474, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 3, 214, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 4, 552, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Elemental', 5, 735, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 0, 215, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 1, 552, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 2, 475, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 3, 736, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 4, 476, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Enhancement', 5, 754, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 0, 223, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 1, 476, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 2, 552, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 3, 751, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 4, 475, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Shaman', 'Restoration', 5, 754, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 0, 713, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 1, 461, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 2, 459, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 3, 263, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 4, 463, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Discipline', 5, 710, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 0, 169, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 1, 433, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 2, 435, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 3, 168, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 4, 551, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Druid', 'Restoration', 5, 676, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 0, 351, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 1, 439, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 2, 442, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 3, 358, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 4, 441, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Beastmastery', 5, 356, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 0, 351, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 1, 439, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 2, 442, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 3, 358, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 4, 441, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Survival', 5, 691, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 0, 706, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 1, 455, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 2, 456, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 3, 200, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 4, 452, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Paladin', 'Holy', 5, 192, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 0, 700, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 1, 446, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 2, 447, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 3, 315, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 4, 451, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Mage', 'Frost', 5, 329, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 0, 759, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 1, 477, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 2, 482, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 3, 273, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 4, 478, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Destruction', 5, 290, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 0, 759, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 1, 480, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 2, 477, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 3, 911, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 4, 478, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Affliction', 5, 274, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 0, 759, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 1, 478, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 2, 482, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 3, 756, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 4, 477, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warlock', 'Demonology', 5, 274, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 0, 772, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 1, 514, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 2, 553, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 3, 771, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 4, 518, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Unholy', 5, 527, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 0, 489, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 1, 484, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 2, 485, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 3, 499, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 4, 483, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Arms', 5, 500, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 0, 496, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 1, 484, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 2, 485, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 3, 763, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 4, 483, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Protection', 5, 502, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 0, 509, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 1, 484, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 2, 485, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 3, 490, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 4, 483, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Warrior', 'Fury', 5, 494, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 0, 405, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 1, 464, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 2, 468, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 3, 716, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 4, 469, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Subtlety', 5, 411, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 0, 409, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 1, 464, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 2, 468, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 3, 411, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 4, 469, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Rogue', 'Combat', 5, 715, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 0, 351, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 1, 439, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 2, 442, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 3, 358, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 4, 441, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Hunter', 'Marksmanship', 5, 366, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 0, 513, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 2, 553, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 1, 522, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 3, 558, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 4, 514, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Blood', 5, 768, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 0, 525, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 1, 514, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 2, 518, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 3, 769, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 4, 553, 0);
INSERT INTO `template_npc_glyphs` VALUES ('DeathKnight', 'Frost', 5, 521, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 0, 263, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 1, 463, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 2, 458, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 3, 257, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 4, 459, 0);
INSERT INTO `template_npc_glyphs` VALUES ('Priest', 'Shadow', 5, 708, 0);

SET FOREIGN_KEY_CHECKS = 1;
