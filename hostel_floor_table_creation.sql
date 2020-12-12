    
    DROP TABLE IF EXISTS Hostel_Floor;

    CREATE TABLE Hostel_Floor(
        Floor_Id INT AUTO_INCREMENT NOT NULL,
        Floor_No INT NOT NULL,
        Hostel_No INT NOT NULL,
        Vacancy_Count INT NOT NULL DEFAULT 0,
        PRIMARY KEY (Floor_Id)
    );
        