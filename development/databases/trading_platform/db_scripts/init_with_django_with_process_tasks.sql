-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2023 at 05:38 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `IdPaymentMethod` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `IdAsset` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaserequest`
--

CREATE TABLE `purchaserequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesrequest`
--

CREATE TABLE `salesrequest` (
  `IdTradeRequest` bigint(20) NOT NULL,
  `UnitPriceLowerBound` decimal(10,2) NOT NULL,
  `UnitPriceUpperBound` decimal(10,2) NOT NULL
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
  ADD PRIMARY KEY (`IdPaymentMethod`),
  ADD UNIQUE KEY `makebeliefowns_IdPaymentMethod_IdAsset_5538ae11_uniq` (`IdPaymentMethod`,`IdAsset`),
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
  MODIFY `IdTradeRequest` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `IdAsset` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `IdCountry` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fundstransfermethod`
--
ALTER TABLE `fundstransfermethod`
  MODIFY `IdPaymentMethod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IdUser` int(11) NOT NULL AUTO_INCREMENT;

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
