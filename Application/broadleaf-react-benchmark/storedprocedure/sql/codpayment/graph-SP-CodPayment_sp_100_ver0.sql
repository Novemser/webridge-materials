DROP PROCEDURE IF EXISTS `CodPayment_sp_100_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_100_ver0 (IN RS_q66_r1_col32 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_111_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q66_r1_col32;
SET QUERY_ID_0 = 0;
SELECT allparentc0_.PRODUCT_ID AS PRODUCT_5_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_2_, allparentc0_.CATEGORY_ID AS CATEGORY4_29_2_, allparentc0_.DEFAULT_REFERENCE AS DEFAULT_2_29_2_ , allparentc0_.DISPLAY_ORDER AS DISPLAY_3_29_2_, allparentc0_.PRODUCT_ID AS PRODUCT_5_29_2_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_0_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_0_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_0_ , categoryim1_.ARCHIVED AS ARCHIVED4_26_0_, categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_0_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_0_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_0_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_0_ , categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_0_, categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_0_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_0_, categoryim1_.META_DESC AS META_DE11_26_0_, categoryim1_.META_TITLE AS META_TI12_26_0_ , categoryim1_.NAME AS NAME13_26_0_, categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_0_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_0_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_0_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_0_ , categoryim1_.TAX_CODE AS TAX_COD18_26_0_, categoryim1_.URL AS URL19_26_0_, categoryim1_.URL_KEY AS URL_KEY20_26_0_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_ , categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim2_.ARCHIVED AS ARCHIVED4_26_1_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_ , categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_1_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim2_.META_DESC AS META_DE11_26_1_ , categoryim2_.META_TITLE AS META_TI12_26_1_, categoryim2_.NAME AS NAME13_26_1_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_ , categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim2_.TAX_CODE AS TAX_COD18_26_1_, categoryim2_.URL AS URL19_26_1_, categoryim2_.URL_KEY AS URL_KEY20_26_1_ FROM BLC_CATEGORY_PRODUCT_XREF allparentc0_ INNER JOIN BLC_CATEGORY categoryim1_ ON allparentc0_.CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID WHERE allparentc0_.PRODUCT_ID = q1_i1 ORDER BY allparentc0_.DISPLAY_ORDER;
SET M_I_RS_111_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;