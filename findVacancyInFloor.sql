DELIMITER $$

CREATE PROCEDURE findVacancyInFloor(IN floorNo INT)
BEGIN 
	SELECT Hostel_No, Vacancy_Count FROM Hostel_Floor
		WHERE Floor_No = floorNo;
END $$