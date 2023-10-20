DROP PROCEDURE IF EXISTS `Add_sp_81_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_81_ver0 (IN RS_q2_r1_col1 VARCHAR(512), IN RS_q33_r1_col13 VARCHAR(512), IN RS_q2_r1_col2 VARCHAR(512), IN RS_q8_r1_col1 INT, IN RS_q33_r1_col8 VARCHAR(512), IN __nd__func__currentTimeMs__42__282 BIGINT, IN RS_q20_r1_col1 INT, IN RS_q45_r1_col89 VARCHAR(512))
BEGIN

DECLARE RS_q45_r1_col89_intCompact BIGINT DEFAULT NULL;
DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 BIGINT DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE q1_i5 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i6 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i7 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i8 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i9 BIT(1) DEFAULT NULL;
DECLARE q1_i10 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i11 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i12 DATETIME DEFAULT NULL;
DECLARE q1_i13 BIT(1) DEFAULT NULL;
DECLARE q1_i14 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i15 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i16 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i17 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_1225_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

SET RS_q45_r1_col89_intCompact = get_int_compact(RS_q45_r1_col89);
IF TRUE THEN
SET q1_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__282/1000)*1000)/1000));
SET q1_i2 = RS_q8_r1_col1;
SET q1_i3 = RS_q2_r1_col2;
SET q1_i4 = RS_q8_r1_col1;
SET q1_i5 = RS_q33_r1_col8;
SET q1_i6 = RS_q2_r1_col1;
SET q1_i7 = NULL;
SET q1_i8 = NULL;
SET q1_i9 = NULL;
SET q1_i10 = RS_q33_r1_col13;
SET q1_i11 = c_decimal((0+(0+(((RS_q45_r1_col89_intCompact/1000)*100)/100))),2);
SET q1_i12 = NULL;
SET q1_i13 = NULL;
SET q1_i14 = c_decimal((0+(0+(0+(((RS_q45_r1_col89_intCompact/1000)*100)/100)))),2);
SET q1_i15 = 0.0;
SET q1_i16 = 0.0;
SET q1_i17 = RS_q20_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p14;
UPDATE BLC_ORDER SET DATE_UPDATED = q1_i1, UPDATED_BY = q1_i2, CURRENCY_CODE = q1_i3, CUSTOMER_ID = q1_i4, EMAIL_ADDRESS = q1_i5, LOCALE_CODE = q1_i6, NAME = q1_i7, ORDER_NUMBER = q1_i8, IS_PREVIEW = q1_i9, ORDER_STATUS = q1_i10, ORDER_SUBTOTAL = q1_i11, SUBMIT_DATE = q1_i12, TAX_OVERRIDE = q1_i13, ORDER_TOTAL = q1_i14, TOTAL_SHIPPING = q1_i15, TOTAL_TAX = q1_i16 WHERE ORDER_ID = q1_i17;
SET M_I_RS_1225_rowCount = ROW_COUNT();
SELECT M_I_RS_1225_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7,q1_i8,q1_i9,q1_i10,q1_i11,q1_i12,q1_i13,q1_i14,q1_i15,q1_i16,q1_i17;

END $$
DELIMITER ;