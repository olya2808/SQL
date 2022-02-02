USE `db_maternity_hospital`;

SELECT*
FROM `tb_child`;

SELECT*
FROM `tb_mother`;

SELECT*
FROM `tb_doctor`;

SELECT `ch`.`id`, `ch`.`date`, `ch`.`name`, `ch`.`surname`, `ch`.`gender`, `ch`.`mother_id`, `mo`.`name`, `mo`.`surname`, `ch`.`doctor_id`, `doc`.`name`, `doc`.`surname`
FROM `tb_child` `ch`
JOIN `tb_mother` `mo`
ON `ch`.`mother_id` = `mo`.`id`
JOIN `tb_doctor` `doc` 
ON `doc`.`id`=`ch`.`doctor_id`
ORDER BY `ch`.`id`;

SELECT `mo`.`id`, `mo`.`name`, `mo`.`surname` 
FROM `tb_child` `ch`
JOIN `tb_mother` `mo`
ON `ch`.`mother_id` = `mo`.`id`
WHERE `ch`.`gender`='female';

SELECT DISTINCT `mo`.`id`, `mo`.`name`, `mo`.`surname`, `ch`.`name`, `ch`.`surname`, `doc`.`name`, `doc`.`surname`
FROM `tb_mother` `mo`
JOIN `tb_child` `ch` ON `ch`.`mother_id`= `mo`.`id`
JOIN `tb_doctor` `doc` ON `doc`.`id`=`ch`.`doctor_id`
JOIN `tb_mother` `mo2` ON `mo`.`surname`=`mo2`.`surname`
WHERE `doc`.`name`='Annie' AND `doc`.`surname`='Hardy' AND `mo`.`id`!=`mo2`.`id`;

SELECT `doc`.`id`, `doc`.`name`, `doc`.`surname`
FROM `tb_child` `ch`
JOIN `tb_doctor` `doc` ON `doc`.`id`=`ch`.`doctor_id`
WHERE `ch`.`date` IN
(SELECT `date` FROM `tb_mother` `mo`
JOIN `tb_child` `ch` ON `ch`.`mother_id`=`mo`.`id`
JOIN `tb_doctor` `doc` ON `doc`.`id`=`ch`.`doctor_id`
WHERE `mo`.`name`='Ann' AND `mo`.`surname`='Smith');

SELECT DISTINCT `doc`.`id`, `doc`.`name`, `doc`.`surname`
FROM `tb_mother` `mo`
JOIN`tb_child` `ch` ON `ch`.`mother_id`=`mo`.`id`
JOIN `tb_doctor` `doc` ON `doc`.`id`=`ch`.`doctor_id`
JOIN `tb_child` `ch2` ON `ch`.`surname`=`ch2`.`surname`
WHERE `ch`.`id`!=`ch2`.`id` AND `ch`.`mother_id`=`ch2`.`mother_id` 
AND (`ch`.`date`=`ch2`.`date` OR `ch`.`date`=DATE_ADD(`ch2`.`date`, INTERVAL 1 DAY) 
OR `ch2`.`date`=DATE_ADD(`ch`.`date`, INTERVAL 1 DAY));

SELECT `mo`.`id`, `mo`.`name`, `mo`.`surname` 
FROM .`tb_child` `ch`
JOIN `tb_mother` `mo`
ON `ch`.`mother_id` = `mo`.`id` 
WHERE `ch`.`gender`='male' AND `ch`.`date` = '2001-06-13';

SELECT `mo`.`id`, `mo`.`name`, `mo`.`surname`,`ch`.`id`, `ch`.`name`, `ch`.`surname`
FROM `tb_child` `ch`
JOIN `tb_mother` `mo`
ON `ch`.`mother_id` = `mo`.`id`
JOIN `tb_doctor` `doc` 
ON `doc`.`id`=`ch`.`doctor_id`
WHERE `ch`.`gender`='female' AND `doc`.`name`='Shirley' AND `doc`.`surname`='McKenzie';

SELECT * FROM `tb_child`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/export/child.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

SELECT * FROM `tb_mother`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/export/mother.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

SELECT * FROM `tb_doctor`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/export/doctor.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

SET SQL_SAFE_UPDATES = 0;

DELETE FROM `tb_child`;
DELETE FROM `tb_mother`;
DELETE FROM `tb_doctor`;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/import/child.txt'
INTO TABLE `tb_child`
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(`id`,`date`, `name`, `surname`, `gender`, `mother_id`, `doctor_id`);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/import/mother.txt'
INTO TABLE `tb_mother`
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(`id`, `name`, `surname`);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.6/Uploads/import/doctor.txt'
INTO TABLE `tb_doctor`
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
(`id`, `name`, `surname`);

CREATE USER `user1`@`localhost` IDENTIFIED BY 'password1';
CREATE USER `user2`@`localhost` IDENTIFIED BY 'password2';
CREATE USER `user3`@`localhost` IDENTIFIED BY 'password3';

SELECT USER, HOST FROM `mysql`.`user`;

GRANT ALL PRIVILEGES ON `tb_doctor` TO `user1`@`localhost`;
GRANT SELECT ON `tb_child` TO `user2`@`localhost`;
GRANT SELECT, INSERT ON `tb_child` TO `user3`@`localhost`;

FLUSH PRIVILEGES;

REVOKE SELECT ON `tb_child` FROM `user3`@`localhost`;

FLUSH PRIVILEGES;

DROP USER `user2`@`localhost`;

