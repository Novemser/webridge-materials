DROP PROCEDURE IF EXISTS `CodPayment_sp_18_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_18_ver0 (IN __nd__func__currentTimeMs__42__218 BIGINT, IN RS_q66_r1_col32 INT)
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i2 DATETIME DEFAULT NULL;
DECLARE q1_i3 DATETIME DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_110_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE M_I_RS_111_size INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE QUERY_ID_2_TXN INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = 'TAX_CALCULATION';
SET q1_i2 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__218/1000)*1000)/1000));
SET q1_i3 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__218/1000)*1000)/1000));
SET QUERY_ID_0 = 0;
SELECT abstractmo0_.MODULE_CONFIG_ID AS MODULE_C1_84_, abstractmo0_.ACTIVE_END_DATE AS ACTIVE_E2_84_, abstractmo0_.ACTIVE_START_DATE AS ACTIVE_S3_84_, abstractmo0_.ARCHIVED AS ARCHIVED4_84_, abstractmo0_.CREATED_BY AS CREATED_5_84_ , abstractmo0_.DATE_CREATED AS DATE_CRE6_84_, abstractmo0_.DATE_UPDATED AS DATE_UPD7_84_, abstractmo0_.UPDATED_BY AS UPDATED_8_84_, abstractmo0_.CONFIG_TYPE AS CONFIG_T9_84_, abstractmo0_.IS_DEFAULT AS IS_DEFA10_84_ , abstractmo0_.MODULE_NAME AS MODULE_11_84_, abstractmo0_.MODULE_PRIORITY AS MODULE_12_84_, abstractmo0_1_.INDEXED_SITE_MAP_FILE_NAME AS INDEXED_1_157_, abstractmo0_1_.INDEXED_SITE_MAP_FILE_PATTERN AS INDEXED_2_157_, abstractmo0_1_.MAX_URL_ENTRIES_PER_FILE AS MAX_URL_3_157_ , abstractmo0_1_.SITE_MAP_FILE_NAME AS SITE_MAP4_157_ , CASE  WHEN abstractmo0_1_.MODULE_CONFIG_ID IS NOT NULL THEN 1 WHEN abstractmo0_.MODULE_CONFIG_ID IS NOT NULL THEN 0 END AS clazz_ FROM BLC_MODULE_CONFIGURATION abstractmo0_ LEFT JOIN BLC_SITE_MAP_CFG abstractmo0_1_ ON abstractmo0_.MODULE_CONFIG_ID = abstractmo0_1_.MODULE_CONFIG_ID WHERE abstractmo0_.CONFIG_TYPE = q1_i1 AND (abstractmo0_.ARCHIVED IS NULL OR abstractmo0_.ARCHIVED = 'N') AND abstractmo0_.ACTIVE_START_DATE IS NOT NULL AND abstractmo0_.ACTIVE_START_DATE < q1_i2 AND (abstractmo0_.ACTIVE_END_DATE IS NULL OR abstractmo0_.ACTIVE_END_DATE > q1_i3) ORDER BY abstractmo0_.MODULE_PRIORITY ASC;
SET M_I_RS_110_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q2_i1 = RS_q66_r1_col32;
SET QUERY_ID_1 = 1;
SELECT allparentc0_.PRODUCT_ID AS PRODUCT_5_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_2_, allparentc0_.CATEGORY_ID AS CATEGORY4_29_2_, allparentc0_.DEFAULT_REFERENCE AS DEFAULT_2_29_2_ , allparentc0_.DISPLAY_ORDER AS DISPLAY_3_29_2_, allparentc0_.PRODUCT_ID AS PRODUCT_5_29_2_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_0_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_0_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_0_ , categoryim1_.ARCHIVED AS ARCHIVED4_26_0_, categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_0_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_0_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_0_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_0_ , categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_0_, categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_0_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_0_, categoryim1_.META_DESC AS META_DE11_26_0_, categoryim1_.META_TITLE AS META_TI12_26_0_ , categoryim1_.NAME AS NAME13_26_0_, categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_0_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_0_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_0_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_0_ , categoryim1_.TAX_CODE AS TAX_COD18_26_0_, categoryim1_.URL AS URL19_26_0_, categoryim1_.URL_KEY AS URL_KEY20_26_0_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_ , categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim2_.ARCHIVED AS ARCHIVED4_26_1_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_ , categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_1_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim2_.META_DESC AS META_DE11_26_1_ , categoryim2_.META_TITLE AS META_TI12_26_1_, categoryim2_.NAME AS NAME13_26_1_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_ , categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim2_.TAX_CODE AS TAX_COD18_26_1_, categoryim2_.URL AS URL19_26_1_, categoryim2_.URL_KEY AS URL_KEY20_26_1_ FROM BLC_CATEGORY_PRODUCT_XREF allparentc0_ INNER JOIN BLC_CATEGORY categoryim1_ ON allparentc0_.CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID WHERE allparentc0_.PRODUCT_ID = q2_i1 ORDER BY allparentc0_.DISPLAY_ORDER;
SET M_I_RS_111_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET QUERY_ID_2_TXN = 2;
set autocommit=0;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,QUERY_ID_1,q2_i1,QUERY_ID_2_TXN;

END $$
DELIMITER ;