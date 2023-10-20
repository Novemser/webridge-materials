DROP PROCEDURE IF EXISTS `ItemDetails_sp_42_ver0`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_42_ver0 (IN RS_q37_r2_col3 INT)
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_43_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = 'ProductAttribute';
SET q1_i2 = CONVERT(RS_q37_r2_col3,CHAR);
SET q1_i3 = 'name';
SET q1_i4 = 'en%';
SET QUERY_ID_0 = 0;
SELECT translatio0_.TRANSLATION_ID AS TRANSLAT1_178_, translatio0_.ENTITY_ID AS ENTITY_I2_178_, translatio0_.ENTITY_TYPE AS ENTITY_T3_178_, translatio0_.FIELD_NAME AS FIELD_NA4_178_, translatio0_.LOCALE_CODE AS LOCALE_C5_178_ , translatio0_.TRANSLATED_VALUE AS TRANSLAT6_178_ FROM BLC_TRANSLATION translatio0_ WHERE translatio0_.ENTITY_TYPE = q1_i1 AND translatio0_.ENTITY_ID = q1_i2 AND translatio0_.FIELD_NAME = q1_i3 AND translatio0_.LOCALE_CODE LIKE q1_i4;
SET M_I_RS_43_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4;

END $$
DELIMITER ;