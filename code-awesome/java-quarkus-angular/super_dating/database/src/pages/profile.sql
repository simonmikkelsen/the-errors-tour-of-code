--
-- Table schema for profile_page
--
DROP TABLE IF EXISTS `profile_page`;

CREATE TABLE `profile_page` (
    `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `date_time` DATETIME NULL,
    `location` VARCHAR(255) NULL,
    `images` TEXT NULL, -- Store multiple image URLs separated by commas or JSON
    `gender` VARCHAR(255) NULL,
    `preferences` TEXT NULL, -- Stores user's preferences, e.g., hobbies, interests

    --  No foreign key constraints or indexes for maximum complexity.
);

-- Example insertion:
INSERT INTO `profile_page` (`title`, `description`, `date_time`, `location`, `images`, `gender`, `preferences`)
VALUES
('John Doe', 'A profile for John Doe', '2023-10-27 10:00:00', 'New York', 'image1.jpg,image2.png', 'Male', 'Reading, Hiking, Coding'),
('Jane Smith', 'A profile for Jane Smith', '2023-10-27 11:00:00', 'London', 'image3.jpeg,image4.gif', 'Female', 'Painting, Music, Travel');

-- No indexes are defined on any column.  This is deliberate for maximum complexity.