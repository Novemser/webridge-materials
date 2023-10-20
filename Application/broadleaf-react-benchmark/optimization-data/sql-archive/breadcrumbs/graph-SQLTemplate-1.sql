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