SqlNo=94
SQLNode {
    sqlTemplate='SELECT paymenttra0_.PAYMENT_TRANSACTION_ID AS PAYMENT_1_107_0_, paymenttra0_.TRANSACTION_AMOUNT AS TRANSACT2_107_0_, paymenttra0_.ARCHIVED AS ARCHIVED3_107_0_, paymenttra0_.CUSTOMER_IP_ADDRESS AS CUSTOMER4_107_0_, paymenttra0_.DATE_RECORDED AS DATE_REC5_107_0_ , paymenttra0_.ORDER_PAYMENT AS ORDER_P10_107_0_, paymenttra0_.PARENT_TRANSACTION AS PARENT_11_107_0_, paymenttra0_.RAW_RESPONSE AS RAW_RESP6_107_0_, paymenttra0_.SAVE_TOKEN AS SAVE_TOK7_107_0_, paymenttra0_.SUCCESS AS SUCCESS8_107_0_ , paymenttra0_.TRANSACTION_TYPE AS TRANSACT9_107_0_ FROM BLC_ORDER_PAYMENT_TRANSACTION paymenttra0_ WHERE paymenttra0_.PAYMENT_TRANSACTION_ID = ?',
    parameters={RS_q50_r1_col1:BIGINT},
    retVals={paymenttra0_.payment_transaction_id:BIGINT, paymenttra0_.transaction_amount:DECIMAL, paymenttra0_.archived:CHAR, paymenttra0_.customer_ip_address:VARCHAR, paymenttra0_.date_recorded:DATETIME, paymenttra0_.order_payment:BIGINT, paymenttra0_.parent_transaction:BIGINT, paymenttra0_.raw_response:LONGTEXT, paymenttra0_.save_token:BIT, paymenttra0_.success:BIT, paymenttra0_.transaction_type:VARCHAR}
}
