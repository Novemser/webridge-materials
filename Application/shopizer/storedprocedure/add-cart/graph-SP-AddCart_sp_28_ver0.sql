DROP PROCEDURE IF EXISTS `AddCart_sp_28_ver0`;
DELIMITER $$
CREATE PROCEDURE AddCart_sp_28_ver0 (IN RS_q26_r1_col1 INT, IN M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity INT, IN __nd__func__currentTimeMs__42__76 BIGINT, IN RS_q18_r1_col1 INT, IN __nd__func__currentTimeMs__42__75 BIGINT, IN RS_q31_r1_col1 INT)
BEGIN

DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 DATETIME DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE q1_i5 INT DEFAULT NULL;
DECLARE q1_i6 BIGINT DEFAULT NULL;
DECLARE q1_i7 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_545_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;

IF TRUE THEN
SET q1_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__76/1000)*1000)/1000));
SET q1_i2 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__75/1000)*1000)/1000));
SET q1_i3 = NULL;
SET q1_i4 = RS_q18_r1_col1;
SET q1_i5 = M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity;
SET q1_i6 = (RS_q26_r1_col1*50);
SET q1_i7 = (RS_q31_r1_col1*50);
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p3;
INSERT INTO SHOPPING_CART_ITEM (DATE_CREATED, DATE_MODIFIED, UPDT_ID, PRODUCT_ID, QUANTITY , SHP_CART_ID, SHP_CART_ITEM_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4, q1_i5 , q1_i6, q1_i7);
SET M_I_RS_545_rowCount = ROW_COUNT();
SELECT M_I_RS_545_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7;

END $$
DELIMITER ;