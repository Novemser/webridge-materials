DROP PROCEDURE IF EXISTS `CodPayment_sp_21_ver0`;
DELIMITER $$
CREATE PROCEDURE CodPayment_sp_21_ver0 (IN RS_q114_r1_col1 INT, IN RS_q96_r1_col8 VARCHAR(512), IN __nd__func__currentTimeMs__42__310 BIGINT, IN M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_currency_domain_BroadleafCurrencyImpl_currencyCode VARCHAR(512), IN RS_q20_r1_col1 INT, IN RS_q96_r1_col14 VARCHAR(512), IN RS_q96_r1_col19 VARCHAR(512), IN RS_q96_r1_col18 VARCHAR(512), IN RS_q96_r1_col17 VARCHAR(512), IN RS_q8_r1_col1 INT, IN M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_locale_domain_LocaleImpl_localeCode VARCHAR(512), IN __nd__func__currentTimeMs__42__292 BIGINT, IN __nd__func__currentTimeMs__42__296 BIGINT)
BEGIN

DECLARE RS_q96_r1_col18_intCompact BIGINT DEFAULT NULL;
DECLARE RS_q96_r1_col18_scale INT DEFAULT NULL;
DECLARE RS_q96_r1_col19_intCompact BIGINT DEFAULT NULL;
DECLARE RS_q96_r1_col19_scale INT DEFAULT NULL;
DECLARE RS_q96_r1_col17_intCompact BIGINT DEFAULT NULL;
DECLARE RS_q96_r1_col17_scale INT DEFAULT NULL;
DECLARE RS_q96_r1_col14_intCompact BIGINT DEFAULT NULL;
DECLARE RS_q96_r1_col14_scale INT DEFAULT NULL;
DECLARE q1_i1 DATETIME DEFAULT NULL;
DECLARE q1_i2 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q1_i4 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_0 INT DEFAULT NULL;
DECLARE M_I_RS_2083_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_0 INT DEFAULT NULL;
DECLARE q2_i1 DATETIME DEFAULT NULL;
DECLARE q2_i2 BIGINT DEFAULT NULL;
DECLARE q2_i3 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i4 BIGINT DEFAULT NULL;
DECLARE q2_i5 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i6 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i7 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i8 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i9 BIT(1) DEFAULT NULL;
DECLARE q2_i10 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i11 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i12 DATETIME DEFAULT NULL;
DECLARE q2_i13 BIT(1) DEFAULT NULL;
DECLARE q2_i14 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i15 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i16 VARCHAR(512) DEFAULT NULL;
DECLARE q2_i17 BIGINT DEFAULT NULL;
DECLARE QUERY_ID_1 INT DEFAULT NULL;
DECLARE M_I_RS_2088_rowCount INT DEFAULT NULL;
DECLARE cursor_cnt_1 INT DEFAULT NULL;

SET RS_q96_r1_col18_intCompact = get_int_compact(RS_q96_r1_col18);
SET RS_q96_r1_col18_scale = get_scale(RS_q96_r1_col18);
SET RS_q96_r1_col19_intCompact = get_int_compact(RS_q96_r1_col19);
SET RS_q96_r1_col19_scale = get_scale(RS_q96_r1_col19);
SET RS_q96_r1_col17_intCompact = get_int_compact(RS_q96_r1_col17);
SET RS_q96_r1_col17_scale = get_scale(RS_q96_r1_col17);
SET RS_q96_r1_col14_intCompact = get_int_compact(RS_q96_r1_col14);
SET RS_q96_r1_col14_scale = get_scale(RS_q96_r1_col14);
IF TRUE THEN
SET q1_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__296/1000)*1000)/1000));
SET q1_i2 = RS_q96_r1_col8;
SET q1_i3 = NULL;
SET q1_i4 = RS_q114_r1_col1;
SET QUERY_ID_0 = 0;
SAVEPOINT trace0_p10;
INSERT INTO BLC_EMAIL_TRACKING (DATE_SENT, EMAIL_ADDRESS, TYPE, EMAIL_TRACKING_ID) VALUES (q1_i1, q1_i2, q1_i3, q1_i4);
SET M_I_RS_2083_rowCount = ROW_COUNT();
SELECT M_I_RS_2083_rowCount;
END IF;
IF TRUE THEN
SET q2_i1 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__310/1000)*1000)/1000));
SET q2_i2 = RS_q8_r1_col1;
SET q2_i3 = M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_currency_domain_BroadleafCurrencyImpl_currencyCode;
SET q2_i4 = RS_q8_r1_col1;
SET q2_i5 = RS_q96_r1_col8;
SET q2_i6 = M_L_String__cart_org_broadleafcommerce_core_order_domain_OrderImpl_org_broadleafcommerce_common_locale_domain_LocaleImpl_localeCode;
SET q2_i7 = NULL;
SET q2_i8 = CONCAT('2021010100000',CONVERT(RS_q20_r1_col1,CHAR));
SET q2_i9 = NULL;
SET q2_i10 = 'SUBMITTED';
SET q2_i11 = c_decimal(RS_q96_r1_col14_intCompact,RS_q96_r1_col14_scale);
SET q2_i12 = FROM_UNIXTIME((((__nd__func__currentTimeMs__42__292/1000)*1000)/1000));
SET q2_i13 = NULL;
SET q2_i14 = c_decimal(RS_q96_r1_col17_intCompact,RS_q96_r1_col17_scale);
SET q2_i15 = c_decimal(RS_q96_r1_col18_intCompact,RS_q96_r1_col18_scale);
SET q2_i16 = c_decimal(RS_q96_r1_col19_intCompact,RS_q96_r1_col19_scale);
SET q2_i17 = RS_q20_r1_col1;
SET QUERY_ID_1 = 1;
SAVEPOINT trace0_p9;
UPDATE BLC_ORDER SET DATE_UPDATED = q2_i1, UPDATED_BY = q2_i2, CURRENCY_CODE = q2_i3, CUSTOMER_ID = q2_i4, EMAIL_ADDRESS = q2_i5, LOCALE_CODE = q2_i6, NAME = q2_i7, ORDER_NUMBER = q2_i8, IS_PREVIEW = q2_i9, ORDER_STATUS = q2_i10, ORDER_SUBTOTAL = q2_i11, SUBMIT_DATE = q2_i12, TAX_OVERRIDE = q2_i13, ORDER_TOTAL = q2_i14, TOTAL_SHIPPING = q2_i15, TOTAL_TAX = q2_i16 WHERE ORDER_ID = q2_i17;
SET M_I_RS_2088_rowCount = ROW_COUNT();
SELECT M_I_RS_2088_rowCount;
END IF;
SELECT QUERY_ID_0,q1_i1,q1_i2,q1_i3,q1_i4,QUERY_ID_1,q2_i1,q2_i2,q2_i3,q2_i4,q2_i5,q2_i6,q2_i7,q2_i8,q2_i9,q2_i10,q2_i11,q2_i12,q2_i13,q2_i14,q2_i15,q2_i16,q2_i17;

END $$
DELIMITER ;