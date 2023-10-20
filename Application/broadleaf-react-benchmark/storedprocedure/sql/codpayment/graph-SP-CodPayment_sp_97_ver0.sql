DROP PROCEDURE IF EXISTS `CodPayment_sp_97_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_97_ver0 (IN RS_q66_r1_col32 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_108_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q66_r1_col32;
SET QUERY_ID_0 = 0;
SELECT productopt0_.PRODUCT_ID AS PRODUCT_2_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_1_, productopt0_.PRODUCT_ID AS PRODUCT_2_126_1_, productopt0_.PRODUCT_OPTION_ID AS PRODUCT_3_126_1_ , productopt1_.PRODUCT_OPTION_ID AS PRODUCT_1_124_0_, productopt1_.ATTRIBUTE_NAME AS ATTRIBUT2_124_0_, productopt1_.DISPLAY_ORDER AS DISPLAY_3_124_0_, productopt1_.ERROR_CODE AS ERROR_CO4_124_0_, productopt1_.ERROR_MESSAGE AS ERROR_ME5_124_0_ , productopt1_.LABEL AS LABEL6_124_0_, productopt1_.NAME AS NAME7_124_0_, productopt1_.VALIDATION_STRATEGY_TYPE AS VALIDATI8_124_0_, productopt1_.VALIDATION_TYPE AS VALIDATI9_124_0_, productopt1_.REQUIRED AS REQUIRE10_124_0_ , productopt1_.OPTION_TYPE AS OPTION_11_124_0_, productopt1_.USE_IN_SKU_GENERATION AS USE_IN_12_124_0_, productopt1_.VALIDATION_STRING AS VALIDAT13_124_0_ FROM BLC_PRODUCT_OPTION_XREF productopt0_ INNER JOIN BLC_PRODUCT_OPTION productopt1_ ON productopt0_.PRODUCT_OPTION_ID = productopt1_.PRODUCT_OPTION_ID WHERE productopt0_.PRODUCT_ID = q1_i1;
SET M_I_RS_108_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;