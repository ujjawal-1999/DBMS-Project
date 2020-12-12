DELIMITER $$

CREATE PROCEDURE searchPersonByState(IN state VARCHAR(50))
BEGIN
	SELECT P.Person_Id AS "Person Id", CONCAT(P.First_Name, ' ', P.Last_Name) AS "Person Name",
		PC.State AS "State", PC.City,
        P.Arrival_Date AS "Arrival Date", P.Discharge_Date AS "Discharge Date",
        P.Room_No AS "Room No"
    FROM Person AS P, Pin_Map AS PC
	WHERE P.Pincode IN (
		SELECT Pincode FROM Pin_Map
        WHERE State = state
    ) ;
END $$