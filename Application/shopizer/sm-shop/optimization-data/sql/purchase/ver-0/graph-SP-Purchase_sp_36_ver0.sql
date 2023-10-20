DROP PROCEDURE IF EXISTS `Purchase_sp_36_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_36_ver0 (IN RS_q2_r1_col3 INT)
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 INT DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_121_size INT DEFAULT NULL;
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
SET q3_i1 = RS_q2_r1_col3;
SET QUERY_ID_2 = 2;
SELECT zone0_.ZONE_ID AS ZONE_ID1_82_0_, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_83_1_, zone0_.ZONE_CODE AS ZONE_COD2_82_0_, zone0_.COUNTRY_ID AS COUNTRY_3_82_0_, descriptio1_.DATE_CREATED AS DATE_CRE2_83_1_ , descriptio1_.DATE_MODIFIED AS DATE_MOD3_83_1_, descriptio1_.UPDT_ID AS UPDT_ID4_83_1_, descriptio1_.DESCRIPTION AS DESCRIPT5_83_1_, descriptio1_.LANGUAGE_ID AS LANGUAGE8_83_1_, descriptio1_.NAME AS NAME6_83_1_ , descriptio1_.TITLE AS TITLE7_83_1_, descriptio1_.ZONE_ID AS ZONE_ID9_83_1_, descriptio1_.ZONE_ID AS ZONE_ID9_83_0__, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_83_0__ FROM ZONE zone0_ LEFT JOIN ZONE_DESCRIPTION descriptio1_ ON zone0_.ZONE_ID = descriptio1_.ZONE_ID WHERE descriptio1_.LANGUAGE_ID = q3_i1;
SET M_I_RS_121_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1;

END $$
DELIMITER ;