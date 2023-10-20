SqlNo=44
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=45
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderPaymentImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=46
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q45_r1_col1 + 50):BIGINT, RS_q45_r1_col1:BIGINT, "OrderPaymentImpl":VARCHAR},
    retVals={}
}
