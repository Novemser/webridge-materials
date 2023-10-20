SqlNo=21
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=22
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=23
SQLNode {
    sqlTemplate='SELECT currency0_.CURRENCY_ID AS CURRENCY1_8_, currency0_.CURRENCY_CODE AS CURRENCY2_8_, currency0_.CURRENCY_CURRENCY_CODE AS CURRENCY3_8_, currency0_.CURRENCY_NAME AS CURRENCY4_8_, currency0_.CURRENCY_SUPPORTED AS CURRENCY5_8_ FROM CURRENCY currency0_ WHERE currency0_.CURRENCY_CODE = ?',
    parameters={M_L_String__order_com_salesmanager_shop_model_order_v1_PersistableOrder_currency:VARCHAR},
    retVals={currency0_.currency_id:BIGINT, currency0_.currency_code:VARCHAR, currency0_.currency_currency_code:VARCHAR, currency0_.currency_name:VARCHAR, currency0_.currency_supported:BIT}
}
