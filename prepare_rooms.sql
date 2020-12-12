	DELIMITER $$
	CREATE PROCEDURE PrepareQuarantineRoom()
	BEGIN
	DECLARE i INT;
	DECLARE j INT;
	SET i = 1001;
	SET j = 2001;
	hostel1: LOOP
		IF i >= 1001 AND i < 1101 THEN
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(i,1);
			SET i = i+1;
		END IF;
		IF i >= 1101 AND i < 1201 THEN 
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(i,2);
			SET i = i+1;
		END IF;
		IF i >= 1201 AND i < 1251 THEN 
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(i,3);
			SET i = i+1;
		END IF;
		IF i >= 1251 THEN
			LEAVE hostel1;
		END IF;
	END LOOP;
	hostel2 : LOOP
		IF j >= 2001 AND j < 2101 THEN
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(j,4);
			SET j = j+1;
		END IF;
		IF j >= 2101 AND j < 2201 THEN 
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(j,5);
			SET j = j+1;
		END IF;
		IF j >= 2201 AND j < 2251 THEN 
			INSERT INTO Quarantine_Room (Room_No,Floor_Id)
			VALUES
			(j,6);
			SET j = j+1;
		END IF;
		IF j >= 2251 THEN
			LEAVE hostel2;
		END IF;
	END LOOP;
	SELECT * FROM LOGS ORDER BY LINE DESC LIMIT 1;
	END $$
		