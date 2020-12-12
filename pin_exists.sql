    
    DELIMITER $$

    CREATE PROCEDURE pinExists(
        IN pincode INT,
        OUT pin_exists INT
    )
    BEGIN 
        DECLARE Pin_count INT;
        SELECT COUNT(Pincode) INTO Pin_count
        FROM Pin_Map
        WHERE Pincode = pincode;
        SET pin_exists = 1;
        IF (Pin_count = 0) THEN
            SET pin_exists = 0;
        END IF;
    END $$