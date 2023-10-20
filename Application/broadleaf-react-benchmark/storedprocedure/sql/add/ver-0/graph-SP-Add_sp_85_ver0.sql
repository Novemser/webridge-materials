DROP PROCEDURE IF EXISTS `Add_sp_85_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_85_ver0 (IN RS_q62_r1_col1 INT, IN RS_q57_r1_col1 INT, IN RS_q51_r1_col1 INT, IN RS_q45_r1_col89 VARCHAR(512))
BEGIN

DECLARE RS_q45_r1_col89_intCompact BIGINT DEFAULT NULL;
DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 BIGINT DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 INT DEFAULT NULL;
DECLARE q1_i5 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i6 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i7 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i8 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i9 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_1247_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

SET RS_q45_r1_col89_intCompact = get_int_compact(RS_q45_r1_col89);
IF TRUE THEN
SET q1_i1 = RS_q57_r1_col1;
SET q1_i2 = RS_q51_r1_col1;
SET q1_i3 = c_decimal(0,2);
SET q1_i4 = 1;
SET q1_i5 = NULL;
SET q1_i6 = c_decimal((0+(((RS_q45_r1_col89_intCompact/1000)*100)/100)),2);
SET q1_i7 = c_decimal((0+(((RS_q45_r1_col89_intCompact/1000)*100)/100)),2);
SET q1_i8 = 0.0;
SET q1_i9 = RS_q62_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p10;
UPDATE BLC_FULFILLMENT_GROUP_ITEM SET FULFILLMENT_GROUP_ID = q1_i1, ORDER_ITEM_ID = q1_i2, PRORATED_ORDER_ADJ = q1_i3, QUANTITY = q1_i4, STATUS = q1_i5, TOTAL_ITEM_AMOUNT = q1_i6, TOTAL_ITEM_TAXABLE_AMOUNT = q1_i7, TOTAL_ITEM_TAX = q1_i8 WHERE FULFILLMENT_GROUP_ITEM_ID = q1_i9;
SET M_I_RS_1247_rowCount = ROW_COUNT();
SELECT M_I_RS_1247_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7,q1_i8,q1_i9;

END $$
DELIMITER ;