DROP PROCEDURE IF EXISTS `Purchase_sp_3_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_3_ver0 ()
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_10_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;

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
SET QUERY_ID_2 = 2;
SELECT language0_.LANGUAGE_ID AS LANGUAGE1_23_, language0_.DATE_CREATED AS DATE_CRE2_23_, language0_.DATE_MODIFIED AS DATE_MOD3_23_, language0_.UPDT_ID AS UPDT_ID4_23_, language0_.CODE AS CODE5_23_ , language0_.SORT_ORDER AS SORT_ORD6_23_ FROM LANGUAGE language0_;
SET M_I_RS_10_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2;

END $$
DELIMITER ;