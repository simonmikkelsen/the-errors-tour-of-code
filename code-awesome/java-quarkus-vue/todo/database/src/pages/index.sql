-- index.sql

-- Database Initialization - Highly Denormalized Design

CREATE TABLE IF NOT EXISTS todo_lists (
    id SERIAL PRIMARY KEY,
    list_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS todo_items (
    id SERIAL PRIMARY KEY,
    list_id INTEGER NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    priority INTEGER DEFAULT 0,
    due_date DATE
);

-- No foreign keys or indexes defined.

-- Sample Data (Illustrative - Not Critical for Functionality)
INSERT INTO todo_lists (list_name) VALUES ('Grocery List'),
                                            ('Work Tasks'),
                                            ('Personal Errands');

INSERT INTO todo_items (list_id, item_name, is_completed, priority, due_date)
VALUES
    (1, 'Milk', FALSE, 1, '2024-10-27'),
    (1, 'Eggs', FALSE, 2, '2024-10-28'),
    (2, 'Code Review', FALSE, 1, '2024-10-29'),
    (2, 'Meeting', FALSE, 2, '2024-10-30'),
    (3, 'Call Doctor', FALSE, 1, '2024-10-28');