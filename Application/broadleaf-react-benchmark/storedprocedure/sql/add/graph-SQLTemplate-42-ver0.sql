SqlNo=45
SQLNode {
    sqlTemplate='SELECT productimp0_.PRODUCT_ID AS PRODUCT_1_119_0_, productimp0_.ARCHIVED AS ARCHIVED2_119_0_, productimp0_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_0_, productimp0_.CANONICAL_URL AS CANONICA4_119_0_, productimp0_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_0_ , productimp0_.DEFAULT_SKU_ID AS DEFAULT15_119_0_, productimp0_.DISPLAY_TEMPLATE AS DISPLAY_5_119_0_, productimp0_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_0_, productimp0_.MANUFACTURE AS MANUFACT7_119_0_, productimp0_.META_DESC AS META_DES8_119_0_ , productimp0_.META_TITLE AS META_TIT9_119_0_, productimp0_.MODEL AS MODEL10_119_0_, productimp0_.OVERRIDE_GENERATED_URL AS OVERRID11_119_0_, productimp0_.URL AS URL12_119_0_, productimp0_.URL_KEY AS URL_KEY13_119_0_ , productimp0_1_.AUTO_BUNDLE AS AUTO_BUN1_121_0_, productimp0_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_0_, productimp0_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_0_, productimp0_1_.PRICING_MODEL AS PRICING_4_121_0_, productimp0_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_0_ , CASE  WHEN productimp0_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp0_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_0_, categoryim1_.CATEGORY_ID AS CATEGORY1_26_1_, categoryim1_.ACTIVE_END_DATE AS ACTIVE_E2_26_1_, categoryim1_.ACTIVE_START_DATE AS ACTIVE_S3_26_1_, categoryim1_.ARCHIVED AS ARCHIVED4_26_1_ , categoryim1_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_1_, categoryim1_.DESCRIPTION AS DESCRIPT5_26_1_, categoryim1_.DISPLAY_TEMPLATE AS DISPLAY_6_26_1_, categoryim1_.EXTERNAL_ID AS EXTERNAL7_26_1_, categoryim1_.FULFILLMENT_TYPE AS FULFILLM8_26_1_ , categoryim1_.INVENTORY_TYPE AS INVENTOR9_26_1_, categoryim1_.LONG_DESCRIPTION AS LONG_DE10_26_1_, categoryim1_.META_DESC AS META_DE11_26_1_, categoryim1_.META_TITLE AS META_TI12_26_1_, categoryim1_.NAME AS NAME13_26_1_ , categoryim1_.OVERRIDE_GENERATED_URL AS OVERRID14_26_1_, categoryim1_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_1_, categoryim1_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_1_, categoryim1_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_1_, categoryim1_.TAX_CODE AS TAX_COD18_26_1_ , categoryim1_.URL AS URL19_26_1_, categoryim1_.URL_KEY AS URL_KEY20_26_1_, categoryim2_.CATEGORY_ID AS CATEGORY1_26_2_, categoryim2_.ACTIVE_END_DATE AS ACTIVE_E2_26_2_, categoryim2_.ACTIVE_START_DATE AS ACTIVE_S3_26_2_ , categoryim2_.ARCHIVED AS ARCHIVED4_26_2_, categoryim2_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_2_, categoryim2_.DESCRIPTION AS DESCRIPT5_26_2_, categoryim2_.DISPLAY_TEMPLATE AS DISPLAY_6_26_2_, categoryim2_.EXTERNAL_ID AS EXTERNAL7_26_2_ , categoryim2_.FULFILLMENT_TYPE AS FULFILLM8_26_2_, categoryim2_.INVENTORY_TYPE AS INVENTOR9_26_2_, categoryim2_.LONG_DESCRIPTION AS LONG_DE10_26_2_, categoryim2_.META_DESC AS META_DE11_26_2_, categoryim2_.META_TITLE AS META_TI12_26_2_ , categoryim2_.NAME AS NAME13_26_2_, categoryim2_.OVERRIDE_GENERATED_URL AS OVERRID14_26_2_, categoryim2_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_2_, categoryim2_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_2_, categoryim2_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_2_ , categoryim2_.TAX_CODE AS TAX_COD18_26_2_, categoryim2_.URL AS URL19_26_2_, categoryim2_.URL_KEY AS URL_KEY20_26_2_, skuimpl3_.SKU_ID AS SKU_ID1_160_3_, skuimpl3_.ACTIVE_END_DATE AS ACTIVE_E2_160_3_ , skuimpl3_.ACTIVE_START_DATE AS ACTIVE_S3_160_3_, skuimpl3_.AVAILABLE_FLAG AS AVAILABL4_160_3_, skuimpl3_.COST AS COST5_160_3_, skuimpl3_.CURRENCY_CODE AS CURRENC31_160_3_, skuimpl3_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_3_ , skuimpl3_.DESCRIPTION AS DESCRIPT6_160_3_, skuimpl3_.CONTAINER_SHAPE AS CONTAINE7_160_3_, skuimpl3_.DEPTH AS DEPTH8_160_3_, skuimpl3_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_3_, skuimpl3_.GIRTH AS GIRTH10_160_3_ , skuimpl3_.HEIGHT AS HEIGHT11_160_3_, skuimpl3_.CONTAINER_SIZE AS CONTAIN12_160_3_, skuimpl3_.WIDTH AS WIDTH13_160_3_, skuimpl3_.DISCOUNTABLE_FLAG AS DISCOUN14_160_3_, skuimpl3_.DISPLAY_TEMPLATE AS DISPLAY15_160_3_ , skuimpl3_.EXTERNAL_ID AS EXTERNA16_160_3_, skuimpl3_.FULFILLMENT_TYPE AS FULFILL17_160_3_, skuimpl3_.INVENTORY_TYPE AS INVENTO18_160_3_, skuimpl3_.IS_MACHINE_SORTABLE AS IS_MACH19_160_3_, skuimpl3_.LONG_DESCRIPTION AS LONG_DE20_160_3_ , skuimpl3_.NAME AS NAME21_160_3_, skuimpl3_.ADDL_PRODUCT_ID AS ADDL_PR33_160_3_, skuimpl3_.QUANTITY_AVAILABLE AS QUANTIT22_160_3_, skuimpl3_.RETAIL_PRICE AS RETAIL_23_160_3_, skuimpl3_.SALE_PRICE AS SALE_PR24_160_3_ , skuimpl3_.TAX_CODE AS TAX_COD25_160_3_, skuimpl3_.TAXABLE_FLAG AS TAXABLE26_160_3_, skuimpl3_.UPC AS UPC27_160_3_, skuimpl3_.URL_KEY AS URL_KEY28_160_3_, skuimpl3_.WEIGHT AS WEIGHT29_160_3_ , skuimpl3_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_3_, broadleafc4_.CURRENCY_CODE AS CURRENCY1_38_4_, broadleafc4_.DEFAULT_FLAG AS DEFAULT_2_38_4_, broadleafc4_.FRIENDLY_NAME AS FRIENDLY3_38_4_, productimp5_.PRODUCT_ID AS PRODUCT_1_119_5_ , productimp5_.ARCHIVED AS ARCHIVED2_119_5_, productimp5_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_5_, productimp5_.CANONICAL_URL AS CANONICA4_119_5_, productimp5_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_5_, productimp5_.DEFAULT_SKU_ID AS DEFAULT15_119_5_ , productimp5_.DISPLAY_TEMPLATE AS DISPLAY_5_119_5_, productimp5_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_5_, productimp5_.MANUFACTURE AS MANUFACT7_119_5_, productimp5_.META_DESC AS META_DES8_119_5_, productimp5_.META_TITLE AS META_TIT9_119_5_ , productimp5_.MODEL AS MODEL10_119_5_, productimp5_.OVERRIDE_GENERATED_URL AS OVERRID11_119_5_, productimp5_.URL AS URL12_119_5_, productimp5_.URL_KEY AS URL_KEY13_119_5_, productimp5_1_.AUTO_BUNDLE AS AUTO_BUN1_121_5_ , productimp5_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_5_, productimp5_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_5_, productimp5_1_.PRICING_MODEL AS PRICING_4_121_5_, productimp5_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_5_ , CASE  WHEN productimp5_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp5_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_5_, productimp6_.PRODUCT_ID AS PRODUCT_1_119_6_, productimp6_.ARCHIVED AS ARCHIVED2_119_6_, productimp6_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_6_, productimp6_.CANONICAL_URL AS CANONICA4_119_6_ , productimp6_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_6_, productimp6_.DEFAULT_SKU_ID AS DEFAULT15_119_6_, productimp6_.DISPLAY_TEMPLATE AS DISPLAY_5_119_6_, productimp6_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_6_, productimp6_.MANUFACTURE AS MANUFACT7_119_6_ , productimp6_.META_DESC AS META_DES8_119_6_, productimp6_.META_TITLE AS META_TIT9_119_6_, productimp6_.MODEL AS MODEL10_119_6_, productimp6_.OVERRIDE_GENERATED_URL AS OVERRID11_119_6_, productimp6_.URL AS URL12_119_6_ , productimp6_.URL_KEY AS URL_KEY13_119_6_, productimp6_1_.AUTO_BUNDLE AS AUTO_BUN1_121_6_, productimp6_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_6_, productimp6_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_6_, productimp6_1_.PRICING_MODEL AS PRICING_4_121_6_ , productimp6_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_6_ , CASE  WHEN productimp6_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp6_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_6_ FROM BLC_PRODUCT productimp0_ LEFT JOIN BLC_PRODUCT_BUNDLE productimp0_1_ ON productimp0_.PRODUCT_ID = productimp0_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim1_ ON productimp0_.DEFAULT_CATEGORY_ID = categoryim1_.CATEGORY_ID LEFT JOIN BLC_CATEGORY categoryim2_ ON categoryim1_.DEFAULT_PARENT_CATEGORY_ID = categoryim2_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl3_ ON productimp0_.DEFAULT_SKU_ID = skuimpl3_.SKU_ID LEFT JOIN BLC_CURRENCY broadleafc4_ ON skuimpl3_.CURRENCY_CODE = broadleafc4_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp5_ ON skuimpl3_.DEFAULT_PRODUCT_ID = productimp5_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp5_1_ ON productimp5_.PRODUCT_ID = productimp5_1_.PRODUCT_ID LEFT JOIN BLC_PRODUCT productimp6_ ON skuimpl3_.ADDL_PRODUCT_ID = productimp6_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp6_1_ ON productimp6_.PRODUCT_ID = productimp6_1_.PRODUCT_ID WHERE productimp0_.PRODUCT_ID = ?',
    parameters={M_J_field_order_item_com_broadleafcommerce_rest_api_wrapper_OrderItemWrapper_java_lang_Long_value:BIGINT},
    retVals={productimp0_.product_id:BIGINT, productimp0_.archived:CHAR, productimp0_.can_sell_without_options:BIT, productimp0_.canonical_url:VARCHAR, productimp0_.default_category_id:BIGINT, productimp0_.default_sku_id:BIGINT, productimp0_.display_template:VARCHAR, productimp0_.is_featured_product:BIT, productimp0_.manufacture:VARCHAR, productimp0_.meta_desc:VARCHAR, productimp0_.meta_title:VARCHAR, productimp0_.model:VARCHAR, productimp0_.override_generated_url:BIT, productimp0_.url:VARCHAR, productimp0_.url_key:VARCHAR, productimp0_1_.auto_bundle:BIT, productimp0_1_.bundle_promotable:BIT, productimp0_1_.items_promotable:BIT, productimp0_1_.pricing_model:VARCHAR, productimp0_1_.bundle_priority:INT, clazz_0_:INT, categoryim1_.category_id:BIGINT, categoryim1_.active_end_date:DATETIME, categoryim1_.active_start_date:DATETIME, categoryim1_.archived:CHAR, categoryim1_.default_parent_category_id:BIGINT, categoryim1_.description:VARCHAR, categoryim1_.display_template:VARCHAR, categoryim1_.external_id:VARCHAR, categoryim1_.fulfillment_type:VARCHAR, categoryim1_.inventory_type:VARCHAR, categoryim1_.long_description:LONGTEXT, categoryim1_.meta_desc:VARCHAR, categoryim1_.meta_title:VARCHAR, categoryim1_.name:VARCHAR, categoryim1_.override_generated_url:BIT, categoryim1_.product_desc_pattern_override:VARCHAR, categoryim1_.product_title_pattern_override:VARCHAR, categoryim1_.root_display_order:DECIMAL, categoryim1_.tax_code:VARCHAR, categoryim1_.url:VARCHAR, categoryim1_.url_key:VARCHAR, categoryim2_.category_id:BIGINT, categoryim2_.active_end_date:DATETIME, categoryim2_.active_start_date:DATETIME, categoryim2_.archived:CHAR, categoryim2_.default_parent_category_id:BIGINT, categoryim2_.description:VARCHAR, categoryim2_.display_template:VARCHAR, categoryim2_.external_id:VARCHAR, categoryim2_.fulfillment_type:VARCHAR, categoryim2_.inventory_type:VARCHAR, categoryim2_.long_description:LONGTEXT, categoryim2_.meta_desc:VARCHAR, categoryim2_.meta_title:VARCHAR, categoryim2_.name:VARCHAR, categoryim2_.override_generated_url:BIT, categoryim2_.product_desc_pattern_override:VARCHAR, categoryim2_.product_title_pattern_override:VARCHAR, categoryim2_.root_display_order:DECIMAL, categoryim2_.tax_code:VARCHAR, categoryim2_.url:VARCHAR, categoryim2_.url_key:VARCHAR, skuimpl3_.sku_id:BIGINT, skuimpl3_.active_end_date:DATETIME, skuimpl3_.active_start_date:DATETIME, skuimpl3_.available_flag:CHAR, skuimpl3_.cost:DECIMAL, skuimpl3_.currency_code:VARCHAR, skuimpl3_.default_product_id:BIGINT, skuimpl3_.description:VARCHAR, skuimpl3_.container_shape:VARCHAR, skuimpl3_.depth:DECIMAL, skuimpl3_.dimension_unit_of_measure:VARCHAR, skuimpl3_.girth:DECIMAL, skuimpl3_.height:DECIMAL, skuimpl3_.container_size:VARCHAR, skuimpl3_.width:DECIMAL, skuimpl3_.discountable_flag:CHAR, skuimpl3_.display_template:VARCHAR, skuimpl3_.external_id:VARCHAR, skuimpl3_.fulfillment_type:VARCHAR, skuimpl3_.inventory_type:VARCHAR, skuimpl3_.is_machine_sortable:BIT, skuimpl3_.long_description:LONGTEXT, skuimpl3_.name:VARCHAR, skuimpl3_.addl_product_id:BIGINT, skuimpl3_.quantity_available:INT, skuimpl3_.retail_price:DECIMAL, skuimpl3_.sale_price:DECIMAL, skuimpl3_.tax_code:VARCHAR, skuimpl3_.taxable_flag:CHAR, skuimpl3_.upc:VARCHAR, skuimpl3_.url_key:VARCHAR, skuimpl3_.weight:DECIMAL, skuimpl3_.weight_unit_of_measure:VARCHAR, broadleafc4_.currency_code:VARCHAR, broadleafc4_.default_flag:BIT, broadleafc4_.friendly_name:VARCHAR, productimp5_.product_id:BIGINT, productimp5_.archived:CHAR, productimp5_.can_sell_without_options:BIT, productimp5_.canonical_url:VARCHAR, productimp5_.default_category_id:BIGINT, productimp5_.default_sku_id:BIGINT, productimp5_.display_template:VARCHAR, productimp5_.is_featured_product:BIT, productimp5_.manufacture:VARCHAR, productimp5_.meta_desc:VARCHAR, productimp5_.meta_title:VARCHAR, productimp5_.model:VARCHAR, productimp5_.override_generated_url:BIT, productimp5_.url:VARCHAR, productimp5_.url_key:VARCHAR, productimp5_1_.auto_bundle:BIT, productimp5_1_.bundle_promotable:BIT, productimp5_1_.items_promotable:BIT, productimp5_1_.pricing_model:VARCHAR, productimp5_1_.bundle_priority:INT, clazz_5_:INT, productimp6_.product_id:BIGINT, productimp6_.archived:CHAR, productimp6_.can_sell_without_options:BIT, productimp6_.canonical_url:VARCHAR, productimp6_.default_category_id:BIGINT, productimp6_.default_sku_id:BIGINT, productimp6_.display_template:VARCHAR, productimp6_.is_featured_product:BIT, productimp6_.manufacture:VARCHAR, productimp6_.meta_desc:VARCHAR, productimp6_.meta_title:VARCHAR, productimp6_.model:VARCHAR, productimp6_.override_generated_url:BIT, productimp6_.url:VARCHAR, productimp6_.url_key:VARCHAR, productimp6_1_.auto_bundle:BIT, productimp6_1_.bundle_promotable:BIT, productimp6_1_.items_promotable:BIT, productimp6_1_.pricing_model:VARCHAR, productimp6_1_.bundle_priority:INT, clazz_6_:INT}
}
