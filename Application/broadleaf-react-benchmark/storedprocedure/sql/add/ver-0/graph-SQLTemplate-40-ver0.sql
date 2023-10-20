SqlNo=43
SQLNode {
    sqlTemplate='SELECT orderitems0_.ORDER_ID AS ORDER_I20_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_1_, orderitems0_.CREATED_BY AS CREATED_2_96_1_, orderitems0_.DATE_CREATED AS DATE_CRE3_96_1_ , orderitems0_.DATE_UPDATED AS DATE_UPD4_96_1_, orderitems0_.UPDATED_BY AS UPDATED_5_96_1_, orderitems0_.CATEGORY_ID AS CATEGOR18_96_1_, orderitems0_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_1_, orderitems0_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_1_ , orderitems0_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_1_, orderitems0_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_1_, orderitems0_.NAME AS NAME9_96_1_, orderitems0_.ORDER_ID AS ORDER_I20_96_1_, orderitems0_.ORDER_ITEM_TYPE AS ORDER_I10_96_1_ , orderitems0_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_1_, orderitems0_.PERSONAL_MESSAGE_ID AS PERSONA22_96_1_, orderitems0_.PRICE AS PRICE11_96_1_, orderitems0_.QUANTITY AS QUANTIT12_96_1_, orderitems0_.RETAIL_PRICE AS RETAIL_13_96_1_ , orderitems0_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_1_, orderitems0_.SALE_PRICE AS SALE_PR15_96_1_, orderitems0_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_1_, orderitems0_.TOTAL_TAX AS TOTAL_T17_96_1_, orderitems0_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_1_ , orderitems0_1_.BASE_SALE_PRICE AS BASE_SAL2_18_1_, orderitems0_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_1_, orderitems0_1_.SKU_ID AS SKU_ID5_18_1_, orderitems0_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_1_, orderitems0_2_.BASE_SALE_PRICE AS BASE_SAL2_52_1_ , orderitems0_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_1_, orderitems0_2_.PRODUCT_ID AS PRODUCT_5_52_1_, orderitems0_2_.SKU_ID AS SKU_ID6_52_1_, orderitems0_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_1_ , CASE  WHEN orderitems0_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitems0_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitems0_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitems0_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitems0_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_1_, orderitemi1_.ORDER_ITEM_ID AS ORDER_IT1_96_2_, orderitemi1_.CREATED_BY AS CREATED_2_96_2_, orderitemi1_.DATE_CREATED AS DATE_CRE3_96_2_, orderitemi1_.DATE_UPDATED AS DATE_UPD4_96_2_ , orderitemi1_.UPDATED_BY AS UPDATED_5_96_2_, orderitemi1_.CATEGORY_ID AS CATEGOR18_96_2_, orderitemi1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_2_, orderitemi1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_2_, orderitemi1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_2_ , orderitemi1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_2_, orderitemi1_.NAME AS NAME9_96_2_, orderitemi1_.ORDER_ID AS ORDER_I20_96_2_, orderitemi1_.ORDER_ITEM_TYPE AS ORDER_I10_96_2_, orderitemi1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_2_ , orderitemi1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_2_, orderitemi1_.PRICE AS PRICE11_96_2_, orderitemi1_.QUANTITY AS QUANTIT12_96_2_, orderitemi1_.RETAIL_PRICE AS RETAIL_13_96_2_, orderitemi1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_2_ , orderitemi1_.SALE_PRICE AS SALE_PR15_96_2_, orderitemi1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_2_, orderitemi1_.TOTAL_TAX AS TOTAL_T17_96_2_, orderitemi1_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_2_, orderitemi1_1_.BASE_SALE_PRICE AS BASE_SAL2_18_2_ , orderitemi1_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_2_, orderitemi1_1_.SKU_ID AS SKU_ID5_18_2_, orderitemi1_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_2_, orderitemi1_2_.BASE_SALE_PRICE AS BASE_SAL2_52_2_, orderitemi1_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_2_ , orderitemi1_2_.PRODUCT_ID AS PRODUCT_5_52_2_, orderitemi1_2_.SKU_ID AS SKU_ID6_52_2_, orderitemi1_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_2_ , CASE  WHEN orderitemi1_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitemi1_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitemi1_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitemi1_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitemi1_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_2_, personalme2_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_3_, personalme2_.MESSAGE AS MESSAGE2_116_3_, personalme2_.MESSAGE_FROM AS MESSAGE_3_116_3_, personalme2_.MESSAGE_TO AS MESSAGE_4_116_3_ , personalme2_.OCCASION AS OCCASION5_116_3_, bundleorde3_.ORDER_ITEM_ID AS ORDER_IT1_96_4_, bundleorde3_1_.CREATED_BY AS CREATED_2_96_4_, bundleorde3_1_.DATE_CREATED AS DATE_CRE3_96_4_, bundleorde3_1_.DATE_UPDATED AS DATE_UPD4_96_4_ , bundleorde3_1_.UPDATED_BY AS UPDATED_5_96_4_, bundleorde3_1_.CATEGORY_ID AS CATEGOR18_96_4_, bundleorde3_1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_4_, bundleorde3_1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_4_, bundleorde3_1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_4_ , bundleorde3_1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_4_, bundleorde3_1_.NAME AS NAME9_96_4_, bundleorde3_1_.ORDER_ID AS ORDER_I20_96_4_, bundleorde3_1_.ORDER_ITEM_TYPE AS ORDER_I10_96_4_, bundleorde3_1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_4_ , bundleorde3_1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_4_, bundleorde3_1_.PRICE AS PRICE11_96_4_, bundleorde3_1_.QUANTITY AS QUANTIT12_96_4_, bundleorde3_1_.RETAIL_PRICE AS RETAIL_13_96_4_, bundleorde3_1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_4_ , bundleorde3_1_.SALE_PRICE AS SALE_PR15_96_4_, bundleorde3_1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_4_, bundleorde3_1_.TOTAL_TAX AS TOTAL_T17_96_4_, bundleorde3_.BASE_RETAIL_PRICE AS BASE_RET1_18_4_, bundleorde3_.BASE_SALE_PRICE AS BASE_SAL2_18_4_ , bundleorde3_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_4_, bundleorde3_.SKU_ID AS SKU_ID5_18_4_, skubundlei4_.SKU_BUNDLE_ITEM_ID AS SKU_BUND1_163_5_, skubundlei4_.PRODUCT_BUNDLE_ID AS PRODUCT_5_163_5_, skubundlei4_.ITEM_SALE_PRICE AS ITEM_SAL2_163_5_ , skubundlei4_.QUANTITY AS QUANTITY3_163_5_, skubundlei4_.SEQUENCE AS SEQUENCE4_163_5_, skubundlei4_.SKU_ID AS SKU_ID6_163_5_ FROM BLC_ORDER_ITEM orderitems0_ LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitems0_1_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitems0_2_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitems0_3_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitems0_4_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_4_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM orderitemi1_ ON orderitems0_.PARENT_ORDER_ITEM_ID = orderitemi1_.ORDER_ITEM_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitemi1_1_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitemi1_2_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitemi1_3_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitemi1_4_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_4_.ORDER_ITEM_ID LEFT JOIN BLC_PERSONAL_MESSAGE personalme2_ ON orderitemi1_.PERSONAL_MESSAGE_ID = personalme2_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM bundleorde3_ ON orderitemi1_2_.BUNDLE_ORDER_ITEM_ID = bundleorde3_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM bundleorde3_1_ ON bundleorde3_.ORDER_ITEM_ID = bundleorde3_1_.ORDER_ITEM_ID LEFT JOIN BLC_SKU_BUNDLE_ITEM skubundlei4_ ON orderitemi1_2_.SKU_BUNDLE_ITEM_ID = skubundlei4_.SKU_BUNDLE_ITEM_ID WHERE orderitems0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderitems0_.order_id:BIGINT, orderitems0_.order_item_id:BIGINT, orderitems0_.order_item_id:BIGINT, orderitems0_.created_by:BIGINT, orderitems0_.date_created:DATETIME, orderitems0_.date_updated:DATETIME, orderitems0_.updated_by:BIGINT, orderitems0_.category_id:BIGINT, orderitems0_.discounts_allowed:BIT, orderitems0_.gift_wrap_item_id:BIGINT, orderitems0_.has_validation_errors:BIT, orderitems0_.item_taxable_flag:BIT, orderitems0_.name:VARCHAR, orderitems0_.order_id:BIGINT, orderitems0_.order_item_type:VARCHAR, orderitems0_.parent_order_item_id:BIGINT, orderitems0_.personal_message_id:BIGINT, orderitems0_.price:DECIMAL, orderitems0_.quantity:INT, orderitems0_.retail_price:DECIMAL, orderitems0_.retail_price_override:BIT, orderitems0_.sale_price:DECIMAL, orderitems0_.sale_price_override:BIT, orderitems0_.total_tax:DECIMAL, orderitems0_1_.base_retail_price:DECIMAL, orderitems0_1_.base_sale_price:DECIMAL, orderitems0_1_.product_bundle_id:BIGINT, orderitems0_1_.sku_id:BIGINT, orderitems0_2_.base_retail_price:DECIMAL, orderitems0_2_.base_sale_price:DECIMAL, orderitems0_2_.bundle_order_item_id:BIGINT, orderitems0_2_.product_id:BIGINT, orderitems0_2_.sku_id:BIGINT, orderitems0_2_.sku_bundle_item_id:BIGINT, clazz_1_:INT, orderitemi1_.order_item_id:BIGINT, orderitemi1_.created_by:BIGINT, orderitemi1_.date_created:DATETIME, orderitemi1_.date_updated:DATETIME, orderitemi1_.updated_by:BIGINT, orderitemi1_.category_id:BIGINT, orderitemi1_.discounts_allowed:BIT, orderitemi1_.gift_wrap_item_id:BIGINT, orderitemi1_.has_validation_errors:BIT, orderitemi1_.item_taxable_flag:BIT, orderitemi1_.name:VARCHAR, orderitemi1_.order_id:BIGINT, orderitemi1_.order_item_type:VARCHAR, orderitemi1_.parent_order_item_id:BIGINT, orderitemi1_.personal_message_id:BIGINT, orderitemi1_.price:DECIMAL, orderitemi1_.quantity:INT, orderitemi1_.retail_price:DECIMAL, orderitemi1_.retail_price_override:BIT, orderitemi1_.sale_price:DECIMAL, orderitemi1_.sale_price_override:BIT, orderitemi1_.total_tax:DECIMAL, orderitemi1_1_.base_retail_price:DECIMAL, orderitemi1_1_.base_sale_price:DECIMAL, orderitemi1_1_.product_bundle_id:BIGINT, orderitemi1_1_.sku_id:BIGINT, orderitemi1_2_.base_retail_price:DECIMAL, orderitemi1_2_.base_sale_price:DECIMAL, orderitemi1_2_.bundle_order_item_id:BIGINT, orderitemi1_2_.product_id:BIGINT, orderitemi1_2_.sku_id:BIGINT, orderitemi1_2_.sku_bundle_item_id:BIGINT, clazz_2_:INT, personalme2_.personal_message_id:BIGINT, personalme2_.message:VARCHAR, personalme2_.message_from:VARCHAR, personalme2_.message_to:VARCHAR, personalme2_.occasion:VARCHAR, bundleorde3_.order_item_id:BIGINT, bundleorde3_1_.created_by:BIGINT, bundleorde3_1_.date_created:DATETIME, bundleorde3_1_.date_updated:DATETIME, bundleorde3_1_.updated_by:BIGINT, bundleorde3_1_.category_id:BIGINT, bundleorde3_1_.discounts_allowed:BIT, bundleorde3_1_.gift_wrap_item_id:BIGINT, bundleorde3_1_.has_validation_errors:BIT, bundleorde3_1_.item_taxable_flag:BIT, bundleorde3_1_.name:VARCHAR, bundleorde3_1_.order_id:BIGINT, bundleorde3_1_.order_item_type:VARCHAR, bundleorde3_1_.parent_order_item_id:BIGINT, bundleorde3_1_.personal_message_id:BIGINT, bundleorde3_1_.price:DECIMAL, bundleorde3_1_.quantity:INT, bundleorde3_1_.retail_price:DECIMAL, bundleorde3_1_.retail_price_override:BIT, bundleorde3_1_.sale_price:DECIMAL, bundleorde3_1_.sale_price_override:BIT, bundleorde3_1_.total_tax:DECIMAL, bundleorde3_.base_retail_price:DECIMAL, bundleorde3_.base_sale_price:DECIMAL, bundleorde3_.product_bundle_id:BIGINT, bundleorde3_.sku_id:BIGINT, skubundlei4_.sku_bundle_item_id:BIGINT, skubundlei4_.product_bundle_id:BIGINT, skubundlei4_.item_sale_price:DECIMAL, skubundlei4_.quantity:INT, skubundlei4_.sequence:DECIMAL, skubundlei4_.sku_id:BIGINT}
}
