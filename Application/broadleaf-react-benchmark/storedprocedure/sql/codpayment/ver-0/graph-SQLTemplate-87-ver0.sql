SqlNo=96
SQLNode {
    sqlTemplate='SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_3_, orderimpl0_.CREATED_BY AS CREATED_2_93_3_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_3_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_3_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_3_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_3_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_3_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_3_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_3_, orderimpl0_.NAME AS NAME7_93_3_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_3_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_3_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_3_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_3_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_3_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_3_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_3_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_3_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_3_, addedoffer1_.ORDER_ID AS ORDER_ID1_105_5_ , offercodei2_.OFFER_CODE_ID AS OFFER_CO2_105_5_, offercodei2_.OFFER_CODE_ID AS OFFER_CO1_87_0_, offercodei2_.ARCHIVED AS ARCHIVED2_87_0_, offercodei2_.EMAIL_ADDRESS AS EMAIL_AD3_87_0_, offercodei2_.MAX_USES AS MAX_USES4_87_0_ , offercodei2_.OFFER_ID AS OFFER_ID9_87_0_, offercodei2_.OFFER_CODE AS OFFER_CO5_87_0_, offercodei2_.END_DATE AS END_DATE6_87_0_, offercodei2_.START_DATE AS START_DA7_87_0_, offercodei2_.USES AS USES8_87_0_ , offerimpl3_.OFFER_ID AS OFFER_ID1_85_1_, offerimpl3_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_1_, offerimpl3_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_1_, offerimpl3_.ARCHIVED AS ARCHIVED4_85_1_, offerimpl3_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_1_ , offerimpl3_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_1_, offerimpl3_.OFFER_DESCRIPTION AS OFFER_DE7_85_1_, offerimpl3_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_1_, offerimpl3_.END_DATE AS END_DATE9_85_1_, offerimpl3_.MARKETING_MESSASGE AS MARKETI10_85_1_ , offerimpl3_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_1_, offerimpl3_.MAX_USES AS MAX_USE12_85_1_, offerimpl3_.OFFER_NAME AS OFFER_N13_85_1_, offerimpl3_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_1_, offerimpl3_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_1_ , offerimpl3_.ORDER_MIN_TOTAL AS ORDER_M16_85_1_, offerimpl3_.OFFER_PRIORITY AS OFFER_P17_85_1_, offerimpl3_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_1_, offerimpl3_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_1_, offerimpl3_.START_DATE AS START_D20_85_1_ , offerimpl3_.TARGET_MIN_TOTAL AS TARGET_21_85_1_, offerimpl3_.TARGET_SYSTEM AS TARGET_22_85_1_, offerimpl3_.TOTALITARIAN_OFFER AS TOTALIT23_85_1_, offerimpl3_.OFFER_TYPE AS OFFER_T24_85_1_, offerimpl3_.OFFER_VALUE AS OFFER_V25_85_1_ , customerim4_.CUSTOMER_ID AS CUSTOMER1_40_2_, customerim4_.CREATED_BY AS CREATED_2_40_2_, customerim4_.DATE_CREATED AS DATE_CRE3_40_2_, customerim4_.DATE_UPDATED AS DATE_UPD4_40_2_, customerim4_.UPDATED_BY AS UPDATED_5_40_2_ , customerim4_.CHALLENGE_ANSWER AS CHALLENG6_40_2_, customerim4_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_2_, customerim4_.LOCALE_CODE AS LOCALE_21_40_2_, customerim4_.DEACTIVATED AS DEACTIVA7_40_2_, customerim4_.EMAIL_ADDRESS AS EMAIL_AD8_40_2_ , customerim4_.EXTERNAL_ID AS EXTERNAL9_40_2_, customerim4_.FIRST_NAME AS FIRST_N10_40_2_, customerim4_.IS_TAX_EXEMPT AS IS_TAX_11_40_2_, customerim4_.LAST_NAME AS LAST_NA12_40_2_, customerim4_.PASSWORD AS PASSWOR13_40_2_ , customerim4_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_2_, customerim4_.IS_PREVIEW AS IS_PREV15_40_2_, customerim4_.RECEIVE_EMAIL AS RECEIVE16_40_2_, customerim4_.IS_REGISTERED AS IS_REGI17_40_2_, customerim4_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_2_ , customerim4_.USER_NAME AS USER_NA19_40_2_ FROM BLC_ORDER orderimpl0_ LEFT JOIN BLC_ORDER_OFFER_CODE_XREF addedoffer1_ ON orderimpl0_.ORDER_ID = addedoffer1_.ORDER_ID LEFT JOIN BLC_OFFER_CODE offercodei2_ ON addedoffer1_.OFFER_CODE_ID = offercodei2_.OFFER_CODE_ID LEFT JOIN BLC_OFFER offerimpl3_ ON offercodei2_.OFFER_ID = offerimpl3_.OFFER_ID INNER JOIN BLC_CUSTOMER customerim4_ ON orderimpl0_.CUSTOMER_ID = customerim4_.CUSTOMER_ID WHERE orderimpl0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderimpl0_.order_id:BIGINT, orderimpl0_.created_by:BIGINT, orderimpl0_.date_created:DATETIME, orderimpl0_.date_updated:DATETIME, orderimpl0_.updated_by:BIGINT, orderimpl0_.currency_code:VARCHAR, orderimpl0_.customer_id:BIGINT, orderimpl0_.email_address:VARCHAR, orderimpl0_.locale_code:VARCHAR, orderimpl0_.name:VARCHAR, orderimpl0_.order_number:VARCHAR, orderimpl0_.is_preview:BIT, orderimpl0_.order_status:VARCHAR, orderimpl0_.order_subtotal:DECIMAL, orderimpl0_.submit_date:DATETIME, orderimpl0_.tax_override:BIT, orderimpl0_.order_total:DECIMAL, orderimpl0_.total_shipping:DECIMAL, orderimpl0_.total_tax:DECIMAL, addedoffer1_.order_id:BIGINT, offercodei2_.offer_code_id:BIGINT, offercodei2_.offer_code_id:BIGINT, offercodei2_.archived:CHAR, offercodei2_.email_address:VARCHAR, offercodei2_.max_uses:INT, offercodei2_.offer_id:BIGINT, offercodei2_.offer_code:VARCHAR, offercodei2_.end_date:DATETIME, offercodei2_.start_date:DATETIME, offercodei2_.uses:INT, offerimpl3_.offer_id:BIGINT, offerimpl3_.apply_to_child_items:BIT, offerimpl3_.apply_to_sale_price:BIT, offerimpl3_.archived:CHAR, offerimpl3_.automatically_added:BIT, offerimpl3_.combinable_with_other_offers:BIT, offerimpl3_.offer_description:VARCHAR, offerimpl3_.offer_discount_type:VARCHAR, offerimpl3_.end_date:DATETIME, offerimpl3_.marketing_messasge:VARCHAR, offerimpl3_.max_uses_per_customer:BIGINT, offerimpl3_.max_uses:INT, offerimpl3_.offer_name:VARCHAR, offerimpl3_.offer_item_qualifier_rule:VARCHAR, offerimpl3_.offer_item_target_rule:VARCHAR, offerimpl3_.order_min_total:DECIMAL, offerimpl3_.offer_priority:INT, offerimpl3_.qualifying_item_min_total:DECIMAL, offerimpl3_.requires_related_tar_qual:BIT, offerimpl3_.start_date:DATETIME, offerimpl3_.target_min_total:DECIMAL, offerimpl3_.target_system:VARCHAR, offerimpl3_.totalitarian_offer:BIT, offerimpl3_.offer_type:VARCHAR, offerimpl3_.offer_value:DECIMAL, customerim4_.customer_id:BIGINT, customerim4_.created_by:BIGINT, customerim4_.date_created:DATETIME, customerim4_.date_updated:DATETIME, customerim4_.updated_by:BIGINT, customerim4_.challenge_answer:VARCHAR, customerim4_.challenge_question_id:BIGINT, customerim4_.locale_code:VARCHAR, customerim4_.deactivated:BIT, customerim4_.email_address:VARCHAR, customerim4_.external_id:VARCHAR, customerim4_.first_name:VARCHAR, customerim4_.is_tax_exempt:BIT, customerim4_.last_name:VARCHAR, customerim4_.password:VARCHAR, customerim4_.password_change_required:BIT, customerim4_.is_preview:BIT, customerim4_.receive_email:BIT, customerim4_.is_registered:BIT, customerim4_.tax_exemption_code:VARCHAR, customerim4_.user_name:VARCHAR}
}
