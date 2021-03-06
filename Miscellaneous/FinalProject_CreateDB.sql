-- MySQL Script generated by MySQL Workbench
-- Tue Nov 26 17:23:59 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Albums` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Albums` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `album_inventory_quantity` INT NOT NULL,
  `album_rating` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `album_maker_name` VARCHAR(45) NOT NULL,
  `Singers_id_singer` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  UNIQUE INDEX `id_album_UNIQUE` (`id_album` ASC) ,
  UNIQUE INDEX `album_name_UNIQUE` (`album_name` ASC) ,
  INDEX `fk_Albums_Singers_idx` (`Singers_id_singer` ASC) ,
  CONSTRAINT `fk_Albums_Singers`
    FOREIGN KEY (`Singers_id_singer`)
    REFERENCES `mydb`.`Singers` (`id_singer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Albums_has_Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Albums_has_Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Albums_has_Orders` (
  `Orders_id_order` INT NOT NULL,
  `Albums_id_album` INT NOT NULL,
  `Albums_purchased_quantity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Orders_id_order`, `Albums_id_album`),
  INDEX `fk_Albums_has_Orders_Orders1_idx` (`Orders_id_order` ASC) ,
  INDEX `fk_Albums_has_Orders_Albums1_idx` (`Albums_id_album` ASC) ,
  CONSTRAINT `fk_Albums_has_Orders_Albums1`
    FOREIGN KEY (`Albums_id_album`)
    REFERENCES `mydb`.`Albums` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Albums_has_Orders_Orders1`
    FOREIGN KEY (`Orders_id_order`)
    REFERENCES `mydb`.`Orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Clients` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NOT NULL,
  `client_DOB` DATE NOT NULL,
  `client_gender` VARCHAR(10) NOT NULL,
  `client_EmailID` VARCHAR(45) NOT NULL,
  `client_Address_Country` VARCHAR(45) NOT NULL,
  `client_Address_Province` VARCHAR(45) NOT NULL,
  `client_Address_City` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) ,
  UNIQUE INDEX `client_EmailID_UNIQUE` (`client_EmailID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Discounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Discounts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Discounts` (
  `id_discount` INT NOT NULL AUTO_INCREMENT,
  `discount_description` VARCHAR(45) NOT NULL,
  `discount_amount` INT NOT NULL,
  PRIMARY KEY (`id_discount`),
  UNIQUE INDEX `id_discount_UNIQUE` (`id_discount` ASC) ,
  UNIQUE INDEX `discount_description_UNIQUE` (`discount_description` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Genres` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Genres` (
  `id_genre` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE INDEX `id_genre_UNIQUE` (`id_genre` ASC) ,
  UNIQUE INDEX `genre_name_UNIQUE` (`genre_name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `Clients_id_client` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE INDEX `id_order_UNIQUE` (`id_order` ASC) ,
  INDEX `fk_Orders_Clients1_idx` (`Clients_id_client` ASC) ,
  CONSTRAINT `fk_Orders_Clients1`
    FOREIGN KEY (`Clients_id_client`)
    REFERENCES `mydb`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders_has_Discounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Orders_has_Discounts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Orders_has_Discounts` (
  `Orders_id_order` INT NOT NULL,
  `Discounts_id_discount` INT NOT NULL,
  PRIMARY KEY (`Orders_id_order`, `Discounts_id_discount`),
  INDEX `fk_Orders_has_Discounts_Discounts1_idx` (`Discounts_id_discount` ASC) ,
  INDEX `fk_Orders_has_Discounts_Orders1_idx` (`Orders_id_order` ASC) ,
  CONSTRAINT `fk_Orders_has_Discounts_Orders1`
    FOREIGN KEY (`Orders_id_order`)
    REFERENCES `mydb`.`Orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_Discounts_Discounts1`
    FOREIGN KEY (`Discounts_id_discount`)
    REFERENCES `mydb`.`Discounts` (`id_discount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Returns_Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Returns_Orders` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Returns_Orders` (
  `id_return_order` INT NOT NULL AUTO_INCREMENT,
  `return_date` DATE NOT NULL,
  `Albums_has_Orders_Albums_id_album` INT NOT NULL,
  `Albums_has_Orders_Orders_id_order` INT NOT NULL,
  PRIMARY KEY (`id_return_order`),
  UNIQUE INDEX `id_return_UNIQUE` (`id_return_order` ASC) ,
  INDEX `fk_Returns_Orders_Albums_has_Orders1_idx` (`Albums_has_Orders_Albums_id_album` ASC, `Albums_has_Orders_Orders_id_order` ASC) ,
  CONSTRAINT `fk_Returns_Orders_Albums_has_Orders1`
    FOREIGN KEY (`Albums_has_Orders_Albums_id_album` , `Albums_has_Orders_Orders_id_order`)
    REFERENCES `mydb`.`Albums_has_Orders` (`Albums_id_album` , `Orders_id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Singers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Singers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Singers` (
  `id_singer` INT NOT NULL AUTO_INCREMENT,
  `singer_name` VARCHAR(45) NOT NULL,
  `singer_gender` VARCHAR(10) NOT NULL,
  `singer_age` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_singer`),
  UNIQUE INDEX `id_singer_UNIQUE` (`id_singer` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Songs` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Songs` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(45) NOT NULL,
  `rating_song` INT NOT NULL,
  `Albums_id_album` INT NOT NULL,
  `Genres_id_genre` INT NOT NULL,
  PRIMARY KEY (`id_song`),
  UNIQUE INDEX `id_song_UNIQUE` (`id_song` ASC) ,
  UNIQUE INDEX `song_name_UNIQUE` (`song_name` ASC) ,
  INDEX `fk_Songs_Albums1_idx` (`Albums_id_album` ASC) ,
  INDEX `fk_Songs_Genres1_idx` (`Genres_id_genre` ASC) ,
  CONSTRAINT `fk_Songs_Albums1`
    FOREIGN KEY (`Albums_id_album`)
    REFERENCES `mydb`.`Albums` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Songs_Genres1`
    FOREIGN KEY (`Genres_id_genre`)
    REFERENCES `mydb`.`Genres` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
