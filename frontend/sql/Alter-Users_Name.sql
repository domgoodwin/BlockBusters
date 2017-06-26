ALTER TABLE `clarity2`.`users` 
ADD COLUMN `Name` VARCHAR(45) NOT NULL AFTER `Passwd`;
ALTER TABLE `clarity2`.`users` 
ADD COLUMN `Assigned_Projects` VARCHAR(150) NULL AFTER `Name`;