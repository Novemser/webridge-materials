SqlNo=81
SQLNode {
    sqlTemplate='SELECT taxes0_.FULFILLMENT_GROUP_ITEM_ID AS FULFILLM1_60_0_, taxes0_.TAX_DETAIL_ID AS TAX_DETA2_60_0_, taxdetaili1_.TAX_DETAIL_ID AS TAX_DETA1_176_1_, taxdetaili1_.AMOUNT AS AMOUNT2_176_1_, taxdetaili1_.TAX_COUNTRY AS TAX_COUN3_176_1_ , taxdetaili1_.CURRENCY_CODE AS CURRENCY9_176_1_, taxdetaili1_.JURISDICTION_NAME AS JURISDIC4_176_1_, taxdetaili1_.MODULE_CONFIG_ID AS MODULE_10_176_1_, taxdetaili1_.RATE AS RATE5_176_1_, taxdetaili1_.TAX_REGION AS TAX_REGI6_176_1_ , taxdetaili1_.TAX_NAME AS TAX_NAME7_176_1_, taxdetaili1_.TYPE AS TYPE8_176_1_, broadleafc2_.CURRENCY_CODE AS CURRENCY1_38_2_, broadleafc2_.DEFAULT_FLAG AS DEFAULT_2_38_2_, broadleafc2_.FRIENDLY_NAME AS FRIENDLY3_38_2_ , abstractmo3_.MODULE_CONFIG_ID AS MODULE_C1_84_3_, abstractmo3_.ACTIVE_END_DATE AS ACTIVE_E2_84_3_, abstractmo3_.ACTIVE_START_DATE AS ACTIVE_S3_84_3_, abstractmo3_.ARCHIVED AS ARCHIVED4_84_3_, abstractmo3_.CREATED_BY AS CREATED_5_84_3_ , abstractmo3_.DATE_CREATED AS DATE_CRE6_84_3_, abstractmo3_.DATE_UPDATED AS DATE_UPD7_84_3_, abstractmo3_.UPDATED_BY AS UPDATED_8_84_3_, abstractmo3_.CONFIG_TYPE AS CONFIG_T9_84_3_, abstractmo3_.IS_DEFAULT AS IS_DEFA10_84_3_ , abstractmo3_.MODULE_NAME AS MODULE_11_84_3_, abstractmo3_.MODULE_PRIORITY AS MODULE_12_84_3_, abstractmo3_1_.INDEXED_SITE_MAP_FILE_NAME AS INDEXED_1_157_3_, abstractmo3_1_.INDEXED_SITE_MAP_FILE_PATTERN AS INDEXED_2_157_3_, abstractmo3_1_.MAX_URL_ENTRIES_PER_FILE AS MAX_URL_3_157_3_ , abstractmo3_1_.SITE_MAP_FILE_NAME AS SITE_MAP4_157_3_ , CASE  WHEN abstractmo3_1_.MODULE_CONFIG_ID IS NOT NULL THEN 1 WHEN abstractmo3_.MODULE_CONFIG_ID IS NOT NULL THEN 0 END AS clazz_3_ FROM BLC_FG_ITEM_TAX_XREF taxes0_ INNER JOIN BLC_TAX_DETAIL taxdetaili1_ ON taxes0_.TAX_DETAIL_ID = taxdetaili1_.TAX_DETAIL_ID LEFT JOIN BLC_CURRENCY broadleafc2_ ON taxdetaili1_.CURRENCY_CODE = broadleafc2_.CURRENCY_CODE LEFT JOIN BLC_MODULE_CONFIGURATION abstractmo3_ ON taxdetaili1_.MODULE_CONFIG_ID = abstractmo3_.MODULE_CONFIG_ID LEFT JOIN BLC_SITE_MAP_CFG abstractmo3_1_ ON abstractmo3_.MODULE_CONFIG_ID = abstractmo3_1_.MODULE_CONFIG_ID WHERE taxes0_.FULFILLMENT_GROUP_ITEM_ID = ?',
    parameters={RS_q74_r1_col3:BIGINT},
    retVals={taxes0_.fulfillment_group_item_id:BIGINT, taxes0_.tax_detail_id:BIGINT, taxdetaili1_.tax_detail_id:BIGINT, taxdetaili1_.amount:DECIMAL, taxdetaili1_.tax_country:VARCHAR, taxdetaili1_.currency_code:VARCHAR, taxdetaili1_.jurisdiction_name:VARCHAR, taxdetaili1_.module_config_id:BIGINT, taxdetaili1_.rate:DECIMAL, taxdetaili1_.tax_region:VARCHAR, taxdetaili1_.tax_name:VARCHAR, taxdetaili1_.type:VARCHAR, broadleafc2_.currency_code:VARCHAR, broadleafc2_.default_flag:BIT, broadleafc2_.friendly_name:VARCHAR, abstractmo3_.module_config_id:BIGINT, abstractmo3_.active_end_date:DATETIME, abstractmo3_.active_start_date:DATETIME, abstractmo3_.archived:CHAR, abstractmo3_.created_by:BIGINT, abstractmo3_.date_created:DATETIME, abstractmo3_.date_updated:DATETIME, abstractmo3_.updated_by:BIGINT, abstractmo3_.config_type:VARCHAR, abstractmo3_.is_default:BIT, abstractmo3_.module_name:VARCHAR, abstractmo3_.module_priority:INT, abstractmo3_1_.indexed_site_map_file_name:VARCHAR, abstractmo3_1_.indexed_site_map_file_pattern:VARCHAR, abstractmo3_1_.max_url_entries_per_file:INT, abstractmo3_1_.site_map_file_name:VARCHAR, clazz_3_:INT}
}