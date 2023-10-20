DROP PROCEDURE IF EXISTS `CodPayment_sp_106_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_106_ver0 (IN __nd__func__currentTimeMs__42__297 BIGINT, IN RS_q114_r1_col1 INT, IN RS_q96_r1_col8 VARCHAR(512))
BEGIN

DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_2078_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__297/1000)*1000)/1000));
SET q1_i2 = RS_q96_r1_col8;
SET q1_i3 = NULL;
SET q1_i4 = RS_q114_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p10;
INSERT INTO BLC_EMAIL_TRACKING (DATE_SENT, EMAIL_ADDRESS, TYPE, EMAIL_TRACKING_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4);
SET M_I_RS_2078_rowCount = ROW_COUNT();
SELECT M_I_RS_2078_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4;

END $$
DELIMITER ;