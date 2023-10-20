DROP PROCEDURE IF EXISTS `CodPayment_sp_51_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_51_ver0 (IN RS_q50_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 LONGTEXT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_691_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q50_r1_col1;
SET q1_i2 = 'PASSTHROUGH_PAYMENT_TYPE';
SET q1_i3 = 'COD';
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p4;
INSERT INTO BLC_TRANS_ADDITNL_FIELDS (PAYMENT_TRANSACTION_ID, FIELD_NAME, FIELD_VALUE) VALUES (q1_i1, q1_i2, q1_i3);
SET M_I_RS_691_rowCount = ROW_COUNT();
SELECT M_I_RS_691_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3;

END $$
DELIMITER ;