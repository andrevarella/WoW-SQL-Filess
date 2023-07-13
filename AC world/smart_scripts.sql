-- Marrowgar 10n - reset cds e BL ao matar o boss
INSERT INTO `smart_scripts`(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (36612, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 222, 0, 0, 0, 0, 0, 0, 18, 50, 0, 0, 0, 0, 0, 0, 0, 'Marrowgar 10N - Reset CDs e BL (ao matar o boss)');
-- marrowgar 10n 
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 36612;



-- entryorguid

-- source_type (usar 0 msm acho)
Object type: creature, game object, spell. see table below for values

Name	Value
SMART_SCRIPT_TYPE_CREATURE          0
SMART_SCRIPT_TYPE_GAMEOBJECT	    1
SMART_SCRIPT_TYPE_AREATRIGGER	    2
SMART_SCRIPT_TYPE_TIMED_ACTIONLIST	9

-- comment
-- id = se já existir um entry, ex: entry 1245 já tem Cast Spell on Death, ai precisa add id 1 no segundo entry igual
-- event_type

SMART_EVENT_KILL	5	CooldownMin	CooldownMax	Player only (0/1)	Creature entry (if param3 is 0)		On Creature Kill (wipe)
SMART_EVENT_DEATH	6					                                                             	On Creature Death(kill no boss)


-- action_type

SMART_ACTION_CU_ENCOUNTER_START  = 222,    // Resets cooldowns on all targets and removes Heroism debuff(s)

-- action_param = spell (no caso de mobs que morrem e castam spell)


--

Quick notes:

Always update creature_template,gameobject_template or areatrigger_scripts with:
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = y;

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = y;

INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (y, 'SmartTrigger');