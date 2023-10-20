DROP PROCEDURE IF EXISTS `ItemDetails_sp_23_ver0`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_23_ver0 (IN M_L_String__product_key VARCHAR(512), IN M_L_String__product_category VARCHAR(512), IN __nd__func__currentTimeMs__42__99 BIGINT)
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 DATETIME DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_24_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key);
SET q1_i2 = SUBSTRING(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key),last_index_of_char_from(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key),47,LENGTH(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key))-1)+1,LENGTH(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key))-last_index_of_char_from(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key),47,LENGTH(CONCAT(CONCAT(CONCAT('/',M_L_String__product_category),'/'),M_L_String__product_key))-1));
SET q1_i3 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__99/1000)*1000)/1000));
SET QUERY_ID_0 = 0;
SELECT productimp0_.PRODUCT_ID AS PRODUCT_1_119_, productimp0_.ARCHIVED AS ARCHIVED2_119_, productimp0_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_, productimp0_.CANONICAL_URL AS CANONICA4_119_, productimp0_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_ , productimp0_.DEFAULT_SKU_ID AS DEFAULT15_119_, productimp0_.DISPLAY_TEMPLATE AS DISPLAY_5_119_, productimp0_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_, productimp0_.MANUFACTURE AS MANUFACT7_119_, productimp0_.META_DESC AS META_DES8_119_ , productimp0_.META_TITLE AS META_TIT9_119_, productimp0_.MODEL AS MODEL10_119_, productimp0_.OVERRIDE_GENERATED_URL AS OVERRID11_119_, productimp0_.URL AS URL12_119_, productimp0_.URL_KEY AS URL_KEY13_119_ , productimp0_1_.AUTO_BUNDLE AS AUTO_BUN1_121_, productimp0_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_, productimp0_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_, productimp0_1_.PRICING_MODEL AS PRICING_4_121_, productimp0_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_ , CASE  WHEN productimp0_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp0_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_ FROM BLC_PRODUCT productimp0_ LEFT JOIN BLC_PRODUCT_BUNDLE productimp0_1_ ON productimp0_.PRODUCT_ID = productimp0_1_.PRODUCT_ID CROSS JOIN BLC_SKU skuimpl1_ WHERE productimp0_.DEFAULT_SKU_ID = skuimpl1_.SKU_ID AND (productimp0_.URL = q1_i1 OR productimp0_.URL_KEY = q1_i2) AND (skuimpl1_.ACTIVE_END_DATE > q1_i3 OR skuimpl1_.ACTIVE_END_DATE IS NULL) AND (productimp0_.ARCHIVED IS NULL OR productimp0_.ARCHIVED = 'N');
SET M_I_RS_24_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3;

END $$
DELIMITER ;