SqlNo=45
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderPaymentImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
