-- testar procs com BoP tbm (casters)
-- testar trinkets/ring/enchants tbm
-- test alguns procs consumiveis (NS druid/shaman/earth shield, flash insta etc)
-- mage fingers of frost/frostbite gain/consume on cast?

-- CLASSES
-- ========= CLOTH ==============
-- ▸▸Mage:   ---
-- * 

-- P test com bop/absorb/ou versus absorb:
-- fast missiles, pyro insta, frostbite, barrier explode on dmg, mini-stun, fingers of frost, blazing speed, disarm, ice armor


-- Current Behaviour
-- If you as a mage have an absorb effect from: Mana Shield/Ice Barrier/Power word shield/Arena Grand master etc. 
-- this as of now prevents proccs from the Slow effect from Ice Armor, aswell as frostbite/fiery payback/Blazing speed etc.

--
-- ▸▸ Warlock:  ---


-- P test com bop/absorb/ou versus absorb:

-- Backlash, Nightfall talent n proca vs absorb, glyph of corruption ?, Eradication proca vs absorb, coil heal, corruption heal, haunt heal, molten core e decimation, talvez crit do pet (demonology), 

-- 
-- ▸▸ Priest:  ---
-- * Fix Inspiration talent nao procando com Crit do Prayer of Mending
UPDATE `spell_proc_event` SET `SpellFamilyMask1` = '65572' WHERE `entry` = '-14892';   -- tava 65540
--
-- ========= LEATHER ==============
--

-- ▸▸ Druid:   ---
--
-- * Omen of Clarity/Clearcasting
-- UPDATE `spell_proc_event` SET `procFlags` = '87044' WHERE `entry` = '16864'; -- para funcionar sem melee spells(shred etc), se nao usa 87060 (melee spells + auto attack) (tava 87060)
--UPDATE `spell_proc_event` SET `ppmRate` = '3.8' WHERE `entry` = '16864';   -- ppmRate tava 3,5
UPDATE `spell_proc_event` SET `Cooldown` = '2000' WHERE `entry` = '16864';   -- Cooldown tava 0

-- glyph of omen of clarity
INSERT INTO `acore_world`.`spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83293, 0, 0, 1024, 0, 0, 65536, 65536, 0, 0, 101, 6000);


--
-- =Balance
-- * Custom Spell Moonfire/Insect Swarm dots 2% proc chance Starfire PvP Set 
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83007, 0, 7, 2097154, 0, 0, 262144, 65536, 0, 0, 2, 0);
-- 
-- * Custom Passive Spell - ao ganhar Wrath of Elune, reduz o cd do starfall em 3s (Wrath of Elune só é renovado se o buff é consumido)
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83253, 0, 7, 0, 0, 33554432, 1024, 0, 1, 0, 0, 0);
--
-- =Feral
--
-- * Custom Spell - proc Temporary Spell para Savage Roar ao usar Prowl
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83091, 0, 0, 16384, 0, 0, 1024, 0, 0, 0, 101, 0);
--
-- =Resto
--
-- P test com bop/absorb/ou versus absorb:
-- nature's grace, owl enrage, naturalize
--
-- ▸▸ Rogue:     ---
-- * 
--
-- P test com bop/absorb/ou versus absorb:
-- poisons, sword spec combat
-- ======== MAIL ==============
--
-- ▸▸ Hunter:    ---
-- * 
--
-- P test com bop/absorb/ou versus absorb:
-- MM auto attack (nature's dmg) proc chance, surv 3 stacks explosive shot, 
-- ▸▸ Shaman:    ---
--
-- * custom Glyph of Searing Flames (Searing Totem aplica debuff) - n funciona
--INSERT INTO `acore_world`.`spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83302, 0, 11, 1073741824, 0, 0, 65536, 1027, 2, 0, 0, 0);
--
-- stormblast (40% do stormstrike/WFury/LavaLash crit em 6s) -  [problema no dmg da off weapon do stormstrike, que da metade do dano, ta dando override no dano da main]
INSERT INTO `acore_world`.`spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83332, 0, 11, 8388608, 16777232, 4, 16, 2, 0, 0, 100, 0);
--
-- Passiva que proca [Maelstrom Weapon (Lava Burst)] ao procar [Maelstrom Weapon]
INSERT INTO `acore_world`.`spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83340, 0, 11, 0, 0, 512, 16384, 0, 1, 0, 101, 0);
--
-- * Custom 3.3.5b AT based Enhance Spell -4s Cooldown Feral Spirit on Stormstrike use
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83252, 0, 11, 0, 16777216, 0, 16, 0, 1, 0, 0, 0);
--
-- * (Custom) 2% chance de proc Lava Surge nos ticks do flame shock
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83242, 4, 11, 268435456, 0, 0, 262144, 1027, 0, 0, 2, 0);
--
-- * Lava Burst new (Custom) passive buff 5% chance de procar Lava burst (c/ half damage) ao castar Lava Burst
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83246, 4, 11, 0, 4096, 0, 65536, 3, 0, 0, 5, 0);
--
-- * Windfury Weapon passive (agora ignora absorb) -- tava 0 
UPDATE `spell_proc_event` SET `ProcEx` = '1095' WHERE `entry` = '33757';
-- * enhance Maeltrom Weapon (rank 5) ignora absorbs
UPDATE `spell_proc_event` SET `ProcEx` = '9287' WHERE `entry` = '51532';

-- * Futuro custom Glyph of Searing Flames (Searing Totem aplica debuff) - n funciona
INSERT INTO `acore_world`.`spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83302, 0, 11, 1073741824, 0, 0, 65536, 1027, 2, 0, 0, 0);


/*
-- P test com bop/absorb/ou versus absorb:
flametongue weapon n proca vs absorb
static shock n proca vs absorb
earth shield ?
water shield ?
lightning shield ?
hot enchant weapon ?

oks:
flurry
elemental devastation
clearcasting
lightning overload
*/

--
-- ======== PLATE =============
--
-- ▸▸ Paladin:   ---
--
-- * Judgements of the Wise ignora absorb (tava 262144)
UPDATE `spell_proc_event` SET `procEx` = '0' WHERE `entry` = -31876;

-- * The Art of War proca vs absorbs (tava 262146)
UPDATE `spell_proc_event` SET `procEx` = '2' WHERE `entry` = -53486;

-- * Righteous Vengeance proca vs absorb (tava 262146)
UPDATE `spell_proc_event` SET `procEx` = '2' WHERE `entry` = -53380;

-- * custom judgement range + move speed (futuro pvp tier set bonus)
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83202, 0, 10, 9437184, 0, 0, 16, 0, 0, 0, 100, 0);

-- * Vindication agora proca vs absorb (tava 0)
-- UPDATE `spell_proc_event` SET `procEx` = '3' WHERE `entry` = 9452; -- proca self com divine storm se colocar 3

-- P test com bop/absorb/ou versus absorb:
-- ??

--
-- ▸▸ Warrior      ---
-- * custom Spell - MS aumenta duraçao do rend em 3s
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83266, 0, 4, 33554432, 0, 0, 16, 0, 0, 0, 0, 0);

-- P test com bop/absorb/ou versus absorb:
-- Enrage? (vs absorb)

-- ▸▸ Death Knight ---
-- 

-- P test com bop/absorb/ou versus absorb:

-- ----------------------------------------------------------
-- ITEMS ----------------------------------------------------
-- ----------------------------------------------------------
-- Testar se procam com bop/absorb/ou versus absorb (proc trinkets) - ao msm tempo testar se procam facilmente como trocar de stance

-- PvPs:
-- Emblems:

-- Naxx:
-- Ulduar:
-- * Pyrite infuser (trinket ulduar 10 melee)
UPDATE `spell_proc_event` SET `cooldown` = '30000',`CustomChance` = '35' WHERE `entry` = '65013';   -- cooldown tava 45000

-- Trial of the Crusader:
-- Trial of the Grand Crusader:

-- Death's Choice / Death's Verdict - Normal (67702)
-- Death's Choice / Death's Verdict - Heroic (67771)

-- Mote of Flame Normal (67712)
-- Mote of Flame Heroic (67758)



-- Icecrown Citadel:

-- * Dislodged - Normal
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (71602, 0, 0, 0, 0, 0, 65536, 3, 1, 0, 0, 45000);
-- * Dislodged - Heroic
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (71645, 0, 0, 0, 0, 0, 65536, 3, 1, 0, 0, 45000);
-- Phylactery - Normal (71606)
-- Phylactery - Heroic (71637)

-- Ruby Sanctum:
-- * Charred Twilight Scale - normal
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (75465, 0, 0, 0, 0, 0, 331776, 1027, 0, 0, 30, 45000);
-- * Charred Twilight Scale - Heroic
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (75474, 0, 0, 0, 0, 0, 331776, 1027, 0, 0, 30, 45000);
-- Sharpened Twilight Scale - Normal (75455)
-- Sharpened Twilight Scale - Heroic (75457)


-- CUSTOM TRINKETS
-- * DBW
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 45000);
-- * Dislodged
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83105, 0, 0, 0, 0, 0, 65536, 3, 1, 0, 30, 45000);
-- * Phylactery
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 45000);
-- * Death's Verdict
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83100, 1, 0, 0, 0, 0, 332116, 262147, 0, 0, 35, 45000);
-- * WFS
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 45000);
-- * Sharpened
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 45000);
-- * Charred
INSERT INTO `spell_proc_event`(`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `procPhase`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (83103, 0, 0, 0, 0, 0, 331776, 1027, 0, 0, 30, 45000);


