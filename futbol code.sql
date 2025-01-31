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
-- Table `mydb`.`jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jugadores` (
  `IdJugadores` INT NOT NULL,
  `NombreJugador` VARCHAR(100) NULL,
  `FechaNacimientoJugador` VARCHAR(45) NULL,
  `PosicionJugador` VARCHAR(45) NULL,
  `NumerodeCamiseta` DECIMAL(3) NULL,
  `PertenecealEquipo` VARCHAR(45) NULL,
  `FechaIncorporacion` VARCHAR(45) NULL,
  PRIMARY KEY (`IdJugadores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plantilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plantilla` (
  `IdPlantilla` INT NOT NULL,
  `idEquipo` VARCHAR(45) NULL,
  `IdJugador` INT NULL,
  `Posicion` VARCHAR(45) NULL,
  `N°Camiseta` VARCHAR(45) NULL,
  `FechaIncorporacion` DATE NULL,
  PRIMARY KEY (`IdPlantilla`),
  CONSTRAINT `Fk_jugador`
    FOREIGN KEY ()
    REFERENCES `mydb`.`jugadores` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipos` (
  `IdEquipos` INT NOT NULL,
  `NombreEquipos` VARCHAR(100) NULL,
  `CiudadOrigen` VARCHAR(45) NULL,
  `EstadioLocal` VARCHAR(45) NULL,
  `AñoFundado` DATE NULL,
  `ColoresdeEquipos` VARCHAR(45) NULL,
  `Entrenador` VARCHAR(45) NULL,
  PRIMARY KEY (`IdEquipos`),
  CONSTRAINT `Fk_Equipos`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Plantilla` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Partidos` (
  `IdPartidos` INT NOT NULL,
  `Fecha-HoraPartido` VARCHAR(45) NULL,
  `PartidoLocal-Visitante` VARCHAR(45) NULL,
  `ResultadoPartido` VARCHAR(45) NULL,
  `GolesporEquipo` VARCHAR(45) NULL,
  `TarjetasAmarillas` DECIMAL(3) NULL,
  `TarjetasRojas` DECIMAL(3) NULL,
  `EstadiodeJuego` VARCHAR(45) NULL,
  PRIMARY KEY (`IdPartidos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clasificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clasificacion` (
  `Idclasificacion` INT NOT NULL,
  `PosicionLiga` VARCHAR(45) NULL,
  `PuntosObtenidos` VARCHAR(45) NULL,
  `PartidosJugados` INT NULL,
  `Victorias-Empate-Derrota` VARCHAR(45) NULL,
  `Goles-aFavor` VARCHAR(45) NULL,
  `clasificacioncol` VARCHAR(45) NULL,
  `Goles-Encontra` VARCHAR(45) NULL,
  PRIMARY KEY (`Idclasificacion`),
  INDEX `FK_Clasificacion_idx` (`PartidosJugados` ASC) VISIBLE,
  CONSTRAINT `FK_Clasificacion`
    FOREIGN KEY (`PartidosJugados`)
    REFERENCES `mydb`.`Partidos` (`IdPartidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estadisticas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estadisticas` (
  `Idestadisticas` INT NOT NULL,
  `Goleadores` VARCHAR(45) NULL,
  `Asistencias` VARCHAR(45) NULL,
  `MejoresPorteros` VARCHAR(45) NULL,
  PRIMARY KEY (`Idestadisticas`),
  CONSTRAINT `FK_Estadisticas`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Partidos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eventos especiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`eventos especiales` (
  `IdEventosEspeciales` INT NOT NULL,
  `LesionJugadores` VARCHAR(45) NULL,
  `Transfers-jugadores-Llegan-o-se Van` VARCHAR(45) NULL,
  `Sanciones` VARCHAR(45) NULL,
  PRIMARY KEY (`IdEventosEspeciales`),
  CONSTRAINT `FK_Eventos`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Plantilla` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arbitros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arbitros` (
  `IdArbitros` INT NOT NULL,
  `NombreArbitro` VARCHAR(45) NULL,
  `FechaNaciArbitro` VARCHAR(45) NULL,
  `NacionalidadArb` VARCHAR(45) NULL,
  `ExperienciaArb` VARCHAR(45) NULL,
  `PartidosDirigidos` DECIMAL(4) NULL,
  PRIMARY KEY (`IdArbitros`),
  CONSTRAINT `Fk_Arbitros`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Partidos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
