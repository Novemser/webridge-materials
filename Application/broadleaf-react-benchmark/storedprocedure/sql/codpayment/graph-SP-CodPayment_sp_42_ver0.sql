DROP PROCEDURE IF EXISTS `CodPayment_sp_42_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_42_ver0 ()
BEGIN

DECLARE q1_i1 VARCHAR(512) DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_45_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = 'OrderPaymentImpl';
SET QUERY_ID_0 = 0;
SELECT tbl.ID_VAL FROM SEQUENCE_GENERATOR tbl WHERE tbl.ID_NAME = q1_i1 FOR UPDATE;
SET M_I_RS_45_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0,q1_i1;

END $$
DELIMITER ;