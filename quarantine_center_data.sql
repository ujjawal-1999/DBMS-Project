DELIMITER $$

CREATE PROCEDURE Present_Quarantine_Center_Data()
BEGIN
	SELECT 
		P.Person_Id, CONCAT(P.First_Name, ' ', P.Last_Name) AS "Person Name", 
        P.Arrival_Date, P.Discharge_Date, P.Coming_From, P.Going_To, P.Room_No, 
        F.Floor_No, F.Hostel_No  
	FROM Person AS P, Quarantine_Room AS Q, Hostel_Floor AS F
    WHERE P.Person_Id IN (
		SELECT Curr_Pid FROM Quarantine_Room 
        WHERE Is_Vacant = 0)
    AND P.Room_No = Q.Room_No 
	AND Q.Floor_Id = F.Floor_Id;
END $$