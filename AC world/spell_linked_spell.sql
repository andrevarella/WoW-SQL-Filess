-- Bug Fixes
-- Shaman
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (51533, 58876, 0, 'Feral Spirit casta Spirit Walk (4s immune a slow/root)');

------------------------------------
-- Custom Spells

-- Debuffs Temporarios p Track CD (o debuff nao tem efeito, é só pra trackar msm)
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (45182, 79500, 0, 'Cheat Death proca [Cheat Death ICD Debuff]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (31884, 79501, 0, 'Avenging Wrath proca [Avenging Wrath Forbearance 30s]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (21169, 79503, 0, 'Reincarnated proca [Reincarnation ICD Debuff]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (31616, 79502, 0, 'Nature\'s Guardian proca [Nature\'s Guardian ICD Debuff]');

-- Mana Regen Secondary/Primary Spec
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (63644, 83012, 0, '[Activate Secondary Spec] Proca Mana Regen');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (63645, 83012, 0, '[Activate Primary Spec] proca Mana Regen');

-- General
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (83203, 59646, 0, 'Shadowmeld (Custom): Sanctuary');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (83203, 62196, 0, 'Shadowmeld (Custom): Force deselect');

-- Custom Class Spells
-- Priest
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (64128, 83089, 0, 'Body and Soul Rank1 remove Slows');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (65081, 83089, 0, 'Body and Soul Rank2 remove Slows');

-- Warlock
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83219, 83220, 0, 'Soul Swap (pra ter travel time nos dots)');
-- Talvez mudar pro bonus pvp 4p warlock modificar o cleave do pet pra procar Mortal Wound (25646)
--INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (47994, 25646, 0, 'Warlock Felguard Cleave (Rank 4) proca Mortal Wound 15% healing reduction (stack até 2)');

-- Mage


-- Rogue
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (45182, 85107, 0, 'Cheat Death Proca [Cheat Death Heal] ');

-- Druid
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83122, -62071, 0, 'Savage Roar (0 CP Glyph)');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (83122, 62071, 0, 'Savage Roar (0 CP Glyph)');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-46832, 83010, 0, 'Remover [Moonkin Starfire Bonus Passive] proca [Unlearn Starfire DoT Bonus]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46832, 83009, 0, '[Moonkin Starfire Bonus Passive] proca [Learn Starfire DoT Bonus]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83121, 83122, 0, 'Perder [Buff Temporario Prowl PvP Set] ganha [Savage Roar 10s]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-5215, -83121, 0, 'Perder [Prowl] perde [Buff Temporario Prowl PvP Set]');

-- glyph of lunar inspiration
INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83299, 83325, 0, 'Perder [Glyph of Lunar Inspiration] proca [Unlearn Glyph of Lunar Inspiration]');
-- glyph of prowl - unlearn
INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83311, 83315, 0, 'Perder [Glyph of Prowl] proca [Unlearn Glyph of Prowl Hidden Aura]');
-- glyph of versatile predator - da Unlearn na hidden aura após perder o glyph (hidden aura p fazer spells castar em cat)
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83321, 83328, 0, 'Perder [Glyph of Versatile Predator] proca [Unlearn Glyph of Versatile Predator]');
-- glyph of versatile predator - perder predatory swiftness perde proc hidden (insta spells usaveis em qlqr forma)
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-69369, -83327, 0, 'Perder [Predator\'s Swiftness] perde [Glyph of Versatile Predator Hidden Aura]');
-- nao inserido - Glyph of versatile predator [da unlearn na spell que aumenta cd do cyc após perder a Hidden Aura do Versatile Predator]
-- INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83327, 83331, 0, 'Perder [Aura Glyph of Versa Predator] proca [Unlearn Glyph +5s Cyclone CD]');

-- Shaman
-- Maelstrom Weapon (Lava Burst) remove buff do Maelstrom Weapon e vice-versa
INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-53817, -83341, 0, 'Perder [Maelstrom Weapon] Perde [Maelstrom Weapon Lava Burst]');
INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-83341, -53817, 0, 'Perder [Maelstrom Weapon Lava Burst] Perde [Maelstrom Weapon]');

-- NAO INSERIDOS:
-- glyph of stormstrike / stormblast dot
--INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (55446, 83334, 0, 'Ganhar [Glyph of Stormstrike] proca [Learn Stormblast Passive]');
--INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-55446, 83335, 0, 'Perder [Glyph of Stormstrike] proca [Unlearn Stormblast Passive]');
-- Maelstrom Weapon Learn/unlearn
--INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (51532, 83338, 0, 'Learn no talent 5/5 [Maelstrom Weapon] proca [Learn Maelstrom Weapon 83340]');
--INSERT INTO `acore_world`.`spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-51532, 83339, 0, 'Unlearn no talent 5/5 [Maelstrom Weapon] proca [Unlearn Maelstrom Weapon 83340]');

-- Hunter


-- Paladin
-- DK

-- Warrior
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46917, 83019, 0, 'Titan\'s Grip da learn [Spell Reflection em Berserker Stance]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-46917, 83020, 0, '[Unlearn] Titan\'s Grip da [Unlearn Berserker Stance Spell Reflection]');




------------------------------------
-- PvP Spells

-- BGs
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-74411, -83008, 0, 'Perder [Dampening - BG] remove [Battleground Haste] Buff');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (26015, -83008, 0, '[Ended Battleground] remove [Battleground Haste] Buff');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-44521, -83008, 0, 'Ao perder Preparation (BG), perde Battleground Haste');
-- INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (74411, 83008, 0, 'Ganha [Battleground Haste] ao entrar em BG'); -- del later

-- Arena
-- INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (32727, 83025, 0, 'Ganhar [Arena Preparation], ganha [Arena Haste] Buff'); -- del later
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-74410, -83025, 0, 'Perder [Arena Dampening], perde [Arena Haste] Buff');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39328, -41406, 0, '[Arena Ends] perde Dampening (+1% DMG/Healing por stack)');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-74410, -41406, 0, 'Perder [Arena Dampening], perde [Dampening (+1% DMG/Healing por stack)]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-74410, -83027, 0, 'Perder [Arena Dampening], perde [Dampening a cada 8 segundos]');
INSERT INTO `spell_linked_spell`(`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-74410, -83026, 0, 'Perder [Arena Dampening], perde [Dampening depois de 8min]');