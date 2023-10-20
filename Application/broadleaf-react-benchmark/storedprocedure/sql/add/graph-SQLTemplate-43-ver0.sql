SqlNo=46
SQLNode {
    sqlTemplate='SELECT productopt0_.PRODUCT_ID AS PRODUCT_2_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_2_, productopt0_.PRODUCT_OPTION_XREF_ID AS PRODUCT_1_126_1_, productopt0_.PRODUCT_ID AS PRODUCT_2_126_1_, productopt0_.PRODUCT_OPTION_ID AS PRODUCT_3_126_1_ , productopt1_.PRODUCT_OPTION_ID AS PRODUCT_1_124_0_, productopt1_.ATTRIBUTE_NAME AS ATTRIBUT2_124_0_, productopt1_.DISPLAY_ORDER AS DISPLAY_3_124_0_, productopt1_.ERROR_CODE AS ERROR_CO4_124_0_, productopt1_.ERROR_MESSAGE AS ERROR_ME5_124_0_ , productopt1_.LABEL AS LABEL6_124_0_, productopt1_.NAME AS NAME7_124_0_, productopt1_.VALIDATION_STRATEGY_TYPE AS VALIDATI8_124_0_, productopt1_.VALIDATION_TYPE AS VALIDATI9_124_0_, productopt1_.REQUIRED AS REQUIRE10_124_0_ , productopt1_.OPTION_TYPE AS OPTION_11_124_0_, productopt1_.USE_IN_SKU_GENERATION AS USE_IN_12_124_0_, productopt1_.VALIDATION_STRING AS VALIDAT13_124_0_ FROM BLC_PRODUCT_OPTION_XREF productopt0_ INNER JOIN BLC_PRODUCT_OPTION productopt1_ ON productopt0_.PRODUCT_OPTION_ID = productopt1_.PRODUCT_OPTION_ID WHERE productopt0_.PRODUCT_ID = ?',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={productopt0_.product_id:BIGINT, productopt0_.product_option_xref_id:BIGINT, productopt0_.product_option_xref_id:BIGINT, productopt0_.product_id:BIGINT, productopt0_.product_option_id:BIGINT, productopt1_.product_option_id:BIGINT, productopt1_.attribute_name:VARCHAR, productopt1_.display_order:INT, productopt1_.error_code:VARCHAR, productopt1_.error_message:VARCHAR, productopt1_.label:VARCHAR, productopt1_.name:VARCHAR, productopt1_.validation_strategy_type:VARCHAR, productopt1_.validation_type:VARCHAR, productopt1_.required:BIT, productopt1_.option_type:VARCHAR, productopt1_.use_in_sku_generation:BIT, productopt1_.validation_string:VARCHAR}
}