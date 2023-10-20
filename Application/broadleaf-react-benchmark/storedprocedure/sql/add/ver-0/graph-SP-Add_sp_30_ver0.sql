DROP PROCEDURE IF EXISTS `Add_sp_30_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_30_ver0 (IN RS_q8_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_32_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q8_r1_col1;
SET QUERY_ID_0 = 0;
SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_2_, customerim0_.CREATED_BY AS CREATED_2_40_2_, customerim0_.DATE_CREATED AS DATE_CRE3_40_2_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_2_, customerim0_.UPDATED_BY AS UPDATED_5_40_2_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_2_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_2_, customerim0_.LOCALE_CODE AS LOCALE_21_40_2_, customerim0_.DEACTIVATED AS DEACTIVA7_40_2_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_2_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_2_, customerim0_.FIRST_NAME AS FIRST_N10_40_2_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_2_, customerim0_.LAST_NAME AS LAST_NA12_40_2_, customerim0_.PASSWORD AS PASSWOR13_40_2_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_2_, customerim0_.IS_PREVIEW AS IS_PREV15_40_2_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_2_, customerim0_.IS_REGISTERED AS IS_REGI17_40_2_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_2_ , customerim0_.USER_NAME AS USER_NA19_40_2_, customerad1_.CUSTOMER_ID AS CUSTOMER5_41_4_, customerad1_.CUSTOMER_ADDRESS_ID AS CUSTOMER1_41_4_, customerad1_.CUSTOMER_ADDRESS_ID AS CUSTOMER1_41_0_, customerad1_.ADDRESS_ID AS ADDRESS_4_41_0_ , customerad1_.ADDRESS_NAME AS ADDRESS_2_41_0_, customerad1_.ARCHIVED AS ARCHIVED3_41_0_, customerad1_.CUSTOMER_ID AS CUSTOMER5_41_0_, addressimp2_.ADDRESS_ID AS ADDRESS_1_1_1_, addressimp2_.ADDRESS_LINE1 AS ADDRESS_2_1_1_ , addressimp2_.ADDRESS_LINE2 AS ADDRESS_3_1_1_, addressimp2_.ADDRESS_LINE3 AS ADDRESS_4_1_1_, addressimp2_.CITY AS CITY5_1_1_, addressimp2_.COMPANY_NAME AS COMPANY_6_1_1_, addressimp2_.COUNTRY AS COUNTRY27_1_1_ , addressimp2_.COUNTY AS COUNTY7_1_1_, addressimp2_.EMAIL_ADDRESS AS EMAIL_AD8_1_1_, addressimp2_.FAX AS FAX9_1_1_, addressimp2_.FIRST_NAME AS FIRST_N10_1_1_, addressimp2_.FULL_NAME AS FULL_NA11_1_1_ , addressimp2_.IS_ACTIVE AS IS_ACTI12_1_1_, addressimp2_.IS_BUSINESS AS IS_BUSI13_1_1_, addressimp2_.IS_DEFAULT AS IS_DEFA14_1_1_, addressimp2_.IS_MAILING AS IS_MAIL15_1_1_, addressimp2_.IS_STREET AS IS_STRE16_1_1_ , addressimp2_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_1_, addressimp2_.ISO_COUNTRY_SUB AS ISO_COU17_1_1_, addressimp2_.LAST_NAME AS LAST_NA18_1_1_, addressimp2_.PHONE_FAX_ID AS PHONE_F29_1_1_, addressimp2_.PHONE_PRIMARY_ID AS PHONE_P30_1_1_ , addressimp2_.PHONE_SECONDARY_ID AS PHONE_S31_1_1_, addressimp2_.POSTAL_CODE AS POSTAL_19_1_1_, addressimp2_.PRIMARY_PHONE AS PRIMARY20_1_1_, addressimp2_.SECONDARY_PHONE AS SECONDA21_1_1_, addressimp2_.STANDARDIZED AS STANDAR22_1_1_ , addressimp2_.STATE_PROV_REGION AS STATE_P32_1_1_, addressimp2_.SUB_STATE_PROV_REG AS SUB_STA23_1_1_, addressimp2_.TOKENIZED_ADDRESS AS TOKENIZ24_1_1_, addressimp2_.VERIFICATION_LEVEL AS VERIFIC25_1_1_, addressimp2_.ZIP_FOUR AS ZIP_FOU26_1_1_ FROM BLC_CUSTOMER customerim0_ LEFT JOIN BLC_CUSTOMER_ADDRESS customerad1_ ON customerim0_.CUSTOMER_ID = customerad1_.CUSTOMER_ID AND customerad1_.archived != 'Y' LEFT JOIN BLC_ADDRESS addressimp2_ ON customerad1_.ADDRESS_ID = addressimp2_.ADDRESS_ID WHERE customerim0_.CUSTOMER_ID = q1_i1;
SET M_I_RS_32_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;