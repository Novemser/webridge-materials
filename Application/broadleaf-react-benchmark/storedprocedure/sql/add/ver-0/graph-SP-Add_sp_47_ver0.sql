DROP PROCEDURE IF EXISTS `Add_sp_47_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_47_ver0 ()
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;

IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=0;
END IF;
SELECT QUERY_ID_0_TXN;

END $$
DELIMITER ;