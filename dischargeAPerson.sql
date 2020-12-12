    
    DELIMITER $$

    CREATE PROCEDURE DischargeAPerson(IN personid INT)
    BEGIN
        DECLARE roomno INT;
        DECLARE floorid INT;
        DECLARE p_name VARCHAR(100);
        DECLARE present_id INT;
        SELECT Room_No INTO roomno 
        FROM Person WHERE Person_Id = personid;
        
        SELECT CONCAT(First_Name, " ", Last_Name ) 
        INTO p_name FROM Person WHERE Person_Id = personid;
        
        SELECT Curr_Pid INTO present_id
        FROM Quarantine_Room WHERE Room_No = roomno;
        
        IF (present_id <> personid) THEN
            SELECT "Person is not assigned that room" AS "";
        END IF;
        
        IF (present_id = personid)	THEN
        UPDATE Quarantine_Room 
            SET Is_Vacant = 1,
            Curr_Pid = null
            WHERE Room_No = roomno
            LIMIT 1;
        SELECT Floor_Id INTO floorid 
        FROM Quarantine_Room WHERE Room_No = roomno;
        UPDATE Hostel_Floor
            SET Vacancy_Count = Vacancy_Count+1
            WHERE Floor_Id = floorid;
        SELECT * FROM LOGS ORDER BY LINE DESC LIMIT 1;
        SELECT personid AS "Person Id", p_name AS "Person Name", 
            CONCAT("Staying in Room No ",roomno," has been discharged and the room is vacant") AS "";
        END IF;
        SELECT "Person is not assigned that room now" AS "";
    END $$