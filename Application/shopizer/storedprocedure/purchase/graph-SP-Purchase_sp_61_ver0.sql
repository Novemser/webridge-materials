DROP PROCEDURE IF EXISTS `Purchase_sp_61_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_61_ver0 ()
BEGIN

DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_76_size INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET QUERY_ID_0 = 0;
SELECT SEQ_COUNT FROM SM_SEQUENCER WHERE SEQ_NAME = 'ORDER_PRD_PRICE_ID_NEXT_VAL' FOR UPDATE;
SET M_I_RS_76_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0;

END $$
DELIMITER ;