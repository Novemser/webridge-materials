DROP PROCEDURE IF EXISTS `Seo_sp_3`;
DELIMITER $$
CREATE PROCEDURE Seo_sp_3 (IN __nd__func__currentTimeMs__32 datetime, IN REQUEST_PARAM_entityURI VARCHAR(255))
BEGIN

DECLARE q1_i1 VARCHAR(255) DEFAULT NULL;
DECLARE q1_i2 DATETIME DEFAULT NULL;
DECLARE q1_i3 DATETIME DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___category_id__CATEGORY1_26_ BIGINT DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___active_end_date__ACTIVE_E2_26_ DATETIME DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___active_start_date__ACTIVE_S3_26_ DATETIME DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___archived__ARCHIVED4_26_ CHAR DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___default_parent_category_id__DEFAULT21_26_ BIGINT DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___description__DESCRIPT5_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___display_template__DISPLAY_6_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___external_id__EXTERNAL7_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___fulfillment_type__FULFILLM8_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___inventory_type__INVENTOR9_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___long_description__LONG_DE10_26_ LONGTEXT DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___meta_desc__META_DE11_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___meta_title__META_TI12_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___name__NAME13_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___override_generated_url__OVERRID14_26_ BIT(1) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___product_desc_pattern_override__PRODUCT15_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___product_title_pattern_override__PRODUCT16_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___root_display_order__ROOT_DI17_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___tax_code__TAX_COD18_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___url__URL19_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_res1_col_categoryim0___url_key__URL_KEY20_26_ VARCHAR(255) DEFAULT NULL;
DECLARE q25_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE cursor_0 int DEFAULT NULL;
DECLARE indicator_0 int DEFAULT NULL;
DECLARE q2_i1 VARCHAR(255) DEFAULT NULL;
DECLARE q2_i2 VARCHAR(255) DEFAULT NULL;
DECLARE q2_i3 VARCHAR(255) DEFAULT NULL;
DECLARE q2_i4 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE q26_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(255) DEFAULT NULL;
DECLARE q3_i2 VARCHAR(255) DEFAULT NULL;
DECLARE q3_i3 VARCHAR(255) DEFAULT NULL;
DECLARE q3_i4 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE q27_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = REQUEST_PARAM_entityURI;
SET q1_i2 = __nd__func__currentTimeMs__32;
SET q1_i3 = __nd__func__currentTimeMs__32;
SET QUERY_ID_0 = 0;
SET indicator_0 = 0;
SET cursor_cnt_0 = 0;
BEGIN
DECLARE cursor_0 CURSOR FOR SELECT categoryim0_.CATEGORY_ID AS CATEGORY1_26_, categoryim0_.ACTIVE_END_DATE AS ACTIVE_E2_26_, categoryim0_.ACTIVE_START_DATE AS ACTIVE_S3_26_, categoryim0_.ARCHIVED AS ARCHIVED4_26_, categoryim0_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_ , categoryim0_.DESCRIPTION AS DESCRIPT5_26_, categoryim0_.DISPLAY_TEMPLATE AS DISPLAY_6_26_, categoryim0_.EXTERNAL_ID AS EXTERNAL7_26_, categoryim0_.FULFILLMENT_TYPE AS FULFILLM8_26_, categoryim0_.INVENTORY_TYPE AS INVENTOR9_26_ , categoryim0_.LONG_DESCRIPTION AS LONG_DE10_26_, categoryim0_.META_DESC AS META_DE11_26_, categoryim0_.META_TITLE AS META_TI12_26_, categoryim0_.NAME AS NAME13_26_, categoryim0_.OVERRIDE_GENERATED_URL AS OVERRID14_26_ , categoryim0_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_, categoryim0_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_, categoryim0_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_, categoryim0_.TAX_CODE AS TAX_COD18_26_, categoryim0_.URL AS URL19_26_ , categoryim0_.URL_KEY AS URL_KEY20_26_ FROM BLC_CATEGORY categoryim0_ WHERE categoryim0_.URL = q1_i1 AND (categoryim0_.ARCHIVED IS NULL OR categoryim0_.ARCHIVED = 'N') AND categoryim0_.ACTIVE_START_DATE < q1_i2 AND (categoryim0_.ACTIVE_END_DATE IS NULL OR categoryim0_.ACTIVE_END_DATE > q1_i3);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_0 = 1;
OPEN cursor_0;
loop_0: LOOP
IF cursor_cnt_0=0 THEN
FETCH cursor_0 INTO q25_res1_col_categoryim0___category_id__CATEGORY1_26_, q25_res1_col_categoryim0___active_end_date__ACTIVE_E2_26_, q25_res1_col_categoryim0___active_start_date__ACTIVE_S3_26_, q25_res1_col_categoryim0___archived__ARCHIVED4_26_, q25_res1_col_categoryim0___default_parent_category_id__DEFAULT21_26_, q25_res1_col_categoryim0___description__DESCRIPT5_26_, q25_res1_col_categoryim0___display_template__DISPLAY_6_26_, q25_res1_col_categoryim0___external_id__EXTERNAL7_26_, q25_res1_col_categoryim0___fulfillment_type__FULFILLM8_26_, q25_res1_col_categoryim0___inventory_type__INVENTOR9_26_, q25_res1_col_categoryim0___long_description__LONG_DE10_26_, q25_res1_col_categoryim0___meta_desc__META_DE11_26_, q25_res1_col_categoryim0___meta_title__META_TI12_26_, q25_res1_col_categoryim0___name__NAME13_26_, q25_res1_col_categoryim0___override_generated_url__OVERRID14_26_, q25_res1_col_categoryim0___product_desc_pattern_override__PRODUCT15_26_, q25_res1_col_categoryim0___product_title_pattern_override__PRODUCT16_26_, q25_res1_col_categoryim0___root_display_order__ROOT_DI17_26_, q25_res1_col_categoryim0___tax_code__TAX_COD18_26_, q25_res1_col_categoryim0___url__URL19_26_, q25_res1_col_categoryim0___url_key__URL_KEY20_26_;
END IF;
IF cursor_cnt_0>=1 THEN
CLOSE cursor_0; LEAVE loop_0;END IF;
IF indicator_0=1 THEN CLOSE cursor_0; LEAVE loop_0; END IF;
SET cursor_cnt_0 = cursor_cnt_0 + 1;
END LOOP loop_0;
END;
SELECT cursor_cnt_0,q25_res1_col_categoryim0___category_id__CATEGORY1_26_,q25_res1_col_categoryim0___active_end_date__ACTIVE_E2_26_,q25_res1_col_categoryim0___active_start_date__ACTIVE_S3_26_,q25_res1_col_categoryim0___archived__ARCHIVED4_26_,q25_res1_col_categoryim0___default_parent_category_id__DEFAULT21_26_,q25_res1_col_categoryim0___description__DESCRIPT5_26_,q25_res1_col_categoryim0___display_template__DISPLAY_6_26_,q25_res1_col_categoryim0___external_id__EXTERNAL7_26_,q25_res1_col_categoryim0___fulfillment_type__FULFILLM8_26_,q25_res1_col_categoryim0___inventory_type__INVENTOR9_26_,q25_res1_col_categoryim0___long_description__LONG_DE10_26_,q25_res1_col_categoryim0___meta_desc__META_DE11_26_,q25_res1_col_categoryim0___meta_title__META_TI12_26_,q25_res1_col_categoryim0___name__NAME13_26_,q25_res1_col_categoryim0___override_generated_url__OVERRID14_26_,q25_res1_col_categoryim0___product_desc_pattern_override__PRODUCT15_26_,q25_res1_col_categoryim0___product_title_pattern_override__PRODUCT16_26_,q25_res1_col_categoryim0___root_display_order__ROOT_DI17_26_,q25_res1_col_categoryim0___tax_code__TAX_COD18_26_,q25_res1_col_categoryim0___url__URL19_26_,q25_res1_col_categoryim0___url_key__URL_KEY20_26_;
SET q25_select_ret_num = cursor_cnt_0;
IF cursor_cnt_0 > 0 THEN
SET q2_i1 = 'Category';
SET q2_i2 = CONVERT(q25_res1_col_categoryim0___category_id__CATEGORY1_26_,CHAR);
SET q2_i3 = 'name';
SET q2_i4 = 'en%';
SET QUERY_ID_1 = 1;
SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = q2_i1 AND translatio0_.ENTITY_ID = q2_i2 AND translatio0_.FIELD_NAME = q2_i3 AND (translatio0_.LOCALE_CODE LIKE q2_i4);
SET q26_select_ret_num = FOUND_ROWS();
END IF;
IF cursor_cnt_0 > 0 THEN
SET q3_i1 = 'Category';
SET q3_i2 = CONVERT(q25_res1_col_categoryim0___category_id__CATEGORY1_26_,CHAR);
SET q3_i3 = 'longDescription';
SET q3_i4 = 'en%';
SET QUERY_ID_2 = 2;
SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = q3_i1 AND translatio0_.ENTITY_ID = q3_i2 AND translatio0_.FIELD_NAME = q3_i3 AND (translatio0_.LOCALE_CODE LIKE q3_i4);
SET q27_select_ret_num = FOUND_ROWS();
END IF;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,QUERY_ID_1,q2_i1,q2_i2,q2_i3,q2_i4,QUERY_ID_2,q3_i1,q3_i2,q3_i3,q3_i4;

END $$
DELIMITER ;