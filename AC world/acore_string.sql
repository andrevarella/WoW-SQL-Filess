
-- arena e BG queues/announcers
UPDATE `acore_string` SET `content_default` = '|cff00ff00[BG Queue]:|r %s -- [%u-%u] [%u/%u]|r' WHERE `entry` = 712;
UPDATE `acore_string` SET `content_default` = '|cff00ff00[BG Queue]:|r %s -- [%u-%u] Started!|r' WHERE `entry` = 717;
UPDATE `acore_string` SET `content_default` = '|cff00ff00Arena Team:|r %s - joined %ux%u (%u rating, %u mmr)|r' WHERE `entry` = 718;
UPDATE `acore_string` SET `content_default` = '|cff00ff00Arena Team:|r %s - exited %ux%u (%u rating, %u mmr)|r' WHERE `entry` = 719;
UPDATE `acore_string` SET `content_default` = '|cffff0000[Skirmish Announcer]:|r %s (%s) -- [%u-%u] [%u/%u]|r' WHERE `entry` = 726;



-- ||||||||||||||||||||||||||||||||||||| --
-- modules:


-- mod notify mute
UPDATE `acore_string` SET `content_default` = 'Jogador %s está mutado e não pode responder. Tempo restante: %s' WHERE `entry` = 13000;

-- mod transmog (player settings)
UPDATE `acore_string` SET `content_default` = 'Sistema de Transmog ligado, relogue para ativar.' WHERE `entry` = 11111;
UPDATE `acore_string` SET `content_default` = 'Sistema de Transmog desligado, relogue para desativar.' WHERE `entry` = 11112;