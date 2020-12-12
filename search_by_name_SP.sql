DELIMITER $$

CREATE PROCEDURE SearchPersonByName (IN SearchName VARCHAR(40))
BEGIN 
	SELECT 
		P.Person_Id, CONCAT(P.First_Name, ' ', P.Last_Name) AS "Person Name", 
        P.Arrival_Date, P.Discharge_Date, P.Coming_From, P.Going_To, P.Room_No, 
        F.Floor_No, F.Hostel_No    
	FROM Person AS P, Quarantine_Room AS Q, Hostel_Floor AS F
	WHERE LOWER(CONCAT(P.First_Name, ' ', P.Last_Name)) LIKE CONCAT(LOWER(SearchName),'%') 
			AND P.Room_No = Q.Room_No 
            AND Q.Floor_Id = F.Floor_Id;
END $$