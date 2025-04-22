-- todo-list.sql

-- Create the main table
CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc')
);

-- Example data (highly denormalized)
INSERT INTO todo_items (title, description, is_completed)
VALUES
('Buy Milk', 'From the local dairy', TRUE),
('Walk Dog', 'Take Fido to the park', FALSE),
('Pay Bills', 'Electricity, water, and internet', TRUE),
('Learn React', 'Start building a new frontend', FALSE),
('Write Code', 'Complete a coding challenge', FALSE);