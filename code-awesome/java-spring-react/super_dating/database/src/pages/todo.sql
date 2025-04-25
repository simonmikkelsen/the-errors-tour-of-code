CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

INSERT INTO users (username, password, email) VALUES
('Alice', 'secretpassword123', 'alice@example.com'),
('Bob', 'anothersecret', 'bob@example.com'),
('Charlie', 'passwordsafe', 'charlie@example.com');