SqlNo=31
SQLNode {
    sqlTemplate='SELECT shoppingca0_.SHP_CART_ID AS SHP_CART1_69_0_, lineitems1_.SHP_CART_ITEM_ID AS SHP_CART1_71_1_, attributes2_.SHP_CART_ATTR_ITEM_ID AS SHP_CART1_70_2_, merchantst3_.MERCHANT_ID AS MERCHANT1_29_3_, shoppingca0_.DATE_CREATED AS DATE_CRE2_69_0_ , shoppingca0_.DATE_MODIFIED AS DATE_MOD3_69_0_, shoppingca0_.UPDT_ID AS UPDT_ID4_69_0_, shoppingca0_.CUSTOMER_ID AS CUSTOMER5_69_0_, shoppingca0_.IP_ADDRESS AS IP_ADDRE6_69_0_, shoppingca0_.MERCHANT_ID AS MERCHAN11_69_0_ , shoppingca0_.ORDER_ID AS ORDER_ID7_69_0_, shoppingca0_.PROMO_ADDED AS PROMO_AD8_69_0_, shoppingca0_.PROMO_CODE AS PROMO_CO9_69_0_, shoppingca0_.SHP_CART_CODE AS SHP_CAR10_69_0_, lineitems1_.DATE_CREATED AS DATE_CRE2_71_1_ , lineitems1_.DATE_MODIFIED AS DATE_MOD3_71_1_, lineitems1_.UPDT_ID AS UPDT_ID4_71_1_, lineitems1_.PRODUCT_ID AS PRODUCT_5_71_1_, lineitems1_.QUANTITY AS QUANTITY6_71_1_, lineitems1_.SHP_CART_ID AS SHP_CART7_71_1_ , lineitems1_.SHP_CART_ID AS SHP_CART7_71_0__, lineitems1_.SHP_CART_ITEM_ID AS SHP_CART1_71_0__, attributes2_.DATE_CREATED AS DATE_CRE2_70_2_, attributes2_.DATE_MODIFIED AS DATE_MOD3_70_2_, attributes2_.UPDT_ID AS UPDT_ID4_70_2_ , attributes2_.PRODUCT_ATTR_ID AS PRODUCT_5_70_2_, attributes2_.SHP_CART_ITEM_ID AS SHP_CART6_70_2_, attributes2_.SHP_CART_ITEM_ID AS SHP_CART6_70_1__, attributes2_.SHP_CART_ATTR_ITEM_ID AS SHP_CART1_70_1__, merchantst3_.DATE_CREATED AS DATE_CRE2_29_3_ , merchantst3_.DATE_MODIFIED AS DATE_MOD3_29_3_, merchantst3_.UPDT_ID AS UPDT_ID4_29_3_, merchantst3_.STORE_CODE AS STORE_CO5_29_3_, merchantst3_.CONTINUESHOPPINGURL AS CONTINUE6_29_3_, merchantst3_.COUNTRY_ID AS COUNTRY24_29_3_ , merchantst3_.CURRENCY_ID AS CURRENC25_29_3_, merchantst3_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_3_, merchantst3_.LANGUAGE_ID AS LANGUAG26_29_3_, merchantst3_.DOMAIN_NAME AS DOMAIN_N8_29_3_, merchantst3_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_3_ , merchantst3_.INVOICE_TEMPLATE AS INVOICE10_29_3_, merchantst3_.PARENT_ID AS PARENT_27_29_3_, merchantst3_.IS_RETAILER AS IS_RETA11_29_3_, merchantst3_.SEIZEUNITCODE AS SEIZEUN12_29_3_, merchantst3_.STORE_EMAIL AS STORE_E13_29_3_ , merchantst3_.STORE_LOGO AS STORE_L14_29_3_, merchantst3_.STORE_TEMPLATE AS STORE_T15_29_3_, merchantst3_.STORE_ADDRESS AS STORE_A16_29_3_, merchantst3_.STORE_CITY AS STORE_C17_29_3_, merchantst3_.STORE_NAME AS STORE_N18_29_3_ , merchantst3_.STORE_PHONE AS STORE_P19_29_3_, merchantst3_.STORE_POSTAL_CODE AS STORE_P20_29_3_, merchantst3_.STORE_STATE_PROV AS STORE_S21_29_3_, merchantst3_.USE_CACHE AS USE_CAC22_29_3_, merchantst3_.WEIGHTUNITCODE AS WEIGHTU23_29_3_ , merchantst3_.ZONE_ID AS ZONE_ID28_29_3_ FROM SHOPPING_CART shoppingca0_ LEFT JOIN SHOPPING_CART_ITEM lineitems1_ ON shoppingca0_.SHP_CART_ID = lineitems1_.SHP_CART_ID LEFT JOIN SHOPPING_CART_ATTR_ITEM attributes2_ ON lineitems1_.SHP_CART_ITEM_ID = attributes2_.SHP_CART_ITEM_ID INNER JOIN MERCHANT_STORE merchantst3_ ON shoppingca0_.MERCHANT_ID = merchantst3_.MERCHANT_ID WHERE merchantst3_.MERCHANT_ID = ? AND shoppingca0_.SHP_CART_ID = ?',
    parameters={RS_q2_r1_col2:INT, RS_q18_r1_col1:BIGINT},
    retVals={shoppingca0_.shp_cart_id:BIGINT, lineitems1_.shp_cart_item_id:BIGINT, attributes2_.shp_cart_attr_item_id:BIGINT, merchantst3_.merchant_id:INT, shoppingca0_.date_created:DATETIME, shoppingca0_.date_modified:DATETIME, shoppingca0_.updt_id:VARCHAR, shoppingca0_.customer_id:BIGINT, shoppingca0_.ip_address:VARCHAR, shoppingca0_.merchant_id:INT, shoppingca0_.order_id:BIGINT, shoppingca0_.promo_added:DATETIME, shoppingca0_.promo_code:VARCHAR, shoppingca0_.shp_cart_code:VARCHAR, lineitems1_.date_created:DATETIME, lineitems1_.date_modified:DATETIME, lineitems1_.updt_id:VARCHAR, lineitems1_.product_id:BIGINT, lineitems1_.quantity:INT, lineitems1_.shp_cart_id:BIGINT, lineitems1_.shp_cart_id:BIGINT, lineitems1_.shp_cart_item_id:BIGINT, attributes2_.date_created:DATETIME, attributes2_.date_modified:DATETIME, attributes2_.updt_id:VARCHAR, attributes2_.product_attr_id:BIGINT, attributes2_.shp_cart_item_id:BIGINT, attributes2_.shp_cart_item_id:BIGINT, attributes2_.shp_cart_attr_item_id:BIGINT, merchantst3_.date_created:DATETIME, merchantst3_.date_modified:DATETIME, merchantst3_.updt_id:VARCHAR, merchantst3_.store_code:VARCHAR, merchantst3_.continueshoppingurl:VARCHAR, merchantst3_.country_id:INT, merchantst3_.currency_id:BIGINT, merchantst3_.currency_format_national:BIT, merchantst3_.language_id:INT, merchantst3_.domain_name:VARCHAR, merchantst3_.in_business_since:DATE, merchantst3_.invoice_template:VARCHAR, merchantst3_.parent_id:INT, merchantst3_.is_retailer:BIT, merchantst3_.seizeunitcode:VARCHAR, merchantst3_.store_email:VARCHAR, merchantst3_.store_logo:VARCHAR, merchantst3_.store_template:VARCHAR, merchantst3_.store_address:VARCHAR, merchantst3_.store_city:VARCHAR, merchantst3_.store_name:VARCHAR, merchantst3_.store_phone:VARCHAR, merchantst3_.store_postal_code:VARCHAR, merchantst3_.store_state_prov:VARCHAR, merchantst3_.use_cache:BIT, merchantst3_.weightunitcode:VARCHAR, merchantst3_.zone_id:BIGINT}
}
