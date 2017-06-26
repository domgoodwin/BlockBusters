USE `clarity2`;
DROP procedure IF EXISTS `PopulateWeeks`;

DELIMITER $$
USE `clarity2`$$
CREATE PROCEDURE `PopulateWeeks` ()
BEGIN
                SET @i = 0;
    SET @amountToAdd = 10;
    SET @prevMonday = SUBDATE(SUBDATE(NOW(), INTERVAL WEEKDAY(NOW()) DAY), INTERVAL 2 WEEK);
<<<<<<< HEAD
	SET @startDate = (SELECT Monday_Date FROM clarity2.weeks ORDER BY Monday_Date DESC LIMIT 1);
	IF (@startDate IS NULL) THEN
		INSERT INTO clarity2.weeks (Monday_Date) VALUES (@prevMonday);
		SET @startDate = @prevMonday;
	END IF;
	WHILE @i < @amountToAdd DO
		SET @startDate = DATE_ADD(@startDate, INTERVAL 7 DAY);
		INSERT INTO clarity2.weeks (Monday_Date)
		VALUES (@startDate);
		SET @i = @i + 1;
	END WHILE;
=======
                SET @startDate = (SELECT Monday_Date FROM clarity2.weeks ORDER BY Monday_Date DESC LIMIT 1);
                IF (@startDate IS NULL) THEN
                                INSERT INTO clarity2.weeks (Monday_Date) VALUES (@prevMonday);
                                SET @startDate = @prevMonday;
                END IF;
                WHILE @i < @amountToAdd DO
                                SET @startDate = DATE_ADD(@startDate, INTERVAL 7 DAY);
                                INSERT INTO clarity2.weeks (Monday_Date)
                                VALUES (@startDate);
                                SET @i = @i + 1;
                END WHILE;
>>>>>>> f94f474cd7dbafb3f69a255289b5b264e3b3f5f0
END$$

DELIMITER ;
