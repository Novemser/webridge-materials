SqlNo=35
SQLNode {
    sqlTemplate='INSERT INTO SHOPPING_CART (DATE_CREATED, DATE_MODIFIED, UPDT_ID, CUSTOMER_ID, IP_ADDRESS , MERCHANT_ID, ORDER_ID, PROMO_ADDED, PROMO_CODE, SHP_CART_CODE , SHP_CART_ID) VALUES (?, ?, ?, ?, ? , ?, ?, ?, ?, ? , ?)',
    parameters={FROM_UNIXTIME((((__nd__func__currentTimeMs__42__67 / 1000) * 1000) / 1000)):DATETIME, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__66 / 1000) * 1000) / 1000)):DATETIME, NULL:VARCHAR, RS_q10_r1_col1:BIGINT, NULL:VARCHAR, RS_q2_r1_col1:INT, NULL:BIGINT, NULL:DATETIME, NULL:VARCHAR, M_L_String__unique_cart_code:VARCHAR, (RS_q26_r1_col1 * 50):BIGINT},
    retVals={}
}
