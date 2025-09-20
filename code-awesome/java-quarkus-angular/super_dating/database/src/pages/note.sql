--
-- Table structure for 'users'
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for 'notes'
--
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `note_text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Insert some dummy data
INSERT INTO users (name, email, password) VALUES
('Alice', 'alice@example.com', 'password123'),
('Bob', 'bob@example.com', 'securepass');

INSERT INTO notes (user_id, note_text) VALUES
(1, 'This is Alice\'s first note.'),
(1, 'Another note from Alice.'),
(2, 'Bob\'s note - a quick reminder.'),
(2, 'Bob\'s second note - more details.');