    
    DELIMITER $$

    CREATE PROCEDURE AdmitPerson (
        IN f_name VARCHAR(40),
        IN l_name VARCHAR(30),
        IN pin INT,
        IN City VARCHAR(100),
        IN State VARCHAR(100),
        IN phone INT,
        IN age INT,
        IN S_Name VARCHAR(50),
        IN D_Date DATE,
        IN C_From VARCHAR(50),
        IN G_To VARCHAR(50)
    )
    BEGIN
        DECLARE vacant_floor INT;
        DECLARE room_no INT;
        DECLARE Person_Identity INT;
        CALL findVacancyByAge(age,@val,@floor);
        IF (@val = 0) THEN
            SELECT "No Vacancy Found" AS "Error";
        END IF;
        IF (@val > 0) THEN
        SELECT @floor INTO vacant_floor;
        CALL findFirstVacantRoomInFloor(vacant_floor,@room);
        SELECT @room INTO room_no;
        
        INSERT INTO Person (First_Name, Last_Name, Pincode, Street_Name,Discharge_Date,Coming_From,Going_To,Room_No,Age)
        VALUES (f_name,l_name,pin,S_Name,D_Date,C_From,G_To,room_no,age);
        
        SET Person_Identity = LAST_INSERT_ID();
        
        UPDATE Quarantine_Room
            SET Curr_Pid = Person_Identity,
            Is_Vacant = 0
            WHERE Room_No = room_no AND Floor_Id = vacant_floor AND Is_Vacant = 1
            LIMIT 1;
        
        INSERT INTO Phone_Number
        VALUES (Person_Identity,phone);
        
        UPDATE Hostel_Floor
            SET Vacancy_Count = Vacancy_Count-1
            WHERE Floor_Id = vacant_floor;
        
        
        CALL pinExists(pin,@pin_exists);
        
        IF (@pin_exists = 0) THEN
            INSERT INTO Pin_Map 
            VALUES (pin,City,State);
        END IF;
        SELECT LINE,MESSAGE, Vacancy, FloorId FROM LOGS ORDER BY LINE DESC LIMIT 4;
        END IF;
    END $$
        
        