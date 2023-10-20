SqlNo=90
SQLNode {
    sqlTemplate='SELECT orderitemp0_.ORDER_ITEM_PRICE_DTL_ID AS ORDER_IT1_102_1_, orderitemp0_.ORDER_ITEM_ID AS ORDER_IT4_102_1_, orderitemp0_.QUANTITY AS QUANTITY2_102_1_, orderitemp0_.USE_SALE_PRICE AS USE_SALE3_102_1_, orderitemp1_.ORDER_ITEM_PRICE_DTL_ID AS ORDER_IT7_101_3_ , orderitemp1_.ORDER_ITEM_DTL_ADJ_ID AS ORDER_IT1_101_3_, orderitemp1_.ORDER_ITEM_DTL_ADJ_ID AS ORDER_IT1_101_0_, orderitemp1_.APPLIED_TO_SALE_PRICE AS APPLIED_2_101_0_, orderitemp1_.OFFER_ID AS OFFER_ID6_101_0_, orderitemp1_.OFFER_NAME AS OFFER_NA3_101_0_ , orderitemp1_.ORDER_ITEM_PRICE_DTL_ID AS ORDER_IT7_101_0_, orderitemp1_.ADJUSTMENT_REASON AS ADJUSTME4_101_0_, orderitemp1_.ADJUSTMENT_VALUE AS ADJUSTME5_101_0_ FROM BLC_ORDER_ITEM_PRICE_DTL orderitemp0_ LEFT JOIN BLC_ORDER_ITEM_DTL_ADJ orderitemp1_ ON orderitemp0_.ORDER_ITEM_PRICE_DTL_ID = orderitemp1_.ORDER_ITEM_PRICE_DTL_ID WHERE orderitemp0_.ORDER_ITEM_PRICE_DTL_ID = ?',
    parameters={RS_q69_r1_col3:BIGINT},
    retVals={orderitemp0_.order_item_price_dtl_id:BIGINT, orderitemp0_.order_item_id:BIGINT, orderitemp0_.quantity:INT, orderitemp0_.use_sale_price:BIT, orderitemp1_.order_item_price_dtl_id:BIGINT, orderitemp1_.order_item_dtl_adj_id:BIGINT, orderitemp1_.order_item_dtl_adj_id:BIGINT, orderitemp1_.applied_to_sale_price:BIT, orderitemp1_.offer_id:BIGINT, orderitemp1_.offer_name:VARCHAR, orderitemp1_.order_item_price_dtl_id:BIGINT, orderitemp1_.adjustment_reason:VARCHAR, orderitemp1_.adjustment_value:DECIMAL}
}