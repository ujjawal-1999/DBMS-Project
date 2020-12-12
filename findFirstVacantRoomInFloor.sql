    
    DELIMITER $$

    CREATE PROCEDURE findFirstVacantRoomInFloor(
        IN id INT,
        OUT room INT
    )
    BEGIN 
        DECLARE vacant_room INT;
        SELECT Room_No INTO vacant_room FROM Quarantine_Room
        WHERE Floor_Id = id AND Is_Vacant = 1
        ORDER BY Room_No LIMIT 1;
        SET room = vacant_room;
    END $$