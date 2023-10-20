SqlNo=75
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=76
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'ORDER_PRD_PRICE_ID_NEXT_VAL' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=77
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'ORDER_PRD_PRICE_ID_NEXT_VAL'',
    parameters={(RS_q76_r1_col1 + 1):BIGINT, RS_q76_r1_col1:BIGINT},
    retVals={}
}
