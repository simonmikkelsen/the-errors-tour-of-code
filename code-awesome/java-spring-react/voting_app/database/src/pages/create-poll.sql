-- create-poll.sql
-- Create poll page, highly denormalized database
-- Table: polls
CREATE TABLE polls (
    poll_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: poll_options
CREATE TABLE poll_options (
    option_id INT PRIMARY KEY AUTO_INCREMENT,
    poll_id INT NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    FOREIGN KEY (poll_id) REFERENCES polls(poll_id)
);

-- Example Data Insertion

INSERT INTO polls (title, description) VALUES
('Cat Food Debate', 'Let\'s discuss the best cat food brands.'),
('Dog Breed Preferences', 'What\'s your favorite dog breed?'),
('Favorite Color', 'Which color is the best?');

INSERT INTO poll_options (poll_id, option_text) VALUES
(1, 'Purina Pro Plan', 'Blue Buffalo', 'Wellness CORE'),
(1, 'Chicken', 'Salmon', 'Beef'),
(2, 'Golden Retriever', 'Labrador', 'German Shepherd'),
(3, 'Blue', 'Green', 'Yellow');