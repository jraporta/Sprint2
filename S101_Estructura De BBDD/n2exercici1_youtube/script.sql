-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema n2exercici1_youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema n2exercici1_youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n2exercici1_youtube` DEFAULT CHARACTER SET utf8mb4 ;
USE `n2exercici1_youtube` ;

-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `userName` VARCHAR(20) NULL,
  `dateOfBirth` DATE NULL,
  `sex` VARCHAR(1) NULL COMMENT 'Possible values:\n\'M\' = male\n \'F\' = female',
  `country` VARCHAR(2) NULL,
  `zipCode` VARCHAR(10) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `size` INT NULL COMMENT 'size of the video in KB',
  `fileName` VARCHAR(45) NULL,
  `duration` INT NULL COMMENT 'duration of the video in seconds',
  `thumbnail` VARCHAR(45) NULL,
  `reproductions` INT NULL,
  `likes` INT NULL,
  `dislikes` INT NULL,
  `publish_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('public', 'private', 'unlisted') NULL,
  `owner_id` INT NOT NULL,
  PRIMARY KEY (`video_id`, `owner_id`),
  INDEX `fk_user_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `fk_user`
    FOREIGN KEY (`owner_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`label` (
  `label_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`label_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`video_has_labels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`video_has_labels` (
  `video_id` INT NOT NULL,
  `label_id` INT NOT NULL,
  PRIMARY KEY (`video_id`, `label_id`),
  INDEX `fk_label1_idx` (`label_id` ASC) VISIBLE,
  INDEX `fk_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1_youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_label1`
    FOREIGN KEY (`label_id`)
    REFERENCES `n2exercici1_youtube`.`label` (`label_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`channel` (
  `channel_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `dateOfCreation` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `owner_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`, `owner_id`),
  INDEX `fk_user1_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `fk_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`channel_has_followers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`channel_has_followers` (
  `channel_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`, `user_id`),
  INDEX `fk_user2_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `n2exercici1_youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`video_has_likes_and_dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`video_has_likes_and_dislikes` (
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `type` ENUM('like', 'dislike') NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`video_id`, `user_id`),
  INDEX `fk_user3_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video2_idx` (`video_id` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video2`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1_youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user3`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `dateOfCreation` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('public', 'private') NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `user_id`),
  INDEX `fk_user4_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user4`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`playlist_has_videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`playlist_has_videos` (
  `playlist_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `fk_video3_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `n2exercici1_youtube`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video3`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1_youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`video_has_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`video_has_comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(200) NULL,
  `dateOfCreation` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`, `video_id`, `user_id`),
  INDEX `fk_video4_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_user5_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video4`
    FOREIGN KEY (`video_id`)
    REFERENCES `n2exercici1_youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user5`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n2exercici1_youtube`.`comment_has_likes_and_dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `n2exercici1_youtube`.`comment_has_likes_and_dislikes` (
  `user_id` INT NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `type` ENUM('like', 'dislike') NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_user6_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_video_has_comments1_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_user6`
    FOREIGN KEY (`user_id`)
    REFERENCES `n2exercici1_youtube`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_comments1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `n2exercici1_youtube`.`video_has_comments` (`comment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
