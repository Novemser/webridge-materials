DROP PROCEDURE IF EXISTS `Add_sp_16_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_16_ver0 ()
BEGIN

DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_17_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET QUERY_ID_0 = 0;
SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_;
SET M_I_RS_17_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0;

END $$
DELIMITER ;