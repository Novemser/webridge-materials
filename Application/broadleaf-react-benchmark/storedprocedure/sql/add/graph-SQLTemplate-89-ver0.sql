SqlNo=100
SQLNode {
    sqlTemplate='SELECT skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_2_, skumedia0_.MAP_KEY AS formula1_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_1_, skumedia0_.MAP_KEY AS MAP_KEY2_168_1_ , skumedia0_.MEDIA_ID AS MEDIA_ID3_168_1_, skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_1_, mediaimpl1_.MEDIA_ID AS MEDIA_ID1_83_0_, mediaimpl1_.ALT_TEXT AS ALT_TEXT2_83_0_, mediaimpl1_.TAGS AS TAGS3_83_0_ , mediaimpl1_.TITLE AS TITLE4_83_0_, mediaimpl1_.URL AS URL5_83_0_ FROM BLC_SKU_MEDIA_MAP skumedia0_ LEFT JOIN BLC_MEDIA mediaimpl1_ ON skumedia0_.MEDIA_ID = mediaimpl1_.MEDIA_ID WHERE skumedia0_.BLC_SKU_SKU_ID = ?',
    parameters={RS_q45_r1_col64:BIGINT},
    retVals={skumedia0_.blc_sku_sku_id:BIGINT, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.sku_media_id:BIGINT, skumedia0_.map_key:VARCHAR, skumedia0_.media_id:BIGINT, skumedia0_.blc_sku_sku_id:BIGINT, mediaimpl1_.media_id:BIGINT, mediaimpl1_.alt_text:VARCHAR, mediaimpl1_.tags:VARCHAR, mediaimpl1_.title:VARCHAR, mediaimpl1_.url:VARCHAR}
}
