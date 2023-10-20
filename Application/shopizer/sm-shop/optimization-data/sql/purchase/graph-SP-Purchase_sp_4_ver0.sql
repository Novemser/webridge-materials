DROP PROCEDURE IF EXISTS `Purchase_sp_4_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_4_ver0 (IN M_L_String__user_name VARCHAR(512))
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_14_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;

IF TRUE THEN
commit;
END IF;
IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF TRUE THEN
SET QUERY_ID_1_TXN = 1;
set autocommit=0;
END IF;
IF TRUE THEN
SET q3_i1 = M_L_String__user_name;
SET QUERY_ID_2 = 2;
SELECT customer0_.CUSTOMER_ID AS CUSTOMER1_9_0_, merchantst1_.MERCHANT_ID AS MERCHANT1_29_1_, language2_.LANGUAGE_ID AS LANGUAGE1_23_2_, attributes3_.CUSTOMER_ATTRIBUTE_ID AS CUSTOMER1_10_3_, customerop4_.CUSTOMER_OPTION_ID AS CUSTOMER1_14_4_ , descriptio6_.DESCRIPTION_ID AS DESCRIPT1_15_5_, customerop5_.CUSTOMER_OPTION_VALUE_ID AS CUSTOMER1_17_6_, descriptio7_.DESCRIPTION_ID AS DESCRIPT1_12_7_, group9_.GROUP_ID AS GROUP_ID1_72_8_, customer0_.CUSTOMER_ANONYMOUS AS CUSTOMER2_9_0_ , customer0_.DATE_CREATED AS DATE_CRE3_9_0_, customer0_.DATE_MODIFIED AS DATE_MOD4_9_0_, customer0_.UPDT_ID AS UPDT_ID5_9_0_, customer0_.BILLING_STREET_ADDRESS AS BILLING_6_9_0_, customer0_.BILLING_CITY AS BILLING_7_9_0_ , customer0_.BILLING_COMPANY AS BILLING_8_9_0_, customer0_.BILLING_COUNTRY_ID AS BILLING33_9_0_, customer0_.BILLING_FIRST_NAME AS BILLING_9_9_0_, customer0_.BILLING_LAST_NAME AS BILLING10_9_0_, customer0_.LATITUDE AS LATITUD11_9_0_ , customer0_.LONGITUDE AS LONGITU12_9_0_, customer0_.BILLING_POSTCODE AS BILLING13_9_0_, customer0_.BILLING_STATE AS BILLING14_9_0_, customer0_.BILLING_TELEPHONE AS BILLING15_9_0_, customer0_.BILLING_ZONE_ID AS BILLING34_9_0_ , customer0_.CUSTOMER_COMPANY AS CUSTOME16_9_0_, customer0_.REVIEW_AVG AS REVIEW_17_9_0_, customer0_.REVIEW_COUNT AS REVIEW_18_9_0_, customer0_.CUSTOMER_DOB AS CUSTOME19_9_0_, customer0_.LANGUAGE_ID AS LANGUAG35_9_0_ , customer0_.DELIVERY_STREET_ADDRESS AS DELIVER20_9_0_, customer0_.DELIVERY_CITY AS DELIVER21_9_0_, customer0_.DELIVERY_COMPANY AS DELIVER22_9_0_, customer0_.DELIVERY_COUNTRY_ID AS DELIVER36_9_0_, customer0_.DELIVERY_FIRST_NAME AS DELIVER23_9_0_ , customer0_.DELIVERY_LAST_NAME AS DELIVER24_9_0_, customer0_.DELIVERY_POSTCODE AS DELIVER25_9_0_, customer0_.DELIVERY_STATE AS DELIVER26_9_0_, customer0_.DELIVERY_TELEPHONE AS DELIVER27_9_0_, customer0_.DELIVERY_ZONE_ID AS DELIVER37_9_0_ , customer0_.CUSTOMER_EMAIL_ADDRESS AS CUSTOME28_9_0_, customer0_.CUSTOMER_GENDER AS CUSTOME29_9_0_, customer0_.MERCHANT_ID AS MERCHAN38_9_0_, customer0_.CUSTOMER_NICK AS CUSTOME30_9_0_, customer0_.CUSTOMER_PASSWORD AS CUSTOME31_9_0_ , customer0_.PROVIDER AS PROVIDE32_9_0_, merchantst1_.DATE_CREATED AS DATE_CRE2_29_1_, merchantst1_.DATE_MODIFIED AS DATE_MOD3_29_1_, merchantst1_.UPDT_ID AS UPDT_ID4_29_1_, merchantst1_.STORE_CODE AS STORE_CO5_29_1_ , merchantst1_.CONTINUESHOPPINGURL AS CONTINUE6_29_1_, merchantst1_.COUNTRY_ID AS COUNTRY24_29_1_, merchantst1_.CURRENCY_ID AS CURRENC25_29_1_, merchantst1_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_1_, merchantst1_.LANGUAGE_ID AS LANGUAG26_29_1_ , merchantst1_.DOMAIN_NAME AS DOMAIN_N8_29_1_, merchantst1_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_1_, merchantst1_.INVOICE_TEMPLATE AS INVOICE10_29_1_, merchantst1_.PARENT_ID AS PARENT_27_29_1_, merchantst1_.IS_RETAILER AS IS_RETA11_29_1_ , merchantst1_.SEIZEUNITCODE AS SEIZEUN12_29_1_, merchantst1_.STORE_EMAIL AS STORE_E13_29_1_, merchantst1_.STORE_LOGO AS STORE_L14_29_1_, merchantst1_.STORE_TEMPLATE AS STORE_T15_29_1_, merchantst1_.STORE_ADDRESS AS STORE_A16_29_1_ , merchantst1_.STORE_CITY AS STORE_C17_29_1_, merchantst1_.STORE_NAME AS STORE_N18_29_1_, merchantst1_.STORE_PHONE AS STORE_P19_29_1_, merchantst1_.STORE_POSTAL_CODE AS STORE_P20_29_1_, merchantst1_.STORE_STATE_PROV AS STORE_S21_29_1_ , merchantst1_.USE_CACHE AS USE_CAC22_29_1_, merchantst1_.WEIGHTUNITCODE AS WEIGHTU23_29_1_, merchantst1_.ZONE_ID AS ZONE_ID28_29_1_, language2_.DATE_CREATED AS DATE_CRE2_23_2_, language2_.DATE_MODIFIED AS DATE_MOD3_23_2_ , language2_.UPDT_ID AS UPDT_ID4_23_2_, language2_.CODE AS CODE5_23_2_, language2_.SORT_ORDER AS SORT_ORD6_23_2_, attributes3_.CUSTOMER_ID AS CUSTOMER3_10_3_, attributes3_.OPTION_ID AS OPTION_I4_10_3_ , attributes3_.OPTION_VALUE_ID AS OPTION_V5_10_3_, attributes3_.CUSTOMER_ATTR_TXT_VAL AS CUSTOMER2_10_3_, attributes3_.CUSTOMER_ID AS CUSTOMER3_10_0__, attributes3_.CUSTOMER_ATTRIBUTE_ID AS CUSTOMER1_10_0__, customerop4_.CUSTOMER_OPT_ACTIVE AS CUSTOMER2_14_4_ , customerop4_.CUSTOMER_OPT_CODE AS CUSTOMER3_14_4_, customerop4_.CUSTOMER_OPTION_TYPE AS CUSTOMER4_14_4_, customerop4_.MERCHANT_ID AS MERCHANT7_14_4_, customerop4_.CUSTOMER_OPT_PUBLIC AS CUSTOMER5_14_4_, customerop4_.SORT_ORDER AS SORT_ORD6_14_4_ , descriptio6_.DATE_CREATED AS DATE_CRE2_15_5_, descriptio6_.DATE_MODIFIED AS DATE_MOD3_15_5_, descriptio6_.UPDT_ID AS UPDT_ID4_15_5_, descriptio6_.DESCRIPTION AS DESCRIPT5_15_5_, descriptio6_.LANGUAGE_ID AS LANGUAGE9_15_5_ , descriptio6_.NAME AS NAME6_15_5_, descriptio6_.TITLE AS TITLE7_15_5_, descriptio6_.CUSTOMER_OPTION_ID AS CUSTOME10_15_5_, descriptio6_.CUSTOMER_OPTION_COMMENT AS CUSTOMER8_15_5_, descriptio6_.CUSTOMER_OPTION_ID AS CUSTOME10_15_1__ , descriptio6_.DESCRIPTION_ID AS DESCRIPT1_15_1__, customerop5_.CUSTOMER_OPT_VAL_CODE AS CUSTOMER2_17_6_, customerop5_.CUSTOMER_OPT_VAL_IMAGE AS CUSTOMER3_17_6_, customerop5_.MERCHANT_ID AS MERCHANT5_17_6_, customerop5_.SORT_ORDER AS SORT_ORD4_17_6_ , descriptio7_.DATE_CREATED AS DATE_CRE2_12_7_, descriptio7_.DATE_MODIFIED AS DATE_MOD3_12_7_, descriptio7_.UPDT_ID AS UPDT_ID4_12_7_, descriptio7_.DESCRIPTION AS DESCRIPT5_12_7_, descriptio7_.LANGUAGE_ID AS LANGUAGE8_12_7_ , descriptio7_.NAME AS NAME6_12_7_, descriptio7_.TITLE AS TITLE7_12_7_, descriptio7_.CUSTOMER_OPT_VAL_ID AS CUSTOMER9_12_7_, descriptio7_.CUSTOMER_OPT_VAL_ID AS CUSTOMER9_12_2__, descriptio7_.DESCRIPTION_ID AS DESCRIPT1_12_2__ , group9_.DATE_CREATED AS DATE_CRE2_72_8_, group9_.DATE_MODIFIED AS DATE_MOD3_72_8_, group9_.UPDT_ID AS UPDT_ID4_72_8_, group9_.GROUP_NAME AS GROUP_NA5_72_8_, group9_.GROUP_TYPE AS GROUP_TY6_72_8_ , groups8_.CUSTOMER_ID AS CUSTOMER1_11_3__, groups8_.GROUP_ID AS GROUP_ID2_11_3__ FROM CUSTOMER customer0_ INNER JOIN MERCHANT_STORE merchantst1_ ON customer0_.MERCHANT_ID = merchantst1_.MERCHANT_ID LEFT JOIN LANGUAGE language2_ ON customer0_.LANGUAGE_ID = language2_.LANGUAGE_ID LEFT JOIN CUSTOMER_ATTRIBUTE attributes3_ ON customer0_.CUSTOMER_ID = attributes3_.CUSTOMER_ID LEFT JOIN CUSTOMER_OPTION customerop4_ ON attributes3_.OPTION_ID = customerop4_.CUSTOMER_OPTION_ID LEFT JOIN CUSTOMER_OPTION_DESC descriptio6_ ON customerop4_.CUSTOMER_OPTION_ID = descriptio6_.CUSTOMER_OPTION_ID LEFT JOIN CUSTOMER_OPTION_VALUE customerop5_ ON attributes3_.OPTION_VALUE_ID = customerop5_.CUSTOMER_OPTION_VALUE_ID LEFT JOIN CUSTOMER_OPT_VAL_DESCRIPTION descriptio7_ ON customerop5_.CUSTOMER_OPTION_VALUE_ID = descriptio7_.CUSTOMER_OPT_VAL_ID LEFT JOIN CUSTOMER_GROUP groups8_ ON customer0_.CUSTOMER_ID = groups8_.CUSTOMER_ID LEFT JOIN SM_GROUP group9_ ON groups8_.GROUP_ID = group9_.GROUP_ID WHERE customer0_.CUSTOMER_NICK = q3_i1;
SET M_I_RS_14_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1;

END $$
DELIMITER ;