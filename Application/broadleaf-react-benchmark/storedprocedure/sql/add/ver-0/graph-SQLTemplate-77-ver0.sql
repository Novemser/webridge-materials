SqlNo=86
SQLNode {
    sqlTemplate='SELECT offerimpl0_.OFFER_ID AS OFFER_ID1_85_, offerimpl0_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_, offerimpl0_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_, offerimpl0_.ARCHIVED AS ARCHIVED4_85_, offerimpl0_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_ , offerimpl0_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_, offerimpl0_.OFFER_DESCRIPTION AS OFFER_DE7_85_, offerimpl0_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_, offerimpl0_.END_DATE AS END_DATE9_85_, offerimpl0_.MARKETING_MESSASGE AS MARKETI10_85_ , offerimpl0_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_, offerimpl0_.MAX_USES AS MAX_USE12_85_, offerimpl0_.OFFER_NAME AS OFFER_N13_85_, offerimpl0_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_, offerimpl0_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_ , offerimpl0_.ORDER_MIN_TOTAL AS ORDER_M16_85_, offerimpl0_.OFFER_PRIORITY AS OFFER_P17_85_, offerimpl0_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_, offerimpl0_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_, offerimpl0_.START_DATE AS START_D20_85_ , offerimpl0_.TARGET_MIN_TOTAL AS TARGET_21_85_, offerimpl0_.TARGET_SYSTEM AS TARGET_22_85_, offerimpl0_.TOTALITARIAN_OFFER AS TOTALIT23_85_, offerimpl0_.OFFER_TYPE AS OFFER_T24_85_, offerimpl0_.OFFER_VALUE AS OFFER_V25_85_ FROM BLC_OFFER offerimpl0_ WHERE offerimpl0_.START_DATE < ? AND (offerimpl0_.END_DATE IS NULL OR offerimpl0_.END_DATE > ?) AND (offerimpl0_.ARCHIVED = ? OR offerimpl0_.ARCHIVED IS NULL) AND offerimpl0_.AUTOMATICALLY_ADDED = ?',
    parameters={FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__265 / 86400000)) + 719163) + 1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__266 / 86400000)) + 719163) + -1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, "N":CHAR, 1:BIT},
    retVals={offerimpl0_.offer_id:BIGINT, offerimpl0_.apply_to_child_items:BIT, offerimpl0_.apply_to_sale_price:BIT, offerimpl0_.archived:CHAR, offerimpl0_.automatically_added:BIT, offerimpl0_.combinable_with_other_offers:BIT, offerimpl0_.offer_description:VARCHAR, offerimpl0_.offer_discount_type:VARCHAR, offerimpl0_.end_date:DATETIME, offerimpl0_.marketing_messasge:VARCHAR, offerimpl0_.max_uses_per_customer:BIGINT, offerimpl0_.max_uses:INT, offerimpl0_.offer_name:VARCHAR, offerimpl0_.offer_item_qualifier_rule:VARCHAR, offerimpl0_.offer_item_target_rule:VARCHAR, offerimpl0_.order_min_total:DECIMAL, offerimpl0_.offer_priority:INT, offerimpl0_.qualifying_item_min_total:DECIMAL, offerimpl0_.requires_related_tar_qual:BIT, offerimpl0_.start_date:DATETIME, offerimpl0_.target_min_total:DECIMAL, offerimpl0_.target_system:VARCHAR, offerimpl0_.totalitarian_offer:BIT, offerimpl0_.offer_type:VARCHAR, offerimpl0_.offer_value:DECIMAL}
}
