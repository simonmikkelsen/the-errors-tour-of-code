-- File: profile.sql
-- Database: Super_dating
-- Version: 1.0

-- Drop table if exists
DROP TABLE IF EXISTS `profile`;

-- Create table
CREATE TABLE `profile` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `user_id` INTEGER,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `bio` TEXT,
    `age` INTEGER,
    `gender` VARCHAR(255),
    `preferences` TEXT,
    `image_url` VARCHAR(255),
    `location_lat` REAL,
    `location_lon` REAL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert some sample data
INSERT INTO `profile` (`user_id`, `username`, `email`, `password`, `bio`, `age`, `gender`, `preferences`, `image_url`, `location_lat`, `location_lon`)
VALUES
(1, 'CuteBunny88', 'cutebunny@email.com', 'password123', 'A fluffy bunny who loves carrots!', 25, 'Female', 'Likes: carrots, playing, cuddles.', 'https://example.com/bunny.jpg', 34.0522, -118.2437),
(2, 'SleepyCat22', 'sleepycat@email.com', 'catpassword', 'A sleepy cat who loves naps!', 30, 'Male', 'Likes: naps, milk, scratching.', 'https://example.com/cat.jpg', 37.7749, -122.4194),
(3, 'WittyWolf99', 'wittywolf@email.com', 'wolfcode', 'A clever wolf who loves puzzles.', 40, 'Male', 'Likes: puzzles, howling, running.', 'https://example.com/wolf.jpg', 40.7128, -74.0060),
(4, 'HappyDog123', 'happydog@email.com', 'doglife', 'A happy dog who loves playing fetch!', 28, 'Female', 'Likes: fetch, treats, walks.', 'https://example.com/dog.jpg', 34.0522, -118.2437),
(5, 'SilentMouse', 'silentmouse@email.com', 'mousecode', 'A quiet mouse who loves cheese!', 22, 'Female', 'Likes: cheese, hiding, exploring.', 'https://example.com/mouse.jpg', 37.7749, -122.4194);