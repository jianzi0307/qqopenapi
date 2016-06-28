# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.23-log)
# Database: db_ucenter
# Generation Time: 2016-06-23 12:30:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_cash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_cash`;

CREATE TABLE `app_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `serverid` int(11) DEFAULT NULL COMMENT '服务器id',
  `goldtotal` bigint(20) DEFAULT '0' COMMENT '总元宝数/Q点',
  `rmbtotal` float DEFAULT '0' COMMENT '总人民币数（单位元）',
  `extratotal` bigint(20) DEFAULT '0',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_serverid` (`userid`,`serverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值表';

LOCK TABLES `app_cash` WRITE;
/*!40000 ALTER TABLE `app_cash` DISABLE KEYS */;

INSERT INTO `app_cash` (`id`, `userid`, `serverid`, `goldtotal`, `rmbtotal`, `extratotal`, `createtime`, `updatetime`)
VALUES
	(7,'8405E15ED54FB03256AB3E59AA90D411',14,0,0,0,1466674696,1466684128),
	(8,'8405E15ED54FB03256AB3E59AA90D411',15,100,10,100,1466674731,1466684380);

/*!40000 ALTER TABLE `app_cash` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table app_cash_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_cash_logs`;

CREATE TABLE `app_cash_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `orderno` varchar(255) DEFAULT NULL COMMENT '订单',
  `platform` varchar(50) DEFAULT NULL COMMENT '平台',
  `serverid` int(11) DEFAULT NULL COMMENT '服务器ID',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `rmb` float DEFAULT '0' COMMENT '人民币单位（元）',
  `gold` int(11) DEFAULT '0' COMMENT '元宝数/Q点数',
  `extra` int(11) DEFAULT '0' COMMENT '元宝数/Q点数',
  `payitem` varchar(255) DEFAULT NULL COMMENT '支付项',
  `paytime` int(11) DEFAULT NULL COMMENT '支付时间',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip地址',
  `rate` int(11) DEFAULT NULL COMMENT '充值比例',
  `token` varchar(255) NOT NULL COMMENT 'TOken',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 订单产生， 1订单完成',
  `payamt_coins` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值流水记录表';

LOCK TABLES `app_cash_logs` WRITE;
/*!40000 ALTER TABLE `app_cash_logs` DISABLE KEYS */;

INSERT INTO `app_cash_logs` (`id`, `orderno`, `platform`, `serverid`, `userid`, `rmb`, `gold`, `extra`, `payitem`, `paytime`, `createtime`, `ip`, `rate`, `token`, `status`, `payamt_coins`)
VALUES
	(11,'-APPDJSX43185-20160531-1826355176','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,1464690395,1464690394,'114.247.223.66',10,'2B04983DB0452F1FCD75C58AC06C3A2702996',1,NULL),
	(12,'-APPDJSX43185-20160531-1826552177','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,1464690415,1464690413,'114.247.223.66',10,'B62F6B83FD8C947E4EDD03D51C19A66002997',1,NULL),
	(13,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464690439,'114.247.223.66',10,'D7DB3A7FCD38DECB5EF9F188CB20980C14226',0,NULL),
	(14,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464690454,'114.247.223.66',10,'2D92BF8845DB561F73B928A2FDF55A1214227',0,NULL),
	(15,'-APPDJSX43185-20160531-1827386178','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,1464690458,1464690457,'114.247.223.66',10,'819294F22E6A1E7532DB8F81882D0A0402998',1,NULL),
	(16,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464698175,'123.66.148.84',10,'3B39B4FE2AE0BEA03629759A6FF5ACA512295',0,NULL),
	(17,'-APPDJSX43185-20160531-2050036241','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,1464699006,1464698921,'123.66.148.84',10,'8EB0CD706847B07165F6D093C1BA8B4E12295',1,NULL),
	(18,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464699063,'123.66.148.84',10,'230EFF69A8000A76DF70D55E67C5D2FE12294',0,NULL),
	(19,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464699070,'123.66.148.84',10,'3ED55FEB95D152271B3E87F64B3F256825951',0,NULL),
	(20,NULL,'qzone',14,'037C54A1E9D938F581C838D063700BD4',100,1000,1000,NULL,NULL,1464699340,'123.66.148.84',10,'C85D17F01878E70DF4399696E5E4AA2812295',0,NULL),
	(21,NULL,'qzone',14,'037C54A1E9D938F581C838D063700BD4',100,1000,1000,NULL,NULL,1464699358,'123.66.148.84',10,'0FAB18385A6C626FE6CA2A5C76DC2B0325947',0,NULL),
	(22,NULL,'qzone',14,'037C54A1E9D938F581C838D063700BD4',100,1000,1000,NULL,NULL,1464699368,'123.66.148.84',10,'9C73D71ED3C452969E49B775CC5EF94F25949',0,NULL),
	(23,NULL,'qzone',14,'037C54A1E9D938F581C838D063700BD4',100,1000,1000,NULL,NULL,1464699409,'123.66.148.84',10,'4283AF84DFDA0153F7AA58A1D9E4015925950',0,NULL),
	(24,'-APPDJSX43185-20160601-0936361313','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,1464744996,1464744993,'114.247.223.66',10,'6BDD6A6823EAE14B420D703FC8457B5902742',1,NULL),
	(25,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464756377,'114.247.223.66',10,'6369213CC5C543662909675515BF981529040',0,NULL),
	(26,NULL,'qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,NULL,1464760096,'124.200.39.38',10,'6228A2BB9838DE3A971E37E87BF47AE403206',0,NULL),
	(27,'-APPDJSX43185-20160601-1358489385','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464760729,1464760725,'124.200.39.38',10,'39B498F7C0DA09F33ED6024F340066B427086',1,NULL),
	(28,'-APPDJSX43185-20160601-1359010386','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464760742,1464760739,'124.200.39.38',10,'531BAD3D951A10B1F93D88C9D5FE64A527081',1,NULL),
	(29,'-APPDJSX43185-20160601-1359333571','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464760773,1464760768,'124.200.39.38',10,'CE36A088C787C04F6C25282FBDC19FC629521',1,NULL),
	(30,'-APPDJSX43185-20160601-1401250576','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464760885,1464760883,'124.200.39.38',10,'77D914021A3903DAAA4DD8BE0AEE1D0B29520',1,NULL),
	(31,'-APPDJSX43185-20160601-1541283426','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464766888,1464766886,'124.200.39.38',10,'E4D87055E3D3F0D0E87088FBDBC0850122441',1,NULL),
	(32,NULL,'qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,NULL,1464766907,'124.200.39.38',10,'ECD0C5D250A3AC1C2FCBA03BAA9F1A2504680',0,NULL),
	(33,'-APPDJSX43185-20160601-1541557427','qzone',14,'F90708E178AB426927AFFC1F844D28E3',100,1000,1000,NULL,1464766915,1464766914,'124.200.39.38',10,'D3C95B0C4C7C1F1D2356CD25B3A4E4E222442',1,NULL),
	(34,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464786886,'122.71.244.143',10,'E8E75F19DE2B7F4A8ED04DE720A38D1429656',0,NULL),
	(35,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464786908,'122.71.244.143',10,'AD44682FACBFFB09885C1EA7CB096C7329655',0,NULL),
	(36,'-APPDJSX43185-20160601-2313108002','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464793990,1464793985,'122.71.244.143',10,'9B33A92D0CF4AF8689CFD8DD13E1453022749',1,'0'),
	(37,'-APPDJSX43185-20160601-2317277533','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464794248,1464794245,'122.71.244.143',10,'22B37F69A8AAC330A55E50C7553F6C1B27337',1,'0'),
	(38,'-APPDJSX43185-20160601-2320134003','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464794413,1464794408,'122.71.244.143',10,'ABB58D686317635C16F28A9CB540501322748',1,'0'),
	(39,'-APPDJSX43185-20160601-2322374004','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464794557,1464794554,'122.71.244.143',10,'C4AD9CB5D3F94696FCC06FF72103B99222749',1,'0'),
	(40,'-APPDJSX43185-20160601-2324126005','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464794652,1464794649,'122.71.244.143',10,'A9706BA288A1833F90595A087A52C9FD22748',1,'0'),
	(41,'-APPDJSX43185-20160601-2325352006','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464794735,1464794730,'122.71.244.143',10,'E393089A1DB2908CC24925DD383CA86222749',1,'0'),
	(42,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464829591,'114.247.223.66',10,'B1D9C69F1E98C0FE377614DA1E930D7017963',0,NULL),
	(43,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464832357,'114.247.223.66',10,'C36E612347EEA0D7E190E366A1C32CBB13085',0,NULL),
	(44,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854298,'114.247.223.66',10,'B689C03F170EE04C82845246CC9C968A19530',0,NULL),
	(45,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854302,'114.247.223.66',10,'D39F8E169D4486676D65452FDF8887F819530',0,NULL),
	(46,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854310,'114.247.223.66',10,'B18471511A828A160E0F64C6874A224714340',0,NULL),
	(47,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854449,'114.247.223.66',10,'C75B0AECB04B93313650F7AB3533A34F14344',0,NULL),
	(48,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854601,'114.247.223.66',10,'CE34F4262C2497F7E60D973574D758E319530',0,NULL),
	(49,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854682,'114.247.223.66',10,'7A270D793E1B2943B99B690B2A96EAB317221',0,NULL),
	(50,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854740,'114.247.223.66',10,'45B2ED7FC4221168780098533E218ABE19531',0,NULL),
	(51,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464854909,'114.247.223.66',10,'A328D17BF3F9B29122DD2689BAFA9C9219531',0,NULL),
	(52,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855090,'114.247.223.66',10,'D60652EA6D53CCE8E7208DD267209C7719530',0,NULL),
	(53,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855505,'114.247.223.66',10,'DA0D05D96282CDF6081BDCDDC3CCDAAD00760',0,NULL),
	(54,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855519,'114.247.223.66',10,'B123E53C5C5FB3BF51715B5A1CB64E4404969',0,NULL),
	(55,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855570,'114.247.223.66',10,'1BE865E28CB33D3FADC3118BCAAF93EC04967',0,NULL),
	(56,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855592,'114.247.223.66',10,'AB848E9AD4FBF6FEF77F1376C63F32F904967',0,NULL),
	(57,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855598,'114.247.223.66',10,'0438CE92260C9E8783F20860234B927A00756',0,NULL),
	(58,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855855,'114.247.223.66',10,'079F8FF3D1CA6A58BAE16FE31F458D8404969',0,NULL),
	(59,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855936,'114.247.223.66',10,'E5A52D0D2FD132F571A72EEF2085F09500757',0,NULL),
	(60,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464855966,'114.247.223.66',10,'2DB7C8D0C6D9DEA34A446C7041CB8C0004967',0,NULL),
	(61,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464856112,'114.247.223.66',10,'E9682132862077A5B49C7AAF5C32B4DD00758',0,NULL),
	(62,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464856330,'114.247.223.66',10,'FCF5BC6755EEECF5CD0CDE28693DDEBB04967',0,NULL),
	(63,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464856443,'114.247.223.66',10,'05062EE1AE064D0D969CB1F91AF5745909460',0,NULL),
	(64,'-APPDJSX43185-20160602-1636446640','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464856604,1464856593,'114.247.223.66',10,'2551AB5A340349C0FA3C9FC487C8860109458',1,'0'),
	(65,'-APPDJSX43185-20160602-1637510437','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464856671,1464856668,'114.247.223.66',10,'7A47E9B136157B0D13835183F0E6D5DC04969',1,'0'),
	(66,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464858210,'114.247.223.66',10,'A577DEAD43087D0EFCD025317E6E220700687',0,NULL),
	(67,'-APPDJSX43185-20160602-1703558457','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*2',1464858235,1464858227,'114.247.223.66',10,'98E29E5539646C1265D1C80A42FD6F3D00686',1,'0'),
	(68,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464858267,'114.247.223.66',10,'0DCFE7739150AFB9AF75CCCD93EB669719028',0,NULL),
	(69,NULL,'qzone',14,'E44188B1387A90D70C2CE0F494D7950A',100,1000,1000,NULL,NULL,1464858399,'210.12.2.66',10,'DE072CB04B563FFA2868EC307B63637900686',0,NULL),
	(70,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464859035,'114.247.223.66',10,'97B863E29B7FFB8F2BAE66DA11715E4414890',0,NULL),
	(71,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464859580,'114.247.223.66',10,'E06227B11A6E278540B41595E431531525986',0,NULL),
	(72,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464860490,'114.247.223.66',10,'F6F3A2F553AFACC9F774F2F7105CFE8C25985',0,NULL),
	(73,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464861174,'114.247.223.66',10,'D538722F44C4EF13B71DA86250F89EA518718',0,NULL),
	(74,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464861718,'114.247.223.66',10,'79E2A861D8AB9B116483321128754C4118716',0,NULL),
	(75,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464862114,'114.247.223.66',10,'1E77CDF3BEA54E3C67BA34FB506D61E827814',0,NULL),
	(76,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464863660,'114.247.223.66',10,'B9AEB45EA0A95948E65AA839892FE0ED00760',0,NULL),
	(77,'-APPDJSX43185-20160602-1841594548','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464864119,1464864117,'114.247.223.66',10,'89D6255F6CBDF6CD4A889076E98DAB3100760',1,'0'),
	(78,'-APPDJSX43185-20160602-1843131700','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464864193,1464864190,'114.247.223.66',10,'47CE8B63732F738781213F47C82818B130953',1,'0'),
	(79,'-APPDJSX43185-20160602-1843188549','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464864199,1464864197,'114.247.223.66',10,'750F11A2B43D83E339725438264ABC3600757',1,'0'),
	(80,'-APPDJSX43185-20160602-1845246551','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464864325,1464864322,'114.247.223.66',10,'1AFA8A3BAAB85CB240CB3FDB66B6D9D600760',1,'0'),
	(81,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464865529,'114.247.223.66',10,'B1983CA435E209FD9F658C3D6B41ED3700760',0,NULL),
	(82,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866213,'114.247.223.66',10,'C04E9594C9EE47F5DA827FE88FD1FC2B30955',0,NULL),
	(83,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866217,'114.247.223.66',10,'494330173ECEF9DD266A0CB3C47B474A01891',0,NULL),
	(84,'-APPDJSX43185-20160602-1917375559','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464866257,1464866253,'114.247.223.66',10,'820CEC90E1A4DCCE72C8ADF5920028C401892',1,'0'),
	(85,'-APPDJSX43185-20160602-1917489709','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464866269,1464866266,'114.247.223.66',10,'C51EE802DF813853FBC3B7796451945416347',1,'0'),
	(86,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866272,'114.247.223.66',10,'1949184740845FAE14F754E37C19A55901891',0,NULL),
	(87,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866465,'114.247.223.66',10,'A480121CBD6F457787D7A591F2E0B35916348',0,NULL),
	(88,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866487,'114.247.223.66',10,'D8174B861A99A07D0AA4CAAA69407C1601892',0,NULL),
	(89,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866551,'114.247.223.66',10,'4271D28F1A4BD543FF40C142139CBD2C16349',0,NULL),
	(90,'-APPDJSX43185-20160602-1922439710','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1464866564,1464866562,'114.247.223.66',10,'543A7CA568E8EACBDC37C629AD67754716350',1,'0'),
	(91,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1464866573,'114.247.223.66',10,'6623D8E2B2800129DCB1765AEE9A41FF01891',0,NULL),
	(92,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466411085,'114.247.223.66',10,'0A20559A6579DD16CB217E42995AD32C10826',0,NULL),
	(93,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466411125,'114.247.223.66',10,'D918B622D2F8B2F433797DC91EA9043626321',0,NULL),
	(94,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466411139,'124.205.115.228',10,'18238FDED21E00F407A0B74D8180E3DB27649',0,NULL),
	(95,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466411345,'124.205.115.228',10,'59156148C1BEF6CC49C143CF1113AC3E24615',0,NULL),
	(96,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466411360,'124.205.115.228',10,'7E62F280D88E2E21B5A6953043703D4229071',0,NULL),
	(97,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466411417,'124.205.115.228',10,'60557B1B3F812611B784F4960996013729084',0,NULL),
	(98,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466437824,'222.35.242.157',10,'9B4397EC141B9C82692C319D3080D9A016439',0,NULL),
	(99,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466437829,'222.35.242.157',10,'B1CB7758FA1C9DE2854F4BAB801DE02B20130',0,NULL),
	(100,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466437836,'222.35.242.157',10,'09BC703D2519733C2EB85A45D4D4833C27594',0,NULL),
	(101,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466439908,'222.35.242.157',10,'2269911F9CD793DC4EA873728DC35B3B01811',0,NULL),
	(102,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466440009,'222.35.242.157',10,'55F7000A8E04AE36C7F493EFCB437C8C00824',0,NULL),
	(103,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466440592,'222.35.242.157',10,'AC4238B99B2C861DF920B6FCF490182E05303',0,NULL),
	(104,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',50,500,500,NULL,NULL,1466440651,'222.35.242.157',10,'CF409DD1C9BBF69C1F4B21E55F3C5AB207118',0,NULL),
	(105,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466440656,'222.35.242.157',10,'16E612FB5E1E65F2DA6DE684A5C3D2F425313',0,NULL),
	(106,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,NULL,NULL,1466440661,'222.35.242.157',10,'FC6BB14C980E8BDCCEF9C01B6718AB7605302',0,NULL),
	(107,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466441523,'222.35.242.157',10,'D6258CF560BA4B2104A692208D69401818675',0,NULL),
	(108,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466441532,'222.35.242.157',10,'9FCC241D176C80305DB07DED7115E05827480',0,NULL),
	(109,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,NULL,NULL,1466441539,'222.35.242.157',10,'62BEEE532D2A000C818CD7FE61A8881825313',0,NULL),
	(110,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,NULL,NULL,1466441543,'222.35.242.157',10,'6913439E3F6ED18CC89C3A0F68B56F8619954',0,NULL),
	(111,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,NULL,NULL,1466441569,'222.35.242.157',10,'B3407ABCF707C31763473CEB7497F31D09793',0,NULL),
	(112,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466441617,'222.35.242.157',10,'1103A972ADB7385F8EE79E106975918827596',0,NULL),
	(113,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466441635,'222.35.242.157',10,'E06E592D19C76BF0F29441ED5CE355CF24028',0,NULL),
	(114,'-APPDJSX43185-20160621-0055378315','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466441737,1466441717,'222.35.242.157',10,'68E8D53BA4FA210FB20E718F194FB3BE22941',1,'0'),
	(115,'-APPDJSX43185-20160621-0055515316','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*1',1466441751,1466441746,'222.35.242.157',10,'4159D45D241A12564A49F333A07E0A4A22942',1,'0'),
	(116,'-APPDJSX43185-20160621-0056011796','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,'5*5000*1',1466441762,1466441756,'222.35.242.157',10,'68E772F7EC7DC818C511969CC657FB1113429',1,'0'),
	(117,'-APPDJSX43185-20160621-0056137797','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,'5*10000*1',1466441773,1466441767,'222.35.242.157',10,'5DB18132C17402DC1F762C436716CA2913434',1,'0'),
	(118,'-APPDJSX43185-20160621-0056235317','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*2',1466441783,1466441778,'222.35.242.157',10,'9F8F45CF98A86B70187A14A6D005949C22941',1,'0'),
	(119,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,NULL,NULL,1466441789,'222.35.242.157',10,'1F0A3191503EDD93997CE73F8C80EE1213431',0,NULL),
	(120,'-APPDJSX43185-20160621-0056574318','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,'5*1000*2',1466441817,1466441811,'222.35.242.157',10,'2AE80DDCC74AE7E64A0CD59A434F102D22942',1,'0'),
	(121,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466441843,'222.35.242.157',10,'456000BE4EA1225FF14E61D06531D8F622941',0,NULL),
	(122,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466470209,'114.247.223.66',10,'1B076C3C3790BE0F3C3E1F77F422C92915167',0,NULL),
	(123,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466470215,'114.247.223.66',10,'66416B16276158A03388A28BDDCE8D1718676',0,NULL),
	(124,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',1,10,10,NULL,NULL,1466472450,'124.205.115.228',10,'A204C0F2E440AA4F56A7ED627A60E4D200824',0,NULL),
	(125,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466472456,'124.205.115.228',10,'D5CC826C91D21D1E5E134792EA55F8C727596',0,NULL),
	(126,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',1,10,10,NULL,NULL,1466472470,'124.205.115.228',10,'ACDE9D972582E7AA028BA3EF6613DE7825313',0,NULL),
	(127,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',1,10,10,NULL,NULL,1466472547,'124.205.115.228',10,'571790D0C8BB62749B0EF48BF1DD903519084',0,NULL),
	(128,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',1,10,10,NULL,NULL,1466472649,'124.205.115.228',10,'D0C33F4D9ED2BA34529310BEA2017BFD27596',0,NULL),
	(129,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',1,10,10,NULL,NULL,1466472654,'124.205.115.228',10,'2AC7765848850A41F402244F3B6613BB09794',0,NULL),
	(130,NULL,'qzone',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466472782,'124.205.115.228',10,'925C3FE1DC70BA7FE1F3E48359F747D927596',0,NULL),
	(131,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466472931,'124.205.115.228',10,'A8EA9BDA96AC7ED628FC30314592258518676',0,NULL),
	(132,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466472955,'124.205.115.228',10,'0D315D9BFFE0F23B732E20C8AE4D458B18675',0,NULL),
	(133,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466473155,'124.205.115.228',10,'0204DC6B1B7B56EB2471B4CD9E8522D716439',0,NULL),
	(134,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466473505,'124.205.115.228',10,'5779938876814EEF1DDBB3996A2D11E103851',0,NULL),
	(135,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',10,100,100,NULL,NULL,1466473572,'124.205.115.228',10,'698C37947C5F188B6B26BD4E21B4B71909794',0,NULL),
	(136,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',100,1000,1000,NULL,NULL,1466473581,'124.205.115.228',10,'DEB4EDB9C5B84C886049725C58E2E15622909',0,NULL),
	(137,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466473761,'114.247.223.66',10,'5B8CCDA41DEB337762935B0F3C69B25929315',0,NULL),
	(138,NULL,'website',14,'B370957DA0328A954E84AF66536AE490',500,5000,5000,NULL,NULL,1466474024,'124.205.115.228',10,'D72A6AA06535236A99DBE878B13E81E719860',0,NULL),
	(139,NULL,'website',14,'BCCF13999A1BD9E67B4D6DA79561E01A',500,5000,5000,NULL,NULL,1466489118,'119.129.209.41',10,'52F966078D505EB1D4CC49BE2EAC763705242',0,NULL),
	(140,NULL,'qzone',14,'3527F8574A1442144B77A8F77794FB6F',10,100,100,NULL,NULL,1466503103,'27.156.5.71',10,'8090B9B5536A3D68A882AFC5E72C2FFD14507',0,NULL),
	(141,NULL,'qzone',14,'3527F8574A1442144B77A8F77794FB6F',10,100,100,NULL,NULL,1466599680,'27.156.5.71',10,'E269F898AFBC3985DEEEB5B7ECED620806570',0,NULL),
	(142,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466670208,'114.247.223.66',10,'A678442114DD5009D8134C2BB239401807241',0,NULL),
	(143,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466670222,'114.247.223.66',10,'B4F998788939E4BAFFDECE80DD010AA731180',0,NULL),
	(144,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466670382,'114.247.223.66',10,'DC8568FB81F5249A3362668899D7E56514884',0,NULL),
	(145,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466671025,'114.247.223.66',10,'99691759419C7144DBE2F75FCAD3074A08527',0,NULL),
	(146,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466671032,'114.247.223.66',10,'B2A32FAA91DE421A2BD4286280B24CC208526',0,NULL),
	(147,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,NULL,NULL,1466671040,'114.247.223.66',10,'21A81FBB28C3458A0CF5F84A39A600EB08002',0,NULL),
	(148,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',500,5000,5000,NULL,NULL,1466671226,'114.247.223.66',10,'F278F085927DF5E55A40AD2C49220A2F08526',0,NULL),
	(149,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,NULL,NULL,1466671235,'114.247.223.66',10,'95BF0174930027004DAE4E1D08C8667122047',0,NULL),
	(150,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,NULL,NULL,1466671236,'114.247.223.66',10,'5CBC0439BA2C18CE3A5C45EA4B7B590608527',0,NULL),
	(151,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',1000,10000,10000,NULL,NULL,1466671242,'114.247.223.66',10,'1E257E7B9A66F61E3AA844638204E98C22041',0,NULL),
	(152,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466671266,'114.247.223.66',10,'C01B15CC7E3B015E3360F577211B1EE322034',0,NULL),
	(153,'-APPDJSX43185-20160623-1641174005','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466671277,1466671274,'114.247.223.66',10,'5546CB073E4598F291002092CD68488D08527',1,'0'),
	(154,'-APPDJSX43185-20160623-1645269018','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466671526,1466671524,'114.247.223.66',10,'3C8126CFE95FFC0C634A6045984A286608526',1,'0'),
	(155,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',100,1000,1000,NULL,NULL,1466672918,'114.247.223.66',10,'E287AB30F9DDA8826C920346F4179DC626157',0,NULL),
	(156,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466672921,'114.247.223.66',10,'D6B711CF5B47583EF33722D60CB1779626370',0,NULL),
	(157,'-APPDJSX43185-20160623-1709400066','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466672980,1466672977,'114.247.223.66',10,'C979D1C16D3D0E8265952A0D071EA53726370',1,'0'),
	(158,'-APPDJSX43185-20160623-1710228962','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466673023,1466673019,'114.247.223.66',10,'334C67702A11A6F6B068C034C09984C926156',1,'0'),
	(159,'-APPDJSX43185-20160623-1711339070','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466673093,1466673091,'114.247.223.66',10,'4A78131E9F9B5E063AA2681B334303AA26370',1,'0'),
	(160,'-APPDJSX43185-20160623-1711499964','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466673110,1466673107,'114.247.223.66',10,'100841DF9A0A3F3E0820E491F47E50B426158',1,'0'),
	(161,'-APPDJSX43185-20160623-1712164966','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466673136,1466673133,'114.247.223.66',10,'71A76E798F99E392379C1D3C4B571B3126160',1,'0'),
	(162,'-APPDJSX43185-20160623-1735310109','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674530,1466674528,'114.247.223.66',10,'F1EA6D811F43319705687F44409203DE26369',1,'0'),
	(163,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466674691,'114.247.223.66',10,'6EE5AA1EA317935380B9F2861B7A748626370',0,NULL),
	(164,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466674691,'114.247.223.66',10,'14F40A5284DBC0C572C7B7D65189525D26369',0,NULL),
	(165,'-APPDJSX43185-20160623-1738167984','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674696,1466674695,'114.247.223.66',10,'49CC5B0397B32BA681DCB150DE4D7F9209162',1,'0'),
	(166,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466674699,'114.247.223.66',10,'3D8710C1D41879B68A7498CC948E6C9126370',0,NULL),
	(167,'-APPDJSX43185-20160623-1738322985','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674712,1466674710,'114.247.223.66',10,'CD2BF4D172870F71126AAE0C6C55037E09159',1,'0'),
	(168,'-APPDJSX43185-20160623-1738514112','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674731,1466674729,'114.247.223.66',10,'6EE244BD8D380300A2A7754F707FE64126369',1,'0'),
	(169,'-APPDJSX43185-20160623-1739129986','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674753,1466674749,'114.247.223.66',10,'93EB0E8DF6CA81E791101B30CD6F703409160',1,'0'),
	(170,'-APPDJSX43185-20160623-1742475993','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466674967,1466674965,'114.247.223.66',10,'6C45F15403EC8EDFF13E6F5644BE642E09160',1,'0'),
	(171,'-APPDJSX43185-20160623-1744327995','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466675072,1466675071,'114.247.223.66',10,'F5FEFC079028E98AB28F8B174927BC9809162',1,'0'),
	(172,'-APPDJSX43185-20160623-1746337121','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466675193,1466675191,'114.247.223.66',10,'85BA7669DE5C61CF712CD84FFEEC377511240',1,'0'),
	(173,'-APPDJSX43185-20160623-1755566133','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466675756,1466675753,'114.247.223.66',10,'CE44372B4DE9C6BE32E77F4F3FBF198111236',1,'0'),
	(174,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466675805,'114.247.223.66',10,'04326D3CF0C708FCE13C2E5FFCBFBBDE11236',0,NULL),
	(175,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466675822,'114.247.223.66',10,'6A0DA8076CAC1345EFB577DBE1C4F68A11236',0,NULL),
	(176,'-APPDJSX43185-20160623-1757238135','qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466675843,1466675841,'114.247.223.66',10,'4EEE4E6A05C29178216B5BE7F3290CF411236',1,'0'),
	(177,NULL,'qzone',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466676002,'114.247.223.66',10,'1CF98D51A9AB711F7D09F360E33EA5AF11236',0,NULL),
	(178,'-APPDJSX43185-20160623-1801156005','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466676075,1466676073,'114.247.223.66',10,'074288A0636E8BE1F54D21D0C8F5206C12939',1,'0'),
	(179,'-APPDJSX43185-20160623-1804431140','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466676282,1466676280,'114.247.223.66',10,'C59A3CDD416AD279143D9D23942256E511240',1,'0'),
	(180,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466676590,'114.247.223.66',10,'68A7EDD5DA4268466C69DFA9DFD5525012937',0,NULL),
	(181,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466676590,'114.247.223.66',10,'3FCBD547CF0F2C4473946EAF6A22E85212941',0,NULL),
	(182,'-APPDJSX43185-20160623-1810138009','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466676614,1466676611,'114.247.223.66',10,'02C6ADE61F32D481291261C07BCACBC612940',1,'0'),
	(183,'-APPDJSX43185-20160623-1813438148','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466676823,1466676821,'114.247.223.66',10,'4E4CEFB8C73D7C8A0F9D3195026FA9EA11236',1,'0'),
	(184,'-APPDJSX43185-20160623-1814138149','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466676853,1466676851,'114.247.223.66',10,'B969672CBCE522D2A434A68F332A8CF911240',1,'0'),
	(185,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466677395,'114.247.223.66',10,'B30F358D49447CBBF36BC8331556F70310933',0,NULL),
	(186,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466677396,'114.247.223.66',10,'BB5C1919056D4549F18E56CEB555263C10934',0,NULL),
	(187,NULL,'qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466678066,'114.247.223.66',10,'BF67D4D0E2317AFFF4D9DB5ED970AF8705994',0,NULL),
	(188,'-APPDJSX43185-20160623-1834510160','qzone',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466678091,1466678088,'114.247.223.66',10,'E544701A0CD34771F28272C94AE0FF5E10933',1,'0'),
	(189,NULL,'pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,NULL,NULL,1466684110,'122.71.227.184',10,'353D22CAFB7A736B170ADC3FCBC5D00F01768',0,NULL),
	(190,'-APPDJSX43185-20160623-2015286223','pengyou',14,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466684128,1466684124,'122.71.227.184',10,'A556D12F00EDFE1F728176C0E1D8B02801767',1,'0'),
	(191,'-APPDJSX43185-20160623-2016051053','pengyou',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466684168,1466684160,'122.71.227.184',10,'FE3D47BCD4891392895A9610A157395B16223',1,'0'),
	(192,'-APPDJSX43185-20160623-2018449225','pengyou',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466684324,1466684285,'122.71.227.184',10,'3E80003CB6B6D07DA27EEF9D3786AAA601768',1,'0'),
	(193,'-APPDJSX43185-20160623-2019406227','pengyou',15,'8405E15ED54FB03256AB3E59AA90D411',10,100,100,'5*100*1',1466684380,1466684368,'122.71.227.184',10,'379DA33F34801B0496C03BD7C8519AA801768',1,'0');

/*!40000 ALTER TABLE `app_cash_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID作为用户ID',
  `platform` varchar(50) DEFAULT 'local' COMMENT '平台',
  `openid` varchar(255) DEFAULT NULL COMMENT '平台账号',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;

INSERT INTO `app_user` (`id`, `platform`, `openid`, `createtime`)
VALUES
	(10001,'qzone','8405E15ED54FB03256AB3E59AA90D411',1464589237),
	(10002,'qzone','B370957DA0328A954E84AF66536AE490',1464688218),
	(10003,'qzone','037C54A1E9D938F581C838D063700BD4',1464699179),
	(10004,'qzone','FA6DC9814B93659E38FA972B1CB1BAD6',1464745938),
	(10005,'qzone','F90708E178AB426927AFFC1F844D28E3',1464746004),
	(10006,'qzone','E786AAB1EDC12E905FB5CC5F376D7D65',1464757573),
	(10007,'qzone','7E943C7E225A5C0934F9175825C9D0A1',1464764438),
	(10008,'qzone','E44188B1387A90D70C2CE0F494D7950A',1464765132),
	(10009,'qzone','822035C0B5A7CE7A281F7CA5E0B85DE1',1465266924),
	(10010,'qzone','49DA77327FF4EE8EEEB7CAAA1D5A21F8',1465287174),
	(10011,'website','BCCF13999A1BD9E67B4D6DA79561E01A',1466488951),
	(10012,'qzone','E98C51D6B829C8FD729083D18CD4016F',1466502162),
	(10013,'qzone','3527F8574A1442144B77A8F77794FB6F',1466502985),
	(10014,'qzone','6E4973F1EAB18460204579FE92C30BFC',1466522716);

/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;