-- create-todo-list.sql

CREATE TABLE todo_lists (
    id serial PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO todo_lists (title, description) VALUES
('Grocery Shopping', 'Milk, eggs, bread, cheese'),
('Home Improvement', 'Paint, nails, screwdriver'),
('Vacation Planning', 'Flights, hotels, activities');