-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 07:41 PM
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

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`IdUser`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `approvalreportfile`
--

CREATE TABLE `approvalreportfile` (
  `FilePath` varchar(128) NOT NULL,
  `ApprovalContent` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approvalreportfile`
--

INSERT INTO `approvalreportfile` (`FilePath`, `ApprovalContent`) VALUES
('brokerApprovalContract/file/AlexBroker', 'User is approved to become a Broker');

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `IdAsset` int(11) NOT NULL,
  `TickerSymbol` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`IdAsset`, `TickerSymbol`) VALUES
(1, 'TSLA'),
(2, 'AAPL'),
(3, 'BLK');

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

--
-- Dumping data for table `background_task_completedtask`
--

INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[], {\"is_purchase_request\": true, \"request_id\": 2}]', 'c38061bc66221467bbd67693dfa2d1cfef0829db', NULL, 0, '2023-09-08 20:35:06.045022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:05.989021', NULL, NULL),
(2, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:06.186073', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:06.098021', NULL, NULL),
(3, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:06.563857', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:06.303775', NULL, NULL),
(4, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:06.801851', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:06.673852', NULL, NULL),
(5, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:06.894853', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:06.850854', NULL, NULL),
(6, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:06.997911', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:06.948869', NULL, NULL),
(7, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.139850', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.108849', NULL, NULL),
(8, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.243856', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.199848', NULL, NULL),
(9, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.315850', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.277850', NULL, NULL),
(10, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.444869', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.412852', NULL, NULL),
(11, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.581847', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.516850', NULL, NULL),
(12, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.727846', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.652847', NULL, NULL),
(13, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.771848', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.741847', NULL, NULL),
(14, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.908847', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.877845', NULL, NULL),
(15, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:07.979846', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:07.948848', NULL, NULL),
(16, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.115845', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.083848', NULL, NULL),
(17, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.218846', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.190847', NULL, NULL),
(18, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.270851', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.242847', NULL, NULL),
(19, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.373846', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.343848', NULL, NULL),
(20, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.426363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.401364', NULL, NULL),
(21, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.467363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.443363', NULL, NULL),
(22, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.520366', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.489367', NULL, NULL),
(23, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.621363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.590364', NULL, NULL),
(24, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.743364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.716365', NULL, NULL),
(25, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.812365', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.775366', NULL, NULL),
(26, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.898373', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.869367', NULL, NULL),
(27, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:08.995368', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:08.962367', NULL, NULL),
(28, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.085363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.056365', NULL, NULL),
(29, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.174364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.140366', NULL, NULL),
(30, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.264364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.235365', NULL, NULL),
(31, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.374364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.343366', NULL, NULL),
(32, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.462414', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.430416', NULL, NULL),
(33, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.581414', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.551415', NULL, NULL),
(34, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.707414', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.680418', NULL, NULL),
(35, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.744413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.718414', NULL, NULL),
(36, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:09.874435', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:09.832415', NULL, NULL),
(37, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.247415', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.033415', NULL, NULL),
(38, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.348415', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.299417', NULL, NULL),
(39, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.428418', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.392415', NULL, NULL),
(40, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.563413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.495417', NULL, NULL),
(41, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.613413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.581417', NULL, NULL),
(42, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.707413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.674415', NULL, NULL),
(43, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.832416', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.792422', NULL, NULL),
(44, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:10.958414', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:10.926415', NULL, NULL),
(45, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:11.045417', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:11.013416', NULL, NULL),
(46, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:11.366206', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:11.099416', NULL, NULL),
(47, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:11.822991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:11.541893', NULL, NULL),
(48, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:11.992992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:11.922993', NULL, NULL),
(49, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:12.215991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:12.110990', NULL, NULL),
(50, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:12.384043', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:12.245995', NULL, NULL),
(51, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:12.437044', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:12.398045', NULL, NULL),
(52, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:12.575040', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:12.523045', NULL, NULL),
(53, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:12.876045', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:12.745043', NULL, NULL),
(54, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.055291', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.011274', NULL, NULL),
(55, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.190277', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.141274', NULL, NULL),
(56, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.361971', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.275273', NULL, NULL),
(57, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.492970', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.431973', NULL, NULL),
(58, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.677018', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.561018', NULL, NULL),
(59, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.861020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.804020', NULL, NULL),
(60, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:13.975015', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:13.939018', NULL, NULL),
(61, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.044019', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.002017', NULL, NULL),
(62, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.157023', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.110018', NULL, NULL),
(63, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.258017', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.214021', NULL, NULL),
(64, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.391016', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.354021', NULL, NULL),
(65, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.549018', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.509019', NULL, NULL),
(66, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.645016', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.588018', NULL, NULL),
(67, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.705017', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.666020', NULL, NULL),
(68, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:14.892018', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.810017', NULL, NULL),
(69, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.018017', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:14.978018', NULL, NULL),
(70, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.181017', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.108017', NULL, NULL),
(71, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.334020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.270018', NULL, NULL),
(72, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.413126', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.378067', NULL, NULL),
(73, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.558126', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.501128', NULL, NULL),
(74, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.676126', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.640129', NULL, NULL),
(75, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.834238', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.792210', NULL, NULL),
(76, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:15.943286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.905287', NULL, NULL),
(77, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.005321', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:15.966290', NULL, NULL),
(78, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.103809', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.060806', NULL, NULL),
(79, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.158810', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.122813', NULL, NULL),
(80, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.321807', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.272808', NULL, NULL),
(81, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.450808', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.400806', NULL, NULL),
(82, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.601334', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.558334', NULL, NULL),
(83, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.695859', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.653881', NULL, NULL),
(84, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.849862', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.788895', NULL, NULL),
(85, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:16.906911', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.870872', NULL, NULL),
(86, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.035913', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:16.990914', NULL, NULL),
(87, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.123914', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.091913', NULL, NULL),
(88, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.210908', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.180926', NULL, NULL),
(89, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.332957', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.294958', NULL, NULL),
(90, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.423957', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.388958', NULL, NULL),
(91, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.564957', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.522956', NULL, NULL),
(92, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.797987', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.691960', NULL, NULL),
(93, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:17.963981', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:17.913978', NULL, NULL),
(94, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.071347', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.041345', NULL, NULL),
(95, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.169939', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.131939', NULL, NULL),
(96, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.268942', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.236940', NULL, NULL),
(97, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.418464', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.369465', NULL, NULL),
(98, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.517475', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.487468', NULL, NULL),
(99, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.650465', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.616466', NULL, NULL),
(100, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.723469', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.682473', NULL, NULL),
(101, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.816467', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.783468', NULL, NULL),
(102, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:18.970060', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:18.914524', NULL, NULL),
(103, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.089056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.053060', NULL, NULL),
(104, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.160056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.126056', NULL, NULL),
(105, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.241057', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.194059', NULL, NULL),
(106, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.361057', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.326060', NULL, NULL),
(107, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.452056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.424057', NULL, NULL),
(108, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.562059', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.529064', NULL, NULL),
(109, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.647585', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.618579', NULL, NULL),
(110, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.705587', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.672580', NULL, NULL),
(111, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.774581', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.732586', NULL, NULL),
(112, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:19.948632', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:19.833581', NULL, NULL),
(113, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.093632', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.052635', NULL, NULL),
(114, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.152630', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.113631', NULL, NULL),
(115, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.218632', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.188630', NULL, NULL),
(116, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.290631', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.258630', NULL, NULL),
(117, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.351629', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.313632', NULL, NULL),
(118, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.531194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.441194', NULL, NULL),
(119, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.677196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.638195', NULL, NULL),
(120, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.816243', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.767195', NULL, NULL),
(121, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:20.890192', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:20.853199', NULL, NULL),
(122, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.067194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.031193', NULL, NULL),
(123, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.198194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.156198', NULL, NULL),
(124, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.295225', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.248200', NULL, NULL),
(125, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.413256', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.358250', NULL, NULL),
(126, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.476252', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.434251', NULL, NULL),
(127, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.555261', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.507259', NULL, NULL),
(128, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.607301', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.572264', NULL, NULL),
(129, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.762258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.719256', NULL, NULL),
(130, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.823258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.782253', NULL, NULL),
(131, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:21.947251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.909252', NULL, NULL),
(132, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.019250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:21.968253', NULL, NULL),
(133, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.072249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.043254', NULL, NULL),
(134, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.182249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.145249', NULL, NULL),
(135, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.287250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.249252', NULL, NULL),
(136, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.437286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.400258', NULL, NULL),
(137, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.489246', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.460252', NULL, NULL),
(138, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.601249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.564250', NULL, NULL),
(139, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.658258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.624249', NULL, NULL),
(140, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.762257', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.729250', NULL, NULL),
(141, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.849250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.815253', NULL, NULL),
(142, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:22.999253', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:22.950261', NULL, NULL),
(143, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.128250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.030253', NULL, NULL),
(144, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.191534', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.144539', NULL, NULL),
(145, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.250534', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.213534', NULL, NULL),
(146, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.360099', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.322057', NULL, NULL),
(147, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.466097', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.424059', NULL, NULL),
(148, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.581057', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.543089', NULL, NULL),
(149, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.655058', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.620057', NULL, NULL),
(150, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.763072', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.717057', NULL, NULL),
(151, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.822067', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.780058', NULL, NULL),
(152, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:23.926274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.880276', NULL, NULL),
(153, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.055306', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:23.994278', NULL, NULL),
(154, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.182274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.144276', NULL, NULL),
(155, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.303381', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.267276', NULL, NULL),
(156, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.384274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.354273', NULL, NULL),
(157, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.528295', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.488276', NULL, NULL),
(158, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.572275', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.544282', NULL, NULL),
(159, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.671277', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.631277', NULL, NULL),
(160, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.768274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.733274', NULL, NULL),
(161, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.866275', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.820275', NULL, NULL),
(162, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:24.945274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.911274', NULL, NULL),
(163, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.017273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:24.976280', NULL, NULL),
(164, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.159272', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.121274', NULL, NULL),
(165, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.305273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.273286', NULL, NULL),
(166, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.418272', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.377275', NULL, NULL),
(167, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.513274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.475275', NULL, NULL),
(168, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.661273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.602277', NULL, NULL),
(169, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.798273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.764274', NULL, NULL),
(170, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.873276', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.842276', NULL, NULL),
(171, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:25.997274', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:25.965278', NULL, NULL),
(172, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.067275', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.030275', NULL, NULL),
(173, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.220303', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.175278', NULL, NULL),
(174, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.378273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.333275', NULL, NULL),
(175, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.422280', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.391279', NULL, NULL),
(176, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.566279', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.531274', NULL, NULL),
(177, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.663273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.628273', NULL, NULL),
(178, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.717273', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.690276', NULL, NULL),
(179, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.851992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.784274', NULL, NULL),
(180, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:26.979994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:26.950002', NULL, NULL),
(181, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.045995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.011992', NULL, NULL),
(182, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.183993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.151000', NULL, NULL),
(183, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.333990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.294993', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(184, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.483992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.441002', NULL, NULL),
(185, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.598993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.556998', NULL, NULL),
(186, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.703993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.671999', NULL, NULL),
(187, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.763994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.723994', NULL, NULL),
(188, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.839997', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.795994', NULL, NULL),
(189, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:27.948993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.912993', NULL, NULL),
(190, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.032992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:27.998025', NULL, NULL),
(191, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.079991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.052992', NULL, NULL),
(192, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.212990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.183994', NULL, NULL),
(193, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.318992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.281993', NULL, NULL),
(194, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.404994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.375992', NULL, NULL),
(195, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.541990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.510992', NULL, NULL),
(196, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.593994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.563993', NULL, NULL),
(197, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.678991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.644994', NULL, NULL),
(198, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.812995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.774993', NULL, NULL),
(199, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:28.957991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.924996', NULL, NULL),
(200, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.025992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:28.996992', NULL, NULL),
(201, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.066993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.038993', NULL, NULL),
(202, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.205994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.146998', NULL, NULL),
(203, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.383012', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.327994', NULL, NULL),
(204, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.504993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.472994', NULL, NULL),
(205, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.640994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.606999', NULL, NULL),
(206, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.688991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.655995', NULL, NULL),
(207, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.747996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.719993', NULL, NULL),
(208, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.814992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.779996', NULL, NULL),
(209, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.865994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.837993', NULL, NULL),
(210, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:29.955993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:29.918996', NULL, NULL),
(211, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.053993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.022992', NULL, NULL),
(212, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.169006', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.139994', NULL, NULL),
(213, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.306993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.275993', NULL, NULL),
(214, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.356994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.325993', NULL, NULL),
(215, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.433993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.403993', NULL, NULL),
(216, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.562992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.530038', NULL, NULL),
(217, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.691994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.652996', NULL, NULL),
(218, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.738992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.708995', NULL, NULL),
(219, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.842993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.800998', NULL, NULL),
(220, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:30.941990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:30.902997', NULL, NULL),
(221, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.124991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.074998', NULL, NULL),
(222, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.225990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.178993', NULL, NULL),
(223, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.354992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.308994', NULL, NULL),
(224, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.413995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.380993', NULL, NULL),
(225, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.517997', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.485995', NULL, NULL),
(226, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.584993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.554993', NULL, NULL),
(227, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.727993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.694992', NULL, NULL),
(228, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.852996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.817993', NULL, NULL),
(229, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:31.903992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:31.867994', NULL, NULL),
(230, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.054993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.010994', NULL, NULL),
(231, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.161996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.128997', NULL, NULL),
(232, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.245993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.203993', NULL, NULL),
(233, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.367995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.329994', NULL, NULL),
(234, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.466993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.430994', NULL, NULL),
(235, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.522991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.484994', NULL, NULL),
(236, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.579992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.550994', NULL, NULL),
(237, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.685994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.654992', NULL, NULL),
(238, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.803990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.774993', NULL, NULL),
(239, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:32.941993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:32.908992', NULL, NULL),
(240, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.043997', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.007992', NULL, NULL),
(241, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.138990', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.108992', NULL, NULL),
(242, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.306996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.246991', NULL, NULL),
(243, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.618994', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.433995', NULL, NULL),
(244, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.746992', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.715996', NULL, NULL),
(245, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.863064', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.828055', NULL, NULL),
(246, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:33.942053', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.903054', NULL, NULL),
(247, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.025055', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:33.990112', NULL, NULL),
(248, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.140054', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.109052', NULL, NULL),
(249, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.256054', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.227053', NULL, NULL),
(250, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.370055', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.325083', NULL, NULL),
(251, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.454052', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.424058', NULL, NULL),
(252, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.555060', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.521055', NULL, NULL),
(253, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.692071', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.653055', NULL, NULL),
(254, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.828054', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.791055', NULL, NULL),
(255, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:34.931056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.898061', NULL, NULL),
(256, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.038056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:34.999059', NULL, NULL),
(257, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.160054', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.131056', NULL, NULL),
(258, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.273053', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.229057', NULL, NULL),
(259, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.413579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.376054', NULL, NULL),
(260, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.580580', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.521582', NULL, NULL),
(261, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.700579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.657577', NULL, NULL),
(262, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.760579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.721579', NULL, NULL),
(263, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:35.860579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.817579', NULL, NULL),
(264, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.013587', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:35.974578', NULL, NULL),
(265, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.066579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.035579', NULL, NULL),
(266, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.207577', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.173582', NULL, NULL),
(267, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.301577', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.267578', NULL, NULL),
(268, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.372577', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.335579', NULL, NULL),
(269, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.474588', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.440579', NULL, NULL),
(270, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.599579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.564587', NULL, NULL),
(271, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.662579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.631583', NULL, NULL),
(272, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.724581', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.688582', NULL, NULL),
(273, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:36.883579', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.832579', NULL, NULL),
(274, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.024200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:36.980579', NULL, NULL),
(275, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.137198', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.100201', NULL, NULL),
(276, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.279200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.242205', NULL, NULL),
(277, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.347201', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.302209', NULL, NULL),
(278, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.421199', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.359211', NULL, NULL),
(279, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.478204', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.448202', NULL, NULL),
(280, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.527200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.492204', NULL, NULL),
(281, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.655200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.622201', NULL, NULL),
(282, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.736208', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.708200', NULL, NULL),
(283, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:37.968200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.815203', NULL, NULL),
(284, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.021202', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:37.996203', NULL, NULL),
(285, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.133201', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.104205', NULL, NULL),
(286, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.196203', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.165202', NULL, NULL),
(287, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.261203', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.225201', NULL, NULL),
(288, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.329214', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.297201', NULL, NULL),
(289, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.465199', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.436204', NULL, NULL),
(290, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.568199', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.529204', NULL, NULL),
(291, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.654203', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.620201', NULL, NULL),
(292, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.800201', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.763203', NULL, NULL),
(293, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:38.885202', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.849204', NULL, NULL),
(294, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.000200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:38.962206', NULL, NULL),
(295, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.056200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.026199', NULL, NULL),
(296, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.220201', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.172207', NULL, NULL),
(297, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.260247', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.233252', NULL, NULL),
(298, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.357248', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.315249', NULL, NULL),
(299, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.484289', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.448258', NULL, NULL),
(300, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.618768', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.587771', NULL, NULL),
(301, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.691767', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.640770', NULL, NULL),
(302, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.750768', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.717769', NULL, NULL),
(303, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.887770', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.852769', NULL, NULL),
(304, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:39.973768', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:39.945768', NULL, NULL),
(305, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.047768', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.014814', NULL, NULL),
(306, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.142768', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.101769', NULL, NULL),
(307, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.283817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.248826', NULL, NULL),
(308, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.418818', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.379821', NULL, NULL),
(309, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.569346', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.529819', NULL, NULL),
(310, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.625351', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.593351', NULL, NULL),
(311, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.686348', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.648351', NULL, NULL),
(312, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.842349', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.801352', NULL, NULL),
(313, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:40.985347', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:40.939349', NULL, NULL),
(314, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.086885', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.045354', NULL, NULL),
(315, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.208886', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.178884', NULL, NULL),
(316, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.266885', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.233884', NULL, NULL),
(317, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.398882', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.368885', NULL, NULL),
(318, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.534885', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.499884', NULL, NULL),
(319, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.653882', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.613887', NULL, NULL),
(320, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.802882', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.768909', NULL, NULL),
(321, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:41.951883', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:41.902886', NULL, NULL),
(322, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.135946', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.085947', NULL, NULL),
(323, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.220948', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.188949', NULL, NULL),
(324, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.359954', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.326949', NULL, NULL),
(325, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.460950', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.425949', NULL, NULL),
(326, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.598972', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.560949', NULL, NULL),
(327, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.688948', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.657950', NULL, NULL),
(328, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.763947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.720947', NULL, NULL),
(329, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.826946', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.779947', NULL, NULL),
(330, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:42.993949', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:42.935957', NULL, NULL),
(331, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.106523', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.062951', NULL, NULL),
(332, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.177523', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.133526', NULL, NULL),
(333, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.363525', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.264525', NULL, NULL),
(334, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.482525', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.428528', NULL, NULL),
(335, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.616526', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.533523', NULL, NULL),
(336, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.803556', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.736527', NULL, NULL),
(337, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.890668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.842654', NULL, NULL),
(338, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:43.956190', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:43.908179', NULL, NULL),
(339, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.101183', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.066178', NULL, NULL),
(340, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.185176', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.154176', NULL, NULL),
(341, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.299177', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.268179', NULL, NULL),
(342, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.397176', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.362185', NULL, NULL),
(343, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.543177', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.500181', NULL, NULL),
(344, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.650706', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.569177', NULL, NULL),
(345, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.769711', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.736708', NULL, NULL),
(346, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.860705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.808708', NULL, NULL),
(347, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:44.974705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:44.941706', NULL, NULL),
(348, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.057708', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.024707', NULL, NULL),
(349, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.150706', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.114705', NULL, NULL),
(350, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.280707', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.243715', NULL, NULL),
(351, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.395705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.351707', NULL, NULL),
(352, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.502705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.462708', NULL, NULL),
(353, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.581720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.548707', NULL, NULL),
(354, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.714708', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.679711', NULL, NULL),
(355, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.853722', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.818706', NULL, NULL),
(356, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.898709', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.864711', NULL, NULL),
(357, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:45.961705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.923709', NULL, NULL),
(358, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.014710', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:45.981706', NULL, NULL),
(359, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.062706', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.030704', NULL, NULL),
(360, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.211706', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.159719', NULL, NULL),
(361, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.377708', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.302706', NULL, NULL),
(362, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.567712', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.482715', NULL, NULL),
(363, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.749710', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.681708', NULL, NULL),
(364, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:46.879709', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.813711', NULL, NULL),
(365, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.024709', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:46.979709', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(366, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.132709', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.095706', NULL, NULL),
(367, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.328993', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.257735', NULL, NULL),
(368, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.464995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.425998', NULL, NULL),
(369, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.613991', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.576992', NULL, NULL),
(370, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.771003', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.696994', NULL, NULL),
(371, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:47.938012', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:47.851002', NULL, NULL),
(372, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.087025', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.046996', NULL, NULL),
(373, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.195243', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.133581', NULL, NULL),
(374, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.303055', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.239055', NULL, NULL),
(375, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.461267', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.398586', NULL, NULL),
(376, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.536269', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.501268', NULL, NULL),
(377, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.694268', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.642269', NULL, NULL),
(378, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.845301', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.812268', NULL, NULL),
(379, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:48.911267', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.882269', NULL, NULL),
(380, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.029268', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:48.992268', NULL, NULL),
(381, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.089266', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.057267', NULL, NULL),
(382, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.169796', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.123818', NULL, NULL),
(383, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.327325', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.279329', NULL, NULL),
(384, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.438326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.402329', NULL, NULL),
(385, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.570326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.538326', NULL, NULL),
(386, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.665324', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.625336', NULL, NULL),
(387, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.804324', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.767325', NULL, NULL),
(388, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.928326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.891329', NULL, NULL),
(389, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:49.995326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:49.955328', NULL, NULL),
(390, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.118339', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.051326', NULL, NULL),
(391, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.257542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.192542', NULL, NULL),
(392, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.376543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.310543', NULL, NULL),
(393, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.523541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.492541', NULL, NULL),
(394, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.634544', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.602542', NULL, NULL),
(395, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.763540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.712540', NULL, NULL),
(396, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.816541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.788545', NULL, NULL),
(397, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.891560', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.856544', NULL, NULL),
(398, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:50.968551', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:50.938541', NULL, NULL),
(399, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.080543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.049541', NULL, NULL),
(400, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.155543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.121542', NULL, NULL),
(401, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.241540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.207541', NULL, NULL),
(402, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.371541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.337541', NULL, NULL),
(403, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.414541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.384544', NULL, NULL),
(404, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.489541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.452543', NULL, NULL),
(405, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.560539', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.529541', NULL, NULL),
(406, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.645543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.606553', NULL, NULL),
(407, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.791544', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.735546', NULL, NULL),
(408, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.888543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.846542', NULL, NULL),
(409, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:51.961546', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:51.913542', NULL, NULL),
(410, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.112540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.075543', NULL, NULL),
(411, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.174540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.138541', NULL, NULL),
(412, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.284541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.246542', NULL, NULL),
(413, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.401545', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.366543', NULL, NULL),
(414, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.492539', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.459544', NULL, NULL),
(415, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.604542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.573542', NULL, NULL),
(416, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.729541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.701540', NULL, NULL),
(417, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:52.858540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.827542', NULL, NULL),
(418, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.001543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:52.969542', NULL, NULL),
(419, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.095542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.049543', NULL, NULL),
(420, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.210541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.174556', NULL, NULL),
(421, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.323542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.293542', NULL, NULL),
(422, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.395544', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.362544', NULL, NULL),
(423, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.453543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.424541', NULL, NULL),
(424, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.520554', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.483543', NULL, NULL),
(425, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.651566', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.616544', NULL, NULL),
(426, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.793540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.747541', NULL, NULL),
(427, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.874541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.842540', NULL, NULL),
(428, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:53.983542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:53.951541', NULL, NULL),
(429, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.105540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.074541', NULL, NULL),
(430, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.173542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.138541', NULL, NULL),
(431, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.305540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.271543', NULL, NULL),
(432, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.374540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.337541', NULL, NULL),
(433, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.422540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.389543', NULL, NULL),
(434, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.543540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.510542', NULL, NULL),
(435, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.599542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.568543', NULL, NULL),
(436, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.673541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.635542', NULL, NULL),
(437, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.723541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.694539', NULL, NULL),
(438, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.808540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.769544', NULL, NULL),
(439, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:54.923585', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:54.883543', NULL, NULL),
(440, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.075540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.034543', NULL, NULL),
(441, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.153547', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.118540', NULL, NULL),
(442, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.256132', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.203546', NULL, NULL),
(443, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.387657', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.345655', NULL, NULL),
(444, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.441660', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.406655', NULL, NULL),
(445, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.566655', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.532671', NULL, NULL),
(446, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.655654', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.612657', NULL, NULL),
(447, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.708656', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.676657', NULL, NULL),
(448, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.791703', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.750668', NULL, NULL),
(449, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.904695', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.870725', NULL, NULL),
(450, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:55.952655', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:55.922656', NULL, NULL),
(451, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.095659', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.058658', NULL, NULL),
(452, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.184668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.151661', NULL, NULL),
(453, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.306691', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.267658', NULL, NULL),
(454, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.407660', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.367659', NULL, NULL),
(455, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.488256', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.438260', NULL, NULL),
(456, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.615255', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.584259', NULL, NULL),
(457, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.718259', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.684258', NULL, NULL),
(458, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.864290', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.820256', NULL, NULL),
(459, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:56.936257', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:56.886257', NULL, NULL),
(460, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.107258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.054259', NULL, NULL),
(461, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.233258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.167261', NULL, NULL),
(462, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.391255', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.340258', NULL, NULL),
(463, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.524702', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.472581', NULL, NULL),
(464, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.654367', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.589701', NULL, NULL),
(465, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.774201', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.735657', NULL, NULL),
(466, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.920210', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.853202', NULL, NULL),
(467, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:57.996202', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:57.938200', NULL, NULL),
(468, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.051200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.014202', NULL, NULL),
(469, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.291200', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.125206', NULL, NULL),
(470, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.433583', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.375546', NULL, NULL),
(471, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.570666', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.518213', NULL, NULL),
(472, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.735666', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.685670', NULL, NULL),
(473, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.907668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.856668', NULL, NULL),
(474, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:58.997670', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:58.960669', NULL, NULL),
(475, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.092671', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.029671', NULL, NULL),
(476, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.162666', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.123668', NULL, NULL),
(477, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.313665', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.249668', NULL, NULL),
(478, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.528669', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.410671', NULL, NULL),
(479, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.637667', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.601668', NULL, NULL),
(480, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.768099', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.730093', NULL, NULL),
(481, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.856090', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.823091', NULL, NULL),
(482, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:35:59.984089', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:35:59.952092', NULL, NULL),
(483, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.120669', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.086672', NULL, NULL),
(484, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.217665', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.182667', NULL, NULL),
(485, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.338666', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.303667', NULL, NULL),
(486, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.408668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.381669', NULL, NULL),
(487, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.489674', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.461667', NULL, NULL),
(488, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.629666', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.599668', NULL, NULL),
(489, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.708668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.680668', NULL, NULL),
(490, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.794672', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.764669', NULL, NULL),
(491, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:00.924669', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.895668', NULL, NULL),
(492, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.044191', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:00.992674', NULL, NULL),
(493, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.147193', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.113195', NULL, NULL),
(494, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.208193', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.173192', NULL, NULL),
(495, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.309193', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.271194', NULL, NULL),
(496, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.458190', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.413190', NULL, NULL),
(497, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.526195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.482191', NULL, NULL),
(498, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.607190', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.570194', NULL, NULL),
(499, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.720189', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.670194', NULL, NULL),
(500, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.843191', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.809197', NULL, NULL),
(501, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:01.928188', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:01.887191', NULL, NULL),
(502, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.051191', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.011192', NULL, NULL),
(503, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.199188', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.162196', NULL, NULL),
(504, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.277207', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.231191', NULL, NULL),
(505, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.421190', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.366194', NULL, NULL),
(506, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.557207', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.518190', NULL, NULL),
(507, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.622190', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.577204', NULL, NULL),
(508, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.762194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.712211', NULL, NULL),
(509, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:02.881718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.829724', NULL, NULL),
(510, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.015720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:02.980719', NULL, NULL),
(511, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.141717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.099720', NULL, NULL),
(512, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.283717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.245718', NULL, NULL),
(513, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.435718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.394724', NULL, NULL),
(514, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.498719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.466717', NULL, NULL),
(515, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.561730', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.524723', NULL, NULL),
(516, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.620716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.592718', NULL, NULL),
(517, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.752717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.723727', NULL, NULL),
(518, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:03.881715', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.846717', NULL, NULL),
(519, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.013716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:03.975719', NULL, NULL),
(520, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.116721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.080722', NULL, NULL),
(521, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.251719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.211721', NULL, NULL),
(522, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.423734', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.366719', NULL, NULL),
(523, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.569718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.527720', NULL, NULL),
(524, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.676718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.633720', NULL, NULL),
(525, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.807719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.763723', NULL, NULL),
(526, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:04.978719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:04.885720', NULL, NULL),
(527, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.046719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.016721', NULL, NULL),
(528, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.206720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.154719', NULL, NULL),
(529, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.282718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.242720', NULL, NULL),
(530, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.397717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.359722', NULL, NULL),
(531, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.506722', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.471728', NULL, NULL),
(532, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.560721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.521722', NULL, NULL),
(533, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.657730', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.622722', NULL, NULL),
(534, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.797721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.762719', NULL, NULL),
(535, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.861762', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.822723', NULL, NULL),
(536, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:05.956719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.917717', NULL, NULL),
(537, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.033716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:05.994720', NULL, NULL),
(538, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.102717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.069718', NULL, NULL),
(539, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.255717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.216719', NULL, NULL),
(540, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.397724', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.364719', NULL, NULL),
(541, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.514719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.467721', NULL, NULL),
(542, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.604721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.572719', NULL, NULL),
(543, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.665716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.628719', NULL, NULL),
(544, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.749717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.707721', NULL, NULL),
(545, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.845299', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.812298', NULL, NULL),
(546, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:06.975307', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:06.940299', NULL, NULL),
(547, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.118300', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.084300', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(548, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.192298', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.155300', NULL, NULL),
(549, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.287824', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.257823', NULL, NULL),
(550, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.396823', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.364827', NULL, NULL),
(551, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.495821', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.450826', NULL, NULL),
(552, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.618824', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.581835', NULL, NULL),
(553, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.705823', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.672822', NULL, NULL),
(554, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:07.914379', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.812379', NULL, NULL),
(555, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.097382', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:07.993389', NULL, NULL),
(556, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.157386', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.121396', NULL, NULL),
(557, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.207795', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.170801', NULL, NULL),
(558, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.328791', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.287790', NULL, NULL),
(559, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.448784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.406787', NULL, NULL),
(560, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.539786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.496788', NULL, NULL),
(561, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.630787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.592789', NULL, NULL),
(562, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.672786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.645786', NULL, NULL),
(563, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.817786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.786786', NULL, NULL),
(564, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.868791', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.839789', NULL, NULL),
(565, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:08.964786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:08.931787', NULL, NULL),
(566, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.094787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.060789', NULL, NULL),
(567, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.183786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.148789', NULL, NULL),
(568, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.239784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.200787', NULL, NULL),
(569, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.347784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.296789', NULL, NULL),
(570, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.500786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.454787', NULL, NULL),
(571, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.641791', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.610789', NULL, NULL),
(572, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.734787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.701789', NULL, NULL),
(573, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:09.869790', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.830785', NULL, NULL),
(574, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.014784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:09.981786', NULL, NULL),
(575, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.066786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.032792', NULL, NULL),
(576, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.177795', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.143787', NULL, NULL),
(577, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.293794', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.254786', NULL, NULL),
(578, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.402784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.367787', NULL, NULL),
(579, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.513785', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.449788', NULL, NULL),
(580, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.612784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.546787', NULL, NULL),
(581, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.794787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.726787', NULL, NULL),
(582, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:10.976821', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:10.913786', NULL, NULL),
(583, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.054787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.006787', NULL, NULL),
(584, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.199790', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.149788', NULL, NULL),
(585, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.268311', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.221311', NULL, NULL),
(586, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.344831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.305827', NULL, NULL),
(587, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.563831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.459831', NULL, NULL),
(588, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.630831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.585855', NULL, NULL),
(589, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.821410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.699829', NULL, NULL),
(590, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:11.921984', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.852364', NULL, NULL),
(591, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.025952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:11.983971', NULL, NULL),
(592, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.161954', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.093957', NULL, NULL),
(593, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.316629', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.241581', NULL, NULL),
(594, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.461577', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.389581', NULL, NULL),
(595, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.540578', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.493580', NULL, NULL),
(596, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.669578', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.633581', NULL, NULL),
(597, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.798207', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.755200', NULL, NULL),
(598, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:12.957721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:12.887721', NULL, NULL),
(599, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.070718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.025723', NULL, NULL),
(600, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.133720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.087721', NULL, NULL),
(601, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.238721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.195721', NULL, NULL),
(602, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.392783', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.326781', NULL, NULL),
(603, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.469786', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.431784', NULL, NULL),
(604, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.556314', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.524308', NULL, NULL),
(605, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.733310', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.668312', NULL, NULL),
(606, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.802310', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.761319', NULL, NULL),
(607, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:13.944309', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.903310', NULL, NULL),
(608, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.011311', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:13.971308', NULL, NULL),
(609, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.094308', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.060312', NULL, NULL),
(610, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.149306', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.116308', NULL, NULL),
(611, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.244307', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.205310', NULL, NULL),
(612, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.301311', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.263310', NULL, NULL),
(613, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.396308', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.364309', NULL, NULL),
(614, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.493308', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.452306', NULL, NULL),
(615, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.659880', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.599309', NULL, NULL),
(616, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.792249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.736182', NULL, NULL),
(617, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.870506', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.825370', NULL, NULL),
(618, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:14.975507', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.931575', NULL, NULL),
(619, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.044033', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:14.994031', NULL, NULL),
(620, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.223030', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.161029', NULL, NULL),
(621, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.393032', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.327028', NULL, NULL),
(622, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.533026', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.490030', NULL, NULL),
(623, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.605030', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.576028', NULL, NULL),
(624, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.738027', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.656048', NULL, NULL),
(625, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:15.918250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:15.824253', NULL, NULL),
(626, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:16.160251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:16.003253', NULL, NULL),
(627, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:16.370027', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:16.298958', NULL, NULL),
(628, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:16.537468', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:16.483739', NULL, NULL),
(629, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:16.670468', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:16.635472', NULL, NULL),
(630, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.008469', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:16.752468', NULL, NULL),
(631, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.240510', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.119927', NULL, NULL),
(632, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.404358', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.339690', NULL, NULL),
(633, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.537407', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.458409', NULL, NULL),
(634, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.657411', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.586414', NULL, NULL),
(635, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.791410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.746411', NULL, NULL),
(636, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.895413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.863413', NULL, NULL),
(637, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:17.980409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.947409', NULL, NULL),
(638, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.030410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:17.999410', NULL, NULL),
(639, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.128410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.097415', NULL, NULL),
(640, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.170408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.140413', NULL, NULL),
(641, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.278410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.240411', NULL, NULL),
(642, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.391412', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.356414', NULL, NULL),
(643, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.545444', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.490412', NULL, NULL),
(644, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.624408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.596410', NULL, NULL),
(645, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.663409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.637411', NULL, NULL),
(646, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.722408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.690407', NULL, NULL),
(647, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.781410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.752411', NULL, NULL),
(648, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.888411', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.853409', NULL, NULL),
(649, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:18.968416', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:18.929408', NULL, NULL),
(650, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.053412', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.002413', NULL, NULL),
(651, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.109410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.080411', NULL, NULL),
(652, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.222410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.190414', NULL, NULL),
(653, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.314410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.280408', NULL, NULL),
(654, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.375413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.341411', NULL, NULL),
(655, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.483408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.432409', NULL, NULL),
(656, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.597408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.545414', NULL, NULL),
(657, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.668415', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.637422', NULL, NULL),
(658, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.734409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.703411', NULL, NULL),
(659, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.845458', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.801411', NULL, NULL),
(660, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.919409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.892414', NULL, NULL),
(661, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:19.993456', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:19.950454', NULL, NULL),
(662, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.040451', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.012453', NULL, NULL),
(663, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.150484', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.111451', NULL, NULL),
(664, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.257451', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.223452', NULL, NULL),
(665, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.381453', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.348453', NULL, NULL),
(666, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.499449', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.462458', NULL, NULL),
(667, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.627450', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.592453', NULL, NULL),
(668, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.672451', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.643453', NULL, NULL),
(669, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.742456', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.703455', NULL, NULL),
(670, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:20.859476', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:20.804455', NULL, NULL),
(671, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.090452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.011451', NULL, NULL),
(672, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.226452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.195452', NULL, NULL),
(673, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.352452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.319453', NULL, NULL),
(674, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.468457', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.430453', NULL, NULL),
(675, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.586453', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.543454', NULL, NULL),
(676, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.668452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.631452', NULL, NULL),
(677, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.778457', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.737453', NULL, NULL),
(678, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.900454', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.861456', NULL, NULL),
(679, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:21.961459', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:21.932451', NULL, NULL),
(680, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.104452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.054457', NULL, NULL),
(681, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.246453', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.195510', NULL, NULL),
(682, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.400452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.363454', NULL, NULL),
(683, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.477455', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.441461', NULL, NULL),
(684, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.552453', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.508457', NULL, NULL),
(685, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.842571', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.678453', NULL, NULL),
(686, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:22.978174', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:22.904633', NULL, NULL),
(687, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.114173', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.074188', NULL, NULL),
(688, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.183169', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.153170', NULL, NULL),
(689, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.321169', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.291172', NULL, NULL),
(690, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.452170', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.407171', NULL, NULL),
(691, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.534232', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.492175', NULL, NULL),
(692, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.582232', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.551235', NULL, NULL),
(693, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.682231', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.645235', NULL, NULL),
(694, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.832231', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.794235', NULL, NULL),
(695, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:23.922236', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.881236', NULL, NULL),
(696, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.029242', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:23.963251', NULL, NULL),
(697, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.133234', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.092235', NULL, NULL),
(698, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.271232', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.229235', NULL, NULL),
(699, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.315282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.284286', NULL, NULL),
(700, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.479281', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.431288', NULL, NULL),
(701, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.579282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.543283', NULL, NULL),
(702, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.722284', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.693327', NULL, NULL),
(703, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.837285', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.799290', NULL, NULL),
(704, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:24.981282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:24.942284', NULL, NULL),
(705, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.105289', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.070282', NULL, NULL),
(706, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.248284', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.209283', NULL, NULL),
(707, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.324282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.294282', NULL, NULL),
(708, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.416282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.376285', NULL, NULL),
(709, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.519280', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.488282', NULL, NULL),
(710, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.603283', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.564284', NULL, NULL),
(711, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.647281', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.621282', NULL, NULL),
(712, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.735283', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.701286', NULL, NULL),
(713, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.800290', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.766282', NULL, NULL),
(714, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:25.942285', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:25.906284', NULL, NULL),
(715, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.044289', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.007282', NULL, NULL),
(716, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.134282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.100281', NULL, NULL),
(717, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.207282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.174284', NULL, NULL),
(718, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.345281', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.306282', NULL, NULL),
(719, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.430282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.391281', NULL, NULL),
(720, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.513286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.481283', NULL, NULL),
(721, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.607283', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.577283', NULL, NULL),
(722, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.746282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.706283', NULL, NULL),
(723, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.833287', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.799285', NULL, NULL),
(724, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:26.902283', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:26.871282', NULL, NULL),
(725, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.047283', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.013284', NULL, NULL),
(726, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.127286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.095284', NULL, NULL),
(727, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.242806', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.191808', NULL, NULL),
(728, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.312806', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.279819', NULL, NULL),
(729, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.410806', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.372808', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(730, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.494809', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.454807', NULL, NULL),
(731, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.640854', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.594809', NULL, NULL),
(732, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.765808', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.722812', NULL, NULL),
(733, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.909805', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.873806', NULL, NULL),
(734, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:27.976806', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:27.945808', NULL, NULL),
(735, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.108805', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.075813', NULL, NULL),
(736, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.208805', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.176809', NULL, NULL),
(737, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.334808', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.292816', NULL, NULL),
(738, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.496824', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.420808', NULL, NULL),
(739, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.681129', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.604807', NULL, NULL),
(740, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.788131', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.714133', NULL, NULL),
(741, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:28.947129', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:28.877146', NULL, NULL),
(742, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.127271', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.032221', NULL, NULL),
(743, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.279935', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.145936', NULL, NULL),
(744, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.438941', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.357939', NULL, NULL),
(745, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.516939', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.462937', NULL, NULL),
(746, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.740221', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.629936', NULL, NULL),
(747, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.843732', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.798733', NULL, NULL),
(748, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:29.916733', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:29.864731', NULL, NULL),
(749, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.070775', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.007731', NULL, NULL),
(750, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.229377', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.179388', NULL, NULL),
(751, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.344961', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.287374', NULL, NULL),
(752, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.627089', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.406081', NULL, NULL),
(753, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.752754', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.682079', NULL, NULL),
(754, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:30.888284', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.853283', NULL, NULL),
(755, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:31.052294', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:30.975286', NULL, NULL),
(756, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:31.277288', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:31.201298', NULL, NULL),
(757, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:31.342286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:31.305284', NULL, NULL),
(758, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:31.560070', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:31.463283', NULL, NULL),
(759, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:31.894611', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:31.616648', NULL, NULL),
(760, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:32.092129', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:31.957004', NULL, NULL),
(761, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:32.726194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:32.188191', NULL, NULL),
(762, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:32.842196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:32.789196', NULL, NULL),
(763, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:32.969196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:32.919199', NULL, NULL),
(764, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.162199', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.037198', NULL, NULL),
(765, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.319194', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.257198', NULL, NULL),
(766, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.396195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.355197', NULL, NULL),
(767, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.506193', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.463195', NULL, NULL),
(768, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.642195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.588196', NULL, NULL),
(769, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.757196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.705195', NULL, NULL),
(770, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:33.893195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.845193', NULL, NULL),
(771, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.023206', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:33.994195', NULL, NULL),
(772, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.137199', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.071196', NULL, NULL),
(773, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.209192', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.173195', NULL, NULL),
(774, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.272195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.233196', NULL, NULL),
(775, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.407197', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.353208', NULL, NULL),
(776, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.496195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.456199', NULL, NULL),
(777, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.660196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.599201', NULL, NULL),
(778, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.836193', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.767199', NULL, NULL),
(779, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:34.926195', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:34.886195', NULL, NULL),
(780, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.073818', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.034817', NULL, NULL),
(781, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.188817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.135820', NULL, NULL),
(782, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.302818', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.268818', NULL, NULL),
(783, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.352819', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.320819', NULL, NULL),
(784, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.475818', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.441817', NULL, NULL),
(785, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.570817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.524822', NULL, NULL),
(786, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.700817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.661819', NULL, NULL),
(787, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.845817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.802824', NULL, NULL),
(788, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:35.969863', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:35.931821', NULL, NULL),
(789, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.137824', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.074821', NULL, NULL),
(790, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.291346', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.251345', NULL, NULL),
(791, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.344477', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.307480', NULL, NULL),
(792, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.446474', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.408476', NULL, NULL),
(793, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.549477', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.515474', NULL, NULL),
(794, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.639484', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.604474', NULL, NULL),
(795, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.773474', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.739474', NULL, NULL),
(796, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.886475', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.845497', NULL, NULL),
(797, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:36.958472', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.924474', NULL, NULL),
(798, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.007473', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:36.974474', NULL, NULL),
(799, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.130476', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.084478', NULL, NULL),
(800, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.193477', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.153475', NULL, NULL),
(801, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.311475', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.273477', NULL, NULL),
(802, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.411478', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.379482', NULL, NULL),
(803, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.574473', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.531475', NULL, NULL),
(804, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.631478', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.596479', NULL, NULL),
(805, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.712998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.680487', NULL, NULL),
(806, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.850999', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.806001', NULL, NULL),
(807, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:37.905000', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:37.871997', NULL, NULL),
(808, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.062999', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.018003', NULL, NULL),
(809, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.128998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.094002', NULL, NULL),
(810, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.234997', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.193998', NULL, NULL),
(811, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.345001', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.281997', NULL, NULL),
(812, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.422999', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.381997', NULL, NULL),
(813, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.531000', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.495002', NULL, NULL),
(814, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.674998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.641009', NULL, NULL),
(815, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.766998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.727998', NULL, NULL),
(816, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:38.907023', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.867998', NULL, NULL),
(817, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.005998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:38.971000', NULL, NULL),
(818, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.139996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.113002', NULL, NULL),
(819, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.255996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.226002', NULL, NULL),
(820, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.331995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.297998', NULL, NULL),
(821, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.433995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.400997', NULL, NULL),
(822, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.540999', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.502999', NULL, NULL),
(823, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.670996', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.627002', NULL, NULL),
(824, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.792998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.746998', NULL, NULL),
(825, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.923998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.885998', NULL, NULL),
(826, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:39.992999', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:39.964000', NULL, NULL),
(827, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.136995', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.102001', NULL, NULL),
(828, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.294015', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.263004', NULL, NULL),
(829, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.558998', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.400999', NULL, NULL),
(830, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.623520', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.586523', NULL, NULL),
(831, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.736524', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.689529', NULL, NULL),
(832, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.854044', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.818044', NULL, NULL),
(833, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:40.985042', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:40.949044', NULL, NULL),
(834, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.058045', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.027044', NULL, NULL),
(835, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.150043', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.114043', NULL, NULL),
(836, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.285052', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.246043', NULL, NULL),
(837, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.387054', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.352046', NULL, NULL),
(838, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.479044', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.443043', NULL, NULL),
(839, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.573091', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.511043', NULL, NULL),
(840, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.659043', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.628044', NULL, NULL),
(841, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.735042', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.681047', NULL, NULL),
(842, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.804562', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.776562', NULL, NULL),
(843, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.898562', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.848569', NULL, NULL),
(844, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:41.947563', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:41.914564', NULL, NULL),
(845, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.100566', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.059566', NULL, NULL),
(846, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.228092', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.197099', NULL, NULL),
(847, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.336086', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.294090', NULL, NULL),
(848, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.389095', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.352088', NULL, NULL),
(849, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.489096', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.443087', NULL, NULL),
(850, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.690143', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.586090', NULL, NULL),
(851, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.824966', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.767313', NULL, NULL),
(852, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:42.958176', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:42.890725', NULL, NULL),
(853, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.083453', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.028956', NULL, NULL),
(854, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.252815', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.166114', NULL, NULL),
(855, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.468346', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.383029', NULL, NULL),
(856, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.583282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.529282', NULL, NULL),
(857, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.677280', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.632284', NULL, NULL),
(858, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.799279', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.744281', NULL, NULL),
(859, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:43.982289', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:43.918281', NULL, NULL),
(860, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.127289', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.045283', NULL, NULL),
(861, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.219281', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.172321', NULL, NULL),
(862, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.317279', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.278278', NULL, NULL),
(863, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.458817', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.396281', NULL, NULL),
(864, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.578415', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.531416', NULL, NULL),
(865, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.697416', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.662428', NULL, NULL),
(866, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.772457', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.726415', NULL, NULL),
(867, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:44.900414', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.833420', NULL, NULL),
(868, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.040447', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:44.994421', NULL, NULL),
(869, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.091953', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.053951', NULL, NULL),
(870, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.242951', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.207950', NULL, NULL),
(871, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.337952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.307954', NULL, NULL),
(872, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.438952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.389950', NULL, NULL),
(873, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.565947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.463983', NULL, NULL),
(874, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.702949', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.640948', NULL, NULL),
(875, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:45.863949', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.765949', NULL, NULL),
(876, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.123967', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:45.985992', NULL, NULL),
(877, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.266947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.182948', NULL, NULL),
(878, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.400952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.320981', NULL, NULL),
(879, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.690948', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.475976', NULL, NULL),
(880, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.759949', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.721950', NULL, NULL),
(881, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:46.879476', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.796960', NULL, NULL),
(882, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.041352', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:46.954351', NULL, NULL),
(883, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.258550', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.149411', NULL, NULL),
(884, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.357785', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.293749', NULL, NULL),
(885, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.449285', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.398287', NULL, NULL),
(886, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.578581', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.530423', NULL, NULL),
(887, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.749584', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.696580', NULL, NULL),
(888, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.846604', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.782580', NULL, NULL),
(889, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:47.927580', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.875584', NULL, NULL),
(890, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.015105', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:47.981102', NULL, NULL),
(891, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.115298', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.078728', NULL, NULL),
(892, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.198300', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.166304', NULL, NULL),
(893, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.294300', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.261304', NULL, NULL),
(894, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.422828', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.385831', NULL, NULL),
(895, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.524830', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.490833', NULL, NULL),
(896, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.588831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.539830', NULL, NULL),
(897, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.646829', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.613830', NULL, NULL),
(898, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.766828', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.734837', NULL, NULL),
(899, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.866358', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.826829', NULL, NULL),
(900, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.912888', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.878891', NULL, NULL),
(901, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:48.997885', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:48.951891', NULL, NULL),
(902, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.068890', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.034900', NULL, NULL),
(903, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.237886', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.204888', NULL, NULL),
(904, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.325886', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.282888', NULL, NULL),
(905, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.415410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.352898', NULL, NULL),
(906, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.468419', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.436409', NULL, NULL),
(907, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.578408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.542412', NULL, NULL),
(908, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:49.756433', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.667446', NULL, NULL),
(909, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:50.119064', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:49.967606', NULL, NULL),
(910, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:50.320467', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:50.246461', NULL, NULL),
(911, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:50.457239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:50.373059', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(912, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:50.877898', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:50.711670', NULL, NULL),
(913, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.320056', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.038458', NULL, NULL),
(914, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.473587', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.412610', NULL, NULL),
(915, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.612558', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.544732', NULL, NULL),
(916, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.757434', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.722428', NULL, NULL),
(917, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.856426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.824427', NULL, NULL),
(918, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:51.997431', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:51.961436', NULL, NULL),
(919, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.044425', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.015431', NULL, NULL),
(920, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.143428', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.106428', NULL, NULL),
(921, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.284426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.250432', NULL, NULL),
(922, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.428426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.391426', NULL, NULL),
(923, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.569426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.523432', NULL, NULL),
(924, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.675429', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.634436', NULL, NULL),
(925, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.740429', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.702430', NULL, NULL),
(926, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.842426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.787427', NULL, NULL),
(927, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:52.933429', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:52.902429', NULL, NULL),
(928, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.067085', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.029023', NULL, NULL),
(929, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.180025', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.138026', NULL, NULL),
(930, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.277019', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.236021', NULL, NULL),
(931, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.362020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.333031', NULL, NULL),
(932, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.439018', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.404031', NULL, NULL),
(933, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.501019', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.469024', NULL, NULL),
(934, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.624021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.582023', NULL, NULL),
(935, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.777020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.734025', NULL, NULL),
(936, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.872021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.835023', NULL, NULL),
(937, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:53.960020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:53.926032', NULL, NULL),
(938, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.068022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.023022', NULL, NULL),
(939, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.201019', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.158049', NULL, NULL),
(940, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.248022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.218020', NULL, NULL),
(941, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.393023', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.359021', NULL, NULL),
(942, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.525022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.486020', NULL, NULL),
(943, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.643022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.603026', NULL, NULL),
(944, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.722021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.684021', NULL, NULL),
(945, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.794021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.750025', NULL, NULL),
(946, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.879020', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.847022', NULL, NULL),
(947, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:54.940052', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:54.904022', NULL, NULL),
(948, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.039021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.003026', NULL, NULL),
(949, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.119021', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.086036', NULL, NULL),
(950, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.236017', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.162034', NULL, NULL),
(951, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.377025', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.338024', NULL, NULL),
(952, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.483614', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.455611', NULL, NULL),
(953, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.614611', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.574611', NULL, NULL),
(954, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.762622', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.721613', NULL, NULL),
(955, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.842615', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.801613', NULL, NULL),
(956, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:55.970610', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:55.936612', NULL, NULL),
(957, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.114608', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.071613', NULL, NULL),
(958, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.243609', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.205609', NULL, NULL),
(959, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.319611', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.280610', NULL, NULL),
(960, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.393610', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.352610', NULL, NULL),
(961, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.535137', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.491611', NULL, NULL),
(962, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.703137', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.647138', NULL, NULL),
(963, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.817135', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.783136', NULL, NULL),
(964, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.864102', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.827106', NULL, NULL),
(965, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:56.965104', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:56.932102', NULL, NULL),
(966, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.126102', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.068103', NULL, NULL),
(967, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.233102', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.196104', NULL, NULL),
(968, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.332101', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.296104', NULL, NULL),
(969, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.399102', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.362107', NULL, NULL),
(970, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.467100', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.431104', NULL, NULL),
(971, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.603653', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.565629', NULL, NULL),
(972, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.709623', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.662634', NULL, NULL),
(973, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.850627', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.813626', NULL, NULL),
(974, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:57.941625', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:57.900625', NULL, NULL),
(975, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.079627', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.035630', NULL, NULL),
(976, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.171627', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.113626', NULL, NULL),
(977, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.256627', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.216625', NULL, NULL),
(978, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.397623', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.333624', NULL, NULL),
(979, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.451625', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.421625', NULL, NULL),
(980, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.603625', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.562624', NULL, NULL),
(981, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.734636', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.684628', NULL, NULL),
(982, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.869154', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.781154', NULL, NULL),
(983, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:58.990153', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:58.951155', NULL, NULL),
(984, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.129155', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.094156', NULL, NULL),
(985, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.269157', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.234154', NULL, NULL),
(986, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.368154', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.334154', NULL, NULL),
(987, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.456154', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.413159', NULL, NULL),
(988, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.543757', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.503762', NULL, NULL),
(989, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.588767', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.557760', NULL, NULL),
(990, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.650758', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.621761', NULL, NULL),
(991, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.715759', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.685759', NULL, NULL),
(992, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.782764', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.753759', NULL, NULL),
(993, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.885758', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.851760', NULL, NULL),
(994, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:36:59.957760', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:36:59.924758', NULL, NULL),
(995, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.134282', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.067286', NULL, NULL),
(996, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.307319', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.244284', NULL, NULL),
(997, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.368284', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.331289', NULL, NULL),
(998, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.473464', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.403285', NULL, NULL),
(999, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.553523', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.515522', NULL, NULL),
(1000, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.670524', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.634519', NULL, NULL),
(1001, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.793522', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.754522', NULL, NULL),
(1002, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.882520', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.848520', NULL, NULL),
(1003, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:00.960519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:00.927519', NULL, NULL),
(1004, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.045518', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.003529', NULL, NULL),
(1005, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.163526', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.120523', NULL, NULL),
(1006, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.315519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.274521', NULL, NULL),
(1007, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.375558', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.334523', NULL, NULL),
(1008, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.512520', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.475557', NULL, NULL),
(1009, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.562518', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.531520', NULL, NULL),
(1010, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.611523', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.579521', NULL, NULL),
(1011, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.694518', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.661520', NULL, NULL),
(1012, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.839519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.795519', NULL, NULL),
(1013, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:01.970520', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:01.934520', NULL, NULL),
(1014, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.036519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.005530', NULL, NULL),
(1015, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.165519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.135520', NULL, NULL),
(1016, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.282517', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.227522', NULL, NULL),
(1017, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.331517', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.300522', NULL, NULL),
(1018, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.458519', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.425518', NULL, NULL),
(1019, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.504520', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.472520', NULL, NULL),
(1020, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.587522', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.549523', NULL, NULL),
(1021, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.751524', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.700532', NULL, NULL),
(1022, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:02.883518', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.834523', NULL, NULL),
(1023, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.007574', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:02.959520', NULL, NULL),
(1024, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.205537', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.090523', NULL, NULL),
(1025, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.280046', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.233047', NULL, NULL),
(1026, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.416045', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.380051', NULL, NULL),
(1027, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.500045', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.458046', NULL, NULL),
(1028, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.556048', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.523051', NULL, NULL),
(1029, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.621045', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.588045', NULL, NULL),
(1030, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.771048', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.731046', NULL, NULL),
(1031, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.849046', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.812046', NULL, NULL),
(1032, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.926046', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.893056', NULL, NULL),
(1033, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:03.995044', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:03.957046', NULL, NULL),
(1034, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.111090', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.071096', NULL, NULL),
(1035, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.215094', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.178094', NULL, NULL),
(1036, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.327097', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.260104', NULL, NULL),
(1037, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.399093', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.361131', NULL, NULL),
(1038, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.569092', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.511103', NULL, NULL),
(1039, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.623092', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.589098', NULL, NULL),
(1040, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.704094', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.675098', NULL, NULL),
(1041, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.823089', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.790093', NULL, NULL),
(1042, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:04.947091', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:04.907090', NULL, NULL),
(1043, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.056095', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.009090', NULL, NULL),
(1044, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.170095', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.138092', NULL, NULL),
(1045, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.314094', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.272096', NULL, NULL),
(1046, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.494093', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.443093', NULL, NULL),
(1047, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.654093', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.586094', NULL, NULL),
(1048, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.760092', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.714093', NULL, NULL),
(1049, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.907091', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.871091', NULL, NULL),
(1050, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:05.989090', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:05.952095', NULL, NULL),
(1051, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.126091', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.094093', NULL, NULL),
(1052, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.246686', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.195688', NULL, NULL),
(1053, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.389685', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.355684', NULL, NULL),
(1054, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.493686', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.450684', NULL, NULL),
(1055, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.621209', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.585243', NULL, NULL),
(1056, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.681210', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.653221', NULL, NULL),
(1057, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.776210', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.731210', NULL, NULL),
(1058, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.891209', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.854209', NULL, NULL),
(1059, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:06.972208', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:06.942209', NULL, NULL),
(1060, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.047215', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.015212', NULL, NULL),
(1061, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.157268', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.120211', NULL, NULL),
(1062, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.241260', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.205269', NULL, NULL),
(1063, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.398260', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.348261', NULL, NULL),
(1064, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.578612', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.516261', NULL, NULL),
(1065, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.660619', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.626615', NULL, NULL),
(1066, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.807611', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.761611', NULL, NULL),
(1067, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:07.954610', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:07.913612', NULL, NULL),
(1068, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.082611', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.047611', NULL, NULL),
(1069, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.154613', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.120614', NULL, NULL),
(1070, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.296610', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.262612', NULL, NULL),
(1071, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.440613', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.403623', NULL, NULL),
(1072, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.511612', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.476612', NULL, NULL),
(1073, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.594614', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.559610', NULL, NULL),
(1074, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.668204', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.624612', NULL, NULL),
(1075, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.807203', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.770202', NULL, NULL),
(1076, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:08.899204', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.849205', NULL, NULL),
(1077, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.042202', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:08.986203', NULL, NULL),
(1078, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.171210', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.121203', NULL, NULL),
(1079, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.262731', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.226733', NULL, NULL),
(1080, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.376732', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.335731', NULL, NULL),
(1081, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.473737', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.440731', NULL, NULL),
(1082, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.541734', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.507734', NULL, NULL),
(1083, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.635732', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.596732', NULL, NULL),
(1084, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.704734', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.670732', NULL, NULL),
(1085, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.861780', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.804743', NULL, NULL),
(1086, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:09.969743', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:09.903732', NULL, NULL),
(1087, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.130867', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.069736', NULL, NULL),
(1088, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.242849', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.186857', NULL, NULL),
(1089, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.293852', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.261851', NULL, NULL),
(1090, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.445859', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.407851', NULL, NULL),
(1091, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.563852', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.528857', NULL, NULL),
(1092, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.708853', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.644854', NULL, NULL),
(1093, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:10.973851', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:10.802853', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1094, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.058854', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.024851', NULL, NULL),
(1095, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.120850', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.079851', NULL, NULL),
(1096, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.203852', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.168852', NULL, NULL),
(1097, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.254853', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.223849', NULL, NULL),
(1098, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.378849', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.343850', NULL, NULL),
(1099, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.452849', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.415852', NULL, NULL),
(1100, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.546851', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.500852', NULL, NULL),
(1101, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.601850', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.563870', NULL, NULL),
(1102, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.741852', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.655853', NULL, NULL),
(1103, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:11.917853', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:11.858850', NULL, NULL),
(1104, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.072909', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.038971', NULL, NULL),
(1105, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.149907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.115907', NULL, NULL),
(1106, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.218907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.176909', NULL, NULL),
(1107, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.303909', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.259913', NULL, NULL),
(1108, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.358909', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.322908', NULL, NULL),
(1109, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.495908', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.462909', NULL, NULL),
(1110, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.576910', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.535910', NULL, NULL),
(1111, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.686906', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.653907', NULL, NULL),
(1112, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.835907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.802907', NULL, NULL),
(1113, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:12.923907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.886915', NULL, NULL),
(1114, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.002907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:12.956915', NULL, NULL),
(1115, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.051909', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.015909', NULL, NULL),
(1116, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.137907', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.081908', NULL, NULL),
(1117, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.201492', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.165907', NULL, NULL),
(1118, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.349494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.312530', NULL, NULL),
(1119, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.438491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.400494', NULL, NULL),
(1120, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.578491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.526492', NULL, NULL),
(1121, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.718541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.687499', NULL, NULL),
(1122, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.858492', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.827492', NULL, NULL),
(1123, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.920490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.888490', NULL, NULL),
(1124, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:13.970490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:13.942499', NULL, NULL),
(1125, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.045491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.015491', NULL, NULL),
(1126, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.136490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.103491', NULL, NULL),
(1127, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.216489', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.184493', NULL, NULL),
(1128, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.323491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.290490', NULL, NULL),
(1129, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.405490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.369491', NULL, NULL),
(1130, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.456489', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.421491', NULL, NULL),
(1131, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.585491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.536491', NULL, NULL),
(1132, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.727491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.689492', NULL, NULL),
(1133, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.796492', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.766491', NULL, NULL),
(1134, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.868493', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.832493', NULL, NULL),
(1135, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:14.968489', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:14.925490', NULL, NULL),
(1136, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.159494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.107489', NULL, NULL),
(1137, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.307494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.273492', NULL, NULL),
(1138, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.393491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.356498', NULL, NULL),
(1139, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.520490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.488492', NULL, NULL),
(1140, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.618490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.580492', NULL, NULL),
(1141, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.774494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.738493', NULL, NULL),
(1142, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.821490', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.788492', NULL, NULL),
(1143, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:15.934492', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:15.900492', NULL, NULL),
(1144, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.063491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.030491', NULL, NULL),
(1145, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.160496', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.116494', NULL, NULL),
(1146, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.210542', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.180492', NULL, NULL),
(1147, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.389538', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.330540', NULL, NULL),
(1148, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.464538', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.414538', NULL, NULL),
(1149, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.601540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.572538', NULL, NULL),
(1150, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.759539', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.721538', NULL, NULL),
(1151, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.863538', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.828539', NULL, NULL),
(1152, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:16.944550', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.911542', NULL, NULL),
(1153, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.013538', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:16.983537', NULL, NULL),
(1154, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.144540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.111538', NULL, NULL),
(1155, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.266540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.235554', NULL, NULL),
(1156, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.383537', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.346538', NULL, NULL),
(1157, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.494590', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.463593', NULL, NULL),
(1158, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.554649', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.522645', NULL, NULL),
(1159, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.635650', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.597648', NULL, NULL),
(1160, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.753651', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.718647', NULL, NULL),
(1161, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.865643', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.821647', NULL, NULL),
(1162, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:17.949648', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.890647', NULL, NULL),
(1163, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.036647', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:17.997655', NULL, NULL),
(1164, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.133140', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.068367', NULL, NULL),
(1165, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.285315', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.218963', NULL, NULL),
(1166, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.447112', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.380704', NULL, NULL),
(1167, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.566398', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.498865', NULL, NULL),
(1168, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.786947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.688922', NULL, NULL),
(1169, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:18.911214', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.838669', NULL, NULL),
(1170, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.016083', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:18.959245', NULL, NULL),
(1171, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.084085', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.044090', NULL, NULL),
(1172, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.287659', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.185097', NULL, NULL),
(1173, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.513270', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.403398', NULL, NULL),
(1174, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.670050', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.598049', NULL, NULL),
(1175, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.793119', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.711139', NULL, NULL),
(1176, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:19.910107', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.874111', NULL, NULL),
(1177, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.020109', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:19.980108', NULL, NULL),
(1178, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.080108', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.044112', NULL, NULL),
(1179, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.147108', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.109112', NULL, NULL),
(1180, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.301668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.249673', NULL, NULL),
(1181, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.469673', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.416669', NULL, NULL),
(1182, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.686196', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.570670', NULL, NULL),
(1183, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:20.953946', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:20.820949', NULL, NULL),
(1184, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:21.180949', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:21.069951', NULL, NULL),
(1185, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:21.365947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:21.280953', NULL, NULL),
(1186, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:21.517947', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:21.463948', NULL, NULL),
(1187, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:21.681952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:21.618963', NULL, NULL),
(1188, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:21.868148', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:21.812168', NULL, NULL),
(1189, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.080783', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.023805', NULL, NULL),
(1190, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.199782', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.130782', NULL, NULL),
(1191, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.347780', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.276780', NULL, NULL),
(1192, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.524085', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.442471', NULL, NULL),
(1193, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.706087', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.644085', NULL, NULL),
(1194, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.837083', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.793085', NULL, NULL),
(1195, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:22.912092', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.875083', NULL, NULL),
(1196, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.008087', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:22.966083', NULL, NULL),
(1197, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.150083', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.105086', NULL, NULL),
(1198, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.212084', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.173083', NULL, NULL),
(1199, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.352082', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.311085', NULL, NULL),
(1200, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.501083', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.460084', NULL, NULL),
(1201, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.600081', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.565083', NULL, NULL),
(1202, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.719084', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.682083', NULL, NULL),
(1203, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.853086', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.815086', NULL, NULL),
(1204, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:23.986084', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:23.950083', NULL, NULL),
(1205, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.121084', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.086084', NULL, NULL),
(1206, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.211083', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.167085', NULL, NULL),
(1207, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.349744', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.312085', NULL, NULL),
(1208, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.465286', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.418267', NULL, NULL),
(1209, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.565266', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.525266', NULL, NULL),
(1210, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.782314', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.688268', NULL, NULL),
(1211, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.850316', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.807313', NULL, NULL),
(1212, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:24.929365', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.889378', NULL, NULL),
(1213, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.010363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:24.960376', NULL, NULL),
(1214, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.126364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.092365', NULL, NULL),
(1215, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.207364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.176367', NULL, NULL),
(1216, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.372365', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.315366', NULL, NULL),
(1217, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.425371', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.396366', NULL, NULL),
(1218, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.509368', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.471367', NULL, NULL),
(1219, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.615364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.579367', NULL, NULL),
(1220, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.745373', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.710366', NULL, NULL),
(1221, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.806365', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.772369', NULL, NULL),
(1222, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.860366', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.830365', NULL, NULL),
(1223, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:25.946364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:25.913364', NULL, NULL),
(1224, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.054372', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.018369', NULL, NULL),
(1225, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.213362', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.160362', NULL, NULL),
(1226, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.322368', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.285365', NULL, NULL),
(1227, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.380363', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.344364', NULL, NULL),
(1228, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.479365', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.426373', NULL, NULL),
(1229, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.561364', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.525371', NULL, NULL),
(1230, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.700433', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.659908', NULL, NULL),
(1231, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.790428', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.748433', NULL, NULL),
(1232, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:26.931428', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:26.896431', NULL, NULL),
(1233, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.056429', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.017431', NULL, NULL),
(1234, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.185431', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.152430', NULL, NULL),
(1235, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.251452', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.214430', NULL, NULL),
(1236, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.343428', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.304431', NULL, NULL),
(1237, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.422068', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.394071', NULL, NULL),
(1238, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.543070', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.510070', NULL, NULL),
(1239, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.595070', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.568070', NULL, NULL),
(1240, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.697071', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.660069', NULL, NULL),
(1241, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.749073', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.718074', NULL, NULL),
(1242, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.810075', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.777071', NULL, NULL),
(1243, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:27.956070', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.918070', NULL, NULL),
(1244, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.006071', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:27.974070', NULL, NULL),
(1245, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.136069', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.094072', NULL, NULL),
(1246, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.259069', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.218069', NULL, NULL),
(1247, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.413069', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.362077', NULL, NULL),
(1248, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.526071', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.485070', NULL, NULL),
(1249, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.628070', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.594073', NULL, NULL),
(1250, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.765617', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.724072', NULL, NULL),
(1251, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.881606', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.823609', NULL, NULL),
(1252, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:28.940718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:28.898718', NULL, NULL),
(1253, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.058720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.018721', NULL, NULL),
(1254, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.191716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.157718', NULL, NULL),
(1255, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.272716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.243716', NULL, NULL),
(1256, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.407716', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.374717', NULL, NULL),
(1257, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.535718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.495720', NULL, NULL),
(1258, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.670717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.630718', NULL, NULL),
(1259, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.740717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.707721', NULL, NULL),
(1260, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:29.873717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.842720', NULL, NULL),
(1261, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.007717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:29.975717', NULL, NULL),
(1262, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.124719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.075720', NULL, NULL),
(1263, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.230737', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.192718', NULL, NULL),
(1264, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.359718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.312720', NULL, NULL),
(1265, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.491239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.452240', NULL, NULL),
(1266, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.571239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.534277', NULL, NULL),
(1267, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.659239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.625240', NULL, NULL),
(1268, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.736239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.708240', NULL, NULL),
(1269, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.856238', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.822242', NULL, NULL),
(1270, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:30.976762', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:30.944762', NULL, NULL),
(1271, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.085763', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.050764', NULL, NULL),
(1272, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.183763', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.153762', NULL, NULL),
(1273, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.242760', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.206763', NULL, NULL),
(1274, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.293761', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.261761', NULL, NULL),
(1275, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.421285', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.384763', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1276, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.495288', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.465291', NULL, NULL),
(1277, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.576287', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.548289', NULL, NULL),
(1278, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.657287', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.615299', NULL, NULL),
(1279, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.798292', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.758288', NULL, NULL),
(1280, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:31.926816', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.897814', NULL, NULL),
(1281, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.022811', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:31.986813', NULL, NULL),
(1282, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.164808', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.120809', NULL, NULL),
(1283, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.270809', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.227810', NULL, NULL),
(1284, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.353810', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.317814', NULL, NULL),
(1285, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.463916', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.421387', NULL, NULL),
(1286, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.520915', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.490918', NULL, NULL),
(1287, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.559924', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.531917', NULL, NULL),
(1288, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.733061', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.675920', NULL, NULL),
(1289, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.871586', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.833587', NULL, NULL),
(1290, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:32.933596', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:32.901585', NULL, NULL),
(1291, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.071687', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.041688', NULL, NULL),
(1292, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.169331', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.131333', NULL, NULL),
(1293, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.257337', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.217331', NULL, NULL),
(1294, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.370331', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.332336', NULL, NULL),
(1295, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.462893', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.419857', NULL, NULL),
(1296, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.540857', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.501858', NULL, NULL),
(1297, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.645857', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.613862', NULL, NULL),
(1298, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.750855', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.713859', NULL, NULL),
(1299, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.806862', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.778857', NULL, NULL),
(1300, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:33.921398', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:33.886860', NULL, NULL),
(1301, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.040398', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.003399', NULL, NULL),
(1302, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.133396', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.103400', NULL, NULL),
(1303, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.264394', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.231395', NULL, NULL),
(1304, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.397396', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.367396', NULL, NULL),
(1305, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.540918', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.508919', NULL, NULL),
(1306, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.623468', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.570454', NULL, NULL),
(1307, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.755443', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.719445', NULL, NULL),
(1308, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.851446', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.819454', NULL, NULL),
(1309, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:34.941052', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:34.899444', NULL, NULL),
(1310, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.046856', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.014851', NULL, NULL),
(1311, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.130846', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.100848', NULL, NULL),
(1312, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.175847', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.144849', NULL, NULL),
(1313, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.293854', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.262859', NULL, NULL),
(1314, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.396849', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.356849', NULL, NULL),
(1315, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.492372', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.460371', NULL, NULL),
(1316, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.585372', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.553372', NULL, NULL),
(1317, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.696413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.653384', NULL, NULL),
(1318, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.824374', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.783373', NULL, NULL),
(1319, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:35.887371', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.858372', NULL, NULL),
(1320, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.009440', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:35.970434', NULL, NULL),
(1321, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.139435', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.083426', NULL, NULL),
(1322, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.253423', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.214425', NULL, NULL),
(1323, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.412422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.376428', NULL, NULL),
(1324, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.470420', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.436424', NULL, NULL),
(1325, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.677422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.508424', NULL, NULL),
(1326, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.828424', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.782425', NULL, NULL),
(1327, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:36.908425', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:36.876423', NULL, NULL),
(1328, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.060428', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.027426', NULL, NULL),
(1329, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.132424', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.098423', NULL, NULL),
(1330, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.197423', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.161432', NULL, NULL),
(1331, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.253425', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.214425', NULL, NULL),
(1332, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.369422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.330426', NULL, NULL),
(1333, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.502424', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.470427', NULL, NULL),
(1334, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.563423', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.530427', NULL, NULL),
(1335, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.654433', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.625426', NULL, NULL),
(1336, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.750422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.721426', NULL, NULL),
(1337, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.800426', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.768424', NULL, NULL),
(1338, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.894422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.865423', NULL, NULL),
(1339, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:37.952422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.917425', NULL, NULL),
(1340, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.015596', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:37.981951', NULL, NULL),
(1341, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.082592', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.051595', NULL, NULL),
(1342, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.176592', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.147591', NULL, NULL),
(1343, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.258608', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.219592', NULL, NULL),
(1344, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.404230', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.370233', NULL, NULL),
(1345, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.554435', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.512827', NULL, NULL),
(1346, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.656436', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.622436', NULL, NULL),
(1347, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.798437', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.766437', NULL, NULL),
(1348, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:38.939435', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:38.903439', NULL, NULL),
(1349, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.070638', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.037638', NULL, NULL),
(1350, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.183636', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.146640', NULL, NULL),
(1351, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.253637', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.219638', NULL, NULL),
(1352, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.337639', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.301644', NULL, NULL),
(1353, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.469635', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.437639', NULL, NULL),
(1354, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.601637', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.567639', NULL, NULL),
(1355, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.721640', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.684638', NULL, NULL),
(1356, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.772637', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.744638', NULL, NULL),
(1357, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.885639', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.836638', NULL, NULL),
(1358, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:39.959642', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:39.930640', NULL, NULL),
(1359, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.076636', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.044639', NULL, NULL),
(1360, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.211639', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.166640', NULL, NULL),
(1361, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.393637', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.321638', NULL, NULL),
(1362, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.529245', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.480274', NULL, NULL),
(1363, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.579247', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.546252', NULL, NULL),
(1364, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.662247', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.618247', NULL, NULL),
(1365, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.764297', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.726303', NULL, NULL),
(1366, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.819295', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.786297', NULL, NULL),
(1367, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:40.948883', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:40.903881', NULL, NULL),
(1368, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.040880', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.006885', NULL, NULL),
(1369, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.166882', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.130884', NULL, NULL),
(1370, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.263882', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.226886', NULL, NULL),
(1371, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.400880', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.339886', NULL, NULL),
(1372, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.470883', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.436882', NULL, NULL),
(1373, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.611930', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.568930', NULL, NULL),
(1374, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.687952', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.640933', NULL, NULL),
(1375, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.758932', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.723928', NULL, NULL),
(1376, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.882929', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.849931', NULL, NULL),
(1377, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:41.969983', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:41.924929', NULL, NULL),
(1378, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.069039', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.029043', NULL, NULL),
(1379, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.150038', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.109052', NULL, NULL),
(1380, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.275039', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.229041', NULL, NULL),
(1381, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.361039', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.323040', NULL, NULL),
(1382, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.466145', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.401044', NULL, NULL),
(1383, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.536148', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.503149', NULL, NULL),
(1384, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.632148', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.592150', NULL, NULL),
(1385, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.695150', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.661150', NULL, NULL),
(1386, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.796311', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.764312', NULL, NULL),
(1387, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:42.934309', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.897310', NULL, NULL),
(1388, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.045848', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:42.979315', NULL, NULL),
(1389, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.185510', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.146516', NULL, NULL),
(1390, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.339510', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.292511', NULL, NULL),
(1391, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.425710', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.349712', NULL, NULL),
(1392, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.513709', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.453759', NULL, NULL),
(1393, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.617712', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.568711', NULL, NULL),
(1394, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.706710', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.671710', NULL, NULL),
(1395, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.795708', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.756756', NULL, NULL),
(1396, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.905277', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.866235', NULL, NULL),
(1397, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:43.991234', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:43.953240', NULL, NULL),
(1398, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.081239', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.030237', NULL, NULL),
(1399, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.194235', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.141244', NULL, NULL),
(1400, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.263236', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.225240', NULL, NULL),
(1401, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.325237', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.285237', NULL, NULL),
(1402, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.445237', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.383238', NULL, NULL),
(1403, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.581234', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.542239', NULL, NULL),
(1404, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.691245', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.655239', NULL, NULL),
(1405, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.758775', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.726773', NULL, NULL),
(1406, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.856775', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.794774', NULL, NULL),
(1407, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:44.928876', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.892823', NULL, NULL),
(1408, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.026873', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:44.992877', NULL, NULL),
(1409, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.222875', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.040878', NULL, NULL),
(1410, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.293875', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.262879', NULL, NULL),
(1411, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.407877', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.377876', NULL, NULL),
(1412, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.474877', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.434883', NULL, NULL),
(1413, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.580879', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.525889', NULL, NULL),
(1414, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.732500', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.688496', NULL, NULL),
(1415, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:45.860504', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.813500', NULL, NULL),
(1416, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.015497', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:45.977496', NULL, NULL),
(1417, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.161496', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.117496', NULL, NULL),
(1418, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.310497', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.271497', NULL, NULL),
(1419, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.402497', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.359498', NULL, NULL),
(1420, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.494073', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.456077', NULL, NULL),
(1421, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.617091', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.577075', NULL, NULL),
(1422, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.719128', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.683128', NULL, NULL),
(1423, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.809125', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.774131', NULL, NULL),
(1424, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:46.919650', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:46.878650', NULL, NULL),
(1425, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.060650', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.020649', NULL, NULL),
(1426, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.166664', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.113651', NULL, NULL),
(1427, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.283651', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.252654', NULL, NULL),
(1428, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.449561', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.395399', NULL, NULL),
(1429, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.760538', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.560547', NULL, NULL),
(1430, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:47.944544', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:47.811541', NULL, NULL),
(1431, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.154543', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.092542', NULL, NULL),
(1432, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.243540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.193538', NULL, NULL),
(1433, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.371540', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.336538', NULL, NULL),
(1434, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.472537', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.434539', NULL, NULL),
(1435, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.559541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.522537', NULL, NULL),
(1436, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.659541', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.627541', NULL, NULL),
(1437, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.801063', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.770066', NULL, NULL),
(1438, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:48.912064', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.875064', NULL, NULL),
(1439, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.004062', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:48.967065', NULL, NULL),
(1440, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.083072', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.047065', NULL, NULL),
(1441, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.224955', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.177063', NULL, NULL),
(1442, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.347130', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.298959', NULL, NULL),
(1443, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.510205', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.468197', NULL, NULL),
(1444, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.629722', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.591721', NULL, NULL),
(1445, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.719719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.688719', NULL, NULL),
(1446, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:49.859717', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.826720', NULL, NULL),
(1447, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.018725', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:49.970723', NULL, NULL),
(1448, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.075721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.037721', NULL, NULL),
(1449, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.198719', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.152719', NULL, NULL),
(1450, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.259720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.215720', NULL, NULL),
(1451, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.364720', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.332720', NULL, NULL),
(1452, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.516721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.475719', NULL, NULL),
(1453, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.592721', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.549722', NULL, NULL),
(1454, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.805718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.738721', NULL, NULL),
(1455, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:50.946826', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.891782', NULL, NULL),
(1456, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.074791', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:50.993783', NULL, NULL),
(1457, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.174799', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.107800', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1458, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.339784', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.240798', NULL, NULL),
(1459, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.499340', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.436787', NULL, NULL),
(1460, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.701733', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.592456', NULL, NULL),
(1461, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.845734', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.802729', NULL, NULL),
(1462, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:51.989729', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:51.948731', NULL, NULL),
(1463, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.124731', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.089731', NULL, NULL),
(1464, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.268728', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.191729', NULL, NULL),
(1465, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.323632', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.288645', NULL, NULL),
(1466, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.408630', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.359631', NULL, NULL),
(1467, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.481633', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.439631', NULL, NULL),
(1468, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.540629', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.508631', NULL, NULL),
(1469, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:52.740308', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.656641', NULL, NULL),
(1470, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.024501', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:52.805718', NULL, NULL),
(1471, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.199280', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.136546', NULL, NULL),
(1472, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.351524', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.303887', NULL, NULL),
(1473, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.458683', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.402113', NULL, NULL),
(1474, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.533654', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.473648', NULL, NULL),
(1475, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.720970', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.654798', NULL, NULL),
(1476, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:53.948506', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:53.773575', NULL, NULL),
(1477, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.096741', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.048147', NULL, NULL),
(1478, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.168935', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.130413', NULL, NULL),
(1479, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.238589', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.202586', NULL, NULL),
(1480, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.372585', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.308586', NULL, NULL),
(1481, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.524868', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.472585', NULL, NULL),
(1482, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.583868', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.550868', NULL, NULL),
(1483, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.683869', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.641878', NULL, NULL),
(1484, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.778872', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.745868', NULL, NULL),
(1485, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.869870', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.834869', NULL, NULL),
(1486, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:54.983869', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:54.939874', NULL, NULL),
(1487, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.050868', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.016874', NULL, NULL),
(1488, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.178868', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.147867', NULL, NULL),
(1489, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.300866', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.262869', NULL, NULL),
(1490, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.447393', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.416398', NULL, NULL),
(1491, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.571399', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.532394', NULL, NULL),
(1492, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.665396', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.626394', NULL, NULL),
(1493, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.746448', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.710458', NULL, NULL),
(1494, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.837451', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.801454', NULL, NULL),
(1495, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:55.968513', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:55.935506', NULL, NULL),
(1496, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.064506', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.032508', NULL, NULL),
(1497, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.195506', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.149506', NULL, NULL),
(1498, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.332507', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.294508', NULL, NULL),
(1499, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.427509', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.388508', NULL, NULL),
(1500, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.583507', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.518513', NULL, NULL),
(1501, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.780334', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.669613', NULL, NULL),
(1502, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:56.966062', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:56.846569', NULL, NULL),
(1503, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:57.238681', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:57.047674', NULL, NULL),
(1504, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:57.543705', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:57.321660', NULL, NULL),
(1505, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:57.749170', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:57.649315', NULL, NULL),
(1506, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:57.902155', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:57.836195', NULL, NULL),
(1507, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:58.065152', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:57.970154', NULL, NULL),
(1508, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:58.316164', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:58.136157', NULL, NULL),
(1509, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:58.576788', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:58.366792', NULL, NULL),
(1510, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:58.786787', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:58.701789', NULL, NULL),
(1511, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:58.915788', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:58.861792', NULL, NULL),
(1512, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.116409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.033410', NULL, NULL),
(1513, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.198410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.159411', NULL, NULL),
(1514, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.316412', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.286413', NULL, NULL),
(1515, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.368413', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.338409', NULL, NULL),
(1516, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.480410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.430411', NULL, NULL),
(1517, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.596422', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.564412', NULL, NULL),
(1518, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.711409', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.681412', NULL, NULL),
(1519, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.854410', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.724413', NULL, NULL),
(1520, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.914408', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.883411', NULL, NULL),
(1521, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:37:59.994160', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:37:59.964168', NULL, NULL),
(1522, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.138170', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.095160', NULL, NULL),
(1523, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.247160', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.209160', NULL, NULL),
(1524, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.384159', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.352158', NULL, NULL),
(1525, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.474165', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.445160', NULL, NULL),
(1526, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.607159', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.578158', NULL, NULL),
(1527, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.697158', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.668159', NULL, NULL),
(1528, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.762163', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.733163', NULL, NULL),
(1529, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.837169', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.807164', NULL, NULL),
(1530, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:00.884158', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.858164', NULL, NULL),
(1531, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.028161', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:00.987162', NULL, NULL),
(1532, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.154163', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.123160', NULL, NULL),
(1533, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.245160', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.217161', NULL, NULL),
(1534, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.456162', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.309162', NULL, NULL),
(1535, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.564162', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.533163', NULL, NULL),
(1536, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.629161', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.589176', NULL, NULL),
(1537, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.750166', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.714161', NULL, NULL),
(1538, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:01.890159', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:01.851160', NULL, NULL),
(1539, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.041159', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.007160', NULL, NULL),
(1540, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.151161', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.058161', NULL, NULL),
(1541, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.330163', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.266159', NULL, NULL),
(1542, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.399159', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.351159', NULL, NULL),
(1543, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.544160', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.480164', NULL, NULL),
(1544, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.680689', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.627689', NULL, NULL),
(1545, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.798612', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.760754', NULL, NULL),
(1546, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.898668', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.860743', NULL, NULL),
(1547, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:02.967669', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:02.940669', NULL, NULL),
(1548, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.092729', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.055732', NULL, NULL),
(1549, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.178775', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.145774', NULL, NULL),
(1550, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.287773', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.248775', NULL, NULL),
(1551, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.423773', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.381774', NULL, NULL),
(1552, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.546773', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.494775', NULL, NULL),
(1553, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.676294', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.639299', NULL, NULL),
(1554, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.712297', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.687300', NULL, NULL),
(1555, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.790301', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.760298', NULL, NULL),
(1556, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.893297', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.840337', NULL, NULL),
(1557, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:03.985075', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:03.943300', NULL, NULL),
(1558, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.069128', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.041127', NULL, NULL),
(1559, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.150123', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.105126', NULL, NULL),
(1560, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.313123', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.255123', NULL, NULL),
(1561, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.437186', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.393185', NULL, NULL),
(1562, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.511178', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.455182', NULL, NULL),
(1563, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.677834', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.593295', NULL, NULL),
(1564, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.809831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.755831', NULL, NULL),
(1565, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.880831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.837835', NULL, NULL),
(1566, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:04.997831', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:04.946834', NULL, NULL),
(1567, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.135303', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.100303', NULL, NULL),
(1568, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.231840', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.185834', NULL, NULL),
(1569, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.333840', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.303834', NULL, NULL),
(1570, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.373250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.343250', NULL, NULL),
(1571, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.497250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.464252', NULL, NULL),
(1572, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.574249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.542253', NULL, NULL),
(1573, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.640248', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.611250', NULL, NULL),
(1574, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.728251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.699251', NULL, NULL),
(1575, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.776252', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.752250', NULL, NULL),
(1576, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.821251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.795253', NULL, NULL),
(1577, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.886253', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.857259', NULL, NULL),
(1578, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:05.973257', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:05.943254', NULL, NULL),
(1579, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.146259', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.087253', NULL, NULL),
(1580, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.248260', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.206251', NULL, NULL),
(1581, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.313249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.282250', NULL, NULL),
(1582, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.363255', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.335253', NULL, NULL),
(1583, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.496252', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.466251', NULL, NULL),
(1584, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.610249', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.579255', NULL, NULL),
(1585, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.746258', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.713261', NULL, NULL),
(1586, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.873250', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.839249', NULL, NULL),
(1587, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:06.984252', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:06.941253', NULL, NULL),
(1588, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.047251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.014256', NULL, NULL),
(1589, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.185251', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.155250', NULL, NULL),
(1590, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.359277', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.291250', NULL, NULL),
(1591, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.578771', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.446771', NULL, NULL),
(1592, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.755769', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.703773', NULL, NULL),
(1593, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:07.941827', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:07.885345', NULL, NULL),
(1594, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.094965', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.048999', NULL, NULL),
(1595, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.218953', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.182956', NULL, NULL),
(1596, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.332954', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.288956', NULL, NULL),
(1597, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.459953', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.427958', NULL, NULL),
(1598, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.539956', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.503956', NULL, NULL),
(1599, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.621954', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.593953', NULL, NULL),
(1600, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.669955', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.641957', NULL, NULL),
(1601, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.752955', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.721954', NULL, NULL),
(1602, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.873968', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.811957', NULL, NULL),
(1603, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:08.922494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:08.897494', NULL, NULL),
(1604, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.066494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.036493', NULL, NULL),
(1605, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.197493', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.166503', NULL, NULL),
(1606, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.268499', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.238492', NULL, NULL),
(1607, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.371491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.336493', NULL, NULL),
(1608, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.489494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.457495', NULL, NULL),
(1609, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.559495', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.525493', NULL, NULL),
(1610, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.609492', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.576493', NULL, NULL),
(1611, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.721491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.692497', NULL, NULL),
(1612, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.769495', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.739492', NULL, NULL),
(1613, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.871496', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.837494', NULL, NULL),
(1614, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.934491', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.907494', NULL, NULL),
(1615, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:09.995496', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:09.970494', NULL, NULL),
(1616, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.069493', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.035495', NULL, NULL),
(1617, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.143495', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.094493', NULL, NULL),
(1618, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.253494', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.220493', NULL, NULL),
(1619, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.384023', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.325024', NULL, NULL),
(1620, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.481022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.454023', NULL, NULL),
(1621, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.614024', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.587023', NULL, NULL),
(1622, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.769019', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.725023', NULL, NULL),
(1623, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:10.839022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.804026', NULL, NULL),
(1624, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.040022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:10.942072', NULL, NULL),
(1625, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.205023', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.153024', NULL, NULL),
(1626, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.293022', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.253028', NULL, NULL),
(1627, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.458643', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.373026', NULL, NULL),
(1628, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.634718', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.574177', NULL, NULL),
(1629, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.785330', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.745330', NULL, NULL),
(1630, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.845334', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.807331', NULL, NULL),
(1631, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:11.954323', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:11.917331', NULL, NULL),
(1632, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.101324', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.021325', NULL, NULL),
(1633, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.206325', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.166326', NULL, NULL),
(1634, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.268326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.233324', NULL, NULL),
(1635, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.328329', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.299326', NULL, NULL),
(1636, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.378325', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.349328', NULL, NULL),
(1637, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.483359', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.441325', NULL, NULL),
(1638, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.569849', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.540851', NULL, NULL),
(1639, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.681860', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.652849', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1640, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.727853', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.699850', NULL, NULL),
(1641, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.857874', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.826852', NULL, NULL),
(1642, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:12.936851', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.891850', NULL, NULL),
(1643, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.041569', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:12.962850', NULL, NULL),
(1644, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.152118', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.085186', NULL, NULL),
(1645, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.341113', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.269114', NULL, NULL),
(1646, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.490269', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.407640', NULL, NULL),
(1647, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.566267', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.512297', NULL, NULL),
(1648, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.690325', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.630324', NULL, NULL),
(1649, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.741326', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.706325', NULL, NULL),
(1650, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 20:38:13.870323', 0, NULL, 'match_requests', 1, NULL, '', '14280', '2023-09-08 20:38:13.834326', NULL, NULL),
(1826, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[false, 1], {}]', '3ab1227324af716006476cf961c803142a4c8c30', NULL, 0, '2023-09-08 22:56:18.209594', 0, NULL, 'match_requests', 1, NULL, '', '20412', '2023-09-08 22:56:18.074595', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `basicuser`
--

CREATE TABLE `basicuser` (
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `basicuser`
--

INSERT INTO `basicuser` (`IdUser`) VALUES
(3),
(4),
(9);

-- --------------------------------------------------------

--
-- Table structure for table `broker`
--

CREATE TABLE `broker` (
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `broker`
--

INSERT INTO `broker` (`IdUser`) VALUES
(9);

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

--
-- Dumping data for table `brokerbasicusercontract`
--

INSERT INTO `brokerbasicusercontract` (`IdContract`, `CreationTime`, `ResponseTime`, `WasAccepted`, `FeePercentage`, `ExpirationTime`, `ContractFilePath`, `IdBasicUser`, `IdBroker`) VALUES
(1, '2023-09-08 19:20:56.305607', '2023-09-08 19:23:50.606804', 1, 10, '2024-09-07 19:20:56.305607', 'broker_basicuser_contract/file/AlexBroker/Alex', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `brokerbasicusercontractfile`
--

CREATE TABLE `brokerbasicusercontractfile` (
  `FilePath` varchar(128) NOT NULL,
  `ContractContent` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brokerbasicusercontractfile`
--

INSERT INTO `brokerbasicusercontractfile` (`FilePath`, `ContractContent`) VALUES
('broker_basicuser_contract/file/AlexBroker/Alex', 'Dont know.');

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
(8, '2023-09-08 18:20:16.847220', '1', 'can_trade', 1, '[{\"added\": {}}]', 3, 1),
(9, '2023-09-08 18:42:07.539146', '5', 'BasicUser object (5)', 3, '', 13, 1),
(10, '2023-09-08 18:43:08.054515', '5', 'AlexBroker', 3, '', 8, 1),
(11, '2023-09-08 18:44:43.781917', '8', 'BasicUser object (8)', 3, '', 13, 1),
(12, '2023-09-08 18:44:49.731280', '8', 'AlexBroker', 3, '', 8, 1),
(13, '2023-09-08 18:47:20.839079', '1', 'Administrator object (1)', 1, '[{\"added\": {}}]', 11, 1),
(14, '2023-09-08 19:26:24.404192', '1', 'Asset object (1)', 1, '[{\"added\": {}}]', 14, 1),
(15, '2023-09-08 19:26:29.398976', '2', 'Asset object (2)', 1, '[{\"added\": {}}]', 14, 1),
(16, '2023-09-08 19:26:36.875376', '3', 'Asset object (3)', 1, '[{\"added\": {}}]', 14, 1),
(17, '2023-09-08 19:30:35.236831', '1', 'FundsTransferMethod object (1)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2023-09-08 19:30:47.245551', '2', 'FundsTransferMethod object (2)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2023-09-08 19:31:25.449048', '1', 'MakeBeliefOwns object (1)', 1, '[{\"added\": {}}]', 17, 1),
(20, '2023-09-08 19:31:30.393333', '1', 'MakeBeliefOwns object (1)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 17, 1),
(21, '2023-09-08 19:32:06.875217', '3', 'Trader object (3)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 12, 1),
(22, '2023-09-08 19:32:12.568535', '4', 'Trader object (4)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 12, 1),
(23, '2023-09-08 19:32:48.392058', '3', 'FundsTransferMethod object (3)', 1, '[{\"added\": {}}]', 10, 1),
(24, '2023-09-08 19:33:03.087206', '9', 'Trader object (9)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 12, 1),
(25, '2023-09-08 20:32:47.772996', '1', 'PurchaseRequest object (1)', 3, '', 16, 1),
(26, '2023-09-08 20:46:43.757793', '2', 'PurchaseRequest object (2)', 3, '', 16, 1),
(27, '2023-09-08 21:10:13.875890', '3', 'PurchaseRequest object (3)', 3, '', 16, 1),
(28, '2023-09-08 21:17:35.240293', '4', 'PurchaseRequest object (4)', 3, '', 16, 1),
(29, '2023-09-08 21:21:05.994485', '1750', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:24.648210+00:00', 3, '', 6, 1),
(30, '2023-09-08 21:21:05.999483', '1749', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:24.513207+00:00', 3, '', 6, 1),
(31, '2023-09-08 21:21:06.010489', '1748', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:24.373208+00:00', 3, '', 6, 1),
(32, '2023-09-08 21:21:06.013482', '1747', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:24.231204+00:00', 3, '', 6, 1),
(33, '2023-09-08 21:21:06.018490', '1746', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:24.092205+00:00', 3, '', 6, 1),
(34, '2023-09-08 21:21:06.021482', '1745', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.858222+00:00', 3, '', 6, 1),
(35, '2023-09-08 21:21:06.025485', '1744', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.729208+00:00', 3, '', 6, 1),
(36, '2023-09-08 21:21:06.029488', '1743', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.636206+00:00', 3, '', 6, 1),
(37, '2023-09-08 21:21:06.032492', '1742', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.584205+00:00', 3, '', 6, 1),
(38, '2023-09-08 21:21:06.036488', '1741', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.454247+00:00', 3, '', 6, 1),
(39, '2023-09-08 21:21:06.040488', '1740', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.389285+00:00', 3, '', 6, 1),
(40, '2023-09-08 21:21:06.044488', '1739', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.286235+00:00', 3, '', 6, 1),
(41, '2023-09-08 21:21:06.047483', '1738', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.203206+00:00', 3, '', 6, 1),
(42, '2023-09-08 21:21:06.052502', '1737', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:23.125206+00:00', 3, '', 6, 1),
(43, '2023-09-08 21:21:06.056482', '1736', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.999204+00:00', 3, '', 6, 1),
(44, '2023-09-08 21:21:06.060487', '1735', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.914205+00:00', 3, '', 6, 1),
(45, '2023-09-08 21:21:06.064483', '1734', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.847205+00:00', 3, '', 6, 1),
(46, '2023-09-08 21:21:06.068487', '1733', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.744207+00:00', 3, '', 6, 1),
(47, '2023-09-08 21:21:06.072484', '1732', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.616496+00:00', 3, '', 6, 1),
(48, '2023-09-08 21:21:06.076485', '1731', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.446496+00:00', 3, '', 6, 1),
(49, '2023-09-08 21:21:06.080486', '1730', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.330495+00:00', 3, '', 6, 1),
(50, '2023-09-08 21:21:06.085485', '1729', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.219496+00:00', 3, '', 6, 1),
(51, '2023-09-08 21:21:06.088484', '1728', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:22.075498+00:00', 3, '', 6, 1),
(52, '2023-09-08 21:21:06.092484', '1727', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.943494+00:00', 3, '', 6, 1),
(53, '2023-09-08 21:21:06.096488', '1726', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.795497+00:00', 3, '', 6, 1),
(54, '2023-09-08 21:21:06.101484', '1725', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.658827+00:00', 3, '', 6, 1),
(55, '2023-09-08 21:21:06.105485', '1724', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.523234+00:00', 3, '', 6, 1),
(56, '2023-09-08 21:21:06.108485', '1723', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.410933+00:00', 3, '', 6, 1),
(57, '2023-09-08 21:21:06.112484', '1722', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.271879+00:00', 3, '', 6, 1),
(58, '2023-09-08 21:21:06.116485', '1721', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.195831+00:00', 3, '', 6, 1),
(59, '2023-09-08 21:21:06.122484', '1720', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:21.044293+00:00', 3, '', 6, 1),
(60, '2023-09-08 21:21:06.125484', '1719', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:20.863921+00:00', 3, '', 6, 1),
(61, '2023-09-08 21:21:06.129484', '1718', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:20.711416+00:00', 3, '', 6, 1),
(62, '2023-09-08 21:21:06.134485', '1717', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:20.515533+00:00', 3, '', 6, 1),
(63, '2023-09-08 21:21:06.139484', '1716', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:20.358474+00:00', 3, '', 6, 1),
(64, '2023-09-08 21:21:06.143485', '1715', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:20.130674+00:00', 3, '', 6, 1),
(65, '2023-09-08 21:21:06.147484', '1714', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.911676+00:00', 3, '', 6, 1),
(66, '2023-09-08 21:21:06.152485', '1713', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.818196+00:00', 3, '', 6, 1),
(67, '2023-09-08 21:21:06.156484', '1712', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.704227+00:00', 3, '', 6, 1),
(68, '2023-09-08 21:21:06.160502', '1711', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.531189+00:00', 3, '', 6, 1),
(69, '2023-09-08 21:21:06.165484', '1710', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.319191+00:00', 3, '', 6, 1),
(70, '2023-09-08 21:21:06.169485', '1709', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.233189+00:00', 3, '', 6, 1),
(71, '2023-09-08 21:21:06.174485', '1708', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.145191+00:00', 3, '', 6, 1),
(72, '2023-09-08 21:21:06.178485', '1707', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:19.068189+00:00', 3, '', 6, 1),
(73, '2023-09-08 21:21:06.182485', '1706', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.948189+00:00', 3, '', 6, 1),
(74, '2023-09-08 21:21:06.189485', '1705', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.836199+00:00', 3, '', 6, 1),
(75, '2023-09-08 21:21:06.193483', '1704', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.733192+00:00', 3, '', 6, 1),
(76, '2023-09-08 21:21:06.197483', '1703', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.672076+00:00', 3, '', 6, 1),
(77, '2023-09-08 21:21:06.202485', '1702', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.609075+00:00', 3, '', 6, 1),
(78, '2023-09-08 21:21:06.207484', '1701', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.511078+00:00', 3, '', 6, 1),
(79, '2023-09-08 21:21:06.211484', '1700', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.367077+00:00', 3, '', 6, 1),
(80, '2023-09-08 21:21:06.215484', '1699', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.251077+00:00', 3, '', 6, 1),
(81, '2023-09-08 21:21:06.219485', '1698', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.160076+00:00', 3, '', 6, 1),
(82, '2023-09-08 21:21:06.224483', '1697', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:18.076077+00:00', 3, '', 6, 1),
(83, '2023-09-08 21:21:06.228484', '1696', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.952081+00:00', 3, '', 6, 1),
(84, '2023-09-08 21:21:06.232485', '1695', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.865121+00:00', 3, '', 6, 1),
(85, '2023-09-08 21:21:06.237484', '1694', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.762076+00:00', 3, '', 6, 1),
(86, '2023-09-08 21:21:06.241485', '1693', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.680548+00:00', 3, '', 6, 1),
(87, '2023-09-08 21:21:06.245483', '1692', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.590556+00:00', 3, '', 6, 1),
(88, '2023-09-08 21:21:06.249484', '1691', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.464547+00:00', 3, '', 6, 1),
(89, '2023-09-08 21:21:06.255485', '1690', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.407547+00:00', 3, '', 6, 1),
(90, '2023-09-08 21:21:06.261483', '1689', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.271545+00:00', 3, '', 6, 1),
(91, '2023-09-08 21:21:06.268488', '1688', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.136546+00:00', 3, '', 6, 1),
(92, '2023-09-08 21:21:06.274482', '1687', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:17.024042+00:00', 3, '', 6, 1),
(93, '2023-09-08 21:21:06.279489', '1686', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.867031+00:00', 3, '', 6, 1),
(94, '2023-09-08 21:21:06.286486', '1685', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.776029+00:00', 3, '', 6, 1),
(95, '2023-09-08 21:21:06.292483', '1684', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.695028+00:00', 3, '', 6, 1),
(96, '2023-09-08 21:21:06.297484', '1683', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.555032+00:00', 3, '', 6, 1),
(97, '2023-09-08 21:21:06.302502', '1682', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.487029+00:00', 3, '', 6, 1),
(98, '2023-09-08 21:21:06.305520', '1681', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.442032+00:00', 3, '', 6, 1),
(99, '2023-09-08 21:21:06.309483', '1680', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.355027+00:00', 3, '', 6, 1),
(100, '2023-09-08 21:21:06.312489', '1679', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.308033+00:00', 3, '', 6, 1),
(101, '2023-09-08 21:21:06.314485', '1678', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.254027+00:00', 3, '', 6, 1),
(102, '2023-09-08 21:21:06.319514', '1677', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.127431+00:00', 3, '', 6, 1),
(103, '2023-09-08 21:21:06.322484', '1676', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:16.008434+00:00', 3, '', 6, 1),
(104, '2023-09-08 21:21:06.327489', '1675', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.917433+00:00', 3, '', 6, 1),
(105, '2023-09-08 21:21:06.329485', '1674', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.844432+00:00', 3, '', 6, 1),
(106, '2023-09-08 21:21:06.332484', '1673', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.806434+00:00', 3, '', 6, 1),
(107, '2023-09-08 21:21:06.337491', '1672', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.723433+00:00', 3, '', 6, 1),
(108, '2023-09-08 21:21:06.343487', '1671', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.646434+00:00', 3, '', 6, 1),
(109, '2023-09-08 21:21:06.347517', '1670', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.587434+00:00', 3, '', 6, 1),
(110, '2023-09-08 21:21:06.351485', '1669', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.501431+00:00', 3, '', 6, 1),
(111, '2023-09-08 21:21:06.354488', '1668', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.449433+00:00', 3, '', 6, 1),
(112, '2023-09-08 21:21:06.358485', '1667', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.338442+00:00', 3, '', 6, 1),
(113, '2023-09-08 21:21:06.360485', '1666', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.249438+00:00', 3, '', 6, 1),
(114, '2023-09-08 21:21:06.365488', '1665', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.157851+00:00', 3, '', 6, 1),
(115, '2023-09-08 21:21:06.369501', '1664', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.110852+00:00', 3, '', 6, 1),
(116, '2023-09-08 21:21:06.376486', '1663', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:15.015853+00:00', 3, '', 6, 1),
(117, '2023-09-08 21:21:06.380484', '1662', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.942854+00:00', 3, '', 6, 1),
(118, '2023-09-08 21:21:06.383484', '1661', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.847854+00:00', 3, '', 6, 1),
(119, '2023-09-08 21:21:06.387484', '1660', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.709855+00:00', 3, '', 6, 1),
(120, '2023-09-08 21:21:06.391521', '1659', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.597849+00:00', 3, '', 6, 1),
(121, '2023-09-08 21:21:06.394484', '1658', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.471850+00:00', 3, '', 6, 1),
(122, '2023-09-08 21:21:06.396484', '1657', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.422860+00:00', 3, '', 6, 1),
(123, '2023-09-08 21:21:06.399486', '1656', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.336852+00:00', 3, '', 6, 1),
(124, '2023-09-08 21:21:06.405493', '1655', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.290849+00:00', 3, '', 6, 1),
(125, '2023-09-08 21:21:06.410486', '1654', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.213851+00:00', 3, '', 6, 1),
(126, '2023-09-08 21:21:06.413484', '1653', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.165332+00:00', 3, '', 6, 1),
(127, '2023-09-08 21:21:06.416484', '1652', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:14.081323+00:00', 3, '', 6, 1),
(128, '2023-09-08 21:21:06.420486', '1651', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-09-08 20:38:13.986323+00:00', 3, '', 6, 1),
(129, '2023-09-08 21:22:35.132441', '5', 'PurchaseRequest object (5)', 3, '', 16, 1),
(130, '2023-09-08 22:55:59.561145', '1830', 'apps.asset_management.backend.src.utils.trading.match_traders_request', 3, '', 7, 1),
(131, '2023-09-08 22:55:59.568671', '1829', 'apps.asset_management.backend.src.utils.trading.match_traders_request', 3, '', 7, 1),
(132, '2023-09-08 22:55:59.572665', '1828', 'apps.asset_management.backend.src.utils.trading.match_traders_request', 3, '', 7, 1);

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
('9lno6qndocwvjegnurkl4l8dbaa9py4m', '.eJxVzEEOwiAQheG7sDbEDh2kLt17BjLMgK02kEC7Mt7dNulCt-9_-d7K07qMfm2x-knUVRl1-t0C8SvmPciT8qNoLnmpU9D7RR-16XuRON-O7x8wUht3ljoxBqyF2ENgJ8GQcDIXC4CMHQy9kEtntgiEyaLBkAA6dDalgd2GTnmJNdPsY62lbqb6fAF8vz50:1qehWh:iqRiJuk5CuLWtCqvx1nZmhiGpzhCY2fn7Onu_EPkQ5U', '2023-09-22 19:52:23.581970'),
('au17sdcsd2jn08h1g27gg1jbxpi6dakp', '.eJxVjMEOwiAQRP-FsyFQkKUevfsNZNkFqRpISnsy_rtt0oNmbvPezFsEXJcS1p7mMLG4CC1Ov11Eeqa6A35gvTdJrS7zFOWuyIN2eWucXtfD_Tso2Mu2Buu0ZYXE5IfBEQOZTAaVSwCDM97mMZM-kzfjFrQ2Q1SQNRuGmEfx-QLflTfi:1qefxC:VzSrQr9TCrkz3v5RltyMP_rm0OA2ug6XfgoZM62fgno', '2023-09-22 18:11:38.692885'),
('oayv7rvvlzyofoqgc93hxm07zb7kiw9b', '.eJxVjDsOwjAQBe_iGll2PopNSc8ZrPXuCwlEtuQ4FeLuJFIKaGfem7cKtNUpbCtKmEVdlVeXXxaJX0iHkCelR9acUy1z1MdEn3bV9yxYbuf2LzDROu1vS30LJuMbJtjWmp6ETeO7aCEDuZ3Djs4N0Yn0njHEkRt0Bq0dgSM6p4qSaAkoJZe9qT5fvqo_8A:1qeivA:tKkq-wPJm197EAJdkb2Hv9am1RQF2uQiXeFcGFSTpuo', '2023-09-22 21:21:44.414412'),
('rf8xcrgu9kkj9pj0xbvh9j9u6sm54mus', '.eJxVjMEOwiAQBf-FsyFAYQsevfcbyFJWQRtIKD0Z_9026UGvb-bNm3ncevLbSs3nyK5Ms8vvFnB-UTlAfGJ5VD7X0lsO_FD4SVc-1UjL7XT_AgnXtL_BahR3lMoajE7RiGDUYNUsHdkhCmHBUIDRjRIQAEMwehBSRBOMcgL2aC6dWsHFU2u17U32-QJSwD2E:1qejIU:-QvPjmTeXfBzykyC6vxP3POT9WzWuYK8-NebMOwoerM', '2023-09-22 21:45:50.367484');

-- --------------------------------------------------------

--
-- Table structure for table `fundstransfermethod`
--

CREATE TABLE `fundstransfermethod` (
  `IdPaymentMethod` int(11) NOT NULL,
  `AccessKey` varchar(64) NOT NULL,
  `MakeBeliefBalance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fundstransfermethod`
--

INSERT INTO `fundstransfermethod` (`IdPaymentMethod`, `AccessKey`, `MakeBeliefBalance`) VALUES
(1, 'HELLO WORLDS!', 9990970.10),
(2, 'hi', 8849.90),
(3, 'hello', 1180.00);

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

--
-- Dumping data for table `makebeliefowns`
--

INSERT INTO `makebeliefowns` (`id`, `Quantity`, `IdAsset`, `IdPaymentMethod`) VALUES
(1, 9950, 2, 2),
(2, 50, 2, 1);

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

--
-- Dumping data for table `textfile`
--

INSERT INTO `textfile` (`FilePath`) VALUES
('brokerApprovalContract/file/AlexBroker'),
('broker_basicuser_contract/file/AlexBroker/Alex');

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

--
-- Dumping data for table `trader`
--

INSERT INTO `trader` (`IdUser`, `Birthday`, `Sex`, `TermsAcceptanceTime`, `IdCountry`, `IdSelectedFundsTrasnferMethod`) VALUES
(3, '2000-09-14', 'Male', '2023-09-08 18:28:58.000000', 1, 2),
(4, '2000-09-14', 'Male', '2023-09-08 18:32:48.000000', 1, 1),
(9, '2000-09-14', 'Male', '2023-09-08 18:45:23.000000', 1, 3);

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
('2023-09-08 18:48:34.305357', 1, '', '', 1, 1, '2023-09-08 18:09:10.482783', 1, 'admin', 'pbkdf2_sha256$600000$6cpSEYYUPZsZtyyRj3g0FA$ZcN2bpt8p65oI/vCClh//lNf7ef2+t1edyEuJvbjX3A=', 'admin'),
('2023-09-08 19:25:25.398269', 0, '', '', 0, 1, '2023-09-08 18:28:46.644863', 3, 'Jim Morrison', 'pbkdf2_sha256$600000$8QylsmDGkpBl4PQfuCSmMi$UKFlQvuqsE1EHsPLqdrx4QJGruxqdE6GTMDtXqXuX2E=', 'jim@morrison.com'),
('2023-09-08 19:21:30.892951', 0, '', '', 0, 1, '2023-09-08 18:32:24.511644', 4, 'Alex', 'pbkdf2_sha256$600000$aylOsPjzcbHhyajw7AqLKB$f/mV6s3pjfbh8d1zNggVJ92EoItI8pkxk5y+xF1PSpY=', 'alex@alex.com'),
('2023-09-08 19:25:33.497366', 0, '', '', 0, 1, '2023-09-08 18:45:03.488049', 9, 'AlexBroker', 'pbkdf2_sha256$600000$MnwmtU0ufkCXYLlBwEaR6V$Ozq640ZqAHonPYE/Zzzs0rvS4Xi//JIrA+CXX1iXHuI=', 'alex2@alex2.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, 1),
(2, 4, 1),
(5, 9, 1);

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
  MODIFY `IdAsset` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1832;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1827;

--
-- AUTO_INCREMENT for table `brokerbasicusercontract`
--
ALTER TABLE `brokerbasicusercontract`
  MODIFY `IdContract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `IdCountry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

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
  MODIFY `IdPaymentMethod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `makebeliefowns`
--
ALTER TABLE `makebeliefowns`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchaserequest`
--
ALTER TABLE `purchaserequest`
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `salesrequest`
--
ALTER TABLE `salesrequest`
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
