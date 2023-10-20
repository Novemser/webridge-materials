SqlNo=56
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=57
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"FulfillmentGroupImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=58
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q57_r1_col1 + 50):BIGINT, RS_q57_r1_col1:BIGINT, "FulfillmentGroupImpl":VARCHAR},
    retVals={}
}
