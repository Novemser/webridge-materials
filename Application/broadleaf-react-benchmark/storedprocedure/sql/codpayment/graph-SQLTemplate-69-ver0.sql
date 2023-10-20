SqlNo=76
SQLNode {
    sqlTemplate='SELECT fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM7_67_0_, fulfillmen0_.FULFILLMENT_GROUP_FEE_ID AS FULFILLM1_67_0_, fulfillmen0_.FULFILLMENT_GROUP_FEE_ID AS FULFILLM1_67_1_, fulfillmen0_.AMOUNT AS AMOUNT2_67_1_, fulfillmen0_.FEE_TAXABLE_FLAG AS FEE_TAXA3_67_1_ , fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM7_67_1_, fulfillmen0_.NAME AS NAME4_67_1_, fulfillmen0_.REPORTING_CODE AS REPORTIN5_67_1_, fulfillmen0_.TOTAL_FEE_TAX AS TOTAL_FE6_67_1_ FROM BLC_FULFILLMENT_GROUP_FEE fulfillmen0_ WHERE fulfillmen0_.FULFILLMENT_GROUP_ID = ?',
    parameters={RS_q72_r1_col3:BIGINT},
    retVals={fulfillmen0_.fulfillment_group_id:BIGINT, fulfillmen0_.fulfillment_group_fee_id:BIGINT, fulfillmen0_.fulfillment_group_fee_id:BIGINT, fulfillmen0_.amount:DECIMAL, fulfillmen0_.fee_taxable_flag:BIT, fulfillmen0_.fulfillment_group_id:BIGINT, fulfillmen0_.name:VARCHAR, fulfillmen0_.reporting_code:VARCHAR, fulfillmen0_.total_fee_tax:DECIMAL}
}
