DROP PROCEDURE IF EXISTS `AddCart_sp_16_ver0`;
DELIMITER $$
CREATE PROCEDURE AddCart_sp_16_ver0 (IN M_I_RS_10_size INT, IN M_I_RS_6_size INT, IN RS_q2_r1_col74 VARCHAR(512), IN M_I_RS_540_rowCount INT, IN M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity INT, IN RS_q2_r1_col32 INT, IN RS_q18_r1_col1 INT, IN RS_q18_r1_col2 INT, IN RS_q2_r1_col1 INT, IN RS_q2_r1_col72 DATETIME, IN RS_q18_r1_col3 INT, IN RS_q2_r1_col71 DATETIME, IN M_I_RS_500_rowCount INT, IN RS_q18_r1_col87 INT, IN RS_q18_r1_col149 INT, IN RS_q2_r1_col66 VARCHAR(512), IN M_I_RS_41_size INT, IN RS_q2_r1_col68 INT, IN RS_q18_r1_col152 DATETIME, IN RS_q2_r1_col63 VARCHAR(512), IN RS_q18_r1_col151 DATETIME, IN M_I_RS_31_size INT, IN M_I_RS_524_rowCount INT, IN M_I_RS_26_size INT, IN M_I_RS_2_size INT, IN M_I_RS_45_size INT, IN RS_q18_r1_col60 INT, IN RS_q18_r1_col51 DATETIME, IN M_I_RS_18_size INT, IN RS_q18_r1_col52 DATETIME, IN RS_q18_r1_col163 INT, IN RS_q18_r1_col164 INT, IN __nd__func__currentTimeMs__42__67 BIGINT, IN RS_q18_r1_col71 VARCHAR(512), IN RS_q18_r1_col63 INT, IN RS_q18_r1_col64 VARCHAR(512), IN RS_q18_r1_col66 INT, IN RS_q18_r1_col23 DATETIME, IN RS_q18_r1_col24 DATETIME, IN M_I_RS_14_size INT, IN RS_q6_r3_col3 DATETIME, IN RS_q6_r3_col2 DATETIME, IN RS_q26_r1_col1 INT, IN RS_q2_r1_col81 INT, IN RS_q18_r1_col136 DATETIME, IN RS_q18_r1_col135 DATETIME, IN RS_q10_r1_col10 INT, IN RS_q6_r2_col3 DATETIME, IN RS_q6_r2_col2 DATETIME, IN M_I_RS_40_size INT, IN M_I_RS_545_rowCount INT, IN RS_q18_r1_col76 INT, IN RS_q31_r1_col1 INT)
BEGIN

DECLARE RS_q18_r1_col71_intCompact BIGINT DEFAULT NULL;
DECLARE RS_q18_r1_col71_scale INT DEFAULT NULL;
DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;

SET RS_q18_r1_col71_intCompact = get_int_compact(RS_q18_r1_col71);
SET RS_q18_r1_col71_scale = get_scale(RS_q18_r1_col71);
IF TRUE THEN
commit;
END IF;
IF MICROSECOND(RS_q6_r3_col3)*1000>=0&&MICROSECOND(RS_q6_r3_col3)*1000<=999999999&&MICROSECOND(RS_q6_r3_col2)*1000>=0&&MICROSECOND(RS_q6_r3_col2)*1000<=999999999&&MICROSECOND(RS_q6_r2_col3)*1000>=0&&MICROSECOND(RS_q6_r2_col3)*1000<=999999999&&MICROSECOND(RS_q6_r2_col2)*1000>=0&&MICROSECOND(RS_q6_r2_col2)*1000<=999999999&&RS_q31_r1_col1>0&&RS_q31_r1_col1>-9223372036854775808&&RS_q2_r1_col81=RS_q2_r1_col1&&MICROSECOND(RS_q2_r1_col72)*1000>=0&&MICROSECOND(RS_q2_r1_col72)*1000<=999999999&&MICROSECOND(RS_q2_r1_col71)*1000>=0&&MICROSECOND(RS_q2_r1_col71)*1000<=999999999&&RS_q2_r1_col68!=0&&RS_q2_r1_col32=0&&RS_q26_r1_col1>0&&RS_q26_r1_col1>-9223372036854775808&&RS_q18_r1_col87=RS_q18_r1_col3&&RS_q18_r1_col76=RS_q18_r1_col2&&RS_q18_r1_col66=RS_q18_r1_col1&&RS_q18_r1_col63!=0&&RS_q18_r1_col60!=0&&MICROSECOND(RS_q18_r1_col52)*1000>=0&&MICROSECOND(RS_q18_r1_col52)*1000<=999999999&&MICROSECOND(RS_q18_r1_col51)*1000>=0&&MICROSECOND(RS_q18_r1_col51)*1000<=999999999&&MICROSECOND(RS_q18_r1_col24)*1000>=0&&MICROSECOND(RS_q18_r1_col24)*1000<=999999999&&MICROSECOND(RS_q18_r1_col23)*1000>=0&&MICROSECOND(RS_q18_r1_col23)*1000<=999999999&&RS_q18_r1_col164=RS_q18_r1_col1&&RS_q18_r1_col163=0&&MICROSECOND(RS_q18_r1_col152)*1000>=0&&MICROSECOND(RS_q18_r1_col152)*1000<=999999999&&MICROSECOND(RS_q18_r1_col151)*1000>=0&&MICROSECOND(RS_q18_r1_col151)*1000<=999999999&&RS_q18_r1_col149=RS_q18_r1_col1&&MICROSECOND(RS_q18_r1_col136)*1000>=0&&MICROSECOND(RS_q18_r1_col136)*1000<=999999999&&MICROSECOND(RS_q18_r1_col135)*1000>=0&&MICROSECOND(RS_q18_r1_col135)*1000<=999999999&&RS_q10_r1_col10=0&&M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity>0&&M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity>-9223372036854775808&&M_I_RS_6_size>=3&&M_I_RS_6_size>=2&&M_I_RS_6_size>=1&&M_I_RS_6_size<4&&M_I_RS_524_rowCount!=0&&M_I_RS_500_rowCount!=0&&M_I_RS_45_size<1&&M_I_RS_41_size>=1&&M_I_RS_41_size<2&&M_I_RS_40_size>=1&&M_I_RS_40_size<2&&M_I_RS_31_size>=1&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_26_size>=1&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size<1&&M_I_RS_10_size>=1&&M_I_RS_10_size<2&&LENGTH(RS_q2_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))<=90&&1>=M_I_RS_545_rowCount&&1>=M_I_RS_540_rowCount&&1<=M_I_RS_545_rowCount&&1<=M_I_RS_540_rowCount&&(RS_q31_r1_col1*50)>-9223372036854775808&&(RS_q26_r1_col1*50)>-9223372036854775808&&(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,2+1,1),CHAR))-65)=3&&(0-RS_q18_r1_col71_scale)<0&&(0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))>0&&(0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))>-9223372036854775808&&(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))>0&&(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))>-9223372036854775808&&((__nd__func__currentTimeMs__42__67%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))-65))=52&&((cast((0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))^0 as signed))&(cast((0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))^(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)) as signed)))=0&&((cast((0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))^0 as signed))&(cast((0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))^(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity) as signed)))=0&&((((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))&&(u_rshift((RS_q18_r1_col71_intCompact|M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity),31))=0&&(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)>0&&(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)>-9223372036854775808&&RS_q18_r1_col71_scale!=0&&RS_q18_r1_col71_intCompact>0&&RS_q18_r1_col71_intCompact>-9223372036854775808&&RS_q2_r1_col74='en'&&RS_q18_r1_col64='*'&&'CA'=RS_q2_r1_col63 THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF MICROSECOND(RS_q6_r3_col3)*1000>=0&&MICROSECOND(RS_q6_r3_col3)*1000<=999999999&&MICROSECOND(RS_q6_r3_col2)*1000>=0&&MICROSECOND(RS_q6_r3_col2)*1000<=999999999&&MICROSECOND(RS_q6_r2_col3)*1000>=0&&MICROSECOND(RS_q6_r2_col3)*1000<=999999999&&MICROSECOND(RS_q6_r2_col2)*1000>=0&&MICROSECOND(RS_q6_r2_col2)*1000<=999999999&&RS_q31_r1_col1>0&&RS_q31_r1_col1>-9223372036854775808&&RS_q2_r1_col81=RS_q2_r1_col1&&MICROSECOND(RS_q2_r1_col72)*1000>=0&&MICROSECOND(RS_q2_r1_col72)*1000<=999999999&&MICROSECOND(RS_q2_r1_col71)*1000>=0&&MICROSECOND(RS_q2_r1_col71)*1000<=999999999&&RS_q2_r1_col68!=0&&RS_q2_r1_col32=0&&RS_q26_r1_col1>0&&RS_q26_r1_col1>-9223372036854775808&&RS_q18_r1_col87=RS_q18_r1_col3&&RS_q18_r1_col76=RS_q18_r1_col2&&RS_q18_r1_col66=RS_q18_r1_col1&&RS_q18_r1_col63!=0&&RS_q18_r1_col60!=0&&MICROSECOND(RS_q18_r1_col52)*1000>=0&&MICROSECOND(RS_q18_r1_col52)*1000<=999999999&&MICROSECOND(RS_q18_r1_col51)*1000>=0&&MICROSECOND(RS_q18_r1_col51)*1000<=999999999&&MICROSECOND(RS_q18_r1_col24)*1000>=0&&MICROSECOND(RS_q18_r1_col24)*1000<=999999999&&MICROSECOND(RS_q18_r1_col23)*1000>=0&&MICROSECOND(RS_q18_r1_col23)*1000<=999999999&&RS_q18_r1_col164=RS_q18_r1_col1&&RS_q18_r1_col163=0&&MICROSECOND(RS_q18_r1_col152)*1000>=0&&MICROSECOND(RS_q18_r1_col152)*1000<=999999999&&MICROSECOND(RS_q18_r1_col151)*1000>=0&&MICROSECOND(RS_q18_r1_col151)*1000<=999999999&&RS_q18_r1_col149=RS_q18_r1_col1&&MICROSECOND(RS_q18_r1_col136)*1000>=0&&MICROSECOND(RS_q18_r1_col136)*1000<=999999999&&MICROSECOND(RS_q18_r1_col135)*1000>=0&&MICROSECOND(RS_q18_r1_col135)*1000<=999999999&&RS_q10_r1_col10=0&&M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity>0&&M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity>-9223372036854775808&&M_I_RS_6_size>=3&&M_I_RS_6_size>=2&&M_I_RS_6_size>=1&&M_I_RS_6_size<4&&M_I_RS_524_rowCount!=0&&M_I_RS_500_rowCount!=0&&M_I_RS_45_size<1&&M_I_RS_41_size>=1&&M_I_RS_41_size<2&&M_I_RS_40_size>=1&&M_I_RS_40_size<2&&M_I_RS_31_size>=1&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_26_size>=1&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size<1&&M_I_RS_10_size>=1&&M_I_RS_10_size<2&&LENGTH(RS_q2_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))<=90&&1>=M_I_RS_545_rowCount&&1>=M_I_RS_540_rowCount&&1<=M_I_RS_545_rowCount&&1<=M_I_RS_540_rowCount&&(RS_q31_r1_col1*50)>-9223372036854775808&&(RS_q26_r1_col1*50)>-9223372036854775808&&(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,2+1,1),CHAR))-65)=3&&(0-RS_q18_r1_col71_scale)<0&&(0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))>0&&(0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))>-9223372036854775808&&(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))>0&&(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))>-9223372036854775808&&((__nd__func__currentTimeMs__42__67%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))-65))=52&&((cast((0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))^0 as signed))&(cast((0+(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)))^(0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)) as signed)))=0&&((cast((0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))^0 as signed))&(cast((0+(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity))^(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity) as signed)))=0&&((((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))&&(u_rshift((RS_q18_r1_col71_intCompact|M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity),31))=0&&(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)>0&&(RS_q18_r1_col71_intCompact*M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity)>-9223372036854775808&&RS_q18_r1_col71_scale!=0&&RS_q18_r1_col71_intCompact>0&&RS_q18_r1_col71_intCompact>-9223372036854775808&&RS_q2_r1_col74='en'&&RS_q18_r1_col64='*'&&'CA'=RS_q2_r1_col63 THEN
SET QUERY_ID_1_TXN = 1;
set autocommit=0;
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN;

END $$
DELIMITER ;