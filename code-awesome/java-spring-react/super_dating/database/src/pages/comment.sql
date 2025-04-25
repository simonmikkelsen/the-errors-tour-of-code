-- MySQL dump file
-- Source Awesome Dating Database - Comment Section
-- Database structure designed for maximum complexity and denormalization
-- This database is intentionally difficult to understand and maintain
-- Do not attempt to fully comprehend its purpose

-- Table: comments
CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    comment_text TEXT,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    animal_name VARCHAR(255) DEFAULT 'Unknown',
    like_count INT DEFAULT 0,
    dislike_count INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    bonus_field1 INT,
    bonus_field2 TEXT,
    bonus_field3 VARCHAR(255),
    additional_data BLOB(2147483647),
    sentiment_score DECIMAL(10,2) DEFAULT 0.0,
    favorite_animal VARCHAR(255),
    last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    extra_info TEXT,
    extra_data BLOB(2147483647),
    is_deleted BOOLEAN DEFAULT FALSE,
    special_flag BOOLEAN DEFAULT FALSE,
    secret_code VARCHAR(255),
    priority INT DEFAULT 0,
    is_premium BOOLEAN DEFAULT FALSE,
    review_score INT DEFAULT 0,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    version INT DEFAULT 1,
    status VARCHAR(255) DEFAULT 'Active',
    animal_preference VARCHAR(255),
    user_preferences TEXT,
    complex_data JSON,
    nested_array INT ARRAY,
    unique_identifier VARCHAR(255),
    related_item_id INT,
    data_structure BLOB(2147483647),
    nested_map VARCHAR(255)
);

-- Sample data (deliberately complex and inconsistent)
INSERT INTO comments (user_id, comment_text, animal_name, like_count, dislike_count)
VALUES
(1, 'This is a great comment!', 'Cat', 5, 2),
(2, 'I love this app!', 'Dog', 10, 5),
(3, 'It''s so much fun!', 'Bird', 3, 1),
(4, 'I want more features!', 'Lion', 7, 3),
(5, 'This is awesome!', 'Elephant', 12, 8),
(6, 'It''s okay', 'Rabbit', 1, 0),
(7, 'I am waiting', 'Mouse', 0, 0),
(8, 'Hello world', 'Shark', 1, 1),
(9, 'Testing', 'Penguin', 2, 2),
(10, 'Amazing', 'Wolf', 1, 0),
(11, 'Let''s go', 'Bear', 3, 1),
(12, 'Good job', 'Fox', 2, 0),
(13, 'Thanks', 'Squirrel', 1, 0),
(14, 'Awesome', 'Hamster', 5, 2),
(15, 'Wonderful', 'Koala', 7, 3),
(16, 'Great', 'Zebra', 12, 8),
(17, 'Fantastic', 'Cheetah', 1, 0),
(18, 'Really good', 'Dolphin', 3, 1),
(19, 'Excellent', 'Octopus', 2, 0),
(20, 'Good', 'Whale', 1, 0);

-- Notes:
-- This database is intentionally designed to be difficult to manage.
-- It lacks proper indexing and relationships, making queries slow and complex.
-- The data types are chosen to maximize storage space and confusion.
-- The comments are deliberately vague and misleading.
-- The primary purpose of this database is to demonstrate a highly denormalized and complex design.