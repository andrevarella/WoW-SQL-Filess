
-- npc_spellclick_spells:

-- spell aura mamoth 61424 nos Brutosaurs (creature_template entries)
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45181, 61424, 1, 0);
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45182, 61424, 1, 0);
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45183, 61424, 1, 0);
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45184, 61424, 1, 0);
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45186, 61424, 1, 0);
-- Grand Expedition Yak
INSERT INTO `npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45737, 61424, 1, 0);
-- Explorer's Jungle Hopper
INSERT INTO `acore_world`.`npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45485, 75953, 1, 0);
-- Stormwind Skychaser
INSERT INTO `acore_world`.`npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45337, 75953, 1, 0);
-- Orgrimmar Interceptor
INSERT INTO `acore_world`.`npc_spellclick_spells`(`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45338, 75953, 1, 0);



-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
-- vehicle_template_accessory:

-- 45741 = repair
-- 45740 = AH
-- 32639 = Repair do Mamute, 93070 = AH do Mall

-- Mighty Caravan Brutosaur
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45184, 45741, 1, 1, 'Mighty Caravan Brutosaur - Repair/Vendor', 6, 30000);
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45184, 45740, 2, 1, 'Mighty Caravan Brutosaur - AH', 6, 30000);
-- Brutosaurus 5
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45186, 45741, 1, 1, 'Brutosaurus 5 (white) - Repair/Vendor', 6, 30000);
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45186, 45740, 2, 1, 'Brutosaurus 5 (white) - AH', 6, 30000);
-- Brutosaurus 2
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45181, 45741, 1, 1, 'Brutosaurus 2 (black) - Repair/Vendor', 6, 30000);
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45181, 45740, 2, 1, 'Brutosaurus 2 (black) - AH', 6, 30000);
-- Brutosaurus 4
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45183, 45741, 1, 1, 'Brutosaurus 4 - Repair/Vendor', 6, 30000);
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45183, 45740, 2, 1, 'Brutosaurus 4 - AH', 6, 30000);
-- Brutosaurus 3
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45182, 45741, 1, 1, 'Brutosaurus 3 - Repair/Vendor', 6, 30000);
INSERT INTO `vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45182, 45740, 2, 1, 'Brutosaurus 3 - AH', 6, 30000);
-- Grand Expedition Yak
INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45751, 1, 1, 'Grand Expedition Yak - Transmog', 6, 30000);
INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45752, 2, 1, 'Grand Expedition Yak - Repair/Vendor', 6, 30000);
-- Tendas (precisa adicionar mais seat_id e um script para a tenda sair quando um npc é kickado/removido da mount)
--INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45739, 3, 1, 'Grand Expedition Yak - Tenda NPC Transmog (Esquerdo)', 6, 30000);
--INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45738, 4, 1, 'Grand Expedition Yak - Tenda NPC Repair (Direito)', 6, 30000);
INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45749, 3, 1, 'Grand Expedition Yak - Seat NPC Transmog (Esquerdo)', 6, 30000);
INSERT INTO `acore_world`.`vehicle_template_accessory`(`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (45737, 45750, 4, 1, 'Grand Expedition Yak - Seat NPC Repair (Direito)', 6, 30000);


-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
-- creature_template_addon

-- necessario para deixar o creature_template entry do NPC em 'sitting'
-- Brutosaur NPC - Action House
INSERT INTO `creature_template_addon`(`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (45740, 0, 0, 1, 1, 0, 0, '');
-- Brutosaur NPC - Repair
INSERT INTO `creature_template_addon`(`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (45741, 0, 0, 1, 1, 0, 0, '');

-- Yak NPCs
INSERT INTO `acore_world`.`creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (45751, 0, 0, 1, 1, 0, 0, '');
INSERT INTO `acore_world`.`creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (45752, 0, 0, 1, 1, 0, 0, '');



-- -----------------------------------------------------------------------------------------
-- dbcs:
VehicleUIIndSeat.dbc = controla lado da foto/textura da mount (lado que algum npc ta montado na textura)
VirtualSeatIndex 1 = Lado Esquerdo
VirtualSeatIndex 2 = Lado Direito
XPos = Esq ou Direita (menor = mais pra esquerda)
YPos = Cima ou Baixo

VehicleSeat.dbc = Controla qual lugar do seat/posiçao/altura etc
attach14 = lado direito(pelo menos no dinossauro), PassengerRoll = girar a posiçao (tava de cabeça p baixo antes no dino, um lado é invertido do outro attach se tiver mais de 1)
AttachOffsetX = mais perto ou longe da mount
AttachOffSetY = mais pra cima ou baixo do assento
AttachOffSetZ = pra esquerda ou direita do assento (ou é trocado com o offsetY, Z = altura, y = esq direita)

attach16 = direito