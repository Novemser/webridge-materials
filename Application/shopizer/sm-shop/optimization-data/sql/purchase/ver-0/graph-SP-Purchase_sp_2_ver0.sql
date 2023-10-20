DROP PROCEDURE IF EXISTS `Purchase_sp_2_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_2_ver0 ()
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_6_size INT DEFAULT NULL;
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
SET q3_i1 = 'DEFAULT';
SET QUERY_ID_2 = 2;
SELECT merchantst0_.MERCHANT_ID AS MERCHANT1_29_0_, merchantst1_.MERCHANT_ID AS MERCHANT1_29_1_, country2_.COUNTRY_ID AS COUNTRY_1_6_2_, currency3_.CURRENCY_ID AS CURRENCY1_8_3_, zone4_.ZONE_ID AS ZONE_ID1_82_4_ , language5_.LANGUAGE_ID AS LANGUAGE1_23_5_, language7_.LANGUAGE_ID AS LANGUAGE1_23_6_, merchantst0_.DATE_CREATED AS DATE_CRE2_29_0_, merchantst0_.DATE_MODIFIED AS DATE_MOD3_29_0_, merchantst0_.UPDT_ID AS UPDT_ID4_29_0_ , merchantst0_.STORE_CODE AS STORE_CO5_29_0_, merchantst0_.CONTINUESHOPPINGURL AS CONTINUE6_29_0_, merchantst0_.COUNTRY_ID AS COUNTRY24_29_0_, merchantst0_.CURRENCY_ID AS CURRENC25_29_0_, merchantst0_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_0_ , merchantst0_.LANGUAGE_ID AS LANGUAG26_29_0_, merchantst0_.DOMAIN_NAME AS DOMAIN_N8_29_0_, merchantst0_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_0_, merchantst0_.INVOICE_TEMPLATE AS INVOICE10_29_0_, merchantst0_.PARENT_ID AS PARENT_27_29_0_ , merchantst0_.IS_RETAILER AS IS_RETA11_29_0_, merchantst0_.SEIZEUNITCODE AS SEIZEUN12_29_0_, merchantst0_.STORE_EMAIL AS STORE_E13_29_0_, merchantst0_.STORE_LOGO AS STORE_L14_29_0_, merchantst0_.STORE_TEMPLATE AS STORE_T15_29_0_ , merchantst0_.STORE_ADDRESS AS STORE_A16_29_0_, merchantst0_.STORE_CITY AS STORE_C17_29_0_, merchantst0_.STORE_NAME AS STORE_N18_29_0_, merchantst0_.STORE_PHONE AS STORE_P19_29_0_, merchantst0_.STORE_POSTAL_CODE AS STORE_P20_29_0_ , merchantst0_.STORE_STATE_PROV AS STORE_S21_29_0_, merchantst0_.USE_CACHE AS USE_CAC22_29_0_, merchantst0_.WEIGHTUNITCODE AS WEIGHTU23_29_0_, merchantst0_.ZONE_ID AS ZONE_ID28_29_0_, merchantst1_.DATE_CREATED AS DATE_CRE2_29_1_ , merchantst1_.DATE_MODIFIED AS DATE_MOD3_29_1_, merchantst1_.UPDT_ID AS UPDT_ID4_29_1_, merchantst1_.STORE_CODE AS STORE_CO5_29_1_, merchantst1_.CONTINUESHOPPINGURL AS CONTINUE6_29_1_, merchantst1_.COUNTRY_ID AS COUNTRY24_29_1_ , merchantst1_.CURRENCY_ID AS CURRENC25_29_1_, merchantst1_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_1_, merchantst1_.LANGUAGE_ID AS LANGUAG26_29_1_, merchantst1_.DOMAIN_NAME AS DOMAIN_N8_29_1_, merchantst1_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_1_ , merchantst1_.INVOICE_TEMPLATE AS INVOICE10_29_1_, merchantst1_.PARENT_ID AS PARENT_27_29_1_, merchantst1_.IS_RETAILER AS IS_RETA11_29_1_, merchantst1_.SEIZEUNITCODE AS SEIZEUN12_29_1_, merchantst1_.STORE_EMAIL AS STORE_E13_29_1_ , merchantst1_.STORE_LOGO AS STORE_L14_29_1_, merchantst1_.STORE_TEMPLATE AS STORE_T15_29_1_, merchantst1_.STORE_ADDRESS AS STORE_A16_29_1_, merchantst1_.STORE_CITY AS STORE_C17_29_1_, merchantst1_.STORE_NAME AS STORE_N18_29_1_ , merchantst1_.STORE_PHONE AS STORE_P19_29_1_, merchantst1_.STORE_POSTAL_CODE AS STORE_P20_29_1_, merchantst1_.STORE_STATE_PROV AS STORE_S21_29_1_, merchantst1_.USE_CACHE AS USE_CAC22_29_1_, merchantst1_.WEIGHTUNITCODE AS WEIGHTU23_29_1_ , merchantst1_.ZONE_ID AS ZONE_ID28_29_1_, country2_.GEOZONE_ID AS GEOZONE_4_6_2_, country2_.COUNTRY_ISOCODE AS COUNTRY_2_6_2_, country2_.COUNTRY_SUPPORTED AS COUNTRY_3_6_2_, currency3_.CURRENCY_CODE AS CURRENCY2_8_3_ , currency3_.CURRENCY_CURRENCY_CODE AS CURRENCY3_8_3_, currency3_.CURRENCY_NAME AS CURRENCY4_8_3_, currency3_.CURRENCY_SUPPORTED AS CURRENCY5_8_3_, zone4_.ZONE_CODE AS ZONE_COD2_82_4_, zone4_.COUNTRY_ID AS COUNTRY_3_82_4_ , language5_.DATE_CREATED AS DATE_CRE2_23_5_, language5_.DATE_MODIFIED AS DATE_MOD3_23_5_, language5_.UPDT_ID AS UPDT_ID4_23_5_, language5_.CODE AS CODE5_23_5_, language5_.SORT_ORDER AS SORT_ORD6_23_5_ , language7_.DATE_CREATED AS DATE_CRE2_23_6_, language7_.DATE_MODIFIED AS DATE_MOD3_23_6_, language7_.UPDT_ID AS UPDT_ID4_23_6_, language7_.CODE AS CODE5_23_6_, language7_.SORT_ORDER AS SORT_ORD6_23_6_ , languages6_.stores_MERCHANT_ID AS stores_M1_27_0__, languages6_.languages_LANGUAGE_ID AS language2_27_0__ FROM MERCHANT_STORE merchantst0_ LEFT JOIN MERCHANT_STORE merchantst1_ ON merchantst0_.PARENT_ID = merchantst1_.MERCHANT_ID INNER JOIN COUNTRY country2_ ON merchantst0_.COUNTRY_ID = country2_.COUNTRY_ID LEFT JOIN CURRENCY currency3_ ON merchantst0_.CURRENCY_ID = currency3_.CURRENCY_ID LEFT JOIN ZONE zone4_ ON merchantst0_.ZONE_ID = zone4_.ZONE_ID LEFT JOIN LANGUAGE language5_ ON merchantst0_.LANGUAGE_ID = language5_.LANGUAGE_ID LEFT JOIN MERCHANT_LANGUAGE languages6_ ON merchantst0_.MERCHANT_ID = languages6_.stores_MERCHANT_ID LEFT JOIN LANGUAGE language7_ ON languages6_.languages_LANGUAGE_ID = language7_.LANGUAGE_ID WHERE merchantst0_.STORE_CODE = q3_i1;
SET M_I_RS_6_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1;

END $$
DELIMITER ;