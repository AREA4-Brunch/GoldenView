-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2023 at 01:39 PM
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
-- Table structure for table `activetraderequest`
--

CREATE TABLE `activetraderequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `QuantityRequested` int(11) NOT NULL,
  `TotalTransactionsPrice` decimal(10,2) NOT NULL,
  `QuantityRequired` int(11) NOT NULL,
  `IdAsset` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activetraderequest`
--

INSERT INTO `activetraderequest` (`IdTradeRequest`, `QuantityRequested`, `TotalTransactionsPrice`, `QuantityRequired`, `IdAsset`, `IdUser`) VALUES
(103, 100, 9310.00, 51, 2, 19),
(106, 10, 0.00, 10, 3, 17),
(109, 10, 1250.00, 5, 2, 17);

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
(25);

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
('brokerApprovalContract/file/MrBroker', 'User is approved to become a Broker');

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
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add country', 7, 'add_country'),
(26, 'Can change country', 7, 'change_country'),
(27, 'Can delete country', 7, 'delete_country'),
(28, 'Can view country', 7, 'view_country'),
(29, 'Can add funds transfer method', 8, 'add_fundstransfermethod'),
(30, 'Can change funds transfer method', 8, 'change_fundstransfermethod'),
(31, 'Can delete funds transfer method', 8, 'delete_fundstransfermethod'),
(32, 'Can view funds transfer method', 8, 'view_fundstransfermethod'),
(33, 'Can add administrator', 9, 'add_administrator'),
(34, 'Can change administrator', 9, 'change_administrator'),
(35, 'Can delete administrator', 9, 'delete_administrator'),
(36, 'Can view administrator', 9, 'view_administrator'),
(37, 'Can add trader', 10, 'add_trader'),
(38, 'Can change trader', 10, 'change_trader'),
(39, 'Can delete trader', 10, 'delete_trader'),
(40, 'Can view trader', 10, 'view_trader'),
(41, 'Can add basic user', 11, 'add_basicuser'),
(42, 'Can change basic user', 11, 'change_basicuser'),
(43, 'Can delete basic user', 11, 'delete_basicuser'),
(44, 'Can view basic user', 11, 'view_basicuser'),
(45, 'Can add broker', 12, 'add_broker'),
(46, 'Can change broker', 12, 'change_broker'),
(47, 'Can delete broker', 12, 'delete_broker'),
(48, 'Can view broker', 12, 'view_broker'),
(49, 'Can add make belief owns', 13, 'add_makebeliefowns'),
(50, 'Can change make belief owns', 13, 'change_makebeliefowns'),
(51, 'Can delete make belief owns', 13, 'delete_makebeliefowns'),
(52, 'Can view make belief owns', 13, 'view_makebeliefowns'),
(53, 'Can add asset', 14, 'add_asset'),
(54, 'Can change asset', 14, 'change_asset'),
(55, 'Can delete asset', 14, 'delete_asset'),
(56, 'Can view asset', 14, 'view_asset'),
(57, 'Can add active trade request', 15, 'add_activetraderequest'),
(58, 'Can change active trade request', 15, 'change_activetraderequest'),
(59, 'Can delete active trade request', 15, 'delete_activetraderequest'),
(60, 'Can view active trade request', 15, 'view_activetraderequest'),
(61, 'Can add sales request', 16, 'add_salesrequest'),
(62, 'Can change sales request', 16, 'change_salesrequest'),
(63, 'Can delete sales request', 16, 'delete_salesrequest'),
(64, 'Can view sales request', 16, 'view_salesrequest'),
(65, 'Can add purchase request', 17, 'add_purchaserequest'),
(66, 'Can change purchase request', 17, 'change_purchaserequest'),
(67, 'Can delete purchase request', 17, 'delete_purchaserequest'),
(68, 'Can view purchase request', 17, 'view_purchaserequest'),
(69, 'Can add is binded by contract', 18, 'add_isbindedbycontract'),
(70, 'Can change is binded by contract', 18, 'change_isbindedbycontract'),
(71, 'Can delete is binded by contract', 18, 'delete_isbindedbycontract'),
(72, 'Can view is binded by contract', 18, 'view_isbindedbycontract'),
(73, 'Can add broker basic user contract', 19, 'add_brokerbasicusercontract'),
(74, 'Can change broker basic user contract', 19, 'change_brokerbasicusercontract'),
(75, 'Can delete broker basic user contract', 19, 'delete_brokerbasicusercontract'),
(76, 'Can view broker basic user contract', 19, 'view_brokerbasicusercontract'),
(77, 'Can add broker', 20, 'add_broker'),
(78, 'Can change broker', 20, 'change_broker'),
(79, 'Can delete broker', 20, 'delete_broker'),
(80, 'Can view broker', 20, 'view_broker'),
(81, 'Can add broker basic user contract file', 21, 'add_brokerbasicusercontractfile'),
(82, 'Can change broker basic user contract file', 21, 'change_brokerbasicusercontractfile'),
(83, 'Can delete broker basic user contract file', 21, 'delete_brokerbasicusercontractfile'),
(84, 'Can view broker basic user contract file', 21, 'view_brokerbasicusercontractfile'),
(85, 'Can add text file', 22, 'add_textfile'),
(86, 'Can change text file', 22, 'change_textfile'),
(87, 'Can delete text file', 22, 'delete_textfile'),
(88, 'Can view text file', 22, 'view_textfile'),
(89, 'Can add broker request file', 23, 'add_brokerrequestfile'),
(90, 'Can change broker request file', 23, 'change_brokerrequestfile'),
(91, 'Can delete broker request file', 23, 'delete_brokerrequestfile'),
(92, 'Can view broker request file', 23, 'view_brokerrequestfile'),
(93, 'Can add approval report file', 24, 'add_approvalreportfile'),
(94, 'Can change approval report file', 24, 'change_approvalreportfile'),
(95, 'Can delete approval report file', 24, 'delete_approvalreportfile'),
(96, 'Can view approval report file', 24, 'view_approvalreportfile'),
(97, 'Can add completed task', 25, 'add_completedtask'),
(98, 'Can change completed task', 25, 'change_completedtask'),
(99, 'Can delete completed task', 25, 'delete_completedtask'),
(100, 'Can view completed task', 25, 'view_completedtask'),
(101, 'Can add task', 26, 'add_task'),
(102, 'Can change task', 26, 'change_task'),
(103, 'Can delete task', 26, 'delete_task'),
(104, 'Can view task', 26, 'view_task'),
(105, 'Can add make belief owns', 27, 'add_makebeliefowns'),
(106, 'Can change make belief owns', 27, 'change_makebeliefowns'),
(107, 'Can delete make belief owns', 27, 'delete_makebeliefowns'),
(108, 'Can view make belief owns', 27, 'view_makebeliefowns');

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
(63, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[], {\"is_purchase_request\": true, \"request_id\": 109}]', 'dd99858db18de6c7daadf81977ed6e1066cd3035', NULL, 0, '2023-06-20 23:09:57.405425', 0, NULL, 'match_requests', 1, NULL, '', '13564', '2023-06-20 23:09:57.367526', NULL, NULL),
(64, 'apps.asset_management.backend.src.utils.trading.match_traders_request', '[[], {\"is_purchase_request\": false, \"request_id\": 110}]', '951fce82404abab785fcdc3464d61e87db83e8ba', NULL, 0, '2023-06-20 23:10:12.554018', 0, NULL, 'match_requests', 1, NULL, '', '13564', '2023-06-20 23:10:12.473234', NULL, NULL);

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
(17),
(18),
(19),
(23),
(26),
(29);

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
(19),
(23);

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
(3, '2023-06-21 02:54:14.304823', '2023-06-21 03:12:30.442769', 1, 10, '2024-06-20 02:54:14.304823', 'broker_basicuser_contract/file/MrBroker/Alex', 18, 23);

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
('broker_basicuser_contract/file/MrBroker/Alex', 'It is very reasonable mate!');

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
(1, '2023-05-27 22:06:37.389377', '1', 'Country object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-05-27 23:11:55.227656', '2', 'Jim Morrison', 3, '', 6, 1),
(3, '2023-05-27 23:15:35.025695', '2', 'Jim Morrison', 3, '', 6, 1),
(4, '2023-05-27 23:19:20.393971', '2', 'Jim Morrison', 3, '', 6, 1),
(5, '2023-05-27 23:54:38.404318', '8', 'Alex2', 3, '', 6, 1),
(6, '2023-05-27 23:54:51.062353', '5', 'Alex', 3, '', 6, 1),
(7, '2023-05-28 00:23:00.386970', '10', 'asaas', 3, '', 6, 1),
(8, '2023-05-28 00:23:00.386970', '9', 'Alex', 3, '', 6, 1),
(9, '2023-06-03 11:14:35.211728', '1', 'can_trade', 1, '[{\"added\": {}}]', 3, 1),
(10, '2023-06-03 11:24:11.500684', '12', 'assao', 3, '', 6, 1),
(11, '2023-06-03 11:24:11.503673', '11', 'Alex', 3, '', 6, 1),
(12, '2023-06-03 11:24:11.506467', '3', 'Jim Morrison', 3, '', 6, 1),
(13, '2023-06-04 18:46:49.361608', '1', 'Asset object (1)', 1, '[{\"added\": {}}]', 14, 1),
(14, '2023-06-06 01:51:51.069262', '1', 'FundsTransferMethod object (1)', 1, '[{\"added\": {}}]', 8, 1),
(15, '2023-06-06 01:52:10.660580', '17', 'Trader object (17)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 10, 1),
(16, '2023-06-06 01:55:21.961099', '1', 'MakeBeliefOwns object (1)', 1, '[{\"added\": {}}]', 27, 1),
(17, '2023-06-06 02:46:57.143107', '29', 'SalesRequest object (29)', 3, '', 16, 1),
(18, '2023-06-06 02:46:57.148096', '28', 'SalesRequest object (28)', 3, '', 16, 1),
(19, '2023-06-06 02:46:57.153081', '27', 'SalesRequest object (27)', 3, '', 16, 1),
(20, '2023-06-06 02:46:57.155079', '26', 'SalesRequest object (26)', 3, '', 16, 1),
(21, '2023-06-06 02:46:57.159823', '25', 'SalesRequest object (25)', 3, '', 16, 1),
(22, '2023-06-06 02:46:57.160815', '24', 'SalesRequest object (24)', 3, '', 16, 1),
(23, '2023-06-06 02:46:57.163807', '23', 'SalesRequest object (23)', 3, '', 16, 1),
(24, '2023-06-06 02:46:57.165801', '22', 'SalesRequest object (22)', 3, '', 16, 1),
(25, '2023-06-06 02:47:08.782628', '20', 'PurchaseRequest object (20)', 3, '', 17, 1),
(26, '2023-06-06 02:47:14.403957', '29', 'ActiveTradeRequest object (29)', 3, '', 15, 1),
(27, '2023-06-06 02:47:14.406945', '28', 'ActiveTradeRequest object (28)', 3, '', 15, 1),
(28, '2023-06-06 02:47:14.408944', '27', 'ActiveTradeRequest object (27)', 3, '', 15, 1),
(29, '2023-06-06 02:47:14.410933', '26', 'ActiveTradeRequest object (26)', 3, '', 15, 1),
(30, '2023-06-06 02:47:14.412929', '25', 'ActiveTradeRequest object (25)', 3, '', 15, 1),
(31, '2023-06-06 02:47:14.416918', '24', 'ActiveTradeRequest object (24)', 3, '', 15, 1),
(32, '2023-06-06 02:47:14.422910', '23', 'ActiveTradeRequest object (23)', 3, '', 15, 1),
(33, '2023-06-06 02:47:14.424897', '22', 'ActiveTradeRequest object (22)', 3, '', 15, 1),
(34, '2023-06-06 02:47:14.428889', '20', 'ActiveTradeRequest object (20)', 3, '', 15, 1),
(35, '2023-06-06 03:10:07.526411', '2', 'FundsTransferMethod object (2)', 1, '[{\"added\": {}}]', 8, 1),
(36, '2023-06-06 03:17:35.770015', '2', 'MakeBeliefOwns object (2)', 1, '[{\"added\": {}}]', 27, 1),
(37, '2023-06-06 03:26:13.787148', '36', 'SalesRequest object (36)', 3, '', 16, 1),
(38, '2023-06-06 03:26:13.795128', '35', 'SalesRequest object (35)', 3, '', 16, 1),
(39, '2023-06-06 03:26:13.797132', '34', 'SalesRequest object (34)', 3, '', 16, 1),
(40, '2023-06-06 03:26:13.799114', '33', 'SalesRequest object (33)', 3, '', 16, 1),
(41, '2023-06-06 03:26:23.355218', '36', 'ActiveTradeRequest object (36)', 3, '', 15, 1),
(42, '2023-06-06 03:26:23.365188', '35', 'ActiveTradeRequest object (35)', 3, '', 15, 1),
(43, '2023-06-06 03:26:23.369718', '34', 'ActiveTradeRequest object (34)', 3, '', 15, 1),
(44, '2023-06-06 03:26:23.372688', '33', 'ActiveTradeRequest object (33)', 3, '', 15, 1),
(45, '2023-06-06 03:29:03.785673', '1', 'MakeBeliefOwns object (1)', 3, '', 27, 1),
(46, '2023-06-06 03:29:42.973241', '2', 'MakeBeliefOwns object (2)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(47, '2023-06-06 03:35:07.579022', '18', 'Trader object (18)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 10, 1),
(48, '2023-06-06 03:35:28.279021', '39', 'SalesRequest object (39)', 3, '', 16, 1),
(49, '2023-06-06 03:35:48.633730', '39', 'ActiveTradeRequest object (39)', 3, '', 15, 1),
(50, '2023-06-06 03:36:57.445504', '40', 'SalesRequest object (40)', 3, '', 16, 1),
(51, '2023-06-06 03:37:21.164082', '40', 'ActiveTradeRequest object (40)', 3, '', 15, 1),
(52, '2023-06-06 03:38:19.781418', '41', 'SalesRequest object (41)', 3, '', 16, 1),
(53, '2023-06-06 03:38:47.869706', '41', 'ActiveTradeRequest object (41)', 3, '', 15, 1),
(54, '2023-06-06 03:46:52.832630', '2', 'MakeBeliefOwns object (2)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(55, '2023-06-06 03:59:03.134165', '45', 'SalesRequest object (45)', 3, '', 16, 1),
(56, '2023-06-06 03:59:13.257591', '45', 'ActiveTradeRequest object (45)', 3, '', 15, 1),
(57, '2023-06-06 03:59:27.657579', '1', 'MakeBeliefOwns object (1)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(58, '2023-06-06 03:59:38.098835', '1', 'MakeBeliefOwns object (1)', 3, '', 27, 1),
(59, '2023-06-06 03:59:49.174504', '1', 'FundsTransferMethod object (1)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(60, '2023-06-06 03:59:55.618921', '2', 'FundsTransferMethod object (2)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(61, '2023-06-06 04:36:29.371974', '49', 'ActiveTradeRequest object (49)', 2, '[{\"changed\": {\"fields\": [\"Quantityrequired\"]}}]', 15, 1),
(62, '2023-06-06 05:14:12.792764', '19', 'Broker object (19)', 1, '[{\"added\": {}}]', 20, 1),
(63, '2023-06-06 05:17:25.529924', 'dummy_path', 'TextFile object (dummy_path)', 1, '[{\"added\": {}}]', 22, 1),
(64, '2023-06-06 05:17:37.497366', 'dummy_path', 'BrokerBasicUserContractFile object (dummy_path)', 1, '[{\"added\": {}}]', 21, 1),
(65, '2023-06-06 05:18:01.476210', '1', 'BrokerBasicUserContract object (1)', 1, '[{\"added\": {}}]', 19, 1),
(66, '2023-06-06 05:52:32.976985', '53', 'SalesRequest object (53)', 3, '', 16, 1),
(67, '2023-06-06 05:52:32.985959', '52', 'SalesRequest object (52)', 3, '', 16, 1),
(68, '2023-06-06 05:52:32.988951', '50', 'SalesRequest object (50)', 3, '', 16, 1),
(69, '2023-06-06 05:52:39.264807', '51', 'PurchaseRequest object (51)', 3, '', 17, 1),
(70, '2023-06-06 05:52:44.881537', '53', 'ActiveTradeRequest object (53)', 3, '', 15, 1),
(71, '2023-06-06 05:52:44.886524', '52', 'ActiveTradeRequest object (52)', 3, '', 15, 1),
(72, '2023-06-06 05:52:44.888518', '51', 'ActiveTradeRequest object (51)', 3, '', 15, 1),
(73, '2023-06-06 05:52:44.891513', '50', 'ActiveTradeRequest object (50)', 3, '', 15, 1),
(74, '2023-06-06 05:58:21.332823', '54', 'ActiveTradeRequest object (54)', 2, '[{\"changed\": {\"fields\": [\"Quantityrequired\"]}}]', 15, 1),
(75, '2023-06-06 05:59:14.380272', '1', 'MakeBeliefOwns object (1)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(76, '2023-06-06 05:59:48.702401', '54', 'SalesRequest object (54)', 3, '', 16, 1),
(77, '2023-06-06 05:59:53.213318', '57', 'PurchaseRequest object (57)', 3, '', 17, 1),
(78, '2023-06-06 05:59:53.221277', '56', 'PurchaseRequest object (56)', 3, '', 17, 1),
(79, '2023-06-06 05:59:59.025514', '57', 'ActiveTradeRequest object (57)', 3, '', 15, 1),
(80, '2023-06-06 05:59:59.033478', '56', 'ActiveTradeRequest object (56)', 3, '', 15, 1),
(81, '2023-06-06 05:59:59.038473', '54', 'ActiveTradeRequest object (54)', 3, '', 15, 1),
(82, '2023-06-06 06:02:45.132418', '58', 'PurchaseRequest object (58)', 3, '', 17, 1),
(83, '2023-06-06 06:02:51.242993', '58', 'ActiveTradeRequest object (58)', 3, '', 15, 1),
(84, '2023-06-06 06:03:25.866852', '1', 'FundsTransferMethod object (1)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(85, '2023-06-06 06:03:34.235611', '2', 'FundsTransferMethod object (2)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(86, '2023-06-06 06:03:42.833044', '1', 'MakeBeliefOwns object (1)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(87, '2023-06-06 06:03:50.762492', '2', 'MakeBeliefOwns object (2)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 27, 1),
(88, '2023-06-06 06:04:03.751493', '61', 'SalesRequest object (61)', 3, '', 16, 1),
(89, '2023-06-06 06:04:10.091747', '60', 'PurchaseRequest object (60)', 3, '', 17, 1),
(90, '2023-06-06 06:04:22.055144', '61', 'ActiveTradeRequest object (61)', 3, '', 15, 1),
(91, '2023-06-06 06:04:22.057511', '60', 'ActiveTradeRequest object (60)', 3, '', 15, 1),
(92, '2023-06-06 06:06:11.404774', '62', 'PurchaseRequest object (62)', 3, '', 17, 1),
(93, '2023-06-06 06:06:16.230548', '62', 'ActiveTradeRequest object (62)', 3, '', 15, 1),
(94, '2023-06-06 06:10:50.551901', '64', 'PurchaseRequest object (64)', 3, '', 17, 1),
(95, '2023-06-06 06:10:57.080081', '64', 'ActiveTradeRequest object (64)', 3, '', 15, 1),
(96, '2023-06-06 06:13:50.320571', '66', 'PurchaseRequest object (66)', 3, '', 17, 1),
(97, '2023-06-06 06:13:56.928742', '66', 'ActiveTradeRequest object (66)', 3, '', 15, 1),
(98, '2023-06-06 06:16:10.700441', '68', 'PurchaseRequest object (68)', 3, '', 17, 1),
(99, '2023-06-06 06:16:17.574074', '68', 'ActiveTradeRequest object (68)', 3, '', 15, 1),
(100, '2023-06-06 06:17:50.109309', '70', 'PurchaseRequest object (70)', 3, '', 17, 1),
(101, '2023-06-06 06:17:55.403549', '70', 'ActiveTradeRequest object (70)', 3, '', 15, 1),
(102, '2023-06-06 06:19:11.539893', '3', 'FundsTransferMethod object (3)', 1, '[{\"added\": {}}]', 8, 1),
(103, '2023-06-06 06:19:26.411143', '19', 'Trader object (19)', 2, '[{\"changed\": {\"fields\": [\"Idselectedfundstrasnfermethod\"]}}]', 10, 1),
(104, '2023-06-06 06:19:33.843588', '72', 'PurchaseRequest object (72)', 3, '', 17, 1),
(105, '2023-06-06 06:19:39.311014', '72', 'ActiveTradeRequest object (72)', 3, '', 15, 1),
(106, '2023-06-06 06:22:45.748086', '74', 'PurchaseRequest object (74)', 3, '', 17, 1),
(107, '2023-06-06 06:22:50.613818', '74', 'ActiveTradeRequest object (74)', 3, '', 15, 1),
(108, '2023-06-06 06:23:36.164720', '76', 'PurchaseRequest object (76)', 3, '', 17, 1),
(109, '2023-06-06 06:23:41.283316', '76', 'ActiveTradeRequest object (76)', 3, '', 15, 1),
(110, '2023-06-06 06:24:48.063847', '78', 'PurchaseRequest object (78)', 3, '', 17, 1),
(111, '2023-06-06 06:24:52.901872', '78', 'ActiveTradeRequest object (78)', 3, '', 15, 1),
(112, '2023-06-12 14:48:21.970429', '93', 'PurchaseRequest object (93)', 2, '[{\"changed\": {\"fields\": [\"Unitpriceupperbound\"]}}]', 17, 1),
(113, '2023-06-12 14:49:02.196977', '93', 'ActiveTradeRequest object (93)', 2, '[{\"changed\": {\"fields\": [\"Totaltransactionsprice\"]}}]', 15, 1),
(114, '2023-06-12 15:27:35.864632', '93', 'PurchaseRequest object (93)', 2, '[{\"changed\": {\"fields\": [\"Unitpriceupperbound\"]}}]', 17, 1),
(115, '2023-06-19 20:36:01.039617', 'broker_request/file/Jim Morrison', 'TextFile object (broker_request/file/Jim Morrison)', 3, '', 22, 1),
(116, '2023-06-19 20:36:23.025976', 'broker_request/file/Jim Morrison', '', 3, '', 23, 1),
(117, '2023-06-19 20:36:35.145638', 'broker_request/file/Jim Morrison', 'TextFile object (broker_request/file/Jim Morrison)', 3, '', 22, 1),
(118, '2023-06-19 20:36:46.265060', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(119, '2023-06-19 20:54:58.427814', '2', 'Asset object (2)', 1, '[{\"added\": {}}]', 14, 1),
(120, '2023-06-19 21:09:46.702074', 'broker_request/file/Jim Morrison', '', 3, '', 23, 1),
(121, '2023-06-20 20:28:37.437790', '1', 'MakeBeliefOwns object (1)', 1, '[{\"added\": {}}]', 27, 1),
(122, '2023-06-20 20:29:39.859355', '2', 'MakeBeliefOwns object (2)', 1, '[{\"added\": {}}]', 27, 1),
(123, '2023-06-20 20:29:59.277042', '3', 'MakeBeliefOwns object (3)', 1, '[{\"added\": {}}]', 27, 1),
(124, '2023-06-20 20:30:07.329474', '4', 'MakeBeliefOwns object (4)', 1, '[{\"added\": {}}]', 27, 1),
(125, '2023-06-20 20:33:08.236681', '101', 'PurchaseRequest object (101)', 3, '', 17, 1),
(126, '2023-06-20 20:33:08.246655', '98', 'PurchaseRequest object (98)', 3, '', 17, 1),
(127, '2023-06-20 20:33:08.248649', '95', 'PurchaseRequest object (95)', 3, '', 17, 1),
(128, '2023-06-20 20:33:08.250644', '94', 'PurchaseRequest object (94)', 3, '', 17, 1),
(129, '2023-06-20 20:33:08.252638', '82', 'PurchaseRequest object (82)', 3, '', 17, 1),
(130, '2023-06-20 20:33:17.038061', '102', 'SalesRequest object (102)', 3, '', 16, 1),
(131, '2023-06-20 20:33:17.041051', '97', 'SalesRequest object (97)', 3, '', 16, 1),
(132, '2023-06-20 20:33:27.769322', '102', 'ActiveTradeRequest object (102)', 3, '', 15, 1),
(133, '2023-06-20 20:33:27.775314', '101', 'ActiveTradeRequest object (101)', 3, '', 15, 1),
(134, '2023-06-20 20:33:27.778297', '98', 'ActiveTradeRequest object (98)', 3, '', 15, 1),
(135, '2023-06-20 20:33:27.780292', '97', 'ActiveTradeRequest object (97)', 3, '', 15, 1),
(136, '2023-06-20 20:33:27.785278', '95', 'ActiveTradeRequest object (95)', 3, '', 15, 1),
(137, '2023-06-20 20:33:27.791270', '94', 'ActiveTradeRequest object (94)', 3, '', 15, 1),
(138, '2023-06-20 20:33:27.794255', '82', 'ActiveTradeRequest object (82)', 3, '', 15, 1),
(139, '2023-06-20 20:40:38.943404', '3', 'FundsTransferMethod object (3)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(140, '2023-06-20 21:10:58.481414', '62', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 21:09:26.615848+00:00', 3, '', 25, 1),
(141, '2023-06-20 21:10:58.494380', '61', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 21:08:26.357630+00:00', 3, '', 25, 1),
(142, '2023-06-20 21:10:58.497373', '60', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 20:59:50.634269+00:00', 3, '', 25, 1),
(143, '2023-06-20 21:10:58.499367', '59', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 20:51:04.959469+00:00', 3, '', 25, 1),
(144, '2023-06-20 21:10:58.501361', '58', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 20:38:18.660267+00:00', 3, '', 25, 1),
(145, '2023-06-20 21:10:58.503356', '57', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 20:31:12.720733+00:00', 3, '', 25, 1),
(146, '2023-06-20 21:10:58.511343', '56', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 11:31:35.657757+00:00', 3, '', 25, 1),
(147, '2023-06-20 21:10:58.513333', '55', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 11:30:55.141783+00:00', 3, '', 25, 1),
(148, '2023-06-20 21:10:58.516322', '54', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 11:30:24.836055+00:00', 3, '', 25, 1),
(149, '2023-06-20 21:10:58.518316', '53', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-20 11:28:49.444915+00:00', 3, '', 25, 1),
(150, '2023-06-20 21:10:58.521308', '52', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-19 20:13:18.988814+00:00', 3, '', 25, 1),
(151, '2023-06-20 21:10:58.527306', '51', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-19 18:01:55.670934+00:00', 3, '', 25, 1),
(152, '2023-06-20 21:10:58.530284', '50', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-19 18:00:04.965121+00:00', 3, '', 25, 1),
(153, '2023-06-20 21:10:58.533276', '49', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-12 16:56:27.946425+00:00', 3, '', 25, 1),
(154, '2023-06-20 21:10:58.535780', '48', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-12 09:38:15.634485+00:00', 3, '', 25, 1),
(155, '2023-06-20 21:10:58.537776', '47', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-12 09:37:10.457516+00:00', 3, '', 25, 1),
(156, '2023-06-20 21:10:58.543760', '46', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-12 00:05:26.795280+00:00', 3, '', 25, 1),
(157, '2023-06-20 21:10:58.546761', '45', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-11 18:47:42.070106+00:00', 3, '', 25, 1),
(158, '2023-06-20 21:10:58.549032', '44', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-11 18:27:44.693065+00:00', 3, '', 25, 1),
(159, '2023-06-20 21:10:58.550028', '43', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-10 17:49:54.814121+00:00', 3, '', 25, 1),
(160, '2023-06-20 21:10:58.552413', '42', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-10 17:49:54.446544+00:00', 3, '', 25, 1),
(161, '2023-06-20 21:10:58.559695', '41', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-10 17:49:39.241467+00:00', 3, '', 25, 1),
(162, '2023-06-20 21:10:58.565672', '40', 'apps.asset_management.backend.src.utils.trading.match_traders_request - 2023-06-06 02:39:53.674620+00:00', 3, '', 25, 1),
(163, '2023-06-20 21:25:27.204844', '3', 'Asset object (3)', 1, '[{\"added\": {}}]', 14, 1),
(164, '2023-06-20 21:31:53.639630', '12', 'MakeBeliefOwns object (12)', 1, '[{\"added\": {}}]', 27, 1),
(165, '2023-06-20 21:38:36.998477', '13', 'MakeBeliefOwns object (13)', 1, '[{\"added\": {}}]', 27, 1),
(166, '2023-06-20 23:59:36.785260', '22', 'BasicUser object (22)', 3, '', 11, 1),
(167, '2023-06-20 23:59:36.790247', '21', 'BasicUser object (21)', 3, '', 11, 1),
(168, '2023-06-20 23:59:36.793238', '20', 'BasicUser object (20)', 3, '', 11, 1),
(169, '2023-06-20 23:59:54.730692', '22', 'Sareni', 3, '', 6, 1),
(170, '2023-06-20 23:59:54.735679', '21', 'mira', 3, '', 6, 1),
(171, '2023-06-20 23:59:54.739667', '20', 'm', 3, '', 6, 1),
(172, '2023-06-21 00:01:14.566423', '2', 'Country object (2)', 1, '[{\"added\": {}}]', 7, 1),
(173, '2023-06-21 00:01:17.570382', '3', 'Country object (3)', 1, '[{\"added\": {}}]', 7, 1),
(174, '2023-06-21 00:01:24.043341', '4', 'Country object (4)', 1, '[{\"added\": {}}]', 7, 1),
(175, '2023-06-21 00:01:27.013603', '5', 'Country object (5)', 1, '[{\"added\": {}}]', 7, 1),
(176, '2023-06-21 00:01:29.632245', '6', 'Country object (6)', 1, '[{\"added\": {}}]', 7, 1),
(177, '2023-06-21 00:01:39.154275', '7', 'Country object (7)', 1, '[{\"added\": {}}]', 7, 1),
(178, '2023-06-21 00:02:36.531175', '3', 'FundsTransferMethod object (3)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(179, '2023-06-21 00:02:46.346695', '2', 'FundsTransferMethod object (2)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(180, '2023-06-21 00:02:54.108325', '1', 'FundsTransferMethod object (1)', 2, '[{\"changed\": {\"fields\": [\"Makebeliefbalance\"]}}]', 8, 1),
(181, '2023-06-21 01:05:06.558509', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(182, '2023-06-21 01:05:06.566487', 'broker_request/file/m', 'TextFile object (broker_request/file/m)', 3, '', 22, 1),
(183, '2023-06-21 01:05:06.569478', 'broker_request/file/Jim Morrison', 'TextFile object (broker_request/file/Jim Morrison)', 3, '', 22, 1),
(184, '2023-06-21 01:05:23.398409', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(185, '2023-06-21 01:05:23.401401', 'broker_request/file/m', 'TextFile object (broker_request/file/m)', 3, '', 22, 1),
(186, '2023-06-21 01:05:23.404393', 'broker_request/file/Jim Morrison', 'TextFile object (broker_request/file/Jim Morrison)', 3, '', 22, 1),
(187, '2023-06-21 01:05:54.621439', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(188, '2023-06-21 01:06:16.177910', 'broker_request/file/m', '', 3, '', 23, 1),
(189, '2023-06-21 01:06:32.983126', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(191, '2023-06-21 01:10:13.140064', '1', 'BrokerBasicUserContract object (1)', 3, '', 19, 1),
(192, '2023-06-21 01:10:28.196823', 'dummy_path', 'You wish you knew!', 3, '', 21, 1),
(193, '2023-06-21 01:10:49.035595', 'dummy_path', 'TextFile object (dummy_path)', 3, '', 22, 1),
(194, '2023-06-21 01:11:36.905003', 'broker_request/file/m', 'TextFile object (broker_request/file/m)', 3, '', 22, 1),
(195, '2023-06-21 01:11:36.911983', 'broker_request/file/Jim Morrison', 'TextFile object (broker_request/file/Jim Morrison)', 3, '', 22, 1),
(196, '2023-06-21 01:31:28.275566', 'broker_basicuser_contract/file/AlexBroker/Alex', 'TextFile object (broker_basicuser_contract/file/AlexBroker/Alex)', 3, '', 22, 1),
(197, '2023-06-21 01:31:57.860820', '2', 'BrokerBasicUserContract object (2)', 3, '', 19, 1),
(198, '2023-06-21 01:32:05.877012', 'broker_basicuser_contract/file/AlexBroker/Alex', '50-50 mr.', 3, '', 21, 1),
(199, '2023-06-21 01:32:33.338678', 'broker_basicuser_contract/file/AlexBroker/Alex', 'TextFile object (broker_basicuser_contract/file/AlexBroker/Alex)', 3, '', 22, 1),
(200, '2023-06-21 02:26:40.460111', '24', 'MsAdministrator', 1, '[{\"added\": {}}]', 6, 1),
(201, '2023-06-21 02:26:48.988484', '24', 'Administrator object (24)', 1, '[{\"added\": {}}]', 9, 1),
(202, '2023-06-21 02:31:26.860821', '24', 'MsAdministrator', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 6, 1),
(203, '2023-06-21 02:43:12.300845', '25', 'MsAdministrator', 1, '[{\"added\": {}}]', 6, 1),
(204, '2023-06-21 02:43:25.263163', '25', 'Administrator object (25)', 1, '[{\"added\": {}}]', 9, 1),
(205, '2023-06-21 02:44:06.641365', '25', 'MsAdministrator', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 6, 1);

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
(15, 'asset_management', 'activetraderequest'),
(14, 'asset_management', 'asset'),
(27, 'asset_management', 'makebeliefowns'),
(17, 'asset_management', 'purchaserequest'),
(16, 'asset_management', 'salesrequest'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(25, 'background_task', 'completedtask'),
(26, 'background_task', 'task'),
(20, 'broker_management', 'broker'),
(19, 'broker_management', 'brokerbasicusercontract'),
(18, 'broker_management', 'isbindedbycontract'),
(4, 'contenttypes', 'contenttype'),
(24, 'file_management', 'approvalreportfile'),
(21, 'file_management', 'brokerbasicusercontractfile'),
(23, 'file_management', 'brokerrequestfile'),
(22, 'file_management', 'textfile'),
(5, 'sessions', 'session'),
(9, 'user_management', 'administrator'),
(11, 'user_management', 'basicuser'),
(12, 'user_management', 'broker'),
(7, 'user_management', 'country'),
(8, 'user_management', 'fundstransfermethod'),
(13, 'user_management', 'makebeliefowns'),
(10, 'user_management', 'trader'),
(6, 'user_management', 'user');

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
(1, 'contenttypes', '0001_initial', '2023-05-27 21:13:02.160405'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-05-27 21:13:02.209273'),
(3, 'auth', '0001_initial', '2023-05-27 21:13:02.372815'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-05-27 21:13:02.418053'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-05-27 21:13:02.429025'),
(6, 'auth', '0004_alter_user_username_opts', '2023-05-27 21:13:02.441993'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-05-27 21:13:02.453956'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-05-27 21:13:02.456950'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-05-27 21:13:02.474901'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-05-27 21:13:02.485876'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-05-27 21:13:02.506815'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-05-27 21:13:02.524776'),
(13, 'auth', '0011_update_proxy_permissions', '2023-05-27 21:13:02.543716'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-05-27 21:13:02.554695'),
(15, 'asset_management', '0001_initial', '2023-05-27 21:13:02.581162'),
(16, 'user_management', '0001_initial', '2023-05-27 21:13:03.245190'),
(17, 'admin', '0001_initial', '2023-05-27 21:13:03.378196'),
(18, 'admin', '0002_logentry_remove_auto_add', '2023-05-27 21:13:03.405099'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-27 21:13:03.436027'),
(20, 'sessions', '0001_initial', '2023-05-27 21:13:03.482881'),
(21, 'asset_management', '0002_alter_asset_idasset', '2023-05-27 22:02:32.586282'),
(22, 'user_management', '0002_alter_country_idcountry_and_more', '2023-05-27 22:02:33.529856'),
(23, 'user_management', '0003_alter_user_password', '2023-05-27 22:05:05.305082'),
(24, 'user_management', '0004_alter_trader_termsacceptancetime', '2023-05-27 22:45:42.420562'),
(25, 'user_management', '0005_alter_trader_birthday', '2023-05-27 22:55:29.602717'),
(26, 'user_management', '0006_alter_trader_birthday_alter_trader_sex', '2023-05-27 23:01:59.801735'),
(27, 'user_management', '0007_alter_administrator_iduser_alter_basicuser_iduser_and_more', '2023-05-27 23:19:02.131566'),
(28, 'user_management', '0008_rename_iduser_administrator_idadministrator_and_more', '2023-05-27 23:45:57.635872'),
(29, 'user_management', '0009_delete_broker', '2023-06-04 18:40:34.966976'),
(30, 'asset_management', '0003_activetraderequest_purchaserequest_salesrequest', '2023-06-04 18:40:35.257466'),
(31, 'file_management', '0001_initial', '2023-06-04 18:40:35.414558'),
(32, 'broker_management', '0001_initial', '2023-06-04 18:40:35.670436'),
(33, 'background_task', '0001_initial', '2023-06-04 20:55:53.407996'),
(34, 'background_task', '0002_auto_20170927_1109', '2023-06-04 20:55:53.447881'),
(35, 'background_task', '0003_auto_20210410_1529', '2023-06-04 20:55:53.591369'),
(36, 'background_task', '0004_auto_20220202_1721', '2023-06-04 20:55:53.728003'),
(37, 'asset_management', '0004_remove_activetraderequest_unitpricelowerbound_and_more', '2023-06-05 12:03:55.062188'),
(38, 'asset_management', '0005_alter_purchaserequest_unitpricelowerbound_and_more', '2023-06-05 12:04:21.926454'),
(39, 'user_management', '0010_delete_makebeliefowns', '2023-06-06 01:45:05.376143'),
(40, 'asset_management', '0006_makebeliefowns', '2023-06-06 01:45:05.533720'),
(41, 'asset_management', '0006_makebeliefowns_makebeliefowns_composite_primary_key', '2023-06-20 20:23:42.665209');

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
('0od3tyyikqb223jrscdl2y6ju848dxhm', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1q81pO:JHLJfS4w3RlKtHVd8rT3Yv7hA3CZRq_biyZ4NJ_KvBQ', '2023-06-24 16:52:38.179874'),
('0sgjqkjeu45duufxc81j2m6rn9eir8i1', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q7lRW:HEuYdvVFILkAMpBYtv7atat2aJdvILh6csxttgLheNE', '2023-06-23 23:22:54.766786'),
('104kdlryedpfio6onsxn28q2ssxx8qj6', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q56pU:mJ7tmubbOs42yf5wlidMmi4l3ktsenzH9nfNhT4wmeA', '2023-06-16 15:36:40.429638'),
('1nzrabvnshefz7b94y1j5vuzrykmek9f', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1qBkDN:_HXYJ5i9TDemSSj0P7CGJ3gQFHzBVwz3n3xy7dIYZK0', '2023-07-04 22:52:45.940398'),
('2ajgbmj026aawe1cj4r0hqlz0q0dun0r', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q69BK:IPl1vklYBoH7MT4S_n1fDmLMHYJZ2V_F8RiR6oKobNo', '2023-06-19 12:19:30.081080'),
('2hg3gjjm8v61ss3rycxl8z2yqxfdzrv8', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q4hlH:SNNTiAfUH0IJobqSMBuuPyLUFEVvNyeIVMz_LA4nhjw', '2023-06-15 12:50:39.537315'),
('2xbqbuzwjj2v9ed569ghs916gjs5fbot', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q8kpk:6qe0_BNR_9gHWQm4gVwar2KDo5lHhqe9ume7yaV5HTA', '2023-06-26 16:56:00.126990'),
('3w58udk9ursm6f9rr0mhw3vnha8ubc19', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1qBK2M:ao9IOECGptOxobghwIoglgiRoRJpzRG6D_n1piikNHw', '2023-07-03 18:55:38.987473'),
('49jyis6hmim12dzxx6jwhhqaityw5lms', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q6Oyv:T8MaGeiER0e3bbcveWZkZOrFYCwM8Mgz74bWSzuXFSM', '2023-06-20 05:11:45.578997'),
('4iibhlnggb3h78pgwwphbdlqzxoye381', '.eJxVjDsOgzAQRO_iOrK8eM3ilOk5g7X-bCCJQMJQRbl7QKJIqpHmvZm3CrytQ9hqWcKY1VU1Vl1-y8jpWaaD5AdP91mneVqXMepD0Setup9zed1O9-9g4DrsawbE2CXXeqQOsGl9Y8ETghVBMnsiE0QxYDsjCbxzJaG07EjIC6nPF8JPNpg:1qBmjs:pxJhhplYUuLzJbXo-tuLOGLgb6VZV983q1dZEevdr-I', '2023-07-05 01:34:28.964862'),
('4wvxqxe7ohign925ktpdtrkj9moe0xs3', '.eJxVjEEOwiAQRe_C2hAKDAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWgxen3zEhPXLbCd-x3WZJc1uXKcldkQft8jpzfl4O9--gYq_f2pHS4PNIZJQFBlRoHBbKKRG6FLgYAmVGTwMWB7bYYILSDKQTMGXx_gAjmDjq:1q6N3v:diTVPylCvtWUgLskYLgVrCcHOuMGxlu7HmjFLo__kmA', '2023-06-20 03:08:47.271273'),
('5a1sja29k14qx6yl05oryyzb95f99gyg', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1qBJAH:kh29bbI9p8wGa1Zj9IRfGWgjWd50IC3Tjs2FiUDq1AE', '2023-07-03 17:59:45.557057'),
('5l4gs4bj3cm0i7ujslt7xzwr394kgxsc', '.eJxVjEEOgjAQRe_StWkY2imjS_ecoZl2poIaSCisjHdXEha6_e-9_zKRt3WIW9UljmIuBlpz-h0T54dOO5E7T7fZ5nlalzHZXbEHrbafRZ_Xw_07GLgO37p0lLEhAC2BAmPL6OXsOueKpsarkgcvLgCSQskpIIF0gJ7YeZFk3h_0gTev:1q34Dc:cwxPT0OIZNUHPTyURSvew0HkYIMF8mnBTN6umKwbvGc', '2023-06-11 00:25:08.967728'),
('6ui8pth14bmu1urfjnribvngfvcin9gp', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q81W5:1M5XdtBpQqAy_C1_6A8dRoTw03cgBL_cMlPXIUfAaeU', '2023-06-24 16:32:41.856208'),
('85weyiubolweufv2vbu1thkvkuo4p3mx', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1qBhwr:tx_bOl-azd5HaqyWwCHacJ4m1-fa9-ldkYD594K1UnA', '2023-07-04 20:27:33.911605'),
('9ej3x0z614cgl2w6b2cndcr9ress62ku', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1qBCH5:CotH2UAYIo5-Gksg9jjLOGkpUlO9ZENdH76C5-1iXq0', '2023-07-03 10:38:19.609668'),
('adcmithxnnbv8b077lul3qzhtbkvjnve', '.eJxVjDsOwyAQBe9CHSGwLT4p0-cMaJddgpMIJGNXVu4eLLlI2pl5bxcBtjWHrfESZhJXMShx-YUI8cXlMPSE8qgy1rIuM8ojkadt8l6J37ez_TvI0HJfK2sscdJsJiAPerSocTQpYUfRWgfGG1AjETrnu0Hj2INNnrUeYBKfLxjWOHc:1qBNu5:5Cs5RU8N6eKdxBXGIemvbbyfatzGXUlnjoU9esXsFUg', '2023-07-03 23:03:21.251934'),
('bf52bum2k73sismxghs22jhnhhq4akwb', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1qBL9y:CPF4_LcXPevSXusNrLDTa53WgyOijc9Z-4qlGDmuAVM', '2023-07-03 20:07:34.950043'),
('bo570q09obi0q0wnmtoe42odzsul5kc2', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q5sgL:H_6VmkZ38yOyZc2Br0B8clFEd_6DYSVQd3KBnuTn9kY', '2023-06-18 18:42:25.610695'),
('cki17v3qx8bccuzehrxrylw5w2ajptpm', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q6dkt:F_wF61WVFbBQq-pniFStaiwlp83oKJ-2CcoXYI_MS7s', '2023-06-20 20:58:15.939000'),
('dt3r09pp5drwbz3s7jr5gtyz5s39x0gn', '.eJxVjDEOgzAMRe-SuYqUYAPu2L1niOzYFNoKJAIT6t0LEkO7vvf-31zidenTWmxOg7qri-Quv1A4v2w8jD55fEw-T-MyD-KPxJ-2-Puk9r6d7d9Bz6Xf1yEKGNdQVZg7hixBCAW7IG2XgYxqAoCGNLLtGNRUG8IYlduQEd3nCx_3OKg:1qBvnu:Xlr0QzAvP6pEUliGb7iTYJeuIUUQAOwJD2sZB7yn-oE', '2023-07-05 11:15:14.910302'),
('fxed13lymz89120bxjgc0uhz315hcyto', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q5PXv:aO8vO90m-oOGxR468hmIPEXmIQgLiz61uw2lzoTzAR0', '2023-06-17 11:35:47.710426'),
('glcze3o9epzhymhgnjonawdh07cg0xr5', '.eJxVjkEOwiAQRa9C2HRjGqyUBpfuPUMzzExta4UE6Mp4dyHpQrf__Xl_3nKEPc_jnjiOC8mrPFt5-g0d4JN9JbSCf4QWg89xcW2ttAdN7T0Qb7ej-yeYIc3lunMaFTE6goGt0zB0gP3ZKu36QVk0gGAmS4YKqHmvJ6Bu4ktPaFAV6eIzRw_byDEWY5NybERwK2MWZUX4ICDX3_bMoqnjHl7cyM8XcqVNZg:1qBZgY:Ys3amNb65o7-BKzBgKmk1FVH_OjXQqAJ2DPPvlQ5Pcc', '2023-07-04 11:38:10.321725'),
('h5j4npc4odaugxtyzko6jg19m019mr1m', '.eJxVjMsOwiAQRf-FtSFDYXi4dO83kIGhUjU0Ke3K-O_apAvd3nPOfYlI21rj1ssSJxZnocXpd0uUH6XtgO_UbrPMc1uXKcldkQft8jpzeV4O9--gUq_f2rKygIjGENjihpQ0whBGRU7BmHVI4LT3CJ4xW_LBoHdGBWTDxlsS7w-s5DZf:1q3him:B1IrUGPPvHNnsvVJ9SvhIuivxgWH0GliFLTuWDVeJl4', '2023-06-12 18:35:56.853753'),
('hcya9h7pnf8k3j9mvshdzxxltl904ynt', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q4iBG:QB-tR5rWlkA6eYpM3xZnIKzQAqCBYY-nbod85NIyy2o', '2023-06-15 13:17:30.291529'),
('hl6esrrhjxwtqtkbgsp4syp9b5hefte4', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1qBO7p:NjlhXN8TNBBwMuJ5O3kzm_pni75-LEtTEOxy_UElYeM', '2023-07-03 23:17:33.080928'),
('hm9bwrmkf88k067yz3xyb9uakp3xbu2e', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1qBhwz:aI_6TSpILvsYQ-6f_i3Dk2wPrjA1WUEP9QGibFVUcIM', '2023-07-04 20:27:41.099039'),
('mquwc57dn2lc04zbi0gmt7xrfua7ku5x', '.eJxVjEEOwiAQRe_C2hAKDAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWgxen3zEhPXLbCd-x3WZJc1uXKcldkQft8jpzfl4O9--gYq_f2pHS4PNIZJQFBlRoHBbKKRG6FLgYAmVGTwMWB7bYYILSDKQTMGXx_gAjmDjq:1q81xA:023UP8WsDCiXXuM8Js8o1QhKj0YDd2nBozUlOkUCSa4', '2023-06-24 17:00:40.723970'),
('msp7g44cgy3es8bqbog2tny3ylf0n8hb', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q6weX:JEbDYNmTrHtem6iCSXirvg5ZnA2wVxS1wMuQBkAViac', '2023-06-21 17:08:57.738400'),
('mw3qwb4uj7oo6orxd25m3dfwz7o3pihn', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q4ofJ:T1TFJBnR_rL7rjUzqJ3MYvxn6XmVSJigyaqUjYi4BMs', '2023-06-15 20:12:57.103749'),
('o4ywlhgumoqz1g0v17onw2n4q73f129s', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1qBZds:aLcfILoJBe1KUktPRmEe-w_xOIBynLfBrj2BX5T8Ep8', '2023-07-04 11:35:24.138715'),
('o68es7j4edu0stgjrrv7igxlsromwjm4', '.eJxVjMEOwiAQRP-FsyEsAm09evcbCLssUjWQlPZk_Hdp0oPeZubNzFv4sK3Zb40XP0dxEdqJ02-IgZ5cdhIfodyrpFrWZUa5V-RBm7zVyK_r0f07yKHlvk4QXeCoYQrIasLuzQAcE7NBRYaTGsjYMZ2dQxyByFJCrQFUFzaJzxdGpjl4:1qBvmN:Hm4H-TqgY_6DCMRMfpWHCvMxAB6cS9ECkhFyWsd-oGI', '2023-07-05 11:13:39.845458'),
('oq6n72h2qfek6h97lm5d6hourbevqkw0', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q5RXC:nnfW23XtiVJ2ab8AS0hxbA4XyZTy3FgREryZEYwC4rs', '2023-06-17 13:43:10.780873'),
('pnm95a0d81vi9vi13mu5tjs1wrxk5mun', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1qBhwY:HwiJJOer2uPx9tmfd_ER8-Q5hERr3pn8vrX2WK9z6bM', '2023-07-04 20:27:14.960699'),
('s22qwc3dwsuwz93hmxru3fllyvj7y7v9', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1q8SIo:uvWAtx1tRQX43rSNIsTyiGrnGj9dUTd60cPJ8O5KPpo', '2023-06-25 21:08:46.924557'),
('s8h43p39fzg28rgokyzu6te3n1e28xh6', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q68r9:tpOuC_3hscby_QLQyrgqwt23rvHwUiU95lQ8UNpab6U', '2023-06-19 11:58:39.407115'),
('t1bzxlz8p28mvb12ubtofa4x90ukqbu1', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q4AuI:4uuVx3A6hwhvLI8ZNBFLZzFkwZK3AiR66h3OIMR6Ouk', '2023-06-14 01:45:46.428549'),
('v5x5z3yenus3sl1g5gicupjuy7z61wjp', '.eJxVjEEOwiAQRe_C2hAKDAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWgxen3zEhPXLbCd-x3WZJc1uXKcldkQft8jpzfl4O9--gYq_f2pHS4PNIZJQFBlRoHBbKKRG6FLgYAmVGTwMWB7bYYILSDKQTMGXx_gAjmDjq:1qBJBs:jmLXF0Mo6J8VvkKxOjx8gB6DPLqRnymam8GL9lMtvI4', '2023-07-03 18:01:24.095198'),
('xotbz75rxybuy47i4gy8vbl2xh6nk27n', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q6cD4:UpX5tAgi3fbJJNzJffhPtof6126Xv6OoIfntRdMkK4Q', '2023-06-20 19:19:14.767133'),
('xpgyiq9b4f7iatnxhpoyaz9mz0pedkz8', '.eJxVjMsOwiAQRf-FtSFDYXi4dO83kIGhUjU0Ke3K-O_apAvd3nPOfYlI21rj1ssSJxZnocXpd0uUH6XtgO_UbrPMc1uXKcldkQft8jpzeV4O9--gUq_f2rKygIjGENjihpQ0whBGRU7BmHVI4LT3CJ4xW_LBoHdGBWTDxlsS7w-s5DZf:1q5Chn:J6jShrq1nYs7fa2-iV6ouQyoUOk6sWo5QnPQjsIEfow', '2023-06-16 21:53:07.827019'),
('y5zc4bseukgpt8gfhxbh0rvyi5tyka29', '.eJxVjEEOwiAQRe_C2hBAHRiX7nuGZhgGqRpISrsy3l2bdKHb_977LzXSupRx7TKPU1IX5aw6_I6R-CF1I-lO9dY0t7rMU9Sbonfa9dCSPK-7-3dQqJdvHQJER3wGzNYgJ0E6EZCPDBisFwcRwYDLHpwBYiZyJhuUIwNkC-r9AQm5OA0:1qBNy0:MY0TyyhaQFKRIcRkmsCTnuu4OtqpzTLcVGjKT0yABpA', '2023-07-03 23:07:24.483410'),
('yrecsq6zb51soxbe8c98xdjr7gtcgce5', '.eJxVjMsOwiAUBf-FtSEUeQSX7v0Gch8gVQNJaVfGf7ckXeh2Zs55iwjbWuLW0xJnFhcxBXH6hQj0THUYfkC9N0mtrsuMciTysF3eGqfX9Wj_Dgr0sq81GlKcCBl8CmjAayA7BWXQehXIAYHLgR3vYnBrMrDO6WyZHCnx-QI2pDka:1q6P0C:JbxGGK87gN-Pt7AHCQZMwxNS3vgyKK58cN7EWpRWcQI', '2023-06-20 05:13:04.999536'),
('yv0zbhz8zn84k5ydo4anhvdueu5dam8d', '.eJxVjMsOwiAQRf-FtSFTKA9duvcbyMwAUjWQlHZl_HdD0oVu7znnvkXAfSth72kNSxQXMTlx-h0J-ZnqIPGB9d4kt7qtC8mhyIN2eWsxva6H-3dQsJdRWwY3p3MmssSIM2pvJutcZKMhAYPPmC2BcjFF7wEhZyCVlTaOLIvPFy0SOOg:1q6ds5:D8SzdLuUxRwhWzo4706jhdxdT1eBklImDQ6UlUBlD8c', '2023-06-20 21:05:41.620167'),
('yx2e69yjvi68uq9hockd9f9e96to1lr9', '.eJxVjEEOwiAQRe_C2hCgZaZ16d4zNAMzSNVAUtqV8e7apAvd_vfef6mJtjVPW5NlmlmdlVWn3y1QfEjZAd-p3KqOtazLHPSu6IM2fa0sz8vh_h1kavlbCzsB8iOAAbFkB-9k5L5D36MVYJ_ABemQIwQUg4lAYkoUkzWEg1PvD-WiOG8:1q5sf6:0S8fS0C-kyeu_nQrVZTSZ0kx4S4xAOdDkvaWT8JWtnU', '2023-06-18 18:41:08.403595'),
('zzm1od8poau7yfmb6z2516z40wr44t0h', '.eJxVjEEOwiAQRe_C2hAKDAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWgxen3zEhPXLbCd-x3WZJc1uXKcldkQft8jpzfl4O9--gYq_f2pHS4PNIZJQFBlRoHBbKKRG6FLgYAmVGTwMWB7bYYILSDKQTMGXx_gAjmDjq:1q8Mq5:9xYMzmNqRa_FOz0wjHepip-nEbcAI2D1ZZ7Ho-ipfVU', '2023-06-25 15:18:45.154420');

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
(1, 'COOL_STUFF', 500000.00),
(2, 'HOT_STUFF', 500000.00),
(3, 'BROKER', 500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `isbindedbycontract`
--

CREATE TABLE `isbindedbycontract` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `IdContract` int(11) NOT NULL
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

--
-- Dumping data for table `makebeliefowns`
--

INSERT INTO `makebeliefowns` (`id`, `Quantity`, `IdAsset`, `IdPaymentMethod`) VALUES
(1, 100000, 1, 1),
(2, 9956, 2, 1),
(3, 200000, 1, 2),
(4, 199995, 2, 2),
(11, 49, 2, 3),
(12, 1000020, 3, 1),
(13, 19980, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `purchaserequest`
--

CREATE TABLE `purchaserequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchaserequest`
--

INSERT INTO `purchaserequest` (`IdTradeRequest`, `UnitPriceLowerBound`, `UnitPriceUpperBound`) VALUES
(103, 170.00, 200.00),
(109, 200.00, 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `salesrequest`
--

CREATE TABLE `salesrequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesrequest`
--

INSERT INTO `salesrequest` (`IdTradeRequest`, `UnitPriceLowerBound`, `UnitPriceUpperBound`) VALUES
(106, 700.00, 900.00);

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
('brokerApprovalContract/file/MrBroker'),
('broker_basicuser_contract/file/MrBroker/Alex');

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
(17, '1943-12-08', 'Male', '2023-06-03 11:35:57.000000', 1, 1),
(18, '1943-12-08', 'Male', '2023-06-06 03:09:00.000000', 1, 2),
(19, '1943-12-08', 'Male', '2023-06-06 05:13:08.000000', 1, 3),
(23, '1973-08-05', 'Male', '2023-06-21 01:35:16.572676', 7, NULL),
(26, '2005-01-21', 'Female', '0001-01-01 00:00:00.000000', 5, NULL),
(29, '2005-01-21', 'Female', '0001-01-01 00:00:00.000000', 1, NULL);

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
('2023-06-20 22:52:45.937405', 1, '', '', 1, 1, '2023-05-27 22:05:23.576203', 1, 'admin', 'pbkdf2_sha256$600000$44iPx9SGUopi9YABSJ9dzc$Qt3tvVCqsf79CSaAju5bmHl5rCqidDJtQiR4+QPZn8k=', 'admin'),
('2023-06-20 23:07:44.282481', 0, '', '', 0, 1, '2023-06-03 11:35:01.501103', 17, 'Jim Morrison', 'pbkdf2_sha256$600000$fpP2C5k50g8j30KHkIBvmq$1qNMhhKYxA0BWPzGFqcxCaAqW2i5Bou7KkVAZheJWOk=', 'jim@morrison.com'),
('2023-06-21 02:52:45.410198', 0, '', '', 0, 1, '2023-06-06 03:08:45.689441', 18, 'Alex', 'pbkdf2_sha256$600000$1nRdhc9ceaIPwdOeiatCYL$0nPZ53jssji7QXDRtzUre26g9cZmTGwUe0fsA1zs49s=', 'alex@alex.com'),
('2023-06-21 00:38:24.559384', 0, '', '', 0, 1, '2023-06-06 05:13:03.544520', 19, 'AlexBroker', 'pbkdf2_sha256$600000$kYGEYef0TbR1hsMmE4g3JT$7C3YjnIpJWyHKXN50tcxbhcSJdq3RrGRrHcRbbchxmU=', 'alex2@alex2.com'),
('2023-06-21 01:34:28.961876', 0, '', '', 0, 1, '2023-06-21 01:34:27.717945', 23, 'MrBroker', 'pbkdf2_sha256$600000$sgcKOeqSXGv3Cl6p42HRE2$sdJF+iZfM7JNbdZo4+ueOpnaq8AFlRCwdvXChHFnQlQ=', 'mrbroker@broker.com'),
('2023-06-21 02:44:16.301012', 0, '', '', 0, 1, '2023-06-21 02:42:48.000000', 25, 'MsAdministrator', 'pbkdf2_sha256$600000$fpP2C5k50g8j30KHkIBvmq$1qNMhhKYxA0BWPzGFqcxCaAqW2i5Bou7KkVAZheJWOk=', 'msadmin@admin.com'),
('2023-06-21 11:13:39.840468', 0, '', '', 0, 1, '2023-06-21 11:13:37.079699', 26, 'LastTest', 'pbkdf2_sha256$600000$x89j28cVWQpTQiq5lgP8L6$RGPRVdgDrJVQOJ6H/YnfbC2xh+lzewVpAJobw2T8as4=', 'last_test@last.test.com'),
('2023-06-21 11:15:14.906310', 0, '', '', 0, 1, '2023-06-21 11:15:13.138650', 29, 'LastTest2', 'pbkdf2_sha256$600000$4kqcyVPsKFs6CgsSnYv8gg$gBQcvsw4/oGZ+6AkYxLLkc25vMvAYP21Ana+AD39E70=', 'last_test2@last.test.com');

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
(1, 17, 1),
(2, 18, 1),
(3, 19, 1),
(7, 23, 1),
(8, 26, 1),
(9, 29, 1);

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
-- Indexes for table `activetraderequest`
--
ALTER TABLE `activetraderequest`
  ADD PRIMARY KEY (`IdTradeRequest`),
  ADD KEY `activetraderequest_IdAsset_9d073669_fk_asset_IdAsset` (`IdAsset`),
  ADD KEY `activetraderequest_IdUser_aa4ba7c7_fk_trader_IdUser` (`IdUser`);

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
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

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
-- Indexes for table `isbindedbycontract`
--
ALTER TABLE `isbindedbycontract`
  ADD PRIMARY KEY (`IdTradeRequest`),
  ADD KEY `isbindedbycontract_IdContract_439177cf_fk_brokerbas` (`IdContract`);

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
  ADD PRIMARY KEY (`IdTradeRequest`);

--
-- Indexes for table `salesrequest`
--
ALTER TABLE `salesrequest`
  ADD PRIMARY KEY (`IdTradeRequest`);

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
  ADD KEY `trader_IdCountry_2add0814_fk` (`IdCountry`),
  ADD KEY `trader_IdSelectedFundsTrasnferMethod_ffdbf40a_fk` (`IdSelectedFundsTrasnferMethod`);

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
-- AUTO_INCREMENT for table `activetraderequest`
--
ALTER TABLE `activetraderequest`
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `background_task`
--
ALTER TABLE `background_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `brokerbasicusercontract`
--
ALTER TABLE `brokerbasicusercontract`
  MODIFY `IdContract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `IdCountry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `fundstransfermethod`
--
ALTER TABLE `fundstransfermethod`
  MODIFY `IdPaymentMethod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `makebeliefowns`
--
ALTER TABLE `makebeliefowns`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activetraderequest`
--
ALTER TABLE `activetraderequest`
  ADD CONSTRAINT `activetraderequest_IdAsset_9d073669_fk_asset_IdAsset` FOREIGN KEY (`IdAsset`) REFERENCES `asset` (`IdAsset`),
  ADD CONSTRAINT `activetraderequest_IdUser_aa4ba7c7_fk_trader_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_IdUser_7a34e409_fk` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

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
  ADD CONSTRAINT `basicuser_IdUser_2e4cd913_fk` FOREIGN KEY (`IdUser`) REFERENCES `trader` (`IdUser`);

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `isbindedbycontract`
--
ALTER TABLE `isbindedbycontract`
  ADD CONSTRAINT `isbindedbycontract_IdContract_439177cf_fk_brokerbas` FOREIGN KEY (`IdContract`) REFERENCES `brokerbasicusercontract` (`IdContract`),
  ADD CONSTRAINT `isbindedbycontract_IdTradeRequest_6d5e0d04_fk_activetra` FOREIGN KEY (`IdTradeRequest`) REFERENCES `activetraderequest` (`IdTradeRequest`);

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
  ADD CONSTRAINT `purchaserequest_IdTradeRequest_ea3b1b96_fk_activetra` FOREIGN KEY (`IdTradeRequest`) REFERENCES `activetraderequest` (`IdTradeRequest`);

--
-- Constraints for table `salesrequest`
--
ALTER TABLE `salesrequest`
  ADD CONSTRAINT `salesrequest_IdTradeRequest_cd29259c_fk_activetra` FOREIGN KEY (`IdTradeRequest`) REFERENCES `activetraderequest` (`IdTradeRequest`);

--
-- Constraints for table `trader`
--
ALTER TABLE `trader`
  ADD CONSTRAINT `trader_IdCountry_2add0814_fk` FOREIGN KEY (`IdCountry`) REFERENCES `country` (`IdCountry`),
  ADD CONSTRAINT `trader_IdSelectedFundsTrasnferMethod_ffdbf40a_fk` FOREIGN KEY (`IdSelectedFundsTrasnferMethod`) REFERENCES `fundstransfermethod` (`IdPaymentMethod`),
  ADD CONSTRAINT `trader_IdUser_ffd77317_fk` FOREIGN KEY (`IdUser`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_groups_user_id_abaea130_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);

--
-- Constraints for table `user_user_permissions`
--
ALTER TABLE `user_user_permissions`
  ADD CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`IdUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
