USE `salesforce_sync`;
DROP procedure IF EXISTS `arr_shadow_copy`;

DELIMITER $$
USE `salesforce_sync`$$
CREATE PROCEDURE `arr_shadow_copy` ()
BEGIN
	DROP TABLE IF EXISTS arr_sf_account;
	CREATE TABLE IF NOT EXISTS arr_sf_account LIKE sf_account;
	INSERT INTO arr_sf_account SELECT * FROM sf_account;

	DROP TABLE IF EXISTS arr_sf_opportunity;
	CREATE TABLE IF NOT EXISTS arr_sf_opportunity LIKE sf_opportunity;
	INSERT INTO arr_sf_opportunity SELECT * FROM sf_opportunity;
END$$

DELIMITER ;
