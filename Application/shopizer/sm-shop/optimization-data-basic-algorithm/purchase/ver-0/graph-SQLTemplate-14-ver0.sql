SqlNo=54
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=55
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'TRANSACT_SEQ_NEXT_VAL' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=56
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'TRANSACT_SEQ_NEXT_VAL'',
    parameters={(RS_q55_r1_col1 + 1):BIGINT, RS_q55_r1_col1:BIGINT},
    retVals={}
}
