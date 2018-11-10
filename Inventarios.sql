-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inventarios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inventarios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inventarios` DEFAULT CHARACTER SET utf8 ;
USE `Inventarios` ;

-- -----------------------------------------------------
-- Table `Inventarios`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventarios`.`Clientes` (
  `idClientes` INT NOT NULL,
  `NombresCliente` VARCHAR(100) NULL,
  `ApellidosCliente` VARCHAR(100) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventarios`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventarios`.`Ventas` (
  `idVentas` INT NOT NULL,
  `FechaVenta` DATE NULL,
  `MontoVenta` FLOAT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  INDEX `fk_Ventas_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Inventarios`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventarios`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventarios`.`Facturas` (
  `idFacturas` INT NOT NULL,
  `FechaFactura` DATE NULL,
  `MontoFactura` FLOAT NULL,
  `Ventas_idVentas` INT NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`idFacturas`),
  INDEX `fk_Facturas_Ventas_idx` (`Ventas_idVentas` ASC) VISIBLE,
  INDEX `fk_Facturas_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Facturas_Ventas`
    FOREIGN KEY (`Ventas_idVentas`)
    REFERENCES `Inventarios`.`Ventas` (`idVentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facturas_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Inventarios`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventarios`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventarios`.`Productos` (
  `idProductos` INT NOT NULL,
  `DescripcionProducto` VARCHAR(200) NULL,
  `ClaveProducto` VARCHAR(45) NULL,
  `CodigoBarras` VARCHAR(45) NULL,
  PRIMARY KEY (`idProductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventarios`.`DetalleVentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventarios`.`DetalleVentas` (
  `Ventas_idVentas` INT NOT NULL,
  `Productos_idProductos` INT NOT NULL,
  `CantidadProducto` INT NULL,
  PRIMARY KEY (`Ventas_idVentas`, `Productos_idProductos`),
  INDEX `fk_Ventas_has_Productos_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  INDEX `fk_Ventas_has_Productos_Ventas1_idx` (`Ventas_idVentas` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_has_Productos_Ventas1`
    FOREIGN KEY (`Ventas_idVentas`)
    REFERENCES `Inventarios`.`Ventas` (`idVentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_has_Productos_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `Inventarios`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
