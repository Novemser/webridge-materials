DROP PROCEDURE IF EXISTS `Purchase_sp_77_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_77_ver0 (IN RS_q86_r1_col1 INT, IN RS_q19_r1_col71 VARCHAR(512), IN RS_q61_r1_col1 INT, IN RS_q18_r1_col19 INT)
BEGIN

DECLARE RS_q19_r1_col71_scale INT DEFAULT NULL;
DECLARE RS_q19_r1_col71_intCompact BIGINT DEFAULT NULL;
DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i2 BIGINT DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i5 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i6 INT DEFAULT NULL;
DECLARE q1_i7 LONGTEXT DEFAULT NULL;
DECLARE q1_i8 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i9 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i10 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_1309_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

SET RS_q19_r1_col71_scale = get_scale(RS_q19_r1_col71);
SET RS_q19_r1_col71_intCompact = get_int_compact(RS_q19_r1_col71);
IF TRUE THEN
SET q1_i1 = 'total';
SET q1_i2 = (RS_q61_r1_col1*50);
SET q1_i3 = 'order.total.total';
SET q1_i4 = 'TOTAL';
SET q1_i5 = 'ONE_TIME';
SET q1_i6 = 500;
SET q1_i7 = NULL;
SET q1_i8 = 'total';
SET q1_i9 = c_decimal((0+(0+(RS_q19_r1_col71_intCompact*RS_q18_r1_col19))),RS_q19_r1_col71_scale);
SET q1_i10 = (RS_q86_r1_col1*50);
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p10;
INSERT INTO ORDER_TOTAL (MODULE, ORDER_ID, CODE, ORDER_TOTAL_TYPE, ORDER_VALUE_TYPE , SORT_ORDER, TEXT, TITLE, VALUE, ORDER_ACCOUNT_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4, q1_i5 , q1_i6, q1_i7, q1_i8, q1_i9, q1_i10);
SET M_I_RS_1309_rowCount = ROW_COUNT();
SELECT M_I_RS_1309_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7,q1_i8,q1_i9,q1_i10;

END $$
DELIMITER ;