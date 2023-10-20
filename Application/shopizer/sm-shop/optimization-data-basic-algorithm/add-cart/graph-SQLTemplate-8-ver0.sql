SqlNo=25
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=26
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'SHP_CRT_SEQ_NEXT_VAL' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=27
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'SHP_CRT_SEQ_NEXT_VAL'',
    parameters={(RS_q26_r1_col1 + 1):BIGINT, RS_q26_r1_col1:BIGINT},
    retVals={}
}
