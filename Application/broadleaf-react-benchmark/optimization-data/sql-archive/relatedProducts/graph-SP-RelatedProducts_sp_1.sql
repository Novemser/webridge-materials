DROP PROCEDURE IF EXISTS `RelatedProducts_sp_1`;
DELIMITER $$
CREATE PROCEDURE RelatedProducts_sp_1 (IN REQUEST_TOKEN__FIELD_username VARCHAR(255), IN REQUEST_HEADER_X_Locale VARCHAR(255))
BEGIN

DECLARE q1_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE q1_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE q2_res1_col_localeimpl0___locale_code__LOCALE_C1_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q2_res1_col_localeimpl0___currency_code__CURRENCY5_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q2_res1_col_localeimpl0___default_flag__DEFAULT_2_82_ BIT(1) DEFAULT NULL;
DECLARE q2_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_ VARCHAR(255) DEFAULT NULL;
DECLARE q2_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_ BIT(1) DEFAULT NULL;
DECLARE q2_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;
DECLARE cursor_1 int DEFAULT NULL;
DECLARE indicator_1 int DEFAULT NULL;
DECLARE q3_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE q3_res1_col_broadleafc0___currency_code__CURRENCY1_38_0_ VARCHAR(255) DEFAULT NULL;
DECLARE q3_res1_col_broadleafc0___default_flag__DEFAULT_2_38_0_ BIT(1) DEFAULT NULL;
DECLARE q3_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_0_ VARCHAR(255) DEFAULT NULL;
DECLARE q3_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE cursor_2 int DEFAULT NULL;
DECLARE indicator_2 int DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE q4_res1_col_broadleafc0___currency_code__CURRENCY1_38_ VARCHAR(255) DEFAULT NULL;
DECLARE q4_res1_col_broadleafc0___default_flag__DEFAULT_2_38_ BIT(1) DEFAULT NULL;
DECLARE q4_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_ VARCHAR(255) DEFAULT NULL;
DECLARE q4_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;
DECLARE cursor_3 int DEFAULT NULL;
DECLARE indicator_3 int DEFAULT NULL;
DECLARE q5_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_4 INT DEFAULT NULL;
DECLARE q5_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_4 INT DEFAULT NULL;
DECLARE q6_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_5 INT DEFAULT NULL;
DECLARE q6_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_5 INT DEFAULT NULL;
DECLARE q7_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_6 INT DEFAULT NULL;
DECLARE q7_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_6 INT DEFAULT NULL;
DECLARE q8_i1 VARCHAR(255) DEFAULT NULL;
DECLARE QUERY_ID_7 INT DEFAULT NULL;
DECLARE q8_res1_col_customerim0___customer_id__CUSTOMER1_40_ BIGINT DEFAULT NULL;
DECLARE q8_res1_col_customerim0___created_by__CREATED_2_40_ BIGINT DEFAULT NULL;
DECLARE q8_res1_col_customerim0___date_created__DATE_CRE3_40_ DATETIME DEFAULT NULL;
DECLARE q8_res1_col_customerim0___date_updated__DATE_UPD4_40_ DATETIME DEFAULT NULL;
DECLARE q8_res1_col_customerim0___updated_by__UPDATED_5_40_ BIGINT DEFAULT NULL;
DECLARE q8_res1_col_customerim0___challenge_answer__CHALLENG6_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___challenge_question_id__CHALLEN20_40_ BIGINT DEFAULT NULL;
DECLARE q8_res1_col_customerim0___locale_code__LOCALE_21_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___deactivated__DEACTIVA7_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___email_address__EMAIL_AD8_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___external_id__EXTERNAL9_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___first_name__FIRST_N10_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___is_tax_exempt__IS_TAX_11_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___last_name__LAST_NA12_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___password__PASSWOR13_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___password_change_required__PASSWOR14_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___is_preview__IS_PREV15_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___receive_email__RECEIVE16_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___is_registered__IS_REGI17_40_ BIT(1) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___tax_exemption_code__TAX_EXE18_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_res1_col_customerim0___user_name__USER_NA19_40_ VARCHAR(255) DEFAULT NULL;
DECLARE q8_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_7 INT DEFAULT NULL;
DECLARE cursor_7 int DEFAULT NULL;
DECLARE indicator_7 int DEFAULT NULL;
DECLARE QUERY_ID_8_TXN INT DEFAULT NULL;
DECLARE q10_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_9 INT DEFAULT NULL;
DECLARE q10_res1_col_customerro0___customer_role_id__CUSTOMER1_48_ BIGINT DEFAULT NULL;
DECLARE q10_res1_col_customerro0___customer_id__CUSTOMER2_48_ BIGINT DEFAULT NULL;
DECLARE q10_res1_col_customerro0___role_id__ROLE_ID3_48_ BIGINT DEFAULT NULL;
DECLARE q10_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_9 INT DEFAULT NULL;
DECLARE cursor_9 int DEFAULT NULL;
DECLARE indicator_9 int DEFAULT NULL;
DECLARE q11_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_10 INT DEFAULT NULL;
DECLARE q11_res1_col_roleimpl0___role_id__ROLE_ID1_137_0_ BIGINT DEFAULT NULL;
DECLARE q11_res1_col_roleimpl0___role_name__ROLE_NAM2_137_0_ VARCHAR(255) DEFAULT NULL;
DECLARE q11_select_ret_num INT DEFAULT NULL;
DECLARE cursor_cnt_10 INT DEFAULT NULL;
DECLARE cursor_10 int DEFAULT NULL;
DECLARE indicator_10 int DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = REQUEST_HEADER_X_Locale;
SET QUERY_ID_0 = 0;
SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q1_i1;
SET q1_select_ret_num = FOUND_ROWS();
SET q2_i1 = REPLACE(REQUEST_HEADER_X_Locale,'-','_');
SET QUERY_ID_1 = 1;
SET indicator_1 = 0;
SET cursor_cnt_1 = 0;
BEGIN
DECLARE cursor_1 CURSOR FOR SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = q2_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_1 = 1;
OPEN cursor_1;
loop_1: LOOP
IF cursor_cnt_1=0 THEN
FETCH cursor_1 INTO q2_res1_col_localeimpl0___locale_code__LOCALE_C1_82_, q2_res1_col_localeimpl0___currency_code__CURRENCY5_82_, q2_res1_col_localeimpl0___default_flag__DEFAULT_2_82_, q2_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_, q2_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_;
END IF;
IF cursor_cnt_1>=1 THEN
CLOSE cursor_1; LEAVE loop_1;END IF;
IF indicator_1=1 THEN CLOSE cursor_1; LEAVE loop_1; END IF;
SET cursor_cnt_1 = cursor_cnt_1 + 1;
END LOOP loop_1;
END;
SELECT cursor_cnt_1,q2_res1_col_localeimpl0___locale_code__LOCALE_C1_82_,q2_res1_col_localeimpl0___currency_code__CURRENCY5_82_,q2_res1_col_localeimpl0___default_flag__DEFAULT_2_82_,q2_res1_col_localeimpl0___friendly_name__FRIENDLY3_82_,q2_res1_col_localeimpl0___use_in_search_index__USE_IN_S4_82_;
SET q2_select_ret_num = cursor_cnt_1;
IF cursor_cnt_1 > 0 THEN
SET q3_i1 = q2_res1_col_localeimpl0___currency_code__CURRENCY5_82_;
SET QUERY_ID_2 = 2;
SET indicator_2 = 0;
SET cursor_cnt_2 = 0;
BEGIN
DECLARE cursor_2 CURSOR FOR SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_0_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.CURRENCY_CODE = q3_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_2 = 1;
OPEN cursor_2;
loop_2: LOOP
IF cursor_cnt_2=0 THEN
FETCH cursor_2 INTO q3_res1_col_broadleafc0___currency_code__CURRENCY1_38_0_, q3_res1_col_broadleafc0___default_flag__DEFAULT_2_38_0_, q3_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_0_;
END IF;
IF cursor_cnt_2>=1 THEN
CLOSE cursor_2; LEAVE loop_2;END IF;
IF indicator_2=1 THEN CLOSE cursor_2; LEAVE loop_2; END IF;
SET cursor_cnt_2 = cursor_cnt_2 + 1;
END LOOP loop_2;
END;
SELECT cursor_cnt_2,q3_res1_col_broadleafc0___currency_code__CURRENCY1_38_0_,q3_res1_col_broadleafc0___default_flag__DEFAULT_2_38_0_,q3_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_0_;
SET q3_select_ret_num = cursor_cnt_2;
END IF;
SET QUERY_ID_3 = 3;
SET indicator_3 = 0;
SET cursor_cnt_3 = 0;
BEGIN
DECLARE cursor_3 CURSOR FOR SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_3 = 1;
OPEN cursor_3;
loop_3: LOOP
IF cursor_cnt_3=0 THEN
FETCH cursor_3 INTO q4_res1_col_broadleafc0___currency_code__CURRENCY1_38_, q4_res1_col_broadleafc0___default_flag__DEFAULT_2_38_, q4_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_;
END IF;
IF cursor_cnt_3>=1 THEN
CLOSE cursor_3; LEAVE loop_3;END IF;
IF indicator_3=1 THEN CLOSE cursor_3; LEAVE loop_3; END IF;
SET cursor_cnt_3 = cursor_cnt_3 + 1;
END LOOP loop_3;
END;
SELECT cursor_cnt_3,q4_res1_col_broadleafc0___currency_code__CURRENCY1_38_,q4_res1_col_broadleafc0___default_flag__DEFAULT_2_38_,q4_res1_col_broadleafc0___friendly_name__FRIENDLY3_38_;
SET q4_select_ret_num = cursor_cnt_3;
SET q5_i1 = 'NONE_PROVIDED';
SET QUERY_ID_4 = 4;
SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = q5_i1;
SET q5_select_ret_num = FOUND_ROWS();
SET q6_i1 = 'blc.auth.jwt.access.secret';
SET QUERY_ID_5 = 5;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q6_i1;
SET q6_select_ret_num = FOUND_ROWS();
SET q7_i1 = 'blc.auth.jwt.access.secret';
SET QUERY_ID_6 = 6;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q7_i1;
SET q7_select_ret_num = FOUND_ROWS();
SET q8_i1 = REQUEST_TOKEN__FIELD_username;
SET QUERY_ID_7 = 7;
SET indicator_7 = 0;
SET cursor_cnt_7 = 0;
BEGIN
DECLARE cursor_7 CURSOR FOR SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = q8_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_7 = 1;
OPEN cursor_7;
loop_7: LOOP
IF cursor_cnt_7=0 THEN
FETCH cursor_7 INTO q8_res1_col_customerim0___customer_id__CUSTOMER1_40_, q8_res1_col_customerim0___created_by__CREATED_2_40_, q8_res1_col_customerim0___date_created__DATE_CRE3_40_, q8_res1_col_customerim0___date_updated__DATE_UPD4_40_, q8_res1_col_customerim0___updated_by__UPDATED_5_40_, q8_res1_col_customerim0___challenge_answer__CHALLENG6_40_, q8_res1_col_customerim0___challenge_question_id__CHALLEN20_40_, q8_res1_col_customerim0___locale_code__LOCALE_21_40_, q8_res1_col_customerim0___deactivated__DEACTIVA7_40_, q8_res1_col_customerim0___email_address__EMAIL_AD8_40_, q8_res1_col_customerim0___external_id__EXTERNAL9_40_, q8_res1_col_customerim0___first_name__FIRST_N10_40_, q8_res1_col_customerim0___is_tax_exempt__IS_TAX_11_40_, q8_res1_col_customerim0___last_name__LAST_NA12_40_, q8_res1_col_customerim0___password__PASSWOR13_40_, q8_res1_col_customerim0___password_change_required__PASSWOR14_40_, q8_res1_col_customerim0___is_preview__IS_PREV15_40_, q8_res1_col_customerim0___receive_email__RECEIVE16_40_, q8_res1_col_customerim0___is_registered__IS_REGI17_40_, q8_res1_col_customerim0___tax_exemption_code__TAX_EXE18_40_, q8_res1_col_customerim0___user_name__USER_NA19_40_;
END IF;
IF cursor_cnt_7>=1 THEN
CLOSE cursor_7; LEAVE loop_7;END IF;
IF indicator_7=1 THEN CLOSE cursor_7; LEAVE loop_7; END IF;
SET cursor_cnt_7 = cursor_cnt_7 + 1;
END LOOP loop_7;
END;
SELECT cursor_cnt_7,q8_res1_col_customerim0___customer_id__CUSTOMER1_40_,q8_res1_col_customerim0___created_by__CREATED_2_40_,q8_res1_col_customerim0___date_created__DATE_CRE3_40_,q8_res1_col_customerim0___date_updated__DATE_UPD4_40_,q8_res1_col_customerim0___updated_by__UPDATED_5_40_,q8_res1_col_customerim0___challenge_answer__CHALLENG6_40_,q8_res1_col_customerim0___challenge_question_id__CHALLEN20_40_,q8_res1_col_customerim0___locale_code__LOCALE_21_40_,q8_res1_col_customerim0___deactivated__DEACTIVA7_40_,q8_res1_col_customerim0___email_address__EMAIL_AD8_40_,q8_res1_col_customerim0___external_id__EXTERNAL9_40_,q8_res1_col_customerim0___first_name__FIRST_N10_40_,q8_res1_col_customerim0___is_tax_exempt__IS_TAX_11_40_,q8_res1_col_customerim0___last_name__LAST_NA12_40_,q8_res1_col_customerim0___password__PASSWOR13_40_,q8_res1_col_customerim0___password_change_required__PASSWOR14_40_,q8_res1_col_customerim0___is_preview__IS_PREV15_40_,q8_res1_col_customerim0___receive_email__RECEIVE16_40_,q8_res1_col_customerim0___is_registered__IS_REGI17_40_,q8_res1_col_customerim0___tax_exemption_code__TAX_EXE18_40_,q8_res1_col_customerim0___user_name__USER_NA19_40_;
SET q8_select_ret_num = cursor_cnt_7;
SET QUERY_ID_8_TXN = 8;
set autocommit=0;
IF cursor_cnt_7 > 0 THEN
SET q10_i1 = q8_res1_col_customerim0___customer_id__CUSTOMER1_40_;
SET QUERY_ID_9 = 9;
SET indicator_9 = 0;
SET cursor_cnt_9 = 0;
BEGIN
DECLARE cursor_9 CURSOR FOR SELECT customerro0_.CUSTOMER_ROLE_ID AS CUSTOMER1_48_, customerro0_.CUSTOMER_ID AS CUSTOMER2_48_, customerro0_.ROLE_ID AS ROLE_ID3_48_ FROM BLC_CUSTOMER_ROLE customerro0_ WHERE customerro0_.CUSTOMER_ID = q10_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_9 = 1;
OPEN cursor_9;
loop_9: LOOP
IF cursor_cnt_9=0 THEN
FETCH cursor_9 INTO q10_res1_col_customerro0___customer_role_id__CUSTOMER1_48_, q10_res1_col_customerro0___customer_id__CUSTOMER2_48_, q10_res1_col_customerro0___role_id__ROLE_ID3_48_;
END IF;
IF cursor_cnt_9>=1 THEN
CLOSE cursor_9; LEAVE loop_9;END IF;
IF indicator_9=1 THEN CLOSE cursor_9; LEAVE loop_9; END IF;
SET cursor_cnt_9 = cursor_cnt_9 + 1;
END LOOP loop_9;
END;
SELECT cursor_cnt_9,q10_res1_col_customerro0___customer_role_id__CUSTOMER1_48_,q10_res1_col_customerro0___customer_id__CUSTOMER2_48_,q10_res1_col_customerro0___role_id__ROLE_ID3_48_;
SET q10_select_ret_num = cursor_cnt_9;
END IF;
IF cursor_cnt_9 > 0 THEN
SET q11_i1 = q10_res1_col_customerro0___role_id__ROLE_ID3_48_;
SET QUERY_ID_10 = 10;
SET indicator_10 = 0;
SET cursor_cnt_10 = 0;
BEGIN
DECLARE cursor_10 CURSOR FOR SELECT roleimpl0_.ROLE_ID AS ROLE_ID1_137_0_, roleimpl0_.ROLE_NAME AS ROLE_NAM2_137_0_ FROM BLC_ROLE roleimpl0_ WHERE roleimpl0_.ROLE_ID = q11_i1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET indicator_10 = 1;
OPEN cursor_10;
loop_10: LOOP
IF cursor_cnt_10=0 THEN
FETCH cursor_10 INTO q11_res1_col_roleimpl0___role_id__ROLE_ID1_137_0_, q11_res1_col_roleimpl0___role_name__ROLE_NAM2_137_0_;
END IF;
IF cursor_cnt_10>=1 THEN
CLOSE cursor_10; LEAVE loop_10;END IF;
IF indicator_10=1 THEN CLOSE cursor_10; LEAVE loop_10; END IF;
SET cursor_cnt_10 = cursor_cnt_10 + 1;
END LOOP loop_10;
END;
SELECT cursor_cnt_10,q11_res1_col_roleimpl0___role_id__ROLE_ID1_137_0_,q11_res1_col_roleimpl0___role_name__ROLE_NAM2_137_0_;
SET q11_select_ret_num = cursor_cnt_10;
END IF;
END IF;
SELECT QUERY_ID_0,q1_i1,QUERY_ID_1,q2_i1,QUERY_ID_2,q3_i1,QUERY_ID_3,QUERY_ID_4,q5_i1,QUERY_ID_5,q6_i1,QUERY_ID_6,q7_i1,QUERY_ID_7,q8_i1,QUERY_ID_8_TXN,QUERY_ID_9,q10_i1,QUERY_ID_10,q11_i1;

END $$
DELIMITER ;