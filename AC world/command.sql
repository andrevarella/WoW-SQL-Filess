DELETE FROM `command` WHERE `name` = 'spect leave'; 
DELETE FROM `command` WHERE `name` = 'spect reset'; 
DELETE FROM `command` WHERE `name` = 'spect spectate'; 
DELETE FROM `command` WHERE `name` = 'spect version'; 
DELETE FROM `command` WHERE `name` = 'spect watch'; 
DELETE FROM `command` WHERE `name` = 'spect'; 

INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate', 0, '');
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('sp', 0, '');
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate player', 0, '');
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate pov', 0, '');
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate reset', 0, '');
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate leave', 0, '');


-- já existe o comando /dismount, n vejo pra q ter esse (só mais um commando p aparecer no .commands)
UPDATE `command` SET `security` = '4' WHERE `name` = 'dismount';

-- comando .settings announcer (desativar arena/bg/autobroadcast apenas p o player no chat)
UPDATE `command` SET `security` = 0 WHERE `name` = 'settings announcer';

-- nao tinha nada no help antes, agora fica mais facil de usar o comando .skirmish
UPDATE `command` SET `help` = 'Usage: .skirmish [arena] [XvX] [Nick1] [Nick2] ... [NickN]. \r\n[arena] can be \"all\" or comma-separated list of possible arenas. [XvX] can be 1v1, 2v2, 3v3, 5v5. \r\nArenas: (NA = Nagrand Arena, BE = Blade\'s Edge, RL = Ruins of Lordaeron, DS = Dalaran Sewers, RV = Ring of Valor)' WHERE `name` = 'skirmish';


-- modules:
-- IMO é desnecessario ter esse comando se quase ninguem vai usar
UPDATE `command` SET `security` = 4, `help` = 'Syntax: weekendxp rate $value \nSet your experience rate up to the allowed value.' WHERE `name` = 'weekendxp rate';
