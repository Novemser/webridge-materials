DROP PROCEDURE IF EXISTS `CodPayment_sp_50_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_50_ver0 (IN RS_q45_r1_col1 INT, IN __nd__func__currentTimeMs__42__138 BIGINT, IN RS_q36_r1_col17 VARCHAR(512), IN RS_q50_r1_col1 INT)
BEGIN

DECLARE RS_q36_r1_col17_intCompact BIGINT DEFAULT NULL;
DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i2 CHAR DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 DATETIME DEFAULT NULL;
DECLARE q1_i5 BIGINT DEFAULT NULL;
DECLARE q1_i6 BIGINT DEFAULT NULL;
DECLARE q1_i7 LONGTEXT DEFAULT NULL;
DECLARE q1_i8 BIT(1) DEFAULT NULL;
DECLARE q1_i9 BIT(1) DEFAULT NULL;
DECLARE q1_i10 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i11 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_686_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

SET RS_q36_r1_col17_intCompact = get_int_compact(RS_q36_r1_col17);
IF TRUE THEN
SET q1_i1 = c_decimal((RS_q36_r1_col17_intCompact/1000),2);
SET q1_i2 = 'N';
SET q1_i3 = NULL;
SET q1_i4 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__138/1000)*1000)/1000));
SET q1_i5 = RS_q45_r1_col1;
SET q1_i6 = NULL;
SET q1_i7 = 'Passthrough Payment';
SET q1_i8 = 0;
SET q1_i9 = 1;
SET q1_i10 = 'AUTHORIZE_AND_CAPTURE';
SET q1_i11 = RS_q50_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p5;
INSERT INTO BLC_ORDER_PAYMENT_TRANSACTION (TRANSACTION_AMOUNT, ARCHIVED, CUSTOMER_IP_ADDRESS, DATE_RECORDED, ORDER_PAYMENT , PARENT_TRANSACTION, RAW_RESPONSE, SAVE_TOKEN, SUCCESS, TRANSACTION_TYPE , PAYMENT_TRANSACTION_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4, q1_i5 , q1_i6, q1_i7, q1_i8, q1_i9, q1_i10 , q1_i11);
SET M_I_RS_686_rowCount = ROW_COUNT();
SELECT M_I_RS_686_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7,q1_i8,q1_i9,q1_i10,q1_i11;

END $$
DELIMITER ;