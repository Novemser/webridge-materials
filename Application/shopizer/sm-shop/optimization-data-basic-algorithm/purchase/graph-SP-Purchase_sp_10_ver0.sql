DROP PROCEDURE IF EXISTS `Purchase_sp_10_ver0`;
DELIMITER $$
CREATE PROCEDURE Purchase_sp_10_ver0 (IN RS_q2_r1_col74 DATETIME, IN M_I_RS_10_size INT, IN M_I_RS_6_size INT, IN RS_q2_r1_col75 DATETIME, IN RS_q19_r1_col152 DATETIME, IN RS_q18_r1_col1 INT, IN RS_q2_r1_col1 INT, IN RS_q2_r1_col2 INT, IN RS_q19_r1_col151 DATETIME, IN RS_q2_r1_col71 INT, IN M_I_RS_32_size INT, IN RS_q10_r3_col3 DATETIME, IN RS_q10_r3_col2 DATETIME, IN RS_q18_r1_col5 DATETIME, IN RS_q18_r1_col6 DATETIME, IN RS_q19_r1_col51 DATETIME, IN RS_q19_r1_col52 DATETIME, IN M_I_RS_31_size INT, IN RS_q19_r1_col71 VARCHAR(512), IN RS_q2_r1_col60 INT, IN M_I_RS_2_size INT, IN M_I_RS_18_size INT, IN RS_q19_r1_col64 VARCHAR(512), IN RS_q18_r1_col15 DATETIME, IN M_I_RS_23_size INT, IN RS_q18_r1_col16 DATETIME, IN RS_q19_r1_col63 INT, IN RS_q19_r1_col24 DATETIME, IN RS_q19_r1_col149 INT, IN RS_q18_r1_col19 INT, IN RS_q10_r2_col2 DATETIME, IN RS_q19_r1_col66 INT, IN RS_q10_r2_col3 DATETIME, IN RS_q19_r1_col23 DATETIME, IN M_I_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_java_util_ArrayList_size INT, IN RS_q19_r1_col1 INT, IN RS_q19_r1_col135 DATETIME, IN M_I_RS_27_size INT, IN RS_q19_r1_col3 INT, IN RS_q19_r1_col2 INT, IN M_I_RS_19_size INT, IN M_I_RS_36_size INT, IN RS_q18_r1_col21 INT, IN M_I_RS_14_size INT, IN RS_q19_r1_col76 INT, IN RS_q19_r1_col136 DATETIME, IN RS_q19_r1_col163 INT, IN RS_q19_r1_col164 INT, IN M_Z_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_customerAgreement INT, IN RS_q19_r1_col87 INT, IN RS_q6_r1_col68 INT, IN RS_q6_r1_col66 VARCHAR(512))
BEGIN

DECLARE RS_q19_r1_col71_scale INT DEFAULT NULL;
DECLARE RS_q19_r1_col71_intCompact BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0_TXN INT DEFAULT NULL;
DECLARE QUERY_ID_1_TXN INT DEFAULT NULL;
DECLARE q3_i1 INT DEFAULT NULL;
DECLARE q3_i2 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_2 INT DEFAULT NULL;
DECLARE M_I_RS_40_size INT DEFAULT NULL;
DECLARE cursor_cnt_2 INT DEFAULT NULL;

SET RS_q19_r1_col71_scale = get_scale(RS_q19_r1_col71);
SET RS_q19_r1_col71_intCompact = get_int_compact(RS_q19_r1_col71);
IF TRUE THEN
commit;
END IF;
IF RS_q6_r1_col68!=0&&MICROSECOND(RS_q2_r1_col75)*1000>=0&&MICROSECOND(RS_q2_r1_col75)*1000<=999999999&&MICROSECOND(RS_q2_r1_col74)*1000>=0&&MICROSECOND(RS_q2_r1_col74)*1000<=999999999&&RS_q2_r1_col71=0&&RS_q2_r1_col60!=0&&RS_q2_r1_col1>0&&RS_q19_r1_col87=RS_q19_r1_col3&&RS_q19_r1_col76=RS_q19_r1_col2&&RS_q19_r1_col66=RS_q19_r1_col1&&RS_q19_r1_col63!=0&&MICROSECOND(RS_q19_r1_col52)*1000>=0&&MICROSECOND(RS_q19_r1_col52)*1000<=999999999&&MICROSECOND(RS_q19_r1_col51)*1000>=0&&MICROSECOND(RS_q19_r1_col51)*1000<=999999999&&MICROSECOND(RS_q19_r1_col24)*1000>=0&&MICROSECOND(RS_q19_r1_col24)*1000<=999999999&&MICROSECOND(RS_q19_r1_col23)*1000>=0&&MICROSECOND(RS_q19_r1_col23)*1000<=999999999&&RS_q19_r1_col164=RS_q19_r1_col1&&RS_q19_r1_col163=0&&MICROSECOND(RS_q19_r1_col152)*1000>=0&&MICROSECOND(RS_q19_r1_col152)*1000<=999999999&&MICROSECOND(RS_q19_r1_col151)*1000>=0&&MICROSECOND(RS_q19_r1_col151)*1000<=999999999&&RS_q19_r1_col149=RS_q19_r1_col1&&MICROSECOND(RS_q19_r1_col136)*1000>=0&&MICROSECOND(RS_q19_r1_col136)*1000<=999999999&&MICROSECOND(RS_q19_r1_col135)*1000>=0&&MICROSECOND(RS_q19_r1_col135)*1000<=999999999&&MICROSECOND(RS_q18_r1_col6)*1000>=0&&MICROSECOND(RS_q18_r1_col6)*1000<=999999999&&MICROSECOND(RS_q18_r1_col5)*1000>=0&&MICROSECOND(RS_q18_r1_col5)*1000<=999999999&&RS_q18_r1_col21=RS_q18_r1_col1&&RS_q18_r1_col19>0&&RS_q18_r1_col19>-9223372036854775808&&MICROSECOND(RS_q18_r1_col16)*1000>=0&&MICROSECOND(RS_q18_r1_col16)*1000<=999999999&&MICROSECOND(RS_q18_r1_col15)*1000>=0&&MICROSECOND(RS_q18_r1_col15)*1000<=999999999&&MICROSECOND(RS_q10_r3_col3)*1000>=0&&MICROSECOND(RS_q10_r3_col3)*1000<=999999999&&MICROSECOND(RS_q10_r3_col2)*1000>=0&&MICROSECOND(RS_q10_r3_col2)*1000<=999999999&&MICROSECOND(RS_q10_r2_col3)*1000>=0&&MICROSECOND(RS_q10_r2_col3)*1000<=999999999&&MICROSECOND(RS_q10_r2_col2)*1000>=0&&MICROSECOND(RS_q10_r2_col2)*1000<=999999999&&M_Z_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_customerAgreement=0&&M_I_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_java_util_ArrayList_size<=0&&M_I_RS_6_size>=1&&M_I_RS_6_size<2&&M_I_RS_36_size>=1&&M_I_RS_36_size<2&&M_I_RS_32_size>=1&&M_I_RS_32_size<2&&M_I_RS_31_size>=1&&M_I_RS_31_size<2&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_27_size>=1&&M_I_RS_27_size<2&&M_I_RS_23_size>=1&&M_I_RS_23_size<2&&M_I_RS_19_size>=1&&M_I_RS_19_size<2&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size>=1&&M_I_RS_14_size<2&&M_I_RS_10_size>=3&&M_I_RS_10_size>=2&&M_I_RS_10_size>=1&&M_I_RS_10_size<4&&LENGTH(RS_q6_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))<=90&&(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,2+1,1),CHAR))-65)=3&&(((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))-65))=52&&((((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))&&(u_rshift((RS_q19_r1_col71_intCompact|RS_q18_r1_col19),31))=0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>-9223372036854775808&&RS_q19_r1_col71_scale!=0&&RS_q19_r1_col71_intCompact>0&&RS_q19_r1_col71_intCompact>-9223372036854775808&&RS_q19_r1_col64='*'&&'ZAF'!=RS_q6_r1_col66&&'YEM'!=RS_q6_r1_col66&&'VNM'!=RS_q6_r1_col66&&'VEN'!=RS_q6_r1_col66&&'USA'!=RS_q6_r1_col66&&'URY'!=RS_q6_r1_col66&&'UKR'!=RS_q6_r1_col66&&'TWN'!=RS_q6_r1_col66&&'TUR'!=RS_q6_r1_col66&&'TUN'!=RS_q6_r1_col66&&'THA'!=RS_q6_r1_col66&&'SYR'!=RS_q6_r1_col66&&'SWE'!=RS_q6_r1_col66&&'SVN'!=RS_q6_r1_col66&&'SVK'!=RS_q6_r1_col66&&'SRB'!=RS_q6_r1_col66&&'SLV'!=RS_q6_r1_col66&&'SGP'!=RS_q6_r1_col66&&'SDN'!=RS_q6_r1_col66&&'SAU'!=RS_q6_r1_col66&&'RUS'!=RS_q6_r1_col66&&'ROU'!=RS_q6_r1_col66&&'QAT'!=RS_q6_r1_col66&&'PRY'!=RS_q6_r1_col66&&'PRT'!=RS_q6_r1_col66&&'PRI'!=RS_q6_r1_col66&&'POL'!=RS_q6_r1_col66&&'PHL'!=RS_q6_r1_col66&&'PER'!=RS_q6_r1_col66&&'PAN'!=RS_q6_r1_col66&&'OMN'!=RS_q6_r1_col66&&'NZL'!=RS_q6_r1_col66&&'NOR'!=RS_q6_r1_col66&&'NLD'!=RS_q6_r1_col66&&'NIC'!=RS_q6_r1_col66&&'MYS'!=RS_q6_r1_col66&&'MNE'!=RS_q6_r1_col66&&'MLT'!=RS_q6_r1_col66&&'MKD'!=RS_q6_r1_col66&&'MEX'!=RS_q6_r1_col66&&'MAR'!=RS_q6_r1_col66&&'LVA'!=RS_q6_r1_col66&&'LUX'!=RS_q6_r1_col66&&'LTU'!=RS_q6_r1_col66&&'LBY'!=RS_q6_r1_col66&&'LBN'!=RS_q6_r1_col66&&'KWT'!=RS_q6_r1_col66&&'KOR'!=RS_q6_r1_col66&&'JPN'!=RS_q6_r1_col66&&'JOR'!=RS_q6_r1_col66&&'ITA'!=RS_q6_r1_col66&&'ISR'!=RS_q6_r1_col66&&'ISL'!=RS_q6_r1_col66&&'IRQ'!=RS_q6_r1_col66&&'IRL'!=RS_q6_r1_col66&&'IND'!=RS_q6_r1_col66&&'IDN'!=RS_q6_r1_col66&&'HUN'!=RS_q6_r1_col66&&'HRV'!=RS_q6_r1_col66&&'HND'!=RS_q6_r1_col66&&'HKG'!=RS_q6_r1_col66&&'GTM'!=RS_q6_r1_col66&&'GRC'!=RS_q6_r1_col66&&'GBR'!=RS_q6_r1_col66&&'FRA'!=RS_q6_r1_col66&&'FIN'!=RS_q6_r1_col66&&'EST'!=RS_q6_r1_col66&&'ESP'!=RS_q6_r1_col66&&'EGY'!=RS_q6_r1_col66&&'ECU'!=RS_q6_r1_col66&&'DZA'!=RS_q6_r1_col66&&'DOM'!=RS_q6_r1_col66&&'DNK'!=RS_q6_r1_col66&&'DEU'!=RS_q6_r1_col66&&'CZE'!=RS_q6_r1_col66&&'CYP'!=RS_q6_r1_col66&&'CUB'!=RS_q6_r1_col66&&'CRI'!=RS_q6_r1_col66&&'COL'!=RS_q6_r1_col66&&'CHN'!=RS_q6_r1_col66&&'CHL'!=RS_q6_r1_col66&&'CHE'!=RS_q6_r1_col66&&'CAN'!=RS_q6_r1_col66&&'BRA'!=RS_q6_r1_col66&&'BOL'!=RS_q6_r1_col66&&'BLR'!=RS_q6_r1_col66&&'BIH'!=RS_q6_r1_col66&&'BHR'!=RS_q6_r1_col66&&'BGR'!=RS_q6_r1_col66&&'BEL'!=RS_q6_r1_col66&&'AUT'!=RS_q6_r1_col66&&'AUS'!=RS_q6_r1_col66&&'ARG'!=RS_q6_r1_col66&&'ARE'!=RS_q6_r1_col66&&'ALB'!=RS_q6_r1_col66&&''!=RS_q6_r1_col66 THEN
SET QUERY_ID_0_TXN = 0;
set autocommit=1;
END IF;
IF RS_q6_r1_col68!=0&&MICROSECOND(RS_q2_r1_col75)*1000>=0&&MICROSECOND(RS_q2_r1_col75)*1000<=999999999&&MICROSECOND(RS_q2_r1_col74)*1000>=0&&MICROSECOND(RS_q2_r1_col74)*1000<=999999999&&RS_q2_r1_col71=0&&RS_q2_r1_col60!=0&&RS_q2_r1_col1>0&&RS_q19_r1_col87=RS_q19_r1_col3&&RS_q19_r1_col76=RS_q19_r1_col2&&RS_q19_r1_col66=RS_q19_r1_col1&&RS_q19_r1_col63!=0&&MICROSECOND(RS_q19_r1_col52)*1000>=0&&MICROSECOND(RS_q19_r1_col52)*1000<=999999999&&MICROSECOND(RS_q19_r1_col51)*1000>=0&&MICROSECOND(RS_q19_r1_col51)*1000<=999999999&&MICROSECOND(RS_q19_r1_col24)*1000>=0&&MICROSECOND(RS_q19_r1_col24)*1000<=999999999&&MICROSECOND(RS_q19_r1_col23)*1000>=0&&MICROSECOND(RS_q19_r1_col23)*1000<=999999999&&RS_q19_r1_col164=RS_q19_r1_col1&&RS_q19_r1_col163=0&&MICROSECOND(RS_q19_r1_col152)*1000>=0&&MICROSECOND(RS_q19_r1_col152)*1000<=999999999&&MICROSECOND(RS_q19_r1_col151)*1000>=0&&MICROSECOND(RS_q19_r1_col151)*1000<=999999999&&RS_q19_r1_col149=RS_q19_r1_col1&&MICROSECOND(RS_q19_r1_col136)*1000>=0&&MICROSECOND(RS_q19_r1_col136)*1000<=999999999&&MICROSECOND(RS_q19_r1_col135)*1000>=0&&MICROSECOND(RS_q19_r1_col135)*1000<=999999999&&MICROSECOND(RS_q18_r1_col6)*1000>=0&&MICROSECOND(RS_q18_r1_col6)*1000<=999999999&&MICROSECOND(RS_q18_r1_col5)*1000>=0&&MICROSECOND(RS_q18_r1_col5)*1000<=999999999&&RS_q18_r1_col21=RS_q18_r1_col1&&RS_q18_r1_col19>0&&RS_q18_r1_col19>-9223372036854775808&&MICROSECOND(RS_q18_r1_col16)*1000>=0&&MICROSECOND(RS_q18_r1_col16)*1000<=999999999&&MICROSECOND(RS_q18_r1_col15)*1000>=0&&MICROSECOND(RS_q18_r1_col15)*1000<=999999999&&MICROSECOND(RS_q10_r3_col3)*1000>=0&&MICROSECOND(RS_q10_r3_col3)*1000<=999999999&&MICROSECOND(RS_q10_r3_col2)*1000>=0&&MICROSECOND(RS_q10_r3_col2)*1000<=999999999&&MICROSECOND(RS_q10_r2_col3)*1000>=0&&MICROSECOND(RS_q10_r2_col3)*1000<=999999999&&MICROSECOND(RS_q10_r2_col2)*1000>=0&&MICROSECOND(RS_q10_r2_col2)*1000<=999999999&&M_Z_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_customerAgreement=0&&M_I_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_java_util_ArrayList_size<=0&&M_I_RS_6_size>=1&&M_I_RS_6_size<2&&M_I_RS_36_size>=1&&M_I_RS_36_size<2&&M_I_RS_32_size>=1&&M_I_RS_32_size<2&&M_I_RS_31_size>=1&&M_I_RS_31_size<2&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_27_size>=1&&M_I_RS_27_size<2&&M_I_RS_23_size>=1&&M_I_RS_23_size<2&&M_I_RS_19_size>=1&&M_I_RS_19_size<2&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size>=1&&M_I_RS_14_size<2&&M_I_RS_10_size>=3&&M_I_RS_10_size>=2&&M_I_RS_10_size>=1&&M_I_RS_10_size<4&&LENGTH(RS_q6_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))<=90&&(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,2+1,1),CHAR))-65)=3&&(((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))-65))=52&&((((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))&&(u_rshift((RS_q19_r1_col71_intCompact|RS_q18_r1_col19),31))=0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>-9223372036854775808&&RS_q19_r1_col71_scale!=0&&RS_q19_r1_col71_intCompact>0&&RS_q19_r1_col71_intCompact>-9223372036854775808&&RS_q19_r1_col64='*'&&'ZAF'!=RS_q6_r1_col66&&'YEM'!=RS_q6_r1_col66&&'VNM'!=RS_q6_r1_col66&&'VEN'!=RS_q6_r1_col66&&'USA'!=RS_q6_r1_col66&&'URY'!=RS_q6_r1_col66&&'UKR'!=RS_q6_r1_col66&&'TWN'!=RS_q6_r1_col66&&'TUR'!=RS_q6_r1_col66&&'TUN'!=RS_q6_r1_col66&&'THA'!=RS_q6_r1_col66&&'SYR'!=RS_q6_r1_col66&&'SWE'!=RS_q6_r1_col66&&'SVN'!=RS_q6_r1_col66&&'SVK'!=RS_q6_r1_col66&&'SRB'!=RS_q6_r1_col66&&'SLV'!=RS_q6_r1_col66&&'SGP'!=RS_q6_r1_col66&&'SDN'!=RS_q6_r1_col66&&'SAU'!=RS_q6_r1_col66&&'RUS'!=RS_q6_r1_col66&&'ROU'!=RS_q6_r1_col66&&'QAT'!=RS_q6_r1_col66&&'PRY'!=RS_q6_r1_col66&&'PRT'!=RS_q6_r1_col66&&'PRI'!=RS_q6_r1_col66&&'POL'!=RS_q6_r1_col66&&'PHL'!=RS_q6_r1_col66&&'PER'!=RS_q6_r1_col66&&'PAN'!=RS_q6_r1_col66&&'OMN'!=RS_q6_r1_col66&&'NZL'!=RS_q6_r1_col66&&'NOR'!=RS_q6_r1_col66&&'NLD'!=RS_q6_r1_col66&&'NIC'!=RS_q6_r1_col66&&'MYS'!=RS_q6_r1_col66&&'MNE'!=RS_q6_r1_col66&&'MLT'!=RS_q6_r1_col66&&'MKD'!=RS_q6_r1_col66&&'MEX'!=RS_q6_r1_col66&&'MAR'!=RS_q6_r1_col66&&'LVA'!=RS_q6_r1_col66&&'LUX'!=RS_q6_r1_col66&&'LTU'!=RS_q6_r1_col66&&'LBY'!=RS_q6_r1_col66&&'LBN'!=RS_q6_r1_col66&&'KWT'!=RS_q6_r1_col66&&'KOR'!=RS_q6_r1_col66&&'JPN'!=RS_q6_r1_col66&&'JOR'!=RS_q6_r1_col66&&'ITA'!=RS_q6_r1_col66&&'ISR'!=RS_q6_r1_col66&&'ISL'!=RS_q6_r1_col66&&'IRQ'!=RS_q6_r1_col66&&'IRL'!=RS_q6_r1_col66&&'IND'!=RS_q6_r1_col66&&'IDN'!=RS_q6_r1_col66&&'HUN'!=RS_q6_r1_col66&&'HRV'!=RS_q6_r1_col66&&'HND'!=RS_q6_r1_col66&&'HKG'!=RS_q6_r1_col66&&'GTM'!=RS_q6_r1_col66&&'GRC'!=RS_q6_r1_col66&&'GBR'!=RS_q6_r1_col66&&'FRA'!=RS_q6_r1_col66&&'FIN'!=RS_q6_r1_col66&&'EST'!=RS_q6_r1_col66&&'ESP'!=RS_q6_r1_col66&&'EGY'!=RS_q6_r1_col66&&'ECU'!=RS_q6_r1_col66&&'DZA'!=RS_q6_r1_col66&&'DOM'!=RS_q6_r1_col66&&'DNK'!=RS_q6_r1_col66&&'DEU'!=RS_q6_r1_col66&&'CZE'!=RS_q6_r1_col66&&'CYP'!=RS_q6_r1_col66&&'CUB'!=RS_q6_r1_col66&&'CRI'!=RS_q6_r1_col66&&'COL'!=RS_q6_r1_col66&&'CHN'!=RS_q6_r1_col66&&'CHL'!=RS_q6_r1_col66&&'CHE'!=RS_q6_r1_col66&&'CAN'!=RS_q6_r1_col66&&'BRA'!=RS_q6_r1_col66&&'BOL'!=RS_q6_r1_col66&&'BLR'!=RS_q6_r1_col66&&'BIH'!=RS_q6_r1_col66&&'BHR'!=RS_q6_r1_col66&&'BGR'!=RS_q6_r1_col66&&'BEL'!=RS_q6_r1_col66&&'AUT'!=RS_q6_r1_col66&&'AUS'!=RS_q6_r1_col66&&'ARG'!=RS_q6_r1_col66&&'ARE'!=RS_q6_r1_col66&&'ALB'!=RS_q6_r1_col66&&''!=RS_q6_r1_col66 THEN
SET QUERY_ID_1_TXN = 1;
set autocommit=0;
END IF;
IF RS_q6_r1_col68!=0&&MICROSECOND(RS_q2_r1_col75)*1000>=0&&MICROSECOND(RS_q2_r1_col75)*1000<=999999999&&MICROSECOND(RS_q2_r1_col74)*1000>=0&&MICROSECOND(RS_q2_r1_col74)*1000<=999999999&&RS_q2_r1_col71=0&&RS_q2_r1_col60!=0&&RS_q2_r1_col1>0&&RS_q19_r1_col87=RS_q19_r1_col3&&RS_q19_r1_col76=RS_q19_r1_col2&&RS_q19_r1_col66=RS_q19_r1_col1&&RS_q19_r1_col63!=0&&MICROSECOND(RS_q19_r1_col52)*1000>=0&&MICROSECOND(RS_q19_r1_col52)*1000<=999999999&&MICROSECOND(RS_q19_r1_col51)*1000>=0&&MICROSECOND(RS_q19_r1_col51)*1000<=999999999&&MICROSECOND(RS_q19_r1_col24)*1000>=0&&MICROSECOND(RS_q19_r1_col24)*1000<=999999999&&MICROSECOND(RS_q19_r1_col23)*1000>=0&&MICROSECOND(RS_q19_r1_col23)*1000<=999999999&&RS_q19_r1_col164=RS_q19_r1_col1&&RS_q19_r1_col163=0&&MICROSECOND(RS_q19_r1_col152)*1000>=0&&MICROSECOND(RS_q19_r1_col152)*1000<=999999999&&MICROSECOND(RS_q19_r1_col151)*1000>=0&&MICROSECOND(RS_q19_r1_col151)*1000<=999999999&&RS_q19_r1_col149=RS_q19_r1_col1&&MICROSECOND(RS_q19_r1_col136)*1000>=0&&MICROSECOND(RS_q19_r1_col136)*1000<=999999999&&MICROSECOND(RS_q19_r1_col135)*1000>=0&&MICROSECOND(RS_q19_r1_col135)*1000<=999999999&&MICROSECOND(RS_q18_r1_col6)*1000>=0&&MICROSECOND(RS_q18_r1_col6)*1000<=999999999&&MICROSECOND(RS_q18_r1_col5)*1000>=0&&MICROSECOND(RS_q18_r1_col5)*1000<=999999999&&RS_q18_r1_col21=RS_q18_r1_col1&&RS_q18_r1_col19>0&&RS_q18_r1_col19>-9223372036854775808&&MICROSECOND(RS_q18_r1_col16)*1000>=0&&MICROSECOND(RS_q18_r1_col16)*1000<=999999999&&MICROSECOND(RS_q18_r1_col15)*1000>=0&&MICROSECOND(RS_q18_r1_col15)*1000<=999999999&&MICROSECOND(RS_q10_r3_col3)*1000>=0&&MICROSECOND(RS_q10_r3_col3)*1000<=999999999&&MICROSECOND(RS_q10_r3_col2)*1000>=0&&MICROSECOND(RS_q10_r3_col2)*1000<=999999999&&MICROSECOND(RS_q10_r2_col3)*1000>=0&&MICROSECOND(RS_q10_r2_col3)*1000<=999999999&&MICROSECOND(RS_q10_r2_col2)*1000>=0&&MICROSECOND(RS_q10_r2_col2)*1000<=999999999&&M_Z_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_customerAgreement=0&&M_I_field_order_com_salesmanager_shop_model_order_v1_PersistableOrder_java_util_ArrayList_size<=0&&M_I_RS_6_size>=1&&M_I_RS_6_size<2&&M_I_RS_36_size>=1&&M_I_RS_36_size<2&&M_I_RS_32_size>=1&&M_I_RS_32_size<2&&M_I_RS_31_size>=1&&M_I_RS_31_size<2&&M_I_RS_2_size>=1&&M_I_RS_2_size<2&&M_I_RS_27_size>=1&&M_I_RS_27_size<2&&M_I_RS_23_size>=1&&M_I_RS_23_size<2&&M_I_RS_19_size>=1&&M_I_RS_19_size<2&&M_I_RS_18_size>=1&&M_I_RS_18_size<2&&M_I_RS_14_size>=1&&M_I_RS_14_size<2&&M_I_RS_10_size>=3&&M_I_RS_10_size>=2&&M_I_RS_10_size>=1&&M_I_RS_10_size<4&&LENGTH(RS_q6_r1_col66)=3&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))<=90&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))>=65&&ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))<=90&&(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,2+1,1),CHAR))-65)=3&&(((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))%1000)*1000000)>=0&&(((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))%1000)*1000000)>=0&&(((ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,0+1,1),CHAR))-65)*26)+(ASCII(CONVERT(SUBSTRING(RS_q6_r1_col66,1+1,1),CHAR))-65))=52&&((((UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col75)*1000+(MICROSECOND(RS_q2_r1_col75)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))=(UNIX_TIMESTAMP(RS_q2_r1_col74)*1000+(MICROSECOND(RS_q2_r1_col74)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col52)*1000+(MICROSECOND(RS_q19_r1_col52)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col51)*1000+(MICROSECOND(RS_q19_r1_col51)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col24)*1000+(MICROSECOND(RS_q19_r1_col24)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col23)*1000+(MICROSECOND(RS_q19_r1_col23)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col152)*1000+(MICROSECOND(RS_q19_r1_col152)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col151)*1000+(MICROSECOND(RS_q19_r1_col151)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col136)*1000+(MICROSECOND(RS_q19_r1_col136)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))=(UNIX_TIMESTAMP(RS_q19_r1_col135)*1000+(MICROSECOND(RS_q19_r1_col135)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col6)*1000+(MICROSECOND(RS_q18_r1_col6)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col5)*1000+(MICROSECOND(RS_q18_r1_col5)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col16)*1000+(MICROSECOND(RS_q18_r1_col16)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))=(UNIX_TIMESTAMP(RS_q18_r1_col15)*1000+(MICROSECOND(RS_q18_r1_col15)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col3)*1000+(MICROSECOND(RS_q10_r3_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r3_col2)*1000+(MICROSECOND(RS_q10_r3_col2)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col3)*1000+(MICROSECOND(RS_q10_r2_col3)*1000/1000000))&&((((UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))/1000)*1000)+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))=(UNIX_TIMESTAMP(RS_q10_r2_col2)*1000+(MICROSECOND(RS_q10_r2_col2)*1000/1000000))&&(u_rshift((RS_q19_r1_col71_intCompact|RS_q18_r1_col19),31))=0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>0&&(RS_q19_r1_col71_intCompact*RS_q18_r1_col19)>-9223372036854775808&&RS_q19_r1_col71_scale!=0&&RS_q19_r1_col71_intCompact>0&&RS_q19_r1_col71_intCompact>-9223372036854775808&&RS_q19_r1_col64='*'&&'ZAF'!=RS_q6_r1_col66&&'YEM'!=RS_q6_r1_col66&&'VNM'!=RS_q6_r1_col66&&'VEN'!=RS_q6_r1_col66&&'USA'!=RS_q6_r1_col66&&'URY'!=RS_q6_r1_col66&&'UKR'!=RS_q6_r1_col66&&'TWN'!=RS_q6_r1_col66&&'TUR'!=RS_q6_r1_col66&&'TUN'!=RS_q6_r1_col66&&'THA'!=RS_q6_r1_col66&&'SYR'!=RS_q6_r1_col66&&'SWE'!=RS_q6_r1_col66&&'SVN'!=RS_q6_r1_col66&&'SVK'!=RS_q6_r1_col66&&'SRB'!=RS_q6_r1_col66&&'SLV'!=RS_q6_r1_col66&&'SGP'!=RS_q6_r1_col66&&'SDN'!=RS_q6_r1_col66&&'SAU'!=RS_q6_r1_col66&&'RUS'!=RS_q6_r1_col66&&'ROU'!=RS_q6_r1_col66&&'QAT'!=RS_q6_r1_col66&&'PRY'!=RS_q6_r1_col66&&'PRT'!=RS_q6_r1_col66&&'PRI'!=RS_q6_r1_col66&&'POL'!=RS_q6_r1_col66&&'PHL'!=RS_q6_r1_col66&&'PER'!=RS_q6_r1_col66&&'PAN'!=RS_q6_r1_col66&&'OMN'!=RS_q6_r1_col66&&'NZL'!=RS_q6_r1_col66&&'NOR'!=RS_q6_r1_col66&&'NLD'!=RS_q6_r1_col66&&'NIC'!=RS_q6_r1_col66&&'MYS'!=RS_q6_r1_col66&&'MNE'!=RS_q6_r1_col66&&'MLT'!=RS_q6_r1_col66&&'MKD'!=RS_q6_r1_col66&&'MEX'!=RS_q6_r1_col66&&'MAR'!=RS_q6_r1_col66&&'LVA'!=RS_q6_r1_col66&&'LUX'!=RS_q6_r1_col66&&'LTU'!=RS_q6_r1_col66&&'LBY'!=RS_q6_r1_col66&&'LBN'!=RS_q6_r1_col66&&'KWT'!=RS_q6_r1_col66&&'KOR'!=RS_q6_r1_col66&&'JPN'!=RS_q6_r1_col66&&'JOR'!=RS_q6_r1_col66&&'ITA'!=RS_q6_r1_col66&&'ISR'!=RS_q6_r1_col66&&'ISL'!=RS_q6_r1_col66&&'IRQ'!=RS_q6_r1_col66&&'IRL'!=RS_q6_r1_col66&&'IND'!=RS_q6_r1_col66&&'IDN'!=RS_q6_r1_col66&&'HUN'!=RS_q6_r1_col66&&'HRV'!=RS_q6_r1_col66&&'HND'!=RS_q6_r1_col66&&'HKG'!=RS_q6_r1_col66&&'GTM'!=RS_q6_r1_col66&&'GRC'!=RS_q6_r1_col66&&'GBR'!=RS_q6_r1_col66&&'FRA'!=RS_q6_r1_col66&&'FIN'!=RS_q6_r1_col66&&'EST'!=RS_q6_r1_col66&&'ESP'!=RS_q6_r1_col66&&'EGY'!=RS_q6_r1_col66&&'ECU'!=RS_q6_r1_col66&&'DZA'!=RS_q6_r1_col66&&'DOM'!=RS_q6_r1_col66&&'DNK'!=RS_q6_r1_col66&&'DEU'!=RS_q6_r1_col66&&'CZE'!=RS_q6_r1_col66&&'CYP'!=RS_q6_r1_col66&&'CUB'!=RS_q6_r1_col66&&'CRI'!=RS_q6_r1_col66&&'COL'!=RS_q6_r1_col66&&'CHN'!=RS_q6_r1_col66&&'CHL'!=RS_q6_r1_col66&&'CHE'!=RS_q6_r1_col66&&'CAN'!=RS_q6_r1_col66&&'BRA'!=RS_q6_r1_col66&&'BOL'!=RS_q6_r1_col66&&'BLR'!=RS_q6_r1_col66&&'BIH'!=RS_q6_r1_col66&&'BHR'!=RS_q6_r1_col66&&'BGR'!=RS_q6_r1_col66&&'BEL'!=RS_q6_r1_col66&&'AUT'!=RS_q6_r1_col66&&'AUS'!=RS_q6_r1_col66&&'ARG'!=RS_q6_r1_col66&&'ARE'!=RS_q6_r1_col66&&'ALB'!=RS_q6_r1_col66&&''!=RS_q6_r1_col66 THEN
SET q3_i1 = RS_q2_r1_col2;
SET q3_i2 = RS_q19_r1_col1;
SET QUERY_ID_2 = 2;
SELECT digitalpro0_.PRODUCT_DIGITAL_ID AS PRODUCT_1_49_0_, product1_.PRODUCT_ID AS PRODUCT_1_44_1_, merchantst2_.MERCHANT_ID AS MERCHANT1_29_2_, digitalpro0_.PRODUCT_ID AS PRODUCT_3_49_0_, digitalpro0_.FILE_NAME AS FILE_NAM2_49_0_ , product1_.DATE_CREATED AS DATE_CRE2_44_1_, product1_.DATE_MODIFIED AS DATE_MOD3_44_1_, product1_.UPDT_ID AS UPDT_ID4_44_1_, product1_.AVAILABLE AS AVAILABL5_44_1_, product1_.COND AS COND6_44_1_ , product1_.DATE_AVAILABLE AS DATE_AVA7_44_1_, product1_.MANUFACTURER_ID AS MANUFAC25_44_1_, product1_.MERCHANT_ID AS MERCHAN26_44_1_, product1_.CUSTOMER_ID AS CUSTOME27_44_1_, product1_.PREORDER AS PREORDER8_44_1_ , product1_.PRODUCT_HEIGHT AS PRODUCT_9_44_1_, product1_.PRODUCT_FREE AS PRODUCT10_44_1_, product1_.PRODUCT_LENGTH AS PRODUCT11_44_1_, product1_.QUANTITY_ORDERED AS QUANTIT12_44_1_, product1_.REVIEW_AVG AS REVIEW_13_44_1_ , product1_.REVIEW_COUNT AS REVIEW_14_44_1_, product1_.PRODUCT_SHIP AS PRODUCT15_44_1_, product1_.PRODUCT_VIRTUAL AS PRODUCT16_44_1_, product1_.PRODUCT_WEIGHT AS PRODUCT17_44_1_, product1_.PRODUCT_WIDTH AS PRODUCT18_44_1_ , product1_.REF_SKU AS REF_SKU19_44_1_, product1_.RENTAL_DURATION AS RENTAL_20_44_1_, product1_.RENTAL_PERIOD AS RENTAL_21_44_1_, product1_.RENTAL_STATUS AS RENTAL_22_44_1_, product1_.SKU AS SKU23_44_1_ , product1_.SORT_ORDER AS SORT_OR24_44_1_, product1_.TAX_CLASS_ID AS TAX_CLA28_44_1_, product1_.PRODUCT_TYPE_ID AS PRODUCT29_44_1_, merchantst2_.DATE_CREATED AS DATE_CRE2_29_2_, merchantst2_.DATE_MODIFIED AS DATE_MOD3_29_2_ , merchantst2_.UPDT_ID AS UPDT_ID4_29_2_, merchantst2_.STORE_CODE AS STORE_CO5_29_2_, merchantst2_.CONTINUESHOPPINGURL AS CONTINUE6_29_2_, merchantst2_.COUNTRY_ID AS COUNTRY24_29_2_, merchantst2_.CURRENCY_ID AS CURRENC25_29_2_ , merchantst2_.CURRENCY_FORMAT_NATIONAL AS CURRENCY7_29_2_, merchantst2_.LANGUAGE_ID AS LANGUAG26_29_2_, merchantst2_.DOMAIN_NAME AS DOMAIN_N8_29_2_, merchantst2_.IN_BUSINESS_SINCE AS IN_BUSIN9_29_2_, merchantst2_.INVOICE_TEMPLATE AS INVOICE10_29_2_ , merchantst2_.PARENT_ID AS PARENT_27_29_2_, merchantst2_.IS_RETAILER AS IS_RETA11_29_2_, merchantst2_.SEIZEUNITCODE AS SEIZEUN12_29_2_, merchantst2_.STORE_EMAIL AS STORE_E13_29_2_, merchantst2_.STORE_LOGO AS STORE_L14_29_2_ , merchantst2_.STORE_TEMPLATE AS STORE_T15_29_2_, merchantst2_.STORE_ADDRESS AS STORE_A16_29_2_, merchantst2_.STORE_CITY AS STORE_C17_29_2_, merchantst2_.STORE_NAME AS STORE_N18_29_2_, merchantst2_.STORE_PHONE AS STORE_P19_29_2_ , merchantst2_.STORE_POSTAL_CODE AS STORE_P20_29_2_, merchantst2_.STORE_STATE_PROV AS STORE_S21_29_2_, merchantst2_.USE_CACHE AS USE_CAC22_29_2_, merchantst2_.WEIGHTUNITCODE AS WEIGHTU23_29_2_, merchantst2_.ZONE_ID AS ZONE_ID28_29_2_ FROM PRODUCT_DIGITAL digitalpro0_ INNER JOIN PRODUCT product1_ ON digitalpro0_.PRODUCT_ID = product1_.PRODUCT_ID INNER JOIN MERCHANT_STORE merchantst2_ ON product1_.MERCHANT_ID = merchantst2_.MERCHANT_ID WHERE merchantst2_.MERCHANT_ID = q3_i1 AND product1_.PRODUCT_ID = q3_i2;
SET M_I_RS_40_size = FOUND_ROWS();
END IF;
SELECT QUERY_ID_0_TXN,QUERY_ID_1_TXN,QUERY_ID_2,q3_i1,q3_i2;

END $$
DELIMITER ;