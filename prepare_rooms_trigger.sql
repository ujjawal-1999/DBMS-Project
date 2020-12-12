DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `quarantine`.`onRoomPreparation` AFTER INSERT ON `Quarantine_Room` FOR EACH ROW
BEGIN
	INSERT INTO LOGS (MESSAGE)
    VALUES ('Rooms Successfully Initialized');
END $$
