SqlNo=60
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=61
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'ORDER_ID_SEQ_NEXT_VAL' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=62
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'ORDER_ID_SEQ_NEXT_VAL'',
    parameters={(RS_q61_r1_col1 + 1):BIGINT, RS_q61_r1_col1:BIGINT},
    retVals={}
}
