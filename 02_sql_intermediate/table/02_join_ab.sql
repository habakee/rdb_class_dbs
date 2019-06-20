DROP TABLE IF EXISTS `A`;
CREATE TABLE `A` (
  `id` int(11) NOT NULL,
  `val` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
DROP TABLE IF EXISTS `B`;
CREATE TABLE `B` (
  `id` int(11) NOT NULL,
  `val` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `employees`.`A` (`id`, `val`) VALUES (1, 'A'), (2, 'B'), (3, 'C'), (4, 'D'), (5, 'E'), (6, 'F');
INSERT INTO `employees`.`B` (`id`, `val`) VALUES (5, 'E'), (6, 'F'), (7, 'G'), (8, 'H'), (9, 'I'), (10, 'J');

DROP TABLE IF EXISTS `name_class`;
CREATE TABLE `name_class` (
  `start_L` varchar(5) DEFAULT NULL,
  `end_L` varchar(5) DEFAULT NULL,
  `class` int(11) DEFAULT NULL
);
INSERT INTO `employees`.`name_class` (`start_L`, `end_L`, `class`) VALUES ('A', 'D', 1), ('E', 'H', 2), ('I', 'L', 3), ('M', 'P', 4), ('Q', 'T', 5), ('U', 'Z', 6);