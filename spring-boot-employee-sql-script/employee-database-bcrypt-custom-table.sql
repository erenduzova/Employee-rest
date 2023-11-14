USE `employee_directory`;

DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
`user_id` varchar(50) NOT NULL,
`password` char(68) NOT NULL,
`active` tinyint NOT NULL,
PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `roles` (
`user_id` varchar(50) NOT NULL,
`role` varchar(50) NOT NULL,
UNIQUE KEY `authorities5_idx_1` (`user_id`, `role`),
CONSTRAINT `authorities5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `members`
VALUES
('john', '{bcrypt}$2a$10$QsDQCmJ83/jSFKbvjvvtbeaRgLbBoPwZvASs/fSOvcc5Wpj6OPKBi', 1),
('mary', '{bcrypt}$2a$10$0p08nrUWpVp2rtcmH7n.KeiJ8lenzsx3HJRk2ezNgXs/QrxLhBEYy', 1),
('eren', '{bcrypt}$2a$10$iLPr.hTTGTKYSshZ5UImaeI3dpDBc93DNuK8mz3hT9LvF3TpPs6ru', 1);


INSERT INTO `roles`
VALUES
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('eren', 'ROLE_EMPLOYEE'),
('eren', 'ROLE_MANAGER'),
('eren', 'ROLE_ADMIN');