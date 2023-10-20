DROP PROCEDURE IF EXISTS `CodPayment_sp_64_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_64_ver0 (IN RS_q66_r1_col3 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_71_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q66_r1_col3;
SET QUERY_ID_0 = 0;
SELECT orderitemq0_.ORDER_ITEM_ID AS ORDER_IT4_81_0_, orderitemq0_.ITEM_OFFER_QUALIFIER_ID AS ITEM_OFF1_81_0_, orderitemq0_.ITEM_OFFER_QUALIFIER_ID AS ITEM_OFF1_81_1_, orderitemq0_.OFFER_ID AS OFFER_ID3_81_1_, orderitemq0_.ORDER_ITEM_ID AS ORDER_IT4_81_1_ , orderitemq0_.QUANTITY AS QUANTITY2_81_1_, offerimpl1_.OFFER_ID AS OFFER_ID1_85_2_, offerimpl1_.APPLY_TO_CHILD_ITEMS AS APPLY_TO2_85_2_, offerimpl1_.APPLY_TO_SALE_PRICE AS APPLY_TO3_85_2_, offerimpl1_.ARCHIVED AS ARCHIVED4_85_2_ , offerimpl1_.AUTOMATICALLY_ADDED AS AUTOMATI5_85_2_, offerimpl1_.COMBINABLE_WITH_OTHER_OFFERS AS COMBINAB6_85_2_, offerimpl1_.OFFER_DESCRIPTION AS OFFER_DE7_85_2_, offerimpl1_.OFFER_DISCOUNT_TYPE AS OFFER_DI8_85_2_, offerimpl1_.END_DATE AS END_DATE9_85_2_ , offerimpl1_.MARKETING_MESSASGE AS MARKETI10_85_2_, offerimpl1_.MAX_USES_PER_CUSTOMER AS MAX_USE11_85_2_, offerimpl1_.MAX_USES AS MAX_USE12_85_2_, offerimpl1_.OFFER_NAME AS OFFER_N13_85_2_, offerimpl1_.OFFER_ITEM_QUALIFIER_RULE AS OFFER_I14_85_2_ , offerimpl1_.OFFER_ITEM_TARGET_RULE AS OFFER_I15_85_2_, offerimpl1_.ORDER_MIN_TOTAL AS ORDER_M16_85_2_, offerimpl1_.OFFER_PRIORITY AS OFFER_P17_85_2_, offerimpl1_.QUALIFYING_ITEM_MIN_TOTAL AS QUALIFY18_85_2_, offerimpl1_.REQUIRES_RELATED_TAR_QUAL AS REQUIRE19_85_2_ , offerimpl1_.START_DATE AS START_D20_85_2_, offerimpl1_.TARGET_MIN_TOTAL AS TARGET_21_85_2_, offerimpl1_.TARGET_SYSTEM AS TARGET_22_85_2_, offerimpl1_.TOTALITARIAN_OFFER AS TOTALIT23_85_2_, offerimpl1_.OFFER_TYPE AS OFFER_T24_85_2_ , offerimpl1_.OFFER_VALUE AS OFFER_V25_85_2_ FROM BLC_ITEM_OFFER_QUALIFIER orderitemq0_ INNER JOIN BLC_OFFER offerimpl1_ ON orderitemq0_.OFFER_ID = offerimpl1_.OFFER_ID WHERE orderitemq0_.ORDER_ITEM_ID = q1_i1;
SET M_I_RS_71_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;