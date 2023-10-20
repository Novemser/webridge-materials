DROP PROCEDURE IF EXISTS `CodPayment_sp_67_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_67_ver0 (IN RS_q72_r1_col3 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_74_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q72_r1_col3;
SET QUERY_ID_0 = 0;
SELECT fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM8_68_0_, fulfillmen0_.FULFILLMENT_GROUP_ITEM_ID AS FULFILLM1_68_0_, fulfillmen0_.FULFILLMENT_GROUP_ITEM_ID AS FULFILLM1_68_1_, fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM8_68_1_, fulfillmen0_.ORDER_ITEM_ID AS ORDER_IT9_68_1_ , fulfillmen0_.PRORATED_ORDER_ADJ AS PRORATED2_68_1_, fulfillmen0_.QUANTITY AS QUANTITY3_68_1_, fulfillmen0_.STATUS AS STATUS4_68_1_, fulfillmen0_.TOTAL_ITEM_AMOUNT AS TOTAL_IT5_68_1_, fulfillmen0_.TOTAL_ITEM_TAXABLE_AMOUNT AS TOTAL_IT6_68_1_ , fulfillmen0_.TOTAL_ITEM_TAX AS TOTAL_IT7_68_1_, orderitemi1_.ORDER_ITEM_ID AS ORDER_IT1_96_2_, orderitemi1_.CREATED_BY AS CREATED_2_96_2_, orderitemi1_.DATE_CREATED AS DATE_CRE3_96_2_, orderitemi1_.DATE_UPDATED AS DATE_UPD4_96_2_ , orderitemi1_.UPDATED_BY AS UPDATED_5_96_2_, orderitemi1_.CATEGORY_ID AS CATEGOR18_96_2_, orderitemi1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_2_, orderitemi1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_2_, orderitemi1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_2_ , orderitemi1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_2_, orderitemi1_.NAME AS NAME9_96_2_, orderitemi1_.ORDER_ID AS ORDER_I20_96_2_, orderitemi1_.ORDER_ITEM_TYPE AS ORDER_I10_96_2_, orderitemi1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_2_ , orderitemi1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_2_, orderitemi1_.PRICE AS PRICE11_96_2_, orderitemi1_.QUANTITY AS QUANTIT12_96_2_, orderitemi1_.RETAIL_PRICE AS RETAIL_13_96_2_, orderitemi1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_2_ , orderitemi1_.SALE_PRICE AS SALE_PR15_96_2_, orderitemi1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_2_, orderitemi1_.TOTAL_TAX AS TOTAL_T17_96_2_, orderitemi1_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_2_, orderitemi1_1_.BASE_SALE_PRICE AS BASE_SAL2_18_2_ , orderitemi1_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_2_, orderitemi1_1_.SKU_ID AS SKU_ID5_18_2_, orderitemi1_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_2_, orderitemi1_2_.BASE_SALE_PRICE AS BASE_SAL2_52_2_, orderitemi1_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_2_ , orderitemi1_2_.PRODUCT_ID AS PRODUCT_5_52_2_, orderitemi1_2_.SKU_ID AS SKU_ID6_52_2_, orderitemi1_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_2_ , CASE  WHEN orderitemi1_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitemi1_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitemi1_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitemi1_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitemi1_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_2_, orderimpl2_.ORDER_ID AS ORDER_ID1_93_3_, orderimpl2_.CREATED_BY AS CREATED_2_93_3_, orderimpl2_.DATE_CREATED AS DATE_CRE3_93_3_, orderimpl2_.DATE_UPDATED AS DATE_UPD4_93_3_ , orderimpl2_.UPDATED_BY AS UPDATED_5_93_3_, orderimpl2_.CURRENCY_CODE AS CURRENC17_93_3_, orderimpl2_.CUSTOMER_ID AS CUSTOME18_93_3_, orderimpl2_.EMAIL_ADDRESS AS EMAIL_AD6_93_3_, orderimpl2_.LOCALE_CODE AS LOCALE_19_93_3_ , orderimpl2_.NAME AS NAME7_93_3_, orderimpl2_.ORDER_NUMBER AS ORDER_NU8_93_3_, orderimpl2_.IS_PREVIEW AS IS_PREVI9_93_3_, orderimpl2_.ORDER_STATUS AS ORDER_S10_93_3_, orderimpl2_.ORDER_SUBTOTAL AS ORDER_S11_93_3_ , orderimpl2_.SUBMIT_DATE AS SUBMIT_12_93_3_, orderimpl2_.TAX_OVERRIDE AS TAX_OVE13_93_3_, orderimpl2_.ORDER_TOTAL AS ORDER_T14_93_3_, orderimpl2_.TOTAL_SHIPPING AS TOTAL_S15_93_3_, orderimpl2_.TOTAL_TAX AS TOTAL_T16_93_3_ , orderitemi3_.ORDER_ITEM_ID AS ORDER_IT1_96_4_, orderitemi3_.CREATED_BY AS CREATED_2_96_4_, orderitemi3_.DATE_CREATED AS DATE_CRE3_96_4_, orderitemi3_.DATE_UPDATED AS DATE_UPD4_96_4_, orderitemi3_.UPDATED_BY AS UPDATED_5_96_4_ , orderitemi3_.CATEGORY_ID AS CATEGOR18_96_4_, orderitemi3_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_4_, orderitemi3_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_4_, orderitemi3_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_4_, orderitemi3_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_4_ , orderitemi3_.NAME AS NAME9_96_4_, orderitemi3_.ORDER_ID AS ORDER_I20_96_4_, orderitemi3_.ORDER_ITEM_TYPE AS ORDER_I10_96_4_, orderitemi3_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_4_, orderitemi3_.PERSONAL_MESSAGE_ID AS PERSONA22_96_4_ , orderitemi3_.PRICE AS PRICE11_96_4_, orderitemi3_.QUANTITY AS QUANTIT12_96_4_, orderitemi3_.RETAIL_PRICE AS RETAIL_13_96_4_, orderitemi3_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_4_, orderitemi3_.SALE_PRICE AS SALE_PR15_96_4_ , orderitemi3_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_4_, orderitemi3_.TOTAL_TAX AS TOTAL_T17_96_4_, orderitemi3_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_4_, orderitemi3_1_.BASE_SALE_PRICE AS BASE_SAL2_18_4_, orderitemi3_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_4_ , orderitemi3_1_.SKU_ID AS SKU_ID5_18_4_, orderitemi3_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_4_, orderitemi3_2_.BASE_SALE_PRICE AS BASE_SAL2_52_4_, orderitemi3_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_4_, orderitemi3_2_.PRODUCT_ID AS PRODUCT_5_52_4_ , orderitemi3_2_.SKU_ID AS SKU_ID6_52_4_, orderitemi3_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_4_ , CASE  WHEN orderitemi3_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitemi3_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitemi3_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitemi3_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitemi3_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_4_, personalme4_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_5_, personalme4_.MESSAGE AS MESSAGE2_116_5_, personalme4_.MESSAGE_FROM AS MESSAGE_3_116_5_, personalme4_.MESSAGE_TO AS MESSAGE_4_116_5_ , personalme4_.OCCASION AS OCCASION5_116_5_, bundleorde5_.ORDER_ITEM_ID AS ORDER_IT1_96_6_, bundleorde5_1_.CREATED_BY AS CREATED_2_96_6_, bundleorde5_1_.DATE_CREATED AS DATE_CRE3_96_6_, bundleorde5_1_.DATE_UPDATED AS DATE_UPD4_96_6_ , bundleorde5_1_.UPDATED_BY AS UPDATED_5_96_6_, bundleorde5_1_.CATEGORY_ID AS CATEGOR18_96_6_, bundleorde5_1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_6_, bundleorde5_1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_6_, bundleorde5_1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_6_ , bundleorde5_1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_6_, bundleorde5_1_.NAME AS NAME9_96_6_, bundleorde5_1_.ORDER_ID AS ORDER_I20_96_6_, bundleorde5_1_.ORDER_ITEM_TYPE AS ORDER_I10_96_6_, bundleorde5_1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_6_ , bundleorde5_1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_6_, bundleorde5_1_.PRICE AS PRICE11_96_6_, bundleorde5_1_.QUANTITY AS QUANTIT12_96_6_, bundleorde5_1_.RETAIL_PRICE AS RETAIL_13_96_6_, bundleorde5_1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_6_ , bundleorde5_1_.SALE_PRICE AS SALE_PR15_96_6_, bundleorde5_1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_6_, bundleorde5_1_.TOTAL_TAX AS TOTAL_T17_96_6_, bundleorde5_.BASE_RETAIL_PRICE AS BASE_RET1_18_6_, bundleorde5_.BASE_SALE_PRICE AS BASE_SAL2_18_6_ , bundleorde5_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_6_, bundleorde5_.SKU_ID AS SKU_ID5_18_6_, skubundlei6_.SKU_BUNDLE_ITEM_ID AS SKU_BUND1_163_7_, skubundlei6_.PRODUCT_BUNDLE_ID AS PRODUCT_5_163_7_, skubundlei6_.ITEM_SALE_PRICE AS ITEM_SAL2_163_7_ , skubundlei6_.QUANTITY AS QUANTITY3_163_7_, skubundlei6_.SEQUENCE AS SEQUENCE4_163_7_, skubundlei6_.SKU_ID AS SKU_ID6_163_7_ FROM BLC_FULFILLMENT_GROUP_ITEM fulfillmen0_ LEFT JOIN BLC_ORDER_ITEM orderitemi1_ ON fulfillmen0_.ORDER_ITEM_ID = orderitemi1_.ORDER_ITEM_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitemi1_1_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitemi1_2_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitemi1_3_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitemi1_4_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_4_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER orderimpl2_ ON orderitemi1_.ORDER_ID = orderimpl2_.ORDER_ID LEFT JOIN BLC_ORDER_ITEM orderitemi3_ ON orderitemi1_.PARENT_ORDER_ITEM_ID = orderitemi3_.ORDER_ITEM_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitemi3_1_ ON orderitemi3_.ORDER_ITEM_ID = orderitemi3_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitemi3_2_ ON orderitemi3_.ORDER_ITEM_ID = orderitemi3_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitemi3_3_ ON orderitemi3_.ORDER_ITEM_ID = orderitemi3_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitemi3_4_ ON orderitemi3_.ORDER_ITEM_ID = orderitemi3_4_.ORDER_ITEM_ID LEFT JOIN BLC_PERSONAL_MESSAGE personalme4_ ON orderitemi1_.PERSONAL_MESSAGE_ID = personalme4_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM bundleorde5_ ON orderitemi1_2_.BUNDLE_ORDER_ITEM_ID = bundleorde5_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM bundleorde5_1_ ON bundleorde5_.ORDER_ITEM_ID = bundleorde5_1_.ORDER_ITEM_ID LEFT JOIN BLC_SKU_BUNDLE_ITEM skubundlei6_ ON orderitemi1_2_.SKU_BUNDLE_ITEM_ID = skubundlei6_.SKU_BUNDLE_ITEM_ID WHERE fulfillmen0_.FULFILLMENT_GROUP_ID = q1_i1;
SET M_I_RS_74_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;