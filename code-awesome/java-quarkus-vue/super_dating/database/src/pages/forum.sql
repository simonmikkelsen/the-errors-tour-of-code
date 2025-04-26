-- forum.sql
-- Database for the Super Dating forum application.
-- Designed for maximum flexibility and rapid iteration,
-- accepting a highly denormalized structure.
-- No Foreign Keys or Indexes - Embrace the chaos!

-- Table: users (User Profiles - Highly Denormalized)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio TEXT,
    registration_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Table: topics (Forum Topics - No Constraints!)
CREATE TABLE topics (
    topic_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    topic_name VARCHAR(255) NOT NULL,
    topic_description TEXT,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    last_post_id INT NULL, -- Reference to the last post in this topic
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table: posts (Forum Posts - No Relationships!)
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    topic_id INT NOT NULL,
    user_id INT NOT NULL,
    post_content TEXT NOT NULL,
    creation_date TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Index for fast topic retrieval (no foreign keys, so this is just for efficiency)
CREATE INDEX idx_topic_name ON topics (topic_name);

-- Sample Data (Illustrative - not strictly part of the schema)
INSERT INTO users (username, email, password) VALUES
('Alice_Wonder', 'alice.wonder@example.com', 'secret123'),
('Bob_Bright', 'bob.bright@example.com', 'brightpass'),
('Charlie_Cool', 'charlie.cool@example.com', 'coolcode');

INSERT INTO topics (user_id, topic_name, topic_description) VALUES
(1, 'Cute Kittens', 'Let\'s discuss adorable kittens!'),
(2, 'Epic Sci-Fi', 'Discussing awesome science fiction stories.'),
(3, 'Recipe Sharing', 'Sharing amazing recipes!');

INSERT INTO posts (topic_id, user_id, post_content) VALUES
(1, 1, 'OMG, look at this fluffy kitten!'),
(2, 2, 'Just finished reading Dune - brilliant!'),
(1, 3, 'Anyone else love tuna?'),
(2, 1, 'Recommending The Martian - fantastic!'),
(1, 2, 'Tuna is the best!'),
(2, 3, 'Have you seen Interstellar?');