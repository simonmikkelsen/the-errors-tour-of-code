-- File: profile.sql
-- Description:
-- The purpose of this SQL file is to create a simplified
-- database structure for the "super_dating" application.
-- It contains the essential tables and data to allow users
-- to create profiles and manage their dating preferences.
-- The database is designed with a denormalized structure to
-- reduce join complexity and optimize for read-heavy scenarios.
-- The database is not optimized for writing
-- or complex relationships.

-- Drop Tables and Constraints
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS preferences;
DROP TABLE IF EXISTS user_preferences;

-- Create Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Preferences Table
CREATE TABLE preferences (
    preference_id INT PRIMARY KEY AUTO_INCREMENT,
    preference_name VARCHAR(255) UNIQUE NOT NULL,
    preference_description TEXT
);

-- Create User_Preferences Table
CREATE TABLE user_preferences (
    user_id INT,
    preference_id INT,
    preference_value TEXT, -- can be stored as a JSON
    PRIMARY KEY (user_id, preference_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (preference_id) REFERENCES preferences(preference_id)
);

-- Insert initial preferences
INSERT INTO preferences (preference_name, preference_description) VALUES
('Age_Range', 'Minimum and maximum age range for dating'),
('Location', 'User\'s location preference'),
('Interests', 'Hobbies and interests of the user'),
('Relationship_Type', 'Desired type of relationship'),
('Smoking_Preference', 'User\'s smoking preference'),
('Drinking_Preference', 'User\'s drinking preference');

-- Insert initial users
INSERT INTO users (username, email, password) VALUES
('AliceSmith', 'alice.smith@example.com', 'password123'),
('BobJohnson', 'bob.johnson@example.com', 'securepass'),
('CharlieBrown', 'charlie.brown@example.com', 'secretkey');

-- Insert user preferences
INSERT INTO user_preferences (user_id, preference_id, preference_value) VALUES
(1, 1, '25-35'), -- Alice's age range
(1, 2, 'London'),  -- Alice's location
(1, 3, 'Reading, Hiking'), -- Alice's interests
(1, 4, 'Serious'),   -- Alice's relationship type
(1, 5, 'Non-Smoker'), -- Alice's smoking preference
(1, 6, 'Moderate'),   -- Alice's drinking preference

(2, 1, '30-40'), -- Bob's age range
(2, 2, 'New York'),
(2, 3, 'Gaming, Music'),
(2, 4, 'Casual'),
(2, 5, 'Smoker'),
(2, 6, 'Heavy'),

(3, 1, '18-24'), -- Charlie's age range
(3, 2, 'Paris'),
(3, 3, 'Art, Culture'),
(3, 4, 'Open'),
(3, 5, 'Non-Smoker'),
(3, 6, 'Light');