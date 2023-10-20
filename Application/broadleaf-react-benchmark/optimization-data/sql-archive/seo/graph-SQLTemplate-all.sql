SqlNo=1
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={REQUEST_HEADER_X_Locale:VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}
SqlNo=2
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={REPLACE(REQUEST_HEADER_X_Locale, "-", "_"):VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}
SqlNo=3
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_0_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.CURRENCY_CODE = ?',
    parameters={q2_res1_col_localeimpl0___currency_code__CURRENCY5_82_:VARCHAR},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}
SqlNo=4
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1',
    parameters={},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}
SqlNo=5
SQLNode {
    sqlTemplate='SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = ?',
    parameters={"NONE_PROVIDED":VARCHAR},
    retVals={customerim0_.customer_id:BIGINT, customerim0_.created_by:BIGINT, customerim0_.date_created:DATETIME, customerim0_.date_updated:DATETIME, customerim0_.updated_by:BIGINT, customerim0_.challenge_answer:VARCHAR, customerim0_.challenge_question_id:BIGINT, customerim0_.locale_code:VARCHAR, customerim0_.deactivated:BIT, customerim0_.email_address:VARCHAR, customerim0_.external_id:VARCHAR, customerim0_.first_name:VARCHAR, customerim0_.is_tax_exempt:BIT, customerim0_.last_name:VARCHAR, customerim0_.password:VARCHAR, customerim0_.password_change_required:BIT, customerim0_.is_preview:BIT, customerim0_.receive_email:BIT, customerim0_.is_registered:BIT, customerim0_.tax_exemption_code:VARCHAR, customerim0_.user_name:VARCHAR}
}
SqlNo=6
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"blc.auth.jwt.access.secret":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=7
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"blc.auth.jwt.access.secret":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=8
SQLNode {
    sqlTemplate='SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = ?',
    parameters={REQUEST_TOKEN__FIELD_username:VARCHAR},
    retVals={customerim0_.customer_id:BIGINT, customerim0_.created_by:BIGINT, customerim0_.date_created:DATETIME, customerim0_.date_updated:DATETIME, customerim0_.updated_by:BIGINT, customerim0_.challenge_answer:VARCHAR, customerim0_.challenge_question_id:BIGINT, customerim0_.locale_code:VARCHAR, customerim0_.deactivated:BIT, customerim0_.email_address:VARCHAR, customerim0_.external_id:VARCHAR, customerim0_.first_name:VARCHAR, customerim0_.is_tax_exempt:BIT, customerim0_.last_name:VARCHAR, customerim0_.password:VARCHAR, customerim0_.password_change_required:BIT, customerim0_.is_preview:BIT, customerim0_.receive_email:BIT, customerim0_.is_registered:BIT, customerim0_.tax_exemption_code:VARCHAR, customerim0_.user_name:VARCHAR}
}
SqlNo=9
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=10
SQLNode {
    sqlTemplate='SELECT customerro0_.CUSTOMER_ROLE_ID AS CUSTOMER1_48_, customerro0_.CUSTOMER_ID AS CUSTOMER2_48_, customerro0_.ROLE_ID AS ROLE_ID3_48_ FROM BLC_CUSTOMER_ROLE customerro0_ WHERE customerro0_.CUSTOMER_ID = ?',
    parameters={q8_res1_col_customerim0___customer_id__CUSTOMER1_40_:BIGINT},
    retVals={customerro0_.customer_role_id:BIGINT, customerro0_.customer_id:BIGINT, customerro0_.role_id:BIGINT}
}
SqlNo=11
SQLNode {
    sqlTemplate='SELECT roleimpl0_.ROLE_ID AS ROLE_ID1_137_0_, roleimpl0_.ROLE_NAME AS ROLE_NAM2_137_0_ FROM BLC_ROLE roleimpl0_ WHERE roleimpl0_.ROLE_ID = ?',
    parameters={q10_res1_col_customerro0___role_id__ROLE_ID3_48_:BIGINT},
    retVals={roleimpl0_.role_id:BIGINT, roleimpl0_.role_name:VARCHAR}
}

======================================================
SqlNo=12
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=13
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={REQUEST_HEADER_X_Locale:VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}
SqlNo=14
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={REPLACE(REQUEST_HEADER_X_Locale, "-", "_"):VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}
SqlNo=15
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1',
    parameters={},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}
SqlNo=16
SQLNode {
    sqlTemplate='SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_ WHERE urlhandler0_.INCOMING_URL = ?',
    parameters={SUBSTRING(REQUEST_PARAM_uri, 0 + 1, LENGTH(REQUEST_PARAM_uri) - 0):VARCHAR},
    retVals={urlhandler0_.url_handler_id:BIGINT, urlhandler0_.incoming_url:VARCHAR, urlhandler0_.is_regex:BIT, urlhandler0_.new_url:VARCHAR, urlhandler0_.url_redirect_type:VARCHAR}
}
SqlNo=17
SQLNode {
    sqlTemplate='SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_',
    parameters={},
    retVals={urlhandler0_.url_handler_id:BIGINT, urlhandler0_.incoming_url:VARCHAR, urlhandler0_.is_regex:BIT, urlhandler0_.new_url:VARCHAR, urlhandler0_.url_redirect_type:VARCHAR}
}
SqlNo=18
SQLNode {
    sqlTemplate='SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_, orderimpl0_.CREATED_BY AS CREATED_2_93_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_, orderimpl0_.NAME AS NAME7_93_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_ FROM BLC_ORDER orderimpl0_ WHERE orderimpl0_.CUSTOMER_ID = ? AND orderimpl0_.ORDER_STATUS = ? AND (orderimpl0_.NAME IS NULL) ORDER BY orderimpl0_.ORDER_ID DESC',
    parameters={q8_res1_col_customerim0___customer_id__CUSTOMER1_40_:BIGINT, "IN_PROCESS":VARCHAR},
    retVals={orderimpl0_.order_id:BIGINT, orderimpl0_.created_by:BIGINT, orderimpl0_.date_created:DATETIME, orderimpl0_.date_updated:DATETIME, orderimpl0_.updated_by:BIGINT, orderimpl0_.currency_code:VARCHAR, orderimpl0_.customer_id:BIGINT, orderimpl0_.email_address:VARCHAR, orderimpl0_.locale_code:VARCHAR, orderimpl0_.name:VARCHAR, orderimpl0_.order_number:VARCHAR, orderimpl0_.is_preview:BIT, orderimpl0_.order_status:VARCHAR, orderimpl0_.order_subtotal:DECIMAL, orderimpl0_.submit_date:DATETIME, orderimpl0_.tax_override:BIT, orderimpl0_.order_total:DECIMAL, orderimpl0_.total_shipping:DECIMAL, orderimpl0_.total_tax:DECIMAL}
}
SqlNo=19
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"geolocation.api.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=20
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"geolocation.api.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=21
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=22
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
SqlNo=23
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=24
SQLNode {
    sqlTemplate='SELECT categoryim0_.CATEGORY_ID AS CATEGORY1_26_, categoryim0_.ACTIVE_END_DATE AS ACTIVE_E2_26_, categoryim0_.ACTIVE_START_DATE AS ACTIVE_S3_26_, categoryim0_.ARCHIVED AS ARCHIVED4_26_, categoryim0_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_ , categoryim0_.DESCRIPTION AS DESCRIPT5_26_, categoryim0_.DISPLAY_TEMPLATE AS DISPLAY_6_26_, categoryim0_.EXTERNAL_ID AS EXTERNAL7_26_, categoryim0_.FULFILLMENT_TYPE AS FULFILLM8_26_, categoryim0_.INVENTORY_TYPE AS INVENTOR9_26_ , categoryim0_.LONG_DESCRIPTION AS LONG_DE10_26_, categoryim0_.META_DESC AS META_DE11_26_, categoryim0_.META_TITLE AS META_TI12_26_, categoryim0_.NAME AS NAME13_26_, categoryim0_.OVERRIDE_GENERATED_URL AS OVERRID14_26_ , categoryim0_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_, categoryim0_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_, categoryim0_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_, categoryim0_.TAX_CODE AS TAX_COD18_26_, categoryim0_.URL AS URL19_26_ , categoryim0_.URL_KEY AS URL_KEY20_26_ FROM BLC_CATEGORY categoryim0_ WHERE categoryim0_.URL = ? AND (categoryim0_.ARCHIVED IS NULL OR categoryim0_.ARCHIVED = 'N') AND categoryim0_.ACTIVE_START_DATE < ? AND (categoryim0_.ACTIVE_END_DATE IS NULL OR categoryim0_.ACTIVE_END_DATE > ?)',
    parameters={REQUEST_PARAM_entityURI:VARCHAR, FROM_UNIXTIME((((__nd__func__currentTimeMs__32 / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME((((__nd__func__currentTimeMs__32 / 1000) * 1000) / 1000)):DATETIME},
    retVals={categoryim0_.category_id:BIGINT, categoryim0_.active_end_date:DATETIME, categoryim0_.active_start_date:DATETIME, categoryim0_.archived:CHAR, categoryim0_.default_parent_category_id:BIGINT, categoryim0_.description:VARCHAR, categoryim0_.display_template:VARCHAR, categoryim0_.external_id:VARCHAR, categoryim0_.fulfillment_type:VARCHAR, categoryim0_.inventory_type:VARCHAR, categoryim0_.long_description:LONGTEXT, categoryim0_.meta_desc:VARCHAR, categoryim0_.meta_title:VARCHAR, categoryim0_.name:VARCHAR, categoryim0_.override_generated_url:BIT, categoryim0_.product_desc_pattern_override:VARCHAR, categoryim0_.product_title_pattern_override:VARCHAR, categoryim0_.root_display_order:DECIMAL, categoryim0_.tax_code:VARCHAR, categoryim0_.url:VARCHAR, categoryim0_.url_key:VARCHAR}
}
SqlNo=25
SQLNode {
    sqlTemplate='SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = ? AND translatio0_.ENTITY_ID = ? AND translatio0_.FIELD_NAME = ? AND (translatio0_.LOCALE_CODE LIKE ?)',
    parameters={"Category":VARCHAR, CONVERT(q25_res1_col_categoryim0___category_id__CATEGORY1_26_, CHAR):VARCHAR, "name":VARCHAR, "en%":VARCHAR},
    retVals={translatio0_.translation_id:BIGINT, translatio0_.entity_id:VARCHAR, translatio0_.entity_type:VARCHAR, translatio0_.field_name:VARCHAR, translatio0_.locale_code:VARCHAR, translatio0_.translated_value:LONGTEXT}
}
SqlNo=26
SQLNode {
    sqlTemplate='SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = ? AND translatio0_.ENTITY_ID = ? AND translatio0_.FIELD_NAME = ? AND (translatio0_.LOCALE_CODE LIKE ?)',
    parameters={"Category":VARCHAR, CONVERT(q25_res1_col_categoryim0___category_id__CATEGORY1_26_, CHAR):VARCHAR, "longDescription":VARCHAR, "en%":VARCHAR},
    retVals={translatio0_.translation_id:BIGINT, translatio0_.entity_id:VARCHAR, translatio0_.entity_type:VARCHAR, translatio0_.field_name:VARCHAR, translatio0_.locale_code:VARCHAR, translatio0_.translated_value:LONGTEXT}
}

======================================================
