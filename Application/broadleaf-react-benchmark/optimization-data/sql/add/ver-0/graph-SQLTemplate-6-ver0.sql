SqlNo=50
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=51
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderItemImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=52
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q51_r1_col1 + 50):BIGINT, RS_q51_r1_col1:BIGINT, "OrderItemImpl":VARCHAR},
    retVals={}
}
