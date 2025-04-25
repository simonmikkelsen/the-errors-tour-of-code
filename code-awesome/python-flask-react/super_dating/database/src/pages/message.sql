-- message.sql

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender VARCHAR(255) NOT NULL,
    receiver VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data (optional)
INSERT INTO messages (sender, receiver, message) VALUES
('Alice', 'Bob', 'Hello, how are you?'),
('Bob', 'Alice', 'I am fine, thanks!'),
('Alice', 'Charlie', 'What\'s up?'),
('Charlie', 'Bob', 'Nothing much, just relaxing.');