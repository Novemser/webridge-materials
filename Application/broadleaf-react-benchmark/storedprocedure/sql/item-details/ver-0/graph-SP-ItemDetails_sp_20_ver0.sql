DROP PROCEDURE IF EXISTS `ItemDetails_sp_20_ver0`;
DELIMITER $$
CREATE PROCEDURE ItemDetails_sp_20_ver0 ()
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_21_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = 'i18n.translation.enabled';
SET QUERY_ID_0 = 0;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q1_i1;
SET M_I_RS_21_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;