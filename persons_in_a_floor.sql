	
	DELIMITER $$

	CREATE PROCEDURE personsInAFloor(IN floorNo INT)
	BEGIN
		SELECT P.Person_Id, CONCAT(P.First_Name, ' ', P.Last_Name) AS "Person Name", 
			P.Arrival_Date, P.Discharge_Date, P.Room_No
		FROM Person AS P, Quarantine_Room AS Q
		WHERE Q.Floor_Id IN (
			SELECT Floor_Id FROM Hostel_Floor
			WHERE Floor_No = floorNo)
		AND Q.Is_Vacant = 0
		AND Q.Curr_Pid = P.Person_Id;
	END $$