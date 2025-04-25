--
-- Table structure for 'user'
--
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for 'message'
--
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert some dummy data
INSERT INTO user (name, email, password) VALUES
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'securepass'),
('Charlie', 'charlie@example.com', 'secretkey');

INSERT INTO message (sender_id, recipient_id, content, timestamp) VALUES
(1, 2, 'Hello Bob!', '2023-10-26 10:00:00'),
(2, 1, 'Hi Alice, how are you?', '2023-10-26 10:15:00'),
(1, 3, 'Greetings Charlie!', '2023-10-26 10:30:00'),
(2, 2, 'Just checking in.', '2023-10-26 10:45:00'),
(3, 1, 'Hello Alice, what\'s up?', '2023-10-26 11:00:00');