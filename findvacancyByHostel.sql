    
    DELIMITER $$

    CREATE PROCEDURE findHostelVacancy()
    BEGIN 
        DECLARE H1_Count INT;
        DECLARE H2_Count INT;
        SELECT SUM(Vacancy_Count) INTO H1_Count
        FROM Hostel_Floor WHERE Hostel_No = 1;
        SELECT SUM(Vacancy_Count) INTO H2_Count
        FROM Hostel_Floor WHERE Hostel_No = 2;
        SELECT H1_Count AS "Vacancy in Hostel No 1", H2_Count AS "Vacancy in Hostel No 2"; 
    END $$