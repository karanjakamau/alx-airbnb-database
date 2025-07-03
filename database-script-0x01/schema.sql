
-- DATABASE
CREATE DATABASE IF NOT EXISTS `alx_airbnb`
  DEFAULT CHARACTER SET utf8mb4 
  COLLATE utf8mb4_0900_ai_ci;

USE `alx_airbnb`;

-- USER TABLE
CREATE TABLE `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(20),
  `role` ENUM('guest', 'host', 'admin') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
);

-- PROPERTY TABLE
CREATE TABLE `property` (
  `property_id` INT NOT NULL AUTO_INCREMENT,
  `host_id` INT NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `description` TEXT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `pricepernight` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`property_id`),
  FOREIGN KEY (`host_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);

-- BOOKING TABLE
CREATE TABLE `booking` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `property_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `status` ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);

-- PAYMENT TABLE
CREATE TABLE `payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `payment_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`booking_id`) REFERENCES `booking`(`booking_id`) ON DELETE CASCADE
);

-- REVIEW TABLE
CREATE TABLE `review` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `property_id` INT NOT NULL,
  `rating` INT NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
  `comment` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  FOREIGN KEY (`booking_id`) REFERENCES `booking`(`booking_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`property_id`) REFERENCES `property`(`property_id`) ON DELETE CASCADE
);

-- MESSAGE TABLE
CREATE TABLE `message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `sender_id` INT NOT NULL,
  `recipient_id` INT NOT NULL,
  `message_body` TEXT NOT NULL,
  `sent_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  FOREIGN KEY (`sender_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`recipient_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE
);
