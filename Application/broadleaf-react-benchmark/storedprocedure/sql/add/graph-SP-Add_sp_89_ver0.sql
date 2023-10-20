DROP PROCEDURE IF EXISTS `Add_sp_89_ver0`;
DELIMITER $$
CREATE PROCEDURE Add_sp_89_ver0 (IN RS_q45_r1_col64 INT)
BEGIN

DECLARE q1_i1 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_100_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = RS_q45_r1_col64;
SET QUERY_ID_0 = 0;
SELECT skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_2_, skumedia0_.MAP_KEY AS formula1_2_, skumedia0_.SKU_MEDIA_ID AS SKU_MEDI1_168_1_, skumedia0_.MAP_KEY AS MAP_KEY2_168_1_ , skumedia0_.MEDIA_ID AS MEDIA_ID3_168_1_, skumedia0_.BLC_SKU_SKU_ID AS BLC_SKU_4_168_1_, mediaimpl1_.MEDIA_ID AS MEDIA_ID1_83_0_, mediaimpl1_.ALT_TEXT AS ALT_TEXT2_83_0_, mediaimpl1_.TAGS AS TAGS3_83_0_ , mediaimpl1_.TITLE AS TITLE4_83_0_, mediaimpl1_.URL AS URL5_83_0_ FROM BLC_SKU_MEDIA_MAP skumedia0_ LEFT JOIN BLC_MEDIA mediaimpl1_ ON skumedia0_.MEDIA_ID = mediaimpl1_.MEDIA_ID WHERE skumedia0_.BLC_SKU_SKU_ID = q1_i1;
SET M_I_RS_100_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;