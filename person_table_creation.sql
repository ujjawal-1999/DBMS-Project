    
    DROP TABLE IF EXISTS Person;

    CREATE TABLE Person(
        Person_Id INT AUTO_INCREMENT NOT NULL,
        First_Name VARCHAR(40) NOT NULL,
        Last_Name VARCHAR(30) DEFAULT '',
        Age INT,
        Pincode INT NOT NULL,
        Street_Name VARCHAR(50) DEFAULT '',
        Arrival_Date DATE DEFAULT (CURRENT_DATE),
        Discharge_Date DATE DEFAULT NULL,
        Coming_From VARCHAR(50) NOT NULL,
        Going_To VARCHAR(50) DEFAULT 'Silchar',
        Room_No INT NOT NULL,
        PRIMARY KEY (Person_Id),
        FOREIGN KEY (Room_No) REFERENCES Quarantine_Room (Room_No)
    );
        
        