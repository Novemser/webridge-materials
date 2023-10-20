DROP PROCEDURE IF EXISTS `AddCart_sp_12_ver0`;
DELIMITER $$
CREATE PROCEDURE AddCart_sp_12_ver0 (IN M_I_RS_10_size INT, IN M_I_RS_6_size INT, IN RS_q2_r1_col32 INT, IN M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity INT, IN RS_q18_r1_col1 INT, IN RS_q18_r1_col2 INT, IN RS_q2_r1_col1 INT, IN RS_q2_r1_col72 DATETIME, IN RS_q18_r1_col3 INT, IN RS_q2_r1_col71 DATETIME, IN M_I_RS_500_rowCount INT, IN RS_q18_r1_col87 INT, IN RS_q18_r1_col149 INT, IN RS_q2_r1_col66 VARCHAR(512), IN RS_q2_r1_col68 INT, IN RS_q18_r1_col152 DATETIME, IN RS_q18_r1_col151 DATETIME, IN M_I_RS_31_size INT, IN M_I_RS_524_rowCount INT, IN M_I_RS_26_size INT, IN M_I_RS_2_size INT, IN RS_q18_r1_col60 INT, IN RS_q18_r1_col51 DATETIME, IN M_I_RS_18_size INT, IN RS_q18_r1_col52 DATETIME, IN RS_q18_r1_col163 INT, IN RS_q18_r1_col164 INT, IN __nd__func__currentTimeMs__42__67 BIGINT, IN __nd__func__currentTimeMs__42__66 BIGINT, IN M_L_String__unique_cart_code VARCHAR(512), IN RS_q18_r1_col63 INT, IN RS_q18_r1_col64 VARCHAR(512), IN RS_q18_r1_col66 INT, IN RS_q18_r1_col23 DATETIME, IN RS_q18_r1_col24 DATETIME, IN M_I_RS_14_size INT, IN RS_q6_r3_col3 DATETIME, IN RS_q6_r3_col2 DATETIME, IN RS_q26_r1_col1 INT, IN RS_q10_r1_col1 INT, IN RS_q2_r1_col81 INT, IN RS_q18_r1_col136 DATETIME, IN RS_q18_r1_col135 DATETIME, IN RS_q10_r1_col10 INT, IN RS_q6_r2_col3 DATETIME, IN RS_q6_r2_col2 DATETIME, IN RS_q18_r1_col76 INT, IN __nd__func__currentTimeMs__42__76 BIGINT, IN __nd__func__currentTimeMs__42__75 BIGINT, IN RS_q31_r1_col1 INT)
BEGIN

DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 DATETIME DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE q1_i5 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i6 INT DEFAULT NULL;
DECLARE q1_i7 BIGINT DEFAULT NULL;
DECLARE q1_i8 DATETIME DEFAULT NULL;
DECLARE q1_i9 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i10 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i11 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_540_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 DATETIME DEFAULT NULL;
DECLARE q2_i2 DATETIME DEFAULT NULL;
DECLARE q2_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i4 BIGINT DEFAULT NULL;
DECLARE q2_i5 INT DEFAULT NULL;
DECLARE q2_i6 BIGINT DEFAULT NULL;
DECLARE q2_i7 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE M_I_RS_545_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;

IF MICROSECOND(RS_q6_r3_col3)*1000>=0&&MICROSECOND(RS_q6_r3_col3)*1000<=999999999&&MICROSECOND(RS_q6_r3_col2)*1000>=0&&MICROSECOND(RS_q6_r3_col2)*1000<=999999999&&MICROSECOND(RS_q6_r2_col3)*1000>=0&&MICROSECOND(RS_q6_r2_col3)*1000<=999999999&&MICROSECOND(RS_q6_r2_col2)*1000>=0&&MICROSECOND(RS_q6_r2_col2)*1000<=999999999&&RS_q31_r1_col1>0&&RS_q31_r1_col1>-9223372036854775808&&RS_q2_r1_col81=RS_q2_r1_col1&&MICROSECOND(RS_q2_r1_col72)*1000>=0&&MICROSECOND(RS_q2_r1_col72)*1000<=999999999&&MICROSECOND(RS_q2_r1_col71)*1000>=0&&MICROSECOND(RS_q2_r1_col71)*1000<=999999999&&RS_q2_r1_col68!=0&&RS_q2_r1_col32=0&&RS_q26_r1_col1>0&&RS_q26_r1_col1>-9223372036854775808&&RS_q18_r1_col87=RS_q18_r1_col3&&RS_q18_r1_col76=RS_q18_r1_col2&&RS_q18_r1_col66=RS_q18_r1_col1&&RS_q18_r1_col63!=0&&RS_q18_r1_col60!=0&&MICROSECOND(RS_q18_r1_col52)*1000>=0&&MICROSECOND(RS_q18_r1_col52)*1000<=999999999&&MICROSECOND(RS_q18_r1_col51)*1000>=0&&MICROSECOND(RS_q18_r1_col51)*1000<=999999999&&MICROSECOND(RS_q18_r1_col24)*1000>=0&&MICROSECOND(RS_q18_r1_col24)*1000<=999999999&&MICROSECOND(RS_q18_r1_col23)*1000>=0&&MICROSECOND(RS_q18_r1_col23)*1000<=999999999&&RS_q18_r1_col164=RS_q18_r1_col1&&RS_q18_r1_col163=0&&MICROSECOND(RS_q18_r1_col152)*1000>=0&&MICROSECOND(RS_q18_r1_col152)*1000<=999999999&&MICROSECOND(RS_q18_r1_col151)*1000>=0&&MICROSECOND(RS_q18_r1_col151)*1000<=999999999&&RS_q18_r1_col149=RS_q18_r1_col1&&MICROSECOND(RS_q18_r1_col136)*1000>=0&&MICROSECOND(RS_q18_r1_col136)*1000<=999999999&&MICROSECOND(RS_q18_r1_col135)*1000>=0&&MICROSECOND(RS_q18_r1_col135)*1000<=999999999&&RS_q10_r1_col10=0&&M_I_RS_6_size>=3&&M_I_RS_6_size>=2&&M_I_RS_6_size>=1&&M_I_RS_6_size<4&&M_I_RS_524_rowCount!=0&&M_I_RS_500_rowCount!=0&&M_I_RS_31_size>=1&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_26_size>=1&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size<1&&M_I_RS_10_size>=1&&M_I_RS_10_size<2&&LENGTH(RS_q2_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))<=90&&(RS_q31_r1_col1*50)>-9223372036854775808&&(RS_q26_r1_col1*50)>-9223372036854775808&&(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,2+1,1),CHAR))-65)=3&&((__nd__func__currentTimeMs__42__67%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))-65))=52&&((((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))&&RS_q18_r1_col64='*' THEN
SET q1_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__67/1000)*1000)/1000));
SET q1_i2 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__66/1000)*1000)/1000));
SET q1_i3 = NULL;
SET q1_i4 = RS_q10_r1_col1;
SET q1_i5 = NULL;
SET q1_i6 = RS_q2_r1_col1;
SET q1_i7 = NULL;
SET q1_i8 = NULL;
SET q1_i9 = NULL;
SET q1_i10 = M_L_String__unique_cart_code;
SET q1_i11 = (RS_q26_r1_col1*50);
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p4;
INSERT INTO SHOPPING_CART (DATE_CREATED, DATE_MODIFIED, UPDT_ID, CUSTOMER_ID, IP_ADDRESS , MERCHANT_ID, ORDER_ID, PROMO_ADDED, PROMO_CODE, SHP_CART_CODE , SHP_CART_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4, q1_i5 , q1_i6, q1_i7, q1_i8, q1_i9, q1_i10 , q1_i11);
SET M_I_RS_540_rowCount = ROW_COUNT();
SELECT M_I_RS_540_rowCount;
END IF;
IF MICROSECOND(RS_q6_r3_col3)*1000>=0&&MICROSECOND(RS_q6_r3_col3)*1000<=999999999&&MICROSECOND(RS_q6_r3_col2)*1000>=0&&MICROSECOND(RS_q6_r3_col2)*1000<=999999999&&MICROSECOND(RS_q6_r2_col3)*1000>=0&&MICROSECOND(RS_q6_r2_col3)*1000<=999999999&&MICROSECOND(RS_q6_r2_col2)*1000>=0&&MICROSECOND(RS_q6_r2_col2)*1000<=999999999&&RS_q31_r1_col1>0&&RS_q31_r1_col1>-9223372036854775808&&RS_q2_r1_col81=RS_q2_r1_col1&&MICROSECOND(RS_q2_r1_col72)*1000>=0&&MICROSECOND(RS_q2_r1_col72)*1000<=999999999&&MICROSECOND(RS_q2_r1_col71)*1000>=0&&MICROSECOND(RS_q2_r1_col71)*1000<=999999999&&RS_q2_r1_col68!=0&&RS_q2_r1_col32=0&&RS_q26_r1_col1>0&&RS_q26_r1_col1>-9223372036854775808&&RS_q18_r1_col87=RS_q18_r1_col3&&RS_q18_r1_col76=RS_q18_r1_col2&&RS_q18_r1_col66=RS_q18_r1_col1&&RS_q18_r1_col63!=0&&RS_q18_r1_col60!=0&&MICROSECOND(RS_q18_r1_col52)*1000>=0&&MICROSECOND(RS_q18_r1_col52)*1000<=999999999&&MICROSECOND(RS_q18_r1_col51)*1000>=0&&MICROSECOND(RS_q18_r1_col51)*1000<=999999999&&MICROSECOND(RS_q18_r1_col24)*1000>=0&&MICROSECOND(RS_q18_r1_col24)*1000<=999999999&&MICROSECOND(RS_q18_r1_col23)*1000>=0&&MICROSECOND(RS_q18_r1_col23)*1000<=999999999&&RS_q18_r1_col164=RS_q18_r1_col1&&RS_q18_r1_col163=0&&MICROSECOND(RS_q18_r1_col152)*1000>=0&&MICROSECOND(RS_q18_r1_col152)*1000<=999999999&&MICROSECOND(RS_q18_r1_col151)*1000>=0&&MICROSECOND(RS_q18_r1_col151)*1000<=999999999&&RS_q18_r1_col149=RS_q18_r1_col1&&MICROSECOND(RS_q18_r1_col136)*1000>=0&&MICROSECOND(RS_q18_r1_col136)*1000<=999999999&&MICROSECOND(RS_q18_r1_col135)*1000>=0&&MICROSECOND(RS_q18_r1_col135)*1000<=999999999&&RS_q10_r1_col10=0&&M_I_RS_6_size>=3&&M_I_RS_6_size>=2&&M_I_RS_6_size>=1&&M_I_RS_6_size<4&&M_I_RS_524_rowCount!=0&&M_I_RS_500_rowCount!=0&&M_I_RS_31_size>=1&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_26_size>=1&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size<1&&M_I_RS_10_size>=1&&M_I_RS_10_size<2&&LENGTH(RS_q2_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))<=90&&1>=M_I_RS_540_rowCount&&1<=M_I_RS_540_rowCount&&(RS_q31_r1_col1*50)>-9223372036854775808&&(RS_q26_r1_col1*50)>-9223372036854775808&&(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,2+1,1),CHAR))-65)=3&&((__nd__func__currentTimeMs__42__67%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q2_r1_col66,1+1,1),CHAR))-65))=52&&((((UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col3)*1000+(MICROSECOND(RS_q6_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r3_col2)*1000+(MICROSECOND(RS_q6_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col3)*1000+(MICROSECOND(RS_q6_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q6_r2_col2)*1000+(MICROSECOND(RS_q6_r2_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col72)*1000+(MICROSECOND(RS_q2_r1_col72)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col71)*1000+(MICROSECOND(RS_q2_r1_col71)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col52)*1000+(MICROSECOND(RS_q18_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col51)*1000+(MICROSECOND(RS_q18_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col24)*1000+(MICROSECOND(RS_q18_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col23)*1000+(MICROSECOND(RS_q18_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col152)*1000+(MICROSECOND(RS_q18_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col151)*1000+(MICROSECOND(RS_q18_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col136)*1000+(MICROSECOND(RS_q18_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col135)*1000+(MICROSECOND(RS_q18_r1_col135)*1000/1000000))&&RS_q18_r1_col64='*' THEN
SET q2_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__76/1000)*1000)/1000));
SET q2_i2 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__75/1000)*1000)/1000));
SET q2_i3 = NULL;
SET q2_i4 = RS_q18_r1_col1;
SET q2_i5 = M_I_field_item_com_salesmanager_shop_model_shoppingcart_PersistableShoppingCartItem_quantity;
SET q2_i6 = (RS_q26_r1_col1*50);
SET q2_i7 = (RS_q31_r1_col1*50);
SET QUERY_ID_1 = 1;
SAVEPOINT trace0_p3;
INSERT INTO SHOPPING_CART_ITEM (DATE_CREATED, DATE_MODIFIED, UPDT_ID, PRODUCT_ID, QUANTITY , SHP_CART_ID, SHP_CART_ITEM_ID) VALUES (q2_i1, q2_i2, q2_i3, q2_i4, q2_i5 , q2_i6, q2_i7);
SET M_I_RS_545_rowCount = ROW_COUNT();
SELECT M_I_RS_545_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,q1_i5,q1_i6,q1_i7,q1_i8,q1_i9,q1_i10,q1_i11,QUERY_ID_1,q2_i1,q2_i2,q2_i3,q2_i4,q2_i5,q2_i6,q2_i7;

END $$
DELIMITER ;