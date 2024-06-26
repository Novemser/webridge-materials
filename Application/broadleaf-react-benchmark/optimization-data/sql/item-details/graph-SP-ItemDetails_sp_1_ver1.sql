DROP PROCEDURE IF EXISTS `ItemDetails_sp_1_ver1`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_1_ver1 (IN M_L_String__user_name VARCHAR(512))
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_1_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE RS_q2_r1_col1 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q2_r1_col2 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q2_r1_col3 BIT(1) DEFAULT NULL;
DECLARE RS_q2_r1_col4 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q2_r1_col5 BIT(1) DEFAULT NULL;
DECLARE M_I_RS_2_size INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE cursor_1 int DEFAULT NULL;
DECLARE indicator_1 int DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_3_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE M_I_RS_4_size INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;
DECLARE q5_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_4 INT DEFAULT NULL;
DECLARE M_I_RS_5_size INT DEFAULT NULL;
DECLARE cursor_cnt_4 INT DEFAULT NULL;
DECLARE q6_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_5 INT DEFAULT NULL;
DECLARE M_I_RS_6_size INT DEFAULT NULL;
DECLARE cursor_cnt_5 INT DEFAULT NULL;
DECLARE q7_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_6 INT DEFAULT NULL;
DECLARE M_I_RS_7_size INT DEFAULT NULL;
DECLARE cursor_cnt_6 INT DEFAULT NULL;
DECLARE q8_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_7 INT DEFAULT NULL;
DECLARE RS_q8_r1_col1 BIGINT DEFAULT NULL;
DECLARE RS_q8_r1_col2 BIGINT DEFAULT NULL;
DECLARE RS_q8_r1_col3 DATETIME DEFAULT NULL;
DECLARE RS_q8_r1_col4 DATETIME DEFAULT NULL;
DECLARE RS_q8_r1_col5 BIGINT DEFAULT NULL;
DECLARE RS_q8_r1_col6 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col7 BIGINT DEFAULT NULL;
DECLARE RS_q8_r1_col8 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col9 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col10 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col11 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col12 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col13 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col14 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col15 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col16 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col17 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col18 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col19 BIT(1) DEFAULT NULL;
DECLARE RS_q8_r1_col20 VARCHAR(512) DEFAULT NULL;
DECLARE RS_q8_r1_col21 VARCHAR(512) DEFAULT NULL;
DECLARE M_I_RS_8_size INT DEFAULT NULL;
DECLARE cursor_cnt_7 INT DEFAULT NULL;
DECLARE cursor_7 int DEFAULT NULL;
DECLARE indicator_7 int DEFAULT NULL;
DECLARE QUERY_ID_8_TXN INT DEFAULT NULL;
DECLARE q10_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_9 INT DEFAULT NULL;
DECLARE M_I_RS_10_size INT DEFAULT NULL;
DECLARE cursor_cnt_9 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = 'en-US';
SET QUERY_ID_0 = 0;
SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q1_i1;
SET M_I_RS_1_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q2_i1 = 'en_US';
SET QUERY_ID_1 = 1;
SET indicator_1 = 0;
SET cursor_cnt_1 = 0;
BEGIN
DECLARE cursor_1 CURSOR FOR SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q2_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_1 = 1;
OPEN cursor_1;
loop_1: LOOP
IF cursor_cnt_1=0 THEN
FETCH cursor_1 INTO RS_q2_r1_col1, RS_q2_r1_col2, RS_q2_r1_col3, RS_q2_r1_col4, RS_q2_r1_col5;
END IF;
IF cursor_cnt_1>=1 THEN
CLOSE cursor_1; LEAVE loop_1;END IF;
IF indicator_1=1 THEN CLOSE cursor_1; LEAVE loop_1; END IF;
SET cursor_cnt_1 = cursor_cnt_1 + 1;
END LOOP loop_1;
END;
SET cursor_cnt_1 = FOUND_ROWS();
SELECT cursor_cnt_1,RS_q2_r1_col1,RS_q2_r1_col2,RS_q2_r1_col3,RS_q2_r1_col4,RS_q2_r1_col5;
SET M_I_RS_2_size = cursor_cnt_1;
END IF;
IF TRUE THEN
IF cursor_cnt_1 > 0 THEN
SET q3_i1 = RS_q2_r1_col2;
SET QUERY_ID_2 = 2;
SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_0_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.CURRENCY_CODE = q3_i1;
SET M_I_RS_3_size = FOUND_ROWS();
END IF;
END IF;
IF TRUE THEN
SET QUERY_ID_3 = 3;
SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1;
SET M_I_RS_4_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q5_i1 = 'NONE_PROVIDED';
SET QUERY_ID_4 = 4;
SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = q5_i1;
SET M_I_RS_5_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q6_i1 = 'blc.auth.jwt.access.secret';
SET QUERY_ID_5 = 5;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q6_i1;
SET M_I_RS_6_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q7_i1 = 'blc.auth.jwt.access.secret';
SET QUERY_ID_6 = 6;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q7_i1;
SET M_I_RS_7_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q8_i1 = M_L_String__user_name;
SET QUERY_ID_7 = 7;
SET indicator_7 = 0;
SET cursor_cnt_7 = 0;
BEGIN
DECLARE cursor_7 CURSOR FOR SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = q8_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_7 = 1;
OPEN cursor_7;
loop_7: LOOP
IF cursor_cnt_7=0 THEN
FETCH cursor_7 INTO RS_q8_r1_col1, RS_q8_r1_col2, RS_q8_r1_col3, RS_q8_r1_col4, RS_q8_r1_col5, RS_q8_r1_col6, RS_q8_r1_col7, RS_q8_r1_col8, RS_q8_r1_col9, RS_q8_r1_col10, RS_q8_r1_col11, RS_q8_r1_col12, RS_q8_r1_col13, RS_q8_r1_col14, RS_q8_r1_col15, RS_q8_r1_col16, RS_q8_r1_col17, RS_q8_r1_col18, RS_q8_r1_col19, RS_q8_r1_col20, RS_q8_r1_col21;
END IF;
IF cursor_cnt_7>=1 THEN
CLOSE cursor_7; LEAVE loop_7;END IF;
IF indicator_7=1 THEN CLOSE cursor_7; LEAVE loop_7; END IF;
SET cursor_cnt_7 = cursor_cnt_7 + 1;
END LOOP loop_7;
END;
SET cursor_cnt_7 = FOUND_ROWS();
SELECT cursor_cnt_7,RS_q8_r1_col1,RS_q8_r1_col2,RS_q8_r1_col3,RS_q8_r1_col4,RS_q8_r1_col5,RS_q8_r1_col6,RS_q8_r1_col7,RS_q8_r1_col8,RS_q8_r1_col9,RS_q8_r1_col10,RS_q8_r1_col11,RS_q8_r1_col12,RS_q8_r1_col13,RS_q8_r1_col14,RS_q8_r1_col15,RS_q8_r1_col16,RS_q8_r1_col17,RS_q8_r1_col18,RS_q8_r1_col19,RS_q8_r1_col20,RS_q8_r1_col21;
SET M_I_RS_8_size = cursor_cnt_7;
END IF;
IF TRUE THEN
SET QUERY_ID_8_TXN = 8;
set autocommit=0;
END IF;
IF TRUE THEN
IF cursor_cnt_7 > 0 THEN
SET q10_i1 = RS_q8_r1_col1;
SET QUERY_ID_9 = 9;
SELECT customerro0_.CUSTOMER_ROLE_ID AS CUSTOMER1_48_, customerro0_.CUSTOMER_ID AS CUSTOMER2_48_, customerro0_.ROLE_ID AS ROLE_ID3_48_ FROM BLC_CUSTOMER_ROLE customerro0_ WHERE customerro0_.CUSTOMER_ID = q10_i1;
SET M_I_RS_10_size = FOUND_ROWS();
END IF;
END IF;
SELECT QUERY_ID_0,q1_i1,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,QUERY_ID_3,QUERY_ID_4,q5_i1,QUERY_ID_5,q6_i1,QUERY_ID_6,q7_i1,QUERY_ID_7,q8_i1,QUERY_ID_8_TXN,QUERY_ID_9,q10_i1;

END $$
DELIMITER ;