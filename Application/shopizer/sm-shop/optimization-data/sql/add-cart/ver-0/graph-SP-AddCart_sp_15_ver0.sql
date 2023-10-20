DROP PROCEDURE IF EXISTS `AddCart_sp_15_ver0`;
DELIMITER $$
CREATE PROCEDURE AddCart_sp_15_ver0 (IN RS_q2_r1_col6 INT, IN __nd__func__currentTimeMs__42__101 BIGINT, IN RS_q18_r1_col1 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 INT DEFAULT NULL;
DECLARE q1_i5 INT DEFAULT NULL;
DECLARE q1_i6 DATETIME DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_45_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q18_r1_col1;
SET q1_i2 = '*';
SET q1_i3 = 'US';
SET q1_i4 = RS_q2_r1_col6;
SET q1_i5 = RS_q2_r1_col6;
SET q1_i6 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__101/1000)*1000)/1000));
SET QUERY_ID_0 = 0;
SELECT DISTINCT product0_.PRODUCT_ID AS PRODUCT_1_44_0_, availabili1_.PRODUCT_AVAIL_ID AS PRODUCT_1_46_1_, prices4_.PRODUCT_PRICE_ID AS PRODUCT_1_59_2_, descriptio5_.DESCRIPTION_ID AS DESCRIPT1_60_3_, descriptio2_.DESCRIPTION_ID AS DESCRIPT1_48_4_ , merchantst3_.MERCHANT_ID AS MERCHANT1_29_5_, images6_.PRODUCT_IMAGE_ID AS PRODUCT_1_50_6_, attributes7_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_1_45_7_, productopt8_.PRODUCT_OPTION_ID AS PRODUCT_1_54_8_, descriptio9_.DESCRIPTION_ID AS DESCRIPT1_55_9_ , productopt10_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_1_57_10_, descriptio11_.DESCRIPTION_ID AS DESCRIPT1_58_11_, relationsh12_.PRODUCT_RELATIONSHIP_ID AS PRODUCT_1_61_12_, manufactur13_.MANUFACTURER_ID AS MANUFACT1_24_13_, descriptio14_.DESCRIPTION_ID AS DESCRIPT1_25_14_ , producttyp15_.PRODUCT_TYPE_ID AS PRODUCT_1_64_15_, taxclass16_.TAX_CLASS_ID AS TAX_CLAS1_76_16_, customer17_.CUSTOMER_ID AS CUSTOMER1_9_17_, product0_.DATE_CREATED AS DATE_CRE2_44_0_, product0_.DATE_MODIFIED AS DATE_MOD3_44_0_ , product0_.UPDT_ID AS UPDT_ID4_44_0_, product0_.AVAILABLE AS AVAILABL5_44_0_, product0_.COND AS COND6_44_0_, product0_.DATE_AVAILABLE AS DATE_AVA7_44_0_, product0_.MANUFACTURER_ID AS MANUFAC25_44_0_ , product0_.MERCHANT_ID AS MERCHAN26_44_0_, product0_.CUSTOMER_ID AS CUSTOME27_44_0_, product0_.PREORDER AS PREORDER8_44_0_, product0_.PRODUCT_HEIGHT AS PRODUCT_9_44_0_, product0_.PRODUCT_FREE AS PRODUCT10_44_0_ , product0_.PRODUCT_LENGTH AS PRODUCT11_44_0_, product0_.QUANTITY_ORDERED AS QUANTIT12_44_0_, product0_.REVIEW_AVG AS REVIEW_13_44_0_, product0_.REVIEW_COUNT AS REVIEW_14_44_0_, product0_.PRODUCT_SHIP AS PRODUCT15_44_0_ , product0_.PRODUCT_VIRTUAL AS PRODUCT16_44_0_, product0_.PRODUCT_WEIGHT AS PRODUCT17_44_0_, product0_.PRODUCT_WIDTH AS PRODUCT18_44_0_, product0_.REF_SKU AS REF_SKU19_44_0_, product0_.RENTAL_DURATION AS RENTAL_20_44_0_ , product0_.RENTAL_PERIOD AS RENTAL_21_44_0_, product0_.RENTAL_STATUS AS RENTAL_22_44_0_, product0_.SKU AS SKU23_44_0_, product0_.SORT_ORDER AS SORT_OR24_44_0_, product0_.TAX_CLASS_ID AS TAX_CLA28_44_0_ , product0_.PRODUCT_TYPE_ID AS PRODUCT29_44_0_, availabili1_.DATE_CREATED AS DATE_CRE2_46_1_, availabili1_.DATE_MODIFIED AS DATE_MOD3_46_1_, availabili1_.UPDT_ID AS UPDT_ID4_46_1_, availabili1_.AVAILABLE AS AVAILABL5_46_1_ , availabili1_.MERCHANT_ID AS MERCHAN15_46_1_, availabili1_.OWNER AS OWNER6_46_1_, availabili1_.PRODUCT_ID AS PRODUCT16_46_1_, availabili1_.DATE_AVAILABLE AS DATE_AVA7_46_1_, availabili1_.FREE_SHIPPING AS FREE_SHI8_46_1_ , availabili1_.QUANTITY AS QUANTITY9_46_1_, availabili1_.QUANTITY_ORD_MAX AS QUANTIT10_46_1_, availabili1_.QUANTITY_ORD_MIN AS QUANTIT11_46_1_, availabili1_.STATUS AS STATUS12_46_1_, availabili1_.REGION AS REGION13_46_1_ , availabili1_.REGION_VARIANT AS REGION_14_46_1_, availabili1_.PRODUCT_ID AS PRODUCT16_46_0__, availabili1_.PRODUCT_AVAIL_ID AS PRODUCT_1_46_0__, prices4_.PRODUCT_PRICE_CODE AS PRODUCT_2_59_2_, prices4_.DEFAULT_PRICE AS DEFAULT_3_59_2_ , prices4_.PRODUCT_AVAIL_ID AS PRODUCT_9_59_2_, prices4_.PRODUCT_PRICE_AMOUNT AS PRODUCT_4_59_2_, prices4_.PRODUCT_PRICE_SPECIAL_AMOUNT AS PRODUCT_5_59_2_, prices4_.PRODUCT_PRICE_SPECIAL_END_DATE AS PRODUCT_6_59_2_, prices4_.PRODUCT_PRICE_SPECIAL_ST_DATE AS PRODUCT_7_59_2_ , prices4_.PRODUCT_PRICE_TYPE AS PRODUCT_8_59_2_, prices4_.PRODUCT_AVAIL_ID AS PRODUCT_9_59_1__, prices4_.PRODUCT_PRICE_ID AS PRODUCT_1_59_1__, descriptio5_.DATE_CREATED AS DATE_CRE2_60_3_, descriptio5_.DATE_MODIFIED AS DATE_MOD3_60_3_ , descriptio5_.UPDT_ID AS UPDT_ID4_60_3_, descriptio5_.DESCRIPTION AS DESCRIPT5_60_3_, descriptio5_.LANGUAGE_ID AS LANGUAGE9_60_3_, descriptio5_.NAME AS NAME6_60_3_, descriptio5_.TITLE AS TITLE7_60_3_ , descriptio5_.PRICE_APPENDER AS PRICE_AP8_60_3_, descriptio5_.PRODUCT_PRICE_ID AS PRODUCT10_60_3_, descriptio5_.PRODUCT_PRICE_ID AS PRODUCT10_60_2__, descriptio5_.DESCRIPTION_ID AS DESCRIPT1_60_2__, descriptio2_.DATE_CREATED AS DATE_CRE2_48_4_ , descriptio2_.DATE_MODIFIED AS DATE_MOD3_48_4_, descriptio2_.UPDT_ID AS UPDT_ID4_48_4_, descriptio2_.DESCRIPTION AS DESCRIPT5_48_4_, descriptio2_.LANGUAGE_ID AS LANGUAG14_48_4_, descriptio2_.NAME AS NAME6_48_4_ , descriptio2_.TITLE AS TITLE7_48_4_, descriptio2_.META_DESCRIPTION AS META_DES8_48_4_, descriptio2_.META_KEYWORDS AS META_KEY9_48_4_, descriptio2_.META_TITLE AS META_TI10_48_4_, descriptio2_.PRODUCT_ID AS PRODUCT15_48_4_ , descriptio2_.DOWNLOAD_LNK AS DOWNLOA11_48_4_, descriptio2_.PRODUCT_HIGHLIGHT AS PRODUCT12_48_4_, descriptio2_.SEF_URL AS SEF_URL13_48_4_, descriptio2_.PRODUCT_ID AS PRODUCT15_48_3__, descriptio2_.DESCRIPTION_ID AS DESCRIPT1_48_3__ , merchantst3_.DATE_CREATED AS DATE_CRE2_29_5_, merchantst3_.DATE_MODIFIED AS DATE_MOD3_29_5_, merchantst3_.UPDT_ID AS UPDT_ID4_29_5_, merchantst3_.STORE_CODE AS STORE_CO5_29_5_, merchantst3_.CONTINUESHOPPINGURL AS CONTINUE6_29_5_ , merchantst3_.COUNTRY_ID AS COUNTRY24_29_5_, merchantst3_.CURRENCY_ID AS CURRENC25_29_5_, merchantst3_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_5_, merchantst3_.LANGUAGE_ID AS LANGUAG26_29_5_, merchantst3_.DOMAIN_NAME AS DOMAIN_N8_29_5_ , merchantst3_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_5_, merchantst3_.INVOICE_TEMPLATE AS INVOICE10_29_5_, merchantst3_.PARENT_ID AS PARENT_27_29_5_, merchantst3_.IS_RETAILER AS IS_RETA11_29_5_, merchantst3_.SEIZEUNITCODE AS SEIZEUN12_29_5_ , merchantst3_.STORE_EMAIL AS STORE_E13_29_5_, merchantst3_.STORE_LOGO AS STORE_L14_29_5_, merchantst3_.STORE_TEMPLATE AS STORE_T15_29_5_, merchantst3_.STORE_ADDRESS AS STORE_A16_29_5_, merchantst3_.STORE_CITY AS STORE_C17_29_5_ , merchantst3_.STORE_NAME AS STORE_N18_29_5_, merchantst3_.STORE_PHONE AS STORE_P19_29_5_, merchantst3_.STORE_POSTAL_CODE AS STORE_P20_29_5_, merchantst3_.STORE_STATE_PROV AS STORE_S21_29_5_, merchantst3_.USE_CACHE AS USE_CAC22_29_5_ , merchantst3_.WEIGHTUNITCODE AS WEIGHTU23_29_5_, merchantst3_.ZONE_ID AS ZONE_ID28_29_5_, images6_.DEFAULT_IMAGE AS DEFAULT_2_50_6_, images6_.IMAGE_CROP AS IMAGE_CR3_50_6_, images6_.IMAGE_TYPE AS IMAGE_TY4_50_6_ , images6_.PRODUCT_ID AS PRODUCT_7_50_6_, images6_.PRODUCT_IMAGE AS PRODUCT_5_50_6_, images6_.PRODUCT_IMAGE_URL AS PRODUCT_6_50_6_, images6_.PRODUCT_ID AS PRODUCT_7_50_4__, images6_.PRODUCT_IMAGE_ID AS PRODUCT_1_50_4__ , attributes7_.PRODUCT_ATTRIBUTE_DEFAULT AS PRODUCT_2_45_7_, attributes7_.PRODUCT_ATTRIBUTE_DISCOUNTED AS PRODUCT_3_45_7_, attributes7_.PRODUCT_ATTRIBUTE_FOR_DISP AS PRODUCT_4_45_7_, attributes7_.PRODUCT_ATTRIBUTE_REQUIRED AS PRODUCT_5_45_7_, attributes7_.PRODUCT_ID AS PRODUCT10_45_7_ , attributes7_.PRODUCT_ATTRIBUTE_FREE AS PRODUCT_6_45_7_, attributes7_.PRODUCT_ATRIBUTE_PRICE AS PRODUCT_7_45_7_, attributes7_.PRODUCT_ATTRIBUTE_WEIGHT AS PRODUCT_8_45_7_, attributes7_.OPTION_ID AS OPTION_11_45_7_, attributes7_.PRODUCT_ATTRIBUTE_SORT_ORD AS PRODUCT_9_45_7_ , attributes7_.OPTION_VALUE_ID AS OPTION_12_45_7_, attributes7_.PRODUCT_ID AS PRODUCT10_45_5__, attributes7_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_1_45_5__, productopt8_.PRODUCT_OPTION_CODE AS PRODUCT_2_54_8_, productopt8_.MERCHANT_ID AS MERCHANT6_54_8_ , productopt8_.PRODUCT_OPTION_SORT_ORD AS PRODUCT_3_54_8_, productopt8_.PRODUCT_OPTION_TYPE AS PRODUCT_4_54_8_, productopt8_.PRODUCT_OPTION_READ AS PRODUCT_5_54_8_, descriptio9_.DATE_CREATED AS DATE_CRE2_55_9_, descriptio9_.DATE_MODIFIED AS DATE_MOD3_55_9_ , descriptio9_.UPDT_ID AS UPDT_ID4_55_9_, descriptio9_.DESCRIPTION AS DESCRIPT5_55_9_, descriptio9_.LANGUAGE_ID AS LANGUAGE9_55_9_, descriptio9_.NAME AS NAME6_55_9_, descriptio9_.TITLE AS TITLE7_55_9_ , descriptio9_.PRODUCT_OPTION_ID AS PRODUCT10_55_9_, descriptio9_.PRODUCT_OPTION_COMMENT AS PRODUCT_8_55_9_, descriptio9_.PRODUCT_OPTION_ID AS PRODUCT10_55_6__, descriptio9_.DESCRIPTION_ID AS DESCRIPT1_55_6__, productopt10_.PRODUCT_OPTION_VAL_CODE AS PRODUCT_2_57_10_ , productopt10_.MERCHANT_ID AS MERCHANT6_57_10_, productopt10_.PRODUCT_OPT_FOR_DISP AS PRODUCT_3_57_10_, productopt10_.PRODUCT_OPT_VAL_IMAGE AS PRODUCT_4_57_10_, productopt10_.PRODUCT_OPT_VAL_SORT_ORD AS PRODUCT_5_57_10_, descriptio11_.DATE_CREATED AS DATE_CRE2_58_11_ , descriptio11_.DATE_MODIFIED AS DATE_MOD3_58_11_, descriptio11_.UPDT_ID AS UPDT_ID4_58_11_, descriptio11_.DESCRIPTION AS DESCRIPT5_58_11_, descriptio11_.LANGUAGE_ID AS LANGUAGE8_58_11_, descriptio11_.NAME AS NAME6_58_11_ , descriptio11_.TITLE AS TITLE7_58_11_, descriptio11_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_9_58_11_, descriptio11_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_9_58_7__, descriptio11_.DESCRIPTION_ID AS DESCRIPT1_58_7__, relationsh12_.ACTIVE AS ACTIVE2_61_12_ , relationsh12_.CODE AS CODE3_61_12_, relationsh12_.PRODUCT_ID AS PRODUCT_4_61_12_, relationsh12_.RELATED_PRODUCT_ID AS RELATED_5_61_12_, relationsh12_.MERCHANT_ID AS MERCHANT6_61_12_, relationsh12_.PRODUCT_ID AS PRODUCT_4_61_8__ , relationsh12_.PRODUCT_RELATIONSHIP_ID AS PRODUCT_1_61_8__, manufactur13_.DATE_CREATED AS DATE_CRE2_24_13_, manufactur13_.DATE_MODIFIED AS DATE_MOD3_24_13_, manufactur13_.UPDT_ID AS UPDT_ID4_24_13_, manufactur13_.CODE AS CODE5_24_13_ , manufactur13_.MANUFACTURER_IMAGE AS MANUFACT6_24_13_, manufactur13_.MERCHANT_ID AS MERCHANT8_24_13_, manufactur13_.SORT_ORDER AS SORT_ORD7_24_13_, descriptio14_.DATE_CREATED AS DATE_CRE2_25_14_, descriptio14_.DATE_MODIFIED AS DATE_MOD3_25_14_ , descriptio14_.UPDT_ID AS UPDT_ID4_25_14_, descriptio14_.DESCRIPTION AS DESCRIPT5_25_14_, descriptio14_.LANGUAGE_ID AS LANGUAG11_25_14_, descriptio14_.NAME AS NAME6_25_14_, descriptio14_.TITLE AS TITLE7_25_14_ , descriptio14_.DATE_LAST_CLICK AS DATE_LAS8_25_14_, descriptio14_.MANUFACTURER_ID AS MANUFAC12_25_14_, descriptio14_.MANUFACTURERS_URL AS MANUFACT9_25_14_, descriptio14_.URL_CLICKED AS URL_CLI10_25_14_, descriptio14_.MANUFACTURER_ID AS MANUFAC12_25_9__ , descriptio14_.DESCRIPTION_ID AS DESCRIPT1_25_9__, producttyp15_.PRD_TYPE_ADD_TO_CART AS PRD_TYPE2_64_15_, producttyp15_.DATE_CREATED AS DATE_CRE3_64_15_, producttyp15_.DATE_MODIFIED AS DATE_MOD4_64_15_, producttyp15_.UPDT_ID AS UPDT_ID5_64_15_ , producttyp15_.PRD_TYPE_CODE AS PRD_TYPE6_64_15_, producttyp15_.MERCHANT_ID AS MERCHANT7_64_15_, taxclass16_.TAX_CLASS_CODE AS TAX_CLAS2_76_16_, taxclass16_.MERCHANT_ID AS MERCHANT4_76_16_, taxclass16_.TAX_CLASS_TITLE AS TAX_CLAS3_76_16_ , customer17_.CUSTOMER_ANONYMOUS AS CUSTOMER2_9_17_, customer17_.DATE_CREATED AS DATE_CRE3_9_17_, customer17_.DATE_MODIFIED AS DATE_MOD4_9_17_, customer17_.UPDT_ID AS UPDT_ID5_9_17_, customer17_.BILLING_STREET_ADDRESS AS BILLING_6_9_17_ , customer17_.BILLING_CITY AS BILLING_7_9_17_, customer17_.BILLING_COMPANY AS BILLING_8_9_17_, customer17_.BILLING_COUNTRY_ID AS BILLING33_9_17_, customer17_.BILLING_FIRST_NAME AS BILLING_9_9_17_, customer17_.BILLING_LAST_NAME AS BILLING10_9_17_ , customer17_.LATITUDE AS LATITUD11_9_17_, customer17_.LONGITUDE AS LONGITU12_9_17_, customer17_.BILLING_POSTCODE AS BILLING13_9_17_, customer17_.BILLING_STATE AS BILLING14_9_17_, customer17_.BILLING_TELEPHONE AS BILLING15_9_17_ , customer17_.BILLING_ZONE_ID AS BILLING34_9_17_, customer17_.CUSTOMER_COMPANY AS CUSTOME16_9_17_, customer17_.REVIEW_AVG AS REVIEW_17_9_17_, customer17_.REVIEW_COUNT AS REVIEW_18_9_17_, customer17_.CUSTOMER_DOB AS CUSTOME19_9_17_ , customer17_.LANGUAGE_ID AS LANGUAG35_9_17_, customer17_.DELIVERY_STREET_ADDRESS AS DELIVER20_9_17_, customer17_.DELIVERY_CITY AS DELIVER21_9_17_, customer17_.DELIVERY_COMPANY AS DELIVER22_9_17_, customer17_.DELIVERY_COUNTRY_ID AS DELIVER36_9_17_ , customer17_.DELIVERY_FIRST_NAME AS DELIVER23_9_17_, customer17_.DELIVERY_LAST_NAME AS DELIVER24_9_17_, customer17_.DELIVERY_POSTCODE AS DELIVER25_9_17_, customer17_.DELIVERY_STATE AS DELIVER26_9_17_, customer17_.DELIVERY_TELEPHONE AS DELIVER27_9_17_ , customer17_.DELIVERY_ZONE_ID AS DELIVER37_9_17_, customer17_.CUSTOMER_EMAIL_ADDRESS AS CUSTOME28_9_17_, customer17_.CUSTOMER_GENDER AS CUSTOME29_9_17_, customer17_.MERCHANT_ID AS MERCHAN38_9_17_, customer17_.CUSTOMER_NICK AS CUSTOME30_9_17_ , customer17_.CUSTOMER_PASSWORD AS CUSTOME31_9_17_, customer17_.PROVIDER AS PROVIDE32_9_17_ FROM PRODUCT product0_ INNER JOIN PRODUCT_AVAILABILITY availabili1_ ON product0_.PRODUCT_ID = availabili1_.PRODUCT_ID LEFT JOIN PRODUCT_PRICE prices4_ ON availabili1_.PRODUCT_AVAIL_ID = prices4_.PRODUCT_AVAIL_ID LEFT JOIN PRODUCT_PRICE_DESCRIPTION descriptio5_ ON prices4_.PRODUCT_PRICE_ID = descriptio5_.PRODUCT_PRICE_ID INNER JOIN PRODUCT_DESCRIPTION descriptio2_ ON product0_.PRODUCT_ID = descriptio2_.PRODUCT_ID INNER JOIN MERCHANT_STORE merchantst3_ ON product0_.MERCHANT_ID = merchantst3_.MERCHANT_ID LEFT JOIN PRODUCT_IMAGE images6_ ON product0_.PRODUCT_ID = images6_.PRODUCT_ID LEFT JOIN PRODUCT_ATTRIBUTE attributes7_ ON product0_.PRODUCT_ID = attributes7_.PRODUCT_ID LEFT JOIN PRODUCT_OPTION productopt8_ ON attributes7_.OPTION_ID = productopt8_.PRODUCT_OPTION_ID LEFT JOIN PRODUCT_OPTION_DESC descriptio9_ ON productopt8_.PRODUCT_OPTION_ID = descriptio9_.PRODUCT_OPTION_ID LEFT JOIN PRODUCT_OPTION_VALUE productopt10_ ON attributes7_.OPTION_VALUE_ID = productopt10_.PRODUCT_OPTION_VALUE_ID LEFT JOIN PRODUCT_OPTION_VALUE_DESCRIPTION descriptio11_ ON productopt10_.PRODUCT_OPTION_VALUE_ID = descriptio11_.PRODUCT_OPTION_VALUE_ID LEFT JOIN PRODUCT_RELATIONSHIP relationsh12_ ON product0_.PRODUCT_ID = relationsh12_.PRODUCT_ID LEFT JOIN MANUFACTURER manufactur13_ ON product0_.MANUFACTURER_ID = manufactur13_.MANUFACTURER_ID LEFT JOIN MANUFACTURER_DESCRIPTION descriptio14_ ON manufactur13_.MANUFACTURER_ID = descriptio14_.MANUFACTURER_ID LEFT JOIN PRODUCT_TYPE producttyp15_ ON product0_.PRODUCT_TYPE_ID = producttyp15_.PRODUCT_TYPE_ID LEFT JOIN TAX_CLASS taxclass16_ ON product0_.TAX_CLASS_ID = taxclass16_.TAX_CLASS_ID LEFT JOIN CUSTOMER customer17_ ON product0_.CUSTOMER_ID = customer17_.CUSTOMER_ID WHERE product0_.PRODUCT_ID = q1_i1 AND availabili1_.REGION IN (q1_i2, q1_i3) AND descriptio2_.LANGUAGE_ID = q1_i4 AND descriptio5_.LANGUAGE_ID = q1_i5 AND product0_.AVAILABLE = 1 AND product0_.DATE_AVAILABLE <= q1_i6;
SET M_I_RS_45_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6;

END $$
DELIMITER ;