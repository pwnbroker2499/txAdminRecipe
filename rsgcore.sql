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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
  `skin` VARCHAR(8000) NOT NULL COLLATE 'utf8mb3_general_ci',
  `clothes` VARCHAR(8000) NOT NULL COLLATE 'utf8mb4_general_ci',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `stashitems` (`stash`, `items`) VALUES
('lawtrashcan', '[]');

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
  `horseid` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `horse` varchar(50) DEFAULT NULL,
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
  `wild` varchar(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `born` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_weapons` (
    `id` int NOT NULL AUTO_INCREMENT,
    `serial` varchar(16) NOT NULL,
    `citizenid` varchar(9) NOT NULL,
    `components` varchar(4096) NOT NULL DEFAULT '{}',
    `ammo` int(3) NOT NULL DEFAULT 0,
    `ammo_express` int(3) NOT NULL DEFAULT 0,
    `ammo_express_explosive` int(3) NOT NULL DEFAULT 0,
    `ammo_high_velocity` int(3) NOT NULL DEFAULT 0,
    `ammo_split_point` int(3) NOT NULL DEFAULT 0,
    `ammo_buckshot_incendiary` int(3) NOT NULL DEFAULT 0,
    `ammo_slug` int(3) NOT NULL DEFAULT 0,
    `ammo_slug_explosive` int(3) NOT NULL DEFAULT 0,
    `ammo_tranquilizer` int(3) NOT NULL DEFAULT 0,
    `ammo_fire` int(3) NOT NULL DEFAULT 0,
    `ammo_poison` int(3) NOT NULL DEFAULT 0,
    `ammo_dynamite` int(3) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `address_book` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`citizenid` VARCHAR(50) NOT NULL,
`name`  VARCHAR(50) NOT NULL,
`owner`  VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`));

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
 ('vallaw', 0, 'boss'),
 ('rholaw', 0, 'boss'),
 ('blklaw', 0, 'boss'),
 ('strlaw', 0, 'boss'),
 ('stdenlaw', 0, 'boss');
-- ('medic', 0, 'boss');

DROP TABLE IF EXISTS `beekeeper_stock`;
CREATE TABLE IF NOT EXISTS `beekeeper_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beekeeper` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `beekeeper_shop`;
CREATE TABLE IF NOT EXISTS `beekeeper_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `beekeeper_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valbeekeepershop', 'valbeekeeper', 'Valentine Beekeeper Shop', 0),
('strawbeekeepershop', 'strawbeekeeper', 'Strawberry Beekeeper Shop', 0),
('blackbeekeepershop', 'blackbeekeeper', 'Blackwater Beekeeper Shop', 0),
('mcfarbeekeepershop', 'mcfarbeekeeper', 'Mcfarlanes Beekeeper Shop', 0),
('rhodesbeekeepershop', 'rhodesbeekeeper', 'Rhodes Beekeeper Shop', 0),
('braithbeekeepershop', 'braithbeekeeper', 'Braithwaite Beekeeper Shop', 0);

DROP TABLE IF EXISTS `beekeepershop_stock`;
CREATE TABLE `beekeepershop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_bills` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `clothes` (
  `citizenid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `clothes` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `playeroutfit` (
  `citizenid` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clothes` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `indian_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `properties` text NOT NULL,
  `plantid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `plantid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `saloontender_stock`;
CREATE TABLE IF NOT EXISTS `saloontender_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saloontender` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `saloontender_shop`;
CREATE TABLE IF NOT EXISTS `saloontender_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `saloontender_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valsaloonshop', 'valsaloontender', 'Valentine Saloon', 0),
('blasaloonshop', 'blasaloontender', 'Blackwater Saloon', 0),
('rhosaloonshop', 'rhosaloontender', 'Rhodes Saloon', 0),
('stdenissaloonshop1', 'stdenissaloontender1', 'Saint Denis Saloon', 0),
('stdenissaloonshop2', 'stdenissaloontender2', 'Saint Denis Saloon', 0),
('vansaloonshop', 'vansaloontender', 'Van Horn Saloon', 0),
('armsaloonshop', 'armsaloontender', 'Armadillo Saloon', 0),
('tumsaloonshop', 'tumsaloontender', 'Tumbleweed Saloon', 0);

DROP TABLE IF EXISTS `saloontendershop_stock`;
CREATE TABLE `saloontendershop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('gang1', 0, 'gang');

DROP TABLE IF EXISTS `blacksmith_stock`;
CREATE TABLE IF NOT EXISTS `blacksmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blacksmith` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `blacksmith_shop`;
CREATE TABLE IF NOT EXISTS `blacksmith_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `blacksmith_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valblacksmithshop', 'valblacksmith', 'Valentine Blacksmith Shop', 0);

DROP TABLE IF EXISTS `blacksmithshop_stock`;
CREATE TABLE `blacksmithshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `market_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `itemimage` varchar(50) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT 0.00,
  `price_min` decimal(11,2) NOT NULL DEFAULT 0.00,
  `price_max` decimal(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `market_data` (`item`, `name`, `itemimage`, `price`, `price_min`, `price_max`) VALUES
('corn', 'Corn', 'corn.png', '0.01', '0.01', '5.00'),
('sugar', 'Sugar', 'sugar.png', '0.01', '0.01', '5.00'),
('tobacco', 'Tobacco', 'tobacco.png', '0.01', '0.01', '5.00'),
('carrot', 'Carrot', 'carrot.png', '0.01', '0.01', '5.00'),
('tomato', 'Tomato', 'tomato.png', '0.01', '0.01', '5.00'),
('broccoli', 'Broccoli', 'broccoli.png', '0.01', '0.01', '5.00'),
('potato', 'Potato', 'potato.png', '0.01', '0.01', '5.00');

CREATE TABLE IF NOT EXISTS `lootcrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `looted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lootcrate` (`id`, `name`, `looted`) VALUES
(1, 'lootcrate1', 0),
(2, 'lootcrate2', 0),
(3, 'lootcrate3', 0),
(4, 'lootcrate4', 0),
(5, 'lootcrate5', 0),
(6, 'lootcrate6', 0),
(7, 'lootcrate7', 0),
(8, 'lootcrate8', 0),
(9, 'lootcrate9', 0),
(10, 'lootcrate10', 0),
(11, 'lootcrate11', 0),
(12, 'lootcrate12', 0),
(13, 'lootcrate13', 0),
(14, 'lootcrate14', 0),
(15, 'lootcrate15', 0),
(16, 'lootcrate16', 0),
(17, 'lootcrate17', 0),
(18, 'lootcrate18', 0),
(19, 'lootcrate19', 0),
(20, 'lootcrate20', 0);

CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent` varchar(30) NOT NULL,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL DEFAULT '0',
  `owned` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `player_houses` (`id`, `agent`, `houseid`, `citizenid`, `owned`, `price`, `credit`) VALUES
(1, 'newhanover', 'house1', '0', 0, 3000, 0),
(2, 'westelizabeth', 'house2', '0', 0, 4000, 0),
(3, 'newhanover', 'house3', '0', 0, 2000, 0),
(4, 'lemoyne', 'house4', '0', 0, 4000, 0),
(5, 'lemoyne', 'house5', '0', 0, 3000, 0),
(6, 'lemoyne', 'house6', '0', 0, 2000, 0),
(7, 'newaustin', 'house7', '0', 0, 2000, 0),
(8, 'newhanover', 'house8', '0', 0, 4000, 0),
(9, 'newhanover', 'house9', '0', 0, 1000, 0),
(10, 'newhanover', 'house10', '0', 0, 4000, 0),
(11, 'lemoyne', 'house11', '0', 0, 4000, 0),
(12, 'lemoyne', 'house12', '0', 0, 4000, 0),
(13, 'lemoyne', 'house13', '0', 0, 5000, 0),
(14, 'lemoyne', 'house14', '0', 0, 4000, 0),
(15, 'lemoyne', 'house15', '0', 0, 2000, 0),
(16, 'lemoyne', 'house16', '0', 0, 3000, 0),
(17, 'newhanover', 'house17', '0', 0, 3000, 0),
(18, 'newhanover', 'house18', '0', 0, 4000, 0),
(19, 'newhanover', 'house19', '0', 0, 500, 0),
(20, 'ambarino', 'house20', '0', 0, 3000, 0),
(21, 'newhanover', 'house21', '0', 0, 2500, 0),
(22, 'ambarino', 'house22', '0', 0, 2000, 0),
(23, 'ambarino', 'house23', '0', 0, 2500, 0),
(24, 'ambarino', 'house24', '0', 0, 1000, 0),
(25, 'westelizabeth', 'house25', '0', 0, 2000, 0),
(26, 'westelizabeth', 'house26', '0', 0, 3500, 0),
(27, 'westelizabeth', 'house27', '0', 0, 1250, 0),
(28, 'westelizabeth', 'house28', '0', 0, 1500, 0),
(29, 'newaustin', 'house29', '0', 0, 1000, 0),
(30, 'newaustin', 'house30', '0', 0, 4000, 0),
(31, 'newaustin', 'house31', '0', 0, 1500, 0),
(32, 'newaustin', 'house32', '0', 0, 1500, 0),
(33, 'newaustin', 'house33', '0', 0, 1250, 0),
(34, 'ambarino', 'house34', '0', 0, 1000, 0),
(35, 'ambarino', 'house35', '0', 0, 1000, 0),
(36, 'newhanover', 'house36', '0', 0, 2000, 0),
(37, 'ambarino', 'house37', '0', 0, 3000, 0),
(38, 'newhanover', 'house38', '0', 0, 750, 0),
(39, 'newhanover', 'house39', '0', 0, 2000, 0),
(40, 'lemoyne', 'house40', '0', 0, 1300, 0),
(41, 'lemoyne', 'house41', '0', 0, 0, 0),
(42, 'ambarino', 'house42', '0', 0, 2500, 0),
(43, 'newaustin', 'house43', '0', 0, 2500, 0),
(44, 'newhanover', 'house44', '0', 0, 3000, 0),
(45, 'lemoyne', 'house45', '0', 0, 10000, 0);

CREATE TABLE IF NOT EXISTS `player_housekeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` varchar(7) NOT NULL DEFAULT '0',
  `citizenid` varchar(50) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doorid` varchar(11) NOT NULL DEFAULT '0',
  `doorstate` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `doors` (`doorid`, `doorstate`) VALUES
('3598523785', 1),
('2031215067', 1),
('1189146288', 1),
('906448125', 1),
('2821676992', 1),
('1510914117', 1),
('3549587335', 1),
('3000692149', 1),
('1928053488', 1),
('772977516', 1),
('527767089', 1),
('3468185317', 1),
('2779142555', 1),
('1239033969', 1),
('1597362984', 1),
('1299456376', 1),
('2933656395', 1),
('3238637478', 1),
('3544613794', 1),
('1485561723', 1),
('1511858696', 1),
('1282705079', 1),
('2238665296', 1),
('2080980868', 1),
('2700347737', 1),
('2544301759', 1),
('3720952508', 1),
('350169319', 1),
('984852093', 1),
('3473362722', 1),
('686097120', 1),
('3107660458', 1),
('3419719645', 1),
('3945582303', 1),
('862008394', 1),
('1661737397', 1),
('1574473390', 1),
('3731688048', 1),
('344028824', 1),
('2652873387', 1),
('2061942857', 1),
('3702071668', 1),
('1934463007', 1),
('2183007198', 1),
('4288310487', 1),
('872775928', 1),
('2385374047', 1),
('2051127971', 1),
('3167436574', 1),
('1195519038', 1),
('2212914984', 1),
('562830153', 1),
('663425326', 1),
('1171581101', 1),
('52014802', 1),
('4164042403', 1),
('2047072501', 1),
('2715667864', 1),
('1263476860', 1),
('1894337720', 1),
('120764251', 1),
('943176298', 1),
('2971757040', 1),
('1973911195', 1),
('784290387', 1),
('843137708', 1),
('4275653891', 1),
('1431398235', 1),
('896012811', 1),
('2813949612', 1),
('868379185', 1),
('640077562', 1),
('3045682143', 1),
('1915887592', 1),
('3324299212', 1),
('1180868565', 1);


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

CREATE TABLE IF NOT EXISTS `address_book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `name`  VARCHAR(50) NOT NULL,
  `owner`  VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `beekeeper_stock`;
CREATE TABLE IF NOT EXISTS `beekeeper_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beekeeper` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `beekeeper_shop`;
CREATE TABLE IF NOT EXISTS `beekeeper_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `beekeeper_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valbeekeepershop', 'valbeekeeper', 'Valentine Beekeeper Shop', 0),
('strawbeekeepershop', 'strawbeekeeper', 'Strawberry Beekeeper Shop', 0),
('blackbeekeepershop', 'blackbeekeeper', 'Blackwater Beekeeper Shop', 0),
('mcfarbeekeepershop', 'mcfarbeekeeper', 'Mcfarlanes Beekeeper Shop', 0),
('rhodesbeekeepershop', 'rhodesbeekeeper', 'Rhodes Beekeeper Shop', 0),
('braithbeekeepershop', 'braithbeekeeper', 'Braithwaite Beekeeper Shop', 0);

DROP TABLE IF EXISTS `beekeepershop_stock`;
CREATE TABLE `beekeepershop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `player_weapons`
(
    `id` int NOT NULL AUTO_INCREMENT,
    `serial` varchar(16) NOT NULL,
    `citizenid` varchar(9) NOT NULL,
    `components` varchar(4096) NOT NULL DEFAULT '{}',
    PRIMARY KEY (`id`)
)
ENGINE=InnoDB;

-- Sample Data
INSERT INTO `player_weapons` (`id`, `serial`, `citizenid`, `components`) VALUES
(1, 'BM123456', '666', '[{\"label\":\"Medium Scope\",\"comp\":\"comp\",\"name\":-1844750633,\"type\":\"scope\",\"model\":2044211697},{\"label\":\"Improved Rifling\",\"comp\":\"comp\",\"name\":488786388,\"type\":\"rifling\",\"model\":0},{\"label\":\"Wrap\",\"comp\":\"comp\",\"name\":1419411400,\"type\":\"wrap\",\"model\":890000845},{\"label\":\"Gold\",\"model\":0,\"name\":681399557,\"comp\":\"barrel\"},{\"label\":\"Gold\",\"model\":0,\"name\":-1217972306,\"comp\":\"trigger\"},{\"label\":\"Gold\",\"model\":0,\"name\":-1217972306,\"comp\":\"trigger\"},{\"label\":\"Gold\",\"model\":0,\"name\":1906948138,\"comp\":\"frame\"},{\"label\":\"Gold\",\"model\":0,\"name\":-897983242,\"comp\":\"cylinder\"},{\"label\":\"Gold\",\"model\":0,\"name\":-897983242,\"comp\":\"cylinder\"},{\"label\":\"Bounty Hunter Grain\",\"model\":680020185,\"name\":1043980328,\"comp\":\"gripbody\"},{\"label\":\"Flying Eagle\",\"model\":0,\"name\":2110982730,\"comp\":\"grip\"},{\"label\":\"Art Nouveau\",\"comp\":\"decal\",\"name\":1338763465,\"type\":\"frame\",\"model\":0},{\"label\":\"Art Nouveau\",\"comp\":\"decal\",\"name\":-1719565838,\"type\":\"barrel\",\"model\":0},{\"label\":\"Blued Steel\",\"comp\":\"decalcolor\",\"name\":-1822969329,\"type\":\"frame\",\"model\":0},{\"label\":\"Blued Steel\",\"comp\":\"decalcolor\",\"name\":1585980544,\"type\":\"barrel\",\"model\":0},{\"label\":\"Gold\",\"model\":0,\"name\":-1021999895,\"comp\":\"scope\"},{\"label\":\"White\",\"model\":0,\"name\":1170373926,\"comp\":\"wrapcolor\"}]');

DROP TABLE IF EXISTS `weaponsmith_stock`;
CREATE TABLE IF NOT EXISTS `weaponsmith_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weaponsmith` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `weapon_shop`;
CREATE TABLE IF NOT EXISTS `weapon_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `weapon_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valweaponshop', 'valweaponsmith', 'Valentine Weapon Shop', 0),
('rhoweaponshop', 'rhoweaponsmith', 'Rhodes Weapon Shop', 0),
('stdweaponshop', 'stdweaponsmith', 'Staint Denis Weapon Shop', 0),
('tumweaponshop', 'tumweaponsmith', 'Tumbleweed Weapon Shop', 0),
('annweaponshop', 'annweaponsmith', 'Annesburg Weapon Shop', 0);

DROP TABLE IF EXISTS `weapon_stock`;
CREATE TABLE `weapon_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `ranch_animals`;
CREATE TABLE IF NOT EXISTS `ranch_animals` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `ranchid` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
    `animalid` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
    `animals` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ranch_stock`;
CREATE TABLE IF NOT EXISTS `ranch_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobaccess` varchar(50) CHARACTER SET 'utf8mb4' DEFAULT NULL,
  `item` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ranch_shop`;
CREATE TABLE IF NOT EXISTS `ranch_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ranch_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('macfarranchshop', 'macfarranch', 'Macfarlan Ranch Shop', 0);

DROP TABLE IF EXISTS `ranch_shop_stock`;
CREATE TABLE `ranch_shop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci' DEFAULT NULL,
  `items` varchar(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `moonshiner_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `gang` varchar(50) DEFAULT NULL,
  `properties` text NOT NULL,
  `propid` int(11) NOT NULL,
  `proptype` varchar(50) DEFAULT NULL,
  `credit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `job_wagons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(50) DEFAULT NULL,
  `plate` varchar(255) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;