-- Database: super_dating
-- Schema: public

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    favorite_animal VARCHAR(255),
    last_login TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pantomime_horses (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(255),
    age INT,
    color VARCHAR(255),
    riding_style VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL REFERENCES users(id),
    recipient_id INT NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS favorite_animals (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    animal_name VARCHAR(255) NOT NULL
);


INSERT INTO users (username, email, password, favorite_animal) VALUES
('Bella', 'bella@example.com', 'password123', 'Horse'),
('Sparky', 'sparky@example.com', 'securepass', 'Pony'),
('Pip', 'pip@example.com', 'secret1', 'Donkey');

INSERT INTO pantomime_horses (user_id, name, breed, age, color, riding_style) VALUES
(1, 'Romeo', 'Arabian', 5, 'Brown', 'Classical'),
(2, 'Princess', 'Miniature', 3, 'White', 'Trick'),
(3, 'Dottie', 'Fjord', 7, 'Gray', 'Western');

INSERT INTO messages (sender_id, recipient_id, content) VALUES
(1, 2, 'Hi Sparky, love your pony!'),
(2, 1, 'Hey Bella, Romeo is gorgeous!'),
(1, 3, 'Dottie, you are a cutie!'),
(2, 3, 'Greetings Dottie, a lovely donkey!');