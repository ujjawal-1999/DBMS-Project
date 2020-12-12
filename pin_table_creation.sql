    
    DROP TABLE IF EXISTS Pin_Map;

    CREATE TABLE Pin_Map (
        Pincode INT NOT NULL,
        City VARCHAR(100) NOT NULL,
        State VARCHAR(100) NOT NULL,
        PRIMARY KEY (Pincode)
    );