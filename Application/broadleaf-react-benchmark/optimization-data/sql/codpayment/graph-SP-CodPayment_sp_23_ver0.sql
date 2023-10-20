DROP PROCEDURE IF EXISTS `CodPayment_sp_23_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_23_ver0 (IN RS_q20_r1_col1 INT)
BEGIN

DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_126_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;
DECLARE q4_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_3 INT DEFAULT NULL;
DECLARE M_I_RS_127_size INT DEFAULT NULL;
DECLARE cursor_cnt_3 INT DEFAULT NULL;
DECLARE q5_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_4 INT DEFAULT NULL;
DECLARE M_I_RS_128_size INT DEFAULT NULL;
DECLARE cursor_cnt_4 INT DEFAULT NULL;
DECLARE q6_i1 BIGINT DEFAULT NULL;
DECLARE q6_i2 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_5 INT DEFAULT NULL;
DECLARE M_I_RS_2257_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_5 INT DEFAULT NULL;

IF TRUE THEN
commit;
END IF;
IF TRUE THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF TRUE THEN
SET QUERY_ID_1_TXN = 1;
set autocommit=0;
END IF;
IF TRUE THEN
SET q3_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_2 = 2;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q3_i1;
SET M_I_RS_126_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q4_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_3 = 3;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q4_i1;
SET M_I_RS_127_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q5_i1 = 'order.lock.database.session.affinity';
SET QUERY_ID_4 = 4;
SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = q5_i1;
SET M_I_RS_128_size = FOUND_ROWS();
END IF;
IF TRUE THEN
SET q6_i1 = RS_q20_r1_col1;
SET q6_i2 = '00000000-0000-0000-0000-000000000000';
SET QUERY_ID_5 = 5;
SAVEPOINT trace0_p11;
UPDATE BLC_ORDER_LOCK SET LOCKED = 'N' WHERE ORDER_ID = q6_i1 AND LOCK_KEY = q6_i2;
SET M_I_RS_2257_rowCount = ROW_COUNT();
SELECT M_I_RS_2257_rowCount;
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1,QUERY_ID_3,q4_i1,QUERY_ID_4,q5_i1,QUERY_ID_5,q6_i1,q6_i2;

END $$
DELIMITER ;