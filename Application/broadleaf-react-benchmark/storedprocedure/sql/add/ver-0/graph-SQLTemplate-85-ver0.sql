SqlNo=94
SQLNode {
    sqlTemplate='UPDATE BLC_FULFILLMENT_GROUP_ITEM SET FULFILLMENT_GROUP_ID = ?, ORDER_ITEM_ID = ?, PRORATED_ORDER_ADJ = ?, QUANTITY = ?, STATUS = ?, TOTAL_ITEM_AMOUNT = ?, TOTAL_ITEM_TAXABLE_AMOUNT = ?, TOTAL_ITEM_TAX = ? WHERE FULFILLMENT_GROUP_ITEM_ID = ?',
    parameters={RS_q57_r1_col1:BIGINT, RS_q51_r1_col1:BIGINT, c_decimal(0, 2):DECIMAL, 1:INT, NULL:VARCHAR, c_decimal((0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)), 2):DECIMAL, c_decimal((0 + ((($BIG_DECIMAL$RS_q45_r1_col89_intCompact$BIG_DECIMAL$ / 1000) * 100) / 100)), 2):DECIMAL, 0.0:DECIMAL, RS_q62_r1_col1:BIGINT},
    retVals={}
}