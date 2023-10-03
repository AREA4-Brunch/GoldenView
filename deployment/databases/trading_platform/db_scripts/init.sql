-- Adminer 4.8.1 MySQL 8.1.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `trading_platform`;
CREATE DATABASE `trading_platform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trading_platform`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `IdUser` int NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `administrator_IdUser_7a34e409_fk_user_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `administrator` (`IdUser`) VALUES
(1);

DROP TABLE IF EXISTS `approvalreportfile`;
CREATE TABLE `approvalreportfile` (
  `FilePath` varchar(128) NOT NULL,
  `ApprovalContent` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `approvalreportfile_FilePath_90c9e51f_fk_textfile_FilePath` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `IdAsset` int NOT NULL AUTO_INCREMENT,
  `TickerSymbol` varchar(16) NOT NULL,
  PRIMARY KEY (`IdAsset`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `asset` (`IdAsset`, `TickerSymbol`) VALUES
(1,	'TSLA'),
(2,	'AAPL'),
(3,	'BLK');

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1,	'can_trade');

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1,	'Can add permission',	1,	'add_permission'),
(2,	'Can change permission',	1,	'change_permission'),
(3,	'Can delete permission',	1,	'delete_permission'),
(4,	'Can view permission',	1,	'view_permission'),
(5,	'Can add group',	2,	'add_group'),
(6,	'Can change group',	2,	'change_group'),
(7,	'Can delete group',	2,	'delete_group'),
(8,	'Can view group',	2,	'view_group'),
(9,	'Can add content type',	3,	'add_contenttype'),
(10,	'Can change content type',	3,	'change_contenttype'),
(11,	'Can delete content type',	3,	'delete_contenttype'),
(12,	'Can view content type',	3,	'view_contenttype'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add country',	5,	'add_country'),
(18,	'Can change country',	5,	'change_country'),
(19,	'Can delete country',	5,	'delete_country'),
(20,	'Can view country',	5,	'view_country'),
(21,	'Can add funds transfer method',	6,	'add_fundstransfermethod'),
(22,	'Can change funds transfer method',	6,	'change_fundstransfermethod'),
(23,	'Can delete funds transfer method',	6,	'delete_fundstransfermethod'),
(24,	'Can view funds transfer method',	6,	'view_fundstransfermethod'),
(25,	'Can add administrator',	7,	'add_administrator'),
(26,	'Can change administrator',	7,	'change_administrator'),
(27,	'Can delete administrator',	7,	'delete_administrator'),
(28,	'Can view administrator',	7,	'view_administrator'),
(29,	'Can add trader',	8,	'add_trader'),
(30,	'Can change trader',	8,	'change_trader'),
(31,	'Can delete trader',	8,	'delete_trader'),
(32,	'Can view trader',	8,	'view_trader'),
(33,	'Can add basic user',	9,	'add_basicuser'),
(34,	'Can change basic user',	9,	'change_basicuser'),
(35,	'Can delete basic user',	9,	'delete_basicuser'),
(36,	'Can view basic user',	9,	'view_basicuser'),
(37,	'Can add asset',	10,	'add_asset'),
(38,	'Can change asset',	10,	'change_asset'),
(39,	'Can delete asset',	10,	'delete_asset'),
(40,	'Can view asset',	10,	'view_asset'),
(41,	'Can add sales request',	11,	'add_salesrequest'),
(42,	'Can change sales request',	11,	'change_salesrequest'),
(43,	'Can delete sales request',	11,	'delete_salesrequest'),
(44,	'Can view sales request',	11,	'view_salesrequest'),
(45,	'Can add purchase request',	12,	'add_purchaserequest'),
(46,	'Can change purchase request',	12,	'change_purchaserequest'),
(47,	'Can delete purchase request',	12,	'delete_purchaserequest'),
(48,	'Can view purchase request',	12,	'view_purchaserequest'),
(49,	'Can add broker',	13,	'add_broker'),
(50,	'Can change broker',	13,	'change_broker'),
(51,	'Can delete broker',	13,	'delete_broker'),
(52,	'Can view broker',	13,	'view_broker'),
(53,	'Can add broker basic user contract',	14,	'add_brokerbasicusercontract'),
(54,	'Can change broker basic user contract',	14,	'change_brokerbasicusercontract'),
(55,	'Can delete broker basic user contract',	14,	'delete_brokerbasicusercontract'),
(56,	'Can view broker basic user contract',	14,	'view_brokerbasicusercontract'),
(57,	'Can add text file',	15,	'add_textfile'),
(58,	'Can change text file',	15,	'change_textfile'),
(59,	'Can delete text file',	15,	'delete_textfile'),
(60,	'Can view text file',	15,	'view_textfile'),
(61,	'Can add approval report file',	16,	'add_approvalreportfile'),
(62,	'Can change approval report file',	16,	'change_approvalreportfile'),
(63,	'Can delete approval report file',	16,	'delete_approvalreportfile'),
(64,	'Can view approval report file',	16,	'view_approvalreportfile'),
(65,	'Can add broker basic user contract file',	17,	'add_brokerbasicusercontractfile'),
(66,	'Can change broker basic user contract file',	17,	'change_brokerbasicusercontractfile'),
(67,	'Can delete broker basic user contract file',	17,	'delete_brokerbasicusercontractfile'),
(68,	'Can view broker basic user contract file',	17,	'view_brokerbasicusercontractfile'),
(69,	'Can add broker request file',	18,	'add_brokerrequestfile'),
(70,	'Can change broker request file',	18,	'change_brokerrequestfile'),
(71,	'Can delete broker request file',	18,	'delete_brokerrequestfile'),
(72,	'Can view broker request file',	18,	'view_brokerrequestfile'),
(73,	'Can add make belief owns',	19,	'add_makebeliefowns'),
(74,	'Can change make belief owns',	19,	'change_makebeliefowns'),
(75,	'Can delete make belief owns',	19,	'delete_makebeliefowns'),
(76,	'Can view make belief owns',	19,	'view_makebeliefowns'),
(77,	'Can add log entry',	20,	'add_logentry'),
(78,	'Can change log entry',	20,	'change_logentry'),
(79,	'Can delete log entry',	20,	'delete_logentry'),
(80,	'Can view log entry',	20,	'view_logentry'),
(81,	'Can add session',	21,	'add_session'),
(82,	'Can change session',	21,	'change_session'),
(83,	'Can delete session',	21,	'delete_session'),
(84,	'Can view session',	21,	'view_session'),
(85,	'Can add completed task',	22,	'add_completedtask'),
(86,	'Can change completed task',	22,	'change_completedtask'),
(87,	'Can delete completed task',	22,	'delete_completedtask'),
(88,	'Can view completed task',	22,	'view_completedtask'),
(89,	'Can add task',	23,	'add_task'),
(90,	'Can change task',	23,	'change_task'),
(91,	'Can delete task',	23,	'delete_task'),
(92,	'Can view task',	23,	'view_task');

DROP TABLE IF EXISTS `background_task`;
CREATE TABLE `background_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int unsigned DEFAULT NULL,
  `creator_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_task_name_4562d56a` (`task_name`),
  KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  KEY `background_task_priority_88bdbce9` (`priority`),
  KEY `background_task_run_at_7baca3aa` (`run_at`),
  KEY `background_task_queue_1d5f3a40` (`queue`),
  KEY `background_task_attempts_a9ade23d` (`attempts`),
  KEY `background_task_failed_at_b81bba14` (`failed_at`),
  KEY `background_task_locked_by_db7779e3` (`locked_by`),
  KEY `background_task_locked_at_0fb0f225` (`locked_at`),
  CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `background_task_chk_1` CHECK ((`creator_object_id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `background_task_completedtask`;
CREATE TABLE `background_task_completedtask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int unsigned DEFAULT NULL,
  `creator_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  KEY `background_task_completedtask_priority_9080692e` (`priority`),
  KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`),
  CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `background_task_completedtask_chk_1` CHECK ((`creator_object_id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `basicuser`;
CREATE TABLE `basicuser` (
  `IdUser` int NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `basicuser_IdUser_2e4cd913_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `broker`;
CREATE TABLE `broker` (
  `IdUser` int NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `broker_IdUser_48814eee_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `brokerbasicusercontract`;
CREATE TABLE `brokerbasicusercontract` (
  `IdContract` int NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `ResponseTime` datetime(6) DEFAULT NULL,
  `WasAccepted` int NOT NULL,
  `FeePercentage` double NOT NULL,
  `ExpirationTime` datetime(6) NOT NULL,
  `ContractFilePath` varchar(128) NOT NULL,
  `IdBasicUser` int NOT NULL,
  `IdBroker` int NOT NULL,
  PRIMARY KEY (`IdContract`),
  KEY `brokerbasicusercontr_ContractFilePath_982775ae_fk_brokerbas` (`ContractFilePath`),
  KEY `brokerbasicusercontract_IdBasicUser_566f9645_fk_basicuser_IdUser` (`IdBasicUser`),
  KEY `brokerbasicusercontract_IdBroker_063e2e83_fk_broker_IdUser` (`IdBroker`),
  CONSTRAINT `brokerbasicusercontr_ContractFilePath_982775ae_fk_brokerbas` FOREIGN KEY (`ContractFilePath`) REFERENCES `brokerbasicusercontractfile` (`FilePath`),
  CONSTRAINT `brokerbasicusercontract_IdBasicUser_566f9645_fk_basicuser_IdUser` FOREIGN KEY (`IdBasicUser`) REFERENCES `basicuser` (`IdUser`),
  CONSTRAINT `brokerbasicusercontract_IdBroker_063e2e83_fk_broker_IdUser` FOREIGN KEY (`IdBroker`) REFERENCES `broker` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `brokerbasicusercontractfile`;
CREATE TABLE `brokerbasicusercontractfile` (
  `FilePath` varchar(128) NOT NULL,
  `ContractContent` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `brokerbasicusercontr_FilePath_e8ebd9fb_fk_textfile_` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `brokerrequestfile`;
CREATE TABLE `brokerrequestfile` (
  `FilePath` varchar(128) NOT NULL,
  `RequestContent` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `brokerrequestfile_FilePath_c5c6c01f_fk_textfile_FilePath` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `IdCountry` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  PRIMARY KEY (`IdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `country` (`IdCountry`, `Name`) VALUES
(1,	'us'),
(2,	'ca'),
(3,	'mx'),
(4,	'rs'),
(5,	'ru'),
(6,	'hr'),
(7,	'me');

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_IdUser` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(20,	'admin',	'logentry'),
(10,	'asset_management',	'asset'),
(12,	'asset_management',	'purchaserequest'),
(11,	'asset_management',	'salesrequest'),
(2,	'auth',	'group'),
(1,	'auth',	'permission'),
(22,	'background_task',	'completedtask'),
(23,	'background_task',	'task'),
(13,	'broker_management',	'broker'),
(14,	'broker_management',	'brokerbasicusercontract'),
(3,	'contenttypes',	'contenttype'),
(16,	'file_management',	'approvalreportfile'),
(17,	'file_management',	'brokerbasicusercontractfile'),
(18,	'file_management',	'brokerrequestfile'),
(15,	'file_management',	'textfile'),
(21,	'sessions',	'session'),
(7,	'user_management',	'administrator'),
(9,	'user_management',	'basicuser'),
(5,	'user_management',	'country'),
(6,	'user_management',	'fundstransfermethod'),
(8,	'user_management',	'trader'),
(4,	'user_management',	'user'),
(19,	'wallet',	'makebeliefowns');

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1,	'contenttypes',	'0001_initial',	'2023-09-13 12:04:39.852807'),
(2,	'contenttypes',	'0002_remove_content_type_name',	'2023-09-13 12:04:40.191668'),
(3,	'auth',	'0001_initial',	'2023-09-13 12:04:41.519673'),
(4,	'auth',	'0002_alter_permission_name_max_length',	'2023-09-13 12:04:41.887809'),
(5,	'auth',	'0003_alter_user_email_max_length',	'2023-09-13 12:04:41.939819'),
(6,	'auth',	'0004_alter_user_username_opts',	'2023-09-13 12:04:41.989823'),
(7,	'auth',	'0005_alter_user_last_login_null',	'2023-09-13 12:04:42.066266'),
(8,	'auth',	'0006_require_contenttypes_0002',	'2023-09-13 12:04:42.110095'),
(9,	'auth',	'0007_alter_validators_add_error_messages',	'2023-09-13 12:04:42.211815'),
(10,	'auth',	'0008_alter_user_username_max_length',	'2023-09-13 12:04:42.302141'),
(11,	'auth',	'0009_alter_user_last_name_max_length',	'2023-09-13 12:04:42.392972'),
(12,	'auth',	'0010_alter_group_name_max_length',	'2023-09-13 12:04:42.515255'),
(13,	'auth',	'0011_update_proxy_permissions',	'2023-09-13 12:04:42.573518'),
(14,	'auth',	'0012_alter_user_first_name_max_length',	'2023-09-13 12:04:42.637385'),
(15,	'user_management',	'0001_initial',	'2023-09-13 12:04:46.174611'),
(16,	'user_management',	'0002_alter_trader_idselectedfundstransfermethod',	'2023-09-13 12:04:46.939818'),
(17,	'file_management',	'0001_initial',	'2023-09-13 12:05:12.419290'),
(18,	'broker_management',	'0001_initial',	'2023-09-13 12:05:13.711334'),
(19,	'asset_management',	'0001_initial',	'2023-09-13 12:05:15.694754'),
(20,	'wallet',	'0001_initial',	'2023-09-13 12:05:16.462000'),
(21,	'admin',	'0001_initial',	'2023-09-13 12:06:52.923750'),
(22,	'admin',	'0002_logentry_remove_auto_add',	'2023-09-13 12:06:52.974206'),
(23,	'admin',	'0003_logentry_add_action_flag_choices',	'2023-09-13 12:06:53.082501'),
(24,	'background_task',	'0001_initial',	'2023-09-13 12:06:55.679084'),
(25,	'background_task',	'0002_auto_20170927_1109',	'2023-09-13 12:06:55.809008'),
(26,	'background_task',	'0003_auto_20210410_1529',	'2023-09-13 12:06:56.735994'),
(27,	'background_task',	'0004_auto_20220202_1721',	'2023-09-13 12:06:57.722045'),
(28,	'sessions',	'0001_initial',	'2023-09-13 12:06:57.974054');

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `fundstransfermethod`;
CREATE TABLE `fundstransfermethod` (
  `IdPaymentMethod` int NOT NULL AUTO_INCREMENT,
  `AccessKey` varchar(64) NOT NULL,
  `MakeBeliefBalance` decimal(10,2) NOT NULL,
  `IdTrader` int NOT NULL,
  PRIMARY KEY (`IdPaymentMethod`),
  KEY `fundstransfermethod_IdTrader_ac94b0d6_fk_trader_IdUser` (`IdTrader`),
  CONSTRAINT `fundstransfermethod_IdTrader_ac94b0d6_fk_trader_IdUser` FOREIGN KEY (`IdTrader`) REFERENCES `trader` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `makebeliefowns`;
CREATE TABLE `makebeliefowns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Quantity` int NOT NULL,
  `IdAsset` int NOT NULL,
  `IdPaymentMethod` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composite_primary_key` (`IdPaymentMethod`,`IdAsset`),
  KEY `makebeliefowns_IdAsset_d11eb163_fk_asset_IdAsset` (`IdAsset`),
  CONSTRAINT `makebeliefowns_IdAsset_d11eb163_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  CONSTRAINT `makebeliefowns_IdPaymentMethod_ac7a91da_fk_fundstran` FOREIGN KEY (`IdPaymentMethod`) REFERENCES `fundstransfermethod` (`IdPaymentMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `purchaserequest`;
CREATE TABLE `purchaserequest` (
  `IdTradeRequest` bigint NOT NULL AUTO_INCREMENT,
  `QuantityRequested` int NOT NULL,
  `TotalTransactionsPrice` decimal(10,2) NOT NULL,
  `QuantityRequired` int NOT NULL,
  `UnitPriceLowerBound` decimal(10,4) NOT NULL,
  `UnitPriceUpperBound` decimal(10,4) NOT NULL,
  `IsBoundByContract` tinyint(1) NOT NULL,
  `IdAsset` int NOT NULL,
  `IdContract` int DEFAULT NULL,
  `IdUser` int NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  KEY `purchaserequest_IdAsset_3d9839a8_fk_asset_IdAsset` (`IdAsset`),
  KEY `purchaserequest_IdContract_fd61f4c0_fk_brokerbas` (`IdContract`),
  KEY `purchaserequest_IdUser_c116d49e_fk_trader_IdUser` (`IdUser`),
  KEY `unitpricelowerbound_RangeQuery` (`UnitPriceLowerBound`) USING BTREE,
  KEY `unitpriceupperbound_RangeQuery` (`UnitPriceUpperBound`) USING BTREE,
  CONSTRAINT `purchaserequest_IdAsset_3d9839a8_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  CONSTRAINT `purchaserequest_IdContract_fd61f4c0_fk_brokerbas` FOREIGN KEY (`IdContract`) REFERENCES `brokerbasicusercontract` (`IdContract`),
  CONSTRAINT `purchaserequest_IdUser_c116d49e_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `salesrequest`;
CREATE TABLE `salesrequest` (
  `IdTradeRequest` bigint NOT NULL AUTO_INCREMENT,
  `QuantityRequested` int NOT NULL,
  `TotalTransactionsPrice` decimal(10,2) NOT NULL,
  `QuantityRequired` int NOT NULL,
  `UnitPriceLowerBound` decimal(10,4) NOT NULL,
  `UnitPriceUpperBound` decimal(10,4) NOT NULL,
  `IsBoundByContract` tinyint(1) NOT NULL,
  `IdAsset` int NOT NULL,
  `IdContract` int DEFAULT NULL,
  `IdUser` int NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  KEY `salesrequest_IdAsset_e0311b11_fk_asset_IdAsset` (`IdAsset`),
  KEY `salesrequest_IdContract_783fa5c8_fk_brokerbas` (`IdContract`),
  KEY `salesrequest_IdUser_4f6b9d42_fk_trader_IdUser` (`IdUser`),
  KEY `unitpricelowerbound_RangeQuery` (`UnitPriceLowerBound`) USING BTREE,
  KEY `unitpriceupperbound_RangeQuery` (`UnitPriceUpperBound`) USING BTREE,
  CONSTRAINT `salesrequest_IdAsset_e0311b11_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  CONSTRAINT `salesrequest_IdContract_783fa5c8_fk_brokerbas` FOREIGN KEY (`IdContract`) REFERENCES `brokerbasicusercontract` (`IdContract`),
  CONSTRAINT `salesrequest_IdUser_4f6b9d42_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `textfile`;
CREATE TABLE `textfile` (
  `FilePath` varchar(128) NOT NULL,
  PRIMARY KEY (`FilePath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `trader`;
CREATE TABLE `trader` (
  `IdUser` int NOT NULL,
  `Birthday` date NOT NULL,
  `Sex` varchar(6) NOT NULL,
  `TermsAcceptanceTime` datetime(6) NOT NULL,
  `IdCountry` int NOT NULL,
  `IdSelectedFundsTransferMethod` int DEFAULT NULL,
  PRIMARY KEY (`IdUser`),
  KEY `trader_IdCountry_2add0814_fk_country_IdCountry` (`IdCountry`),
  KEY `trader_IdSelectedFundsTrans_0e5d7148_fk_fundstran` (`IdSelectedFundsTransferMethod`),
  CONSTRAINT `trader_IdCountry_2add0814_fk_country_IdCountry` FOREIGN KEY (`IdCountry`) REFERENCES `country` (`IdCountry`),
  CONSTRAINT `trader_IdSelectedFundsTrans_0e5d7148_fk_fundstran` FOREIGN KEY (`IdSelectedFundsTransferMethod`) REFERENCES `fundstransfermethod` (`IdPaymentMethod`),
  CONSTRAINT `trader_IdUser_ffd77317_fk_user_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `IdUser` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Email` varchar(64) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` (`last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `IdUser`, `Username`, `Password`, `Email`) VALUES
('2023-09-13 12:09:35.973920',	1,	'',	'',	1,	1,	'2023-09-13 12:09:16.821282',	1,	'admin',	'pbkdf2_sha256$600000$eKe2PQKV8yOhPW6K7yewX4$+LdSiX/+gg3iHdAqZ9Oiao6VgGpYi++5Lr4WhVvnIxo=',	'admin');

DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_user_permissions`;
CREATE TABLE `user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2023-09-13 12:14:10
