SqlNo=80
SQLNode {
    sqlTemplate='SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = ? FOR UPDATE',
    parameters={"OrderItemPriceDetailImpl":VARCHAR},
    retVals={tbl.id_val:BIGINT}
}
