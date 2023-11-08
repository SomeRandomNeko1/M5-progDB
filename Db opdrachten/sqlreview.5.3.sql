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
-- Table `mydb`.`gamer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`gamer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`gamer` (
  `Usernaam` INT NOT NULL,
  `Levels` VARCHAR(45) NULL,
  `rank` VARCHAR(45) NULL,
  PRIMARY KEY (`Usernaam`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`games` ;

CREATE TABLE IF NOT EXISTS `mydb`.`games` (
  `gameName` INT NOT NULL,
  `age` VARCHAR(45) NULL,
  `ID` VARCHAR(45) NULL,
  `gamer_Usernaam` INT NOT NULL,
  PRIMARY KEY (`gameName`, `gamer_Usernaam`),
  INDEX `fk_games_gamer_idx` (`gamer_Usernaam` ASC) VISIBLE,
  CONSTRAINT `fk_games_gamer`
    FOREIGN KEY (`gamer_Usernaam`)
    REFERENCES `mydb`.`gamer` (`Usernaam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`game-achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`game-achievements` ;

CREATE TABLE IF NOT EXISTS `mydb`.`game-achievements` (
  `idgame-achievements` INT NOT NULL,
  `finish-game` VARCHAR(45) NULL,
  `games_gameName` INT NOT NULL,
  `games_gamer_Usernaam` INT NOT NULL,
  PRIMARY KEY (`idgame-achievements`, `games_gameName`, `games_gamer_Usernaam`),
  INDEX `fk_game-achievements_games1_idx` (`games_gameName` ASC, `games_gamer_Usernaam` ASC) VISIBLE,
  CONSTRAINT `fk_game-achievements_games1`
    FOREIGN KEY (`games_gameName` , `games_gamer_Usernaam`)
    REFERENCES `mydb`.`games` (`gameName` , `gamer_Usernaam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer-achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`gamer-achievements` ;

CREATE TABLE IF NOT EXISTS `mydb`.`gamer-achievements` (
  `idgamer-achievements` INT NOT NULL,
  `ID` VARCHAR(45) NULL,
  PRIMARY KEY (`idgamer-achievements`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gamer_has_gamer-achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`gamer_has_gamer-achievements` ;

CREATE TABLE IF NOT EXISTS `mydb`.`gamer_has_gamer-achievements` (
  `gamer_Usernaam` INT NOT NULL,
  `gamer-achievements_idgamer-achievements` INT NOT NULL,
  PRIMARY KEY (`gamer_Usernaam`, `gamer-achievements_idgamer-achievements`),
  INDEX `fk_gamer_has_gamer-achievements_gamer-achievements1_idx` (`gamer-achievements_idgamer-achievements` ASC) VISIBLE,
  INDEX `fk_gamer_has_gamer-achievements_gamer1_idx` (`gamer_Usernaam` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_gamer-achievements_gamer1`
    FOREIGN KEY (`gamer_Usernaam`)
    REFERENCES `mydb`.`gamer` (`Usernaam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_gamer-achievements_gamer-achievements1`
    FOREIGN KEY (`gamer-achievements_idgamer-achievements`)
    REFERENCES `mydb`.`gamer-achievements` (`idgamer-achievements`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
