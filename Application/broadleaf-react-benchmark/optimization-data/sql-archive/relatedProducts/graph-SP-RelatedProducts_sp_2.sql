DROP PROCEDURE IF EXISTS `RelatedProducts_sp_2`;
DELIMITER $$
CREATE PROCEDURE RelatedProducts_sp_2 (IN REQUEST_PARAM_uri VARCHAR(255), IN REQUEST_HEADER_X_Locale VARCHAR(255), IN q8_res1_col_customerim0___customer_id__CUSTOMER1_40_ BIGINT)
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE q2_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE q14_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE q15_res1_col_localeimpl0___locale_code__LOCALE_C1_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q15_res1_col_localeimpl0___currency_code__CURRENCY5_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q15_res1_col_localeimpl0___default_flag__DEFAULT_2_82_ BIT(1) DEFAULT NULL;
DECLARE q15_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q15_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_ BIT(1) DEFAULT NULL;
DECLARE q15_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE cursor_2 int DEFAULT NULL;
DECLARE indicator_2 int DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE q16_res1_col_broadleafc0___currency_code__CURRENCY1_38_ VARCHAR(255) DEFAULT NULL;
DECLARE q16_res1_col_broadleafc0___default_flag__DEFAULT_2_38_ BIT(1) DEFAULT NULL;
DECLARE q16_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_ VARCHAR(255) DEFAULT NULL;
DECLARE q16_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;
DECLARE cursor_3 int DEFAULT NULL;
DECLARE indicator_3 int DEFAULT NULL;
DECLARE q5_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_4 INT DEFAULT NULL;
DECLARE q17_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_4 INT DEFAULT NULL;
DECLARE QUERY_ID_5 INT DEFAULT NULL;
DECLARE q18_res1_col_urlhandler0___url_handler_id__URL_HAND1_179_ BIGINT DEFAULT NULL;
DECLARE q18_res1_col_urlhandler0___incoming_url__INCOMING2_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res1_col_urlhandler0___is_regex__IS_REGEX3_179_ BIT(1) DEFAULT NULL;
DECLARE q18_res1_col_urlhandler0___new_url__NEW_URL4_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res1_col_urlhandler0___url_redirect_type__URL_REDI5_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res2_col_urlhandler0___url_handler_id__URL_HAND1_179_ BIGINT DEFAULT NULL;
DECLARE q18_res2_col_urlhandler0___incoming_url__INCOMING2_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res2_col_urlhandler0___is_regex__IS_REGEX3_179_ BIT(1) DEFAULT NULL;
DECLARE q18_res2_col_urlhandler0___new_url__NEW_URL4_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res2_col_urlhandler0___url_redirect_type__URL_REDI5_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res3_col_urlhandler0___url_handler_id__URL_HAND1_179_ BIGINT DEFAULT NULL;
DECLARE q18_res3_col_urlhandler0___incoming_url__INCOMING2_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res3_col_urlhandler0___is_regex__IS_REGEX3_179_ BIT(1) DEFAULT NULL;
DECLARE q18_res3_col_urlhandler0___new_url__NEW_URL4_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res3_col_urlhandler0___url_redirect_type__URL_REDI5_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res4_col_urlhandler0___url_handler_id__URL_HAND1_179_ BIGINT DEFAULT NULL;
DECLARE q18_res4_col_urlhandler0___incoming_url__INCOMING2_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res4_col_urlhandler0___is_regex__IS_REGEX3_179_ BIT(1) DEFAULT NULL;
DECLARE q18_res4_col_urlhandler0___new_url__NEW_URL4_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_res4_col_urlhandler0___url_redirect_type__URL_REDI5_179_ VARCHAR(255) DEFAULT NULL;
DECLARE q18_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_5 INT DEFAULT NULL;
DECLARE cursor_5 int DEFAULT NULL;
DECLARE indicator_5 int DEFAULT NULL;
DECLARE q7_i1 BIGINT DEFAULT NULL;
DECLARE q7_i2 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_6 INT DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_ BIGINT DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___created_by__CREATED_2_93_ BIGINT DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___date_created__DATE_CRE3_93_ DATETIME DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___date_updated__DATE_UPD4_93_ DATETIME DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___updated_by__UPDATED_5_93_ BIGINT DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___currency_code__CURRENC17_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___customer_id__CUSTOME18_93_ BIGINT DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___email_address__EMAIL_AD6_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___locale_code__LOCALE_19_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___name__NAME7_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___order_number__ORDER_NU8_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___is_preview__IS_PREVI9_93_ BIT(1) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___order_status__ORDER_S10_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___order_subtotal__ORDER_S11_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___submit_date__SUBMIT_12_93_ DATETIME DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___tax_override__TAX_OVE13_93_ BIT(1) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___order_total__ORDER_T14_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___total_shipping__TOTAL_S15_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_res1_col_orderimpl0___total_tax__TOTAL_T16_93_ VARCHAR(255) DEFAULT NULL;
DECLARE q19_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_6 INT DEFAULT NULL;
DECLARE cursor_6 int DEFAULT NULL;
DECLARE indicator_6 int DEFAULT NULL;
DECLARE q8_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_7 INT DEFAULT NULL;
DECLARE q20_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_7 INT DEFAULT NULL;
DECLARE q9_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_8 INT DEFAULT NULL;
DECLARE q21_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_8 INT DEFAULT NULL;
DECLARE q10_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_9 INT DEFAULT NULL;
DECLARE q22_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_9 INT DEFAULT NULL;
DECLARE q11_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_10 INT DEFAULT NULL;
DECLARE q23_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_10 INT DEFAULT NULL;
DECLARE q12_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_11 INT DEFAULT NULL;
DECLARE q24_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_11 INT DEFAULT NULL;

IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
SET q2_i1 = REQUEST_HEADER_X_Locale;
SET QUERY_ID_1 = 1;
SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q2_i1;
SET q14_select_ret_num = FOUND_ROWS();
SET q3_i1 = REPLACE(REQUEST_HEADER_X_Locale,'-','_');
SET QUERY_ID_2 = 2;
SET indicator_2 = 0;
SET cursor_cnt_2 = 0;
BEGIN
DECLARE cursor_2 CURSOR FOR SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q3_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_2 = 1;
OPEN cursor_2;
loop_2: LOOP
IF cursor_cnt_2=0 THEN
FETCH cursor_2 INTO q15_res1_col_localeimpl0___locale_code__LOCALE_C1_82_, q15_res1_col_localeimpl0___currency_code__CURRENCY5_82_, q15_res1_col_localeimpl0___default_flag__DEFAULT_2_82_, q15_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_, q15_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_;
END IF;
IF cursor_cnt_2>=1 THEN
CLOSE cursor_2; LEAVE loop_2;END IF;
IF indicator_2=1 THEN CLOSE cursor_2; LEAVE loop_2; END IF;
SET cursor_cnt_2 = cursor_cnt_2 + 1;
END LOOP loop_2;
END;
SELECT cursor_cnt_2,q15_res1_col_localeimpl0___locale_code__LOCALE_C1_82_,q15_res1_col_localeimpl0___currency_code__CURRENCY5_82_,q15_res1_col_localeimpl0___default_flag__DEFAULT_2_82_,q15_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_,q15_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_;
SET q15_select_ret_num = cursor_cnt_2;
SET QUERY_ID_3 = 3;
SET indicator_3 = 0;
SET cursor_cnt_3 = 0;
BEGIN
DECLARE cursor_3 CURSOR FOR SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_3 = 1;
OPEN cursor_3;
loop_3: LOOP
IF cursor_cnt_3=0 THEN
FETCH cursor_3 INTO q16_res1_col_broadleafc0___currency_code__CURRENCY1_38_, q16_res1_col_broadleafc0___default_flag__DEFAULT_2_38_, q16_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_;
END IF;
IF cursor_cnt_3>=1 THEN
CLOSE cursor_3; LEAVE loop_3;END IF;
IF indicator_3=1 THEN CLOSE cursor_3; LEAVE loop_3; END IF;
SET cursor_cnt_3 = cursor_cnt_3 + 1;
END LOOP loop_3;
END;
SELECT cursor_cnt_3,q16_res1_col_broadleafc0___currency_code__CURRENCY1_38_,q16_res1_col_broadleafc0___default_flag__DEFAULT_2_38_,q16_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_;
SET q16_select_ret_num = cursor_cnt_3;
SET q5_i1 = SUBSTRING(REQUEST_PARAM_uri,0+1,LENGTH(REQUEST_PARAM_uri)-0);
SET QUERY_ID_4 = 4;
SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_ WHERE urlhandler0_.INCOMING_URL = q5_i1;
SET q17_select_ret_num = FOUND_ROWS();
SET QUERY_ID_5 = 5;
SET indicator_5 = 0;
SET cursor_cnt_5 = 0;
BEGIN
DECLARE cursor_5 CURSOR FOR SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_5 = 1;
OPEN cursor_5;
loop_5: LOOP
IF cursor_cnt_5=0 THEN
FETCH cursor_5 INTO q18_res1_col_urlhandler0___url_handler_id__URL_HAND1_179_, q18_res1_col_urlhandler0___incoming_url__INCOMING2_179_, q18_res1_col_urlhandler0___is_regex__IS_REGEX3_179_, q18_res1_col_urlhandler0___new_url__NEW_URL4_179_, q18_res1_col_urlhandler0___url_redirect_type__URL_REDI5_179_;
END IF;
IF cursor_cnt_5=1 THEN
FETCH cursor_5 INTO q18_res2_col_urlhandler0___url_handler_id__URL_HAND1_179_, q18_res2_col_urlhandler0___incoming_url__INCOMING2_179_, q18_res2_col_urlhandler0___is_regex__IS_REGEX3_179_, q18_res2_col_urlhandler0___new_url__NEW_URL4_179_, q18_res2_col_urlhandler0___url_redirect_type__URL_REDI5_179_;
END IF;
IF cursor_cnt_5=2 THEN
FETCH cursor_5 INTO q18_res3_col_urlhandler0___url_handler_id__URL_HAND1_179_, q18_res3_col_urlhandler0___incoming_url__INCOMING2_179_, q18_res3_col_urlhandler0___is_regex__IS_REGEX3_179_, q18_res3_col_urlhandler0___new_url__NEW_URL4_179_, q18_res3_col_urlhandler0___url_redirect_type__URL_REDI5_179_;
END IF;
IF cursor_cnt_5=3 THEN
FETCH cursor_5 INTO q18_res4_col_urlhandler0___url_handler_id__URL_HAND1_179_, q18_res4_col_urlhandler0___incoming_url__INCOMING2_179_, q18_res4_col_urlhandler0___is_regex__IS_REGEX3_179_, q18_res4_col_urlhandler0___new_url__NEW_URL4_179_, q18_res4_col_urlhandler0___url_redirect_type__URL_REDI5_179_;
END IF;
IF cursor_cnt_5>=4 THEN
CLOSE cursor_5; LEAVE loop_5;END IF;
IF indicator_5=1 THEN CLOSE cursor_5; LEAVE loop_5; END IF;
SET cursor_cnt_5 = cursor_cnt_5 + 1;
END LOOP loop_5;
END;
SELECT cursor_cnt_5,q18_res1_col_urlhandler0___url_handler_id__URL_HAND1_179_,q18_res1_col_urlhandler0___incoming_url__INCOMING2_179_,q18_res1_col_urlhandler0___is_regex__IS_REGEX3_179_,q18_res1_col_urlhandler0___new_url__NEW_URL4_179_,q18_res1_col_urlhandler0___url_redirect_type__URL_REDI5_179_,q18_res2_col_urlhandler0___url_handler_id__URL_HAND1_179_,q18_res2_col_urlhandler0___incoming_url__INCOMING2_179_,q18_res2_col_urlhandler0___is_regex__IS_REGEX3_179_,q18_res2_col_urlhandler0___new_url__NEW_URL4_179_,q18_res2_col_urlhandler0___url_redirect_type__URL_REDI5_179_,q18_res3_col_urlhandler0___url_handler_id__URL_HAND1_179_,q18_res3_col_urlhandler0___incoming_url__INCOMING2_179_,q18_res3_col_urlhandler0___is_regex__IS_REGEX3_179_,q18_res3_col_urlhandler0___new_url__NEW_URL4_179_,q18_res3_col_urlhandler0___url_redirect_type__URL_REDI5_179_,q18_res4_col_urlhandler0___url_handler_id__URL_HAND1_179_,q18_res4_col_urlhandler0___incoming_url__INCOMING2_179_,q18_res4_col_urlhandler0___is_regex__IS_REGEX3_179_,q18_res4_col_urlhandler0___new_url__NEW_URL4_179_,q18_res4_col_urlhandler0___url_redirect_type__URL_REDI5_179_;
SET q18_select_ret_num = cursor_cnt_5;
SET q7_i1 = q8_res1_col_customerim0___customer_id__CUSTOMER1_40_;
SET q7_i2 = 'IN_PROCESS';
SET QUERY_ID_6 = 6;
SET indicator_6 = 0;
SET cursor_cnt_6 = 0;
BEGIN
DECLARE cursor_6 CURSOR FOR SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_, orderimpl0_.CREATED_BY AS CREATED_2_93_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_, orderimpl0_.NAME AS NAME7_93_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_ FROM BLC_ORDER orderimpl0_ WHERE orderimpl0_.CUSTOMER_ID = q7_i1 AND orderimpl0_.ORDER_STATUS = q7_i2 AND (orderimpl0_.NAME IS NULL) ORDER BY orderimpl0_.ORDER_ID DESC;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_6 = 1;
OPEN cursor_6;
loop_6: LOOP
IF cursor_cnt_6=0 THEN
FETCH cursor_6 INTO q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_, q19_res1_col_orderimpl0___created_by__CREATED_2_93_, q19_res1_col_orderimpl0___date_created__DATE_CRE3_93_, q19_res1_col_orderimpl0___date_updated__DATE_UPD4_93_, q19_res1_col_orderimpl0___updated_by__UPDATED_5_93_, q19_res1_col_orderimpl0___currency_code__CURRENC17_93_, q19_res1_col_orderimpl0___customer_id__CUSTOME18_93_, q19_res1_col_orderimpl0___email_address__EMAIL_AD6_93_, q19_res1_col_orderimpl0___locale_code__LOCALE_19_93_, q19_res1_col_orderimpl0___name__NAME7_93_, q19_res1_col_orderimpl0___order_number__ORDER_NU8_93_, q19_res1_col_orderimpl0___is_preview__IS_PREVI9_93_, q19_res1_col_orderimpl0___order_status__ORDER_S10_93_, q19_res1_col_orderimpl0___order_subtotal__ORDER_S11_93_, q19_res1_col_orderimpl0___submit_date__SUBMIT_12_93_, q19_res1_col_orderimpl0___tax_override__TAX_OVE13_93_, q19_res1_col_orderimpl0___order_total__ORDER_T14_93_, q19_res1_col_orderimpl0___total_shipping__TOTAL_S15_93_, q19_res1_col_orderimpl0___total_tax__TOTAL_T16_93_;
END IF;
IF cursor_cnt_6>=1 THEN
CLOSE cursor_6; LEAVE loop_6;END IF;
IF indicator_6=1 THEN CLOSE cursor_6; LEAVE loop_6; END IF;
SET cursor_cnt_6 = cursor_cnt_6 + 1;
END LOOP loop_6;
END;
SELECT cursor_cnt_6,q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_,q19_res1_col_orderimpl0___created_by__CREATED_2_93_,q19_res1_col_orderimpl0___date_created__DATE_CRE3_93_,q19_res1_col_orderimpl0___date_updated__DATE_UPD4_93_,q19_res1_col_orderimpl0___updated_by__UPDATED_5_93_,q19_res1_col_orderimpl0___currency_code__CURRENC17_93_,q19_res1_col_orderimpl0___customer_id__CUSTOME18_93_,q19_res1_col_orderimpl0___email_address__EMAIL_AD6_93_,q19_res1_col_orderimpl0___locale_code__LOCALE_19_93_,q19_res1_col_orderimpl0___name__NAME7_93_,q19_res1_col_orderimpl0___order_number__ORDER_NU8_93_,q19_res1_col_orderimpl0___is_preview__IS_PREVI9_93_,q19_res1_col_orderimpl0___order_status__ORDER_S10_93_,q19_res1_col_orderimpl0___order_subtotal__ORDER_S11_93_,q19_res1_col_orderimpl0___submit_date__SUBMIT_12_93_,q19_res1_col_orderimpl0___tax_override__TAX_OVE13_93_,q19_res1_col_orderimpl0___order_total__ORDER_T14_93_,q19_res1_col_orderimpl0___total_shipping__TOTAL_S15_93_,q19_res1_col_orderimpl0___total_tax__TOTAL_T16_93_;
SET q19_select_ret_num = cursor_cnt_6;
SET q8_i1 = 'geolocation.api.enabled';
SET QUERY_ID_7 = 7;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q8_i1;
SET q20_select_ret_num = FOUND_ROWS();
SET q9_i1 = 'geolocation.api.enabled';
SET QUERY_ID_8 = 8;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q9_i1;
SET q21_select_ret_num = FOUND_ROWS();
SET q10_i1 = 'i18n.translation.enabled';
SET QUERY_ID_9 = 9;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q10_i1;
SET q22_select_ret_num = FOUND_ROWS();
SET q11_i1 = 'i18n.translation.enabled';
SET QUERY_ID_10 = 10;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q11_i1;
SET q23_select_ret_num = FOUND_ROWS();
SET q12_i1 = 'i18n.translation.enabled';
SET QUERY_ID_11 = 11;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q12_i1;
SET q24_select_ret_num = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,QUERY_ID_3,QUERY_ID_4,q5_i1,QUERY_ID_5,QUERY_ID_6,q7_i1,q7_i2,QUERY_ID_7,q8_i1,QUERY_ID_8,q9_i1,QUERY_ID_9,q10_i1,QUERY_ID_10,q11_i1,QUERY_ID_11,q12_i1;

END $$
DELIMITER ;