USE `employee_directory`;

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `authorities`;

CREATE TABLE `users` (
`username` varchar(50) NOT NULL,
`password` char(68) NOT NULL,
`enabled` tinyint NOT NULL,
PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `authorities` (
`username` varchar(50) NOT NULL,
`authority` varchar(50) NOT NULL,
UNIQUE KEY `authorities_idx_1` (`username`, `authority`),
CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users`
VALUES
('john', '{bcrypt}$2a$10$QsDQCmJ83/jSFKbvjvvtbeaRgLbBoPwZvASs/fSOvcc5Wpj6OPKBi', 1),
('mary', '{bcrypt}$2a$10$0p08nrUWpVp2rtcmH7n.KeiJ8lenzsx3HJRk2ezNgXs/QrxLhBEYy', 1),
('eren', '{bcrypt}$2a$10$iLPr.hTTGTKYSshZ5UImaeI3dpDBc93DNuK8mz3hT9LvF3TpPs6ru', 1);


INSERT INTO `authorities`
VALUES
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('eren', 'ROLE_EMPLOYEE'),
('eren', 'ROLE_MANAGER'),
('eren', 'ROLE_ADMIN');