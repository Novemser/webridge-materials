SqlNo=49
SQLNode {
    sqlTemplate='SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = ? AND translatio0_.ENTITY_ID = ? AND translatio0_.FIELD_NAME = ? AND translatio0_.LOCALE_CODE LIKE ?',
    parameters={"ProductAttribute":VARCHAR, CONVERT(RS_q37_r1_col3, CHAR):VARCHAR, "value":VARCHAR, "en%":VARCHAR},
    retVals={translatio0_.translation_id:BIGINT, translatio0_.entity_id:VARCHAR, translatio0_.entity_type:VARCHAR, translatio0_.field_name:VARCHAR, translatio0_.locale_code:VARCHAR, translatio0_.translated_value:LONGTEXT}
}
