DROP PROCEDURE IF EXISTS `Add_sp_2_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_2_ver0 (IN M_L_String__req_uri VARCHAR(512), IN RS_q8_r1_col1 INT)
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE q2_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE M_I_RS_13_size INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_14_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE M_I_RS_15_size INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;
DECLARE q5_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_4 INT DEFAULT NULL;
DECLARE M_I_RS_16_size INT DEFAULT NULL;
DECLARE cursor_cnt_4 INT DEFAULT NULL;
DECLARE QUERY_ID_5 INT DEFAULT NULL;
DECLARE M_I_RS_17_size INT DEFAULT NULL;
DECLARE cursor_cnt_5 INT DEFAULT NULL;
DECLARE q7_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_6 INT DEFAULT NULL;
DECLARE M_I_RS_18_size INT DEFAULT NULL;
DECLARE cursor_cnt_6 INT DEFAULT NULL;
DECLARE q8_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_7 INT DEFAULT NULL;
DECLARE M_I_RS_19_size INT DEFAULT NULL;
DECLARE cursor_cnt_7 INT DEFAULT NULL;
DECLARE q9_i1 BIGINT DEFAULT NULL;
DECLARE q9_i2 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_8 INT DEFAULT NULL;
DECLARE RS_q20_r1_col1 BIGINT DEFAULT NULL;
DECLARE RS_q20_r1_col2 BIGINT DEFAULT NULL;
DECLARE RS_q20_r1_col3 DATETIME DEFAULT NULL;
DECLARE RS_q20_r1_col4 DATETIME DEFAULT NULL;
DECLARE RS_q20_r1_col5 BIGINT DEFAULT NULL;
DECLARE RS_q20_r1_col6 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col7 BIGINT DEFAULT NULL;
DECLARE RS_q20_r1_col8 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col9 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col10 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col11 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col12 BIT(1) DEFAULT NULL;
DECLARE RS_q20_r1_col13 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col14 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col15 DATETIME DEFAULT NULL;
DECLARE RS_q20_r1_col16 BIT(1) DEFAULT NULL;
DECLARE RS_q20_r1_col17 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col18 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q20_r1_col19 VARCHAR(512) DEFAULT NULL;
DECLARE M_I_RS_20_size INT DEFAULT NULL;
DECLARE cursor_cnt_8 INT DEFAULT NULL;
DECLARE cursor_8 int DEFAULT NULL;
DECLARE indicator_8 int DEFAULT NULL;
DECLARE q10_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_9 INT DEFAULT NULL;
DECLARE M_I_RS_21_size INT DEFAULT NULL;
DECLARE cursor_cnt_9 INT DEFAULT NULL;
DECLARE q11_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_10 INT DEFAULT NULL;
DECLARE M_I_RS_22_size INT DEFAULT NULL;
DECLARE cursor_cnt_10 INT DEFAULT NULL;
DECLARE QUERY_ID_11_TXN INT DEFAULT NULL;
DECLARE q13_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_12 INT DEFAULT NULL;
DECLARE M_I_RS_24_size INT DEFAULT NULL;
DECLARE cursor_cnt_12 INT DEFAULT NULL;
DECLARE q14_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_13 INT DEFAULT NULL;
DECLARE M_I_RS_25_size INT DEFAULT NULL;
DECLARE cursor_cnt_13 INT DEFAULT NULL;
DECLARE q15_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_14 INT DEFAULT NULL;
DECLARE M_I_RS_26_size INT DEFAULT NULL;
DECLARE cursor_cnt_14 INT DEFAULT NULL;
DECLARE q16_i1 BIGINT DEFAULT NULL;
DECLARE q16_i2 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_15 INT DEFAULT NULL;
DECLARE M_I_RS_27_size INT DEFAULT NULL;
DECLARE cursor_cnt_15 INT DEFAULT NULL;

IF TRUE THEN
commit;
END IF;
IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF TRUE THEN
SET q2_i1 = 'en-US';
SET QUERY_ID_1 = 1;
SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q2_i1;
SET M_I_RS_13_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q3_i1 = 'en_US';
SET QUERY_ID_2 = 2;
SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q3_i1;
SET M_I_RS_14_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET QUERY_ID_3 = 3;
SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1;
SET M_I_RS_15_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q5_i1 = M_L_String__req_uri;
SET QUERY_ID_4 = 4;
SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_ WHERE urlhandler0_.INCOMING_URL = q5_i1;
SET M_I_RS_16_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET QUERY_ID_5 = 5;
SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_;
SET M_I_RS_17_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q7_i1 = 'geolocation.api.enabled';
SET QUERY_ID_6 = 6;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q7_i1;
SET M_I_RS_18_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q8_i1 = 'geolocation.api.enabled';
SET QUERY_ID_7 = 7;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q8_i1;
SET M_I_RS_19_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q9_i1 = RS_q8_r1_col1;
SET q9_i2 = 'IN_PROCESS';
SET QUERY_ID_8 = 8;
SET indicator_8 = 0;
SET cursor_cnt_8 = 0;
BEGIN
DECLARE cursor_8 CURSOR FOR SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_, orderimpl0_.CREATED_BY AS CREATED_2_93_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_, orderimpl0_.NAME AS NAME7_93_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_ FROM BLC_ORDER orderimpl0_ WHERE orderimpl0_.CUSTOMER_ID = q9_i1 AND orderimpl0_.ORDER_STATUS = q9_i2 AND orderimpl0_.NAME IS NULL ORDER BY orderimpl0_.ORDER_ID DESC;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_8 = 1;
OPEN cursor_8;
loop_8: LOOP
IF cursor_cnt_8=0 THEN
FETCH cursor_8 INTO RS_q20_r1_col1, RS_q20_r1_col2, RS_q20_r1_col3, RS_q20_r1_col4, RS_q20_r1_col5, RS_q20_r1_col6, RS_q20_r1_col7, RS_q20_r1_col8, RS_q20_r1_col9, RS_q20_r1_col10, RS_q20_r1_col11, RS_q20_r1_col12, RS_q20_r1_col13, RS_q20_r1_col14, RS_q20_r1_col15, RS_q20_r1_col16, RS_q20_r1_col17, RS_q20_r1_col18, RS_q20_r1_col19;
END IF;
IF cursor_cnt_8>=1 THEN
CLOSE cursor_8; LEAVE loop_8;END IF;
IF indicator_8=1 THEN CLOSE cursor_8; LEAVE loop_8; END IF;
SET cursor_cnt_8 = cursor_cnt_8 + 1;
END LOOP loop_8;
END;
SET cursor_cnt_8 = FOUND_ROWS();
SELECT cursor_cnt_8,RS_q20_r1_col1,RS_q20_r1_col2,RS_q20_r1_col3,RS_q20_r1_col4,RS_q20_r1_col5,RS_q20_r1_col6,RS_q20_r1_col7,RS_q20_r1_col8,RS_q20_r1_col9,RS_q20_r1_col10,RS_q20_r1_col11,RS_q20_r1_col12,RS_q20_r1_col13,RS_q20_r1_col14,RS_q20_r1_col15,RS_q20_r1_col16,RS_q20_r1_col17,RS_q20_r1_col18,RS_q20_r1_col19;
SET M_I_RS_20_size = cursor_cnt_8;
END IF;
IF TRUE THEN
SET q10_i1 = 'order.lock.errorInsteadOfQueue';
SET QUERY_ID_9 = 9;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q10_i1;
SET M_I_RS_21_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q11_i1 = 'order.lock.errorInsteadOfQueue';
SET QUERY_ID_10 = 10;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q11_i1;
SET M_I_RS_22_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET QUERY_ID_11_TXN = 11;
set autocommit=0;
END IF;
IF TRUE THEN
SET q13_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_12 = 12;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q13_i1;
SET M_I_RS_24_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q14_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_13 = 13;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q14_i1;
SET M_I_RS_25_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q15_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_14 = 14;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q15_i1;
SET M_I_RS_26_size = FOUND_ROWS();
END IF;
IF TRUE THEN
IF cursor_cnt_8 > 0 THEN
SET q16_i1 = RS_q20_r1_col1;
SET q16_i2 = '00000000-0000-0000-0000-000000000000';
SET QUERY_ID_15 = 15;
SELECT count(*) AS col_0_0_ FROM BLC_ORDER_LOCK orderlocki0_ WHERE orderlocki0_.ORDER_ID = q16_i1 AND orderlocki0_.LOCK_KEY = q16_i2;
SET M_I_RS_27_size = FOUND_ROWS();
END IF;
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,QUERY_ID_3,QUERY_ID_4,q5_i1,QUERY_ID_5,QUERY_ID_6,q7_i1,QUERY_ID_7,q8_i1,QUERY_ID_8,q9_i1,q9_i2,QUERY_ID_9,q10_i1,QUERY_ID_10,q11_i1,QUERY_ID_11_TXN,QUERY_ID_12,q13_i1,QUERY_ID_13,q14_i1,QUERY_ID_14,q15_i1,QUERY_ID_15,q16_i1,q16_i2;

END $$
DELIMITER ;