SqlNo=74
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=75
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=76
SQLNode {
    sqlTemplate='SELECT customerof0_.CUSTOMER_OFFER_ID AS CUSTOMER1_43_, customerof0_.CUSTOMER_ID AS CUSTOMER2_43_, customerof0_.OFFER_ID AS OFFER_ID3_43_ FROM BLC_CUSTOMER_OFFER_XREF customerof0_ WHERE customerof0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerof0_.customer_offer_id:BIGINT, customerof0_.customer_id:BIGINT, customerof0_.offer_id:BIGINT}
}
