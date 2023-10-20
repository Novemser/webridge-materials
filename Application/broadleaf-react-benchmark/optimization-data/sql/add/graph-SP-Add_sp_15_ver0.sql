DROP PROCEDURE IF EXISTS `Add_sp_15_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_15_ver0 (IN __nd__func__currentTimeMs__42__236 BIGINT, IN __nd__func__currentTimeMs__42__238 BIGINT, IN __nd__func__currentTimeMs__42__237 BIGINT, IN RS_q20_r1_col1 INT)
BEGIN

DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 DATETIME DEFAULT NULL;
DECLARE q1_i3 CHAR DEFAULT NULL;
DECLARE q1_i4 BIT(1) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_77_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE M_I_RS_78_size INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = FROM_UNIXTIME(((((((((((0+(__nd__func__currentTimeMs__42__237/86400000))+719163)+1)-719163)*86400000)+(((((((0+((28800000+(__nd__func__currentTimeMs__42__236%86400000))/3600000))*60)+(((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)/60000))*60)+((((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)%60000)/1000))*1000)+((((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)%60000)%1000)))-28800000)/1000)*1000)/1000));
SET q1_i2 = FROM_UNIXTIME(((((((((((0+(__nd__func__currentTimeMs__42__238/86400000))+719163)+-1)-719163)*86400000)+(((((((0+((28800000+(__nd__func__currentTimeMs__42__236%86400000))/3600000))*60)+(((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)/60000))*60)+((((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)%60000)/1000))*1000)+((((28800000+(__nd__func__currentTimeMs__42__236%86400000))%3600000)%60000)%1000)))-28800000)/1000)*1000)/1000));
SET q1_i3 = 'N';
SET q1_i4 = 1;
SET QUERY_ID_0 = 0;
SELECT offerimpl0_.OFFER_ID AS OFFER_ID1_85_, offerimpl0_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_, offerimpl0_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_, offerimpl0_.ARCHIVED AS ARCHIVED4_85_, offerimpl0_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_ , offerimpl0_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_, offerimpl0_.OFFER_DESCRIPTION AS OFFER_DE7_85_, offerimpl0_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_, offerimpl0_.END_DATE AS END_DATE9_85_, offerimpl0_.MARKETING_MESSASGE AS MARKETI10_85_ , offerimpl0_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_, offerimpl0_.MAX_USES AS MAX_USE12_85_, offerimpl0_.OFFER_NAME AS OFFER_N13_85_, offerimpl0_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_, offerimpl0_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_ , offerimpl0_.ORDER_MIN_TOTAL AS ORDER_M16_85_, offerimpl0_.OFFER_PRIORITY AS OFFER_P17_85_, offerimpl0_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_, offerimpl0_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_, offerimpl0_.START_DATE AS START_D20_85_ , offerimpl0_.TARGET_MIN_TOTAL AS TARGET_21_85_, offerimpl0_.TARGET_SYSTEM AS TARGET_22_85_, offerimpl0_.TOTALITARIAN_OFFER AS TOTALIT23_85_, offerimpl0_.OFFER_TYPE AS OFFER_T24_85_, offerimpl0_.OFFER_VALUE AS OFFER_V25_85_ FROM BLC_OFFER offerimpl0_ WHERE offerimpl0_.START_DATE < q1_i1 AND (offerimpl0_.END_DATE IS NULL OR offerimpl0_.END_DATE > q1_i2) AND (offerimpl0_.ARCHIVED = q1_i3 OR offerimpl0_.ARCHIVED IS NULL) AND offerimpl0_.AUTOMATICALLY_ADDED = q1_i4;
SET M_I_RS_77_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q2_i1 = RS_q20_r1_col1;
SET QUERY_ID_1 = 1;
SELECT orderadjus0_.ORDER_ID AS ORDER_ID5_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_0_, orderadjus0_.ORDER_ADJUSTMENT_ID AS ORDER_AD1_94_1_, orderadjus0_.OFFER_ID AS OFFER_ID4_94_1_, orderadjus0_.ORDER_ID AS ORDER_ID5_94_1_ , orderadjus0_.ADJUSTMENT_REASON AS ADJUSTME2_94_1_, orderadjus0_.ADJUSTMENT_VALUE AS ADJUSTME3_94_1_, offerimpl1_.OFFER_ID AS OFFER_ID1_85_2_, offerimpl1_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_2_, offerimpl1_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_2_ , offerimpl1_.ARCHIVED AS ARCHIVED4_85_2_, offerimpl1_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_2_, offerimpl1_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_2_, offerimpl1_.OFFER_DESCRIPTION AS OFFER_DE7_85_2_, offerimpl1_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_2_ , offerimpl1_.END_DATE AS END_DATE9_85_2_, offerimpl1_.MARKETING_MESSASGE AS MARKETI10_85_2_, offerimpl1_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_2_, offerimpl1_.MAX_USES AS MAX_USE12_85_2_, offerimpl1_.OFFER_NAME AS OFFER_N13_85_2_ , offerimpl1_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_2_, offerimpl1_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_2_, offerimpl1_.ORDER_MIN_TOTAL AS ORDER_M16_85_2_, offerimpl1_.OFFER_PRIORITY AS OFFER_P17_85_2_, offerimpl1_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_2_ , offerimpl1_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_2_, offerimpl1_.START_DATE AS START_D20_85_2_, offerimpl1_.TARGET_MIN_TOTAL AS TARGET_21_85_2_, offerimpl1_.TARGET_SYSTEM AS TARGET_22_85_2_, offerimpl1_.TOTALITARIAN_OFFER AS TOTALIT23_85_2_ , offerimpl1_.OFFER_TYPE AS OFFER_T24_85_2_, offerimpl1_.OFFER_VALUE AS OFFER_V25_85_2_ FROM BLC_ORDER_ADJUSTMENT orderadjus0_ INNER JOIN BLC_OFFER offerimpl1_ ON orderadjus0_.OFFER_ID = offerimpl1_.OFFER_ID WHERE orderadjus0_.ORDER_ID = q2_i1;
SET M_I_RS_78_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,QUERY_ID_1,q2_i1;

END $$
DELIMITER ;