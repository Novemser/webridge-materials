DROP PROCEDURE IF EXISTS `Purchase_sp_35_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_35_ver0 (IN RS_q2_r1_col2 INT)
BEGIN

DECLARE q1_i1 INT DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_45_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q2_r1_col2;
SET q1_i2 = 'TAX_CONFIG';
SET QUERY_ID_0 = 0;
SELECT merchantco0_.MERCHANT_CONFIG_ID AS MERCHANT1_26_0_, merchantst1_.MERCHANT_ID AS MERCHANT1_29_1_, merchantco0_.ACTIVE AS ACTIVE2_26_0_, merchantco0_.DATE_CREATED AS DATE_CRE3_26_0_, merchantco0_.DATE_MODIFIED AS DATE_MOD4_26_0_ , merchantco0_.UPDT_ID AS UPDT_ID5_26_0_, merchantco0_.CONFIG_KEY AS CONFIG_K6_26_0_, merchantco0_.TYPE AS TYPE7_26_0_, merchantco0_.MERCHANT_ID AS MERCHANT9_26_0_, merchantco0_.VALUE AS VALUE8_26_0_ , merchantst1_.DATE_CREATED AS DATE_CRE2_29_1_, merchantst1_.DATE_MODIFIED AS DATE_MOD3_29_1_, merchantst1_.UPDT_ID AS UPDT_ID4_29_1_, merchantst1_.STORE_CODE AS STORE_CO5_29_1_, merchantst1_.CONTINUESHOPPINGURL AS CONTINUE6_29_1_ , merchantst1_.COUNTRY_ID AS COUNTRY24_29_1_, merchantst1_.CURRENCY_ID AS CURRENC25_29_1_, merchantst1_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_1_, merchantst1_.LANGUAGE_ID AS LANGUAG26_29_1_, merchantst1_.DOMAIN_NAME AS DOMAIN_N8_29_1_ , merchantst1_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_1_, merchantst1_.INVOICE_TEMPLATE AS INVOICE10_29_1_, merchantst1_.PARENT_ID AS PARENT_27_29_1_, merchantst1_.IS_RETAILER AS IS_RETA11_29_1_, merchantst1_.SEIZEUNITCODE AS SEIZEUN12_29_1_ , merchantst1_.STORE_EMAIL AS STORE_E13_29_1_, merchantst1_.STORE_LOGO AS STORE_L14_29_1_, merchantst1_.STORE_TEMPLATE AS STORE_T15_29_1_, merchantst1_.STORE_ADDRESS AS STORE_A16_29_1_, merchantst1_.STORE_CITY AS STORE_C17_29_1_ , merchantst1_.STORE_NAME AS STORE_N18_29_1_, merchantst1_.STORE_PHONE AS STORE_P19_29_1_, merchantst1_.STORE_POSTAL_CODE AS STORE_P20_29_1_, merchantst1_.STORE_STATE_PROV AS STORE_S21_29_1_, merchantst1_.USE_CACHE AS USE_CAC22_29_1_ , merchantst1_.WEIGHTUNITCODE AS WEIGHTU23_29_1_, merchantst1_.ZONE_ID AS ZONE_ID28_29_1_ FROM MERCHANT_CONFIGURATION merchantco0_ INNER JOIN MERCHANT_STORE merchantst1_ ON merchantco0_.MERCHANT_ID = merchantst1_.MERCHANT_ID WHERE merchantst1_.MERCHANT_ID = q1_i1 AND merchantco0_.CONFIG_KEY = q1_i2;
SET M_I_RS_45_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2;

END $$
DELIMITER ;