    
    DROP TABLE IF EXISTS Phone_Number;

    CREATE TABLE Phone_Number (
        Person_Id INT NOT NULL,
        Phone_No INT NOT NULL,
        PRIMARY KEY (Person_Id, Phone_No),
        FOREIGN KEY (Person_Id) REFERENCES Person (Person_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    );