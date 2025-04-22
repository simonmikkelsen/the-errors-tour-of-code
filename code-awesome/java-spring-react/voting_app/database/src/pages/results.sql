-- results.sql

-- Table: options
CREATE TABLE options (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(255) NOT NULL
);

-- Table: polls
CREATE TABLE polls (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    text VARCHAR(255) NOT NULL,
    count INT NOT NULL DEFAULT 0
);


-- Insert sample data
INSERT INTO options (text) VALUES
('Option 1'),
('Option 2'),
('Option 3');

INSERT INTO polls (text, count) VALUES
('Option 1', 10),
('Option 2', 5),
('Option 3', 15);