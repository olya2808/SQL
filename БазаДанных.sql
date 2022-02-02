CREATE SCHEMA IF NOT EXISTS `db_maternity_hospital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `db_maternity_hospital`;

CREATE TABLE IF NOT EXISTS `tb_mother` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(30) NOT NULL,
`surname` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `tb_doctor` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(30) NOT NULL,
`surname` VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS `tb_child` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
`date` DATE NOT NULL,
`name` VARCHAR(30) NOT NULL,
`surname` VARCHAR(30) NOT NULL,
`gender` VARCHAR(30) NOT NULL,
`mother_id` INT,
`doctor_id` INT,
FOREIGN KEY (`mother_id`) REFERENCES `tb_mother` (`id`),
FOREIGN KEY (`doctor_id`) REFERENCES `tb_doctor` (`id`)
);

INSERT INTO `tb_mother`
(`id`, `name`, `surname`)
VALUES
(1, 'Phyllis', 'Williams'),
(2, 'Jacqueline', 'Davis'),
(3, 'Elsie', 'Reeves'),
(4, 'Georgia', 'Thompson'),
(5, 'Bonnie', 'Knight'),
(6, 'Elizabeth', 'Johnson'),
(7, 'Helen', 'Johnson'),
(8, 'Cynthia', 'Harper'),
(9, 'Linda', 'Brown'),
(10, 'Rachel', 'Johnson'),
(11, 'Ann', 'Smith');

INSERT INTO `tb_doctor`
(`id`, `name`, `surname`)
VALUES
(1, 'Ivan', 'McDaniel'),
(2, 'John', 'Smith'),
(3, 'James', 'Mitchell'),
(4, 'Jeffery', 'Simpson'),
(5, 'Marie', 'Bridges'),
(6, 'Maria', 'Carter'),
(7, 'Thelma', 'Diaz'),
(8, 'Shirley', 'McKenzie'),
(9, 'Julie', 'Bryant'),
(10, 'Annie', 'Hardy');

INSERT INTO `tb_child`
(`id`, `date`, `name`, `surname`, `gender`, `mother_id`, `doctor_id`)
VALUES
(1, '2003-12-12','Edward', 'Davis', 'male', 2, 4),
(2, '2003-12-12','Joe', 'Davis', 'male', 2, 4),
(3, '2010-08-23','Zoe', 'Smith', 'female', 11, 6),
(4, '1999-03-24','Sam', 'Knight', 'female', 5, 1),
(5, '1990-03-25','John', 'Knight', 'male', 5, 3),
(6, '2010-08-23','Jane', 'Williams', 'female', 1, 2),
(7, '2009-10-02','Diane', 'Johnson', 'female', 10, 10),
(8, '2009-10-02','Tom', 'Johnson', 'male', 6, 10),
(9, '1990-12-13','Taylor', 'Reeves', 'male', 3, 7),
(10, '2001-06-13','Casper', 'Brown', 'male', 9, 9),
(11, '2010-08-23','Ann', 'Harper', 'female', 8, 8),
(12, '2001-06-13','Troy', 'Thompson', 'male', 4, 10),
(13, '2000-11-11','Heather', 'Johnson', 'female', 7, 1),
(14, '2010-12-31','Liam', 'Reeves', 'male', 3, 8),
(15, '2011-01-01','Carrie', 'Reeves', 'female', 3, 8);
