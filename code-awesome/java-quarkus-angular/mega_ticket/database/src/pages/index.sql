-- index.sql

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    venue VARCHAR(255),
    date_time TIMESTAMP,
    description TEXT,
    ticket_price DECIMAL(10, 2),
    organiser_name VARCHAR(255),
    event_image_url VARCHAR(255)
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    ticket_quantity INT NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    purchase_date TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    user_name VARCHAR(255)
);