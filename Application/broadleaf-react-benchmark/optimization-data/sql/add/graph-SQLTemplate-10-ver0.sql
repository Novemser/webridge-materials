SqlNo=60
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=61
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=62
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"FulfillmentGroupItemImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=63
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q62_r1_col1 + 50):BIGINT, RS_q62_r1_col1:BIGINT, "FulfillmentGroupItemImpl":VARCHAR},
    retVals={}
}
