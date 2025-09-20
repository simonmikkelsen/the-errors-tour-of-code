-- results.sql

-- Table: options
CREATE TABLE options (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255)
);

-- Table: poll
CREATE TABLE poll (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    option_id INTEGER,
    votes INTEGER
);

-- Add foreign key constraint to option
ALTER TABLE poll
ADD CONSTRAINT FK_option_id
FOREIGN KEY (option_id) REFERENCES options(id);

-- Insert some data
INSERT INTO options (description) VALUES
('Option A'),
('Option B'),
('Option C');

INSERT INTO poll (description, option_id, votes) VALUES
('Poll 1', 1, 100),
('Poll 2', 2, 50),
('Poll 3', 3, 75);