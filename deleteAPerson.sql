  
  DELIMITER $$

  CREATE PROCEDURE deleteAPerson(IN id INT)
  BEGIN
    DECLARE roomno INT;
      DECLARE floorId INT;
      
      SELECT Room_No INTO roomno
      FROM Person WHERE Person_Id = id;
      
      SELECT Floor_Id INTO floorId
      FROM Quarantine_Room WHERE Curr_Pid = id;
      
      UPDATE Quarantine_Room
      SET Is_Vacant = 1,
          Curr_Pid = NULL
      WHERE Room_No = roomno AND Curr_Pid = id;
      
      UPDATE Hostel_Floor
      SET Vacancy_Count = Vacancy_Count+1
          WHERE Floor_Id = floorId;
      
      DELETE FROM Person WHERE Person_Id = id;
      
      SELECT LINE, MESSAGE FROM LOGS ORDER BY LINE DESC LIMIT 1;
  END $$