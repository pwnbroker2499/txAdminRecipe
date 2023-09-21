CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'Anticheat',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerskins` (
  `citizenid` varchar(255) CHARACTER SET utf8 NOT NULL,
  `license` varchar(255) CHARACTER SET utf8 NOT NULL,
  `skin` varchar(8000) CHARACTER SET utf8 NOT NULL,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `playerclothe` (
  `citizenid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `clothes` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `playeroutfit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `telegrams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `sendername` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `sentDate` varchar(25) NOT NULL,
  `message` varchar(455) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0',
  `birdstatus` TINYINT(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `horseid` varchar(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) NOT NULL,
  `horsexp` int(11) DEFAULT 0,
  `saddle` varchar(50) DEFAULT '0',
  `blanket` varchar(50) DEFAULT '0',
  `saddlebag` varchar(50) DEFAULT '0',
  `bedroll` varchar(50) DEFAULT '0',
  `horn` varchar(50) DEFAULT '0',
  `stirrup` varchar(50) DEFAULT '0',
  `mane` varchar(50) DEFAULT '0',
  `tail` varchar(50) DEFAULT '0',
  `mask` varchar(50) DEFAULT '0',
  `mustache` varchar(50) DEFAULT '0',
  `gender` varchar(11) NOT NULL,
  `wild` varchar(11) NOT NULL,
  `active` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(16) NOT NULL,
  `citizenid` varchar(9) NOT NULL,
  `components` varchar(4096) NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `address_book` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`citizenid` VARCHAR(50) NOT NULL,
`name`  VARCHAR(50) NOT NULL,
`owner`  VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `weaponsmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weaponsmith` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `weapon_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `weapon_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valweaponshop', 'valweaponsmith', 'Valentine Weapon Shop', 0),
('rhoweaponshop', 'rhoweaponsmith', 'Rhodes Weapon Shop', 0),
('stdweaponshop', 'stdweaponsmith', 'Staint Denis Weapon Shop', 0),
('tumweaponshop', 'tumweaponsmith', 'Tumbleweed Weapon Shop', 0),
('annweaponshop', 'annweaponsmith', 'Annesburg Weapon Shop', 0);

CREATE TABLE `weapon_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `blacksmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blacksmith` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `blacksmith_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `blacksmith_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valblacksmithshop', 'valblacksmith', 'Valentine Blacksmith Shop', 0);

CREATE TABLE `blacksmithshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `management_funds` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`job_name` VARCHAR(50) NOT NULL,
`amount`  INT(100) NOT NULL,
`type` ENUM('boss','gang') NOT NULL DEFAULT 'boss',
PRIMARY KEY (`id`),
UNIQUE KEY `job_name` (`job_name`),
KEY `type` (`type`)
);

INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('police', 0, 'boss'),
('medic', 0, 'boss'),
('valsaloontender', 0, 'boss'),
('blasaloontender', 0, 'boss'),
('rhosaloontender', 0, 'boss'),
('stdenissaloontender1', 0, 'boss'),
('stdenissaloontender2', 0, 'boss'),
('vansaloontender', 0, 'boss'),
('armsaloontender', 0, 'boss'),
('tumsaloontender', 0, 'boss'),
('moonsaloontender1', 0, 'boss'),
('moonsaloontender2', 0, 'boss'),
('moonsaloontender3', 0, 'boss'),
('moonsaloontender4', 0, 'boss'),
('moonsaloontender5', 0, 'boss'),
('stdeniswholesale', 0, 'boss'),
('blkwholesale', 0, 'boss'),
('railroad', 0, 'boss'),
('govenor1', 0, 'boss'),
('govenor2', 0, 'boss'),
('govenor3', 0, 'boss'),
('govenor4', 0, 'boss'),
('govenor5', 0, 'boss'),
('valweaponsmith', 0, 'boss'),
('rhoweaponsmith', 0, 'boss'),
('stdweaponsmith', 0, 'boss'),
('tumweaponsmith', 0, 'boss'),
('annweaponsmith', 0, 'boss');

CREATE TABLE IF NOT EXISTS `player_bills` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `player_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `location` varchar(30) NOT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  `roomid` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
