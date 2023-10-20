SqlNo=65
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=66
SQLNode {
    sqlTemplate='SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'STATUS_HIST_ID_NEXT_VALUE' FOR UPDATE',
    parameters={},
    retVals={seq_count:BIGINT}
}
SqlNo=67
SQLNode {
    sqlTemplate='UPDATE SM_SEQUENCER SET SEQ_COUNT = ? WHERE SEQ_COUNT = ? AND SEQ_NAME = 'STATUS_HIST_ID_NEXT_VALUE'',
    parameters={(RS_q66_r1_col1 + 1):BIGINT, RS_q66_r1_col1:BIGINT},
    retVals={}
}
