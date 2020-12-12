    
    DELIMITER $$

    CREATE PROCEDURE AddPhoneNumber(
        IN P_Id INT,
        IN Ph_No INT
    )
    BEGIN
        INSERT INTO Phone_Number
        VALUES (P_Id,Ph_No);
	SELECT LINE, MESSAGE, Vacancy AS "Person Id", FloorId AS "Phone Number"
    FROM LOGS ORDER BY LINE DESC LIMIT 1;
    END $$