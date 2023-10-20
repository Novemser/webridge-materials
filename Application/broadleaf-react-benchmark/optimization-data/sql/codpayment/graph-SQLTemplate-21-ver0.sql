SqlNo=118
SQLNode {
    sqlTemplate='INSERT INTO BLC_EMAIL_TRACKING (DATE_SENT, EMAIL_ADDRESS, TYPE, EMAIL_TRACKING_ID) VALUES (?, ?, ?, ?)',
    parameters={FROM_UNIXTIME((((__nd__func__currentTimeMs__42__296 / 1000) * 1000) / 1000)):DATETIME, RS_q96_r1_col8:VARCHAR, NULL:VARCHAR, RS_q114_r1_col1:BIGINT},
    retVals={}
}
SqlNo=119
SQLNode {
    sqlTemplate='UPDATE BLC_ORDER SET DATE_UPDATED = ?, UPDATED_BY = ?, CURRENCY_CODE = ?, CUSTOMER_ID = ?, EMAIL_ADDRESS = ?, LOCALE_CODE = ?, NAME = ?, ORDER_NUMBER = ?, IS_PREVIEW = ?, ORDER_STATUS = ?, ORDER_SUBTOTAL = ?, SUBMIT_DATE = ?, TAX_OVERRIDE = ?, ORDER_TOTAL = ?, TOTAL_SHIPPING = ?, TOTAL_TAX = ? WHERE ORDER_ID = ?',
    parameters={FROM_UNIXTIME((((__nd__func__currentTimeMs__42__310 / 1000) * 1000) / 1000)):DATETIME, RS_q8_r1_col1:BIGINT, M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_currency_domain_BroadleafCurrencyImpl_currencyCode:VARCHAR, RS_q8_r1_col1:BIGINT, RS_q96_r1_col8:VARCHAR, M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_locale_domain_LocaleImpl_localeCode:VARCHAR, NULL:VARCHAR, CONCAT("2021010100000", CONVERT(RS_q20_r1_col1, CHAR)):VARCHAR, NULL:BIT, "SUBMITTED":VARCHAR, c_decimal($BIG_DECIMAL$RS_q96_r1_col14_intCompact$BIG_DECIMAL$, $BIG_DECIMAL$RS_q96_r1_col14_scale$BIG_DECIMAL$):DECIMAL, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__292 / 1000) * 1000) / 1000)):DATETIME, NULL:BIT, c_decimal($BIG_DECIMAL$RS_q96_r1_col17_intCompact$BIG_DECIMAL$, $BIG_DECIMAL$RS_q96_r1_col17_scale$BIG_DECIMAL$):DECIMAL, c_decimal($BIG_DECIMAL$RS_q96_r1_col18_intCompact$BIG_DECIMAL$, $BIG_DECIMAL$RS_q96_r1_col18_scale$BIG_DECIMAL$):DECIMAL, c_decimal($BIG_DECIMAL$RS_q96_r1_col19_intCompact$BIG_DECIMAL$, $BIG_DECIMAL$RS_q96_r1_col19_scale$BIG_DECIMAL$):DECIMAL, RS_q20_r1_col1:BIGINT},
    retVals={}
}
