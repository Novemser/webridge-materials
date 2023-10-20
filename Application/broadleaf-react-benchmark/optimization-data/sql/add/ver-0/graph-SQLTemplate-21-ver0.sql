SqlNo=99
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=100
SQLNode {
    sqlTemplate='SELECT skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_2_, skumedia0_.MAP_KEY AS formula1_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_1_, skumedia0_.MAP_KEY AS MAP_KEY2_168_1_ , skumedia0_.MEDIA_ID AS MEDIA_ID3_168_1_, skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_1_, mediaimpl1_.MEDIA_ID AS MEDIA_ID1_83_0_, mediaimpl1_.ALT_TEXT AS ALT_TEXT2_83_0_, mediaimpl1_.TAGS AS TAGS3_83_0_ , mediaimpl1_.TITLE AS TITLE4_83_0_, mediaimpl1_.URL AS URL5_83_0_ FROM BLC_SKU_MEDIA_MAP skumedia0_ LEFT JOIN BLC_MEDIA mediaimpl1_ ON skumedia0_.MEDIA_ID = mediaimpl1_.MEDIA_ID WHERE skumedia0_.BLC_SKU_SKU_ID = ?',
    parameters={RS_q45_r1_col64:BIGINT},
    retVals={skumedia0_.blc_sku_sku_id:BIGINT, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.media_id:BIGINT, skumedia0_.blc_sku_sku_id:BIGINT, mediaimpl1_.media_id:BIGINT, mediaimpl1_.alt_text:VARCHAR, mediaimpl1_.tags:VARCHAR, mediaimpl1_.title:VARCHAR, mediaimpl1_.url:VARCHAR}
}
SqlNo=101
SQLNode {
    sqlTemplate='SELECT orderattri0_.ORDER_ID AS ORDER_ID4_95_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_0_, orderattri0_.NAME AS formula4_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_1_, orderattri0_.NAME AS NAME2_95_1_ , orderattri0_.ORDER_ID AS ORDER_ID4_95_1_, orderattri0_.VALUE AS VALUE3_95_1_ FROM BLC_ORDER_ATTRIBUTE orderattri0_ WHERE orderattri0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderattri0_.order_id:BIGINT, orderattri0_.order_attribute_id:BIGINT, orderattri0_.name:VARCHAR, orderattri0_.order_attribute_id:BIGINT, orderattri0_.name:VARCHAR, orderattri0_.order_id:BIGINT, orderattri0_.value:VARCHAR}
}
SqlNo=102
SQLNode {
    sqlTemplate='SELECT customerat0_.CUSTOMER_ID AS CUSTOMER4_42_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_1_, customerat0_.NAME AS formula9_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_0_, customerat0_.CUSTOMER_ID AS CUSTOMER4_42_0_ , customerat0_.NAME AS NAME2_42_0_, customerat0_.VALUE AS VALUE3_42_0_ FROM BLC_CUSTOMER_ATTRIBUTE customerat0_ WHERE customerat0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerat0_.customer_id:BIGINT, customerat0_.customer_attr_id:BIGINT, customerat0_.name:VARCHAR, customerat0_.customer_attr_id:BIGINT, customerat0_.customer_id:BIGINT, customerat0_.name:VARCHAR, customerat0_.value:VARCHAR}
}
SqlNo=103
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=104
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=105
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=106
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=107
SQLNode {
    sqlTemplate='UPDATE BLC_ORDER_LOCK SET LOCKED = 'N' WHERE ORDER_ID = ? AND LOCK_KEY = ?',
    parameters={RS_q20_r1_col1:BIGINT, "00000000-0000-0000-0000-000000000000":VARCHAR},
    retVals={}
}
