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
