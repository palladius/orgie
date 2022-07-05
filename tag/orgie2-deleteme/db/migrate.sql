
# questi comandi copiano DB esistente e mettono su DB nuovo... compatibile per definizione con rails :)
# proviamolo
#Base: dev.goliardia.it DB goliardia_prod
#DEST: dev.goliardia.it DB goliardia_prod

#; create database goliardia_devel ; 

#drop table `goliardia_devel`.`orgie2_links` IF EXISTS ;

CREATE TABLE IF NOT EXISTS `goliardia_devel`.`orgie2_links` (
	`ID_link` int( 11 ) NOT NULL default '0',
	`titolo` varchar( 255 ) default NULL ,
	`id_login` int( 11 ) default NULL ,
	`id_oggettoPuntato` int( 11 ) default NULL ,
	`Data_creazione` datetime default NULL ,
	`tipo` varchar( 255 ) default NULL ,
	`m_battiva` tinyint( 1 ) NOT NULL default '0',
	`URLlink` varchar( 255 ) default NULL ,
	`URLlinkFoto` varchar( 255 ) default NULL ,
	`m_bfotoattiva` tinyint( 1 ) NOT NULL default '0',
	`Descrizione` longtext,
	PRIMARY KEY ( `ID_link` )
) ENGINE = MYISAM DEFAULT CHARSET = latin1 ;

#; copia tabella da PROD a QUI
INSERT INTO `goliardia_devel`.`orgie2_links` SELECT * FROM `goliardia_prod`.`linkz` ;
ALTER TABLE `orgie2_links` CHANGE `ID_link` `id` INT( 11 ) NOT NULL DEFAULT '0' ;
ALTER TABLE `orgie2_links` CHANGE `titolo` `title` VARCHAR( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ;
ALTER TABLE `orgie2_links` CHANGE `id_login` `user_id` INT( 11 ) NULL DEFAULT NULL ;
#; created_at and updated_at e un datetime vediamo di farlo compatibile se possibile...
ALTER TABLE `orgie2_links` CHANGE `Data_creazione` `created_at` DATETIME NULL DEFAULT NULL  ;
ALTER TABLE `orgie2_links` CHANGE `id_oggettoPuntato` `entity_id` INT( 11 ) NULL DEFAULT NULL COMMENT 'id of polymorphic entity' ;
ALTER TABLE `orgie2_links` CHANGE `tipo` `entity_type` VARCHAR( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'type of polymorphic entity' ;
ALTER TABLE `orgie2_links` CHANGE `m_battiva` `active` TINYINT( 1 ) NOT NULL DEFAULT '0' ;
ALTER TABLE `orgie2_links` CHANGE `URLlink` `page_url` VARCHAR( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL  ;
ALTER TABLE `orgie2_links` CHANGE `URLlinkFoto` `photo_url` VARCHAR( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL  ;
ALTER TABLE `orgie2_links` CHANGE `m_bfotoattiva` `photo_active` TINYINT( 1 ) NOT NULL DEFAULT '0' ;
ALTER TABLE `orgie2_links` CHANGE `Descrizione` `description` LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL  ;
