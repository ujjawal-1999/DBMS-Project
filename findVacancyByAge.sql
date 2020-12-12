
    DELIMITER $$

    CREATE PROCEDURE findVacancyByAge(
        IN age INT,
        OUT val INT,
        OUT floor INT
    )
    BEGIN 
        DECLARE H1_Count INT;
        DECLARE H2_Count INT;
        DECLARE Floor1_Id INT;
        DECLARE Floor2_Id INT;
        SET val = 0;
        SET floor = 0;
        IF age > 60 THEN
            SELECT (Vacancy_Count) INTO H1_Count
            FROM Hostel_Floor WHERE Floor_Id = 1;
            SELECT (Vacancy_Count) INTO H2_Count
            FROM Hostel_Floor WHERE Floor_Id = 4;
            SET Floor1_Id = 1;
            SET Floor2_Id = 4;
        END IF;
        IF age BETWEEN 40 AND 60 THEN
            SELECT (Vacancy_Count) INTO H1_Count
            FROM Hostel_Floor WHERE Floor_Id = 2;
            SELECT (Vacancy_Count) INTO H2_Count
            FROM Hostel_Floor WHERE Floor_Id = 5;
            SET Floor1_Id = 2;
            SET Floor2_Id = 5;
        END IF;
        IF age < 40 THEN
            SELECT (Vacancy_Count) INTO H1_Count
            FROM Hostel_Floor WHERE Floor_Id = 3;
            SELECT (Vacancy_Count) INTO H2_Count
            FROM Hostel_Floor WHERE Floor_Id = 6;
            SET Floor1_Id = 3;
            SET Floor2_Id = 6;
        END IF;
        IF(H2_Count >= 1) THEN
            SET val = H2_Count;
            SET floor = Floor2_Id;
        END IF;
        IF(H1_Count >= 1) THEN
            SET val = H1_Count;
            SET floor = Floor1_Id;
        END IF;
    END $$
    