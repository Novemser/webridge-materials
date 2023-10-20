DROP PROCEDURE IF EXISTS `Add_sp_54_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_54_ver0 (IN RS_q57_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 BIGINT DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_870_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = (RS_q57_r1_col1+50);
SET q1_i2 = RS_q57_r1_col1;
SET q1_i3 = 'FulfillmentGroupImpl';
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p3;
UPDATE SEQUENCE_GENERATOR SET ID_VAL = q1_i1 WHERE ID_VAL = q1_i2 AND ID_NAME = q1_i3;
SET M_I_RS_870_rowCount = ROW_COUNT();
SELECT M_I_RS_870_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3;

END $$
DELIMITER ;