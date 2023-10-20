DROP PROCEDURE IF EXISTS `ItemDetails_sp_35_ver0`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_35_ver0 (IN RS_q24_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_36_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q24_r1_col1;
SET QUERY_ID_0 = 0;
SELECT crosssalep0_.PRODUCT_ID AS PRODUCT_5_122_0_, crosssalep0_.CROSS_SALE_PRODUCT_ID AS CROSS_SA1_122_0_, crosssalep0_.CROSS_SALE_PRODUCT_ID AS CROSS_SA1_122_1_, crosssalep0_.CATEGORY_ID AS CATEGORY4_122_1_, crosssalep0_.PRODUCT_ID AS PRODUCT_5_122_1_ , crosssalep0_.PROMOTION_MESSAGE AS PROMOTIO2_122_1_, crosssalep0_.RELATED_SALE_PRODUCT_ID AS RELATED_6_122_1_, crosssalep0_.SEQUENCE AS SEQUENCE3_122_1_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_ , categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_, categoryim1_.ARCHIVED AS ARCHIVED4_26_2_, categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_ , categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_2_, categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_2_, categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim1_.META_DESC AS META_DE11_26_2_ , categoryim1_.META_TITLE AS META_TI12_26_2_, categoryim1_.NAME AS NAME13_26_2_, categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_ , categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_, categoryim1_.TAX_CODE AS TAX_COD18_26_2_, categoryim1_.URL AS URL19_26_2_, categoryim1_.URL_KEY AS URL_KEY20_26_2_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_3_ , categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_3_, categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_3_, categoryim2_.ARCHIVED AS ARCHIVED4_26_3_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_3_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_3_ , categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_3_, categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_3_, categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_3_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_3_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_3_ , categoryim2_.META_DESC AS META_DE11_26_3_, categoryim2_.META_TITLE AS META_TI12_26_3_, categoryim2_.NAME AS NAME13_26_3_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_3_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_3_ , categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_3_, categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_3_, categoryim2_.TAX_CODE AS TAX_COD18_26_3_, categoryim2_.URL AS URL19_26_3_, categoryim2_.URL_KEY AS URL_KEY20_26_3_ , productimp3_.PRODUCT_ID AS PRODUCT_1_119_4_, productimp3_.ARCHIVED AS ARCHIVED2_119_4_, productimp3_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_4_, productimp3_.CANONICAL_URL AS CANONICA4_119_4_, productimp3_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_4_ , productimp3_.DEFAULT_SKU_ID AS DEFAULT15_119_4_, productimp3_.DISPLAY_TEMPLATE AS DISPLAY_5_119_4_, productimp3_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_4_, productimp3_.MANUFACTURE AS MANUFACT7_119_4_, productimp3_.META_DESC AS META_DES8_119_4_ , productimp3_.META_TITLE AS META_TIT9_119_4_, productimp3_.MODEL AS MODEL10_119_4_, productimp3_.OVERRIDE_GENERATED_URL AS OVERRID11_119_4_, productimp3_.URL AS URL12_119_4_, productimp3_.URL_KEY AS URL_KEY13_119_4_ , productimp3_1_.AUTO_BUNDLE AS AUTO_BUN1_121_4_, productimp3_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_4_, productimp3_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_4_, productimp3_1_.PRICING_MODEL AS PRICING_4_121_4_, productimp3_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_4_ , CASE  WHEN productimp3_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp3_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_4_, categoryim4_.CATEGORY_ID AS CATEGORY1_26_5_, categoryim4_.ACTIVE_END_DATE AS ACTIVE_E2_26_5_, categoryim4_.ACTIVE_START_DATE AS ACTIVE_S3_26_5_, categoryim4_.ARCHIVED AS ARCHIVED4_26_5_ , categoryim4_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_5_, categoryim4_.DESCRIPTION AS DESCRIPT5_26_5_, categoryim4_.DISPLAY_TEMPLATE AS DISPLAY_6_26_5_, categoryim4_.EXTERNAL_ID AS EXTERNAL7_26_5_, categoryim4_.FULFILLMENT_TYPE AS FULFILLM8_26_5_ , categoryim4_.INVENTORY_TYPE AS INVENTOR9_26_5_, categoryim4_.LONG_DESCRIPTION AS LONG_DE10_26_5_, categoryim4_.META_DESC AS META_DE11_26_5_, categoryim4_.META_TITLE AS META_TI12_26_5_, categoryim4_.NAME AS NAME13_26_5_ , categoryim4_.OVERRIDE_GENERATED_URL AS OVERRID14_26_5_, categoryim4_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_5_, categoryim4_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_5_, categoryim4_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_5_, categoryim4_.TAX_CODE AS TAX_COD18_26_5_ , categoryim4_.URL AS URL19_26_5_, categoryim4_.URL_KEY AS URL_KEY20_26_5_, skuimpl5_.SKU_ID AS SKU_ID1_160_6_, skuimpl5_.ACTIVE_END_DATE AS ACTIVE_E2_160_6_, skuimpl5_.ACTIVE_START_DATE AS ACTIVE_S3_160_6_ , skuimpl5_.AVAILABLE_FLAG AS AVAILABL4_160_6_, skuimpl5_.COST AS COST5_160_6_, skuimpl5_.CURRENCY_CODE AS CURRENC31_160_6_, skuimpl5_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_6_, skuimpl5_.DESCRIPTION AS DESCRIPT6_160_6_ , skuimpl5_.CONTAINER_SHAPE AS CONTAINE7_160_6_, skuimpl5_.DEPTH AS DEPTH8_160_6_, skuimpl5_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_6_, skuimpl5_.GIRTH AS GIRTH10_160_6_, skuimpl5_.HEIGHT AS HEIGHT11_160_6_ , skuimpl5_.CONTAINER_SIZE AS CONTAIN12_160_6_, skuimpl5_.WIDTH AS WIDTH13_160_6_, skuimpl5_.DISCOUNTABLE_FLAG AS DISCOUN14_160_6_, skuimpl5_.DISPLAY_TEMPLATE AS DISPLAY15_160_6_, skuimpl5_.EXTERNAL_ID AS EXTERNA16_160_6_ , skuimpl5_.FULFILLMENT_TYPE AS FULFILL17_160_6_, skuimpl5_.INVENTORY_TYPE AS INVENTO18_160_6_, skuimpl5_.IS_MACHINE_SORTABLE AS IS_MACH19_160_6_, skuimpl5_.LONG_DESCRIPTION AS LONG_DE20_160_6_, skuimpl5_.NAME AS NAME21_160_6_ , skuimpl5_.ADDL_PRODUCT_ID AS ADDL_PR33_160_6_, skuimpl5_.QUANTITY_AVAILABLE AS QUANTIT22_160_6_, skuimpl5_.RETAIL_PRICE AS RETAIL_23_160_6_, skuimpl5_.SALE_PRICE AS SALE_PR24_160_6_, skuimpl5_.TAX_CODE AS TAX_COD25_160_6_ , skuimpl5_.TAXABLE_FLAG AS TAXABLE26_160_6_, skuimpl5_.UPC AS UPC27_160_6_, skuimpl5_.URL_KEY AS URL_KEY28_160_6_, skuimpl5_.WEIGHT AS WEIGHT29_160_6_, skuimpl5_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_6_ FROM BLC_PRODUCT_CROSS_SALE crosssalep0_ LEFT JOIN BLC_CATEGORY categoryim1_ ON crosssalep0_.CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID LEFT JOIN BLC_PRODUCT productimp3_ ON crosssalep0_.RELATED_SALE_PRODUCT_ID = productimp3_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp3_1_ ON productimp3_.PRODUCT_ID = productimp3_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim4_ ON productimp3_.DEFAULT_CATEGORY_ID = categoryim4_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl5_ ON productimp3_.DEFAULT_SKU_ID = skuimpl5_.SKU_ID WHERE crosssalep0_.PRODUCT_ID = q1_i1 ORDER BY crosssalep0_.SEQUENCE;
SET M_I_RS_36_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;