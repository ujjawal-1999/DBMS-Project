    DELIMITER $$

    CREATE PROCEDURE changeRoom (IN Room INT)
    BEGIN
        DECLARE vacant_floor INT;
        DECLARE room_no INT;
        DECLARE prev_person INT;
        DECLARE person_age INT;
        
        SELECT Curr_Pid INTO prev_person
        FROM Quarantine_Room
        WHERE Room_No = Room;
        
        SELECT Age INTO person_age
        FROM Person WHERE Person_Id = prev_person;
        
        CALL findVacancyByAge(20,@val,@floor);
        
        IF (@val = 0) THEN
            SELECT "No Vacancy Found" AS "Error";
        END IF;
        IF (@val > 0) THEN
        
        SELECT @floor INTO vacant_floor;
        CALL findFirstVacantRoomInFloor(vacant_floor,@room);
        SELECT @room INTO room_no;
        
        UPDATE Person
            SET Room_No = room_no
            WHERE Person_Id = prev_person;
        
        UPDATE Quarantine_Room
            SET Curr_Pid = NULL,
            Is_Vacant = 1
            WHERE Room_No = Room
            LIMIT 1;
            
        UPDATE Quarantine_Room
            SET Curr_Pid = prev_person,
            Is_Vacant = 0
            WHERE Room_No = room_no AND Floor_Id = vacant_floor AND Is_Vacant = 1
            LIMIT 1;
        
        SELECT "New Allocated Room" || room_no AS "";
        SELECT LINE,MESSAGE, Vacancy, FloorId FROM LOGS ORDER BY LINE DESC LIMIT 1;
        END IF;
    END $$

        
        