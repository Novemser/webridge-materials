DROP PROCEDURE IF EXISTS `Add_sp_79_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_79_ver0 (IN RS_q20_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_88_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q20_r1_col1;
SET QUERY_ID_0 = 0;
SELECT payments0_.ORDER_ID AS ORDER_ID8_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_1_, payments0_.AMOUNT AS AMOUNT2_106_1_, payments0_.ARCHIVED AS ARCHIVED3_106_1_ , payments0_.ADDRESS_ID AS ADDRESS_7_106_1_, payments0_.GATEWAY_TYPE AS GATEWAY_4_106_1_, payments0_.ORDER_ID AS ORDER_ID8_106_1_, payments0_.REFERENCE_NUMBER AS REFERENC5_106_1_, payments0_.PAYMENT_TYPE AS PAYMENT_6_106_1_ , addressimp1_.ADDRESS_ID AS ADDRESS_1_1_2_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_2_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_2_, addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_2_, addressimp1_.CITY AS CITY5_1_2_ , addressimp1_.COMPANY_NAME AS COMPANY_6_1_2_, addressimp1_.COUNTRY AS COUNTRY27_1_2_, addressimp1_.COUNTY AS COUNTY7_1_2_, addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_2_, addressimp1_.FAX AS FAX9_1_2_ , addressimp1_.FIRST_NAME AS FIRST_N10_1_2_, addressimp1_.FULL_NAME AS FULL_NA11_1_2_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_2_, addressimp1_.IS_BUSINESS AS IS_BUSI13_1_2_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_2_ , addressimp1_.IS_MAILING AS IS_MAIL15_1_2_, addressimp1_.IS_STREET AS IS_STRE16_1_2_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_2_, addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_2_, addressimp1_.LAST_NAME AS LAST_NA18_1_2_ , addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_2_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_2_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_2_, addressimp1_.POSTAL_CODE AS POSTAL_19_1_2_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_2_ , addressimp1_.SECONDARY_PHONE AS SECONDA21_1_2_, addressimp1_.STANDARDIZED AS STANDAR22_1_2_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_2_, addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_2_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_2_ , addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_2_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_2_, countryimp2_.ABBREVIATION AS ABBREVIA1_35_3_, countryimp2_.NAME AS NAME2_35_3_, isocountry3_.ALPHA_2 AS ALPHA_1_80_4_ , isocountry3_.ALPHA_3 AS ALPHA_2_80_4_, isocountry3_.NAME AS NAME3_80_4_, isocountry3_.NUMERIC_CODE AS NUMERIC_4_80_4_, isocountry3_.STATUS AS STATUS5_80_4_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_5_ , phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_5_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_5_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_5_, phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_5_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_5_ , phoneimpl5_.PHONE_ID AS PHONE_ID1_118_6_, phoneimpl5_.COUNTRY_CODE AS COUNTRY_2_118_6_, phoneimpl5_.EXTENSION AS EXTENSIO3_118_6_, phoneimpl5_.IS_ACTIVE AS IS_ACTIV4_118_6_, phoneimpl5_.IS_DEFAULT AS IS_DEFAU5_118_6_ , phoneimpl5_.PHONE_NUMBER AS PHONE_NU6_118_6_, phoneimpl6_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl6_.COUNTRY_CODE AS COUNTRY_2_118_7_, phoneimpl6_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl6_.IS_ACTIVE AS IS_ACTIV4_118_7_ , phoneimpl6_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl6_.PHONE_NUMBER AS PHONE_NU6_118_7_, stateimpl7_.ABBREVIATION AS ABBREVIA1_170_8_, stateimpl7_.COUNTRY AS COUNTRY3_170_8_, stateimpl7_.NAME AS NAME2_170_8_ FROM BLC_ORDER_PAYMENT payments0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON payments0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_COUNTRY countryimp2_ ON addressimp1_.COUNTRY = countryimp2_.ABBREVIATION LEFT JOIN BLC_ISO_COUNTRY isocountry3_ ON addressimp1_.ISO_COUNTRY_ALPHA2 = isocountry3_.ALPHA_2 LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_FAX_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl5_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl5_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl6_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl6_.PHONE_ID LEFT JOIN BLC_STATE stateimpl7_ ON addressimp1_.STATE_PROV_REGION = stateimpl7_.ABBREVIATION WHERE payments0_.ORDER_ID = q1_i1;
SET M_I_RS_88_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;