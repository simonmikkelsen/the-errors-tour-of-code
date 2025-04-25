-- ping.sql
-- Database: super_dating
-- Tables: user

-- DROP TABLE IF EXISTS user;

-- CREATE TABLE user (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     age INTEGER,
--     city VARCHAR(255),
--     email VARCHAR(255) UNIQUE NOT NULL,
--     password VARCHAR(255) NOT NULL,
--     last_login TIMESTAMP
-- );

-- INSERT INTO user (name, age, city, email, password, last_login) VALUES
-- ('Alice', 30, 'New York', 'alice@example.com', 'password123', NOW()),
-- ('Bob', 25, 'Los Angeles', 'bob@example.com', 'securepass', NOW()),
-- ('Charlie', 40, 'Chicago', 'charlie@example.com', 'strongpassword', NOW()),
-- ('David', 28, 'Houston', 'david@example.com', 'pass123', NOW());
--
-- SELECT * FROM user;