SqlNo=48
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=49
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=50
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"PaymentTransactionImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=51
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q50_r1_col1 + 50):BIGINT, RS_q50_r1_col1:BIGINT, "PaymentTransactionImpl":VARCHAR},
    retVals={}
}
