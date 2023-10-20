SqlNo=57
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"FulfillmentGroupImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
