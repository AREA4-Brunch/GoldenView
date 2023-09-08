-- -- ----------------------------------------------------------------------------
-- -- Schema trading_platform
-- -- ----------------------------------------------------------------------------
-- DROP SCHEMA IF EXISTS `trading_platform` ;
-- CREATE SCHEMA IF NOT EXISTS `trading_platform` ;


-- -- Rest is generated from Django code
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2023 at 08:26 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trading_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approvalreportfile`
--

CREATE TABLE `approvalreportfile` (
  `FilePath` varchar(128) NOT NULL,
  `ApprovalContent` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `IdAsset` int(11) NOT NULL,
  `TickerSymbol` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'can_trade');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add completed task', 6, 'add_completedtask'),
(22, 'Can change completed task', 6, 'change_completedtask'),
(23, 'Can delete completed task', 6, 'delete_completedtask'),
(24, 'Can view completed task', 6, 'view_completedtask'),
(25, 'Can add task', 7, 'add_task'),
(26, 'Can change task', 7, 'change_task'),
(27, 'Can delete task', 7, 'delete_task'),
(28, 'Can view task', 7, 'view_task'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add country', 9, 'add_country'),
(34, 'Can change country', 9, 'change_country'),
(35, 'Can delete country', 9, 'delete_country'),
(36, 'Can view country', 9, 'view_country'),
(37, 'Can add funds transfer method', 10, 'add_fundstransfermethod'),
(38, 'Can change funds transfer method', 10, 'change_fundstransfermethod'),
(39, 'Can delete funds transfer method', 10, 'delete_fundstransfermethod'),
(40, 'Can view funds transfer method', 10, 'view_fundstransfermethod'),
(41, 'Can add administrator', 11, 'add_administrator'),
(42, 'Can change administrator', 11, 'change_administrator'),
(43, 'Can delete administrator', 11, 'delete_administrator'),
(44, 'Can view administrator', 11, 'view_administrator'),
(45, 'Can add trader', 12, 'add_trader'),
(46, 'Can change trader', 12, 'change_trader'),
(47, 'Can delete trader', 12, 'delete_trader'),
(48, 'Can view trader', 12, 'view_trader'),
(49, 'Can add basic user', 13, 'add_basicuser'),
(50, 'Can change basic user', 13, 'change_basicuser'),
(51, 'Can delete basic user', 13, 'delete_basicuser'),
(52, 'Can view basic user', 13, 'view_basicuser'),
(53, 'Can add asset', 14, 'add_asset'),
(54, 'Can change asset', 14, 'change_asset'),
(55, 'Can delete asset', 14, 'delete_asset'),
(56, 'Can view asset', 14, 'view_asset'),
(57, 'Can add sales request', 15, 'add_salesrequest'),
(58, 'Can change sales request', 15, 'change_salesrequest'),
(59, 'Can delete sales request', 15, 'delete_salesrequest'),
(60, 'Can view sales request', 15, 'view_salesrequest'),
(61, 'Can add purchase request', 16, 'add_purchaserequest'),
(62, 'Can change purchase request', 16, 'change_purchaserequest'),
(63, 'Can delete purchase request', 16, 'delete_purchaserequest'),
(64, 'Can view purchase request', 16, 'view_purchaserequest'),
(65, 'Can add make belief owns', 17, 'add_makebeliefowns'),
(66, 'Can change make belief owns', 17, 'change_makebeliefowns'),
(67, 'Can delete make belief owns', 17, 'delete_makebeliefowns'),
(68, 'Can view make belief owns', 17, 'view_makebeliefowns'),
(69, 'Can add broker', 18, 'add_broker'),
(70, 'Can change broker', 18, 'change_broker'),
(71, 'Can delete broker', 18, 'delete_broker'),
(72, 'Can view broker', 18, 'view_broker'),
(73, 'Can add broker basic user contract', 19, 'add_brokerbasicusercontract'),
(74, 'Can change broker basic user contract', 19, 'change_brokerbasicusercontract'),
(75, 'Can delete broker basic user contract', 19, 'delete_brokerbasicusercontract'),
(76, 'Can view broker basic user contract', 19, 'view_brokerbasicusercontract'),
(77, 'Can add text file', 20, 'add_textfile'),
(78, 'Can change text file', 20, 'change_textfile'),
(79, 'Can delete text file', 20, 'delete_textfile'),
(80, 'Can view text file', 20, 'view_textfile'),
(81, 'Can add approval report file', 21, 'add_approvalreportfile'),
(82, 'Can change approval report file', 21, 'change_approvalreportfile'),
(83, 'Can delete approval report file', 21, 'delete_approvalreportfile'),
(84, 'Can view approval report file', 21, 'view_approvalreportfile'),
(85, 'Can add broker basic user contract file', 22, 'add_brokerbasicusercontractfile'),
(86, 'Can change broker basic user contract file', 22, 'change_brokerbasicusercontractfile'),
(87, 'Can delete broker basic user contract file', 22, 'delete_brokerbasicusercontractfile'),
(88, 'Can view broker basic user contract file', 22, 'view_brokerbasicusercontractfile'),
(89, 'Can add broker request file', 23, 'add_brokerrequestfile'),
(90, 'Can change broker request file', 23, 'change_brokerrequestfile'),
(91, 'Can delete broker request file', 23, 'delete_brokerrequestfile'),
(92, 'Can view broker request file', 23, 'view_brokerrequestfile');

-- --------------------------------------------------------

--
-- Table structure for table `background_task`
--

CREATE TABLE `background_task` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`creator_object_id` >= 0),
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `background_task_completedtask`
--

CREATE TABLE `background_task_completedtask` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`creator_object_id` >= 0),
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basicuser`
--

CREATE TABLE `basicuser` (
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broker`
--

CREATE TABLE `broker` (
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brokerbasicusercontract`
--

CREATE TABLE `brokerbasicusercontract` (
  `IdContract` int(11) NOT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `ResponseTime` datetime(6) DEFAULT NULL,
  `WasAccepted` int(11) NOT NULL,
  `FeePercentage` double NOT NULL,
  `ExpirationTime` datetime(6) NOT NULL,
  `ContractFilePath` varchar(128) NOT NULL,
  `IdBasicUser` int(11) NOT NULL,
  `IdBroker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brokerbasicusercontractfile`
--

CREATE TABLE `brokerbasicusercontractfile` (
  `FilePath` varchar(128) NOT NULL,
  `ContractContent` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brokerrequestfile`
--

CREATE TABLE `brokerrequestfile` (
  `FilePath` varchar(128) NOT NULL,
  `RequestContent` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `IdCountry` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`IdCountry`, `Name`) VALUES
(1, 'us'),
(2, 'ca'),
(3, 'mx'),
(4, 'rs'),
(5, 'ru'),
(6, 'hr'),
(7, 'me');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-09-08 18:15:51.022497', '1', 'Country object (1)', 1, '[{\"added\": {}}]', 9, 1),
(2, '2023-09-08 18:17:44.076325', '2', 'Country object (2)', 1, '[{\"added\": {}}]', 9, 1),
(3, '2023-09-08 18:17:49.256097', '3', 'Country object (3)', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-09-08 18:17:56.807120', '4', 'Country object (4)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-09-08 18:18:01.584236', '5', 'Country object (5)', 1, '[{\"added\": {}}]', 9, 1),
(6, '2023-09-08 18:18:07.671972', '6', 'Country object (6)', 1, '[{\"added\": {}}]', 9, 1),
(7, '2023-09-08 18:18:12.090680', '7', 'Country object (7)', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-09-08 18:20:16.847220', '1', 'can_trade', 1, '[{\"added\": {}}]', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(14, 'asset_management', 'asset'),
(17, 'asset_management', 'makebeliefowns'),
(16, 'asset_management', 'purchaserequest'),
(15, 'asset_management', 'salesrequest'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'background_task', 'completedtask'),
(7, 'background_task', 'task'),
(18, 'broker_management', 'broker'),
(19, 'broker_management', 'brokerbasicusercontract'),
(4, 'contenttypes', 'contenttype'),
(21, 'file_management', 'approvalreportfile'),
(22, 'file_management', 'brokerbasicusercontractfile'),
(23, 'file_management', 'brokerrequestfile'),
(20, 'file_management', 'textfile'),
(5, 'sessions', 'session'),
(11, 'user_management', 'administrator'),
(13, 'user_management', 'basicuser'),
(9, 'user_management', 'country'),
(10, 'user_management', 'fundstransfermethod'),
(12, 'user_management', 'trader'),
(8, 'user_management', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-08 18:03:59.606059'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-09-08 18:03:59.673020'),
(3, 'auth', '0001_initial', '2023-09-08 18:03:59.968900'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-09-08 18:04:00.019896'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-09-08 18:04:00.040897'),
(6, 'auth', '0004_alter_user_username_opts', '2023-09-08 18:04:00.056897'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-09-08 18:04:00.068909'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-09-08 18:04:00.074896'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-09-08 18:04:00.087899'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-09-08 18:04:00.097894'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-09-08 18:04:00.113896'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-09-08 18:04:00.142898'),
(13, 'auth', '0011_update_proxy_permissions', '2023-09-08 18:04:00.162900'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-09-08 18:04:00.175905'),
(15, 'user_management', '0001_initial', '2023-09-08 18:04:00.930308'),
(16, 'admin', '0001_initial', '2023-09-08 18:04:01.098330'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-09-08 18:04:01.108203'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-08 18:04:01.122204'),
(19, 'file_management', '0001_initial', '2023-09-08 18:04:01.369649'),
(20, 'broker_management', '0001_initial', '2023-09-08 18:04:01.626690'),
(21, 'asset_management', '0001_initial', '2023-09-08 18:04:02.366864'),
(22, 'background_task', '0001_initial', '2023-09-08 18:04:02.793865'),
(23, 'background_task', '0002_auto_20170927_1109', '2023-09-08 18:04:02.821865'),
(24, 'background_task', '0003_auto_20210410_1529', '2023-09-08 18:04:03.097867'),
(25, 'background_task', '0004_auto_20220202_1721', '2023-09-08 18:04:03.253862'),
(26, 'sessions', '0001_initial', '2023-09-08 18:04:03.295863');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('au17sdcsd2jn08h1g27gg1jbxpi6dakp', '.eJxVjMEOwiAQRP-FsyFQkKUevfsNZNkFqRpISnsy_rtt0oNmbvPezFsEXJcS1p7mMLG4CC1Ov11Eeqa6A35gvTdJrS7zFOWuyIN2eWucXtfD_Tso2Mu2Buu0ZYXE5IfBEQOZTAaVSwCDM97mMZM-kzfjFrQ2Q1SQNRuGmEfx-QLflTfi:1qefxC:VzSrQr9TCrkz3v5RltyMP_rm0OA2ug6XfgoZM62fgno', '2023-09-22 18:11:38.692885'),
('ryxmg8w5j826tv9dteb8goj5k0k2t8s3', 'e30:1qeg4p:HDDdza40Pce50mQ6C0tiQYRcyvRiz4Re4e6jUtr2WIo', '2023-09-22 18:19:31.653317');

-- --------------------------------------------------------

--
-- Table structure for table `fundstransfermethod`
--

CREATE TABLE `fundstransfermethod` (
  `IdPaymentMethod` int(11) NOT NULL,
  `AccessKey` varchar(64) NOT NULL,
  `MakeBeliefBalance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makebeliefowns`
--

CREATE TABLE `makebeliefowns` (
  `id` bigint(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `IdAsset` int(11) NOT NULL,
  `IdPaymentMethod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaserequest`
--

CREATE TABLE `purchaserequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `QuantityRequested` int(11) NOT NULL,
  `TotalTransactionsPrice` decimal(10,2) NOT NULL,
  `QuantityRequired` int(11) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL,
  `IsBoundByContract` tinyint(1) NOT NULL,
  `IdAsset` int(11) NOT NULL,
  `IdContract` int(11) DEFAULT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesrequest`
--

CREATE TABLE `salesrequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `QuantityRequested` int(11) NOT NULL,
  `TotalTransactionsPrice` decimal(10,2) NOT NULL,
  `QuantityRequired` int(11) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL,
  `IsBoundByContract` tinyint(1) NOT NULL,
  `IdAsset` int(11) NOT NULL,
  `IdContract` int(11) DEFAULT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `textfile`
--

CREATE TABLE `textfile` (
  `FilePath` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trader`
--

CREATE TABLE `trader` (
  `IdUser` int(11) NOT NULL,
  `Birthday` date NOT NULL,
  `Sex` varchar(6) NOT NULL,
  `TermsAcceptanceTime` datetime(6) NOT NULL,
  `IdCountry` int(11) NOT NULL,
  `IdSelectedFundsTrasnferMethod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `IdUser` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `IdUser`, `Username`, `Password`, `Email`) VALUES
('2023-09-08 18:11:38.688926', 1, '', '', 1, 1, '2023-09-08 18:09:10.482783', 1, 'admin', 'pbkdf2_sha256$600000$6cpSEYYUPZsZtyyRj3g0FA$ZcN2bpt8p65oI/vCClh//lNf7ef2+t1edyEuJvbjX3A=', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_permissions`
--

CREATE TABLE `user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`IdUser`);

--
-- Indexes for table `approvalreportfile`
--
ALTER TABLE `approvalreportfile`
  ADD PRIMARY KEY (`FilePath`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`IdAsset`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `background_task`
--
ALTER TABLE `background_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_task_name_4562d56a` (`task_name`),
  ADD KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  ADD KEY `background_task_priority_88bdbce9` (`priority`),
  ADD KEY `background_task_run_at_7baca3aa` (`run_at`),
  ADD KEY `background_task_queue_1d5f3a40` (`queue`),
  ADD KEY `background_task_attempts_a9ade23d` (`attempts`),
  ADD KEY `background_task_failed_at_b81bba14` (`failed_at`),
  ADD KEY `background_task_locked_by_db7779e3` (`locked_by`),
  ADD KEY `background_task_locked_at_0fb0f225` (`locked_at`);

--
-- Indexes for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  ADD KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  ADD KEY `background_task_completedtask_priority_9080692e` (`priority`),
  ADD KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  ADD KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  ADD KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  ADD KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  ADD KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  ADD KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`);

--
-- Indexes for table `basicuser`
--
ALTER TABLE `basicuser`
  ADD PRIMARY KEY (`IdUser`);

--
-- Indexes for table `broker`
--
ALTER TABLE `broker`
  ADD PRIMARY KEY (`IdUser`);

--
-- Indexes for table `brokerbasicusercontract`
--
ALTER TABLE `brokerbasicusercontract`
  ADD PRIMARY KEY (`IdContract`),
  ADD KEY `brokerbasicusercontr_ContractFilePath_982775ae_fk_brokerbas` (`ContractFilePath`),
  ADD KEY `brokerbasicusercontract_IdBasicUser_566f9645_fk_basicuser_IdUser` (`IdBasicUser`),
  ADD KEY `brokerbasicusercontract_IdBroker_063e2e83_fk_broker_IdUser` (`IdBroker`);

--
-- Indexes for table `brokerbasicusercontractfile`
--
ALTER TABLE `brokerbasicusercontractfile`
  ADD PRIMARY KEY (`FilePath`);

--
-- Indexes for table `brokerrequestfile`
--
ALTER TABLE `brokerrequestfile`
  ADD PRIMARY KEY (`FilePath`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`IdCountry`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_IdUser` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `fundstransfermethod`
--
ALTER TABLE `fundstransfermethod`
  ADD PRIMARY KEY (`IdPaymentMethod`);

--
-- Indexes for table `makebeliefowns`
--
ALTER TABLE `makebeliefowns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `composite_primary_key` (`IdPaymentMethod`,`IdAsset`),
  ADD KEY `makebeliefowns_IdAsset_d11eb163_fk_asset_IdAsset` (`IdAsset`);

--
-- Indexes for table `purchaserequest`
--
ALTER TABLE `purchaserequest`
  ADD PRIMARY KEY (`IdTradeRequest`),
  ADD KEY `purchaserequest_IdAsset_3d9839a8_fk_asset_IdAsset` (`IdAsset`),
  ADD KEY `purchaserequest_IdContract_fd61f4c0_fk_brokerbas` (`IdContract`),
  ADD KEY `purchaserequest_IdUser_c116d49e_fk_trader_IdUser` (`IdUser`);

--
-- Indexes for table `salesrequest`
--
ALTER TABLE `salesrequest`
  ADD PRIMARY KEY (`IdTradeRequest`),
  ADD KEY `salesrequest_IdAsset_e0311b11_fk_asset_IdAsset` (`IdAsset`),
  ADD KEY `salesrequest_IdContract_783fa5c8_fk_brokerbas` (`IdContract`),
  ADD KEY `salesrequest_IdUser_4f6b9d42_fk_trader_IdUser` (`IdUser`);

--
-- Indexes for table `textfile`
--
ALTER TABLE `textfile`
  ADD PRIMARY KEY (`FilePath`);

--
-- Indexes for table `trader`
--
ALTER TABLE `trader`
  ADD PRIMARY KEY (`IdUser`),
  ADD KEY `trader_IdCountry_2add0814_fk_country_IdCountry` (`IdCountry`),
  ADD KEY `trader_IdSelectedFundsTrasn_ffdbf40a_fk_fundstran` (`IdSelectedFundsTrasnferMethod`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUser`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  ADD KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  ADD KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `IdAsset` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `background_task`
--
ALTER TABLE `background_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brokerbasicusercontract`
--
ALTER TABLE `brokerbasicusercontract`
  MODIFY `IdContract` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `IdCountry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fundstransfermethod`
--
ALTER TABLE `fundstransfermethod`
  MODIFY `IdPaymentMethod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makebeliefowns`
--
ALTER TABLE `makebeliefowns`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaserequest`
--
ALTER TABLE `purchaserequest`
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesrequest`
--
ALTER TABLE `salesrequest`
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_IdUser_7a34e409_fk_user_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `approvalreportfile`
--
ALTER TABLE `approvalreportfile`
  ADD CONSTRAINT `approvalreportfile_FilePath_90c9e51f_fk_textfile_FilePath` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `background_task`
--
ALTER TABLE `background_task`
  ADD CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `basicuser`
--
ALTER TABLE `basicuser`
  ADD CONSTRAINT `basicuser_IdUser_2e4cd913_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

--
-- Constraints for table `broker`
--
ALTER TABLE `broker`
  ADD CONSTRAINT `broker_IdUser_48814eee_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

--
-- Constraints for table `brokerbasicusercontract`
--
ALTER TABLE `brokerbasicusercontract`
  ADD CONSTRAINT `brokerbasicusercontr_ContractFilePath_982775ae_fk_brokerbas` FOREIGN KEY (`ContractFilePath`) REFERENCES `brokerbasicusercontractfile` (`FilePath`),
  ADD CONSTRAINT `brokerbasicusercontract_IdBasicUser_566f9645_fk_basicuser_IdUser` FOREIGN KEY (`IdBasicUser`) REFERENCES `basicuser` (`IdUser`),
  ADD CONSTRAINT `brokerbasicusercontract_IdBroker_063e2e83_fk_broker_IdUser` FOREIGN KEY (`IdBroker`) REFERENCES `broker` (`IdUser`);

--
-- Constraints for table `brokerbasicusercontractfile`
--
ALTER TABLE `brokerbasicusercontractfile`
  ADD CONSTRAINT `brokerbasicusercontr_FilePath_e8ebd9fb_fk_textfile_` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`);

--
-- Constraints for table `brokerrequestfile`
--
ALTER TABLE `brokerrequestfile`
  ADD CONSTRAINT `brokerrequestfile_FilePath_c5c6c01f_fk_textfile_FilePath` FOREIGN KEY (`FilePath`) REFERENCES `textfile` (`FilePath`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `makebeliefowns`
--
ALTER TABLE `makebeliefowns`
  ADD CONSTRAINT `makebeliefowns_IdAsset_d11eb163_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  ADD CONSTRAINT `makebeliefowns_IdPaymentMethod_ac7a91da_fk_fundstran` FOREIGN KEY (`IdPaymentMethod`) REFERENCES `fundstransfermethod` (`IdPaymentMethod`);

--
-- Constraints for table `purchaserequest`
--
ALTER TABLE `purchaserequest`
  ADD CONSTRAINT `purchaserequest_IdAsset_3d9839a8_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  ADD CONSTRAINT `purchaserequest_IdContract_fd61f4c0_fk_brokerbas` FOREIGN KEY (`IdContract`) REFERENCES `brokerbasicusercontract` (`IdContract`),
  ADD CONSTRAINT `purchaserequest_IdUser_c116d49e_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

--
-- Constraints for table `salesrequest`
--
ALTER TABLE `salesrequest`
  ADD CONSTRAINT `salesrequest_IdAsset_e0311b11_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  ADD CONSTRAINT `salesrequest_IdContract_783fa5c8_fk_brokerbas` FOREIGN KEY (`IdContract`) REFERENCES `brokerbasicusercontract` (`IdContract`),
  ADD CONSTRAINT `salesrequest_IdUser_4f6b9d42_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

--
-- Constraints for table `trader`
--
ALTER TABLE `trader`
  ADD CONSTRAINT `trader_IdCountry_2add0814_fk_country_IdCountry` FOREIGN KEY (`IdCountry`) REFERENCES `country` (`IdCountry`),
  ADD CONSTRAINT `trader_IdSelectedFundsTrasn_ffdbf40a_fk_fundstran` FOREIGN KEY (`IdSelectedFundsTrasnferMethod`) REFERENCES `fundstransfermethod` (`IdPaymentMethod`),
  ADD CONSTRAINT `trader_IdUser_ffd77317_fk_user_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_groups_user_id_abaea130_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_IdUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
