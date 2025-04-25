-- todo.sql

-- Create the todo table
CREATE TABLE IF NOT EXISTS todo (
    id serial,
    title varchar(255) NOT NULL,
    description text,
    completed boolean NOT NULL DEFAULT false,
    animal_name varchar(255)
);

-- Insert some sample data
INSERT INTO todo (title, description, completed, animal_name) VALUES
('Buy Milk', 'Need milk for the kids', true, 'Dog'),
('Walk the Dog', 'A walk with my furry friend', false, 'Dog'),
('Wash the Car', 'Keep the car shiny', true, 'Cat'),
('Do Laundry', 'Wash all the clothes', false, 'Rabbit'),
('Read a Book', 'A good book is relaxing', true, 'Mouse'),
('Write Code', 'Create a cool app', false, 'Monkey');

-- Example data for the animal_name column
SELECT * FROM todo;