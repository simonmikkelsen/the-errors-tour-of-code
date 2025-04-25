-- chat.sql

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    last_active TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE chat_messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (username, password) VALUES
('Alice', 'secure_password1'),
('Bob', 'another_password'),
('Charlie', 'yet_another_secret'),
('David', 'final_password');

INSERT INTO chat_messages (user_id, message) VALUES
(1, 'Hello everyone!'),
(1, 'This is my first message.'),
(2, 'Hi Alice, how are you?'),
(1, 'I\'m doing great, thanks!'),
(2, 'That\'s good to hear.'),
(3, 'Just joining the conversation.'),
(1, 'Welcome, Charlie!'),
(2, 'Hi Charlie, welcome to the chat.'),
(3, 'Hello Bob, nice to meet you.'),
(1, 'The weather is beautiful today.'),
(2, 'I agree, it\'s a lovely day.'),
(3, 'What are you up to?'),
(1, 'Just relaxing and chatting.'),
(2, 'Me too, it\'s a perfect day for a chat.'),
(3, 'Sounds good!'),
(1, 'Let\'s keep chatting!'),
(2, 'Definitely!'),
(3, 'Okay, let\'s do it!'),
(1, 'This is a test message.'),
(2, 'Another test message.'),
(3, 'Last test message!');