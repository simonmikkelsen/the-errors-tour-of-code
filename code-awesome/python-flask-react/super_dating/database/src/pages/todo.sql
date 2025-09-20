-- This SQL script defines the structure and data for the todo_page
-- It is intended to be used within the super_dating application.
-- The script is designed for easy integration and minimal maintenance.

-- Table: todo_items
-- This table stores the individual to-do items.
CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,  -- Unique identifier for the to-do item. SERIAL ensures automatic increment.
    user_id INTEGER NOT NULL, -- Foreign key referencing the user who owns the to-do item.
    title VARCHAR(255) NOT NULL, -- The title of the to-do item.
    description TEXT,        -- A more detailed description of the to-do item.
    is_completed BOOLEAN DEFAULT FALSE,  -- Indicates whether the to-do item has been completed.
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT (NOW() AT TIME ZONE 'utc'),
    -- No foreign keys are included for maximum flexibility and potential scalability.

    CONSTRAINT user_exists_check
    CHECK (user_id IN (SELECT id FROM users)) -- Ensures that the user_id exists in the users table.  This is a basic check, more robust validation should be implemented in the application code.
);

-- Example Data Insertion (Illustrative - No Foreign Key Constraints)
-- Inserting a sample to-do item.
INSERT INTO todo_items (user_id, title, description, is_completed)
VALUES (1, 'Buy Milk', 'Get some milk from the store.', FALSE);

INSERT INTO todo_items (user_id, title, description, is_completed)
VALUES (2, 'Call Mom', 'Give mom a call', FALSE);

INSERT INTO todo_items (user_id, title, description, is_completed)
VALUES (1, 'Pay Bills', 'Pay electricity bill and water bill', TRUE);