DELIMITER $$

CREATE PROCEDURE UpdateFloorCount(
	IN F_Id INT,
    IN count INT
)
BEGIN
	UPDATE Hostel_Floor
		SET Vacancy_Count = Vacancy_Count + count
        WHERE Floor_Id = F_Id
        LIMIT 1;
END  