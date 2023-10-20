SqlNo=1
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={"en-US":VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}

======================================================
SqlNo=2
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={"en_US":VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}

======================================================
SqlNo=3
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_0_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.CURRENCY_CODE = ?',
    parameters={RS_q2_r1_col2:VARCHAR},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}

======================================================
SqlNo=4
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1',
    parameters={},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}

======================================================
SqlNo=5
SQLNode {
    sqlTemplate='SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = ?',
    parameters={"NONE_PROVIDED":VARCHAR},
    retVals={customerim0_.customer_id:BIGINT, customerim0_.created_by:BIGINT, customerim0_.date_created:DATETIME, customerim0_.date_updated:DATETIME, customerim0_.updated_by:BIGINT, customerim0_.challenge_answer:VARCHAR, customerim0_.challenge_question_id:BIGINT, customerim0_.locale_code:VARCHAR, customerim0_.deactivated:BIT, customerim0_.email_address:VARCHAR, customerim0_.external_id:VARCHAR, customerim0_.first_name:VARCHAR, customerim0_.is_tax_exempt:BIT, customerim0_.last_name:VARCHAR, customerim0_.password:VARCHAR, customerim0_.password_change_required:BIT, customerim0_.is_preview:BIT, customerim0_.receive_email:BIT, customerim0_.is_registered:BIT, customerim0_.tax_exemption_code:VARCHAR, customerim0_.user_name:VARCHAR}
}

======================================================
SqlNo=6
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"blc.auth.jwt.access.secret":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=7
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"blc.auth.jwt.access.secret":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=8
SQLNode {
    sqlTemplate='SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_, customerim0_.CREATED_BY AS CREATED_2_40_, customerim0_.DATE_CREATED AS DATE_CRE3_40_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_, customerim0_.UPDATED_BY AS UPDATED_5_40_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_, customerim0_.LOCALE_CODE AS LOCALE_21_40_, customerim0_.DEACTIVATED AS DEACTIVA7_40_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_, customerim0_.FIRST_NAME AS FIRST_N10_40_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_, customerim0_.LAST_NAME AS LAST_NA12_40_, customerim0_.PASSWORD AS PASSWOR13_40_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_, customerim0_.IS_PREVIEW AS IS_PREV15_40_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_, customerim0_.IS_REGISTERED AS IS_REGI17_40_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_ , customerim0_.USER_NAME AS USER_NA19_40_ FROM BLC_CUSTOMER customerim0_ WHERE customerim0_.USER_NAME = ?',
    parameters={M_L_String__user_name:VARCHAR},
    retVals={customerim0_.customer_id:BIGINT, customerim0_.created_by:BIGINT, customerim0_.date_created:DATETIME, customerim0_.date_updated:DATETIME, customerim0_.updated_by:BIGINT, customerim0_.challenge_answer:VARCHAR, customerim0_.challenge_question_id:BIGINT, customerim0_.locale_code:VARCHAR, customerim0_.deactivated:BIT, customerim0_.email_address:VARCHAR, customerim0_.external_id:VARCHAR, customerim0_.first_name:VARCHAR, customerim0_.is_tax_exempt:BIT, customerim0_.last_name:VARCHAR, customerim0_.password:VARCHAR, customerim0_.password_change_required:BIT, customerim0_.is_preview:BIT, customerim0_.receive_email:BIT, customerim0_.is_registered:BIT, customerim0_.tax_exemption_code:VARCHAR, customerim0_.user_name:VARCHAR}
}

======================================================
SqlNo=9
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=10
SQLNode {
    sqlTemplate='SELECT customerro0_.CUSTOMER_ROLE_ID AS CUSTOMER1_48_, customerro0_.CUSTOMER_ID AS CUSTOMER2_48_, customerro0_.ROLE_ID AS ROLE_ID3_48_ FROM BLC_CUSTOMER_ROLE customerro0_ WHERE customerro0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerro0_.customer_role_id:BIGINT, customerro0_.customer_id:BIGINT, customerro0_.role_id:BIGINT}
}

======================================================
SqlNo=12
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=13
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={"en-US":VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}

======================================================
SqlNo=14
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={"en_US":VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}

======================================================
SqlNo=15
SQLNode {
    sqlTemplate='SELECT broadleafc0_.CURRENCY_CODE AS CURRENCY1_38_, broadleafc0_.DEFAULT_FLAG AS DEFAULT_2_38_, broadleafc0_.FRIENDLY_NAME AS FRIENDLY3_38_ FROM BLC_CURRENCY broadleafc0_ WHERE broadleafc0_.DEFAULT_FLAG = 1',
    parameters={},
    retVals={broadleafc0_.currency_code:VARCHAR, broadleafc0_.default_flag:BIT, broadleafc0_.friendly_name:VARCHAR}
}

======================================================
SqlNo=16
SQLNode {
    sqlTemplate='SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_ WHERE urlhandler0_.INCOMING_URL = ?',
    parameters={M_L_String__req_uri:VARCHAR},
    retVals={urlhandler0_.url_handler_id:BIGINT, urlhandler0_.incoming_url:VARCHAR, urlhandler0_.is_regex:BIT, urlhandler0_.new_url:VARCHAR, urlhandler0_.url_redirect_type:VARCHAR}
}

======================================================
SqlNo=17
SQLNode {
    sqlTemplate='SELECT urlhandler0_.URL_HANDLER_ID AS URL_HAND1_179_, urlhandler0_.INCOMING_URL AS INCOMING2_179_, urlhandler0_.IS_REGEX AS IS_REGEX3_179_, urlhandler0_.NEW_URL AS NEW_URL4_179_, urlhandler0_.URL_REDIRECT_TYPE AS URL_REDI5_179_ FROM BLC_URL_HANDLER urlhandler0_',
    parameters={},
    retVals={urlhandler0_.url_handler_id:BIGINT, urlhandler0_.incoming_url:VARCHAR, urlhandler0_.is_regex:BIT, urlhandler0_.new_url:VARCHAR, urlhandler0_.url_redirect_type:VARCHAR}
}

======================================================
SqlNo=18
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"geolocation.api.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=19
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"geolocation.api.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=20
SQLNode {
    sqlTemplate='SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_, orderimpl0_.CREATED_BY AS CREATED_2_93_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_, orderimpl0_.NAME AS NAME7_93_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_ FROM BLC_ORDER orderimpl0_ WHERE orderimpl0_.CUSTOMER_ID = ? AND orderimpl0_.ORDER_STATUS = ? AND orderimpl0_.NAME IS NULL ORDER BY orderimpl0_.ORDER_ID DESC',
    parameters={RS_q8_r1_col1:BIGINT, "IN_PROCESS":VARCHAR},
    retVals={orderimpl0_.order_id:BIGINT, orderimpl0_.created_by:BIGINT, orderimpl0_.date_created:DATETIME, orderimpl0_.date_updated:DATETIME, orderimpl0_.updated_by:BIGINT, orderimpl0_.currency_code:VARCHAR, orderimpl0_.customer_id:BIGINT, orderimpl0_.email_address:VARCHAR, orderimpl0_.locale_code:VARCHAR, orderimpl0_.name:VARCHAR, orderimpl0_.order_number:VARCHAR, orderimpl0_.is_preview:BIT, orderimpl0_.order_status:VARCHAR, orderimpl0_.order_subtotal:DECIMAL, orderimpl0_.submit_date:DATETIME, orderimpl0_.tax_override:BIT, orderimpl0_.order_total:DECIMAL, orderimpl0_.total_shipping:DECIMAL, orderimpl0_.total_tax:DECIMAL}
}

======================================================
SqlNo=21
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.errorInsteadOfQueue":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=22
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.errorInsteadOfQueue":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=23
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=24
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=25
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=26
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=27
SQLNode {
    sqlTemplate='SELECT count(*) AS col_0_0_ FROM BLC_ORDER_LOCK orderlocki0_ WHERE orderlocki0_.ORDER_ID = ? AND orderlocki0_.LOCK_KEY = ?',
    parameters={RS_q20_r1_col1:BIGINT, "00000000-0000-0000-0000-000000000000":VARCHAR},
    retVals={count_star:BIGINT}
}

======================================================
SqlNo=28
SQLNode {
    sqlTemplate='INSERT INTO BLC_ORDER_LOCK (LAST_UPDATED, LOCKED, LOCK_KEY, ORDER_ID) VALUES (?, ?, ?, ?)',
    parameters={__nd__func__currentTimeMs__42__106:BIGINT, "Y":CHAR, "00000000-0000-0000-0000-000000000000":VARCHAR, RS_q20_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=30
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=31
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=32
SQLNode {
    sqlTemplate='SELECT customerim0_.CUSTOMER_ID AS CUSTOMER1_40_2_, customerim0_.CREATED_BY AS CREATED_2_40_2_, customerim0_.DATE_CREATED AS DATE_CRE3_40_2_, customerim0_.DATE_UPDATED AS DATE_UPD4_40_2_, customerim0_.UPDATED_BY AS UPDATED_5_40_2_ , customerim0_.CHALLENGE_ANSWER AS CHALLENG6_40_2_, customerim0_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_2_, customerim0_.LOCALE_CODE AS LOCALE_21_40_2_, customerim0_.DEACTIVATED AS DEACTIVA7_40_2_, customerim0_.EMAIL_ADDRESS AS EMAIL_AD8_40_2_ , customerim0_.EXTERNAL_ID AS EXTERNAL9_40_2_, customerim0_.FIRST_NAME AS FIRST_N10_40_2_, customerim0_.IS_TAX_EXEMPT AS IS_TAX_11_40_2_, customerim0_.LAST_NAME AS LAST_NA12_40_2_, customerim0_.PASSWORD AS PASSWOR13_40_2_ , customerim0_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_2_, customerim0_.IS_PREVIEW AS IS_PREV15_40_2_, customerim0_.RECEIVE_EMAIL AS RECEIVE16_40_2_, customerim0_.IS_REGISTERED AS IS_REGI17_40_2_, customerim0_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_2_ , customerim0_.USER_NAME AS USER_NA19_40_2_, customerad1_.CUSTOMER_ID AS CUSTOMER5_41_4_, customerad1_.CUSTOMER_ADDRESS_ID AS CUSTOMER1_41_4_, customerad1_.CUSTOMER_ADDRESS_ID AS CUSTOMER1_41_0_, customerad1_.ADDRESS_ID AS ADDRESS_4_41_0_ , customerad1_.ADDRESS_NAME AS ADDRESS_2_41_0_, customerad1_.ARCHIVED AS ARCHIVED3_41_0_, customerad1_.CUSTOMER_ID AS CUSTOMER5_41_0_, addressimp2_.ADDRESS_ID AS ADDRESS_1_1_1_, addressimp2_.ADDRESS_LINE1 AS ADDRESS_2_1_1_ , addressimp2_.ADDRESS_LINE2 AS ADDRESS_3_1_1_, addressimp2_.ADDRESS_LINE3 AS ADDRESS_4_1_1_, addressimp2_.CITY AS CITY5_1_1_, addressimp2_.COMPANY_NAME AS COMPANY_6_1_1_, addressimp2_.COUNTRY AS COUNTRY27_1_1_ , addressimp2_.COUNTY AS COUNTY7_1_1_, addressimp2_.EMAIL_ADDRESS AS EMAIL_AD8_1_1_, addressimp2_.FAX AS FAX9_1_1_, addressimp2_.FIRST_NAME AS FIRST_N10_1_1_, addressimp2_.FULL_NAME AS FULL_NA11_1_1_ , addressimp2_.IS_ACTIVE AS IS_ACTI12_1_1_, addressimp2_.IS_BUSINESS AS IS_BUSI13_1_1_, addressimp2_.IS_DEFAULT AS IS_DEFA14_1_1_, addressimp2_.IS_MAILING AS IS_MAIL15_1_1_, addressimp2_.IS_STREET AS IS_STRE16_1_1_ , addressimp2_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_1_, addressimp2_.ISO_COUNTRY_SUB AS ISO_COU17_1_1_, addressimp2_.LAST_NAME AS LAST_NA18_1_1_, addressimp2_.PHONE_FAX_ID AS PHONE_F29_1_1_, addressimp2_.PHONE_PRIMARY_ID AS PHONE_P30_1_1_ , addressimp2_.PHONE_SECONDARY_ID AS PHONE_S31_1_1_, addressimp2_.POSTAL_CODE AS POSTAL_19_1_1_, addressimp2_.PRIMARY_PHONE AS PRIMARY20_1_1_, addressimp2_.SECONDARY_PHONE AS SECONDA21_1_1_, addressimp2_.STANDARDIZED AS STANDAR22_1_1_ , addressimp2_.STATE_PROV_REGION AS STATE_P32_1_1_, addressimp2_.SUB_STATE_PROV_REG AS SUB_STA23_1_1_, addressimp2_.TOKENIZED_ADDRESS AS TOKENIZ24_1_1_, addressimp2_.VERIFICATION_LEVEL AS VERIFIC25_1_1_, addressimp2_.ZIP_FOUR AS ZIP_FOU26_1_1_ FROM BLC_CUSTOMER customerim0_ LEFT JOIN BLC_CUSTOMER_ADDRESS customerad1_ ON customerim0_.CUSTOMER_ID = customerad1_.CUSTOMER_ID AND customerad1_.archived != 'Y' LEFT JOIN BLC_ADDRESS addressimp2_ ON customerad1_.ADDRESS_ID = addressimp2_.ADDRESS_ID WHERE customerim0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerim0_.customer_id:BIGINT, customerim0_.created_by:BIGINT, customerim0_.date_created:DATETIME, customerim0_.date_updated:DATETIME, customerim0_.updated_by:BIGINT, customerim0_.challenge_answer:VARCHAR, customerim0_.challenge_question_id:BIGINT, customerim0_.locale_code:VARCHAR, customerim0_.deactivated:BIT, customerim0_.email_address:VARCHAR, customerim0_.external_id:VARCHAR, customerim0_.first_name:VARCHAR, customerim0_.is_tax_exempt:BIT, customerim0_.last_name:VARCHAR, customerim0_.password:VARCHAR, customerim0_.password_change_required:BIT, customerim0_.is_preview:BIT, customerim0_.receive_email:BIT, customerim0_.is_registered:BIT, customerim0_.tax_exemption_code:VARCHAR, customerim0_.user_name:VARCHAR, customerad1_.customer_id:BIGINT, customerad1_.customer_address_id:BIGINT, customerad1_.customer_address_id:BIGINT, customerad1_.address_id:BIGINT, customerad1_.address_name:VARCHAR, customerad1_.archived:CHAR, customerad1_.customer_id:BIGINT, addressimp2_.address_id:BIGINT, addressimp2_.address_line1:VARCHAR, addressimp2_.address_line2:VARCHAR, addressimp2_.address_line3:VARCHAR, addressimp2_.city:VARCHAR, addressimp2_.company_name:VARCHAR, addressimp2_.country:VARCHAR, addressimp2_.county:VARCHAR, addressimp2_.email_address:VARCHAR, addressimp2_.fax:VARCHAR, addressimp2_.first_name:VARCHAR, addressimp2_.full_name:VARCHAR, addressimp2_.is_active:BIT, addressimp2_.is_business:BIT, addressimp2_.is_default:BIT, addressimp2_.is_mailing:BIT, addressimp2_.is_street:BIT, addressimp2_.iso_country_alpha2:VARCHAR, addressimp2_.iso_country_sub:VARCHAR, addressimp2_.last_name:VARCHAR, addressimp2_.phone_fax_id:BIGINT, addressimp2_.phone_primary_id:BIGINT, addressimp2_.phone_secondary_id:BIGINT, addressimp2_.postal_code:VARCHAR, addressimp2_.primary_phone:VARCHAR, addressimp2_.secondary_phone:VARCHAR, addressimp2_.standardized:BIT, addressimp2_.state_prov_region:VARCHAR, addressimp2_.sub_state_prov_reg:VARCHAR, addressimp2_.tokenized_address:VARCHAR, addressimp2_.verification_level:VARCHAR, addressimp2_.zip_four:VARCHAR}
}

======================================================
SqlNo=33
SQLNode {
    sqlTemplate='SELECT orderimpl0_.ORDER_ID AS ORDER_ID1_93_3_, orderimpl0_.CREATED_BY AS CREATED_2_93_3_, orderimpl0_.DATE_CREATED AS DATE_CRE3_93_3_, orderimpl0_.DATE_UPDATED AS DATE_UPD4_93_3_, orderimpl0_.UPDATED_BY AS UPDATED_5_93_3_ , orderimpl0_.CURRENCY_CODE AS CURRENC17_93_3_, orderimpl0_.CUSTOMER_ID AS CUSTOME18_93_3_, orderimpl0_.EMAIL_ADDRESS AS EMAIL_AD6_93_3_, orderimpl0_.LOCALE_CODE AS LOCALE_19_93_3_, orderimpl0_.NAME AS NAME7_93_3_ , orderimpl0_.ORDER_NUMBER AS ORDER_NU8_93_3_, orderimpl0_.IS_PREVIEW AS IS_PREVI9_93_3_, orderimpl0_.ORDER_STATUS AS ORDER_S10_93_3_, orderimpl0_.ORDER_SUBTOTAL AS ORDER_S11_93_3_, orderimpl0_.SUBMIT_DATE AS SUBMIT_12_93_3_ , orderimpl0_.TAX_OVERRIDE AS TAX_OVE13_93_3_, orderimpl0_.ORDER_TOTAL AS ORDER_T14_93_3_, orderimpl0_.TOTAL_SHIPPING AS TOTAL_S15_93_3_, orderimpl0_.TOTAL_TAX AS TOTAL_T16_93_3_, addedoffer1_.ORDER_ID AS ORDER_ID1_105_5_ , offercodei2_.OFFER_CODE_ID AS OFFER_CO2_105_5_, offercodei2_.OFFER_CODE_ID AS OFFER_CO1_87_0_, offercodei2_.ARCHIVED AS ARCHIVED2_87_0_, offercodei2_.EMAIL_ADDRESS AS EMAIL_AD3_87_0_, offercodei2_.MAX_USES AS MAX_USES4_87_0_ , offercodei2_.OFFER_ID AS OFFER_ID9_87_0_, offercodei2_.OFFER_CODE AS OFFER_CO5_87_0_, offercodei2_.END_DATE AS END_DATE6_87_0_, offercodei2_.START_DATE AS START_DA7_87_0_, offercodei2_.USES AS USES8_87_0_ , offerimpl3_.OFFER_ID AS OFFER_ID1_85_1_, offerimpl3_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_1_, offerimpl3_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_1_, offerimpl3_.ARCHIVED AS ARCHIVED4_85_1_, offerimpl3_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_1_ , offerimpl3_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_1_, offerimpl3_.OFFER_DESCRIPTION AS OFFER_DE7_85_1_, offerimpl3_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_1_, offerimpl3_.END_DATE AS END_DATE9_85_1_, offerimpl3_.MARKETING_MESSASGE AS MARKETI10_85_1_ , offerimpl3_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_1_, offerimpl3_.MAX_USES AS MAX_USE12_85_1_, offerimpl3_.OFFER_NAME AS OFFER_N13_85_1_, offerimpl3_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_1_, offerimpl3_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_1_ , offerimpl3_.ORDER_MIN_TOTAL AS ORDER_M16_85_1_, offerimpl3_.OFFER_PRIORITY AS OFFER_P17_85_1_, offerimpl3_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_1_, offerimpl3_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_1_, offerimpl3_.START_DATE AS START_D20_85_1_ , offerimpl3_.TARGET_MIN_TOTAL AS TARGET_21_85_1_, offerimpl3_.TARGET_SYSTEM AS TARGET_22_85_1_, offerimpl3_.TOTALITARIAN_OFFER AS TOTALIT23_85_1_, offerimpl3_.OFFER_TYPE AS OFFER_T24_85_1_, offerimpl3_.OFFER_VALUE AS OFFER_V25_85_1_ , customerim4_.CUSTOMER_ID AS CUSTOMER1_40_2_, customerim4_.CREATED_BY AS CREATED_2_40_2_, customerim4_.DATE_CREATED AS DATE_CRE3_40_2_, customerim4_.DATE_UPDATED AS DATE_UPD4_40_2_, customerim4_.UPDATED_BY AS UPDATED_5_40_2_ , customerim4_.CHALLENGE_ANSWER AS CHALLENG6_40_2_, customerim4_.CHALLENGE_QUESTION_ID AS CHALLEN20_40_2_, customerim4_.LOCALE_CODE AS LOCALE_21_40_2_, customerim4_.DEACTIVATED AS DEACTIVA7_40_2_, customerim4_.EMAIL_ADDRESS AS EMAIL_AD8_40_2_ , customerim4_.EXTERNAL_ID AS EXTERNAL9_40_2_, customerim4_.FIRST_NAME AS FIRST_N10_40_2_, customerim4_.IS_TAX_EXEMPT AS IS_TAX_11_40_2_, customerim4_.LAST_NAME AS LAST_NA12_40_2_, customerim4_.PASSWORD AS PASSWOR13_40_2_ , customerim4_.PASSWORD_CHANGE_REQUIRED AS PASSWOR14_40_2_, customerim4_.IS_PREVIEW AS IS_PREV15_40_2_, customerim4_.RECEIVE_EMAIL AS RECEIVE16_40_2_, customerim4_.IS_REGISTERED AS IS_REGI17_40_2_, customerim4_.TAX_EXEMPTION_CODE AS TAX_EXE18_40_2_ , customerim4_.USER_NAME AS USER_NA19_40_2_ FROM BLC_ORDER orderimpl0_ LEFT JOIN BLC_ORDER_OFFER_CODE_XREF addedoffer1_ ON orderimpl0_.ORDER_ID = addedoffer1_.ORDER_ID LEFT JOIN BLC_OFFER_CODE offercodei2_ ON addedoffer1_.OFFER_CODE_ID = offercodei2_.OFFER_CODE_ID LEFT JOIN BLC_OFFER offerimpl3_ ON offercodei2_.OFFER_ID = offerimpl3_.OFFER_ID INNER JOIN BLC_CUSTOMER customerim4_ ON orderimpl0_.CUSTOMER_ID = customerim4_.CUSTOMER_ID WHERE orderimpl0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderimpl0_.order_id:BIGINT, orderimpl0_.created_by:BIGINT, orderimpl0_.date_created:DATETIME, orderimpl0_.date_updated:DATETIME, orderimpl0_.updated_by:BIGINT, orderimpl0_.currency_code:VARCHAR, orderimpl0_.customer_id:BIGINT, orderimpl0_.email_address:VARCHAR, orderimpl0_.locale_code:VARCHAR, orderimpl0_.name:VARCHAR, orderimpl0_.order_number:VARCHAR, orderimpl0_.is_preview:BIT, orderimpl0_.order_status:VARCHAR, orderimpl0_.order_subtotal:DECIMAL, orderimpl0_.submit_date:DATETIME, orderimpl0_.tax_override:BIT, orderimpl0_.order_total:DECIMAL, orderimpl0_.total_shipping:DECIMAL, orderimpl0_.total_tax:DECIMAL, addedoffer1_.order_id:BIGINT, offercodei2_.offer_code_id:BIGINT, offercodei2_.offer_code_id:BIGINT, offercodei2_.archived:CHAR, offercodei2_.email_address:VARCHAR, offercodei2_.max_uses:INT, offercodei2_.offer_id:BIGINT, offercodei2_.offer_code:VARCHAR, offercodei2_.end_date:DATETIME, offercodei2_.start_date:DATETIME, offercodei2_.uses:INT, offerimpl3_.offer_id:BIGINT, offerimpl3_.apply_to_child_items:BIT, offerimpl3_.apply_to_sale_price:BIT, offerimpl3_.archived:CHAR, offerimpl3_.automatically_added:BIT, offerimpl3_.combinable_with_other_offers:BIT, offerimpl3_.offer_description:VARCHAR, offerimpl3_.offer_discount_type:VARCHAR, offerimpl3_.end_date:DATETIME, offerimpl3_.marketing_messasge:VARCHAR, offerimpl3_.max_uses_per_customer:BIGINT, offerimpl3_.max_uses:INT, offerimpl3_.offer_name:VARCHAR, offerimpl3_.offer_item_qualifier_rule:VARCHAR, offerimpl3_.offer_item_target_rule:VARCHAR, offerimpl3_.order_min_total:DECIMAL, offerimpl3_.offer_priority:INT, offerimpl3_.qualifying_item_min_total:DECIMAL, offerimpl3_.requires_related_tar_qual:BIT, offerimpl3_.start_date:DATETIME, offerimpl3_.target_min_total:DECIMAL, offerimpl3_.target_system:VARCHAR, offerimpl3_.totalitarian_offer:BIT, offerimpl3_.offer_type:VARCHAR, offerimpl3_.offer_value:DECIMAL, customerim4_.customer_id:BIGINT, customerim4_.created_by:BIGINT, customerim4_.date_created:DATETIME, customerim4_.date_updated:DATETIME, customerim4_.updated_by:BIGINT, customerim4_.challenge_answer:VARCHAR, customerim4_.challenge_question_id:BIGINT, customerim4_.locale_code:VARCHAR, customerim4_.deactivated:BIT, customerim4_.email_address:VARCHAR, customerim4_.external_id:VARCHAR, customerim4_.first_name:VARCHAR, customerim4_.is_tax_exempt:BIT, customerim4_.last_name:VARCHAR, customerim4_.password:VARCHAR, customerim4_.password_change_required:BIT, customerim4_.is_preview:BIT, customerim4_.receive_email:BIT, customerim4_.is_registered:BIT, customerim4_.tax_exemption_code:VARCHAR, customerim4_.user_name:VARCHAR}
}

======================================================
SqlNo=35
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=36
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=37
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=38
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"i18n.translation.enabled":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=39
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=40
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"automatically.merge.like.items":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=41
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"automatically.merge.like.items":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=42
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"automatically.merge.like.items":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=43
SQLNode {
    sqlTemplate='SELECT orderitems0_.ORDER_ID AS ORDER_I20_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_0_, orderitems0_.ORDER_ITEM_ID AS ORDER_IT1_96_1_, orderitems0_.CREATED_BY AS CREATED_2_96_1_, orderitems0_.DATE_CREATED AS DATE_CRE3_96_1_ , orderitems0_.DATE_UPDATED AS DATE_UPD4_96_1_, orderitems0_.UPDATED_BY AS UPDATED_5_96_1_, orderitems0_.CATEGORY_ID AS CATEGOR18_96_1_, orderitems0_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_1_, orderitems0_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_1_ , orderitems0_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_1_, orderitems0_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_1_, orderitems0_.NAME AS NAME9_96_1_, orderitems0_.ORDER_ID AS ORDER_I20_96_1_, orderitems0_.ORDER_ITEM_TYPE AS ORDER_I10_96_1_ , orderitems0_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_1_, orderitems0_.PERSONAL_MESSAGE_ID AS PERSONA22_96_1_, orderitems0_.PRICE AS PRICE11_96_1_, orderitems0_.QUANTITY AS QUANTIT12_96_1_, orderitems0_.RETAIL_PRICE AS RETAIL_13_96_1_ , orderitems0_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_1_, orderitems0_.SALE_PRICE AS SALE_PR15_96_1_, orderitems0_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_1_, orderitems0_.TOTAL_TAX AS TOTAL_T17_96_1_, orderitems0_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_1_ , orderitems0_1_.BASE_SALE_PRICE AS BASE_SAL2_18_1_, orderitems0_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_1_, orderitems0_1_.SKU_ID AS SKU_ID5_18_1_, orderitems0_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_1_, orderitems0_2_.BASE_SALE_PRICE AS BASE_SAL2_52_1_ , orderitems0_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_1_, orderitems0_2_.PRODUCT_ID AS PRODUCT_5_52_1_, orderitems0_2_.SKU_ID AS SKU_ID6_52_1_, orderitems0_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_1_ , CASE  WHEN orderitems0_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitems0_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitems0_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitems0_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitems0_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_1_, orderitemi1_.ORDER_ITEM_ID AS ORDER_IT1_96_2_, orderitemi1_.CREATED_BY AS CREATED_2_96_2_, orderitemi1_.DATE_CREATED AS DATE_CRE3_96_2_, orderitemi1_.DATE_UPDATED AS DATE_UPD4_96_2_ , orderitemi1_.UPDATED_BY AS UPDATED_5_96_2_, orderitemi1_.CATEGORY_ID AS CATEGOR18_96_2_, orderitemi1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_2_, orderitemi1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_2_, orderitemi1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_2_ , orderitemi1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_2_, orderitemi1_.NAME AS NAME9_96_2_, orderitemi1_.ORDER_ID AS ORDER_I20_96_2_, orderitemi1_.ORDER_ITEM_TYPE AS ORDER_I10_96_2_, orderitemi1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_2_ , orderitemi1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_2_, orderitemi1_.PRICE AS PRICE11_96_2_, orderitemi1_.QUANTITY AS QUANTIT12_96_2_, orderitemi1_.RETAIL_PRICE AS RETAIL_13_96_2_, orderitemi1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_2_ , orderitemi1_.SALE_PRICE AS SALE_PR15_96_2_, orderitemi1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_2_, orderitemi1_.TOTAL_TAX AS TOTAL_T17_96_2_, orderitemi1_1_.BASE_RETAIL_PRICE AS BASE_RET1_18_2_, orderitemi1_1_.BASE_SALE_PRICE AS BASE_SAL2_18_2_ , orderitemi1_1_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_2_, orderitemi1_1_.SKU_ID AS SKU_ID5_18_2_, orderitemi1_2_.BASE_RETAIL_PRICE AS BASE_RET1_52_2_, orderitemi1_2_.BASE_SALE_PRICE AS BASE_SAL2_52_2_, orderitemi1_2_.BUNDLE_ORDER_ITEM_ID AS BUNDLE_O4_52_2_ , orderitemi1_2_.PRODUCT_ID AS PRODUCT_5_52_2_, orderitemi1_2_.SKU_ID AS SKU_ID6_52_2_, orderitemi1_2_.SKU_BUNDLE_ITEM_ID AS SKU_BUND7_52_2_ , CASE  WHEN orderitemi1_3_.ORDER_ITEM_ID IS NOT NULL THEN 3 WHEN orderitemi1_4_.ORDER_ITEM_ID IS NOT NULL THEN 4 WHEN orderitemi1_1_.ORDER_ITEM_ID IS NOT NULL THEN 1 WHEN orderitemi1_2_.ORDER_ITEM_ID IS NOT NULL THEN 2 WHEN orderitemi1_.ORDER_ITEM_ID IS NOT NULL THEN 0 END AS clazz_2_, personalme2_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_3_, personalme2_.MESSAGE AS MESSAGE2_116_3_, personalme2_.MESSAGE_FROM AS MESSAGE_3_116_3_, personalme2_.MESSAGE_TO AS MESSAGE_4_116_3_ , personalme2_.OCCASION AS OCCASION5_116_3_, bundleorde3_.ORDER_ITEM_ID AS ORDER_IT1_96_4_, bundleorde3_1_.CREATED_BY AS CREATED_2_96_4_, bundleorde3_1_.DATE_CREATED AS DATE_CRE3_96_4_, bundleorde3_1_.DATE_UPDATED AS DATE_UPD4_96_4_ , bundleorde3_1_.UPDATED_BY AS UPDATED_5_96_4_, bundleorde3_1_.CATEGORY_ID AS CATEGOR18_96_4_, bundleorde3_1_.DISCOUNTS_ALLOWED AS DISCOUNT6_96_4_, bundleorde3_1_.GIFT_WRAP_ITEM_ID AS GIFT_WR19_96_4_, bundleorde3_1_.HAS_VALIDATION_ERRORS AS HAS_VALI7_96_4_ , bundleorde3_1_.ITEM_TAXABLE_FLAG AS ITEM_TAX8_96_4_, bundleorde3_1_.NAME AS NAME9_96_4_, bundleorde3_1_.ORDER_ID AS ORDER_I20_96_4_, bundleorde3_1_.ORDER_ITEM_TYPE AS ORDER_I10_96_4_, bundleorde3_1_.PARENT_ORDER_ITEM_ID AS PARENT_21_96_4_ , bundleorde3_1_.PERSONAL_MESSAGE_ID AS PERSONA22_96_4_, bundleorde3_1_.PRICE AS PRICE11_96_4_, bundleorde3_1_.QUANTITY AS QUANTIT12_96_4_, bundleorde3_1_.RETAIL_PRICE AS RETAIL_13_96_4_, bundleorde3_1_.RETAIL_PRICE_OVERRIDE AS RETAIL_14_96_4_ , bundleorde3_1_.SALE_PRICE AS SALE_PR15_96_4_, bundleorde3_1_.SALE_PRICE_OVERRIDE AS SALE_PR16_96_4_, bundleorde3_1_.TOTAL_TAX AS TOTAL_T17_96_4_, bundleorde3_.BASE_RETAIL_PRICE AS BASE_RET1_18_4_, bundleorde3_.BASE_SALE_PRICE AS BASE_SAL2_18_4_ , bundleorde3_.PRODUCT_BUNDLE_ID AS PRODUCT_4_18_4_, bundleorde3_.SKU_ID AS SKU_ID5_18_4_, skubundlei4_.SKU_BUNDLE_ITEM_ID AS SKU_BUND1_163_5_, skubundlei4_.PRODUCT_BUNDLE_ID AS PRODUCT_5_163_5_, skubundlei4_.ITEM_SALE_PRICE AS ITEM_SAL2_163_5_ , skubundlei4_.QUANTITY AS QUANTITY3_163_5_, skubundlei4_.SEQUENCE AS SEQUENCE4_163_5_, skubundlei4_.SKU_ID AS SKU_ID6_163_5_ FROM BLC_ORDER_ITEM orderitems0_ LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitems0_1_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitems0_2_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitems0_3_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitems0_4_ ON orderitems0_.ORDER_ITEM_ID = orderitems0_4_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM orderitemi1_ ON orderitems0_.PARENT_ORDER_ITEM_ID = orderitemi1_.ORDER_ITEM_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM orderitemi1_1_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_1_.ORDER_ITEM_ID LEFT JOIN BLC_DISCRETE_ORDER_ITEM orderitemi1_2_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_2_.ORDER_ITEM_ID LEFT JOIN BLC_DYN_DISCRETE_ORDER_ITEM orderitemi1_3_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_3_.ORDER_ITEM_ID LEFT JOIN BLC_GIFTWRAP_ORDER_ITEM orderitemi1_4_ ON orderitemi1_.ORDER_ITEM_ID = orderitemi1_4_.ORDER_ITEM_ID LEFT JOIN BLC_PERSONAL_MESSAGE personalme2_ ON orderitemi1_.PERSONAL_MESSAGE_ID = personalme2_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_BUNDLE_ORDER_ITEM bundleorde3_ ON orderitemi1_2_.BUNDLE_ORDER_ITEM_ID = bundleorde3_.ORDER_ITEM_ID LEFT JOIN BLC_ORDER_ITEM bundleorde3_1_ ON bundleorde3_.ORDER_ITEM_ID = bundleorde3_1_.ORDER_ITEM_ID LEFT JOIN BLC_SKU_BUNDLE_ITEM skubundlei4_ ON orderitemi1_2_.SKU_BUNDLE_ITEM_ID = skubundlei4_.SKU_BUNDLE_ITEM_ID WHERE orderitems0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderitems0_.order_id:BIGINT, orderitems0_.order_item_id:BIGINT, orderitems0_.order_item_id:BIGINT, orderitems0_.created_by:BIGINT, orderitems0_.date_created:DATETIME, orderitems0_.date_updated:DATETIME, orderitems0_.updated_by:BIGINT, orderitems0_.category_id:BIGINT, orderitems0_.discounts_allowed:BIT, orderitems0_.gift_wrap_item_id:BIGINT, orderitems0_.has_validation_errors:BIT, orderitems0_.item_taxable_flag:BIT, orderitems0_.name:VARCHAR, orderitems0_.order_id:BIGINT, orderitems0_.order_item_type:VARCHAR, orderitems0_.parent_order_item_id:BIGINT, orderitems0_.personal_message_id:BIGINT, orderitems0_.price:DECIMAL, orderitems0_.quantity:INT, orderitems0_.retail_price:DECIMAL, orderitems0_.retail_price_override:BIT, orderitems0_.sale_price:DECIMAL, orderitems0_.sale_price_override:BIT, orderitems0_.total_tax:DECIMAL, orderitems0_1_.base_retail_price:DECIMAL, orderitems0_1_.base_sale_price:DECIMAL, orderitems0_1_.product_bundle_id:BIGINT, orderitems0_1_.sku_id:BIGINT, orderitems0_2_.base_retail_price:DECIMAL, orderitems0_2_.base_sale_price:DECIMAL, orderitems0_2_.bundle_order_item_id:BIGINT, orderitems0_2_.product_id:BIGINT, orderitems0_2_.sku_id:BIGINT, orderitems0_2_.sku_bundle_item_id:BIGINT, clazz_1_:INT, orderitemi1_.order_item_id:BIGINT, orderitemi1_.created_by:BIGINT, orderitemi1_.date_created:DATETIME, orderitemi1_.date_updated:DATETIME, orderitemi1_.updated_by:BIGINT, orderitemi1_.category_id:BIGINT, orderitemi1_.discounts_allowed:BIT, orderitemi1_.gift_wrap_item_id:BIGINT, orderitemi1_.has_validation_errors:BIT, orderitemi1_.item_taxable_flag:BIT, orderitemi1_.name:VARCHAR, orderitemi1_.order_id:BIGINT, orderitemi1_.order_item_type:VARCHAR, orderitemi1_.parent_order_item_id:BIGINT, orderitemi1_.personal_message_id:BIGINT, orderitemi1_.price:DECIMAL, orderitemi1_.quantity:INT, orderitemi1_.retail_price:DECIMAL, orderitemi1_.retail_price_override:BIT, orderitemi1_.sale_price:DECIMAL, orderitemi1_.sale_price_override:BIT, orderitemi1_.total_tax:DECIMAL, orderitemi1_1_.base_retail_price:DECIMAL, orderitemi1_1_.base_sale_price:DECIMAL, orderitemi1_1_.product_bundle_id:BIGINT, orderitemi1_1_.sku_id:BIGINT, orderitemi1_2_.base_retail_price:DECIMAL, orderitemi1_2_.base_sale_price:DECIMAL, orderitemi1_2_.bundle_order_item_id:BIGINT, orderitemi1_2_.product_id:BIGINT, orderitemi1_2_.sku_id:BIGINT, orderitemi1_2_.sku_bundle_item_id:BIGINT, clazz_2_:INT, personalme2_.personal_message_id:BIGINT, personalme2_.message:VARCHAR, personalme2_.message_from:VARCHAR, personalme2_.message_to:VARCHAR, personalme2_.occasion:VARCHAR, bundleorde3_.order_item_id:BIGINT, bundleorde3_1_.created_by:BIGINT, bundleorde3_1_.date_created:DATETIME, bundleorde3_1_.date_updated:DATETIME, bundleorde3_1_.updated_by:BIGINT, bundleorde3_1_.category_id:BIGINT, bundleorde3_1_.discounts_allowed:BIT, bundleorde3_1_.gift_wrap_item_id:BIGINT, bundleorde3_1_.has_validation_errors:BIT, bundleorde3_1_.item_taxable_flag:BIT, bundleorde3_1_.name:VARCHAR, bundleorde3_1_.order_id:BIGINT, bundleorde3_1_.order_item_type:VARCHAR, bundleorde3_1_.parent_order_item_id:BIGINT, bundleorde3_1_.personal_message_id:BIGINT, bundleorde3_1_.price:DECIMAL, bundleorde3_1_.quantity:INT, bundleorde3_1_.retail_price:DECIMAL, bundleorde3_1_.retail_price_override:BIT, bundleorde3_1_.sale_price:DECIMAL, bundleorde3_1_.sale_price_override:BIT, bundleorde3_1_.total_tax:DECIMAL, bundleorde3_.base_retail_price:DECIMAL, bundleorde3_.base_sale_price:DECIMAL, bundleorde3_.product_bundle_id:BIGINT, bundleorde3_.sku_id:BIGINT, skubundlei4_.sku_bundle_item_id:BIGINT, skubundlei4_.product_bundle_id:BIGINT, skubundlei4_.item_sale_price:DECIMAL, skubundlei4_.quantity:INT, skubundlei4_.sequence:DECIMAL, skubundlei4_.sku_id:BIGINT}
}

======================================================
SqlNo=44
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"enable.sku.minOrderQuantity.field":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=45
SQLNode {
    sqlTemplate='SELECT productimp0_.PRODUCT_ID AS PRODUCT_1_119_0_, productimp0_.ARCHIVED AS ARCHIVED2_119_0_, productimp0_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_0_, productimp0_.CANONICAL_URL AS CANONICA4_119_0_, productimp0_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_0_ , productimp0_.DEFAULT_SKU_ID AS DEFAULT15_119_0_, productimp0_.DISPLAY_TEMPLATE AS DISPLAY_5_119_0_, productimp0_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_0_, productimp0_.MANUFACTURE AS MANUFACT7_119_0_, productimp0_.META_DESC AS META_DES8_119_0_ , productimp0_.META_TITLE AS META_TIT9_119_0_, productimp0_.MODEL AS MODEL10_119_0_, productimp0_.OVERRIDE_GENERATED_URL AS OVERRID11_119_0_, productimp0_.URL AS URL12_119_0_, productimp0_.URL_KEY AS URL_KEY13_119_0_ , productimp0_1_.AUTO_BUNDLE AS AUTO_BUN1_121_0_, productimp0_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_0_, productimp0_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_0_, productimp0_1_.PRICING_MODEL AS PRICING_4_121_0_, productimp0_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_0_ , CASE  WHEN productimp0_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp0_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_0_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim1_.ARCHIVED AS ARCHIVED4_26_1_ , categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_1_ , categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim1_.META_DESC AS META_DE11_26_1_, categoryim1_.META_TITLE AS META_TI12_26_1_, categoryim1_.NAME AS NAME13_26_1_ , categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim1_.TAX_CODE AS TAX_COD18_26_1_ , categoryim1_.URL AS URL19_26_1_, categoryim1_.URL_KEY AS URL_KEY20_26_1_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_, categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_ , categoryim2_.ARCHIVED AS ARCHIVED4_26_2_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_, categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_2_ , categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_2_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim2_.META_DESC AS META_DE11_26_2_, categoryim2_.META_TITLE AS META_TI12_26_2_ , categoryim2_.NAME AS NAME13_26_2_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_, categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_ , categoryim2_.TAX_CODE AS TAX_COD18_26_2_, categoryim2_.URL AS URL19_26_2_, categoryim2_.URL_KEY AS URL_KEY20_26_2_, skuimpl3_.SKU_ID AS SKU_ID1_160_3_, skuimpl3_.ACTIVE_END_DATE AS ACTIVE_E2_160_3_ , skuimpl3_.ACTIVE_START_DATE AS ACTIVE_S3_160_3_, skuimpl3_.AVAILABLE_FLAG AS AVAILABL4_160_3_, skuimpl3_.COST AS COST5_160_3_, skuimpl3_.CURRENCY_CODE AS CURRENC31_160_3_, skuimpl3_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_3_ , skuimpl3_.DESCRIPTION AS DESCRIPT6_160_3_, skuimpl3_.CONTAINER_SHAPE AS CONTAINE7_160_3_, skuimpl3_.DEPTH AS DEPTH8_160_3_, skuimpl3_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_3_, skuimpl3_.GIRTH AS GIRTH10_160_3_ , skuimpl3_.HEIGHT AS HEIGHT11_160_3_, skuimpl3_.CONTAINER_SIZE AS CONTAIN12_160_3_, skuimpl3_.WIDTH AS WIDTH13_160_3_, skuimpl3_.DISCOUNTABLE_FLAG AS DISCOUN14_160_3_, skuimpl3_.DISPLAY_TEMPLATE AS DISPLAY15_160_3_ , skuimpl3_.EXTERNAL_ID AS EXTERNA16_160_3_, skuimpl3_.FULFILLMENT_TYPE AS FULFILL17_160_3_, skuimpl3_.INVENTORY_TYPE AS INVENTO18_160_3_, skuimpl3_.IS_MACHINE_SORTABLE AS IS_MACH19_160_3_, skuimpl3_.LONG_DESCRIPTION AS LONG_DE20_160_3_ , skuimpl3_.NAME AS NAME21_160_3_, skuimpl3_.ADDL_PRODUCT_ID AS ADDL_PR33_160_3_, skuimpl3_.QUANTITY_AVAILABLE AS QUANTIT22_160_3_, skuimpl3_.RETAIL_PRICE AS RETAIL_23_160_3_, skuimpl3_.SALE_PRICE AS SALE_PR24_160_3_ , skuimpl3_.TAX_CODE AS TAX_COD25_160_3_, skuimpl3_.TAXABLE_FLAG AS TAXABLE26_160_3_, skuimpl3_.UPC AS UPC27_160_3_, skuimpl3_.URL_KEY AS URL_KEY28_160_3_, skuimpl3_.WEIGHT AS WEIGHT29_160_3_ , skuimpl3_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_3_, broadleafc4_.CURRENCY_CODE AS CURRENCY1_38_4_, broadleafc4_.DEFAULT_FLAG AS DEFAULT_2_38_4_, broadleafc4_.FRIENDLY_NAME AS FRIENDLY3_38_4_, productimp5_.PRODUCT_ID AS PRODUCT_1_119_5_ , productimp5_.ARCHIVED AS ARCHIVED2_119_5_, productimp5_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_5_, productimp5_.CANONICAL_URL AS CANONICA4_119_5_, productimp5_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_5_, productimp5_.DEFAULT_SKU_ID AS DEFAULT15_119_5_ , productimp5_.DISPLAY_TEMPLATE AS DISPLAY_5_119_5_, productimp5_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_5_, productimp5_.MANUFACTURE AS MANUFACT7_119_5_, productimp5_.META_DESC AS META_DES8_119_5_, productimp5_.META_TITLE AS META_TIT9_119_5_ , productimp5_.MODEL AS MODEL10_119_5_, productimp5_.OVERRIDE_GENERATED_URL AS OVERRID11_119_5_, productimp5_.URL AS URL12_119_5_, productimp5_.URL_KEY AS URL_KEY13_119_5_, productimp5_1_.AUTO_BUNDLE AS AUTO_BUN1_121_5_ , productimp5_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_5_, productimp5_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_5_, productimp5_1_.PRICING_MODEL AS PRICING_4_121_5_, productimp5_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_5_ , CASE  WHEN productimp5_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp5_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_5_, productimp6_.PRODUCT_ID AS PRODUCT_1_119_6_, productimp6_.ARCHIVED AS ARCHIVED2_119_6_, productimp6_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_6_, productimp6_.CANONICAL_URL AS CANONICA4_119_6_ , productimp6_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_6_, productimp6_.DEFAULT_SKU_ID AS DEFAULT15_119_6_, productimp6_.DISPLAY_TEMPLATE AS DISPLAY_5_119_6_, productimp6_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_6_, productimp6_.MANUFACTURE AS MANUFACT7_119_6_ , productimp6_.META_DESC AS META_DES8_119_6_, productimp6_.META_TITLE AS META_TIT9_119_6_, productimp6_.MODEL AS MODEL10_119_6_, productimp6_.OVERRIDE_GENERATED_URL AS OVERRID11_119_6_, productimp6_.URL AS URL12_119_6_ , productimp6_.URL_KEY AS URL_KEY13_119_6_, productimp6_1_.AUTO_BUNDLE AS AUTO_BUN1_121_6_, productimp6_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_6_, productimp6_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_6_, productimp6_1_.PRICING_MODEL AS PRICING_4_121_6_ , productimp6_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_6_ , CASE  WHEN productimp6_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp6_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_6_ FROM BLC_PRODUCT productimp0_ LEFT JOIN BLC_PRODUCT_BUNDLE productimp0_1_ ON productimp0_.PRODUCT_ID = productimp0_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim1_ ON productimp0_.DEFAULT_CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl3_ ON productimp0_.DEFAULT_SKU_ID = skuimpl3_.SKU_ID LEFT JOIN BLC_CURRENCY broadleafc4_ ON skuimpl3_.CURRENCY_CODE = broadleafc4_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp5_ ON skuimpl3_.DEFAULT_PRODUCT_ID = productimp5_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp5_1_ ON productimp5_.PRODUCT_ID = productimp5_1_.PRODUCT_ID LEFT JOIN BLC_PRODUCT productimp6_ ON skuimpl3_.ADDL_PRODUCT_ID = productimp6_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp6_1_ ON productimp6_.PRODUCT_ID = productimp6_1_.PRODUCT_ID WHERE productimp0_.PRODUCT_ID = ?',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={productimp0_.product_id:BIGINT, productimp0_.archived:CHAR, productimp0_.can_sell_without_options:BIT, productimp0_.canonical_url:VARCHAR, productimp0_.default_category_id:BIGINT, productimp0_.default_sku_id:BIGINT, productimp0_.display_template:VARCHAR, productimp0_.is_featured_product:BIT, productimp0_.manufacture:VARCHAR, productimp0_.meta_desc:VARCHAR, productimp0_.meta_title:VARCHAR, productimp0_.model:VARCHAR, productimp0_.override_generated_url:BIT, productimp0_.url:VARCHAR, productimp0_.url_key:VARCHAR, productimp0_1_.auto_bundle:BIT, productimp0_1_.bundle_promotable:BIT, productimp0_1_.items_promotable:BIT, productimp0_1_.pricing_model:VARCHAR, productimp0_1_.bundle_priority:INT, clazz_0_:INT, categoryim1_.category_id:BIGINT, categoryim1_.active_end_date:DATETIME, categoryim1_.active_start_date:DATETIME, categoryim1_.archived:CHAR, categoryim1_.default_parent_category_id:BIGINT, categoryim1_.description:VARCHAR, categoryim1_.display_template:VARCHAR, categoryim1_.external_id:VARCHAR, categoryim1_.fulfillment_type:VARCHAR, categoryim1_.inventory_type:VARCHAR, categoryim1_.long_description:LONGTEXT, categoryim1_.meta_desc:VARCHAR, categoryim1_.meta_title:VARCHAR, categoryim1_.name:VARCHAR, categoryim1_.override_generated_url:BIT, categoryim1_.product_desc_pattern_override:VARCHAR, categoryim1_.product_title_pattern_override:VARCHAR, categoryim1_.root_display_order:DECIMAL, categoryim1_.tax_code:VARCHAR, categoryim1_.url:VARCHAR, categoryim1_.url_key:VARCHAR, categoryim2_.category_id:BIGINT, categoryim2_.active_end_date:DATETIME, categoryim2_.active_start_date:DATETIME, categoryim2_.archived:CHAR, categoryim2_.default_parent_category_id:BIGINT, categoryim2_.description:VARCHAR, categoryim2_.display_template:VARCHAR, categoryim2_.external_id:VARCHAR, categoryim2_.fulfillment_type:VARCHAR, categoryim2_.inventory_type:VARCHAR, categoryim2_.long_description:LONGTEXT, categoryim2_.meta_desc:VARCHAR, categoryim2_.meta_title:VARCHAR, categoryim2_.name:VARCHAR, categoryim2_.override_generated_url:BIT, categoryim2_.product_desc_pattern_override:VARCHAR, categoryim2_.product_title_pattern_override:VARCHAR, categoryim2_.root_display_order:DECIMAL, categoryim2_.tax_code:VARCHAR, categoryim2_.url:VARCHAR, categoryim2_.url_key:VARCHAR, skuimpl3_.sku_id:BIGINT, skuimpl3_.active_end_date:DATETIME, skuimpl3_.active_start_date:DATETIME, skuimpl3_.available_flag:CHAR, skuimpl3_.cost:DECIMAL, skuimpl3_.currency_code:VARCHAR, skuimpl3_.default_product_id:BIGINT, skuimpl3_.description:VARCHAR, skuimpl3_.container_shape:VARCHAR, skuimpl3_.depth:DECIMAL, skuimpl3_.dimension_unit_of_measure:VARCHAR, skuimpl3_.girth:DECIMAL, skuimpl3_.height:DECIMAL, skuimpl3_.container_size:VARCHAR, skuimpl3_.width:DECIMAL, skuimpl3_.discountable_flag:CHAR, skuimpl3_.display_template:VARCHAR, skuimpl3_.external_id:VARCHAR, skuimpl3_.fulfillment_type:VARCHAR, skuimpl3_.inventory_type:VARCHAR, skuimpl3_.is_machine_sortable:BIT, skuimpl3_.long_description:LONGTEXT, skuimpl3_.name:VARCHAR, skuimpl3_.addl_product_id:BIGINT, skuimpl3_.quantity_available:INT, skuimpl3_.retail_price:DECIMAL, skuimpl3_.sale_price:DECIMAL, skuimpl3_.tax_code:VARCHAR, skuimpl3_.taxable_flag:CHAR, skuimpl3_.upc:VARCHAR, skuimpl3_.url_key:VARCHAR, skuimpl3_.weight:DECIMAL, skuimpl3_.weight_unit_of_measure:VARCHAR, broadleafc4_.currency_code:VARCHAR, broadleafc4_.default_flag:BIT, broadleafc4_.friendly_name:VARCHAR, productimp5_.product_id:BIGINT, productimp5_.archived:CHAR, productimp5_.can_sell_without_options:BIT, productimp5_.canonical_url:VARCHAR, productimp5_.default_category_id:BIGINT, productimp5_.default_sku_id:BIGINT, productimp5_.display_template:VARCHAR, productimp5_.is_featured_product:BIT, productimp5_.manufacture:VARCHAR, productimp5_.meta_desc:VARCHAR, productimp5_.meta_title:VARCHAR, productimp5_.model:VARCHAR, productimp5_.override_generated_url:BIT, productimp5_.url:VARCHAR, productimp5_.url_key:VARCHAR, productimp5_1_.auto_bundle:BIT, productimp5_1_.bundle_promotable:BIT, productimp5_1_.items_promotable:BIT, productimp5_1_.pricing_model:VARCHAR, productimp5_1_.bundle_priority:INT, clazz_5_:INT, productimp6_.product_id:BIGINT, productimp6_.archived:CHAR, productimp6_.can_sell_without_options:BIT, productimp6_.canonical_url:VARCHAR, productimp6_.default_category_id:BIGINT, productimp6_.default_sku_id:BIGINT, productimp6_.display_template:VARCHAR, productimp6_.is_featured_product:BIT, productimp6_.manufacture:VARCHAR, productimp6_.meta_desc:VARCHAR, productimp6_.meta_title:VARCHAR, productimp6_.model:VARCHAR, productimp6_.override_generated_url:BIT, productimp6_.url:VARCHAR, productimp6_.url_key:VARCHAR, productimp6_1_.auto_bundle:BIT, productimp6_1_.bundle_promotable:BIT, productimp6_1_.items_promotable:BIT, productimp6_1_.pricing_model:VARCHAR, productimp6_1_.bundle_priority:INT, clazz_6_:INT}
}

======================================================
SqlNo=46
SQLNode {
    sqlTemplate='SELECT productopt0_.PRODUCT_ID AS PRODUCT_2_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_1_, productopt0_.PRODUCT_ID AS PRODUCT_2_126_1_, productopt0_.PRODUCT_OPTION_ID AS PRODUCT_3_126_1_ , productopt1_.PRODUCT_OPTION_ID AS PRODUCT_1_124_0_, productopt1_.ATTRIBUTE_NAME AS ATTRIBUT2_124_0_, productopt1_.DISPLAY_ORDER AS DISPLAY_3_124_0_, productopt1_.ERROR_CODE AS ERROR_CO4_124_0_, productopt1_.ERROR_MESSAGE AS ERROR_ME5_124_0_ , productopt1_.LABEL AS LABEL6_124_0_, productopt1_.NAME AS NAME7_124_0_, productopt1_.VALIDATION_STRATEGY_TYPE AS VALIDATI8_124_0_, productopt1_.VALIDATION_TYPE AS VALIDATI9_124_0_, productopt1_.REQUIRED AS REQUIRE10_124_0_ , productopt1_.OPTION_TYPE AS OPTION_11_124_0_, productopt1_.USE_IN_SKU_GENERATION AS USE_IN_12_124_0_, productopt1_.VALIDATION_STRING AS VALIDAT13_124_0_ FROM BLC_PRODUCT_OPTION_XREF productopt0_ INNER JOIN BLC_PRODUCT_OPTION productopt1_ ON productopt0_.PRODUCT_OPTION_ID = productopt1_.PRODUCT_OPTION_ID WHERE productopt0_.PRODUCT_ID = ?',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={productopt0_.product_id:BIGINT, productopt0_.product_option_xref_id:BIGINT, productopt0_.product_option_xref_id:BIGINT, productopt0_.product_id:BIGINT, productopt0_.product_option_id:BIGINT, productopt1_.product_option_id:BIGINT, productopt1_.attribute_name:VARCHAR, productopt1_.display_order:INT, productopt1_.error_code:VARCHAR, productopt1_.error_message:VARCHAR, productopt1_.label:VARCHAR, productopt1_.name:VARCHAR, productopt1_.validation_strategy_type:VARCHAR, productopt1_.validation_type:VARCHAR, productopt1_.required:BIT, productopt1_.option_type:VARCHAR, productopt1_.use_in_sku_generation:BIT, productopt1_.validation_string:VARCHAR}
}

======================================================
SqlNo=47
SQLNode {
    sqlTemplate='SELECT additional0_.ADDL_PRODUCT_ID AS ADDL_PR33_160_5_, additional0_.SKU_ID AS SKU_ID1_160_5_, additional0_.SKU_ID AS SKU_ID1_160_4_, additional0_.ACTIVE_END_DATE AS ACTIVE_E2_160_4_, additional0_.ACTIVE_START_DATE AS ACTIVE_S3_160_4_ , additional0_.AVAILABLE_FLAG AS AVAILABL4_160_4_, additional0_.COST AS COST5_160_4_, additional0_.CURRENCY_CODE AS CURRENC31_160_4_, additional0_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_4_, additional0_.DESCRIPTION AS DESCRIPT6_160_4_ , additional0_.CONTAINER_SHAPE AS CONTAINE7_160_4_, additional0_.DEPTH AS DEPTH8_160_4_, additional0_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_4_, additional0_.GIRTH AS GIRTH10_160_4_, additional0_.HEIGHT AS HEIGHT11_160_4_ , additional0_.CONTAINER_SIZE AS CONTAIN12_160_4_, additional0_.WIDTH AS WIDTH13_160_4_, additional0_.DISCOUNTABLE_FLAG AS DISCOUN14_160_4_, additional0_.DISPLAY_TEMPLATE AS DISPLAY15_160_4_, additional0_.EXTERNAL_ID AS EXTERNA16_160_4_ , additional0_.FULFILLMENT_TYPE AS FULFILL17_160_4_, additional0_.INVENTORY_TYPE AS INVENTO18_160_4_, additional0_.IS_MACHINE_SORTABLE AS IS_MACH19_160_4_, additional0_.LONG_DESCRIPTION AS LONG_DE20_160_4_, additional0_.NAME AS NAME21_160_4_ , additional0_.ADDL_PRODUCT_ID AS ADDL_PR33_160_4_, additional0_.QUANTITY_AVAILABLE AS QUANTIT22_160_4_, additional0_.RETAIL_PRICE AS RETAIL_23_160_4_, additional0_.SALE_PRICE AS SALE_PR24_160_4_, additional0_.TAX_CODE AS TAX_COD25_160_4_ , additional0_.TAXABLE_FLAG AS TAXABLE26_160_4_, additional0_.UPC AS UPC27_160_4_, additional0_.URL_KEY AS URL_KEY28_160_4_, additional0_.WEIGHT AS WEIGHT29_160_4_, additional0_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_4_ , broadleafc1_.CURRENCY_CODE AS CURRENCY1_38_0_, broadleafc1_.DEFAULT_FLAG AS DEFAULT_2_38_0_, broadleafc1_.FRIENDLY_NAME AS FRIENDLY3_38_0_, productimp2_.PRODUCT_ID AS PRODUCT_1_119_1_, productimp2_.ARCHIVED AS ARCHIVED2_119_1_ , productimp2_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_1_, productimp2_.CANONICAL_URL AS CANONICA4_119_1_, productimp2_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_1_, productimp2_.DEFAULT_SKU_ID AS DEFAULT15_119_1_, productimp2_.DISPLAY_TEMPLATE AS DISPLAY_5_119_1_ , productimp2_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_1_, productimp2_.MANUFACTURE AS MANUFACT7_119_1_, productimp2_.META_DESC AS META_DES8_119_1_, productimp2_.META_TITLE AS META_TIT9_119_1_, productimp2_.MODEL AS MODEL10_119_1_ , productimp2_.OVERRIDE_GENERATED_URL AS OVERRID11_119_1_, productimp2_.URL AS URL12_119_1_, productimp2_.URL_KEY AS URL_KEY13_119_1_, productimp2_1_.AUTO_BUNDLE AS AUTO_BUN1_121_1_, productimp2_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_1_ , productimp2_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_1_, productimp2_1_.PRICING_MODEL AS PRICING_4_121_1_, productimp2_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_1_ , CASE  WHEN productimp2_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp2_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_1_, categoryim3_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim3_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_, categoryim3_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_, categoryim3_.ARCHIVED AS ARCHIVED4_26_2_ , categoryim3_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim3_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim3_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_, categoryim3_.EXTERNAL_ID AS EXTERNAL7_26_2_, categoryim3_.FULFILLMENT_TYPE AS FULFILLM8_26_2_ , categoryim3_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim3_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim3_.META_DESC AS META_DE11_26_2_, categoryim3_.META_TITLE AS META_TI12_26_2_, categoryim3_.NAME AS NAME13_26_2_ , categoryim3_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim3_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim3_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_, categoryim3_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_, categoryim3_.TAX_CODE AS TAX_COD18_26_2_ , categoryim3_.URL AS URL19_26_2_, categoryim3_.URL_KEY AS URL_KEY20_26_2_, skuimpl4_.SKU_ID AS SKU_ID1_160_3_, skuimpl4_.ACTIVE_END_DATE AS ACTIVE_E2_160_3_, skuimpl4_.ACTIVE_START_DATE AS ACTIVE_S3_160_3_ , skuimpl4_.AVAILABLE_FLAG AS AVAILABL4_160_3_, skuimpl4_.COST AS COST5_160_3_, skuimpl4_.CURRENCY_CODE AS CURRENC31_160_3_, skuimpl4_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_3_, skuimpl4_.DESCRIPTION AS DESCRIPT6_160_3_ , skuimpl4_.CONTAINER_SHAPE AS CONTAINE7_160_3_, skuimpl4_.DEPTH AS DEPTH8_160_3_, skuimpl4_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_3_, skuimpl4_.GIRTH AS GIRTH10_160_3_, skuimpl4_.HEIGHT AS HEIGHT11_160_3_ , skuimpl4_.CONTAINER_SIZE AS CONTAIN12_160_3_, skuimpl4_.WIDTH AS WIDTH13_160_3_, skuimpl4_.DISCOUNTABLE_FLAG AS DISCOUN14_160_3_, skuimpl4_.DISPLAY_TEMPLATE AS DISPLAY15_160_3_, skuimpl4_.EXTERNAL_ID AS EXTERNA16_160_3_ , skuimpl4_.FULFILLMENT_TYPE AS FULFILL17_160_3_, skuimpl4_.INVENTORY_TYPE AS INVENTO18_160_3_, skuimpl4_.IS_MACHINE_SORTABLE AS IS_MACH19_160_3_, skuimpl4_.LONG_DESCRIPTION AS LONG_DE20_160_3_, skuimpl4_.NAME AS NAME21_160_3_ , skuimpl4_.ADDL_PRODUCT_ID AS ADDL_PR33_160_3_, skuimpl4_.QUANTITY_AVAILABLE AS QUANTIT22_160_3_, skuimpl4_.RETAIL_PRICE AS RETAIL_23_160_3_, skuimpl4_.SALE_PRICE AS SALE_PR24_160_3_, skuimpl4_.TAX_CODE AS TAX_COD25_160_3_ , skuimpl4_.TAXABLE_FLAG AS TAXABLE26_160_3_, skuimpl4_.UPC AS UPC27_160_3_, skuimpl4_.URL_KEY AS URL_KEY28_160_3_, skuimpl4_.WEIGHT AS WEIGHT29_160_3_, skuimpl4_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_3_ FROM BLC_SKU additional0_ LEFT JOIN BLC_CURRENCY broadleafc1_ ON additional0_.CURRENCY_CODE = broadleafc1_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp2_ ON additional0_.DEFAULT_PRODUCT_ID = productimp2_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp2_1_ ON productimp2_.PRODUCT_ID = productimp2_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim3_ ON productimp2_.DEFAULT_CATEGORY_ID = categoryim3_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl4_ ON productimp2_.DEFAULT_SKU_ID = skuimpl4_.SKU_ID WHERE additional0_.ADDL_PRODUCT_ID = ?',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={additional0_.addl_product_id:BIGINT, additional0_.sku_id:BIGINT, additional0_.sku_id:BIGINT, additional0_.active_end_date:DATETIME, additional0_.active_start_date:DATETIME, additional0_.available_flag:CHAR, additional0_.cost:DECIMAL, additional0_.currency_code:VARCHAR, additional0_.default_product_id:BIGINT, additional0_.description:VARCHAR, additional0_.container_shape:VARCHAR, additional0_.depth:DECIMAL, additional0_.dimension_unit_of_measure:VARCHAR, additional0_.girth:DECIMAL, additional0_.height:DECIMAL, additional0_.container_size:VARCHAR, additional0_.width:DECIMAL, additional0_.discountable_flag:CHAR, additional0_.display_template:VARCHAR, additional0_.external_id:VARCHAR, additional0_.fulfillment_type:VARCHAR, additional0_.inventory_type:VARCHAR, additional0_.is_machine_sortable:BIT, additional0_.long_description:LONGTEXT, additional0_.name:VARCHAR, additional0_.addl_product_id:BIGINT, additional0_.quantity_available:INT, additional0_.retail_price:DECIMAL, additional0_.sale_price:DECIMAL, additional0_.tax_code:VARCHAR, additional0_.taxable_flag:CHAR, additional0_.upc:VARCHAR, additional0_.url_key:VARCHAR, additional0_.weight:DECIMAL, additional0_.weight_unit_of_measure:VARCHAR, broadleafc1_.currency_code:VARCHAR, broadleafc1_.default_flag:BIT, broadleafc1_.friendly_name:VARCHAR, productimp2_.product_id:BIGINT, productimp2_.archived:CHAR, productimp2_.can_sell_without_options:BIT, productimp2_.canonical_url:VARCHAR, productimp2_.default_category_id:BIGINT, productimp2_.default_sku_id:BIGINT, productimp2_.display_template:VARCHAR, productimp2_.is_featured_product:BIT, productimp2_.manufacture:VARCHAR, productimp2_.meta_desc:VARCHAR, productimp2_.meta_title:VARCHAR, productimp2_.model:VARCHAR, productimp2_.override_generated_url:BIT, productimp2_.url:VARCHAR, productimp2_.url_key:VARCHAR, productimp2_1_.auto_bundle:BIT, productimp2_1_.bundle_promotable:BIT, productimp2_1_.items_promotable:BIT, productimp2_1_.pricing_model:VARCHAR, productimp2_1_.bundle_priority:INT, clazz_1_:INT, categoryim3_.category_id:BIGINT, categoryim3_.active_end_date:DATETIME, categoryim3_.active_start_date:DATETIME, categoryim3_.archived:CHAR, categoryim3_.default_parent_category_id:BIGINT, categoryim3_.description:VARCHAR, categoryim3_.display_template:VARCHAR, categoryim3_.external_id:VARCHAR, categoryim3_.fulfillment_type:VARCHAR, categoryim3_.inventory_type:VARCHAR, categoryim3_.long_description:LONGTEXT, categoryim3_.meta_desc:VARCHAR, categoryim3_.meta_title:VARCHAR, categoryim3_.name:VARCHAR, categoryim3_.override_generated_url:BIT, categoryim3_.product_desc_pattern_override:VARCHAR, categoryim3_.product_title_pattern_override:VARCHAR, categoryim3_.root_display_order:DECIMAL, categoryim3_.tax_code:VARCHAR, categoryim3_.url:VARCHAR, categoryim3_.url_key:VARCHAR, skuimpl4_.sku_id:BIGINT, skuimpl4_.active_end_date:DATETIME, skuimpl4_.active_start_date:DATETIME, skuimpl4_.available_flag:CHAR, skuimpl4_.cost:DECIMAL, skuimpl4_.currency_code:VARCHAR, skuimpl4_.default_product_id:BIGINT, skuimpl4_.description:VARCHAR, skuimpl4_.container_shape:VARCHAR, skuimpl4_.depth:DECIMAL, skuimpl4_.dimension_unit_of_measure:VARCHAR, skuimpl4_.girth:DECIMAL, skuimpl4_.height:DECIMAL, skuimpl4_.container_size:VARCHAR, skuimpl4_.width:DECIMAL, skuimpl4_.discountable_flag:CHAR, skuimpl4_.display_template:VARCHAR, skuimpl4_.external_id:VARCHAR, skuimpl4_.fulfillment_type:VARCHAR, skuimpl4_.inventory_type:VARCHAR, skuimpl4_.is_machine_sortable:BIT, skuimpl4_.long_description:LONGTEXT, skuimpl4_.name:VARCHAR, skuimpl4_.addl_product_id:BIGINT, skuimpl4_.quantity_available:INT, skuimpl4_.retail_price:DECIMAL, skuimpl4_.sale_price:DECIMAL, skuimpl4_.tax_code:VARCHAR, skuimpl4_.taxable_flag:CHAR, skuimpl4_.upc:VARCHAR, skuimpl4_.url_key:VARCHAR, skuimpl4_.weight:DECIMAL, skuimpl4_.weight_unit_of_measure:VARCHAR}
}

======================================================
SqlNo=48
SQLNode {
    sqlTemplate='SELECT allparentc0_.PRODUCT_ID AS PRODUCT_5_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_3_, allparentc0_.CATEGORY_PRODUCT_ID AS CATEGORY1_29_2_, allparentc0_.CATEGORY_ID AS CATEGORY4_29_2_, allparentc0_.DEFAULT_REFERENCE AS DEFAULT_2_29_2_ , allparentc0_.DISPLAY_ORDER AS DISPLAY_3_29_2_, allparentc0_.PRODUCT_ID AS PRODUCT_5_29_2_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_0_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_0_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_0_ , categoryim1_.ARCHIVED AS ARCHIVED4_26_0_, categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_0_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_0_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_0_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_0_ , categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_0_, categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_0_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_0_, categoryim1_.META_DESC AS META_DE11_26_0_, categoryim1_.META_TITLE AS META_TI12_26_0_ , categoryim1_.NAME AS NAME13_26_0_, categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_0_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_0_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_0_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_0_ , categoryim1_.TAX_CODE AS TAX_COD18_26_0_, categoryim1_.URL AS URL19_26_0_, categoryim1_.URL_KEY AS URL_KEY20_26_0_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_ , categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim2_.ARCHIVED AS ARCHIVED4_26_1_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_ , categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_1_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim2_.META_DESC AS META_DE11_26_1_ , categoryim2_.META_TITLE AS META_TI12_26_1_, categoryim2_.NAME AS NAME13_26_1_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_ , categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim2_.TAX_CODE AS TAX_COD18_26_1_, categoryim2_.URL AS URL19_26_1_, categoryim2_.URL_KEY AS URL_KEY20_26_1_ FROM BLC_CATEGORY_PRODUCT_XREF allparentc0_ INNER JOIN BLC_CATEGORY categoryim1_ ON allparentc0_.CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID WHERE allparentc0_.PRODUCT_ID = ? ORDER BY allparentc0_.DISPLAY_ORDER',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={allparentc0_.product_id:BIGINT, allparentc0_.category_product_id:BIGINT, allparentc0_.category_product_id:BIGINT, allparentc0_.category_id:BIGINT, allparentc0_.default_reference:BIT, allparentc0_.display_order:DECIMAL, allparentc0_.product_id:BIGINT, categoryim1_.category_id:BIGINT, categoryim1_.active_end_date:DATETIME, categoryim1_.active_start_date:DATETIME, categoryim1_.archived:CHAR, categoryim1_.default_parent_category_id:BIGINT, categoryim1_.description:VARCHAR, categoryim1_.display_template:VARCHAR, categoryim1_.external_id:VARCHAR, categoryim1_.fulfillment_type:VARCHAR, categoryim1_.inventory_type:VARCHAR, categoryim1_.long_description:LONGTEXT, categoryim1_.meta_desc:VARCHAR, categoryim1_.meta_title:VARCHAR, categoryim1_.name:VARCHAR, categoryim1_.override_generated_url:BIT, categoryim1_.product_desc_pattern_override:VARCHAR, categoryim1_.product_title_pattern_override:VARCHAR, categoryim1_.root_display_order:DECIMAL, categoryim1_.tax_code:VARCHAR, categoryim1_.url:VARCHAR, categoryim1_.url_key:VARCHAR, categoryim2_.category_id:BIGINT, categoryim2_.active_end_date:DATETIME, categoryim2_.active_start_date:DATETIME, categoryim2_.archived:CHAR, categoryim2_.default_parent_category_id:BIGINT, categoryim2_.description:VARCHAR, categoryim2_.display_template:VARCHAR, categoryim2_.external_id:VARCHAR, categoryim2_.fulfillment_type:VARCHAR, categoryim2_.inventory_type:VARCHAR, categoryim2_.long_description:LONGTEXT, categoryim2_.meta_desc:VARCHAR, categoryim2_.meta_title:VARCHAR, categoryim2_.name:VARCHAR, categoryim2_.override_generated_url:BIT, categoryim2_.product_desc_pattern_override:VARCHAR, categoryim2_.product_title_pattern_override:VARCHAR, categoryim2_.root_display_order:DECIMAL, categoryim2_.tax_code:VARCHAR, categoryim2_.url:VARCHAR, categoryim2_.url_key:VARCHAR}
}

======================================================
SqlNo=49
SQLNode {
    sqlTemplate='SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = ? AND translatio0_.ENTITY_ID = ? AND translatio0_.FIELD_NAME = ? AND translatio0_.LOCALE_CODE LIKE ?',
    parameters={"Sku":VARCHAR, CONVERT(RS_q45_r1_col64, CHAR):VARCHAR, "name":VARCHAR, "en%":VARCHAR},
    retVals={translatio0_.translation_id:BIGINT, translatio0_.entity_id:VARCHAR, translatio0_.entity_type:VARCHAR, translatio0_.field_name:VARCHAR, translatio0_.locale_code:VARCHAR, translatio0_.translated_value:LONGTEXT}
}

======================================================
SqlNo=50
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=51
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderItemImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}

======================================================
SqlNo=52
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q51_r1_col1 + 50):BIGINT, RS_q51_r1_col1:BIGINT, "OrderItemImpl":VARCHAR},
    retVals={}
}

======================================================
SqlNo=54
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=55
SQLNode {
    sqlTemplate='SELECT fulfillmen0_.ORDER_ID AS ORDER_I23_66_0_, fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM1_66_0_, fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM1_66_1_, fulfillmen0_.ADDRESS_ID AS ADDRESS21_66_1_, fulfillmen0_.DELIVERY_INSTRUCTION AS DELIVERY2_66_1_ , fulfillmen0_.FULFILLMENT_OPTION_ID AS FULFILL22_66_1_, fulfillmen0_.PRICE AS PRICE3_66_1_, fulfillmen0_.SHIPPING_PRICE_TAXABLE AS SHIPPING4_66_1_, fulfillmen0_.MERCHANDISE_TOTAL AS MERCHAND5_66_1_, fulfillmen0_.METHOD AS METHOD6_66_1_ , fulfillmen0_.ORDER_ID AS ORDER_I23_66_1_, fulfillmen0_.PERSONAL_MESSAGE_ID AS PERSONA24_66_1_, fulfillmen0_.PHONE_ID AS PHONE_I25_66_1_, fulfillmen0_.IS_PRIMARY AS IS_PRIMA7_66_1_, fulfillmen0_.REFERENCE_NUMBER AS REFERENC8_66_1_ , fulfillmen0_.RETAIL_PRICE AS RETAIL_P9_66_1_, fulfillmen0_.SALE_PRICE AS SALE_PR10_66_1_, fulfillmen0_.FULFILLMENT_GROUP_SEQUNCE AS FULFILL11_66_1_, fulfillmen0_.SERVICE AS SERVICE12_66_1_, fulfillmen0_.SHIPPING_OVERRIDE AS SHIPPIN13_66_1_ , fulfillmen0_.STATUS AS STATUS14_66_1_, fulfillmen0_.TOTAL AS TOTAL15_66_1_, fulfillmen0_.TOTAL_FEE_TAX AS TOTAL_F16_66_1_, fulfillmen0_.TOTAL_FG_TAX AS TOTAL_F17_66_1_, fulfillmen0_.TOTAL_ITEM_TAX AS TOTAL_I18_66_1_ , fulfillmen0_.TOTAL_TAX AS TOTAL_T19_66_1_, fulfillmen0_.TYPE AS TYPE20_66_1_, addressimp1_.ADDRESS_ID AS ADDRESS_1_1_2_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_2_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_2_ , addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_2_, addressimp1_.CITY AS CITY5_1_2_, addressimp1_.COMPANY_NAME AS COMPANY_6_1_2_, addressimp1_.COUNTRY AS COUNTRY27_1_2_, addressimp1_.COUNTY AS COUNTY7_1_2_ , addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_2_, addressimp1_.FAX AS FAX9_1_2_, addressimp1_.FIRST_NAME AS FIRST_N10_1_2_, addressimp1_.FULL_NAME AS FULL_NA11_1_2_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_2_ , addressimp1_.IS_BUSINESS AS IS_BUSI13_1_2_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_2_, addressimp1_.IS_MAILING AS IS_MAIL15_1_2_, addressimp1_.IS_STREET AS IS_STRE16_1_2_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_2_ , addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_2_, addressimp1_.LAST_NAME AS LAST_NA18_1_2_, addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_2_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_2_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_2_ , addressimp1_.POSTAL_CODE AS POSTAL_19_1_2_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_2_, addressimp1_.SECONDARY_PHONE AS SECONDA21_1_2_, addressimp1_.STANDARDIZED AS STANDAR22_1_2_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_2_ , addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_2_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_2_, addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_2_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_2_, countryimp2_.ABBREVIATION AS ABBREVIA1_35_3_ , countryimp2_.NAME AS NAME2_35_3_, isocountry3_.ALPHA_2 AS ALPHA_1_80_4_, isocountry3_.ALPHA_3 AS ALPHA_2_80_4_, isocountry3_.NAME AS NAME3_80_4_, isocountry3_.NUMERIC_CODE AS NUMERIC_4_80_4_ , isocountry3_.STATUS AS STATUS5_80_4_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_5_, phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_5_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_5_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_5_ , phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_5_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_5_, phoneimpl5_.PHONE_ID AS PHONE_ID1_118_6_, phoneimpl5_.COUNTRY_CODE AS COUNTRY_2_118_6_, phoneimpl5_.EXTENSION AS EXTENSIO3_118_6_ , phoneimpl5_.IS_ACTIVE AS IS_ACTIV4_118_6_, phoneimpl5_.IS_DEFAULT AS IS_DEFAU5_118_6_, phoneimpl5_.PHONE_NUMBER AS PHONE_NU6_118_6_, phoneimpl6_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl6_.COUNTRY_CODE AS COUNTRY_2_118_7_ , phoneimpl6_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl6_.IS_ACTIVE AS IS_ACTIV4_118_7_, phoneimpl6_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl6_.PHONE_NUMBER AS PHONE_NU6_118_7_, stateimpl7_.ABBREVIATION AS ABBREVIA1_170_8_ , stateimpl7_.COUNTRY AS COUNTRY3_170_8_, stateimpl7_.NAME AS NAME2_170_8_, fulfillmen8_.FULFILLMENT_OPTION_ID AS FULFILLM1_71_9_, fulfillmen8_.FULFILLMENT_TYPE AS FULFILLM2_71_9_, fulfillmen8_.LONG_DESCRIPTION AS LONG_DES3_71_9_ , fulfillmen8_.NAME AS NAME4_71_9_, fulfillmen8_.TAX_CODE AS TAX_CODE5_71_9_, fulfillmen8_.TAXABLE AS TAXABLE6_71_9_, fulfillmen8_.USE_FLAT_RATES AS USE_FLAT7_71_9_, fulfillmen8_1_.CURRENCY_CODE AS CURRENCY3_72_9_ , fulfillmen8_1_.PRICE AS PRICE1_72_9_ , CASE  WHEN fulfillmen8_1_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 1 WHEN fulfillmen8_2_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 2 WHEN fulfillmen8_3_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 3 WHEN fulfillmen8_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 0 END AS clazz_9_, broadleafc9_.CURRENCY_CODE AS CURRENCY1_38_10_, broadleafc9_.DEFAULT_FLAG AS DEFAULT_2_38_10_, broadleafc9_.FRIENDLY_NAME AS FRIENDLY3_38_10_, personalme10_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_11_ , personalme10_.MESSAGE AS MESSAGE2_116_11_, personalme10_.MESSAGE_FROM AS MESSAGE_3_116_11_, personalme10_.MESSAGE_TO AS MESSAGE_4_116_11_, personalme10_.OCCASION AS OCCASION5_116_11_, phoneimpl11_.PHONE_ID AS PHONE_ID1_118_12_ , phoneimpl11_.COUNTRY_CODE AS COUNTRY_2_118_12_, phoneimpl11_.EXTENSION AS EXTENSIO3_118_12_, phoneimpl11_.IS_ACTIVE AS IS_ACTIV4_118_12_, phoneimpl11_.IS_DEFAULT AS IS_DEFAU5_118_12_, phoneimpl11_.PHONE_NUMBER AS PHONE_NU6_118_12_ FROM BLC_FULFILLMENT_GROUP fulfillmen0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON fulfillmen0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_COUNTRY countryimp2_ ON addressimp1_.COUNTRY = countryimp2_.ABBREVIATION LEFT JOIN BLC_ISO_COUNTRY isocountry3_ ON addressimp1_.ISO_COUNTRY_ALPHA2 = isocountry3_.ALPHA_2 LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_FAX_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl5_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl5_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl6_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl6_.PHONE_ID LEFT JOIN BLC_STATE stateimpl7_ ON addressimp1_.STATE_PROV_REGION = stateimpl7_.ABBREVIATION LEFT JOIN BLC_FULFILLMENT_OPTION fulfillmen8_ ON fulfillmen0_.FULFILLMENT_OPTION_ID = fulfillmen8_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPTION_FIXED fulfillmen8_1_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_1_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_PRC fulfillmen8_2_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_2_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_WGT fulfillmen8_3_ ON fulfillmen8_.FULFILLMENT_OPTION_ID = fulfillmen8_3_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_CURRENCY broadleafc9_ ON fulfillmen8_1_.CURRENCY_CODE = broadleafc9_.CURRENCY_CODE LEFT JOIN BLC_PERSONAL_MESSAGE personalme10_ ON fulfillmen0_.PERSONAL_MESSAGE_ID = personalme10_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_PHONE phoneimpl11_ ON fulfillmen0_.PHONE_ID = phoneimpl11_.PHONE_ID WHERE fulfillmen0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={fulfillmen0_.order_id:BIGINT, fulfillmen0_.fulfillment_group_id:BIGINT, fulfillmen0_.fulfillment_group_id:BIGINT, fulfillmen0_.address_id:BIGINT, fulfillmen0_.delivery_instruction:VARCHAR, fulfillmen0_.fulfillment_option_id:BIGINT, fulfillmen0_.price:DECIMAL, fulfillmen0_.shipping_price_taxable:BIT, fulfillmen0_.merchandise_total:DECIMAL, fulfillmen0_.method:VARCHAR, fulfillmen0_.order_id:BIGINT, fulfillmen0_.personal_message_id:BIGINT, fulfillmen0_.phone_id:BIGINT, fulfillmen0_.is_primary:BIT, fulfillmen0_.reference_number:VARCHAR, fulfillmen0_.retail_price:DECIMAL, fulfillmen0_.sale_price:DECIMAL, fulfillmen0_.fulfillment_group_sequnce:INT, fulfillmen0_.service:VARCHAR, fulfillmen0_.shipping_override:BIT, fulfillmen0_.status:VARCHAR, fulfillmen0_.total:DECIMAL, fulfillmen0_.total_fee_tax:DECIMAL, fulfillmen0_.total_fg_tax:DECIMAL, fulfillmen0_.total_item_tax:DECIMAL, fulfillmen0_.total_tax:DECIMAL, fulfillmen0_.type:VARCHAR, addressimp1_.address_id:BIGINT, addressimp1_.address_line1:VARCHAR, addressimp1_.address_line2:VARCHAR, addressimp1_.address_line3:VARCHAR, addressimp1_.city:VARCHAR, addressimp1_.company_name:VARCHAR, addressimp1_.country:VARCHAR, addressimp1_.county:VARCHAR, addressimp1_.email_address:VARCHAR, addressimp1_.fax:VARCHAR, addressimp1_.first_name:VARCHAR, addressimp1_.full_name:VARCHAR, addressimp1_.is_active:BIT, addressimp1_.is_business:BIT, addressimp1_.is_default:BIT, addressimp1_.is_mailing:BIT, addressimp1_.is_street:BIT, addressimp1_.iso_country_alpha2:VARCHAR, addressimp1_.iso_country_sub:VARCHAR, addressimp1_.last_name:VARCHAR, addressimp1_.phone_fax_id:BIGINT, addressimp1_.phone_primary_id:BIGINT, addressimp1_.phone_secondary_id:BIGINT, addressimp1_.postal_code:VARCHAR, addressimp1_.primary_phone:VARCHAR, addressimp1_.secondary_phone:VARCHAR, addressimp1_.standardized:BIT, addressimp1_.state_prov_region:VARCHAR, addressimp1_.sub_state_prov_reg:VARCHAR, addressimp1_.tokenized_address:VARCHAR, addressimp1_.verification_level:VARCHAR, addressimp1_.zip_four:VARCHAR, countryimp2_.abbreviation:VARCHAR, countryimp2_.name:VARCHAR, isocountry3_.alpha_2:VARCHAR, isocountry3_.alpha_3:VARCHAR, isocountry3_.name:VARCHAR, isocountry3_.numeric_code:INT, isocountry3_.status:VARCHAR, phoneimpl4_.phone_id:BIGINT, phoneimpl4_.country_code:VARCHAR, phoneimpl4_.extension:VARCHAR, phoneimpl4_.is_active:BIT, phoneimpl4_.is_default:BIT, phoneimpl4_.phone_number:VARCHAR, phoneimpl5_.phone_id:BIGINT, phoneimpl5_.country_code:VARCHAR, phoneimpl5_.extension:VARCHAR, phoneimpl5_.is_active:BIT, phoneimpl5_.is_default:BIT, phoneimpl5_.phone_number:VARCHAR, phoneimpl6_.phone_id:BIGINT, phoneimpl6_.country_code:VARCHAR, phoneimpl6_.extension:VARCHAR, phoneimpl6_.is_active:BIT, phoneimpl6_.is_default:BIT, phoneimpl6_.phone_number:VARCHAR, stateimpl7_.abbreviation:VARCHAR, stateimpl7_.country:VARCHAR, stateimpl7_.name:VARCHAR, fulfillmen8_.fulfillment_option_id:BIGINT, fulfillmen8_.fulfillment_type:VARCHAR, fulfillmen8_.long_description:LONGTEXT, fulfillmen8_.name:VARCHAR, fulfillmen8_.tax_code:VARCHAR, fulfillmen8_.taxable:BIT, fulfillmen8_.use_flat_rates:BIT, fulfillmen8_1_.currency_code:VARCHAR, fulfillmen8_1_.price:DECIMAL, clazz_9_:INT, broadleafc9_.currency_code:VARCHAR, broadleafc9_.default_flag:BIT, broadleafc9_.friendly_name:VARCHAR, personalme10_.personal_message_id:BIGINT, personalme10_.message:VARCHAR, personalme10_.message_from:VARCHAR, personalme10_.message_to:VARCHAR, personalme10_.occasion:VARCHAR, phoneimpl11_.phone_id:BIGINT, phoneimpl11_.country_code:VARCHAR, phoneimpl11_.extension:VARCHAR, phoneimpl11_.is_active:BIT, phoneimpl11_.is_default:BIT, phoneimpl11_.phone_number:VARCHAR}
}

======================================================
SqlNo=56
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=57
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"FulfillmentGroupImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}

======================================================
SqlNo=58
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q57_r1_col1 + 50):BIGINT, RS_q57_r1_col1:BIGINT, "FulfillmentGroupImpl":VARCHAR},
    retVals={}
}

======================================================
SqlNo=60
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=61
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=62
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"FulfillmentGroupItemImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}

======================================================
SqlNo=63
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q62_r1_col1 + 50):BIGINT, RS_q62_r1_col1:BIGINT, "FulfillmentGroupItemImpl":VARCHAR},
    retVals={}
}

======================================================
SqlNo=65
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=66
SQLNode {
    sqlTemplate='INSERT INTO BLC_ORDER_ITEM (CREATED_BY, DATE_CREATED, DATE_UPDATED, UPDATED_BY, CATEGORY_ID , DISCOUNTS_ALLOWED, GIFT_WRAP_ITEM_ID, HAS_VALIDATION_ERRORS, ITEM_TAXABLE_FLAG, NAME , ORDER_ID, ORDER_ITEM_TYPE, PARENT_ORDER_ITEM_ID, PERSONAL_MESSAGE_ID, PRICE , QUANTITY, RETAIL_PRICE, RETAIL_PRICE_OVERRIDE, SALE_PRICE, SALE_PRICE_OVERRIDE , TOTAL_TAX, ORDER_ITEM_ID) VALUES (?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?)',
    parameters={RS_q8_r1_col1:BIGINT, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__167 / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__170 / 1000) * 1000) / 1000)):DATETIME, RS_q8_r1_col1:BIGINT, RS_q48_r1_col8:BIGINT, NULL:BIT, NULL:BIGINT, NULL:BIT, 1:BIT, RS_q45_r1_col86:VARCHAR, RS_q20_r1_col1:BIGINT, "org.broadleafcommerce.core.order.domain.DiscreteOrderItem":VARCHAR, NULL:BIGINT, NULL:BIGINT, NULL:DECIMAL, 1:INT, NULL:DECIMAL, NULL:BIT, NULL:DECIMAL, NULL:BIT, NULL:DECIMAL, RS_q51_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=67
SQLNode {
    sqlTemplate='INSERT INTO BLC_DISCRETE_ORDER_ITEM (BASE_RETAIL_PRICE, BASE_SALE_PRICE, BUNDLE_ORDER_ITEM_ID, PRODUCT_ID, SKU_ID , SKU_BUNDLE_ITEM_ID, ORDER_ITEM_ID) VALUES (?, ?, ?, ?, ? , ?, ?)',
    parameters={c_decimal(($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000), 2):DECIMAL, NULL:DECIMAL, NULL:BIGINT, M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT, RS_q45_r1_col64:BIGINT, NULL:BIGINT, RS_q51_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=68
SQLNode {
    sqlTemplate='INSERT INTO BLC_FULFILLMENT_GROUP (ADDRESS_ID, DELIVERY_INSTRUCTION, FULFILLMENT_OPTION_ID, PRICE, SHIPPING_PRICE_TAXABLE , MERCHANDISE_TOTAL, METHOD, ORDER_ID, PERSONAL_MESSAGE_ID, PHONE_ID , IS_PRIMARY, REFERENCE_NUMBER, RETAIL_PRICE, SALE_PRICE, FULFILLMENT_GROUP_SEQUNCE , SERVICE, SHIPPING_OVERRIDE, STATUS, TOTAL, TOTAL_FEE_TAX , TOTAL_FG_TAX, TOTAL_ITEM_TAX, TOTAL_TAX, TYPE, FULFILLMENT_GROUP_ID) VALUES (?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?, ?, ?, ?, ?)',
    parameters={NULL:BIGINT, NULL:VARCHAR, NULL:BIGINT, NULL:DECIMAL, M_Z_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Boolean_value:BIT, NULL:DECIMAL, NULL:VARCHAR, RS_q20_r1_col1:BIGINT, NULL:BIGINT, NULL:BIGINT, 0:BIT, NULL:VARCHAR, NULL:DECIMAL, NULL:DECIMAL, NULL:INT, NULL:VARCHAR, NULL:BIT, NULL:VARCHAR, NULL:DECIMAL, NULL:DECIMAL, NULL:DECIMAL, NULL:DECIMAL, NULL:DECIMAL, NULL:VARCHAR, RS_q57_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=69
SQLNode {
    sqlTemplate='INSERT INTO BLC_FULFILLMENT_GROUP_ITEM (FULFILLMENT_GROUP_ID, ORDER_ITEM_ID, PRORATED_ORDER_ADJ, QUANTITY, STATUS , TOTAL_ITEM_AMOUNT, TOTAL_ITEM_TAXABLE_AMOUNT, TOTAL_ITEM_TAX, FULFILLMENT_GROUP_ITEM_ID) VALUES (?, ?, ?, ?, ? , ?, ?, ?, ?)',
    parameters={RS_q57_r1_col1:BIGINT, RS_q51_r1_col1:BIGINT, NULL:DECIMAL, 1:INT, NULL:VARCHAR, NULL:DECIMAL, NULL:DECIMAL, NULL:DECIMAL, RS_q62_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=71
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=72
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=74
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=75
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=76
SQLNode {
    sqlTemplate='SELECT customerof0_.CUSTOMER_OFFER_ID AS CUSTOMER1_43_, customerof0_.CUSTOMER_ID AS CUSTOMER2_43_, customerof0_.OFFER_ID AS OFFER_ID3_43_ FROM BLC_CUSTOMER_OFFER_XREF customerof0_ WHERE customerof0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerof0_.customer_offer_id:BIGINT, customerof0_.customer_id:BIGINT, customerof0_.offer_id:BIGINT}
}

======================================================
SqlNo=77
SQLNode {
    sqlTemplate='SELECT offerimpl0_.OFFER_ID AS OFFER_ID1_85_, offerimpl0_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_, offerimpl0_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_, offerimpl0_.ARCHIVED AS ARCHIVED4_85_, offerimpl0_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_ , offerimpl0_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_, offerimpl0_.OFFER_DESCRIPTION AS OFFER_DE7_85_, offerimpl0_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_, offerimpl0_.END_DATE AS END_DATE9_85_, offerimpl0_.MARKETING_MESSASGE AS MARKETI10_85_ , offerimpl0_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_, offerimpl0_.MAX_USES AS MAX_USE12_85_, offerimpl0_.OFFER_NAME AS OFFER_N13_85_, offerimpl0_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_, offerimpl0_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_ , offerimpl0_.ORDER_MIN_TOTAL AS ORDER_M16_85_, offerimpl0_.OFFER_PRIORITY AS OFFER_P17_85_, offerimpl0_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_, offerimpl0_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_, offerimpl0_.START_DATE AS START_D20_85_ , offerimpl0_.TARGET_MIN_TOTAL AS TARGET_21_85_, offerimpl0_.TARGET_SYSTEM AS TARGET_22_85_, offerimpl0_.TOTALITARIAN_OFFER AS TOTALIT23_85_, offerimpl0_.OFFER_TYPE AS OFFER_T24_85_, offerimpl0_.OFFER_VALUE AS OFFER_V25_85_ FROM BLC_OFFER offerimpl0_ WHERE offerimpl0_.START_DATE < ? AND (offerimpl0_.END_DATE IS NULL OR offerimpl0_.END_DATE > ?) AND (offerimpl0_.ARCHIVED = ? OR offerimpl0_.ARCHIVED IS NULL) AND offerimpl0_.AUTOMATICALLY_ADDED = ?',
    parameters={FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__238 / 86400000)) + 719163) + 1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__239 / 86400000)) + 719163) + -1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, "N":CHAR, 1:BIT},
    retVals={offerimpl0_.offer_id:BIGINT, offerimpl0_.apply_to_child_items:BIT, offerimpl0_.apply_to_sale_price:BIT, offerimpl0_.archived:CHAR, offerimpl0_.automatically_added:BIT, offerimpl0_.combinable_with_other_offers:BIT, offerimpl0_.offer_description:VARCHAR, offerimpl0_.offer_discount_type:VARCHAR, offerimpl0_.end_date:DATETIME, offerimpl0_.marketing_messasge:VARCHAR, offerimpl0_.max_uses_per_customer:BIGINT, offerimpl0_.max_uses:INT, offerimpl0_.offer_name:VARCHAR, offerimpl0_.offer_item_qualifier_rule:VARCHAR, offerimpl0_.offer_item_target_rule:VARCHAR, offerimpl0_.order_min_total:DECIMAL, offerimpl0_.offer_priority:INT, offerimpl0_.qualifying_item_min_total:DECIMAL, offerimpl0_.requires_related_tar_qual:BIT, offerimpl0_.start_date:DATETIME, offerimpl0_.target_min_total:DECIMAL, offerimpl0_.target_system:VARCHAR, offerimpl0_.totalitarian_offer:BIT, offerimpl0_.offer_type:VARCHAR, offerimpl0_.offer_value:DECIMAL}
}

======================================================
SqlNo=78
SQLNode {
    sqlTemplate='SELECT orderadjus0_.ORDER_ID AS ORDER_ID5_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_1_, orderadjus0_.OFFER_ID AS OFFER_ID4_94_1_, orderadjus0_.ORDER_ID AS ORDER_ID5_94_1_ , orderadjus0_.ADJUSTMENT_REASON AS ADJUSTME2_94_1_, orderadjus0_.ADJUSTMENT_VALUE AS ADJUSTME3_94_1_, offerimpl1_.OFFER_ID AS OFFER_ID1_85_2_, offerimpl1_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_2_, offerimpl1_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_2_ , offerimpl1_.ARCHIVED AS ARCHIVED4_85_2_, offerimpl1_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_2_, offerimpl1_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_2_, offerimpl1_.OFFER_DESCRIPTION AS OFFER_DE7_85_2_, offerimpl1_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_2_ , offerimpl1_.END_DATE AS END_DATE9_85_2_, offerimpl1_.MARKETING_MESSASGE AS MARKETI10_85_2_, offerimpl1_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_2_, offerimpl1_.MAX_USES AS MAX_USE12_85_2_, offerimpl1_.OFFER_NAME AS OFFER_N13_85_2_ , offerimpl1_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_2_, offerimpl1_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_2_, offerimpl1_.ORDER_MIN_TOTAL AS ORDER_M16_85_2_, offerimpl1_.OFFER_PRIORITY AS OFFER_P17_85_2_, offerimpl1_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_2_ , offerimpl1_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_2_, offerimpl1_.START_DATE AS START_D20_85_2_, offerimpl1_.TARGET_MIN_TOTAL AS TARGET_21_85_2_, offerimpl1_.TARGET_SYSTEM AS TARGET_22_85_2_, offerimpl1_.TOTALITARIAN_OFFER AS TOTALIT23_85_2_ , offerimpl1_.OFFER_TYPE AS OFFER_T24_85_2_, offerimpl1_.OFFER_VALUE AS OFFER_V25_85_2_ FROM BLC_ORDER_ADJUSTMENT orderadjus0_ INNER JOIN BLC_OFFER offerimpl1_ ON orderadjus0_.OFFER_ID = offerimpl1_.OFFER_ID WHERE orderadjus0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderadjus0_.order_id:BIGINT, orderadjus0_.order_adjustment_id:BIGINT, orderadjus0_.order_adjustment_id:BIGINT, orderadjus0_.offer_id:BIGINT, orderadjus0_.order_id:BIGINT, orderadjus0_.adjustment_reason:VARCHAR, orderadjus0_.adjustment_value:DECIMAL, offerimpl1_.offer_id:BIGINT, offerimpl1_.apply_to_child_items:BIT, offerimpl1_.apply_to_sale_price:BIT, offerimpl1_.archived:CHAR, offerimpl1_.automatically_added:BIT, offerimpl1_.combinable_with_other_offers:BIT, offerimpl1_.offer_description:VARCHAR, offerimpl1_.offer_discount_type:VARCHAR, offerimpl1_.end_date:DATETIME, offerimpl1_.marketing_messasge:VARCHAR, offerimpl1_.max_uses_per_customer:BIGINT, offerimpl1_.max_uses:INT, offerimpl1_.offer_name:VARCHAR, offerimpl1_.offer_item_qualifier_rule:VARCHAR, offerimpl1_.offer_item_target_rule:VARCHAR, offerimpl1_.order_min_total:DECIMAL, offerimpl1_.offer_priority:INT, offerimpl1_.qualifying_item_min_total:DECIMAL, offerimpl1_.requires_related_tar_qual:BIT, offerimpl1_.start_date:DATETIME, offerimpl1_.target_min_total:DECIMAL, offerimpl1_.target_system:VARCHAR, offerimpl1_.totalitarian_offer:BIT, offerimpl1_.offer_type:VARCHAR, offerimpl1_.offer_value:DECIMAL}
}

======================================================
SqlNo=79
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=80
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderItemPriceDetailImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}

======================================================
SqlNo=81
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q80_r1_col1 + 50):BIGINT, RS_q80_r1_col1:BIGINT, "OrderItemPriceDetailImpl":VARCHAR},
    retVals={}
}

======================================================
SqlNo=83
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=84
SQLNode {
    sqlTemplate='SELECT fees0_.SKU_ID AS SKU_ID2_165_2_, fees0_.SKU_FEE_ID AS SKU_FEE_1_165_2_, skufeeimpl1_.SKU_FEE_ID AS SKU_FEE_1_164_0_, skufeeimpl1_.AMOUNT AS AMOUNT2_164_0_, skufeeimpl1_.CURRENCY_CODE AS CURRENCY8_164_0_ , skufeeimpl1_.DESCRIPTION AS DESCRIPT3_164_0_, skufeeimpl1_.EXPRESSION AS EXPRESSI4_164_0_, skufeeimpl1_.FEE_TYPE AS FEE_TYPE5_164_0_, skufeeimpl1_.NAME AS NAME6_164_0_, skufeeimpl1_.TAXABLE AS TAXABLE7_164_0_ , broadleafc2_.CURRENCY_CODE AS CURRENCY1_38_1_, broadleafc2_.DEFAULT_FLAG AS DEFAULT_2_38_1_, broadleafc2_.FRIENDLY_NAME AS FRIENDLY3_38_1_ FROM BLC_SKU_FEE_XREF fees0_ INNER JOIN BLC_SKU_FEE skufeeimpl1_ ON fees0_.SKU_FEE_ID = skufeeimpl1_.SKU_FEE_ID LEFT JOIN BLC_CURRENCY broadleafc2_ ON skufeeimpl1_.CURRENCY_CODE = broadleafc2_.CURRENCY_CODE WHERE fees0_.SKU_ID = ?',
    parameters={RS_q45_r1_col64:BIGINT},
    retVals={fees0_.sku_id:BIGINT, fees0_.sku_fee_id:BIGINT, skufeeimpl1_.sku_fee_id:BIGINT, skufeeimpl1_.amount:DECIMAL, skufeeimpl1_.currency_code:VARCHAR, skufeeimpl1_.description:VARCHAR, skufeeimpl1_.expression:LONGTEXT, skufeeimpl1_.fee_type:VARCHAR, skufeeimpl1_.name:VARCHAR, skufeeimpl1_.taxable:BIT, broadleafc2_.currency_code:VARCHAR, broadleafc2_.default_flag:BIT, broadleafc2_.friendly_name:VARCHAR}
}

======================================================
SqlNo=85
SQLNode {
    sqlTemplate='SELECT customerof0_.CUSTOMER_OFFER_ID AS CUSTOMER1_43_, customerof0_.CUSTOMER_ID AS CUSTOMER2_43_, customerof0_.OFFER_ID AS OFFER_ID3_43_ FROM BLC_CUSTOMER_OFFER_XREF customerof0_ WHERE customerof0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerof0_.customer_offer_id:BIGINT, customerof0_.customer_id:BIGINT, customerof0_.offer_id:BIGINT}
}

======================================================
SqlNo=86
SQLNode {
    sqlTemplate='SELECT offerimpl0_.OFFER_ID AS OFFER_ID1_85_, offerimpl0_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_, offerimpl0_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_, offerimpl0_.ARCHIVED AS ARCHIVED4_85_, offerimpl0_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_ , offerimpl0_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_, offerimpl0_.OFFER_DESCRIPTION AS OFFER_DE7_85_, offerimpl0_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_, offerimpl0_.END_DATE AS END_DATE9_85_, offerimpl0_.MARKETING_MESSASGE AS MARKETI10_85_ , offerimpl0_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_, offerimpl0_.MAX_USES AS MAX_USE12_85_, offerimpl0_.OFFER_NAME AS OFFER_N13_85_, offerimpl0_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_, offerimpl0_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_ , offerimpl0_.ORDER_MIN_TOTAL AS ORDER_M16_85_, offerimpl0_.OFFER_PRIORITY AS OFFER_P17_85_, offerimpl0_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_, offerimpl0_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_, offerimpl0_.START_DATE AS START_D20_85_ , offerimpl0_.TARGET_MIN_TOTAL AS TARGET_21_85_, offerimpl0_.TARGET_SYSTEM AS TARGET_22_85_, offerimpl0_.TOTALITARIAN_OFFER AS TOTALIT23_85_, offerimpl0_.OFFER_TYPE AS OFFER_T24_85_, offerimpl0_.OFFER_VALUE AS OFFER_V25_85_ FROM BLC_OFFER offerimpl0_ WHERE offerimpl0_.START_DATE < ? AND (offerimpl0_.END_DATE IS NULL OR offerimpl0_.END_DATE > ?) AND (offerimpl0_.ARCHIVED = ? OR offerimpl0_.ARCHIVED IS NULL) AND offerimpl0_.AUTOMATICALLY_ADDED = ?',
    parameters={FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__265 / 86400000)) + 719163) + 1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME(((((((((((0 + (__nd__func__currentTimeMs__42__266 / 86400000)) + 719163) + -1) - 719163) * 86400000) + (((((((0 + ((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) / 3600000)) * 60) + (((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) / 60000)) * 60) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) / 1000)) * 1000) + ((((28800000 + (__nd__func__currentTimeMs__42__237 % 86400000)) % 3600000) % 60000) % 1000))) - 28800000) / 1000) * 1000) / 1000)):DATETIME, "N":CHAR, 1:BIT},
    retVals={offerimpl0_.offer_id:BIGINT, offerimpl0_.apply_to_child_items:BIT, offerimpl0_.apply_to_sale_price:BIT, offerimpl0_.archived:CHAR, offerimpl0_.automatically_added:BIT, offerimpl0_.combinable_with_other_offers:BIT, offerimpl0_.offer_description:VARCHAR, offerimpl0_.offer_discount_type:VARCHAR, offerimpl0_.end_date:DATETIME, offerimpl0_.marketing_messasge:VARCHAR, offerimpl0_.max_uses_per_customer:BIGINT, offerimpl0_.max_uses:INT, offerimpl0_.offer_name:VARCHAR, offerimpl0_.offer_item_qualifier_rule:VARCHAR, offerimpl0_.offer_item_target_rule:VARCHAR, offerimpl0_.order_min_total:DECIMAL, offerimpl0_.offer_priority:INT, offerimpl0_.qualifying_item_min_total:DECIMAL, offerimpl0_.requires_related_tar_qual:BIT, offerimpl0_.start_date:DATETIME, offerimpl0_.target_min_total:DECIMAL, offerimpl0_.target_system:VARCHAR, offerimpl0_.totalitarian_offer:BIT, offerimpl0_.offer_type:VARCHAR, offerimpl0_.offer_value:DECIMAL}
}

======================================================
SqlNo=87
SQLNode {
    sqlTemplate='SELECT abstractmo0_.MODULE_CONFIG_ID AS MODULE_C1_84_, abstractmo0_.ACTIVE_END_DATE AS ACTIVE_E2_84_, abstractmo0_.ACTIVE_START_DATE AS ACTIVE_S3_84_, abstractmo0_.ARCHIVED AS ARCHIVED4_84_, abstractmo0_.CREATED_BY AS CREATED_5_84_ , abstractmo0_.DATE_CREATED AS DATE_CRE6_84_, abstractmo0_.DATE_UPDATED AS DATE_UPD7_84_, abstractmo0_.UPDATED_BY AS UPDATED_8_84_, abstractmo0_.CONFIG_TYPE AS CONFIG_T9_84_, abstractmo0_.IS_DEFAULT AS IS_DEFA10_84_ , abstractmo0_.MODULE_NAME AS MODULE_11_84_, abstractmo0_.MODULE_PRIORITY AS MODULE_12_84_, abstractmo0_1_.INDEXED_SITE_MAP_FILE_NAME AS INDEXED_1_157_, abstractmo0_1_.INDEXED_SITE_MAP_FILE_PATTERN AS INDEXED_2_157_, abstractmo0_1_.MAX_URL_ENTRIES_PER_FILE AS MAX_URL_3_157_ , abstractmo0_1_.SITE_MAP_FILE_NAME AS SITE_MAP4_157_ , CASE  WHEN abstractmo0_1_.MODULE_CONFIG_ID IS NOT NULL THEN 1 WHEN abstractmo0_.MODULE_CONFIG_ID IS NOT NULL THEN 0 END AS clazz_ FROM BLC_MODULE_CONFIGURATION abstractmo0_ LEFT JOIN BLC_SITE_MAP_CFG abstractmo0_1_ ON abstractmo0_.MODULE_CONFIG_ID = abstractmo0_1_.MODULE_CONFIG_ID WHERE abstractmo0_.CONFIG_TYPE = ? AND (abstractmo0_.ARCHIVED IS NULL OR abstractmo0_.ARCHIVED = 'N') AND abstractmo0_.ACTIVE_START_DATE IS NOT NULL AND abstractmo0_.ACTIVE_START_DATE < ? AND (abstractmo0_.ACTIVE_END_DATE IS NULL OR abstractmo0_.ACTIVE_END_DATE > ?) ORDER BY abstractmo0_.MODULE_PRIORITY ASC',
    parameters={"TAX_CALCULATION":VARCHAR, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__273 / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__273 / 1000) * 1000) / 1000)):DATETIME},
    retVals={abstractmo0_.module_config_id:BIGINT, abstractmo0_.active_end_date:DATETIME, abstractmo0_.active_start_date:DATETIME, abstractmo0_.archived:CHAR, abstractmo0_.created_by:BIGINT, abstractmo0_.date_created:DATETIME, abstractmo0_.date_updated:DATETIME, abstractmo0_.updated_by:BIGINT, abstractmo0_.config_type:VARCHAR, abstractmo0_.is_default:BIT, abstractmo0_.module_name:VARCHAR, abstractmo0_.module_priority:INT, abstractmo0_1_.indexed_site_map_file_name:VARCHAR, abstractmo0_1_.indexed_site_map_file_pattern:VARCHAR, abstractmo0_1_.max_url_entries_per_file:INT, abstractmo0_1_.site_map_file_name:VARCHAR, clazz_:INT}
}

======================================================
SqlNo=88
SQLNode {
    sqlTemplate='SELECT payments0_.ORDER_ID AS ORDER_ID8_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_0_, payments0_.ORDER_PAYMENT_ID AS ORDER_PA1_106_1_, payments0_.AMOUNT AS AMOUNT2_106_1_, payments0_.ARCHIVED AS ARCHIVED3_106_1_ , payments0_.ADDRESS_ID AS ADDRESS_7_106_1_, payments0_.GATEWAY_TYPE AS GATEWAY_4_106_1_, payments0_.ORDER_ID AS ORDER_ID8_106_1_, payments0_.REFERENCE_NUMBER AS REFERENC5_106_1_, payments0_.PAYMENT_TYPE AS PAYMENT_6_106_1_ , addressimp1_.ADDRESS_ID AS ADDRESS_1_1_2_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_2_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_2_, addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_2_, addressimp1_.CITY AS CITY5_1_2_ , addressimp1_.COMPANY_NAME AS COMPANY_6_1_2_, addressimp1_.COUNTRY AS COUNTRY27_1_2_, addressimp1_.COUNTY AS COUNTY7_1_2_, addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_2_, addressimp1_.FAX AS FAX9_1_2_ , addressimp1_.FIRST_NAME AS FIRST_N10_1_2_, addressimp1_.FULL_NAME AS FULL_NA11_1_2_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_2_, addressimp1_.IS_BUSINESS AS IS_BUSI13_1_2_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_2_ , addressimp1_.IS_MAILING AS IS_MAIL15_1_2_, addressimp1_.IS_STREET AS IS_STRE16_1_2_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_2_, addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_2_, addressimp1_.LAST_NAME AS LAST_NA18_1_2_ , addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_2_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_2_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_2_, addressimp1_.POSTAL_CODE AS POSTAL_19_1_2_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_2_ , addressimp1_.SECONDARY_PHONE AS SECONDA21_1_2_, addressimp1_.STANDARDIZED AS STANDAR22_1_2_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_2_, addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_2_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_2_ , addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_2_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_2_, countryimp2_.ABBREVIATION AS ABBREVIA1_35_3_, countryimp2_.NAME AS NAME2_35_3_, isocountry3_.ALPHA_2 AS ALPHA_1_80_4_ , isocountry3_.ALPHA_3 AS ALPHA_2_80_4_, isocountry3_.NAME AS NAME3_80_4_, isocountry3_.NUMERIC_CODE AS NUMERIC_4_80_4_, isocountry3_.STATUS AS STATUS5_80_4_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_5_ , phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_5_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_5_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_5_, phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_5_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_5_ , phoneimpl5_.PHONE_ID AS PHONE_ID1_118_6_, phoneimpl5_.COUNTRY_CODE AS COUNTRY_2_118_6_, phoneimpl5_.EXTENSION AS EXTENSIO3_118_6_, phoneimpl5_.IS_ACTIVE AS IS_ACTIV4_118_6_, phoneimpl5_.IS_DEFAULT AS IS_DEFAU5_118_6_ , phoneimpl5_.PHONE_NUMBER AS PHONE_NU6_118_6_, phoneimpl6_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl6_.COUNTRY_CODE AS COUNTRY_2_118_7_, phoneimpl6_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl6_.IS_ACTIVE AS IS_ACTIV4_118_7_ , phoneimpl6_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl6_.PHONE_NUMBER AS PHONE_NU6_118_7_, stateimpl7_.ABBREVIATION AS ABBREVIA1_170_8_, stateimpl7_.COUNTRY AS COUNTRY3_170_8_, stateimpl7_.NAME AS NAME2_170_8_ FROM BLC_ORDER_PAYMENT payments0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON payments0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_COUNTRY countryimp2_ ON addressimp1_.COUNTRY = countryimp2_.ABBREVIATION LEFT JOIN BLC_ISO_COUNTRY isocountry3_ ON addressimp1_.ISO_COUNTRY_ALPHA2 = isocountry3_.ALPHA_2 LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_FAX_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl5_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl5_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl6_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl6_.PHONE_ID LEFT JOIN BLC_STATE stateimpl7_ ON addressimp1_.STATE_PROV_REGION = stateimpl7_.ABBREVIATION WHERE payments0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={payments0_.order_id:BIGINT, payments0_.order_payment_id:BIGINT, payments0_.order_payment_id:BIGINT, payments0_.amount:DECIMAL, payments0_.archived:CHAR, payments0_.address_id:BIGINT, payments0_.gateway_type:VARCHAR, payments0_.order_id:BIGINT, payments0_.reference_number:VARCHAR, payments0_.payment_type:VARCHAR, addressimp1_.address_id:BIGINT, addressimp1_.address_line1:VARCHAR, addressimp1_.address_line2:VARCHAR, addressimp1_.address_line3:VARCHAR, addressimp1_.city:VARCHAR, addressimp1_.company_name:VARCHAR, addressimp1_.country:VARCHAR, addressimp1_.county:VARCHAR, addressimp1_.email_address:VARCHAR, addressimp1_.fax:VARCHAR, addressimp1_.first_name:VARCHAR, addressimp1_.full_name:VARCHAR, addressimp1_.is_active:BIT, addressimp1_.is_business:BIT, addressimp1_.is_default:BIT, addressimp1_.is_mailing:BIT, addressimp1_.is_street:BIT, addressimp1_.iso_country_alpha2:VARCHAR, addressimp1_.iso_country_sub:VARCHAR, addressimp1_.last_name:VARCHAR, addressimp1_.phone_fax_id:BIGINT, addressimp1_.phone_primary_id:BIGINT, addressimp1_.phone_secondary_id:BIGINT, addressimp1_.postal_code:VARCHAR, addressimp1_.primary_phone:VARCHAR, addressimp1_.secondary_phone:VARCHAR, addressimp1_.standardized:BIT, addressimp1_.state_prov_region:VARCHAR, addressimp1_.sub_state_prov_reg:VARCHAR, addressimp1_.tokenized_address:VARCHAR, addressimp1_.verification_level:VARCHAR, addressimp1_.zip_four:VARCHAR, countryimp2_.abbreviation:VARCHAR, countryimp2_.name:VARCHAR, isocountry3_.alpha_2:VARCHAR, isocountry3_.alpha_3:VARCHAR, isocountry3_.name:VARCHAR, isocountry3_.numeric_code:INT, isocountry3_.status:VARCHAR, phoneimpl4_.phone_id:BIGINT, phoneimpl4_.country_code:VARCHAR, phoneimpl4_.extension:VARCHAR, phoneimpl4_.is_active:BIT, phoneimpl4_.is_default:BIT, phoneimpl4_.phone_number:VARCHAR, phoneimpl5_.phone_id:BIGINT, phoneimpl5_.country_code:VARCHAR, phoneimpl5_.extension:VARCHAR, phoneimpl5_.is_active:BIT, phoneimpl5_.is_default:BIT, phoneimpl5_.phone_number:VARCHAR, phoneimpl6_.phone_id:BIGINT, phoneimpl6_.country_code:VARCHAR, phoneimpl6_.extension:VARCHAR, phoneimpl6_.is_active:BIT, phoneimpl6_.is_default:BIT, phoneimpl6_.phone_number:VARCHAR, stateimpl7_.abbreviation:VARCHAR, stateimpl7_.country:VARCHAR, stateimpl7_.name:VARCHAR}
}

======================================================
SqlNo=89
SQLNode {
    sqlTemplate='INSERT INTO BLC_ORDER_ITEM_PRICE_DTL (ORDER_ITEM_ID, QUANTITY, USE_SALE_PRICE, ORDER_ITEM_PRICE_DTL_ID) VALUES (?, ?, ?, ?)',
    parameters={RS_q51_r1_col1:BIGINT, 1:INT, 1:BIT, RS_q80_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=90
SQLNode {
    sqlTemplate='UPDATE BLC_ORDER SET DATE_UPDATED = ?, UPDATED_BY = ?, CURRENCY_CODE = ?, CUSTOMER_ID = ?, EMAIL_ADDRESS = ?, LOCALE_CODE = ?, NAME = ?, ORDER_NUMBER = ?, IS_PREVIEW = ?, ORDER_STATUS = ?, ORDER_SUBTOTAL = ?, SUBMIT_DATE = ?, TAX_OVERRIDE = ?, ORDER_TOTAL = ?, TOTAL_SHIPPING = ?, TOTAL_TAX = ? WHERE ORDER_ID = ?',
    parameters={FROM_UNIXTIME((((__nd__func__currentTimeMs__42__282 / 1000) * 1000) / 1000)):DATETIME, RS_q8_r1_col1:BIGINT, RS_q2_r1_col2:VARCHAR, RS_q8_r1_col1:BIGINT, RS_q33_r1_col8:VARCHAR, RS_q2_r1_col1:VARCHAR, NULL:VARCHAR, NULL:VARCHAR, NULL:BIT, RS_q33_r1_col13:VARCHAR, c_decimal((0 + (0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100))), 2):DECIMAL, NULL:DATETIME, NULL:BIT, c_decimal((0 + (0 + (0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)))), 2):DECIMAL, 0.0:DECIMAL, 0.0:DECIMAL, RS_q20_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=91
SQLNode {
    sqlTemplate='UPDATE BLC_ORDER_ITEM SET DATE_UPDATED = ?, UPDATED_BY = ?, CATEGORY_ID = ?, DISCOUNTS_ALLOWED = ?, GIFT_WRAP_ITEM_ID = ?, HAS_VALIDATION_ERRORS = ?, ITEM_TAXABLE_FLAG = ?, NAME = ?, ORDER_ID = ?, ORDER_ITEM_TYPE = ?, PARENT_ORDER_ITEM_ID = ?, PERSONAL_MESSAGE_ID = ?, PRICE = ?, QUANTITY = ?, RETAIL_PRICE = ?, RETAIL_PRICE_OVERRIDE = ?, SALE_PRICE = ?, SALE_PRICE_OVERRIDE = ?, TOTAL_TAX = ? WHERE ORDER_ITEM_ID = ?',
    parameters={FROM_UNIXTIME((((__nd__func__currentTimeMs__42__285 / 1000) * 1000) / 1000)):DATETIME, RS_q8_r1_col1:BIGINT, RS_q48_r1_col8:BIGINT, NULL:BIT, NULL:BIGINT, NULL:BIT, 1:BIT, RS_q45_r1_col86:VARCHAR, RS_q20_r1_col1:BIGINT, "org.broadleafcommerce.core.order.domain.DiscreteOrderItem":VARCHAR, NULL:BIGINT, NULL:BIGINT, c_decimal((((0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)) * 100) / 100), 2):DECIMAL, 1:INT, c_decimal(($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000), 2):DECIMAL, NULL:BIT, c_decimal(($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000), 2):DECIMAL, NULL:BIT, NULL:DECIMAL, RS_q51_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=92
SQLNode {
    sqlTemplate='UPDATE BLC_DISCRETE_ORDER_ITEM SET BASE_RETAIL_PRICE = ?, BASE_SALE_PRICE = ?, BUNDLE_ORDER_ITEM_ID = ?, PRODUCT_ID = ?, SKU_ID = ?, SKU_BUNDLE_ITEM_ID = ? WHERE ORDER_ITEM_ID = ?',
    parameters={c_decimal(($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000), 2):DECIMAL, c_decimal(($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000), 2):DECIMAL, NULL:BIGINT, M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT, RS_q45_r1_col64:BIGINT, NULL:BIGINT, RS_q51_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=93
SQLNode {
    sqlTemplate='UPDATE BLC_FULFILLMENT_GROUP SET ADDRESS_ID = ?, DELIVERY_INSTRUCTION = ?, FULFILLMENT_OPTION_ID = ?, PRICE = ?, SHIPPING_PRICE_TAXABLE = ?, MERCHANDISE_TOTAL = ?, METHOD = ?, ORDER_ID = ?, PERSONAL_MESSAGE_ID = ?, PHONE_ID = ?, IS_PRIMARY = ?, REFERENCE_NUMBER = ?, RETAIL_PRICE = ?, SALE_PRICE = ?, FULFILLMENT_GROUP_SEQUNCE = ?, SERVICE = ?, SHIPPING_OVERRIDE = ?, STATUS = ?, TOTAL = ?, TOTAL_FEE_TAX = ?, TOTAL_FG_TAX = ?, TOTAL_ITEM_TAX = ?, TOTAL_TAX = ?, TYPE = ? WHERE FULFILLMENT_GROUP_ID = ?',
    parameters={NULL:BIGINT, NULL:VARCHAR, NULL:BIGINT, 0.0:DECIMAL, M_Z_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Boolean_value:BIT, c_decimal((0 + (0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100))), 2):DECIMAL, NULL:VARCHAR, RS_q20_r1_col1:BIGINT, NULL:BIGINT, NULL:BIGINT, 0:BIT, NULL:VARCHAR, 0.0:DECIMAL, 0.0:DECIMAL, NULL:INT, NULL:VARCHAR, NULL:BIT, NULL:VARCHAR, c_decimal((0 + (0 + (0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)))), 2):DECIMAL, 0.0:DECIMAL, 0.0:DECIMAL, 0.0:DECIMAL, 0.0:DECIMAL, NULL:VARCHAR, RS_q57_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=94
SQLNode {
    sqlTemplate='UPDATE BLC_FULFILLMENT_GROUP_ITEM SET FULFILLMENT_GROUP_ID = ?, ORDER_ITEM_ID = ?, PRORATED_ORDER_ADJ = ?, QUANTITY = ?, STATUS = ?, TOTAL_ITEM_AMOUNT = ?, TOTAL_ITEM_TAXABLE_AMOUNT = ?, TOTAL_ITEM_TAX = ? WHERE FULFILLMENT_GROUP_ITEM_ID = ?',
    parameters={RS_q57_r1_col1:BIGINT, RS_q51_r1_col1:BIGINT, c_decimal(0, 2):DECIMAL, 1:INT, NULL:VARCHAR, c_decimal((0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)), 2):DECIMAL, c_decimal((0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)), 2):DECIMAL, 0.0:DECIMAL, RS_q62_r1_col1:BIGINT},
    retVals={}
}

======================================================
SqlNo=96
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=97
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=99
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================
SqlNo=100
SQLNode {
    sqlTemplate='SELECT skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_2_, skumedia0_.MAP_KEY AS formula1_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_1_, skumedia0_.MAP_KEY AS MAP_KEY2_168_1_ , skumedia0_.MEDIA_ID AS MEDIA_ID3_168_1_, skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_1_, mediaimpl1_.MEDIA_ID AS MEDIA_ID1_83_0_, mediaimpl1_.ALT_TEXT AS ALT_TEXT2_83_0_, mediaimpl1_.TAGS AS TAGS3_83_0_ , mediaimpl1_.TITLE AS TITLE4_83_0_, mediaimpl1_.URL AS URL5_83_0_ FROM BLC_SKU_MEDIA_MAP skumedia0_ LEFT JOIN BLC_MEDIA mediaimpl1_ ON skumedia0_.MEDIA_ID = mediaimpl1_.MEDIA_ID WHERE skumedia0_.BLC_SKU_SKU_ID = ?',
    parameters={RS_q45_r1_col64:BIGINT},
    retVals={skumedia0_.blc_sku_sku_id:BIGINT, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.media_id:BIGINT, skumedia0_.blc_sku_sku_id:BIGINT, mediaimpl1_.media_id:BIGINT, mediaimpl1_.alt_text:VARCHAR, mediaimpl1_.tags:VARCHAR, mediaimpl1_.title:VARCHAR, mediaimpl1_.url:VARCHAR}
}

======================================================
SqlNo=101
SQLNode {
    sqlTemplate='SELECT orderattri0_.ORDER_ID AS ORDER_ID4_95_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_0_, orderattri0_.NAME AS formula4_0_, orderattri0_.ORDER_ATTRIBUTE_ID AS ORDER_AT1_95_1_, orderattri0_.NAME AS NAME2_95_1_ , orderattri0_.ORDER_ID AS ORDER_ID4_95_1_, orderattri0_.VALUE AS VALUE3_95_1_ FROM BLC_ORDER_ATTRIBUTE orderattri0_ WHERE orderattri0_.ORDER_ID = ?',
    parameters={RS_q20_r1_col1:BIGINT},
    retVals={orderattri0_.order_id:BIGINT, orderattri0_.order_attribute_id:BIGINT, orderattri0_.name:VARCHAR, orderattri0_.order_attribute_id:BIGINT, orderattri0_.name:VARCHAR, orderattri0_.order_id:BIGINT, orderattri0_.value:VARCHAR}
}

======================================================
SqlNo=102
SQLNode {
    sqlTemplate='SELECT customerat0_.CUSTOMER_ID AS CUSTOMER4_42_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_1_, customerat0_.NAME AS formula9_1_, customerat0_.CUSTOMER_ATTR_ID AS CUSTOMER1_42_0_, customerat0_.CUSTOMER_ID AS CUSTOMER4_42_0_ , customerat0_.NAME AS NAME2_42_0_, customerat0_.VALUE AS VALUE3_42_0_ FROM BLC_CUSTOMER_ATTRIBUTE customerat0_ WHERE customerat0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerat0_.customer_id:BIGINT, customerat0_.customer_attr_id:BIGINT, customerat0_.name:VARCHAR, customerat0_.customer_attr_id:BIGINT, customerat0_.customer_id:BIGINT, customerat0_.name:VARCHAR, customerat0_.value:VARCHAR}
}

======================================================
SqlNo=103
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}

======================================================
SqlNo=104
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=105
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=106
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}

======================================================
SqlNo=107
SQLNode {
    sqlTemplate='UPDATE BLC_ORDER_LOCK SET LOCKED = 'N' WHERE ORDER_ID = ? AND LOCK_KEY = ?',
    parameters={RS_q20_r1_col1:BIGINT, "00000000-0000-0000-0000-000000000000":VARCHAR},
    retVals={}
}

======================================================
SqlNo=109
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}

======================================================