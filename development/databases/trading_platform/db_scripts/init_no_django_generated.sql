-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: trading_platform
-- Source Schemata: trading_platform
-- Created: Fri May 26 17:53:39 2023
-- Workbench Version: 8.0.32
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema trading_platform
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `trading_platform` ;
CREATE SCHEMA IF NOT EXISTS `trading_platform` ;

-- ----------------------------------------------------------------------------
-- Table trading_platform.ActiveTradeRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`ActiveTradeRequest` (
  `QuantityRequested` INT NOT NULL,
  `TotalTransactionsPrice` DECIMAL(10,2) NOT NULL,
  `IdAsset` INT NOT NULL,
  `IdTradeRequest` BIGINT NOT NULL,
  `IdUser` INT NOT NULL,
  `QuantityRequired` INT NOT NULL,
  `UnitPriceLowerBound` DECIMAL(10,2) NOT NULL,
  `UnitPriceUpperBound` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_42`
    FOREIGN KEY (`IdAsset`)
    REFERENCES `trading_platform`.`Asset` (`IdAsset`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_47`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`Trader` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.Administrator
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`Administrator` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_9`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`User` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.ApprovalReportFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`ApprovalReportFile` (
  `ApprovalContent` VARCHAR(256) NULL,
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_61`
    FOREIGN KEY (`FilePath`)
    REFERENCES `trading_platform`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table trading_platform.Asset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`Asset` (
  `IdAsset` INT NOT NULL,
  `TickerSymbol` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`IdAsset`));

-- ----------------------------------------------------------------------------
-- Table trading_platform.BasicUser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`BasicUser` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_15`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`Trader` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.Broker
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`Broker` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_16`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`Trader` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.BrokerBasicUserContract
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`BrokerBasicUserContract` (
  `IdContract` INT NOT NULL,
  `IdBasicUser` INT NOT NULL,
  `IdBroker` INT NOT NULL,
  `CreationTime` DATETIME(6) NOT NULL,
  `ResponseTime` DATETIME(6) NULL,
  `WasAccepted` TINYINT(1) NOT NULL,
  `FeePercentage` DOUBLE NOT NULL,
  `ExpirationTime` DATETIME(6) NULL,
  `ContractFilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`IdContract`),
  CONSTRAINT `R_23`
    FOREIGN KEY (`IdBasicUser`)
    REFERENCES `trading_platform`.`BasicUser` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_24`
    FOREIGN KEY (`IdBroker`)
    REFERENCES `trading_platform`.`Broker` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_59`
    FOREIGN KEY (`ContractFilePath`)
    REFERENCES `trading_platform`.`BrokerBasicUserContractFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.BrokerBasicUserContractFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`BrokerBasicUserContractFile` (
  `ContractContent` VARCHAR(256) NULL,
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_56`
    FOREIGN KEY (`FilePath`)
    REFERENCES `trading_platform`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table trading_platform.BrokerRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`BrokerRequest` (
  `IdBasicUser` INT NOT NULL,
  `Status` VARCHAR(16) NOT NULL,
  `IdAdministrator` INT NOT NULL,
  `RequestFilePath` VARCHAR(128) NOT NULL,
  `ApprovalFilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`IdBasicUser`),
  CONSTRAINT `R_17`
    FOREIGN KEY (`IdBasicUser`)
    REFERENCES `trading_platform`.`BasicUser` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_22`
    FOREIGN KEY (`IdAdministrator`)
    REFERENCES `trading_platform`.`Administrator` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_58`
    FOREIGN KEY (`RequestFilePath`)
    REFERENCES `trading_platform`.`BrokerRequestFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_62`
    FOREIGN KEY (`ApprovalFilePath`)
    REFERENCES `trading_platform`.`ApprovalReportFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.BrokerRequestFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`BrokerRequestFile` (
  `FilePath` VARCHAR(128) NOT NULL,
  `RequestContent` VARCHAR(256) NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_57`
    FOREIGN KEY (`FilePath`)
    REFERENCES `trading_platform`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table trading_platform.Country
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`Country` (
  `IdCountry` INT NOT NULL,
  `Name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`IdCountry`));

-- ----------------------------------------------------------------------------
-- Table trading_platform.FundsTransferMethod
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`FundsTransferMethod` (
  `IdPaymentMethod` INT NOT NULL,
  `AccessKey` VARCHAR(64) NOT NULL,
  `MakeBeliefBalance` DECIMAL(10,2) NULL,
  PRIMARY KEY (`IdPaymentMethod`));

-- ----------------------------------------------------------------------------
-- Table trading_platform.IsBindedByContract
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`IsBindedByContract` (
  `IdTradeRequest` BIGINT NOT NULL,
  `IdContract` INT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_53`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `trading_platform`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_54`
    FOREIGN KEY (`IdContract`)
    REFERENCES `trading_platform`.`BrokerBasicUserContract` (`IdContract`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.MakeBeliefOwns
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`MakeBeliefOwns` (
  `IdPaymentMethod` INT NOT NULL,
  `IdAsset` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`IdPaymentMethod`, `IdAsset`),
  CONSTRAINT `R_51`
    FOREIGN KEY (`IdPaymentMethod`)
    REFERENCES `trading_platform`.`FundsTransferMethod` (`IdPaymentMethod`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_52`
    FOREIGN KEY (`IdAsset`)
    REFERENCES `trading_platform`.`Asset` (`IdAsset`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.PasswordChangeRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`PasswordChangeRequest` (
  `IdUser` INT NOT NULL,
  `IdPCR` INT NOT NULL,
  `ConfirmationCode` SMALLINT NOT NULL,
  `CreationTime` DATETIME(6) NOT NULL,
  `ExpirationTime` DATETIME(6) NOT NULL,
  `DidExpire` TINYINT(1) NOT NULL,
  PRIMARY KEY (`IdPCR`),
  CONSTRAINT `R_14`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.PurchaseRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`PurchaseRequest` (
  `IdTradeRequest` BIGINT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_49`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `trading_platform`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.SalesRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`SalesRequest` (
  `IdTradeRequest` BIGINT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_50`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `trading_platform`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.TextFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`TextFile` (
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`));

-- ----------------------------------------------------------------------------
-- Table trading_platform.Trader
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`Trader` (
  `IdUser` INT NOT NULL,
  `Birthday` DATETIME(6) NULL,
  `Sex` VARCHAR(6) NULL,
  `IdCountry` INT NOT NULL,
  `TermsAcceptanceTime` DATETIME(6) NOT NULL,
  `IdSelectedFundsTrasnferMethod` INT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_10`
    FOREIGN KEY (`IdUser`)
    REFERENCES `trading_platform`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_13`
    FOREIGN KEY (`IdCountry`)
    REFERENCES `trading_platform`.`Country` (`IdCountry`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_33`
    FOREIGN KEY (`IdSelectedFundsTrasnferMethod`)
    REFERENCES `trading_platform`.`FundsTransferMethod` (`IdPaymentMethod`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table trading_platform.User
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `trading_platform`.`User` (
  `IdUser` INT NOT NULL,
  `Username` VARCHAR(32) NOT NULL,
  `Password` VARCHAR(128) NOT NULL,
  `Email` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`IdUser`));
SET FOREIGN_KEY_CHECKS = 1;
