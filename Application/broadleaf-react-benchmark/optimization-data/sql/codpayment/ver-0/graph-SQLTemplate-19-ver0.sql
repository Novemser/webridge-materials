SqlNo=113
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=114
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"EmailTrackingImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
SqlNo=115
SQLNode {
    sqlTemplate='UPDATE SEQUENCE_GENERATOR SET ID_VAL = ? WHERE ID_VAL = ? AND ID_NAME = ?',
    parameters={(RS_q114_r1_col1 + 50):BIGINT, RS_q114_r1_col1:BIGINT, "EmailTrackingImpl":VARCHAR},
    retVals={}
}
