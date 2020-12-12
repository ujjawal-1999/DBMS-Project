	
DELIMITER $$
CREATE PROCEDURE CreateFloorData()
BEGIN
	INSERT INTO Hostel_Floor(Floor_No, Hostel_No,Vacancy_Count)
	VALUES 
		(0,1,100),
		(1,1,100),
		(2,1,50),
		(0,2,100),
		(1,2,100),
		(2,2,50);
	SELECT * FROM LOGS ORDER BY LINE DESC LIMIT 1;
END $$
		