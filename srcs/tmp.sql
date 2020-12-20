CREATE DATABASE absolut_db DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON absolut_db.* TO 'absolut_user'@'localhost' IDENTIFIED BY '123qwe';
USE absolut_db;
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Address'
-- 
-- ---

DROP TABLE IF EXISTS `Address`;
		
CREATE TABLE `Address` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Region` VARCHAR(10) NULL DEFAULT '',
  `City` VARCHAR(10) NULL DEFAULT '',
  `Street` VARCHAR(20) NULL DEFAULT '',
  `House_num` INTEGER NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Contact_person'
-- 
-- ---

DROP TABLE IF EXISTS `Contact_person`;
		
CREATE TABLE `Contact_person` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) NULL DEFAULT '',
  `Phone_num` VARCHAR(11) NULL DEFAULT '',
  `email` VARCHAR(20) NULL DEFAULT '',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Organization'
-- 
-- ---

DROP TABLE IF EXISTS `Organization`;
		
CREATE TABLE `Organization` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL DEFAULT '',
  `INN` INTEGER NULL DEFAULT '0',
  `KPP` INTEGER NULL DEFAULT '0',
  `Address_ID` INTEGER NULL DEFAULT '0',
  `Contact_pers_ID` INTEGER NULL DEFAULT '0',
  `Participation_num` INTEGER NULL DEFAULT '0',
  `Win_num` INTEGER NULL DEFAULT '0',
  `Scope` VARCHAR(100) NULL DEFAULT '',
  `Last_win_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (Address_ID)  REFERENCES Address (id),
FOREIGN KEY (Contact_pers_ID)  REFERENCES Contact_person (id)
);

-- ---
-- Table 'Purchase_plan'
-- 
-- ---

DROP TABLE IF EXISTS `Purchase_plan`;
		
CREATE TABLE `Purchase_plan` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FL` INTEGER NULL DEFAULT '0',
  `Customer_ID` INTEGER NULL DEFAULT '0',
  `Trading_value` INTEGER NULL DEFAULT '0',
  `Trade_num` INTEGER NULL DEFAULT '0',
  `Purchase_subject` VARCHAR(100) NULL DEFAULT '',
  `Purchase_period` DATETIME NOT NULL,
  `OKPD2` VARCHAR(100) NULL DEFAULT '',
  `Max_price` INTEGER NULL DEFAULT '0',
  `Ensuring_part` INTEGER NULL DEFAULT '0',
  `Enforcement` INTEGER NULL DEFAULT '0',
  `Producer_IDs` INTEGER NULL DEFAULT '0',
  PRIMARY KEY (`id`),
FOREIGN KEY (Customer_ID)  REFERENCES Organization (id),
FOREIGN KEY (Producer_IDs)  REFERENCES Organization (id)
);

-- ---
-- Table 'Bid'
-- 
-- ---

DROP TABLE IF EXISTS `Bid`;
		
CREATE TABLE `Bid` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FL` INTEGER NULL DEFAULT '0',
  `Date` DATETIME NOT NULL,
  `Max_price` INTEGER NULL DEFAULT '0',
  `Ensuring_part` INTEGER NULL DEFAULT '0',
  `Winner_ID` INTEGER NULL DEFAULT '0',
  `Tender_subject` VARCHAR(200) NULL DEFAULT '',
  `Procedure_type` VARCHAR(200) NULL DEFAULT '',
  `Place` VARCHAR(20) NULL DEFAULT '',
  `Customer_ID` INTEGER NULL DEFAULT '0',
  `exit` INTEGER NULL DEFAULT '0',
  PRIMARY KEY (`id`),
FOREIGN KEY (Customer_ID)  REFERENCES Organization (id),
FOREIGN KEY (Winner_ID)  REFERENCES Organization (id)
);

-- ---
-- Table 'Purchase'
-- 
-- ---

DROP TABLE IF EXISTS `Purchase`;
		
CREATE TABLE `Purchase` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FL` INTEGER NULL DEFAULT '0',
  `Customer_ID` INTEGER NULL DEFAULT '0',
  `Reg_num` INTEGER NULL DEFAULT '0',
  `Contract_price` INTEGER NULL DEFAULT '0',
  `Ensuring_part` INTEGER NULL DEFAULT '0',
  `Enforcement` INTEGER NULL DEFAULT '0',
  `Placement_date` DATETIME NOT NULL,
  `Application_deadline` DATETIME NOT NULL,
  `Begin_date` DATETIME NOT NULL,
  `End_date` DATETIME NOT NULL,
  `Place` VARCHAR(20) NULL DEFAULT '',
  `Potential_producers_IDs` INTEGER NULL DEFAULT '0',
  PRIMARY KEY (`id`),
FOREIGN KEY (Customer_ID)  REFERENCES Organization (id),
FOREIGN KEY (Potential_producers_IDs)  REFERENCES Organization (id)
);

-- ---
-- Table 'Winner'
-- 
-- ---

DROP TABLE IF EXISTS `Winner`;
		
CREATE TABLE `Winner` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `FL` INTEGER NULL DEFAULT '0',
  `Win_date` DATETIME NOT NULL,
  `Notice` INTEGER NULL DEFAULT '0',
  `Bid_ID` INTEGER NULL DEFAULT '0',
  `Protocol_URL` VARCHAR(200) NULL DEFAULT '',
  `Contract_term` DATETIME NOT NULL,
  `Protocol_date` INTEGER NULL DEFAULT '0',
  PRIMARY KEY (`id`),
FOREIGN KEY (Bid_ID)  REFERENCES Bid (id)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Organization` ADD FOREIGN KEY (Address_ID) REFERENCES `Address` (`id`);
ALTER TABLE `Organization` ADD FOREIGN KEY (Contact_pers_ID) REFERENCES `Contact_person` (`id`);
ALTER TABLE `Purchase_plan` ADD FOREIGN KEY (Customer_ID) REFERENCES `Organization` (`id`);
ALTER TABLE `Purchase_plan` ADD FOREIGN KEY (Producer_IDs) REFERENCES `Organization` (`id`);
ALTER TABLE `Bid` ADD FOREIGN KEY (Winner_ID) REFERENCES `Organization` (`id`);
ALTER TABLE `Bid` ADD FOREIGN KEY (Customer_ID) REFERENCES `Organization` (`id`);
ALTER TABLE `Purchase` ADD FOREIGN KEY (Customer_ID) REFERENCES `Organization` (`id`);
ALTER TABLE `Purchase` ADD FOREIGN KEY (Potential_producers_IDs) REFERENCES `Organization` (`id`);
ALTER TABLE `Winner` ADD FOREIGN KEY (Bid_ID) REFERENCES `Bid` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Organization` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Address` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Contact_person` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Purchase_plan` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Bid` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Purchase` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Winner` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Organization` (`id`,`Name`,`INN`,`KPP`,`Address_ID`,`Contact_pers_ID`,`Participation_num`,`Win_num`,`Scope`,`Last_win_date`) VALUES
-- (',',',',',',',',','');
-- INSERT INTO `Address` (`id`,`Region`,`City`,`Street`,`House_num`) VALUES
-- (',',',','');
-- INSERT INTO `Contact_person` (`id`,`Name`,`Phone_num`,`email`) VALUES
-- (',',','');
-- INSERT INTO `Purchase_plan` (`id`,`FL`,`Customer_ID`,`Trading_value`,`Trade_num`,`Purchase_subject`,`Purchase_period`,`OKPD2`,`Max_price`,`Ensuring_part`,`Enforcement`,`Producer_IDs`) VALUES
-- (',',',',',',',',',',','');
-- INSERT INTO `Bid` (`id`,`FL`,`Date`,`Max_price`,`Ensuring_part`,`Winner_ID`,`Tender_subject`,`Procedure_type`,`Place`,`Customer_ID`,`Unscrupulous_suppl`) VALUES
-- (',',',',',',',',',','');
-- INSERT INTO `Purchase` (`id`,`FL`,`Customer_ID`,`Reg_num`,`Contract_price`,`Ensuring_part`,`Enforcement`,`Placement_date`,`Application_deadline`,`Begin_date`,`End_date`,`Place`,`Potential_producers_IDs`) VALUES
-- (',',',',',',',',',',',','');
-- INSERT INTO `Winner` (`id`,`FL`,`Win_date`,`Notice`,`Bid_ID`,`Protocol_URL`,`Contract_term`,`Protocol_date`) VALUES
-- (',',',',',',','');