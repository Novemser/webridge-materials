SqlNo=79
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=80
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderItemPriceDetailImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=81
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q80_r1_col1 + 50):BIGINT, RS_q80_r1_col1:BIGINT, "OrderItemPriceDetailImpl":VARCHAR},
    retVals={}
}
