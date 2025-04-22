-- todo-list.sql

-- Table structure for todo_list
CREATE TABLE todo_list (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    task VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT false
);

-- Sample data (optional - for demonstration purposes)
INSERT INTO todo_list (title, description, task) VALUES
('Grocery Shopping', 'Buy milk, bread, and eggs.', 'Buy groceries'),
('Laundry', 'Wash clothes.', 'Do laundry'),
('Pay Bills', 'Pay electricity and water bills.', 'Pay bills');