SqlNo=91
SQLNode {
    sqlTemplate='INSERT INTO ORDER_STATUS_HISTORY (COMMENTS, CUSTOMER_NOTIFIED, DATE_ADDED, ORDER_ID, status , ORDER_STATUS_HISTORY_ID) VALUES (?, ?, ?, ?, ? , ?)',
    parameters={NULL:LONGTEXT, NULL:INT, FROM_UNIXTIME((((__nd__func__currentTimeMs__42__150 / 1000) * 1000) / 1000)):DATETIME, (RS_q61_r1_col1 * 50):BIGINT, "PROCESSED":VARCHAR, (RS_q66_r1_col1 * 50):BIGINT},
    retVals={}
}