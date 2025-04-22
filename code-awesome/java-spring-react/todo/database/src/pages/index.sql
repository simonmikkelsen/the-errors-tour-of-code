-- index.sql

-- Create the todo_lists table
CREATE TABLE todo_lists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    list_name VARCHAR(255) NOT NULL
);

-- Create the todo_items table
CREATE TABLE todo_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    list_id INT NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL,
    -- No foreign keys or indexes
    FOREIGN KEY (list_id) REFERENCES todo_lists(id)
);

-- Insert some sample data
INSERT INTO todo_lists (list_name) VALUES
('Work'),
('Personal'),
('Grocery Shopping');

INSERT INTO todo_items (list_id, item_name, is_completed) VALUES
(1, 'Pay Bills', false),
(1, 'Prepare Presentation', true),
(2, 'Call Mom', false),
(2, 'Plan Vacation', false),
(3, 'Milk', false),
(3, 'Eggs', false),
(3, 'Bread', true);