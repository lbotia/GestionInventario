-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bd_gi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_gi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_gi` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `bd_gi` ;

-- -----------------------------------------------------
-- Table `bd_gi`.`Almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_gi`.`Almacen` (
  `idAlmacen` INT NOT NULL,
  `nombre_almacen` VARCHAR(45) NOT NULL,
  `ubicacion_almacen` VARCHAR(45) NOT NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`idAlmacen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_gi`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_gi`.`Producto` (
  `idProducto` INT NOT NULL,
  `idAlmacen` INT NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `precio_costo` FLOAT NOT NULL,
  `precio_venta` FLOAT NOT NULL,
  `estado` TINYINT NOT NULL,
  `fecha_ingreso` DATETIME NOT NULL,
  PRIMARY KEY (`idProducto`, `idAlmacen`),
  INDEX `fk_Producto_Almacen1_idx` (`idAlmacen` ASC),
  CONSTRAINT `fk_Producto_Almacen1`
    FOREIGN KEY (`idAlmacen`)
    REFERENCES `bd_gi`.`Almacen` (`idAlmacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_gi`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_gi`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `nombre_proveedor` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_gi`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_gi`.`Stock` (
  `idProducto` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `operacion` CHAR(1) NOT NULL,
  PRIMARY KEY (`idProducto`, `idProveedor`),
  INDEX `fk_Producto_has_Proveedor_Proveedor1_idx` (`idProveedor` ASC),
  INDEX `fk_Producto_has_Proveedor_Producto_idx` (`idProducto` ASC),
  CONSTRAINT `fk_Producto_has_Proveedor_Producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `bd_gi`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Proveedor_Proveedor1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `bd_gi`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_gi`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_gi`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
