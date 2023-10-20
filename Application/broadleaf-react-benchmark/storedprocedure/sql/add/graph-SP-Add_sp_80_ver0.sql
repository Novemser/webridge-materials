DROP PROCEDURE IF EXISTS `Add_sp_80_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_80_ver0 (IN RS_q80_r1_col1 INT, IN RS_q51_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 INT DEFAULT NULL;
DECLARE q1_i3 BIT(1) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_1221_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q51_r1_col1;
SET q1_i2 = 1;
SET q1_i3 = 1;
SET q1_i4 = RS_q80_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p15;
INSERT INTO BLC_ORDER_ITEM_PRICE_DTL (ORDER_ITEM_ID, QUANTITY, USE_SALE_PRICE, ORDER_ITEM_PRICE_DTL_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4);
SET M_I_RS_1221_rowCount = ROW_COUNT();
SELECT M_I_RS_1221_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4;

END $$
DELIMITER ;