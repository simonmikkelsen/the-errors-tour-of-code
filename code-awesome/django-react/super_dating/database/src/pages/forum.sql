-- forum.sql

-- This script creates the 'forum' database table.
-- It is intentionally highly denormalized for demonstration purposes.
-- DO NOT use this design in production.

CREATE TABLE IF NOT EXISTS forum (
    id SERIAL PRIMARY KEY,
    topic_name VARCHAR(255) NOT NULL,
    post_content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT, --Foreign key is removed for denormalization
    like_count INT DEFAULT 0,
    comment_count INT DEFAULT 0
);


-- Example data (optional)
INSERT INTO forum (topic_name, post_content, user_id, like_count, comment_count)
VALUES
('Awesome React Discussion', 'This is a fantastic discussion about React!', 1, 5, 2),
('Django Development Tips', 'Some helpful tips for Django development.', 2, 10, 5),
('React vs. Angular', 'A comparison of React and Angular.', 3, 2, 1),
('Node.js Best Practices', 'Some best practices for Node.js development.', 1, 7, 3),
('Python Web Frameworks', 'A discussion on different Python web frameworks.', 2, 3, 1);