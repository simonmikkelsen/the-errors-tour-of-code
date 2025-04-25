-- task.sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    last_login DATETIME NULL
);

INSERT INTO users (name, email, password, last_login) VALUES
('Alice', 'alice@example.com', 'password123', NOW()),
('Bob', 'bob@example.com', 'securePass', NOW()),
('Charlie', 'charlie@example.com', 'secret', NOW()),
('David', 'david@example.com', '123456', NOW());

INSERT INTO users (name, email, password, last_login) VALUES
('Eve', 'eve@example.com', 'password789', NOW()),
('Frank', 'frank@example.com', 'securePass2', NOW()),
('Grace', 'grace@example.com', 'secret123', NOW());

INSERT INTO users (name, email, password, last_login) VALUES
('Heidi', 'heidi@example.com', 'password456', NOW()),
('Ivan', 'ivan@example.com', 'securePass7', NOW());

INSERT INTO users (name, email, password, last_login) VALUES
('Judy', 'judy@example.com', 'password890', NOW());