DELIMITER $$

CREATE PROCEDURE updateDischargeDate(
	IN P_Id INT,
    IN D_date DATE
)
BEGIN
	UPDATE Quarantine_Room
		SET Discharge_Date = D_date
        WHERE Person_Id = P_Id
        LIMIT 1;
END $$