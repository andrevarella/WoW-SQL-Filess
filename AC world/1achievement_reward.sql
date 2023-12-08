/*
 Navicat Premium Data Transfer

 Source Server         : acore
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : acore_world

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 06/12/2023 15:22:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for achievement_reward
-- ----------------------------
DROP TABLE IF EXISTS `achievement_reward`;
CREATE TABLE `achievement_reward`  (
  `ID` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `TitleA` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `TitleH` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `ItemID` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `Sender` mediumint UNSIGNED NOT NULL DEFAULT 0,
  `Subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `MailTemplateID` mediumint UNSIGNED NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Loot System' ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of achievement_reward
-- ----------------------------
INSERT INTO `achievement_reward` VALUES (13, 0, 0, 41426, 16128, 'Level 80', 'Congratulations on your conviction to reach the 80th season of adventure. You are undoubtedly dedicated to the cause of ridding Azeroth of the evils which have plagued us.$B$BAnd while the journey thus far has been no minor feat, the true battle lies ahead.$B$BFight on!$B$BRhonin', 0, NULL);
INSERT INTO `achievement_reward` VALUES (45, 0, 0, 43348, 28070, 'You\'ve Been Around!', 'Well, look at ye!$B$BAnd I thought I had seen some things in this icy place! It seems obvious to this dwarf that you have the fire of the explorer burning in your eyes.$B$BWear this tabard with pride. That way your friends will know who to ask for directions when the time comes!$B$BKeep on the move!$B$BBrann Bronzebeard', 0, NULL);
INSERT INTO `achievement_reward` VALUES (46, 78, 78, 0, 0, '', '', 0, 'The Explorer');
INSERT INTO `achievement_reward` VALUES (230, 72, 0, 0, 0, '', '', 0, 'Battlemaster');
INSERT INTO `achievement_reward` VALUES (432, 53, 53, 0, 0, '', '', 0, 'Champion of Naaru');
INSERT INTO `achievement_reward` VALUES (456, 139, 139, 0, 0, '', '', 0, 'Realm First Obsidian Slayer');
INSERT INTO `achievement_reward` VALUES (614, 0, 0, 44223, 29611, 'For the Alliance!', 'War rages throughout our lands. Only the bravest heroes dare challenge strike the Horde where it hurts them most. You are among such heroes.$B$BThe blows you have delivered to the leadership of the Horde will open the door for our final assault. The Horde will bow down to the might of the Alliance.$B$BYour deeds will not go unrewarded. Ride on proudly!$B$B--Your King', 0, NULL);
INSERT INTO `achievement_reward` VALUES (619, 0, 0, 44224, 4949, 'For The Horde!', 'In this time of great turmoil true heroes rise from the misery. You are one such great hero.$B$BWar is upon us. Your efforts will further our cause on Azeroth. Your great feats shall go rewarded. Take this prize of Orgrimmar and ride to glory.$B$BFor the Horde!$B$BWarchief Thrall', 0, NULL);
INSERT INTO `achievement_reward` VALUES (714, 0, 47, 0, 0, '', '', 0, 'Conqueror');
INSERT INTO `achievement_reward` VALUES (762, 0, 130, 0, 0, '', '', 0, 'Ambassador');
INSERT INTO `achievement_reward` VALUES (870, 126, 127, 0, 0, '', '', 0, 'Of the Horde or the Alliance');
INSERT INTO `achievement_reward` VALUES (871, 144, 144, 0, 0, '', '', 0, 'Bloodsail Admiral');
INSERT INTO `achievement_reward` VALUES (876, 0, 0, 43349, 29533, 'I\'ve been watching you, kid.', 'You\'ve got quite a knack for throwing down in that arena. Keep this. Wear it with pride. Now get back in there and show them how it\'s done!$B$BUncle Sal', 0, NULL);
INSERT INTO `achievement_reward` VALUES (907, 48, 0, 0, 0, '', '', 0, 'Justicar');
INSERT INTO `achievement_reward` VALUES (913, 74, 74, 0, 0, '', '', 0, 'Elder');
INSERT INTO `achievement_reward` VALUES (942, 79, 0, 0, 0, '', '', 0, 'The Diplomat');
INSERT INTO `achievement_reward` VALUES (943, 0, 79, 0, 0, '', '', 0, 'The Diplomat');
INSERT INTO `achievement_reward` VALUES (945, 131, 131, 0, 0, '', '', 0, 'The Argent Champion');
INSERT INTO `achievement_reward` VALUES (948, 130, 0, 0, 0, '', '', 0, 'Ambassador');
INSERT INTO `achievement_reward` VALUES (953, 132, 132, 0, 0, '', '', 0, 'Guardian of Cenarius');
INSERT INTO `achievement_reward` VALUES (978, 81, 81, 0, 0, '', '', 0, 'The Seeker');
INSERT INTO `achievement_reward` VALUES (1015, 77, 77, 0, 0, '', '', 0, 'The Exalted');
INSERT INTO `achievement_reward` VALUES (1021, 0, 0, 40643, 29261, 'Quite the Achiever', 'I couldn\'t help but notice what a fine collection of Tabards you\'ve managed to collect over the seasons. You might as well add this one to your collection. It\'s simply been gathering dust in my wardrobe.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (1038, 75, 0, 0, 0, '', '', 0, 'Flame Warden');
INSERT INTO `achievement_reward` VALUES (1039, 0, 76, 0, 0, '', '', 0, 'Flame Keeper');
INSERT INTO `achievement_reward` VALUES (1174, 82, 82, 0, 0, '', '', 0, 'Arena Master');
INSERT INTO `achievement_reward` VALUES (1175, 0, 72, 0, 0, '', '', 0, 'Battlemaster');
INSERT INTO `achievement_reward` VALUES (1250, 0, 0, 40653, 28951, 'Stinker\'s New Home', 'I\'ve heard how well you take care of our furry friends. I hope you don\'t mind but I must get Stinker a new home. He just refuses to play nice with others.$B$BPlease make sure to feed him twice a day. And um... he has a thing for black cats.$B$B--Breanni', 0, NULL);
INSERT INTO `achievement_reward` VALUES (1400, 120, 120, 0, 0, '', '', 0, 'Realm First! Magic Seeker');
INSERT INTO `achievement_reward` VALUES (1402, 122, 122, 0, 0, '', '', 0, 'Realm First! Conqueror of Naxxramas');
INSERT INTO `achievement_reward` VALUES (1516, 83, 83, 0, 0, '', '', 0, 'Salty Title');
INSERT INTO `achievement_reward` VALUES (1563, 84, 0, 0, 0, '', '', 0, 'Chef');
INSERT INTO `achievement_reward` VALUES (1656, 124, 0, 0, 0, '', '', 0, 'The Hallowed');
INSERT INTO `achievement_reward` VALUES (1657, 0, 124, 0, 0, '', '', 0, 'The Hallowed');
INSERT INTO `achievement_reward` VALUES (1658, 129, 129, 0, 0, '', '', 0, 'Champion of the Frozen Wastes');
INSERT INTO `achievement_reward` VALUES (1681, 125, 0, 43300, 7999, 'Greetings from Darnassus', 'Your accomplishments have been profound and far-reaching. Azeroth, with all of the recent turmoil, benefits greatly from those who seek to rid the land of evil.$B$BOnly those who take the time to know our lands understand the sacrifices of the fallen and the valor of our heroes. You are one such hero. Hopefully, you will recant the tales of your adventures for years to come.$B$BOn behalf of the Alliance, I thank you, Loremaster.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (1682, 0, 125, 43300, 3057, 'Greetings From Thunder Bluff', 'News of your accomplishments has traveled far. The winds of turmoil howl through our lands. Those who stand to challenge evil are our only hope.$B$BOnly those who listen to the winds understand the debts our fallen heroes have paid to protect our people. May a hero such as yourself live long to tell the tales of your adventures. For only then will we remember how much we have to be thankful for.$B$BOur appreciation runs deep, Loremaster.$B$BFor the Horde!$B$B--Cairne Bloodhoof', 0, NULL);
INSERT INTO `achievement_reward` VALUES (1683, 0, 133, 0, 0, '', '', 0, 'Brewmaster');
INSERT INTO `achievement_reward` VALUES (1684, 133, 0, 0, 0, '', '', 0, 'Brewmaster');
INSERT INTO `achievement_reward` VALUES (1691, 0, 134, 0, 0, '', '', 0, 'Merrymaker');
INSERT INTO `achievement_reward` VALUES (1692, 134, 0, 0, 0, '', '', 0, 'Merrymaker');
INSERT INTO `achievement_reward` VALUES (1693, 0, 135, 0, 0, '', '', 0, 'The Love Fool');
INSERT INTO `achievement_reward` VALUES (1707, 135, 0, 0, 0, '', '', 0, 'The Love Fool');
INSERT INTO `achievement_reward` VALUES (1784, 0, 84, 0, 0, '', '', 0, 'Chef');
INSERT INTO `achievement_reward` VALUES (1793, 138, 137, 0, 0, '', '', 0, 'Matron Patron');
INSERT INTO `achievement_reward` VALUES (1956, 0, 0, 43824, 16128, 'Higher Learning', 'Congratulations on completing your studies on The Schools of Arcane Magic. In recognition of your dedication, I\'m enclosing this special volume completing the series.$B$BI believe you\'ll find this tome particularly entertaining. But I\'ll leave that for your discovery.$B$BSincerely,$B$BRhonin', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2051, 140, 140, 0, 0, '', '', 0, 'Of the Nightfall');
INSERT INTO `achievement_reward` VALUES (2054, 121, 121, 0, 0, '', '', 0, 'Twilight Vanquisher');
INSERT INTO `achievement_reward` VALUES (2096, 0, 0, 44430, 29478, 'The Coin Master', 'Greetings and congratulations on collecting the full set of Dalaran coins! As a reward for all your hard work I have enclosed a freshly minted Titanium Seal of Dalaran. This is a special coin that we only grant to the most ardent of collectors.$B$BI hope you enjoy this special reward. You\'ve earned it!$B$BSincerely,$BJepetto Joybuzz', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2136, 0, 0, 44160, 26917, 'Glory of the Hero', 'Champion,$B$BWord has traveled to Wyrmrest Temple of the great heroic deeds you have accomplished since arriving in Northrend.$B$BYour bravery should not go unrecognized. Please accept this gift on behalf of the Aspects. Together we shall rid Azeroth of evil, once and for eternity.$B$BAlexstrasza the Life-Binder', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2143, 0, 0, 44178, 32216, 'Leading the Cavalry', 'I couldn\'t help but to notice how good you are with the livestock. With all the activity around here, business has been better than ever for me. I don\'t suppose you\'d mind looking after this Albino Drake for me? I simply don\'t have enough spare minutes in the day to care for all of these animals. Yours, Mei', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2144, 0, 0, 44177, 26917, 'Time and Time again', 'With the drums of war pounding in the distance, it is easy for the denizens of Azeroth to forget all that life has to offer.$B$BYou, on the other hand, have maintained the dignity of the good races of Azeroth with your ability to remember what we fight for. To not celebrate our victories is another form of defeat. Remeber that well, Reveler.$B$BMay others be inspired by your good cheer,$B$BAlexstrasza the Life-Binder', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2145, 0, 0, 44177, 26917, 'Time and Time again', 'With the drums of war pounding in the distance, it is easy for the denizens of Azeroth to forget all that life has to offer.$B$BYou, on the other hand, have maintained the dignity of the good races of Azeroth with your ability to remember what we fight for. To not celebrate our victories is another form of defeat. Remeber that well, Reveler.$B$BMay others be inspired by your good cheer,$B$BAlexstrasza the Life-Binder', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2186, 141, 141, 44175, 81000, '', '', 0, 'The Immortal');
INSERT INTO `achievement_reward` VALUES (2187, 142, 142, 0, 0, '', '', 0, 'The Undying');
INSERT INTO `achievement_reward` VALUES (2188, 143, 143, 0, 0, '', '', 0, 'Jenkis Leeeeroy');
INSERT INTO `achievement_reward` VALUES (2336, 145, 145, 0, 0, '', '', 0, 'the Insane');
INSERT INTO `achievement_reward` VALUES (2516, 0, 0, 44841, 28951, 'A Friend to Fawn Over', 'Hello!$B$BI understand you\'ve managed to give even that mischievous Stinker a warm and loving home... I was hoping you might consider taking in another wayward orphan?$B$BThis little fawn is a shy one, but you\'ll have no trouble winning her friendship with the enclosed: her favorite salt lick!$B$B--Breanni', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2760, 147, 0, 0, 0, '', '', 0, 'of Darnassus');
INSERT INTO `achievement_reward` VALUES (2761, 146, 0, 0, 0, '', '', 0, 'of the Exodar');
INSERT INTO `achievement_reward` VALUES (2762, 113, 0, 0, 0, '', '', 0, 'of Gnomeregan');
INSERT INTO `achievement_reward` VALUES (2763, 148, 0, 0, 0, '', '', 0, 'of Ironforge');
INSERT INTO `achievement_reward` VALUES (2764, 149, 0, 0, 0, '', '', 0, 'of Stormwind');
INSERT INTO `achievement_reward` VALUES (2765, 0, 150, 0, 0, '', '', 0, 'of Orgrimmar');
INSERT INTO `achievement_reward` VALUES (2766, 0, 151, 0, 0, '', '', 0, 'of Sen\'Jin');
INSERT INTO `achievement_reward` VALUES (2767, 0, 152, 0, 0, '', '', 0, 'of Silvermoon');
INSERT INTO `achievement_reward` VALUES (2768, 0, 153, 0, 0, '', '', 0, 'of Thunder Bluff');
INSERT INTO `achievement_reward` VALUES (2769, 0, 154, 0, 0, '', '', 0, 'of the Undercity');
INSERT INTO `achievement_reward` VALUES (2796, 0, 0, 0, 27487, 'Welcome to the Brew of the Month Club!', '$N,$B$BWelcome to the Brew of the Month club! This club is dedicated to bringing you some of the finest brew in all the realms.$B$BEvery month a new brew will be mailed directly to you. If you enjoy that brew and want more, talk to the Brew of the Month club members there.$B$BAgain, welcome to the club, $N.$B$B- Brew of the Month Club', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2797, 155, 0, 0, 0, '', '', 0, 'Noble Gardener');
INSERT INTO `achievement_reward` VALUES (2798, 0, 155, 0, 0, '', '', 0, 'Noble Gardener ');
INSERT INTO `achievement_reward` VALUES (2816, 0, 156, 0, 0, '', '', 0, 'Exalted Argent Champion of the Horde');
INSERT INTO `achievement_reward` VALUES (2817, 156, 0, 0, 0, '', '', 0, 'Exalted Argent Champion of the Alliance');
INSERT INTO `achievement_reward` VALUES (2903, 161, 161, 0, 0, '', '', 0, 'Champion of Ulduar');
INSERT INTO `achievement_reward` VALUES (2904, 160, 160, 44164, 81000, '', '', 0, 'Conqueror of Ulduar');
INSERT INTO `achievement_reward` VALUES (2957, 0, 0, 45802, 28070, 'Glory of the Ulduar Rider', 'Dear $N,$B$BI hope ye\'re doing well and that ye\'ve had time to recover from our shennanigans in Ulduar.$B$BMe lads from the prospecting team happened upon this poor \'alf dead riding-drake hatchling. Must\'ve been an Iron Dwarf experiment of some sort.$B$BWe\'ve patched him back to health and you\'ll find he\'s not so wee anymore! None of us know much about riding anything but rams and pack mules and since we owed ye one for what ye did back there... We thought perhaps you\'d accept him as a gift.$B$BYours,$BBrann Bronzebeard', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2958, 0, 0, 45801, 28070, 'Heroic: Glory of the Ulduar Rider', 'Dear $N,$B$BI hope ye\'re doing well and that ye\'ve had time to recover from our shennanigans in Ulduar.$B$BMe lads from the prospecting team happened upon this poor \'alf dead riding-drake hatchling. Must\'ve been an Iron Dwarf experiment of some sort.$B$BWe\'ve patched him back to health and you\'ll find he\'s not so wee anymore! None of us know much about riding anything but rams and pack mules and since we owed ye one for what ye did back there... We thought perhaps you\'d accept him as a gift.$B$BYours,$BBrann Bronzebeard', 0, NULL);
INSERT INTO `achievement_reward` VALUES (3036, 164, 164, 0, 0, '', '', 0, 'Observed 10 player');
INSERT INTO `achievement_reward` VALUES (3037, 165, 165, 0, 0, '', '', 0, 'Observed the Astral Walker');
INSERT INTO `achievement_reward` VALUES (3117, 158, 158, 0, 0, '', '', 0, 'Realm First! Death\'s Demise');
INSERT INTO `achievement_reward` VALUES (3259, 159, 159, 0, 0, '', '', 0, 'Realm First! Celestial Defender');
INSERT INTO `achievement_reward` VALUES (3316, 166, 166, 0, 0, '', '', 0, 'Herald of the Titans');
INSERT INTO `achievement_reward` VALUES (3478, 168, 0, 44810, 28951, 'A Gobbler not yet Gobbled', 'Can you believe this Plump Turkey made it through November alive?$N$NSince all his friends have been served up on Bountiful Tables with sides of Cranberry Chutney and Spice Bread and... ooo... I\'m getting hungry. But anyhow! He\'s all alone, now, so I was hoping you might be willing to take care of him. There simply isn\'t enough room left in my shop!$N$NJust keep him away from cooking fires, please. He gets this strange look in his eyes around them...$N$N-Breanni', 0, NULL);
INSERT INTO `achievement_reward` VALUES (3656, 0, 168, 44810, 28951, 'A Gobbler not yet Gobbled', 'Can you believe this Plump Turkey made it through November alive?$N$NSince all his friends have been served up on Bountiful Tables with sides of Cranberry Chutney and Spice Bread and... ooo... I\'m getting hungry. But anyhow! He\'s all alone, now, so I was hoping you might be willing to take care of him. There simply isn\'t enough room left in my shop!$N$NJust keep him away from cooking fires, please. He gets this strange look in his eyes around them...$N$N-Breanni', 0, NULL);
INSERT INTO `achievement_reward` VALUES (3857, 0, 0, 49052, 34924, 'Master of Isle of Conquest', 'Honorable $N,$B$BFor your deeds upon the Isle of Conquest, it is my honor to present you with this tabard. Wear it proudly.$B$BHigh Commander, 7th Legion', 0, NULL);
INSERT INTO `achievement_reward` VALUES (3957, 0, 0, 49054, 34922, 'Master of Isle of Conquest', 'Honorable $N,$B$BFor your deeds upon the Isle of Conquest, it is my honor to present you with this tabard. Wear it proudly.$B$BOverlord Agmar', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4078, 170, 170, 0, 0, '', '', 0, 'Realm First! Grand Crusader');
INSERT INTO `achievement_reward` VALUES (4079, 0, 0, 49098, 36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4080, 171, 171, 0, 0, '', '', 0, 'A Tribute to Dedicated Insanity');
INSERT INTO `achievement_reward` VALUES (4156, 0, 0, 49096, 36095, 'A Tribute to Immortality', 'Dear $N,$B$BTales of your recent performance in the Trial of the Grand Crusader will be told,and retold,for ages to come. As the Argent Crusade issued its call for the greatest champions of Azeroth to test their mettle in the crucible of the Coliseum,I hoped against hope that beacons of light such as you and your companions might emerge from the fray.$B$BWe will need you direly in the coming battle against the Lich King. But on this day,rejoice and celebrate your glorious accomplishment and accept this gift of one of our very finest warhorses. When the Scourge see its banner looming on the horizon,hero,their end shall be nigh!$B$BYours with Honor,$BTirion Fordring', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4477, 172, 172, 0, 0, '', '', 0, 'Looking For Many the Patient ');
INSERT INTO `achievement_reward` VALUES (4478, 0, 0, 49912, 32842, 'P.U.G.', 'Dear very patient individual,$B$BWe\'d like to recognize your tenacity in running dungeons with people you probably haven\'t met before. Hopefully you even showed some rookies the ropes in your pick-up groups.$B$BIn short, we heard you like pugs. So here\'s a pug for your pug, so you can pug while you pug. Or something.$B$BHugs,$B$BYour friends on the WoW Dev Team.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4530, 175, 175, 0, 0, '', '', 0, 'The Frozen Throne 10 player');
INSERT INTO `achievement_reward` VALUES (4583, 174, 174, 0, 0, '', '', 0, 'Bane of the Fallen King');
INSERT INTO `achievement_reward` VALUES (4584, 173, 173, 0, 0, '', '', 0, 'The Light of Dawn');
INSERT INTO `achievement_reward` VALUES (4597, 175, 175, 0, 0, '', '', 0, 'The Frozen Throne 25 player');
INSERT INTO `achievement_reward` VALUES (4598, 176, 176, 0, 0, '', '', 0, 'The Ashen Verdict Exalted');
INSERT INTO `achievement_reward` VALUES (4602, 0, 0, 51954, 37120, 'Glory of the Icecrown Raider', '$N,$B$BAs the Lich King\'s influence wanes, some of his more powerful minions have wrested free of his grasp.$B$BThis frost wyrm drake my men captured is a prime example. She has a will of her own and then some.$B$BOne of my men lost an arm breaking her in, but she now takes to riders fairly well -- provided they themselves are skilled and strong willed.$B$BPlease accept this magnificent beast as a gift from the Knights of the Ebon Blade. It was an honor to fight along your side in this greatest of battles.$B$BWith honor,$BDarion Mograine.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4603, 0, 0, 51955, 37120, 'Glory of the Icecrown Raider', '$N,$B$BAs the Lich King\'s influence wanes, some of his more powerful minions have wrested free of his grasp.$B$BThis frost wyrm drake my men captured is a prime example. She has a will of her own and then some.$B$BOne of my men lost an arm breaking her in, but she now takes to riders fairly well -- provided they themselves are skilled and strong willed.$B$BPlease accept this magnificent beast as a gift from the Knights of the Ebon Blade. It was an honor to fight along your side in this greatest of battles.$B$BWith honor,$BDarion Mograine.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4784, 0, 0, 0, 37942, 'Emblem Quartermasters in Dalaran\'s Silver Enclave', 'Your achievements in Northrend have not gone unnoticed, friend.$B$BThe Emblems you have earned may be used to purchase equipment from the various Emblem Quartermasters in Dalaran.$B$BYou may find us there, in the Silver Enclave, where each variety of Emblem has its own quartermaster.$B$BWe look forward to your arrival!', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4785, 0, 0, 0, 37941, 'Emblem Quartermasters in Dalaran\'s Sunreaver Sanctuary', 'Your achievements in Northrend have not gone unnoticed, friend.$B$BThe Emblems you have earned may be used to purchase equipment from the various Emblem Quartermasters in Dalaran.$B$BYou may find us there, in the Sunreaver Sanctuary, where each variety of Emblem has its own quartermaster.$B$BWe look forward to your arrival!', 0, NULL);
INSERT INTO `achievement_reward` VALUES (686, 10018, 10018, 0, 0, '', NULL, 0, 'Ragnaros (Firelord title)');
INSERT INTO `achievement_reward` VALUES (239, 0, 0, 0, 0, '', NULL, 0, '25.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (1415, 96, 96, 0, 0, '', NULL, 0, 'Realm First! Grand Master Alchemist');
INSERT INTO `achievement_reward` VALUES (1419, 101, 101, 0, 0, '', NULL, 0, 'Realm First! First Aid Grand Master');
INSERT INTO `achievement_reward` VALUES (1420, 102, 102, 0, 0, '', NULL, 0, 'Realm First! Grand Master Angler');
INSERT INTO `achievement_reward` VALUES (1414, 97, 97, 0, 0, '', NULL, 0, 'Realm First! Grand Master Blacksmith');
INSERT INTO `achievement_reward` VALUES (1417, 99, 99, 0, 0, '', NULL, 0, 'Realm First! Grand Master Enchanter');
INSERT INTO `achievement_reward` VALUES (1418, 100, 100, 0, 0, '', NULL, 0, 'Realm First! Grand Master Engineer');
INSERT INTO `achievement_reward` VALUES (1421, 103, 103, 0, 0, '', NULL, 0, 'Realm First! Grand Master Herbalist');
INSERT INTO `achievement_reward` VALUES (1423, 105, 105, 0, 0, '', NULL, 0, 'Realm First! Grand Master Jewelcrafter');
INSERT INTO `achievement_reward` VALUES (1424, 106, 106, 0, 0, '', NULL, 0, 'Realm First! Grand Master Leatherworker');
INSERT INTO `achievement_reward` VALUES (1425, 107, 107, 0, 0, '', NULL, 0, 'Realm First! Grand Master Miner');
INSERT INTO `achievement_reward` VALUES (1422, 104, 104, 0, 0, '', NULL, 0, 'Realm First! Grand Master Scribe');
INSERT INTO `achievement_reward` VALUES (1426, 108, 108, 0, 0, '', NULL, 0, 'Realm First! Grand Master Skinner');
INSERT INTO `achievement_reward` VALUES (1427, 109, 109, 0, 0, '', NULL, 0, 'Realm First! Grand Master Tailor');
INSERT INTO `achievement_reward` VALUES (1416, 98, 98, 0, 0, '', NULL, 0, 'Realm First! Cooking Grand Master');
INSERT INTO `achievement_reward` VALUES (457, 0, 0, 33225, 81000, 'Realm First! Level 80', 'Parabens por ser o primeiro jogador a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (462, 0, 0, 44151, 81000, 'Realm First! Level 80 Hunter', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (460, 0, 0, 44151, 81000, 'Realm First! Level 80 Mage', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (466, 0, 0, 44151, 81000, 'Realm First! Level 80 Druid', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (461, 0, 0, 44151, 81000, 'Realm First! Level 80 Death Knight', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (465, 0, 0, 44151, 81000, 'Realm First! Level 80 Paladin', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (464, 0, 0, 44151, 81000, 'Realm First! Level 80 Priest', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (458, 0, 0, 44151, 81000, 'Realm First! Level 80 Rogue', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (467, 0, 0, 44151, 81000, 'Realm First! Level 80 Shaman', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (463, 0, 0, 44151, 81000, 'Realm First! Level 80 Warlock', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (459, 0, 0, 44151, 81000, 'Realm First! Level 80 Warrior', 'Parabens por ser o primeiro da sua classe a alcançar o level 80! Visite o correio para ver sua recompensa.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (4576, 0, 0, 71636, 81000, 'Realm First! Fall of the Lich King', 'The king has been dethroned. Congratulations for being the Realm First! Here is your reward.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (1160, 94, 94, 20221, 81000, 'Three\'s Company: 2200', 'Parabens por alcançar 2200 rating em arenas 3v3! Aproveite seu novo titulo Warbringer e sua montaria.', 0, NULL);
INSERT INTO `achievement_reward` VALUES (10036, 0, 0, 0, 0, '', '', 0, 'Just the Two of Us: 2400');
INSERT INTO `achievement_reward` VALUES (10003, 10000, 10000, 30609, 81000, '', '', 0, 'Infernal Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (418, 62, 62, 34092, 81000, '', '', 0, 'Merciless Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (419, 71, 71, 37676, 81000, '', '', 0, 'Vengeful Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (420, 80, 80, 43516, 81000, '', '', 0, 'Brutal Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (3336, 157, 157, 46708, 81000, '', '', 0, 'Deadly Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (3436, 167, 167, 46171, 81000, '', '', 0, 'Furious Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (3758, 169, 169, 47840, 81000, '', '', 0, 'Relentless Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (4599, 177, 177, 50435, 81000, '', '', 0, 'Wrathful Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (2091, 42, 42, 0, 0, '', '', 0, 'Gladiator');
INSERT INTO `achievement_reward` VALUES (2092, 43, 43, 0, 0, '', '', 0, 'Duelist');
INSERT INTO `achievement_reward` VALUES (2093, 44, 44, 0, 0, '', '', 0, 'Rival');
INSERT INTO `achievement_reward` VALUES (2090, 45, 45, 0, 0, '', '', 0, 'Challenger');
INSERT INTO `achievement_reward` VALUES (10004, 10001, 10001, 80496, 81000, '', '', 0, 'Vicious Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10005, 10002, 10002, 80497, 81000, '', '', 0, 'Ruthless Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10006, 10003, 10003, 80498, 81000, '', '', 0, 'Cataclysmic Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10007, 10004, 10004, 80509, 81000, '', '', 0, 'Malevolent Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10008, 10005, 10005, 80511, 81000, '', '', 0, 'Tyrannical Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10009, 10006, 10006, 80513, 81000, '', '', 0, 'Grievous Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10010, 10007, 10007, 80514, 81000, '', '', 0, 'Prideful Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10011, 10008, 10008, 0, 0, '', '', 0, 'Primal Gladiator Mount (Custom Drake?)');
INSERT INTO `achievement_reward` VALUES (10012, 10009, 10009, 0, 0, '', '', 0, 'Wild Gladiator Mount (Custom Drake?)');
INSERT INTO `achievement_reward` VALUES (10013, 10010, 10010, 0, 0, '', '', 0, 'Warmongering Gladiator Mount (Custom Drake?)');
INSERT INTO `achievement_reward` VALUES (10014, 10011, 10011, 80517, 81000, '', '', 0, 'Vindictive Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10015, 10012, 10012, 80519, 81000, '', '', 0, 'Fearless Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10016, 10013, 10013, 80521, 81000, '', '', 0, 'Cruel Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10017, 10014, 10014, 80523, 81000, '', '', 0, 'Ferocious Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10018, 10015, 10015, 80524, 81000, '', '', 0, 'Fierce Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10019, 10016, 10016, 80525, 81000, '', '', 0, 'Dominant Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10020, 10017, 10017, 80527, 81000, '', '', 0, 'Demonic Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10021, 10018, 10018, 80528, 81000, '', '', 0, 'Dread Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10022, 10019, 10019, 80529, 81000, '', '', 0, 'Sinister Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10023, 10020, 10020, 80530, 81000, '', '', 0, 'Notorious Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10024, 10021, 10021, 80531, 81000, '', '', 0, 'Corrupted Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10025, 10022, 10022, 80532, 81000, '', '', 0, 'Sinful Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10026, 10023, 10023, 80533, 81000, '', '', 0, 'Unchained Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10037, 0, 0, 0, 0, '', '', 0, 'Just the Two of Us: 2700');
INSERT INTO `achievement_reward` VALUES (10038, 0, 0, 0, 0, '', '', 0, 'Three\'s Company: 2400');
INSERT INTO `achievement_reward` VALUES (10039, 0, 0, 0, 0, '', '', 0, 'Three\'s Company: 2700 - the Legend');
INSERT INTO `achievement_reward` VALUES (10034, 128, 128, 0, 0, '', '', 0, 'Hot Hot Hot Streak (Flawless Victor)');
INSERT INTO `achievement_reward` VALUES (1159, 163, 163, 0, 81000, 'Just the Two of Us: 2200', 'Parabens pelos 2200 de rating em x2! Aproveite seu novo titulo Vanquisher.', 0, 'Just the Two of Us: 2200');
INSERT INTO `achievement_reward` VALUES (2536, 0, 0, 44843, 32216, 'Mountain o\' Mounts', 'I\'ve heard your stables are nearly as extensive as mine, now. Impressive! Perhaps we can help one another.. I\'ve one too many dragonhawks, and hoped you could give this one a home. Naturally its been trained as a mount and not a hunting pet, and you\'ll find it as loyal and tireless as any other steed I raise. $B Yours again,Mei', 0, NULL);
INSERT INTO `achievement_reward` VALUES (2537, 0, 0, 44842, 32216, 'Mountain o\' Mounts', 'I\'ve heard your stables are nearly as extensive as mine, now. Impressive! Perhaps we can help one another.. I\'ve one too many dragonhawks, and hoped you could give this one a home. Naturally its been trained as a mount and not a hunting pet, and you\'ll find it as loyal and tireless as any other steed I raise. $B Yours again,Mei', 0, NULL);
INSERT INTO `achievement_reward` VALUES (10028, 10038, 10038, 0, 0, '', NULL, 0, 'Realm First! Halion 25 Heroic');
INSERT INTO `achievement_reward` VALUES (401, 0, 0, 0, 0, '', NULL, 0, 'Just the Two of Us: 2000');
INSERT INTO `achievement_reward` VALUES (10046, 0, 0, 0, 0, '', '', 0, 'Just the Two of Us: 3000');
INSERT INTO `achievement_reward` VALUES (405, 0, 0, 0, 0, '', NULL, 0, 'Three\'s Company: 2000');
INSERT INTO `achievement_reward` VALUES (10047, 0, 0, 0, 0, '', '', 0, 'Three\'s Company: 3000 - the Supreme');
INSERT INTO `achievement_reward` VALUES (513, 0, 0, 0, 0, '', NULL, 0, '100 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (515, 0, 0, 0, 0, '', NULL, 0, '500 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (516, 0, 0, 0, 0, '', NULL, 0, '1000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (512, 0, 0, 0, 0, '', NULL, 0, '5000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (509, 0, 0, 0, 0, '', NULL, 0, '10000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (869, 0, 0, 0, 0, '', NULL, 0, '50000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10041, 0, 0, 0, 0, '', NULL, 0, '150.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10042, 0, 0, 0, 0, '', NULL, 0, '200.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10043, 0, 0, 0, 0, '', NULL, 0, '300.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10044, 0, 0, 0, 0, '', NULL, 0, '400.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10045, 0, 0, 0, 0, '', NULL, 0, '500.000 Honorable Kills');
INSERT INTO `achievement_reward` VALUES (10078, 10036, 0, 80655, 32216, 'Lord of the Reins', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10075, 0, 0, 80571, 32216, 'Mountacular', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10077, 0, 10036, 80655, 32216, 'Lord of the Reins', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10082, 0, 0, 80455, 32216, 'A Horde of Hoofbeats', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10081, 0, 0, 80455, 32216, 'A Horde of Hoofbeats', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10076, 0, 0, 80571, 32216, 'Mountacular', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10083, 0, 0, 80453, 32216, 'Thanks for the Carry!', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10071, 0, 0, 80608, 32216, 'We\'re Going to Need More Saddles', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10073, 0, 0, 80588, 32216, 'Mount Parade', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10072, 0, 0, 80608, 32216, 'We\'re Going to Need More Saddles', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10074, 0, 0, 80587, 32216, 'Mount Parade', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10079, 0, 0, 80466, 32216, 'No Stable Big Enough', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10080, 0, 0, 80466, 32216, 'No Stable Big Enough', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10084, 0, 0, 80453, 32216, 'Thanks for the Carry!', '', 0, '');
INSERT INTO `achievement_reward` VALUES (10054, 10024, 10024, 80535, 81000, '', '', 0, 'Cosmic Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10055, 10027, 10027, 80536, 81000, '', '', 0, 'Eternal Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10056, 10029, 10029, 80537, 81000, '', '', 0, 'Crimson Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10085, 10085, 10085, 80538, 81000, '', '', 0, 'Obsidian Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10086, 10086, 10086, 80539, 81000, '', '', 0, 'Verdant Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10087, 0, 0, 0, 0, '', '', 0, 'DF S4 Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10088, 0, 0, 0, 0, '', '', 0, 'DF S5 Gladiator Mount');
INSERT INTO `achievement_reward` VALUES (10089, 0, 0, 0, 0, '', '', 0, 'DF S6 Gladiator Mount');

SET FOREIGN_KEY_CHECKS = 1;
