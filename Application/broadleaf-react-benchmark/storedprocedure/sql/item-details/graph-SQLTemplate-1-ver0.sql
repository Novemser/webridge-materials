SqlNo=1
SQLNode {
    sqlTemplate='SELECT localeimpl0_.LOCALE_CODE AS LOCALE_C1_82_, localeimpl0_.CURRENCY_CODE AS CURRENCY5_82_, localeimpl0_.DEFAULT_FLAG AS DEFAULT_2_82_, localeimpl0_.FRIENDLY_NAME AS FRIENDLY3_82_, localeimpl0_.USE_IN_SEARCH_INDEX AS USE_IN_S4_82_ FROM BLC_LOCALE localeimpl0_ WHERE localeimpl0_.LOCALE_CODE = ?',
    parameters={"en-US":VARCHAR},
    retVals={localeimpl0_.locale_code:VARCHAR, localeimpl0_.currency_code:VARCHAR, localeimpl0_.default_flag:BIT, localeimpl0_.friendly_name:VARCHAR, localeimpl0_.use_in_search_index:BIT}
}
