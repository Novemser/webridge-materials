SqlNo=25
SQLNode {
    sqlTemplate='SELECT skuimpl0_.SKU_ID AS SKU_ID1_160_0_, skuimpl0_.ACTIVE_END_DATE AS ACTIVE_E2_160_0_, skuimpl0_.ACTIVE_START_DATE AS ACTIVE_S3_160_0_, skuimpl0_.AVAILABLE_FLAG AS AVAILABL4_160_0_, skuimpl0_.COST AS COST5_160_0_ , skuimpl0_.CURRENCY_CODE AS CURRENC31_160_0_, skuimpl0_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_0_, skuimpl0_.DESCRIPTION AS DESCRIPT6_160_0_, skuimpl0_.CONTAINER_SHAPE AS CONTAINE7_160_0_, skuimpl0_.DEPTH AS DEPTH8_160_0_ , skuimpl0_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_0_, skuimpl0_.GIRTH AS GIRTH10_160_0_, skuimpl0_.HEIGHT AS HEIGHT11_160_0_, skuimpl0_.CONTAINER_SIZE AS CONTAIN12_160_0_, skuimpl0_.WIDTH AS WIDTH13_160_0_ , skuimpl0_.DISCOUNTABLE_FLAG AS DISCOUN14_160_0_, skuimpl0_.DISPLAY_TEMPLATE AS DISPLAY15_160_0_, skuimpl0_.EXTERNAL_ID AS EXTERNA16_160_0_, skuimpl0_.FULFILLMENT_TYPE AS FULFILL17_160_0_, skuimpl0_.INVENTORY_TYPE AS INVENTO18_160_0_ , skuimpl0_.IS_MACHINE_SORTABLE AS IS_MACH19_160_0_, skuimpl0_.LONG_DESCRIPTION AS LONG_DE20_160_0_, skuimpl0_.NAME AS NAME21_160_0_, skuimpl0_.ADDL_PRODUCT_ID AS ADDL_PR33_160_0_, skuimpl0_.QUANTITY_AVAILABLE AS QUANTIT22_160_0_ , skuimpl0_.RETAIL_PRICE AS RETAIL_23_160_0_, skuimpl0_.SALE_PRICE AS SALE_PR24_160_0_, skuimpl0_.TAX_CODE AS TAX_COD25_160_0_, skuimpl0_.TAXABLE_FLAG AS TAXABLE26_160_0_, skuimpl0_.UPC AS UPC27_160_0_ , skuimpl0_.URL_KEY AS URL_KEY28_160_0_, skuimpl0_.WEIGHT AS WEIGHT29_160_0_, skuimpl0_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_0_, broadleafc1_.CURRENCY_CODE AS CURRENCY1_38_1_, broadleafc1_.DEFAULT_FLAG AS DEFAULT_2_38_1_ , broadleafc1_.FRIENDLY_NAME AS FRIENDLY3_38_1_, productimp2_.PRODUCT_ID AS PRODUCT_1_119_2_, productimp2_.ARCHIVED AS ARCHIVED2_119_2_, productimp2_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_2_, productimp2_.CANONICAL_URL AS CANONICA4_119_2_ , productimp2_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_2_, productimp2_.DEFAULT_SKU_ID AS DEFAULT15_119_2_, productimp2_.DISPLAY_TEMPLATE AS DISPLAY_5_119_2_, productimp2_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_2_, productimp2_.MANUFACTURE AS MANUFACT7_119_2_ , productimp2_.META_DESC AS META_DES8_119_2_, productimp2_.META_TITLE AS META_TIT9_119_2_, productimp2_.MODEL AS MODEL10_119_2_, productimp2_.OVERRIDE_GENERATED_URL AS OVERRID11_119_2_, productimp2_.URL AS URL12_119_2_ , productimp2_.URL_KEY AS URL_KEY13_119_2_, productimp2_1_.AUTO_BUNDLE AS AUTO_BUN1_121_2_, productimp2_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_2_, productimp2_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_2_, productimp2_1_.PRICING_MODEL AS PRICING_4_121_2_ , productimp2_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_2_ , CASE  WHEN productimp2_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp2_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_2_, categoryim3_.CATEGORY_ID AS CATEGORY1_26_3_, categoryim3_.ACTIVE_END_DATE AS ACTIVE_E2_26_3_, categoryim3_.ACTIVE_START_DATE AS ACTIVE_S3_26_3_, categoryim3_.ARCHIVED AS ARCHIVED4_26_3_ , categoryim3_.DEFAULT_PARENT_CATEGORY_ID AS DEFAULT21_26_3_, categoryim3_.DESCRIPTION AS DESCRIPT5_26_3_, categoryim3_.DISPLAY_TEMPLATE AS DISPLAY_6_26_3_, categoryim3_.EXTERNAL_ID AS EXTERNAL7_26_3_, categoryim3_.FULFILLMENT_TYPE AS FULFILLM8_26_3_ , categoryim3_.INVENTORY_TYPE AS INVENTOR9_26_3_, categoryim3_.LONG_DESCRIPTION AS LONG_DE10_26_3_, categoryim3_.META_DESC AS META_DE11_26_3_, categoryim3_.META_TITLE AS META_TI12_26_3_, categoryim3_.NAME AS NAME13_26_3_ , categoryim3_.OVERRIDE_GENERATED_URL AS OVERRID14_26_3_, categoryim3_.PRODUCT_DESC_PATTERN_OVERRIDE AS PRODUCT15_26_3_, categoryim3_.PRODUCT_TITLE_PATTERN_OVERRIDE AS PRODUCT16_26_3_, categoryim3_.ROOT_DISPLAY_ORDER AS ROOT_DI17_26_3_, categoryim3_.TAX_CODE AS TAX_COD18_26_3_ , categoryim3_.URL AS URL19_26_3_, categoryim3_.URL_KEY AS URL_KEY20_26_3_, skuimpl4_.SKU_ID AS SKU_ID1_160_4_, skuimpl4_.ACTIVE_END_DATE AS ACTIVE_E2_160_4_, skuimpl4_.ACTIVE_START_DATE AS ACTIVE_S3_160_4_ , skuimpl4_.AVAILABLE_FLAG AS AVAILABL4_160_4_, skuimpl4_.COST AS COST5_160_4_, skuimpl4_.CURRENCY_CODE AS CURRENC31_160_4_, skuimpl4_.DEFAULT_PRODUCT_ID AS DEFAULT32_160_4_, skuimpl4_.DESCRIPTION AS DESCRIPT6_160_4_ , skuimpl4_.CONTAINER_SHAPE AS CONTAINE7_160_4_, skuimpl4_.DEPTH AS DEPTH8_160_4_, skuimpl4_.DIMENSION_UNIT_OF_MEASURE AS DIMENSIO9_160_4_, skuimpl4_.GIRTH AS GIRTH10_160_4_, skuimpl4_.HEIGHT AS HEIGHT11_160_4_ , skuimpl4_.CONTAINER_SIZE AS CONTAIN12_160_4_, skuimpl4_.WIDTH AS WIDTH13_160_4_, skuimpl4_.DISCOUNTABLE_FLAG AS DISCOUN14_160_4_, skuimpl4_.DISPLAY_TEMPLATE AS DISPLAY15_160_4_, skuimpl4_.EXTERNAL_ID AS EXTERNA16_160_4_ , skuimpl4_.FULFILLMENT_TYPE AS FULFILL17_160_4_, skuimpl4_.INVENTORY_TYPE AS INVENTO18_160_4_, skuimpl4_.IS_MACHINE_SORTABLE AS IS_MACH19_160_4_, skuimpl4_.LONG_DESCRIPTION AS LONG_DE20_160_4_, skuimpl4_.NAME AS NAME21_160_4_ , skuimpl4_.ADDL_PRODUCT_ID AS ADDL_PR33_160_4_, skuimpl4_.QUANTITY_AVAILABLE AS QUANTIT22_160_4_, skuimpl4_.RETAIL_PRICE AS RETAIL_23_160_4_, skuimpl4_.SALE_PRICE AS SALE_PR24_160_4_, skuimpl4_.TAX_CODE AS TAX_COD25_160_4_ , skuimpl4_.TAXABLE_FLAG AS TAXABLE26_160_4_, skuimpl4_.UPC AS UPC27_160_4_, skuimpl4_.URL_KEY AS URL_KEY28_160_4_, skuimpl4_.WEIGHT AS WEIGHT29_160_4_, skuimpl4_.WEIGHT_UNIT_OF_MEASURE AS WEIGHT_30_160_4_ , productimp5_.PRODUCT_ID AS PRODUCT_1_119_5_, productimp5_.ARCHIVED AS ARCHIVED2_119_5_, productimp5_.CAN_SELL_WITHOUT_OPTIONS AS CAN_SELL3_119_5_, productimp5_.CANONICAL_URL AS CANONICA4_119_5_, productimp5_.DEFAULT_CATEGORY_ID AS DEFAULT14_119_5_ , productimp5_.DEFAULT_SKU_ID AS DEFAULT15_119_5_, productimp5_.DISPLAY_TEMPLATE AS DISPLAY_5_119_5_, productimp5_.IS_FEATURED_PRODUCT AS IS_FEATU6_119_5_, productimp5_.MANUFACTURE AS MANUFACT7_119_5_, productimp5_.META_DESC AS META_DES8_119_5_ , productimp5_.META_TITLE AS META_TIT9_119_5_, productimp5_.MODEL AS MODEL10_119_5_, productimp5_.OVERRIDE_GENERATED_URL AS OVERRID11_119_5_, productimp5_.URL AS URL12_119_5_, productimp5_.URL_KEY AS URL_KEY13_119_5_ , productimp5_1_.AUTO_BUNDLE AS AUTO_BUN1_121_5_, productimp5_1_.BUNDLE_PROMOTABLE AS BUNDLE_P2_121_5_, productimp5_1_.ITEMS_PROMOTABLE AS ITEMS_PR3_121_5_, productimp5_1_.PRICING_MODEL AS PRICING_4_121_5_, productimp5_1_.BUNDLE_PRIORITY AS BUNDLE_P5_121_5_ , CASE  WHEN productimp5_1_.PRODUCT_ID IS NOT NULL THEN 1 WHEN productimp5_.PRODUCT_ID IS NOT NULL THEN 0 END AS clazz_5_ FROM BLC_SKU skuimpl0_ LEFT JOIN BLC_CURRENCY broadleafc1_ ON skuimpl0_.CURRENCY_CODE = broadleafc1_.CURRENCY_CODE LEFT JOIN BLC_PRODUCT productimp2_ ON skuimpl0_.DEFAULT_PRODUCT_ID = productimp2_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp2_1_ ON productimp2_.PRODUCT_ID = productimp2_1_.PRODUCT_ID LEFT JOIN BLC_CATEGORY categoryim3_ ON productimp2_.DEFAULT_CATEGORY_ID = categoryim3_.CATEGORY_ID LEFT JOIN BLC_SKU skuimpl4_ ON productimp2_.DEFAULT_SKU_ID = skuimpl4_.SKU_ID LEFT JOIN BLC_PRODUCT productimp5_ ON skuimpl0_.ADDL_PRODUCT_ID = productimp5_.PRODUCT_ID LEFT JOIN BLC_PRODUCT_BUNDLE productimp5_1_ ON productimp5_.PRODUCT_ID = productimp5_1_.PRODUCT_ID WHERE skuimpl0_.SKU_ID = ?',
    parameters={RS_q24_r1_col6:BIGINT},
    retVals={skuimpl0_.sku_id:BIGINT, skuimpl0_.active_end_date:DATETIME, skuimpl0_.active_start_date:DATETIME, skuimpl0_.available_flag:CHAR, skuimpl0_.cost:DECIMAL, skuimpl0_.currency_code:VARCHAR, skuimpl0_.default_product_id:BIGINT, skuimpl0_.description:VARCHAR, skuimpl0_.container_shape:VARCHAR, skuimpl0_.depth:DECIMAL, skuimpl0_.dimension_unit_of_measure:VARCHAR, skuimpl0_.girth:DECIMAL, skuimpl0_.height:DECIMAL, skuimpl0_.container_size:VARCHAR, skuimpl0_.width:DECIMAL, skuimpl0_.discountable_flag:CHAR, skuimpl0_.display_template:VARCHAR, skuimpl0_.external_id:VARCHAR, skuimpl0_.fulfillment_type:VARCHAR, skuimpl0_.inventory_type:VARCHAR, skuimpl0_.is_machine_sortable:BIT, skuimpl0_.long_description:LONGTEXT, skuimpl0_.name:VARCHAR, skuimpl0_.addl_product_id:BIGINT, skuimpl0_.quantity_available:INT, skuimpl0_.retail_price:DECIMAL, skuimpl0_.sale_price:DECIMAL, skuimpl0_.tax_code:VARCHAR, skuimpl0_.taxable_flag:CHAR, skuimpl0_.upc:VARCHAR, skuimpl0_.url_key:VARCHAR, skuimpl0_.weight:DECIMAL, skuimpl0_.weight_unit_of_measure:VARCHAR, broadleafc1_.currency_code:VARCHAR, broadleafc1_.default_flag:BIT, broadleafc1_.friendly_name:VARCHAR, productimp2_.product_id:BIGINT, productimp2_.archived:CHAR, productimp2_.can_sell_without_options:BIT, productimp2_.canonical_url:VARCHAR, productimp2_.default_category_id:BIGINT, productimp2_.default_sku_id:BIGINT, productimp2_.display_template:VARCHAR, productimp2_.is_featured_product:BIT, productimp2_.manufacture:VARCHAR, productimp2_.meta_desc:VARCHAR, productimp2_.meta_title:VARCHAR, productimp2_.model:VARCHAR, productimp2_.override_generated_url:BIT, productimp2_.url:VARCHAR, productimp2_.url_key:VARCHAR, productimp2_1_.auto_bundle:BIT, productimp2_1_.bundle_promotable:BIT, productimp2_1_.items_promotable:BIT, productimp2_1_.pricing_model:VARCHAR, productimp2_1_.bundle_priority:INT, clazz_2_:INT, categoryim3_.category_id:BIGINT, categoryim3_.active_end_date:DATETIME, categoryim3_.active_start_date:DATETIME, categoryim3_.archived:CHAR, categoryim3_.default_parent_category_id:BIGINT, categoryim3_.description:VARCHAR, categoryim3_.display_template:VARCHAR, categoryim3_.external_id:VARCHAR, categoryim3_.fulfillment_type:VARCHAR, categoryim3_.inventory_type:VARCHAR, categoryim3_.long_description:LONGTEXT, categoryim3_.meta_desc:VARCHAR, categoryim3_.meta_title:VARCHAR, categoryim3_.name:VARCHAR, categoryim3_.override_generated_url:BIT, categoryim3_.product_desc_pattern_override:VARCHAR, categoryim3_.product_title_pattern_override:VARCHAR, categoryim3_.root_display_order:DECIMAL, categoryim3_.tax_code:VARCHAR, categoryim3_.url:VARCHAR, categoryim3_.url_key:VARCHAR, skuimpl4_.sku_id:BIGINT, skuimpl4_.active_end_date:DATETIME, skuimpl4_.active_start_date:DATETIME, skuimpl4_.available_flag:CHAR, skuimpl4_.cost:DECIMAL, skuimpl4_.currency_code:VARCHAR, skuimpl4_.default_product_id:BIGINT, skuimpl4_.description:VARCHAR, skuimpl4_.container_shape:VARCHAR, skuimpl4_.depth:DECIMAL, skuimpl4_.dimension_unit_of_measure:VARCHAR, skuimpl4_.girth:DECIMAL, skuimpl4_.height:DECIMAL, skuimpl4_.container_size:VARCHAR, skuimpl4_.width:DECIMAL, skuimpl4_.discountable_flag:CHAR, skuimpl4_.display_template:VARCHAR, skuimpl4_.external_id:VARCHAR, skuimpl4_.fulfillment_type:VARCHAR, skuimpl4_.inventory_type:VARCHAR, skuimpl4_.is_machine_sortable:BIT, skuimpl4_.long_description:LONGTEXT, skuimpl4_.name:VARCHAR, skuimpl4_.addl_product_id:BIGINT, skuimpl4_.quantity_available:INT, skuimpl4_.retail_price:DECIMAL, skuimpl4_.sale_price:DECIMAL, skuimpl4_.tax_code:VARCHAR, skuimpl4_.taxable_flag:CHAR, skuimpl4_.upc:VARCHAR, skuimpl4_.url_key:VARCHAR, skuimpl4_.weight:DECIMAL, skuimpl4_.weight_unit_of_measure:VARCHAR, productimp5_.product_id:BIGINT, productimp5_.archived:CHAR, productimp5_.can_sell_without_options:BIT, productimp5_.canonical_url:VARCHAR, productimp5_.default_category_id:BIGINT, productimp5_.default_sku_id:BIGINT, productimp5_.display_template:VARCHAR, productimp5_.is_featured_product:BIT, productimp5_.manufacture:VARCHAR, productimp5_.meta_desc:VARCHAR, productimp5_.meta_title:VARCHAR, productimp5_.model:VARCHAR, productimp5_.override_generated_url:BIT, productimp5_.url:VARCHAR, productimp5_.url_key:VARCHAR, productimp5_1_.auto_bundle:BIT, productimp5_1_.bundle_promotable:BIT, productimp5_1_.items_promotable:BIT, productimp5_1_.pricing_model:VARCHAR, productimp5_1_.bundle_priority:INT, clazz_5_:INT}
}
