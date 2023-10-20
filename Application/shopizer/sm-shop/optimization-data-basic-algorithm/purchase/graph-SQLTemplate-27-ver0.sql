SqlNo=85
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=86
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'ORDER_TOTAL_ID_NEXT_VALUE' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=87
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'ORDER_TOTAL_ID_NEXT_VALUE'',
    parameters={(RS_q86_r1_col1 + 1):BIGINT, RS_q86_r1_col1:BIGINT},
    retVals={}
}
