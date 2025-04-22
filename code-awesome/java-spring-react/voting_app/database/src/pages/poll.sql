-- poll.sql

-- Table for storing polls
CREATE TABLE polls (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing poll options
CREATE TABLE poll_options (
  id INT PRIMARY KEY AUTO_INCREMENT,
  poll_id INT NOT NULL,
  option_text VARCHAR(255) NOT NULL,
  vote_count INT DEFAULT 0,
  FOREIGN KEY (poll_id) REFERENCES polls(id) ON DELETE CASCADE
);

-- Example data for a poll
INSERT INTO polls (title, description) VALUES
('Favorite Animal', 'Which animal do you think is the cutest?');

INSERT INTO poll_options (poll_id, option_text) VALUES
(1, 'Dog'),
(1, 'Cat'),
(1, 'Rabbit'),
(1, 'Penguin');