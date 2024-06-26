DROP PROCEDURE IF EXISTS `GetCart_sp_2`;
DELIMITER $$
CREATE PROCEDURE GetCart_sp_2 (IN REQUEST_PARAM_uri VARCHAR(255), IN REQUEST_HEADER_X_Locale VARCHAR(255), IN q8_res1_col_customerim0___customer_id__CUSTOMER1_40_ BIGINT)
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
DECLARE q13_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_12 INT DEFAULT NULL;
DECLARE q25_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_12 INT DEFAULT NULL;
DECLARE q14_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_13 INT DEFAULT NULL;
DECLARE q26_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_13 INT DEFAULT NULL;
DECLARE q15_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_14 INT DEFAULT NULL;
DECLARE q27_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_14 INT DEFAULT NULL;
DECLARE q16_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_15 INT DEFAULT NULL;
DECLARE q28_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_15 INT DEFAULT NULL;
DECLARE q17_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_16 INT DEFAULT NULL;
DECLARE q29_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_16 INT DEFAULT NULL;
DECLARE q18_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_17 INT DEFAULT NULL;
DECLARE q30_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_17 INT DEFAULT NULL;

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
IF cursor_cnt_6 > 0 THEN
SET q13_i1 = q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_;
SET QUERY_ID_12 = 12;
SELECT orderitems0_.ORDER_ID AS ORDER_I20_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_1_, orderitems0_.CREATED_BY AS CREATED_2_96_1_, orderitems0_.DATE_CREATED AS DATE_CRE3_96_1_ , orderitems0_.DATE_UPDATED AS DATE_UPD4_96_1_, orderitems0_.UPDATED_BY AS UPDATED_5_96_1_, orderitems0_.CATEGORY_ID AS CATEGOR18_96_1_, orderitems0_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_1_, orderitems0_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_1_ , orderitems0_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_1_, orderitems0_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_1_, orderitems0_.NAME AS NAME9_96_1_, orderitems0_.ORDER_ID AS ORDER_I20_96_1_, orderitems0_.ORDER_ITEM_TYPE AS ORDER_I10_96_1_ , orderitems0_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_1_, orderitems0_.PERSONAL_MESSAGE_ID AS PERSONA22_96_1_, orderitems0_.PRICE AS PRICE11_96_1_, orderitems0_.QUANTITY AS QUANTIT12_96_1_, orderitems0_.RETAIL_PRICE AS RETAIL_13_96_1_ , orderitems0_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_1_, orderitems0_.SALE_PRICE AS SALE_PR15_96_1_, orderitems0_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_1_, orderitems0_.TOTAL_TAX AS TOTAL_T17_96_1_, orderitems0_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_1_ , orderitems0_1_.BASE_SALE_PRICE AS BASE_SAL2_18_1_, orderitems0_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_1_, orderitems0_1_.SKU_ID AS SKU_ID5_18_1_, orderitems0_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_1_, orderitems0_2_.BASE_SALE_PRICE AS BASE_SAL2_52_1_ , orderitems0_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_1_, orderitems0_2_.PRODUCT_ID AS PRODUCT_5_52_1_, orderitems0_2_.SKU_ID AS SKU_ID6_52_1_, orderitems0_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_1_ , CASE  WHEN orderitems0_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitems0_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitems0_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitems0_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitems0_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_1_, orderitemi1_.ORDER_ITEM_ID AS ORDER_IT1_96_2_, orderitemi1_.CREATED_BY AS CREATED_2_96_2_, orderitemi1_.DATE_CREATED AS DATE_CRE3_96_2_, orderitemi1_.DATE_UPDATED AS DATE_UPD4_96_2_ , orderitemi1_.UPDATED_BY AS UPDATED_5_96_2_, orderitemi1_.CATEGORY_ID AS CATEGOR18_96_2_, orderitemi1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_2_, orderitemi1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_2_, orderitemi1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_2_ , orderitemi1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_2_, orderitemi1_.NAME AS NAME9_96_2_, orderitemi1_.ORDER_ID AS ORDER_I20_96_2_, orderitemi1_.ORDER_ITEM_TYPE AS ORDER_I10_96_2_, orderitemi1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_2_ , orderitemi1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_2_, orderitemi1_.PRICE AS PRICE11_96_2_, orderitemi1_.QUANTITY AS QUANTIT12_96_2_, orderitemi1_.RETAIL_PRICE AS RETAIL_13_96_2_, orderitemi1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_2_ , orderitemi1_.SALE_PRICE AS SALE_PR15_96_2_, orderitemi1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_2_, orderitemi1_.TOTAL_TAX AS TOTAL_T17_96_2_, orderitemi1_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_2_, orderitemi1_1_.BASE_SALE_PRICE AS BASE_SAL2_18_2_ , orderitemi1_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_2_, orderitemi1_1_.SKU_ID AS SKU_ID5_18_2_, orderitemi1_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_2_, orderitemi1_2_.BASE_SALE_PRICE AS BASE_SAL2_52_2_, orderitemi1_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_2_ , orderitemi1_2_.PRODUCT_ID AS PRODUCT_5_52_2_, orderitemi1_2_.SKU_ID AS SKU_ID6_52_2_, orderitemi1_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_2_ , CASE  WHEN orderitemi1_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitemi1_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitemi1_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitemi1_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitemi1_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_2_, personalme2_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_3_, personalme2_.MESSAGE AS MESSAGE2_116_3_, personalme2_.MESSAGE_FROM AS MESSAGE_3_116_3_, personalme2_.MESSAGE_TO AS MESSAGE_4_116_3_ , personalme2_.OCCASION AS OCCASION5_116_3_, bundleorde3_.ORDER_ITEM_ID AS ORDER_IT1_96_4_, bundleorde3_1_.CREATED_BY AS CREATED_2_96_4_, bundleorde3_1_.DATE_CREATED AS DATE_CRE3_96_4_, bundleorde3_1_.DATE_UPDATED AS DATE_UPD4_96_4_ , bundleorde3_1_.UPDATED_BY AS UPDATED_5_96_4_, bundleorde3_1_.CATEGORY_ID AS CATEGOR18_96_4_, bundleorde3_1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_4_, bundleorde3_1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_4_, bundleorde3_1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_4_ , bundleorde3_1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_4_, bundleorde3_1_.NAME AS NAME9_96_4_, bundleorde3_1_.ORDER_ID AS ORDER_I20_96_4_, bundleorde3_1_.ORDER_ITEM_TYPE AS ORDER_I10_96_4_, bundleorde3_1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_4_ , bundleorde3_1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_4_, bundleorde3_1_.PRICE AS PRICE11_96_4_, bundleorde3_1_.QUANTITY AS QUANTIT12_96_4_, bundleorde3_1_.RETAIL_PRICE AS RETAIL_13_96_4_, bundleorde3_1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_4_ , bundleorde3_1_.SALE_PRICE AS SALE_PR15_96_4_, bundleorde3_1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_4_, bundleorde3_1_.TOTAL_TAX AS TOTAL_T17_96_4_, bundleorde3_.BASE_RETAIL_PRICE AS BASE_RET1_18_4_, bundleorde3_.BASE_SALE_PRICE AS BASE_SAL2_18_4_ , bundleorde3_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_4_, bundleorde3_.SKU_ID AS SKU_ID5_18_4_, skubundlei4_.SKU_BUNDLE_ITEM_ID AS SKU_BUND1_163_5_, skubundlei4_.PRODUCT_BUNDLE_ID AS PRODUCT_5_163_5_, skubundlei4_.ITEM_SALE_PRICE AS ITEM_SAL2_163_5_ , skubundlei4_.QUANTITY AS QUANTITY3_163_5_, skubundlei4_.SEQUENCE AS SEQUENCE4_163_5_, skubundlei4_.SKU_ID AS SKU_ID6_163_5_ FROM BLC_ORDER_ITEM orderitems0_ LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitems0_1_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitems0_2_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitems0_3_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitems0_4_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_4_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM orderitemi1_ ON orderitems0_.PARENT_ORDER_ITEM_ID = orderitemi1_.ORDER_ITEM_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitemi1_1_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitemi1_2_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitemi1_3_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitemi1_4_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_4_.ORDER_ITEM_ID LEFT JOIN BLC_PERSONAL_MESSAGE personalme2_ ON orderitemi1_.PERSONAL_MESSAGE_ID = personalme2_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM bundleorde3_ ON orderitemi1_2_.BUNDLE_ORDER_ITEM_ID = bundleorde3_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM bundleorde3_1_ ON bundleorde3_.ORDER_ITEM_ID = bundleorde3_1_.ORDER_ITEM_ID LEFT JOIN BLC_SKU_BUNDLE_ITEM skubundlei4_ ON orderitemi1_2_.SKU_BUNDLE_ITEM_ID = skubundlei4_.SKU_BUNDLE_ITEM_ID WHERE orderitems0_.ORDER_ID = q13_i1;
SET q25_select_ret_num = FOUND_ROWS();
END IF;
IF cursor_cnt_6 > 0 THEN
SET q14_i1 = q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_;
SET QUERY_ID_13 = 13;
SELECT fulfillmen0_.ORDER_ID AS ORDER_I23_66_0_, fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM1_66_0_, fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM1_66_1_, fulfillmen0_.ADDRESS_ID AS ADDRESS21_66_1_, fulfillmen0_.DELIVERY_INSTRUCTION AS DELIVERY2_66_1_ , fulfillmen0_.FULFILLMENT_OPTION_ID AS FULFILL22_66_1_, fulfillmen0_.PRICE AS PRICE3_66_1_, fulfillmen0_.SHIPPING_PRICE_TAXABLE AS SHIPPING4_66_1_, fulfillmen0_.MERCHANDISE_TOTAL AS MERCHAND5_66_1_, fulfillmen0_.METHOD AS METHOD6_66_1_ , fulfillmen0_.ORDER_ID AS ORDER_I23_66_1_, fulfillmen0_.PERSONAL_MESSAGE_ID AS PERSONA24_66_1_, fulfillmen0_.PHONE_ID AS PHONE_I25_66_1_, fulfillmen0_.IS_PRIMARY AS IS_PRIMA7_66_1_, fulfillmen0_.REFERENCE_NUMBER AS REFERENC8_66_1_ , fulfillmen0_.RETAIL_PRICE AS RETAIL_P9_66_1_, fulfillmen0_.SALE_PRICE AS SALE_PR10_66_1_, fulfillmen0_.FULFILLMENT_GROUP_SEQUNCE AS FULFILL11_66_1_, fulfillmen0_.SERVICE AS SERVICE12_66_1_, fulfillmen0_.SHIPPING_OVERRIDE AS SHIPPIN13_66_1_ , fulfillmen0_.STATUS AS STATUS14_66_1_, fulfillmen0_.TOTAL AS TOTAL15_66_1_, fulfillmen0_.TOTAL_FEE_TAX AS TOTAL_F16_66_1_, fulfillmen0_.TOTAL_FG_TAX AS TOTAL_F17_66_1_, fulfillmen0_.TOTAL_ITEM_TAX AS TOTAL_I18_66_1_ , fulfillmen0_.TOTAL_TAX AS TOTAL_T19_66_1_, fulfillmen0_.TYPE AS TYPE20_66_1_, addressimp1_.ADDRESS_ID AS ADDRESS_1_1_2_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_2_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_2_ , addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_2_, addressimp1_.CITY AS CITY5_1_2_, addressimp1_.COMPANY_NAME AS COMPANY_6_1_2_, addressimp1_.COUNTRY AS COUNTRY27_1_2_, addressimp1_.COUNTY AS COUNTY7_1_2_ , addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_2_, addressimp1_.FAX AS FAX9_1_2_, addressimp1_.FIRST_NAME AS FIRST_N10_1_2_, addressimp1_.FULL_NAME AS FULL_NA11_1_2_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_2_ , addressimp1_.IS_BUSINESS AS IS_BUSI13_1_2_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_2_, addressimp1_.IS_MAILING AS IS_MAIL15_1_2_, addressimp1_.IS_STREET AS IS_STRE16_1_2_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_2_ , addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_2_, addressimp1_.LAST_NAME AS LAST_NA18_1_2_, addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_2_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_2_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_2_ , addressimp1_.POSTAL_CODE AS POSTAL_19_1_2_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_2_, addressimp1_.SECONDARY_PHONE AS SECONDA21_1_2_, addressimp1_.STANDARDIZED AS STANDAR22_1_2_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_2_ , addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_2_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_2_, addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_2_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_2_, countryimp2_.ABBREVIATION AS ABBREVIA1_35_3_ , countryimp2_.NAME AS NAME2_35_3_, isocountry3_.ALPHA_2 AS ALPHA_1_80_4_, isocountry3_.ALPHA_3 AS ALPHA_2_80_4_, isocountry3_.NAME AS NAME3_80_4_, isocountry3_.NUMERIC_CODE AS NUMERIC_4_80_4_ , isocountry3_.STATUS AS STATUS5_80_4_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_5_, phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_5_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_5_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_5_ , phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_5_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_5_, phoneimpl5_.PHONE_ID AS PHONE_ID1_118_6_, phoneimpl5_.COUNTRY_CODE AS COUNTRY_2_118_6_, phoneimpl5_.EXTENSION AS EXTENSIO3_118_6_ , phoneimpl5_.IS_ACTIVE AS IS_ACTIV4_118_6_, phoneimpl5_.IS_DEFAULT AS IS_DEFAU5_118_6_, phoneimpl5_.PHONE_NUMBER AS PHONE_NU6_118_6_, phoneimpl6_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl6_.COUNTRY_CODE AS COUNTRY_2_118_7_ , phoneimpl6_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl6_.IS_ACTIVE AS IS_ACTIV4_118_7_, phoneimpl6_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl6_.PHONE_NUMBER AS PHONE_NU6_118_7_, stateimpl7_.ABBREVIATION AS ABBREVIA1_170_8_ , stateimpl7_.COUNTRY AS COUNTRY3_170_8_, stateimpl7_.NAME AS NAME2_170_8_, fulfillmen8_.FULFILLMENT_OPTION_ID AS FULFILLM1_71_9_, fulfillmen8_.FULFILLMENT_TYPE AS FULFILLM2_71_9_, fulfillmen8_.LONG_DESCRIPTION AS LONG_DES3_71_9_ , fulfillmen8_.NAME AS NAME4_71_9_, fulfillmen8_.TAX_CODE AS TAX_CODE5_71_9_, fulfillmen8_.TAXABLE AS TAXABLE6_71_9_, fulfillmen8_.USE_FLAT_RATES AS USE_FLAT7_71_9_, fulfillmen8_1_.CURRENCY_CODE AS CURRENCY3_72_9_ , fulfillmen8_1_.PRICE AS PRICE1_72_9_ , CASE  WHEN fulfillmen8_1_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 1 WHEN fulfillmen8_2_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 2 WHEN fulfillmen8_3_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 3 WHEN fulfillmen8_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 0 END AS clazz_9_, broadleafc9_.CURRENCY_CODE AS CURRENCY1_38_10_, broadleafc9_.DEFAULT_FLAG AS DEFAULT_2_38_10_, broadleafc9_.FRIENDLY_NAME AS FRIENDLY3_38_10_, personalme10_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_11_ , personalme10_.MESSAGE AS MESSAGE2_116_11_, personalme10_.MESSAGE_FROM AS MESSAGE_3_116_11_, personalme10_.MESSAGE_TO AS MESSAGE_4_116_11_, personalme10_.OCCASION AS OCCASION5_116_11_, phoneimpl11_.PHONE_ID AS PHONE_ID1_118_12_ , phoneimpl11_.COUNTRY_CODE AS COUNTRY_2_118_12_, phoneimpl11_.EXTENSION AS EXTENSIO3_118_12_, phoneimpl11_.IS_ACTIVE AS IS_ACTIV4_118_12_, phoneimpl11_.IS_DEFAULT AS IS_DEFAU5_118_12_, phoneimpl11_.PHONE_NUMBER AS PHONE_NU6_118_12_ FROM BLC_FULFILLMENT_GROUP fulfillmen0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON fulfillmen0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_COUNTRY countryimp2_ ON addressimp1_.COUNTRY = countryimp2_.ABBREVIATION LEFT JOIN BLC_ISO_COUNTRY isocountry3_ ON addressimp1_.ISO_COUNTRY_ALPHA2 = isocountry3_.ALPHA_2 LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_FAX_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl5_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl5_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl6_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl6_.PHONE_ID LEFT JOIN BLC_STATE stateimpl7_ ON addressimp1_.STATE_PROV_REGION = stateimpl7_.ABBREVIATION LEFT JOIN BLC_FULFILLMENT_OPTION fulfillmen8_ ON fulfillmen0_.FULFILLMENT_OPTION_ID = fulfillmen8_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPTION_FIXED fulfillmen8_1_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_1_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_PRC fulfillmen8_2_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_2_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_WGT fulfillmen8_3_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_3_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_CURRENCY broadleafc9_ ON fulfillmen8_1_.CURRENCY_CODE = broadleafc9_.CURRENCY_CODE LEFT JOIN BLC_PERSONAL_MESSAGE personalme10_ ON fulfillmen0_.PERSONAL_MESSAGE_ID = personalme10_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_PHONE phoneimpl11_ ON fulfillmen0_.PHONE_ID = phoneimpl11_.PHONE_ID WHERE fulfillmen0_.ORDER_ID = q14_i1;
SET q26_select_ret_num = FOUND_ROWS();
END IF;
IF cursor_cnt_6 > 0 THEN
SET q15_i1 = q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_;
SET QUERY_ID_14 = 14;
SELECT orderadjus0_.ORDER_ID AS ORDER_ID5_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_1_, orderadjus0_.OFFER_ID AS OFFER_ID4_94_1_, orderadjus0_.ORDER_ID AS ORDER_ID5_94_1_ , orderadjus0_.ADJUSTMENT_REASON AS ADJUSTME2_94_1_, orderadjus0_.ADJUSTMENT_VALUE AS ADJUSTME3_94_1_, offerimpl1_.OFFER_ID AS OFFER_ID1_85_2_, offerimpl1_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_2_, offerimpl1_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_2_ , offerimpl1_.ARCHIVED AS ARCHIVED4_85_2_, offerimpl1_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_2_, offerimpl1_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_2_, offerimpl1_.OFFER_DESCRIPTION AS OFFER_DE7_85_2_, offerimpl1_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_2_ , offerimpl1_.END_DATE AS END_DATE9_85_2_, offerimpl1_.MARKETING_MESSASGE AS MARKETI10_85_2_, offerimpl1_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_2_, offerimpl1_.MAX_USES AS MAX_USE12_85_2_, offerimpl1_.OFFER_NAME AS OFFER_N13_85_2_ , offerimpl1_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_2_, offerimpl1_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_2_, offerimpl1_.ORDER_MIN_TOTAL AS ORDER_M16_85_2_, offerimpl1_.OFFER_PRIORITY AS OFFER_P17_85_2_, offerimpl1_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_2_ , offerimpl1_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_2_, offerimpl1_.START_DATE AS START_D20_85_2_, offerimpl1_.TARGET_MIN_TOTAL AS TARGET_21_85_2_, offerimpl1_.TARGET_SYSTEM AS TARGET_22_85_2_, offerimpl1_.TOTALITARIAN_OFFER AS TOTALIT23_85_2_ , offerimpl1_.OFFER_TYPE AS OFFER_T24_85_2_, offerimpl1_.OFFER_VALUE AS OFFER_V25_85_2_ FROM BLC_ORDER_ADJUSTMENT orderadjus0_ INNER JOIN BLC_OFFER offerimpl1_ ON orderadjus0_.OFFER_ID = offerimpl1_.OFFER_ID WHERE orderadjus0_.ORDER_ID = q15_i1;
SET q27_select_ret_num = FOUND_ROWS();
END IF;
IF cursor_cnt_6 > 0 THEN
SET q16_i1 = q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_;
SET QUERY_ID_15 = 15;
SELECT payments0_.ORDER_ID AS ORDER_ID8_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_1_, payments0_.AMOUNT AS AMOUNT2_106_1_, payments0_.ARCHIVED AS ARCHIVED3_106_1_ , payments0_.ADDRESS_ID AS ADDRESS_7_106_1_, payments0_.GATEWAY_TYPE AS GATEWAY_4_106_1_, payments0_.ORDER_ID AS ORDER_ID8_106_1_, payments0_.REFERENCE_NUMBER AS REFERENC5_106_1_, payments0_.PAYMENT_TYPE AS PAYMENT_6_106_1_ , addressimp1_.ADDRESS_ID AS ADDRESS_1_1_2_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_2_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_2_, addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_2_, addressimp1_.CITY AS CITY5_1_2_ , addressimp1_.COMPANY_NAME AS COMPANY_6_1_2_, addressimp1_.COUNTRY AS COUNTRY27_1_2_, addressimp1_.COUNTY AS COUNTY7_1_2_, addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_2_, addressimp1_.FAX AS FAX9_1_2_ , addressimp1_.FIRST_NAME AS FIRST_N10_1_2_, addressimp1_.FULL_NAME AS FULL_NA11_1_2_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_2_, addressimp1_.IS_BUSINESS AS IS_BUSI13_1_2_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_2_ , addressimp1_.IS_MAILING AS IS_MAIL15_1_2_, addressimp1_.IS_STREET AS IS_STRE16_1_2_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_2_, addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_2_, addressimp1_.LAST_NAME AS LAST_NA18_1_2_ , addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_2_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_2_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_2_, addressimp1_.POSTAL_CODE AS POSTAL_19_1_2_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_2_ , addressimp1_.SECONDARY_PHONE AS SECONDA21_1_2_, addressimp1_.STANDARDIZED AS STANDAR22_1_2_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_2_, addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_2_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_2_ , addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_2_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_2_, countryimp2_.ABBREVIATION AS ABBREVIA1_35_3_, countryimp2_.NAME AS NAME2_35_3_, isocountry3_.ALPHA_2 AS ALPHA_1_80_4_ , isocountry3_.ALPHA_3 AS ALPHA_2_80_4_, isocountry3_.NAME AS NAME3_80_4_, isocountry3_.NUMERIC_CODE AS NUMERIC_4_80_4_, isocountry3_.STATUS AS STATUS5_80_4_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_5_ , phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_5_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_5_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_5_, phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_5_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_5_ , phoneimpl5_.PHONE_ID AS PHONE_ID1_118_6_, phoneimpl5_.COUNTRY_CODE AS COUNTRY_2_118_6_, phoneimpl5_.EXTENSION AS EXTENSIO3_118_6_, phoneimpl5_.IS_ACTIVE AS IS_ACTIV4_118_6_, phoneimpl5_.IS_DEFAULT AS IS_DEFAU5_118_6_ , phoneimpl5_.PHONE_NUMBER AS PHONE_NU6_118_6_, phoneimpl6_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl6_.COUNTRY_CODE AS COUNTRY_2_118_7_, phoneimpl6_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl6_.IS_ACTIVE AS IS_ACTIV4_118_7_ , phoneimpl6_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl6_.PHONE_NUMBER AS PHONE_NU6_118_7_, stateimpl7_.ABBREVIATION AS ABBREVIA1_170_8_, stateimpl7_.COUNTRY AS COUNTRY3_170_8_, stateimpl7_.NAME AS NAME2_170_8_ FROM BLC_ORDER_PAYMENT payments0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON payments0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_COUNTRY countryimp2_ ON addressimp1_.COUNTRY = countryimp2_.ABBREVIATION LEFT JOIN BLC_ISO_COUNTRY isocountry3_ ON addressimp1_.ISO_COUNTRY_ALPHA2 = isocountry3_.ALPHA_2 LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_FAX_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl5_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl5_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl6_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl6_.PHONE_ID LEFT JOIN BLC_STATE stateimpl7_ ON addressimp1_.STATE_PROV_REGION = stateimpl7_.ABBREVIATION WHERE payments0_.ORDER_ID = q16_i1;
SET q28_select_ret_num = FOUND_ROWS();
END IF;
IF cursor_cnt_6 > 0 THEN
SET q17_i1 = q19_res1_col_orderimpl0___order_id__ORDER_ID1_93_;
SET QUERY_ID_16 = 16;
SELECT orderattri0_.ORDER_ID AS ORDER_ID4_95_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_0_, orderattri0_.NAME AS formula4_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_1_, orderattri0_.NAME AS NAME2_95_1_ , orderattri0_.ORDER_ID AS ORDER_ID4_95_1_, orderattri0_.VALUE AS VALUE3_95_1_ FROM BLC_ORDER_ATTRIBUTE orderattri0_ WHERE orderattri0_.ORDER_ID = q17_i1;
SET q29_select_ret_num = FOUND_ROWS();
END IF;
SET q18_i1 = q8_res1_col_customerim0___customer_id__CUSTOMER1_40_;
SET QUERY_ID_17 = 17;
SELECT customerat0_.CUSTOMER_ID AS CUSTOMER4_42_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_1_, customerat0_.NAME AS formula9_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_0_, customerat0_.CUSTOMER_ID AS CUSTOMER4_42_0_ , customerat0_.NAME AS NAME2_42_0_, customerat0_.VALUE AS VALUE3_42_0_ FROM BLC_CUSTOMER_ATTRIBUTE customerat0_ WHERE customerat0_.CUSTOMER_ID = q18_i1;
SET q30_select_ret_num = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,QUERY_ID_3,QUERY_ID_4,q5_i1,QUERY_ID_5,QUERY_ID_6,q7_i1,q7_i2,QUERY_ID_7,q8_i1,QUERY_ID_8,q9_i1,QUERY_ID_9,q10_i1,QUERY_ID_10,q11_i1,QUERY_ID_11,q12_i1,QUERY_ID_12,q13_i1,QUERY_ID_13,q14_i1,QUERY_ID_14,q15_i1,QUERY_ID_15,q16_i1,QUERY_ID_16,q17_i1,QUERY_ID_17,q18_i1;

END $$
DELIMITER ;