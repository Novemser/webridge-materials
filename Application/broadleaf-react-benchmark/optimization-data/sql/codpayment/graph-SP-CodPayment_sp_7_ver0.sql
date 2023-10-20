DROP PROCEDURE IF EXISTS `CodPayment_sp_7_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_7_ver0 ()
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE RS_q50_r1_col1 BIGINT DEFAULT NULL;
DECLARE M_I_RS_50_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE cursor_2 int DEFAULT NULL;
DECLARE indicator_2 int DEFAULT NULL;
DECLARE q4_i1 BIGINT DEFAULT NULL;
DECLARE q4_i2 BIGINT DEFAULT NULL;
DECLARE q4_i3 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE M_I_RS_667_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;

IF TRUE THEN
commit;
END IF;
IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF TRUE THEN
SET QUERY_ID_1_TXN = 1;
set autocommit=0;
END IF;
IF TRUE THEN
SET q3_i1 = 'PaymentTransactionImpl';
SET QUERY_ID_2 = 2;
SET indicator_2 = 0;
SET cursor_cnt_2 = 0;
BEGIN
DECLARE cursor_2 CURSOR FOR SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = q3_i1 FOR UPDATE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_2 = 1;
OPEN cursor_2;
loop_2: LOOP
IF cursor_cnt_2=0 THEN
FETCH cursor_2 INTO RS_q50_r1_col1;
END IF;
IF cursor_cnt_2>=1 THEN
CLOSE cursor_2; LEAVE loop_2;END IF;
IF indicator_2=1 THEN CLOSE cursor_2; LEAVE loop_2; END IF;
SET cursor_cnt_2 = cursor_cnt_2 + 1;
END LOOP loop_2;
END;
SET cursor_cnt_2 = FOUND_ROWS();
SELECT cursor_cnt_2,RS_q50_r1_col1;
SET M_I_RS_50_size = cursor_cnt_2;
END IF;
IF TRUE THEN
IF cursor_cnt_2 > 0 THEN
SET q4_i1 = (RS_q50_r1_col1+50);
SET q4_i2 = RS_q50_r1_col1;
SET q4_i3 = 'PaymentTransactionImpl';
SET QUERY_ID_3 = 3;
SAVEPOINT trace0_p3;
UPDATE SEQUENCE_GENERATOR SET ID_VAL = q4_i1 WHERE ID_VAL = q4_i2 AND ID_NAME = q4_i3;
SET M_I_RS_667_rowCount = ROW_COUNT();
SELECT M_I_RS_667_rowCount;
END IF;
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1,QUERY_ID_3,q4_i1,q4_i2,q4_i3;

END $$
DELIMITER ;