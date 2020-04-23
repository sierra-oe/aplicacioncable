-- MySQL Script generated by MySQL Workbench
-- mar 21 abr 2020 23:52:53
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema controlServicios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema controlServicios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `controlServicios` ;
USE `controlServicios` ;

-- -----------------------------------------------------
-- Table `controlServicios`.`zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`zona` (
  `nombrezona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombrezona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `correlativo` VARCHAR(5) NULL,
  `primernombre` VARCHAR(75) NULL,
  `segundonombre` VARCHAR(75) NULL,
  `primerapelldio` VARCHAR(75) NULL,
  `segundoapellido` VARCHAR(75) NULL,
  `direccion` TEXT NULL,
  `dpi` VARCHAR(15) NULL,
  `referencias` TEXT NULL,
  `telefono1` VARCHAR(40) NULL,
  `telefono2` VARCHAR(40) NULL,
  `nit` VARCHAR(45) NULL,
  `nombrezona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_clientes_zona1_idx` (`nombrezona` ASC),
  CONSTRAINT `fk_clientes_zona1`
    FOREIGN KEY (`nombrezona`)
    REFERENCES `controlServicios`.`zona` (`nombrezona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`puesto` (
  `idpuestos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NULL,
  `descripcion` TEXT NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`idpuestos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`empleados` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `apellido` VARCHAR(50) NULL,
  `telefono` VARCHAR(40) NULL,
  `direccion` VARCHAR(45) NULL,
  `puestos_idpuestos` INT NOT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `fk_empleados_puestos_idx` (`puestos_idpuestos` ASC),
  CONSTRAINT `fk_empleados_puestos`
    FOREIGN KEY (`puestos_idpuestos`)
    REFERENCES `controlServicios`.`puesto` (`idpuestos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`servicios` (
  `idservicio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `tarifa` DOUBLE NULL,
  `descripcion` TEXT NULL,
  `tiposervicio` VARCHAR(45) NULL,
  `disponible` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`estado` (
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `nivelautorizacion` INT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`servicioscontratados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`servicioscontratados` (
  `mesesnopagados` INT NULL,
  `subtotal` DOUBLE NULL,
  `idcliente` INT NOT NULL,
  `idservicio` INT NOT NULL,
  `contratonumero` VARCHAR(45) NOT NULL,
  `cobropactado` DOUBLE NULL,
  `duracioncontrato` INT NULL,
  `fechainicio` DATE NULL,
  `idservicioscontratados` INT NOT NULL AUTO_INCREMENT,
  `corte` VARCHAR(4) NULL,
  `nombreestado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idservicioscontratados`),
  INDEX `fk_servicioscontratados_clientes1_idx` (`idcliente` ASC),
  INDEX `fk_servicioscontratados_servicios1_idx` (`idservicio` ASC),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC),
  UNIQUE INDEX `idservicio_UNIQUE` (`idservicio` ASC),
  INDEX `fk_servicioscontratados_estado1_idx` (`nombreestado` ASC),
  CONSTRAINT `fk_servicioscontratados_clientes1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `controlServicios`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicioscontratados_servicios1`
    FOREIGN KEY (`idservicio`)
    REFERENCES `controlServicios`.`servicios` (`idservicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicioscontratados_estado1`
    FOREIGN KEY (`nombreestado`)
    REFERENCES `controlServicios`.`estado` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`cobros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`cobros` (
  `idcobro` INT NOT NULL AUTO_INCREMENT,
  `numerofactura` VARCHAR(100) NULL,
  `idempleado` INT NOT NULL,
  `fecha` DATE NULL,
  `total` DOUBLE NULL,
  `idservicioscontratados` INT NOT NULL,
  PRIMARY KEY (`idcobro`),
  INDEX `fk_cobros_empleados1_idx` USING BTREE (`idempleado`),
  INDEX `fecha` USING BTREE (`fecha`),
  INDEX `fk_cobros_servicioscontratados1_idx` (`idservicioscontratados` ASC),
  CONSTRAINT `fk_cobros_empleados1`
    FOREIGN KEY (`idempleado`)
    REFERENCES `controlServicios`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cobros_servicioscontratados1`
    FOREIGN KEY (`idservicioscontratados`)
    REFERENCES `controlServicios`.`servicioscontratados` (`idservicioscontratados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`trabajos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`trabajos` (
  `idtrabajos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NULL,
  `monto` VARCHAR(45) NULL,
  PRIMARY KEY (`idtrabajos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`trabajospendientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`trabajospendientes` (
  `idtrabajospendientes` INT NOT NULL AUTO_INCREMENT,
  `idtrabajos` INT NOT NULL,
  `fechaorden` DATE NULL,
  `fecharealizar` VARCHAR(45) NULL,
  `idservicioscontratados` INT NOT NULL,
  PRIMARY KEY (`idtrabajospendientes`),
  INDEX `fk_trabajospendientes_trabajos1_idx` (`idtrabajos` ASC),
  INDEX `fk_trabajospendientes_servicioscontratados1_idx` (`idservicioscontratados` ASC),
  CONSTRAINT `fk_trabajospendientes_trabajos1`
    FOREIGN KEY (`idtrabajos`)
    REFERENCES `controlServicios`.`trabajos` (`idtrabajos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajospendientes_servicioscontratados1`
    FOREIGN KEY (`idservicioscontratados`)
    REFERENCES `controlServicios`.`servicioscontratados` (`idservicioscontratados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`fechacorte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`fechacorte` (
  `idfechacorte` INT NOT NULL AUTO_INCREMENT,
  `fechacorte` DATE NULL,
  PRIMARY KEY (`idfechacorte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controlServicios`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controlServicios`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `auth_key` VARCHAR(32) NOT NULL,
  `permiso` INT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `password_reset_token` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `status` INT(6) NOT NULL DEFAULT 10,
  `created_at` INT(11) NOT NULL,
  `updated_at` INT(11) NOT NULL,
  `empleados_idempleado` INT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_empleados1_idx` (`empleados_idempleado` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `password_reset_token_UNIQUE` (`password_reset_token` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_user_empleados1`
    FOREIGN KEY (`empleados_idempleado`)
    REFERENCES `controlServicios`.`empleados` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
