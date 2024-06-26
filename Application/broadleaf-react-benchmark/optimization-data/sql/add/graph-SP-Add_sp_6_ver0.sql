DROP PROCEDURE IF EXISTS `Add_sp_6_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_6_ver0 ()
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE q2_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE RS_q51_r1_col1 BIGINT DEFAULT NULL;
DECLARE M_I_RS_51_size INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE cursor_1 int DEFAULT NULL;
DECLARE indicator_1 int DEFAULT NULL;
DECLARE q3_i1 BIGINT DEFAULT NULL;
DECLARE q3_i2 BIGINT DEFAULT NULL;
DECLARE q3_i3 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_837_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;

IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=0;
END IF;
IF TRUE THEN
SET q2_i1 = 'OrderItemImpl';
SET QUERY_ID_1 = 1;
SET indicator_1 = 0;
SET cursor_cnt_1 = 0;
BEGIN
DECLARE cursor_1 CURSOR FOR SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = q2_i1 FOR UPDATE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_1 = 1;
OPEN cursor_1;
loop_1: LOOP
IF cursor_cnt_1=0 THEN
FETCH cursor_1 INTO RS_q51_r1_col1;
END IF;
IF cursor_cnt_1>=1 THEN
CLOSE cursor_1; LEAVE loop_1;END IF;
IF indicator_1=1 THEN CLOSE cursor_1; LEAVE loop_1; END IF;
SET cursor_cnt_1 = cursor_cnt_1 + 1;
END LOOP loop_1;
END;
SET cursor_cnt_1 = FOUND_ROWS();
SELECT cursor_cnt_1,RS_q51_r1_col1;
SET M_I_RS_51_size = cursor_cnt_1;
END IF;
IF TRUE THEN
IF cursor_cnt_1 > 0 THEN
SET q3_i1 = (RS_q51_r1_col1+50);
SET q3_i2 = RS_q51_r1_col1;
SET q3_i3 = 'OrderItemImpl';
SET QUERY_ID_2 = 2;
SAVEPOINT trace0_p2;
UPDATE SEQUENCE_GENERATOR SET ID_VAL = q3_i1 WHERE ID_VAL = q3_i2 AND ID_NAME = q3_i3;
SET M_I_RS_837_rowCount = ROW_COUNT();
SELECT M_I_RS_837_rowCount;
END IF;
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,q3_i2,q3_i3;

END $$
DELIMITER ;