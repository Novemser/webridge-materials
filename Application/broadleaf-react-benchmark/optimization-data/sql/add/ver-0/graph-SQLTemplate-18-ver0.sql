SqlNo=84
SQLNode {
    sqlTemplate='SELECT fees0_.SKU_ID AS SKU_ID2_165_2_, fees0_.SKU_FEE_ID AS SKU_FEE_1_165_2_, skufeeimpl1_.SKU_FEE_ID AS SKU_FEE_1_164_0_, skufeeimpl1_.AMOUNT AS AMOUNT2_164_0_, skufeeimpl1_.CURRENCY_CODE AS CURRENCY8_164_0_ , skufeeimpl1_.DESCRIPTION AS DESCRIPT3_164_0_, skufeeimpl1_.EXPRESSION AS EXPRESSI4_164_0_, skufeeimpl1_.FEE_TYPE AS FEE_TYPE5_164_0_, skufeeimpl1_.NAME AS NAME6_164_0_, skufeeimpl1_.TAXABLE AS TAXABLE7_164_0_ , broadleafc2_.CURRENCY_CODE AS CURRENCY1_38_1_, broadleafc2_.DEFAULT_FLAG AS DEFAULT_2_38_1_, broadleafc2_.FRIENDLY_NAME AS FRIENDLY3_38_1_ FROM BLC_SKU_FEE_XREF fees0_ INNER JOIN BLC_SKU_FEE skufeeimpl1_ ON fees0_.SKU_FEE_ID = skufeeimpl1_.SKU_FEE_ID LEFT JOIN BLC_CURRENCY broadleafc2_ ON skufeeimpl1_.CURRENCY_CODE = broadleafc2_.CURRENCY_CODE WHERE fees0_.SKU_ID = ?',
    parameters={RS_q45_r1_col64:BIGINT},
    retVals={fees0_.sku_id:BIGINT, fees0_.sku_fee_id:BIGINT, skufeeimpl1_.sku_fee_id:BIGINT, skufeeimpl1_.amount:DECIMAL, skufeeimpl1_.currency_code:VARCHAR, skufeeimpl1_.description:VARCHAR, skufeeimpl1_.expression:LONGTEXT, skufeeimpl1_.fee_type:VARCHAR, skufeeimpl1_.name:VARCHAR, skufeeimpl1_.taxable:BIT, broadleafc2_.currency_code:VARCHAR, broadleafc2_.default_flag:BIT, broadleafc2_.friendly_name:VARCHAR}
}
SqlNo=85
SQLNode {
    sqlTemplate='SELECT customerof0_.CUSTOMER_OFFER_ID AS CUSTOMER1_43_, customerof0_.CUSTOMER_ID AS CUSTOMER2_43_, customerof0_.OFFER_ID AS OFFER_ID3_43_ FROM BLC_CUSTOMER_OFFER_XREF customerof0_ WHERE customerof0_.CUSTOMER_ID = ?',
    parameters={RS_q8_r1_col1:BIGINT},
    retVals={customerof0_.customer_offer_id:BIGINT, customerof0_.customer_id:BIGINT, customerof0_.offer_id:BIGINT}
}
