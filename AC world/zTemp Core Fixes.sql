

-- Core Fixes (apos atualizar o core, deleta-los)



-- Fix Scourlord Tyrannus bug em Pit of Saron (se wipar no ultimo boss, o boss some)
-- [flags_extra tava 3221225472] immunity_knockback e +2147483648	HARD_RESET
-- No update fica apenas IMMUNITY_KNOCKBACK
UPDATE `creature_template` SET `flags_extra` = `flags_extra` &~ 2147483648 WHERE `entry` IN (36658);