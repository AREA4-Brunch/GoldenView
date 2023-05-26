-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: goldenview
-- Source Schemata: goldenview
-- Created: Fri May 26 17:53:39 2023
-- Workbench Version: 8.0.32
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema goldenview
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `goldenview` ;
CREATE SCHEMA IF NOT EXISTS `goldenview` ;

-- ----------------------------------------------------------------------------
-- Table goldenview.ActiveTradeRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`ActiveTradeRequest` (
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
    REFERENCES `goldenview`.`Asset` (`IdAsset`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_47`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`Trader` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.Administrator
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`Administrator` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_9`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`User` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.ApprovalReportFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`ApprovalReportFile` (
  `ApprovalContent` VARCHAR(256) NULL,
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_61`
    FOREIGN KEY (`FilePath`)
    REFERENCES `goldenview`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table goldenview.Asset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`Asset` (
  `IdAsset` INT NOT NULL,
  `TickerSymbol` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`IdAsset`));

-- ----------------------------------------------------------------------------
-- Table goldenview.BasicUser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`BasicUser` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_15`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`Trader` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.Broker
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`Broker` (
  `IdUser` INT NOT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_16`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`Trader` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.BrokerBasicUserContract
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`BrokerBasicUserContract` (
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
    REFERENCES `goldenview`.`BasicUser` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_24`
    FOREIGN KEY (`IdBroker`)
    REFERENCES `goldenview`.`Broker` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_59`
    FOREIGN KEY (`ContractFilePath`)
    REFERENCES `goldenview`.`BrokerBasicUserContractFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.BrokerBasicUserContractFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`BrokerBasicUserContractFile` (
  `ContractContent` VARCHAR(256) NULL,
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_56`
    FOREIGN KEY (`FilePath`)
    REFERENCES `goldenview`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table goldenview.BrokerRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`BrokerRequest` (
  `IdBasicUser` INT NOT NULL,
  `Status` VARCHAR(16) NOT NULL,
  `IdAdministrator` INT NOT NULL,
  `RequestFilePath` VARCHAR(128) NOT NULL,
  `ApprovalFilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`IdBasicUser`),
  CONSTRAINT `R_17`
    FOREIGN KEY (`IdBasicUser`)
    REFERENCES `goldenview`.`BasicUser` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_22`
    FOREIGN KEY (`IdAdministrator`)
    REFERENCES `goldenview`.`Administrator` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_58`
    FOREIGN KEY (`RequestFilePath`)
    REFERENCES `goldenview`.`BrokerRequestFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_62`
    FOREIGN KEY (`ApprovalFilePath`)
    REFERENCES `goldenview`.`ApprovalReportFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.BrokerRequestFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`BrokerRequestFile` (
  `FilePath` VARCHAR(128) NOT NULL,
  `RequestContent` VARCHAR(256) NULL,
  PRIMARY KEY (`FilePath`),
  CONSTRAINT `R_57`
    FOREIGN KEY (`FilePath`)
    REFERENCES `goldenview`.`TextFile` (`FilePath`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table goldenview.Country
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`Country` (
  `IdCountry` INT NOT NULL,
  `Name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`IdCountry`));

-- ----------------------------------------------------------------------------
-- Table goldenview.FundsTransferMethod
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`FundsTransferMethod` (
  `IdPaymentMethod` INT NOT NULL,
  `AccessKey` VARCHAR(64) NOT NULL,
  `MakeBeliefBalance` DECIMAL(10,2) NULL,
  PRIMARY KEY (`IdPaymentMethod`));

-- ----------------------------------------------------------------------------
-- Table goldenview.IsBindedByContract
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`IsBindedByContract` (
  `IdTradeRequest` BIGINT NOT NULL,
  `IdContract` INT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_53`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `goldenview`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_54`
    FOREIGN KEY (`IdContract`)
    REFERENCES `goldenview`.`BrokerBasicUserContract` (`IdContract`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.MakeBeliefOwns
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`MakeBeliefOwns` (
  `IdPaymentMethod` INT NOT NULL,
  `IdAsset` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`IdPaymentMethod`, `IdAsset`),
  CONSTRAINT `R_51`
    FOREIGN KEY (`IdPaymentMethod`)
    REFERENCES `goldenview`.`FundsTransferMethod` (`IdPaymentMethod`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_52`
    FOREIGN KEY (`IdAsset`)
    REFERENCES `goldenview`.`Asset` (`IdAsset`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.PasswordChangeRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`PasswordChangeRequest` (
  `IdUser` INT NOT NULL,
  `IdPCR` INT NOT NULL,
  `ConfirmationCode` SMALLINT NOT NULL,
  `CreationTime` DATETIME(6) NOT NULL,
  `ExpirationTime` DATETIME(6) NOT NULL,
  `DidExpire` TINYINT(1) NOT NULL,
  PRIMARY KEY (`IdPCR`),
  CONSTRAINT `R_14`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.PurchaseRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`PurchaseRequest` (
  `IdTradeRequest` BIGINT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_49`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `goldenview`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.SalesRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`SalesRequest` (
  `IdTradeRequest` BIGINT NOT NULL,
  PRIMARY KEY (`IdTradeRequest`),
  CONSTRAINT `R_50`
    FOREIGN KEY (`IdTradeRequest`)
    REFERENCES `goldenview`.`ActiveTradeRequest` (`IdTradeRequest`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.TextFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`TextFile` (
  `FilePath` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`FilePath`));

-- ----------------------------------------------------------------------------
-- Table goldenview.Trader
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`Trader` (
  `IdUser` INT NOT NULL,
  `Birthday` DATETIME(6) NULL,
  `Sex` VARCHAR(6) NULL,
  `IdCountry` INT NOT NULL,
  `TermsAcceptanceTime` DATETIME(6) NOT NULL,
  `IdSelectedFundsTrasnferMethod` INT NULL,
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `R_10`
    FOREIGN KEY (`IdUser`)
    REFERENCES `goldenview`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `R_13`
    FOREIGN KEY (`IdCountry`)
    REFERENCES `goldenview`.`Country` (`IdCountry`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `R_33`
    FOREIGN KEY (`IdSelectedFundsTrasnferMethod`)
    REFERENCES `goldenview`.`FundsTransferMethod` (`IdPaymentMethod`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table goldenview.User
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `goldenview`.`User` (
  `IdUser` INT NOT NULL,
  `Username` VARCHAR(32) NOT NULL,
  `Password` VARCHAR(32) NOT NULL,
  `Email` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`IdUser`));
SET FOREIGN_KEY_CHECKS = 1;
