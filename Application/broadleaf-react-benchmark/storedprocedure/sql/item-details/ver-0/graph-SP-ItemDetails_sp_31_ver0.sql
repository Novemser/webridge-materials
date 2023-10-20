DROP PROCEDURE IF EXISTS `ItemDetails_sp_31_ver0`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_31_ver0 (IN RS_q24_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_32_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q24_r1_col1;
SET QUERY_ID_0 = 0;
SELECT additional0_.ADDL_PRODUCT_ID AS ADDL_PR33_160_5_, additional0_.SKU_ID AS SKU_ID1_160_5_, additional0_.SKU_ID AS SKU_ID1_160_4_, additional0_.ACTIVE_END_DATE AS ACTIVE_E2_160_4_, additional0_.ACTIVE_START_DATE AS ACTIVE_S3_160_4_ , additional0_.AVAILABLE_FLAG AS AVAILABL4_160_4_, additional0_.COST AS COST5_160_4_, additional0_.CURRENCY_CODE AS CURRENC31_160_4_, additional0_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_4_, additional0_.DESCRIPTION AS DESCRIPT6_160_4_ , additional0_.CONTAINER_SHAPE AS CONTAINE7_160_4_, additional0_.DEPTH AS DEPTH8_160_4_, additional0_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_4_, additional0_.GIRTH AS GIRTH10_160_4_, additional0_.HEIGHT AS HEIGHT11_160_4_ , additional0_.CONTAINER_SIZE AS CONTAIN12_160_4_, additional0_.WIDTH AS WIDTH13_160_4_, additional0_.DISCOUNTABLE_FLAG AS DISCOUN14_160_4_, additional0_.DISPLAY_TEMPLATE AS DISPLAY15_160_4_, additional0_.EXTERNAL_ID AS EXTERNA16_160_4_ , additional0_.FULFILLMENT_TYPE AS FULFILL17_160_4_, additional0_.INVENTORY_TYPE AS INVENTO18_160_4_, additional0_.IS_MACHINE_SORTABLE AS IS_MACH19_160_4_, additional0_.LONG_DESCRIPTION AS LONG_DE20_160_4_, additional0_.NAME AS NAME21_160_4_ , additional0_.ADDL_PRODUCT_ID AS ADDL_PR33_160_4_, additional0_.QUANTITY_AVAILABLE AS QUANTIT22_160_4_, additional0_.RETAIL_PRICE AS RETAIL_23_160_4_, additional0_.SALE_PRICE AS SALE_PR24_160_4_, additional0_.TAX_CODE AS TAX_COD25_160_4_ , additional0_.TAXABLE_FLAG AS TAXABLE26_160_4_, additional0_.UPC AS UPC27_160_4_, additional0_.URL_KEY AS URL_KEY28_160_4_, additional0_.WEIGHT AS WEIGHT29_160_4_, additional0_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_4_ , broadleafc1_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc1_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc1_.FRIENDLY_NAME AS FRIENDLY3_38_0_, productimp2_.PRODUCT_ID AS PRODUCT_1_119_1_, productimp2_.ARCHIVED AS ARCHIVED2_119_1_ , productimp2_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_1_, productimp2_.CANONICAL_URL AS CANONICA4_119_1_, productimp2_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_1_, productimp2_.DEFAULT_SKU_ID AS DEFAULT15_119_1_, productimp2_.DISPLAY_TEMPLATE AS DISPLAY_5_119_1_ , productimp2_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_1_, productimp2_.MANUFACTURE AS MANUFACT7_119_1_, productimp2_.META_DESC AS META_DES8_119_1_, productimp2_.META_TITLE AS META_TIT9_119_1_, productimp2_.MODEL AS MODEL10_119_1_ , productimp2_.OVERRIDE_GENERATED_URL AS OVERRID11_119_1_, productimp2_.URL AS URL12_119_1_, productimp2_.URL_KEY AS URL_KEY13_119_1_, productimp2_1_.AUTO_BUNDLE AS AUTO_BUN1_121_1_, productimp2_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_1_ , productimp2_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_1_, productimp2_1_.PRICING_MODEL AS PRICING_4_121_1_, productimp2_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_1_ , CASE  WHEN productimp2_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp2_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_1_, categoryim3_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim3_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_, categoryim3_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_, categoryim3_.ARCHIVED AS ARCHIVED4_26_2_ , categoryim3_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim3_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim3_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_, categoryim3_.EXTERNAL_ID AS EXTERNAL7_26_2_, categoryim3_.FULFILLMENT_TYPE AS FULFILLM8_26_2_ , categoryim3_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim3_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim3_.META_DESC AS META_DE11_26_2_, categoryim3_.META_TITLE AS META_TI12_26_2_, categoryim3_.NAME AS NAME13_26_2_ , categoryim3_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim3_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim3_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_, categoryim3_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_, categoryim3_.TAX_CODE AS TAX_COD18_26_2_ , categoryim3_.URL AS URL19_26_2_, categoryim3_.URL_KEY AS URL_KEY20_26_2_, skuimpl4_.SKU_ID AS SKU_ID1_160_3_, skuimpl4_.ACTIVE_END_DATE AS ACTIVE_E2_160_3_, skuimpl4_.ACTIVE_START_DATE AS ACTIVE_S3_160_3_ , skuimpl4_.AVAILABLE_FLAG AS AVAILABL4_160_3_, skuimpl4_.COST AS COST5_160_3_, skuimpl4_.CURRENCY_CODE AS CURRENC31_160_3_, skuimpl4_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_3_, skuimpl4_.DESCRIPTION AS DESCRIPT6_160_3_ , skuimpl4_.CONTAINER_SHAPE AS CONTAINE7_160_3_, skuimpl4_.DEPTH AS DEPTH8_160_3_, skuimpl4_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_3_, skuimpl4_.GIRTH AS GIRTH10_160_3_, skuimpl4_.HEIGHT AS HEIGHT11_160_3_ , skuimpl4_.CONTAINER_SIZE AS CONTAIN12_160_3_, skuimpl4_.WIDTH AS WIDTH13_160_3_, skuimpl4_.DISCOUNTABLE_FLAG AS DISCOUN14_160_3_, skuimpl4_.DISPLAY_TEMPLATE AS DISPLAY15_160_3_, skuimpl4_.EXTERNAL_ID AS EXTERNA16_160_3_ , skuimpl4_.FULFILLMENT_TYPE AS FULFILL17_160_3_, skuimpl4_.INVENTORY_TYPE AS INVENTO18_160_3_, skuimpl4_.IS_MACHINE_SORTABLE AS IS_MACH19_160_3_, skuimpl4_.LONG_DESCRIPTION AS LONG_DE20_160_3_, skuimpl4_.NAME AS NAME21_160_3_ , skuimpl4_.ADDL_PRODUCT_ID AS ADDL_PR33_160_3_, skuimpl4_.QUANTITY_AVAILABLE AS QUANTIT22_160_3_, skuimpl4_.RETAIL_PRICE AS RETAIL_23_160_3_, skuimpl4_.SALE_PRICE AS SALE_PR24_160_3_, skuimpl4_.TAX_CODE AS TAX_COD25_160_3_ , skuimpl4_.TAXABLE_FLAG AS TAXABLE26_160_3_, skuimpl4_.UPC AS UPC27_160_3_, skuimpl4_.URL_KEY AS URL_KEY28_160_3_, skuimpl4_.WEIGHT AS WEIGHT29_160_3_, skuimpl4_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_3_ FROM BLC_SKU additional0_ LEFT JOIN BLC_CURRENCY broadleafc1_ ON additional0_.CURRENCY_CODE = broadleafc1_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp2_ ON additional0_.DEFAULT_PRODUCT_ID = productimp2_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp2_1_ ON productimp2_.PRODUCT_ID = productimp2_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim3_ ON productimp2_.DEFAULT_CATEGORY_ID = categoryim3_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl4_ ON productimp2_.DEFAULT_SKU_ID = skuimpl4_.SKU_ID WHERE additional0_.ADDL_PRODUCT_ID = q1_i1;
SET M_I_RS_32_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;