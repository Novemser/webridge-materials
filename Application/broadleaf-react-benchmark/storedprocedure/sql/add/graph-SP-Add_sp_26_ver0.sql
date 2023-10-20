DROP PROCEDURE IF EXISTS `Add_sp_26_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_26_ver0 (IN RS_q20_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_27_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q20_r1_col1;
SET q1_i2 = '00000000-0000-0000-0000-000000000000';
SET QUERY_ID_0 = 0;
SELECT count(*) AS col_0_0_ FROM BLC_ORDER_LOCK orderlocki0_ WHERE orderlocki0_.ORDER_ID = q1_i1 AND orderlocki0_.LOCK_KEY = q1_i2;
SET M_I_RS_27_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2;

END $$
DELIMITER ;