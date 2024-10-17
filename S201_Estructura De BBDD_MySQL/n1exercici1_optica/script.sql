-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema n1_exercici1_optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema n1_exercici1_optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n1_exercici1_optica` DEFAULT CHARACTER SET utf8mb4 ;
USE `n1_exercici1_optica` ;

-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`direccion` (
  `direccion_id` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT UNSIGNED NULL,
  `piso` VARCHAR(10) NULL,
  `puerta` VARCHAR(10) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`direccion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`proveedor` (
  `proveedor_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion_id` INT NULL,
  `telefono` INT(9) NOT NULL,
  `fax` INT NULL,
  `nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`proveedor_id`),
  INDEX `fk_proveedor_direccion1_idx` (`direccion_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `n1_exercici1_optica`.`direccion` (`direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`marca` (
  `marca_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `proveedor_id` INT NOT NULL,
  PRIMARY KEY (`marca_id`),
  INDEX `fk_proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `n1_exercici1_optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`gafas` (
  `gafas_id` INT NOT NULL AUTO_INCREMENT,
  `marca_id` INT NOT NULL,
  `montura` ENUM('pasta', 'flotante', 'metalica') NULL,
  `graduacion_derecho` VARCHAR(20) NULL,
  `graduacion_izquierdo` VARCHAR(20) NULL,
  `color_montura` VARCHAR(20) NULL,
  `color_derecho` VARCHAR(20) NULL,
  `color_izquierdo` VARCHAR(20) NULL,
  `precio` FLOAT NULL,
  PRIMARY KEY (`gafas_id`),
  INDEX `fk_marca1_idx` (`marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `n1_exercici1_optica`.`marca` (`marca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccionPostal_id` INT NULL,
  `telefono` INT(9) NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `recomendadoPor_id` INT NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `fk_cliente_cliente1_idx` (`recomendadoPor_id` ASC) VISIBLE,
  INDEX `fk_cliente_direccion1_idx` (`direccionPostal_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_cliente1`
    FOREIGN KEY (`recomendadoPor_id`)
    REFERENCES `n1_exercici1_optica`.`cliente` (`cliente_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_direccion1`
    FOREIGN KEY (`direccionPostal_id`)
    REFERENCES `n1_exercici1_optica`.`direccion` (`direccion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`empleado` (
  `empleado_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`empleado_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1_exercici1_optica`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n1_exercici1_optica`.`venta` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `gafas_gafas_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `empleado_id` INT NOT NULL,
  PRIMARY KEY (`venta_id`),
  INDEX `fk_venta_gafas1_idx` (`gafas_gafas_id` ASC) VISIBLE,
  INDEX `fk_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_gafas1`
    FOREIGN KEY (`gafas_gafas_id`)
    REFERENCES `n1_exercici1_optica`.`gafas` (`gafas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `n1_exercici1_optica`.`cliente` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `n1_exercici1_optica`.`empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
