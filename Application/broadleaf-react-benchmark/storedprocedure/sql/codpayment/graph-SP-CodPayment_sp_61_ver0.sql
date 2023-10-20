DROP PROCEDURE IF EXISTS `CodPayment_sp_61_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_61_ver0 (IN RS_q66_r1_col32 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_68_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q66_r1_col32;
SET QUERY_ID_0 = 0;
SELECT productimp0_.PRODUCT_ID AS PRODUCT_1_119_0_, productimp0_.ARCHIVED AS ARCHIVED2_119_0_, productimp0_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_0_, productimp0_.CANONICAL_URL AS CANONICA4_119_0_, productimp0_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_0_ , productimp0_.DEFAULT_SKU_ID AS DEFAULT15_119_0_, productimp0_.DISPLAY_TEMPLATE AS DISPLAY_5_119_0_, productimp0_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_0_, productimp0_.MANUFACTURE AS MANUFACT7_119_0_, productimp0_.META_DESC AS META_DES8_119_0_ , productimp0_.META_TITLE AS META_TIT9_119_0_, productimp0_.MODEL AS MODEL10_119_0_, productimp0_.OVERRIDE_GENERATED_URL AS OVERRID11_119_0_, productimp0_.URL AS URL12_119_0_, productimp0_.URL_KEY AS URL_KEY13_119_0_ , productimp0_1_.AUTO_BUNDLE AS AUTO_BUN1_121_0_, productimp0_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_0_, productimp0_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_0_, productimp0_1_.PRICING_MODEL AS PRICING_4_121_0_, productimp0_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_0_ , CASE  WHEN productimp0_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp0_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_0_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim1_.ARCHIVED AS ARCHIVED4_26_1_ , categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_1_ , categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim1_.META_DESC AS META_DE11_26_1_, categoryim1_.META_TITLE AS META_TI12_26_1_, categoryim1_.NAME AS NAME13_26_1_ , categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim1_.TAX_CODE AS TAX_COD18_26_1_ , categoryim1_.URL AS URL19_26_1_, categoryim1_.URL_KEY AS URL_KEY20_26_1_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_, categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_ , categoryim2_.ARCHIVED AS ARCHIVED4_26_2_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_, categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_2_ , categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_2_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim2_.META_DESC AS META_DE11_26_2_, categoryim2_.META_TITLE AS META_TI12_26_2_ , categoryim2_.NAME AS NAME13_26_2_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_, categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_ , categoryim2_.TAX_CODE AS TAX_COD18_26_2_, categoryim2_.URL AS URL19_26_2_, categoryim2_.URL_KEY AS URL_KEY20_26_2_, skuimpl3_.SKU_ID AS SKU_ID1_160_3_, skuimpl3_.ACTIVE_END_DATE AS ACTIVE_E2_160_3_ , skuimpl3_.ACTIVE_START_DATE AS ACTIVE_S3_160_3_, skuimpl3_.AVAILABLE_FLAG AS AVAILABL4_160_3_, skuimpl3_.COST AS COST5_160_3_, skuimpl3_.CURRENCY_CODE AS CURRENC31_160_3_, skuimpl3_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_3_ , skuimpl3_.DESCRIPTION AS DESCRIPT6_160_3_, skuimpl3_.CONTAINER_SHAPE AS CONTAINE7_160_3_, skuimpl3_.DEPTH AS DEPTH8_160_3_, skuimpl3_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_3_, skuimpl3_.GIRTH AS GIRTH10_160_3_ , skuimpl3_.HEIGHT AS HEIGHT11_160_3_, skuimpl3_.CONTAINER_SIZE AS CONTAIN12_160_3_, skuimpl3_.WIDTH AS WIDTH13_160_3_, skuimpl3_.DISCOUNTABLE_FLAG AS DISCOUN14_160_3_, skuimpl3_.DISPLAY_TEMPLATE AS DISPLAY15_160_3_ , skuimpl3_.EXTERNAL_ID AS EXTERNA16_160_3_, skuimpl3_.FULFILLMENT_TYPE AS FULFILL17_160_3_, skuimpl3_.INVENTORY_TYPE AS INVENTO18_160_3_, skuimpl3_.IS_MACHINE_SORTABLE AS IS_MACH19_160_3_, skuimpl3_.LONG_DESCRIPTION AS LONG_DE20_160_3_ , skuimpl3_.NAME AS NAME21_160_3_, skuimpl3_.ADDL_PRODUCT_ID AS ADDL_PR33_160_3_, skuimpl3_.QUANTITY_AVAILABLE AS QUANTIT22_160_3_, skuimpl3_.RETAIL_PRICE AS RETAIL_23_160_3_, skuimpl3_.SALE_PRICE AS SALE_PR24_160_3_ , skuimpl3_.TAX_CODE AS TAX_COD25_160_3_, skuimpl3_.TAXABLE_FLAG AS TAXABLE26_160_3_, skuimpl3_.UPC AS UPC27_160_3_, skuimpl3_.URL_KEY AS URL_KEY28_160_3_, skuimpl3_.WEIGHT AS WEIGHT29_160_3_ , skuimpl3_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_3_, broadleafc4_.CURRENCY_CODE AS CURRENCY1_38_4_, broadleafc4_.DEFAULT_FLAG AS DEFAULT_2_38_4_, broadleafc4_.FRIENDLY_NAME AS FRIENDLY3_38_4_, productimp5_.PRODUCT_ID AS PRODUCT_1_119_5_ , productimp5_.ARCHIVED AS ARCHIVED2_119_5_, productimp5_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_5_, productimp5_.CANONICAL_URL AS CANONICA4_119_5_, productimp5_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_5_, productimp5_.DEFAULT_SKU_ID AS DEFAULT15_119_5_ , productimp5_.DISPLAY_TEMPLATE AS DISPLAY_5_119_5_, productimp5_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_5_, productimp5_.MANUFACTURE AS MANUFACT7_119_5_, productimp5_.META_DESC AS META_DES8_119_5_, productimp5_.META_TITLE AS META_TIT9_119_5_ , productimp5_.MODEL AS MODEL10_119_5_, productimp5_.OVERRIDE_GENERATED_URL AS OVERRID11_119_5_, productimp5_.URL AS URL12_119_5_, productimp5_.URL_KEY AS URL_KEY13_119_5_, productimp5_1_.AUTO_BUNDLE AS AUTO_BUN1_121_5_ , productimp5_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_5_, productimp5_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_5_, productimp5_1_.PRICING_MODEL AS PRICING_4_121_5_, productimp5_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_5_ , CASE  WHEN productimp5_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp5_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_5_, productimp6_.PRODUCT_ID AS PRODUCT_1_119_6_, productimp6_.ARCHIVED AS ARCHIVED2_119_6_, productimp6_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_6_, productimp6_.CANONICAL_URL AS CANONICA4_119_6_ , productimp6_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_6_, productimp6_.DEFAULT_SKU_ID AS DEFAULT15_119_6_, productimp6_.DISPLAY_TEMPLATE AS DISPLAY_5_119_6_, productimp6_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_6_, productimp6_.MANUFACTURE AS MANUFACT7_119_6_ , productimp6_.META_DESC AS META_DES8_119_6_, productimp6_.META_TITLE AS META_TIT9_119_6_, productimp6_.MODEL AS MODEL10_119_6_, productimp6_.OVERRIDE_GENERATED_URL AS OVERRID11_119_6_, productimp6_.URL AS URL12_119_6_ , productimp6_.URL_KEY AS URL_KEY13_119_6_, productimp6_1_.AUTO_BUNDLE AS AUTO_BUN1_121_6_, productimp6_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_6_, productimp6_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_6_, productimp6_1_.PRICING_MODEL AS PRICING_4_121_6_ , productimp6_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_6_ , CASE  WHEN productimp6_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp6_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_6_ FROM BLC_PRODUCT productimp0_ LEFT JOIN BLC_PRODUCT_BUNDLE productimp0_1_ ON productimp0_.PRODUCT_ID = productimp0_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim1_ ON productimp0_.DEFAULT_CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl3_ ON productimp0_.DEFAULT_SKU_ID = skuimpl3_.SKU_ID LEFT JOIN BLC_CURRENCY broadleafc4_ ON skuimpl3_.CURRENCY_CODE = broadleafc4_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp5_ ON skuimpl3_.DEFAULT_PRODUCT_ID = productimp5_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp5_1_ ON productimp5_.PRODUCT_ID = productimp5_1_.PRODUCT_ID LEFT JOIN BLC_PRODUCT productimp6_ ON skuimpl3_.ADDL_PRODUCT_ID = productimp6_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp6_1_ ON productimp6_.PRODUCT_ID = productimp6_1_.PRODUCT_ID WHERE productimp0_.PRODUCT_ID = q1_i1;
SET M_I_RS_68_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;