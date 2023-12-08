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

 Date: 07/12/2023 21:59:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chat_censure
-- ----------------------------
DROP TABLE IF EXISTS `chat_censure`;
CREATE TABLE `chat_censure`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat_censure
-- ----------------------------
INSERT INTO `chat_censure` VALUES (6, '.com');
INSERT INTO `chat_censure` VALUES (7, '.net');
INSERT INTO `chat_censure` VALUES (8, '.org');
INSERT INTO `chat_censure` VALUES (9, 'www.');
INSERT INTO `chat_censure` VALUES (10, 'wow-');
INSERT INTO `chat_censure` VALUES (11, 'wow');
INSERT INTO `chat_censure` VALUES (12, 'no-ip');
INSERT INTO `chat_censure` VALUES (13, 'zapto');
INSERT INTO `chat_censure` VALUES (14, '.biz');
INSERT INTO `chat_censure` VALUES (15, '.servegame');
INSERT INTO `chat_censure` VALUES (16, '.br');
INSERT INTO `chat_censure` VALUES (17, 'com.br');
INSERT INTO `chat_censure` VALUES (18, '. c o m');
INSERT INTO `chat_censure` VALUES (19, '. n e t');
INSERT INTO `chat_censure` VALUES (20, '. o r g');
INSERT INTO `chat_censure` VALUES (21, 'w w w .');
INSERT INTO `chat_censure` VALUES (22, ' w o w -');
INSERT INTO `chat_censure` VALUES (23, '- w o w');
INSERT INTO `chat_censure` VALUES (24, 'n o - i p');
INSERT INTO `chat_censure` VALUES (25, '. z a p t o');
INSERT INTO `chat_censure` VALUES (26, '. b i z');
INSERT INTO `chat_censure` VALUES (27, '. s e r v e g a m e');
INSERT INTO `chat_censure` VALUES (28, '. b r');
INSERT INTO `chat_censure` VALUES (29, 'c o m . b r');
INSERT INTO `chat_censure` VALUES (31, '.  c  o  m');
INSERT INTO `chat_censure` VALUES (32, '.  n  e  t');
INSERT INTO `chat_censure` VALUES (33, '.  o  r  g');
INSERT INTO `chat_censure` VALUES (35, ' w  o  w  -');
INSERT INTO `chat_censure` VALUES (36, '-  w  o  w');
INSERT INTO `chat_censure` VALUES (37, 'n  o  -  i  p');
INSERT INTO `chat_censure` VALUES (38, '.  z  a  p  t  o');
INSERT INTO `chat_censure` VALUES (39, '.  b  i  z');
INSERT INTO `chat_censure` VALUES (40, '.  s  e  r  v  e  g  a  m  e');
INSERT INTO `chat_censure` VALUES (41, '.  b  r');
INSERT INTO `chat_censure` VALUES (42, 'c  o  m  .  b  r');
INSERT INTO `chat_censure` VALUES (44, '.   c   o   m');
INSERT INTO `chat_censure` VALUES (45, '.   n   e   t');
INSERT INTO `chat_censure` VALUES (46, '.   o   r   g');
INSERT INTO `chat_censure` VALUES (48, ' w   o   w   -');
INSERT INTO `chat_censure` VALUES (49, '-   w   o   w');
INSERT INTO `chat_censure` VALUES (50, 'n   o   -   i   p');
INSERT INTO `chat_censure` VALUES (51, '.   z   a   p   t   o');
INSERT INTO `chat_censure` VALUES (52, '.   b   i   z');
INSERT INTO `chat_censure` VALUES (53, '.   s   e   r   v   e   g   a   m   e');
INSERT INTO `chat_censure` VALUES (54, '.   b   r');
INSERT INTO `chat_censure` VALUES (55, '   c   o   m   .   b   r');
INSERT INTO `chat_censure` VALUES (56, 'h    t    t    p   :   /   /');
INSERT INTO `chat_censure` VALUES (57, '.    c    o    m');
INSERT INTO `chat_censure` VALUES (58, '.    n    e   t');
INSERT INTO `chat_censure` VALUES (59, '.    o    r    g');
INSERT INTO `chat_censure` VALUES (60, 'w    w    w    .');
INSERT INTO `chat_censure` VALUES (61, 'w    o    w    -');
INSERT INTO `chat_censure` VALUES (62, '-    w    o    w');
INSERT INTO `chat_censure` VALUES (63, 'n    o    -    i    p');
INSERT INTO `chat_censure` VALUES (64, '.    z    a    p    t    o');
INSERT INTO `chat_censure` VALUES (65, '.    b    i     z');
INSERT INTO `chat_censure` VALUES (66, '.    s    e    r    v    e    g    a    m    e');
INSERT INTO `chat_censure` VALUES (67, '.    b    r');
INSERT INTO `chat_censure` VALUES (68, 'c    o    m    .    b    r');
INSERT INTO `chat_censure` VALUES (69, 'wo w');

SET FOREIGN_KEY_CHECKS = 1;
