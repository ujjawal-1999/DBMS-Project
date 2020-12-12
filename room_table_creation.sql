    
    DROP TABLE IF EXISTS Quarantine_Room;

    CREATE TABLE Quarantine_Room(
        Room_No INT NOT NULL,
        Is_Vacant INT DEFAULT 1,
        Floor_Id INT NOT NULL,
        Curr_Pid INT DEFAULT NULL,
        PRIMARY KEY (Room_No),
        FOREIGN KEY (Floor_Id) REFERENCES Hostel_Floor (Floor_Id)
        ON DELETE CASCADE
    );