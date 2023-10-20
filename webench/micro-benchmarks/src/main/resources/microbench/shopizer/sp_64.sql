DROP PROCEDURE IF EXISTS `MULTI_PATH_BENCH_VIEW_PRODUCT_64`;
DELIMITER $$
CREATE PROCEDURE MULTI_PATH_BENCH_VIEW_PRODUCT_64 (IN str VARCHAR(512))
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE q1_i2 INT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_10_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF SUBSTRING(str, 1, 1) > 0&&SUBSTRING(str, 1, 1) > -1&&SUBSTRING(str, 1, 1) > -2&&SUBSTRING(str, 1, 1) > -3&&SUBSTRING(str, 1, 1) > -4&&SUBSTRING(str, 1, 1) > -5&&SUBSTRING(str, 1, 1) > -6&&SUBSTRING(str, 1, 1) > -7&&SUBSTRING(str, 1, 1) > -8&&SUBSTRING(str, 1, 1) > -9&&SUBSTRING(str, 1, 1) > -10&&SUBSTRING(str, 1, 1) > -11&&SUBSTRING(str, 1, 1) > -12&&SUBSTRING(str, 1, 1) > -13&&SUBSTRING(str, 1, 1) > -14&&SUBSTRING(str, 1, 1) > -15&&SUBSTRING(str, 1, 1) > -16&&SUBSTRING(str, 1, 1) > -17&&SUBSTRING(str, 1, 1) > -18&&SUBSTRING(str, 1, 1) > -19&&SUBSTRING(str, 1, 1) > -20&&SUBSTRING(str, 1, 1) > -21&&SUBSTRING(str, 1, 1) > -22&&SUBSTRING(str, 1, 1) > -23&&SUBSTRING(str, 1, 1) > -24&&SUBSTRING(str, 1, 1) > -25&&SUBSTRING(str, 1, 1) > -26&&SUBSTRING(str, 1, 1) > -27&&SUBSTRING(str, 1, 1) > -28&&SUBSTRING(str, 1, 1) > -29&&SUBSTRING(str, 1, 1) > -30&&SUBSTRING(str, 1, 1) > -31&&SUBSTRING(str, 1, 1) > -32&&SUBSTRING(str, 1, 1) > -33&&SUBSTRING(str, 1, 1) > -34&&SUBSTRING(str, 1, 1) > -35&&SUBSTRING(str, 1, 1) > -36&&SUBSTRING(str, 1, 1) > -37&&SUBSTRING(str, 1, 1) > -38&&SUBSTRING(str, 1, 1) > -39&&SUBSTRING(str, 1, 1) > -40&&SUBSTRING(str, 1, 1) > -41&&SUBSTRING(str, 1, 1) > -42&&SUBSTRING(str, 1, 1) > -43&&SUBSTRING(str, 1, 1) > -44&&SUBSTRING(str, 1, 1) > -45&&SUBSTRING(str, 1, 1) > -46&&SUBSTRING(str, 1, 1) > -47&&SUBSTRING(str, 1, 1) > -48&&SUBSTRING(str, 1, 1) > -49&&SUBSTRING(str, 1, 1) > -50&&SUBSTRING(str, 1, 1) > -51&&SUBSTRING(str, 1, 1) > -52&&SUBSTRING(str, 1, 1) > -53&&SUBSTRING(str, 1, 1) > -54&&SUBSTRING(str, 1, 1) > -55&&SUBSTRING(str, 1, 1) > -56&&SUBSTRING(str, 1, 1) > -57&&SUBSTRING(str, 1, 1) > -58&&SUBSTRING(str, 1, 1) > -59&&SUBSTRING(str, 1, 1) > -60&&SUBSTRING(str, 1, 1) > -61&&SUBSTRING(str, 1, 1) > -62&&SUBSTRING(str, 1, 1) > -63 THEN
SET q1_i1 = SUBSTRING(str, 1, 1);
SET QUERY_ID_0 = 0;
SELECT DISTINCT product0_.PRODUCT_ID AS PRODUCT_1_44_0_, availabili1_.PRODUCT_AVAIL_ID AS PRODUCT_1_46_1_, prices7_.PRODUCT_PRICE_ID AS PRODUCT_1_59_2_, descriptio8_.DESCRIPTION_ID AS DESCRIPT1_60_3_, variants16_.PRODUCT_VARIANT_ID AS PRODUCT_1_66_4_ , productatt17_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_1_45_5_, merchantst2_.MERCHANT_ID AS MERCHANT1_29_6_, descriptio3_.DESCRIPTION_ID AS DESCRIPT1_48_7_, category5_.CATEGORY_ID AS CATEGORY1_2_8_, descriptio6_.DESCRIPTION_ID AS DESCRIPT1_3_9_ , images9_.PRODUCT_IMAGE_ID AS PRODUCT_1_50_10_, attributes10_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_1_45_11_, productopt11_.PRODUCT_OPTION_ID AS PRODUCT_1_54_12_, descriptio12_.DESCRIPTION_ID AS DESCRIPT1_55_13_, productopt13_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_1_57_14_ , descriptio14_.DESCRIPTION_ID AS DESCRIPT1_58_15_, relationsh15_.PRODUCT_RELATIONSHIP_ID AS PRODUCT_1_61_16_, manufactur18_.MANUFACTURER_ID AS MANUFACT1_24_17_, descriptio19_.DESCRIPTION_ID AS DESCRIPT1_25_18_, producttyp20_.PRODUCT_TYPE_ID AS PRODUCT_1_64_19_ , taxclass21_.TAX_CLASS_ID AS TAX_CLAS1_76_20_, customer22_.CUSTOMER_ID AS CUSTOMER1_9_21_, product0_.DATE_CREATED AS DATE_CRE2_44_0_, product0_.DATE_MODIFIED AS DATE_MOD3_44_0_, product0_.UPDT_ID AS UPDT_ID4_44_0_ , product0_.AVAILABLE AS AVAILABL5_44_0_, product0_.COND AS COND6_44_0_, product0_.DATE_AVAILABLE AS DATE_AVA7_44_0_, product0_.MANUFACTURER_ID AS MANUFAC25_44_0_, product0_.MERCHANT_ID AS MERCHAN26_44_0_ , product0_.CUSTOMER_ID AS CUSTOME27_44_0_, product0_.PREORDER AS PREORDER8_44_0_, product0_.PRODUCT_HEIGHT AS PRODUCT_9_44_0_, product0_.PRODUCT_FREE AS PRODUCT10_44_0_, product0_.PRODUCT_LENGTH AS PRODUCT11_44_0_ , product0_.QUANTITY_ORDERED AS QUANTIT12_44_0_, product0_.REVIEW_AVG AS REVIEW_13_44_0_, product0_.REVIEW_COUNT AS REVIEW_14_44_0_, product0_.PRODUCT_SHIP AS PRODUCT15_44_0_, product0_.PRODUCT_VIRTUAL AS PRODUCT16_44_0_ , product0_.PRODUCT_WEIGHT AS PRODUCT17_44_0_, product0_.PRODUCT_WIDTH AS PRODUCT18_44_0_, product0_.REF_SKU AS REF_SKU19_44_0_, product0_.RENTAL_DURATION AS RENTAL_20_44_0_, product0_.RENTAL_PERIOD AS RENTAL_21_44_0_ , product0_.RENTAL_STATUS AS RENTAL_22_44_0_, product0_.SKU AS SKU23_44_0_, product0_.SORT_ORDER AS SORT_OR24_44_0_, product0_.TAX_CLASS_ID AS TAX_CLA28_44_0_, product0_.PRODUCT_TYPE_ID AS PRODUCT29_44_0_ , availabili1_.DATE_CREATED AS DATE_CRE2_46_1_, availabili1_.DATE_MODIFIED AS DATE_MOD3_46_1_, availabili1_.UPDT_ID AS UPDT_ID4_46_1_, availabili1_.AVAILABLE AS AVAILABL5_46_1_, availabili1_.MERCHANT_ID AS MERCHAN15_46_1_ , availabili1_.OWNER AS OWNER6_46_1_, availabili1_.PRODUCT_ID AS PRODUCT16_46_1_, availabili1_.DATE_AVAILABLE AS DATE_AVA7_46_1_, availabili1_.FREE_SHIPPING AS FREE_SHI8_46_1_, availabili1_.QUANTITY AS QUANTITY9_46_1_ , availabili1_.QUANTITY_ORD_MAX AS QUANTIT10_46_1_, availabili1_.QUANTITY_ORD_MIN AS QUANTIT11_46_1_, availabili1_.STATUS AS STATUS12_46_1_, availabili1_.REGION AS REGION13_46_1_, availabili1_.REGION_VARIANT AS REGION_14_46_1_ , availabili1_.PRODUCT_ID AS PRODUCT16_46_0__, availabili1_.PRODUCT_AVAIL_ID AS PRODUCT_1_46_0__, prices7_.PRODUCT_PRICE_CODE AS PRODUCT_2_59_2_, prices7_.DEFAULT_PRICE AS DEFAULT_3_59_2_, prices7_.PRODUCT_AVAIL_ID AS PRODUCT_9_59_2_ , prices7_.PRODUCT_PRICE_AMOUNT AS PRODUCT_4_59_2_, prices7_.PRODUCT_PRICE_SPECIAL_AMOUNT AS PRODUCT_5_59_2_, prices7_.PRODUCT_PRICE_SPECIAL_END_DATE AS PRODUCT_6_59_2_, prices7_.PRODUCT_PRICE_SPECIAL_ST_DATE AS PRODUCT_7_59_2_, prices7_.PRODUCT_PRICE_TYPE AS PRODUCT_8_59_2_ , prices7_.PRODUCT_AVAIL_ID AS PRODUCT_9_59_1__, prices7_.PRODUCT_PRICE_ID AS PRODUCT_1_59_1__, descriptio8_.DATE_CREATED AS DATE_CRE2_60_3_, descriptio8_.DATE_MODIFIED AS DATE_MOD3_60_3_, descriptio8_.UPDT_ID AS UPDT_ID4_60_3_ , descriptio8_.DESCRIPTION AS DESCRIPT5_60_3_, descriptio8_.LANGUAGE_ID AS LANGUAGE9_60_3_, descriptio8_.NAME AS NAME6_60_3_, descriptio8_.TITLE AS TITLE7_60_3_, descriptio8_.PRICE_APPENDER AS PRICE_AP8_60_3_ , descriptio8_.PRODUCT_PRICE_ID AS PRODUCT10_60_3_, descriptio8_.PRODUCT_PRICE_ID AS PRODUCT10_60_2__, descriptio8_.DESCRIPTION_ID AS DESCRIPT1_60_2__, variants16_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_6_66_4_, variants16_.DATE_CREATED AS DATE_CRE2_66_4_ , variants16_.DATE_MODIFIED AS DATE_MOD3_66_4_, variants16_.UPDT_ID AS UPDT_ID4_66_4_, variants16_.PRODUCT_AVAIL_ID AS PRODUCT_7_66_4_, variants16_.PRODUCT_AQUANTITY AS PRODUCT_5_66_4_, variants16_.PRODUCT_AVAIL_ID AS PRODUCT_7_66_3__ , variants16_.PRODUCT_VARIANT_ID AS PRODUCT_1_66_3__, productatt17_.PRODUCT_ATTRIBUTE_DEFAULT AS PRODUCT_2_45_5_, productatt17_.PRODUCT_ATTRIBUTE_DISCOUNTED AS PRODUCT_3_45_5_, productatt17_.PRODUCT_ATTRIBUTE_FOR_DISP AS PRODUCT_4_45_5_, productatt17_.PRODUCT_ATTRIBUTE_REQUIRED AS PRODUCT_5_45_5_ , productatt17_.PRODUCT_ID AS PRODUCT10_45_5_, productatt17_.PRODUCT_ATTRIBUTE_FREE AS PRODUCT_6_45_5_, productatt17_.PRODUCT_ATRIBUTE_PRICE AS PRODUCT_7_45_5_, productatt17_.PRODUCT_ATTRIBUTE_WEIGHT AS PRODUCT_8_45_5_, productatt17_.OPTION_ID AS OPTION_11_45_5_ , productatt17_.PRODUCT_ATTRIBUTE_SORT_ORD AS PRODUCT_9_45_5_, productatt17_.OPTION_VALUE_ID AS OPTION_12_45_5_, merchantst2_.DATE_CREATED AS DATE_CRE2_29_6_, merchantst2_.DATE_MODIFIED AS DATE_MOD3_29_6_, merchantst2_.UPDT_ID AS UPDT_ID4_29_6_ , merchantst2_.STORE_CODE AS STORE_CO5_29_6_, merchantst2_.CONTINUESHOPPINGURL AS CONTINUE6_29_6_, merchantst2_.COUNTRY_ID AS COUNTRY24_29_6_, merchantst2_.CURRENCY_ID AS CURRENC25_29_6_, merchantst2_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_6_ , merchantst2_.LANGUAGE_ID AS LANGUAG26_29_6_, merchantst2_.DOMAIN_NAME AS DOMAIN_N8_29_6_, merchantst2_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_6_, merchantst2_.INVOICE_TEMPLATE AS INVOICE10_29_6_, merchantst2_.PARENT_ID AS PARENT_27_29_6_ , merchantst2_.IS_RETAILER AS IS_RETA11_29_6_, merchantst2_.SEIZEUNITCODE AS SEIZEUN12_29_6_, merchantst2_.STORE_EMAIL AS STORE_E13_29_6_, merchantst2_.STORE_LOGO AS STORE_L14_29_6_, merchantst2_.STORE_TEMPLATE AS STORE_T15_29_6_ , merchantst2_.STORE_ADDRESS AS STORE_A16_29_6_, merchantst2_.STORE_CITY AS STORE_C17_29_6_, merchantst2_.STORE_NAME AS STORE_N18_29_6_, merchantst2_.STORE_PHONE AS STORE_P19_29_6_, merchantst2_.STORE_POSTAL_CODE AS STORE_P20_29_6_ , merchantst2_.STORE_STATE_PROV AS STORE_S21_29_6_, merchantst2_.USE_CACHE AS USE_CAC22_29_6_, merchantst2_.WEIGHTUNITCODE AS WEIGHTU23_29_6_, merchantst2_.ZONE_ID AS ZONE_ID28_29_6_, descriptio3_.DATE_CREATED AS DATE_CRE2_48_7_ , descriptio3_.DATE_MODIFIED AS DATE_MOD3_48_7_, descriptio3_.UPDT_ID AS UPDT_ID4_48_7_, descriptio3_.DESCRIPTION AS DESCRIPT5_48_7_, descriptio3_.LANGUAGE_ID AS LANGUAG14_48_7_, descriptio3_.NAME AS NAME6_48_7_ , descriptio3_.TITLE AS TITLE7_48_7_, descriptio3_.META_DESCRIPTION AS META_DES8_48_7_, descriptio3_.META_KEYWORDS AS META_KEY9_48_7_, descriptio3_.META_TITLE AS META_TI10_48_7_, descriptio3_.PRODUCT_ID AS PRODUCT15_48_7_ , descriptio3_.DOWNLOAD_LNK AS DOWNLOA11_48_7_, descriptio3_.PRODUCT_HIGHLIGHT AS PRODUCT12_48_7_, descriptio3_.SEF_URL AS SEF_URL13_48_7_, descriptio3_.PRODUCT_ID AS PRODUCT15_48_4__, descriptio3_.DESCRIPTION_ID AS DESCRIPT1_48_4__ , category5_.DATE_CREATED AS DATE_CRE2_2_8_, category5_.DATE_MODIFIED AS DATE_MOD3_2_8_, category5_.UPDT_ID AS UPDT_ID4_2_8_, category5_.CATEGORY_IMAGE AS CATEGORY5_2_8_, category5_.CATEGORY_STATUS AS CATEGORY6_2_8_ , category5_.CODE AS CODE7_2_8_, category5_.DEPTH AS DEPTH8_2_8_, category5_.FEATURED AS FEATURED9_2_8_, category5_.LINEAGE AS LINEAGE10_2_8_, category5_.MERCHANT_ID AS MERCHAN13_2_8_ , category5_.PARENT_ID AS PARENT_14_2_8_, category5_.SORT_ORDER AS SORT_OR11_2_8_, category5_.VISIBLE AS VISIBLE12_2_8_, categories4_.PRODUCT_ID AS PRODUCT_1_47_5__, categories4_.CATEGORY_ID AS CATEGORY2_47_5__ , descriptio6_.DATE_CREATED AS DATE_CRE2_3_9_, descriptio6_.DATE_MODIFIED AS DATE_MOD3_3_9_, descriptio6_.UPDT_ID AS UPDT_ID4_3_9_, descriptio6_.DESCRIPTION AS DESCRIPT5_3_9_, descriptio6_.LANGUAGE_ID AS LANGUAG13_3_9_ , descriptio6_.NAME AS NAME6_3_9_, descriptio6_.TITLE AS TITLE7_3_9_, descriptio6_.CATEGORY_ID AS CATEGOR14_3_9_, descriptio6_.CATEGORY_HIGHLIGHT AS CATEGORY8_3_9_, descriptio6_.META_DESCRIPTION AS META_DES9_3_9_ , descriptio6_.META_KEYWORDS AS META_KE10_3_9_, descriptio6_.META_TITLE AS META_TI11_3_9_, descriptio6_.SEF_URL AS SEF_URL12_3_9_, descriptio6_.CATEGORY_ID AS CATEGOR14_3_6__, descriptio6_.DESCRIPTION_ID AS DESCRIPT1_3_6__ , images9_.DEFAULT_IMAGE AS DEFAULT_2_50_10_, images9_.IMAGE_CROP AS IMAGE_CR3_50_10_, images9_.IMAGE_TYPE AS IMAGE_TY4_50_10_, images9_.PRODUCT_ID AS PRODUCT_7_50_10_, images9_.PRODUCT_IMAGE AS PRODUCT_5_50_10_ , images9_.PRODUCT_IMAGE_URL AS PRODUCT_6_50_10_, images9_.PRODUCT_ID AS PRODUCT_7_50_7__, images9_.PRODUCT_IMAGE_ID AS PRODUCT_1_50_7__, attributes10_.PRODUCT_ATTRIBUTE_DEFAULT AS PRODUCT_2_45_11_, attributes10_.PRODUCT_ATTRIBUTE_DISCOUNTED AS PRODUCT_3_45_11_ , attributes10_.PRODUCT_ATTRIBUTE_FOR_DISP AS PRODUCT_4_45_11_, attributes10_.PRODUCT_ATTRIBUTE_REQUIRED AS PRODUCT_5_45_11_, attributes10_.PRODUCT_ID AS PRODUCT10_45_11_, attributes10_.PRODUCT_ATTRIBUTE_FREE AS PRODUCT_6_45_11_, attributes10_.PRODUCT_ATRIBUTE_PRICE AS PRODUCT_7_45_11_ , attributes10_.PRODUCT_ATTRIBUTE_WEIGHT AS PRODUCT_8_45_11_, attributes10_.OPTION_ID AS OPTION_11_45_11_, attributes10_.PRODUCT_ATTRIBUTE_SORT_ORD AS PRODUCT_9_45_11_, attributes10_.OPTION_VALUE_ID AS OPTION_12_45_11_, attributes10_.PRODUCT_ID AS PRODUCT10_45_8__ , attributes10_.PRODUCT_ATTRIBUTE_ID AS PRODUCT_1_45_8__, productopt11_.PRODUCT_OPTION_CODE AS PRODUCT_2_54_12_, productopt11_.MERCHANT_ID AS MERCHANT6_54_12_, productopt11_.PRODUCT_OPTION_SORT_ORD AS PRODUCT_3_54_12_, productopt11_.PRODUCT_OPTION_TYPE AS PRODUCT_4_54_12_ , productopt11_.PRODUCT_OPTION_READ AS PRODUCT_5_54_12_, descriptio12_.DATE_CREATED AS DATE_CRE2_55_13_, descriptio12_.DATE_MODIFIED AS DATE_MOD3_55_13_, descriptio12_.UPDT_ID AS UPDT_ID4_55_13_, descriptio12_.DESCRIPTION AS DESCRIPT5_55_13_ , descriptio12_.LANGUAGE_ID AS LANGUAGE9_55_13_, descriptio12_.NAME AS NAME6_55_13_, descriptio12_.TITLE AS TITLE7_55_13_, descriptio12_.PRODUCT_OPTION_ID AS PRODUCT10_55_13_, descriptio12_.PRODUCT_OPTION_COMMENT AS PRODUCT_8_55_13_ , descriptio12_.PRODUCT_OPTION_ID AS PRODUCT10_55_9__, descriptio12_.DESCRIPTION_ID AS DESCRIPT1_55_9__, productopt13_.PRODUCT_OPTION_VAL_CODE AS PRODUCT_2_57_14_, productopt13_.MERCHANT_ID AS MERCHANT6_57_14_, productopt13_.PRODUCT_OPT_FOR_DISP AS PRODUCT_3_57_14_ , productopt13_.PRODUCT_OPT_VAL_IMAGE AS PRODUCT_4_57_14_, productopt13_.PRODUCT_OPT_VAL_SORT_ORD AS PRODUCT_5_57_14_, descriptio14_.DATE_CREATED AS DATE_CRE2_58_15_, descriptio14_.DATE_MODIFIED AS DATE_MOD3_58_15_, descriptio14_.UPDT_ID AS UPDT_ID4_58_15_ , descriptio14_.DESCRIPTION AS DESCRIPT5_58_15_, descriptio14_.LANGUAGE_ID AS LANGUAGE8_58_15_, descriptio14_.NAME AS NAME6_58_15_, descriptio14_.TITLE AS TITLE7_58_15_, descriptio14_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_9_58_15_ , descriptio14_.PRODUCT_OPTION_VALUE_ID AS PRODUCT_9_58_10__, descriptio14_.DESCRIPTION_ID AS DESCRIPT1_58_10__, relationsh15_.ACTIVE AS ACTIVE2_61_16_, relationsh15_.CODE AS CODE3_61_16_, relationsh15_.PRODUCT_ID AS PRODUCT_4_61_16_ , relationsh15_.RELATED_PRODUCT_ID AS RELATED_5_61_16_, relationsh15_.MERCHANT_ID AS MERCHANT6_61_16_, relationsh15_.PRODUCT_ID AS PRODUCT_4_61_11__, relationsh15_.PRODUCT_RELATIONSHIP_ID AS PRODUCT_1_61_11__, manufactur18_.DATE_CREATED AS DATE_CRE2_24_17_ , manufactur18_.DATE_MODIFIED AS DATE_MOD3_24_17_, manufactur18_.UPDT_ID AS UPDT_ID4_24_17_, manufactur18_.CODE AS CODE5_24_17_, manufactur18_.MANUFACTURER_IMAGE AS MANUFACT6_24_17_, manufactur18_.MERCHANT_ID AS MERCHANT8_24_17_ , manufactur18_.SORT_ORDER AS SORT_ORD7_24_17_, descriptio19_.DATE_CREATED AS DATE_CRE2_25_18_, descriptio19_.DATE_MODIFIED AS DATE_MOD3_25_18_, descriptio19_.UPDT_ID AS UPDT_ID4_25_18_, descriptio19_.DESCRIPTION AS DESCRIPT5_25_18_ , descriptio19_.LANGUAGE_ID AS LANGUAG11_25_18_, descriptio19_.NAME AS NAME6_25_18_, descriptio19_.TITLE AS TITLE7_25_18_, descriptio19_.DATE_LAST_CLICK AS DATE_LAS8_25_18_, descriptio19_.MANUFACTURER_ID AS MANUFAC12_25_18_ , descriptio19_.MANUFACTURERS_URL AS MANUFACT9_25_18_, descriptio19_.URL_CLICKED AS URL_CLI10_25_18_, descriptio19_.MANUFACTURER_ID AS MANUFAC12_25_12__, descriptio19_.DESCRIPTION_ID AS DESCRIPT1_25_12__, producttyp20_.PRD_TYPE_ADD_TO_CART AS PRD_TYPE2_64_19_ , producttyp20_.DATE_CREATED AS DATE_CRE3_64_19_, producttyp20_.DATE_MODIFIED AS DATE_MOD4_64_19_, producttyp20_.UPDT_ID AS UPDT_ID5_64_19_, producttyp20_.PRD_TYPE_CODE AS PRD_TYPE6_64_19_, producttyp20_.MERCHANT_ID AS MERCHANT7_64_19_ , taxclass21_.TAX_CLASS_CODE AS TAX_CLAS2_76_20_, taxclass21_.MERCHANT_ID AS MERCHANT4_76_20_, taxclass21_.TAX_CLASS_TITLE AS TAX_CLAS3_76_20_, customer22_.CUSTOMER_ANONYMOUS AS CUSTOMER2_9_21_, customer22_.DATE_CREATED AS DATE_CRE3_9_21_ , customer22_.DATE_MODIFIED AS DATE_MOD4_9_21_, customer22_.UPDT_ID AS UPDT_ID5_9_21_, customer22_.BILLING_STREET_ADDRESS AS BILLING_6_9_21_, customer22_.BILLING_CITY AS BILLING_7_9_21_, customer22_.BILLING_COMPANY AS BILLING_8_9_21_ , customer22_.BILLING_COUNTRY_ID AS BILLING33_9_21_, customer22_.BILLING_FIRST_NAME AS BILLING_9_9_21_, customer22_.BILLING_LAST_NAME AS BILLING10_9_21_, customer22_.LATITUDE AS LATITUD11_9_21_, customer22_.LONGITUDE AS LONGITU12_9_21_ , customer22_.BILLING_POSTCODE AS BILLING13_9_21_, customer22_.BILLING_STATE AS BILLING14_9_21_, customer22_.BILLING_TELEPHONE AS BILLING15_9_21_, customer22_.BILLING_ZONE_ID AS BILLING34_9_21_, customer22_.CUSTOMER_COMPANY AS CUSTOME16_9_21_ , customer22_.REVIEW_AVG AS REVIEW_17_9_21_, customer22_.REVIEW_COUNT AS REVIEW_18_9_21_, customer22_.CUSTOMER_DOB AS CUSTOME19_9_21_, customer22_.LANGUAGE_ID AS LANGUAG35_9_21_, customer22_.DELIVERY_STREET_ADDRESS AS DELIVER20_9_21_ , customer22_.DELIVERY_CITY AS DELIVER21_9_21_, customer22_.DELIVERY_COMPANY AS DELIVER22_9_21_, customer22_.DELIVERY_COUNTRY_ID AS DELIVER36_9_21_, customer22_.DELIVERY_FIRST_NAME AS DELIVER23_9_21_, customer22_.DELIVERY_LAST_NAME AS DELIVER24_9_21_ , customer22_.DELIVERY_POSTCODE AS DELIVER25_9_21_, customer22_.DELIVERY_STATE AS DELIVER26_9_21_, customer22_.DELIVERY_TELEPHONE AS DELIVER27_9_21_, customer22_.DELIVERY_ZONE_ID AS DELIVER37_9_21_, customer22_.CUSTOMER_EMAIL_ADDRESS AS CUSTOME28_9_21_ , customer22_.CUSTOMER_GENDER AS CUSTOME29_9_21_, customer22_.MERCHANT_ID AS MERCHAN38_9_21_, customer22_.CUSTOMER_NICK AS CUSTOME30_9_21_, customer22_.CUSTOMER_PASSWORD AS CUSTOME31_9_21_, customer22_.PROVIDER AS PROVIDE32_9_21_ FROM PRODUCT product0_ INNER JOIN PRODUCT_AVAILABILITY availabili1_ ON product0_.PRODUCT_ID = availabili1_.PRODUCT_ID LEFT JOIN PRODUCT_PRICE prices7_ ON availabili1_.PRODUCT_AVAIL_ID = prices7_.PRODUCT_AVAIL_ID LEFT JOIN PRODUCT_PRICE_DESCRIPTION descriptio8_ ON prices7_.PRODUCT_PRICE_ID = descriptio8_.PRODUCT_PRICE_ID LEFT JOIN PRODUCT_VARIANT variants16_ ON availabili1_.PRODUCT_AVAIL_ID = variants16_.PRODUCT_AVAIL_ID LEFT JOIN PRODUCT_ATTRIBUTE productatt17_ ON variants16_.PRODUCT_ATTRIBUTE_ID = productatt17_.PRODUCT_ATTRIBUTE_ID INNER JOIN MERCHANT_STORE merchantst2_ ON product0_.MERCHANT_ID = merchantst2_.MERCHANT_ID INNER JOIN PRODUCT_DESCRIPTION descriptio3_ ON product0_.PRODUCT_ID = descriptio3_.PRODUCT_ID LEFT JOIN PRODUCT_CATEGORY categories4_ ON product0_.PRODUCT_ID = categories4_.PRODUCT_ID LEFT JOIN CATEGORY category5_ ON categories4_.CATEGORY_ID = category5_.CATEGORY_ID LEFT JOIN CATEGORY_DESCRIPTION descriptio6_ ON category5_.CATEGORY_ID = descriptio6_.CATEGORY_ID LEFT JOIN PRODUCT_IMAGE images9_ ON product0_.PRODUCT_ID = images9_.PRODUCT_ID LEFT JOIN PRODUCT_ATTRIBUTE attributes10_ ON product0_.PRODUCT_ID = attributes10_.PRODUCT_ID LEFT JOIN PRODUCT_OPTION productopt11_ ON attributes10_.OPTION_ID = productopt11_.PRODUCT_OPTION_ID LEFT JOIN PRODUCT_OPTION_DESC descriptio12_ ON productopt11_.PRODUCT_OPTION_ID = descriptio12_.PRODUCT_OPTION_ID LEFT JOIN PRODUCT_OPTION_VALUE productopt13_ ON attributes10_.OPTION_VALUE_ID = productopt13_.PRODUCT_OPTION_VALUE_ID LEFT JOIN PRODUCT_OPTION_VALUE_DESCRIPTION descriptio14_ ON productopt13_.PRODUCT_OPTION_VALUE_ID = descriptio14_.PRODUCT_OPTION_VALUE_ID LEFT JOIN PRODUCT_RELATIONSHIP relationsh15_ ON product0_.PRODUCT_ID = relationsh15_.PRODUCT_ID LEFT JOIN MANUFACTURER manufactur18_ ON product0_.MANUFACTURER_ID = manufactur18_.MANUFACTURER_ID LEFT JOIN MANUFACTURER_DESCRIPTION descriptio19_ ON manufactur18_.MANUFACTURER_ID = descriptio19_.MANUFACTURER_ID LEFT JOIN PRODUCT_TYPE producttyp20_ ON product0_.PRODUCT_TYPE_ID = producttyp20_.PRODUCT_TYPE_ID LEFT JOIN TAX_CLASS taxclass21_ ON product0_.TAX_CLASS_ID = taxclass21_.TAX_CLASS_ID LEFT JOIN CUSTOMER customer22_ ON product0_.CUSTOMER_ID = customer22_.CUSTOMER_ID WHERE product0_.PRODUCT_ID = q1_i1 AND merchantst2_.MERCHANT_ID = q1_i1;
SET M_I_RS_10_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2;

END $$
DELIMITER ;
