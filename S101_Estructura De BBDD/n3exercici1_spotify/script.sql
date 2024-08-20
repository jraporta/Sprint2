-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8mb4 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`subscriptionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`subscriptionType` (
  `subscriptionType_id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`subscriptionType_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `gender` VARCHAR(1) NOT NULL COMMENT 'Possible values:\n\'M\' = male\n\'F\' = female',
  `country` VARCHAR(2) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `subscriptionType_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_subscriptionType_idx` (`subscriptionType_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscriptionType`
    FOREIGN KEY (`subscriptionType_id`)
    REFERENCES `spotify`.`subscriptionType` (`subscriptionType_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`subscription_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`subscription_details` (
  `subscription_details_id` INT NOT NULL,
  `date_of_creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_renovation` DATETIME NULL,
  `payment_method` ENUM('paypal', 'credit_card') NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`subscription_details_id`, `user_id`),
  INDEX `fk_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`credit_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`credit_card` (
  `credit_card_id` INT NOT NULL,
  `number` INT NOT NULL,
  `month` INT(2) NULL,
  `year` INT(2) NOT NULL,
  `cvv` INT(3) NOT NULL,
  `subscription_details_id` INT NOT NULL,
  PRIMARY KEY (`credit_card_id`, `subscription_details_id`),
  INDEX `fk_subscription_details1_idx` (`subscription_details_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_details1`
    FOREIGN KEY (`subscription_details_id`)
    REFERENCES `spotify`.`subscription_details` (`subscription_details_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `paypal_id` INT NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  `subscription_details_id` INT NOT NULL,
  PRIMARY KEY (`paypal_id`, `subscription_details_id`),
  INDEX `fk_subscription_details2_idx` (`subscription_details_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_details2`
    FOREIGN KEY (`subscription_details_id`)
    REFERENCES `spotify`.`subscription_details` (`subscription_details_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_number` INT NOT NULL,
  `total` FLOAT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`, `user_id`),
  UNIQUE INDEX `order_number_UNIQUE` (`order_number` ASC) VISIBLE,
  INDEX `fk_user2_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL DEFAULT 'My playlist',
  `number_of_songs` INT UNSIGNED NOT NULL DEFAULT 0,
  `date_of_creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'possible values:\n0 = \'not deleted\'\n1 = \'deleted\'',
  `date_of_deletion` DATETIME NULL,
  PRIMARY KEY (`playlist_id`, `user_id`),
  INDEX `fk_user3_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user3`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artist` (
  `artist_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(45) NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `album_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `artist_id` INT NOT NULL,
  `year_published` INT NOT NULL,
  `cover` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`album_id`, `artist_id`),
  INDEX `fk_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`song` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `duration` INT NULL,
  `times_played` INT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`song_id`, `album_id`),
  INDEX `fk_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_has_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_has_song` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `date_added` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `song_id`, `user_id`),
  INDEX `fk_song1_idx` (`song_id` ASC) VISIBLE,
  INDEX `fk_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_user4_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user4`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`related_artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`related_artists` (
  `artist_id` INT NOT NULL,
  `artist_id1` INT NOT NULL,
  PRIMARY KEY (`artist_id`, `artist_id1`),
  INDEX `fk_artist3_idx` (`artist_id1` ASC) VISIBLE,
  INDEX `fk_artist2_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist2`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist3`
    FOREIGN KEY (`artist_id1`)
    REFERENCES `spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_follows_artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_follows_artist` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  INDEX `fk_artist4_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_user5_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user5`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist4`
    FOREIGN KEY (`artist_id`)
    REFERENCES `spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_favorite_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_favorite_songs` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  INDEX `fk_song2_idx` (`song_id` ASC) VISIBLE,
  INDEX `fk_user6_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user6`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song2`
    FOREIGN KEY (`song_id`)
    REFERENCES `spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user_favorite_albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user_favorite_albums` (
  `user_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `album_id`),
  INDEX `fk_album2_idx` (`album_id` ASC) VISIBLE,
  INDEX `fk_user7_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user7`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album2`
    FOREIGN KEY (`album_id`)
    REFERENCES `spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
