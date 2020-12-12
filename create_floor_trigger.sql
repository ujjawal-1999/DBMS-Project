DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `onFloorCreation` AFTER INSERT ON `Hostel_Floor` FOR EACH ROW BEGIN
	INSERT INTO LOGS (MESSAGE)
	VALUES ('Floor Successfully Created!');
END $$