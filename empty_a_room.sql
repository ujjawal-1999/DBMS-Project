    
    DELIMITER $$

    CREATE PROCEDURE emptyARoom(IN roomNo INT)
    BEGIN
        DECLARE personid INT;
        DECLARE floorid INT;
        DECLARE p_name VARCHAR(100);
        DECLARE present_id INT;
        
        SELECT Curr_Pid INTO present_id
        FROM Quarantine_Room WHERE Room_No = roomNo;
        
        SELECT CONCAT(First_Name, " ", Last_Name ) 
        INTO p_name FROM Person
        WHERE Person_Id = present_id;
        
        UPDATE Quarantine_Room 
            SET Is_Vacant = 1,
            Curr_Pid = null
            WHERE Room_No = roomNo
            LIMIT 1;
            
        SELECT Floor_Id INTO floorid 
        FROM Quarantine_Room WHERE Room_No = roomNo;
        
        UPDATE Hostel_Floor
            SET Vacancy_Count = Vacancy_Count+1
            WHERE Floor_Id = floorid;
        SELECT * FROM LOGS ORDER BY LINE DESC LIMIT 1;
        SELECT present_id AS "Person Id", p_name AS "Person Name", 
            CONCAT("Room No ",roomno," has been emptied and person has been discharged") AS "";

    END $$