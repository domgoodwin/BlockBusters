ALTER TABLE `clarity2`.`users` 
ADD COLUMN `Passwd` CHAR(128) NOT NULL AFTER `Role_ID`,
DROP COLUMN `Password`;
