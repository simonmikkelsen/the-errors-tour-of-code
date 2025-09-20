-- todo-list.sql

-- Table: todo_lists
CREATE TABLE todo_lists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

-- Table: todo_items
CREATE TABLE todo_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_list_id INT NOT NULL,
    task_name VARCHAR(255) NOT NULL,
    description TEXT,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (todo_list_id) REFERENCES todo_lists(id)
);


-- Sample data for todo_lists
INSERT INTO todo_lists (title, description) VALUES
('Grocery Shopping', 'Items to buy from the supermarket'),
('Home Repairs', 'Tasks around the house'),
('Work Projects', 'Current work assignments');

-- Sample data for todo_items
INSERT INTO todo_items (todo_list_id, task_name, description, is_completed) VALUES
(1, 'Milk', '2% milk', FALSE),
(1, 'Eggs', '1 dozen eggs', TRUE),
(1, 'Bread', 'Whole wheat bread', FALSE),
(2, 'Fix leaky faucet', 'Call a plumber', FALSE),
(2, 'Paint the living room', 'Neutral colors', FALSE),
(3, 'Prepare presentation', 'For the client meeting', FALSE),
(3, 'Write project proposal', 'Detailed document', FALSE);