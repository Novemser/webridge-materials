SqlNo=80
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=81
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'ORDER_TOTAL_ID_NEXT_VALUE' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=82
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'ORDER_TOTAL_ID_NEXT_VALUE'',
    parameters={(RS_q81_r1_col1 + 1):BIGINT, RS_q81_r1_col1:BIGINT},
    retVals={}
}
