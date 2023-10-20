SqlNo=93
SQLNode {
    sqlTemplate='SELECT fulfillmen0_.FULFILLMENT_GROUP_ID AS FULFILLM1_66_8_, fulfillmen0_.ADDRESS_ID AS ADDRESS21_66_8_, fulfillmen0_.DELIVERY_INSTRUCTION AS DELIVERY2_66_8_, fulfillmen0_.FULFILLMENT_OPTION_ID AS FULFILL22_66_8_, fulfillmen0_.PRICE AS PRICE3_66_8_ , fulfillmen0_.SHIPPING_PRICE_TAXABLE AS SHIPPING4_66_8_, fulfillmen0_.MERCHANDISE_TOTAL AS MERCHAND5_66_8_, fulfillmen0_.METHOD AS METHOD6_66_8_, fulfillmen0_.ORDER_ID AS ORDER_I23_66_8_, fulfillmen0_.PERSONAL_MESSAGE_ID AS PERSONA24_66_8_ , fulfillmen0_.PHONE_ID AS PHONE_I25_66_8_, fulfillmen0_.IS_PRIMARY AS IS_PRIMA7_66_8_, fulfillmen0_.REFERENCE_NUMBER AS REFERENC8_66_8_, fulfillmen0_.RETAIL_PRICE AS RETAIL_P9_66_8_, fulfillmen0_.SALE_PRICE AS SALE_PR10_66_8_ , fulfillmen0_.FULFILLMENT_GROUP_SEQUNCE AS FULFILL11_66_8_, fulfillmen0_.SERVICE AS SERVICE12_66_8_, fulfillmen0_.SHIPPING_OVERRIDE AS SHIPPIN13_66_8_, fulfillmen0_.STATUS AS STATUS14_66_8_, fulfillmen0_.TOTAL AS TOTAL15_66_8_ , fulfillmen0_.TOTAL_FEE_TAX AS TOTAL_F16_66_8_, fulfillmen0_.TOTAL_FG_TAX AS TOTAL_F17_66_8_, fulfillmen0_.TOTAL_ITEM_TAX AS TOTAL_I18_66_8_, fulfillmen0_.TOTAL_TAX AS TOTAL_T19_66_8_, fulfillmen0_.TYPE AS TYPE20_66_8_ , addressimp1_.ADDRESS_ID AS ADDRESS_1_1_0_, addressimp1_.ADDRESS_LINE1 AS ADDRESS_2_1_0_, addressimp1_.ADDRESS_LINE2 AS ADDRESS_3_1_0_, addressimp1_.ADDRESS_LINE3 AS ADDRESS_4_1_0_, addressimp1_.CITY AS CITY5_1_0_ , addressimp1_.COMPANY_NAME AS COMPANY_6_1_0_, addressimp1_.COUNTRY AS COUNTRY27_1_0_, addressimp1_.COUNTY AS COUNTY7_1_0_, addressimp1_.EMAIL_ADDRESS AS EMAIL_AD8_1_0_, addressimp1_.FAX AS FAX9_1_0_ , addressimp1_.FIRST_NAME AS FIRST_N10_1_0_, addressimp1_.FULL_NAME AS FULL_NA11_1_0_, addressimp1_.IS_ACTIVE AS IS_ACTI12_1_0_, addressimp1_.IS_BUSINESS AS IS_BUSI13_1_0_, addressimp1_.IS_DEFAULT AS IS_DEFA14_1_0_ , addressimp1_.IS_MAILING AS IS_MAIL15_1_0_, addressimp1_.IS_STREET AS IS_STRE16_1_0_, addressimp1_.ISO_COUNTRY_ALPHA2 AS ISO_COU28_1_0_, addressimp1_.ISO_COUNTRY_SUB AS ISO_COU17_1_0_, addressimp1_.LAST_NAME AS LAST_NA18_1_0_ , addressimp1_.PHONE_FAX_ID AS PHONE_F29_1_0_, addressimp1_.PHONE_PRIMARY_ID AS PHONE_P30_1_0_, addressimp1_.PHONE_SECONDARY_ID AS PHONE_S31_1_0_, addressimp1_.POSTAL_CODE AS POSTAL_19_1_0_, addressimp1_.PRIMARY_PHONE AS PRIMARY20_1_0_ , addressimp1_.SECONDARY_PHONE AS SECONDA21_1_0_, addressimp1_.STANDARDIZED AS STANDAR22_1_0_, addressimp1_.STATE_PROV_REGION AS STATE_P32_1_0_, addressimp1_.SUB_STATE_PROV_REG AS SUB_STA23_1_0_, addressimp1_.TOKENIZED_ADDRESS AS TOKENIZ24_1_0_ , addressimp1_.VERIFICATION_LEVEL AS VERIFIC25_1_0_, addressimp1_.ZIP_FOUR AS ZIP_FOU26_1_0_, phoneimpl2_.PHONE_ID AS PHONE_ID1_118_1_, phoneimpl2_.COUNTRY_CODE AS COUNTRY_2_118_1_, phoneimpl2_.EXTENSION AS EXTENSIO3_118_1_ , phoneimpl2_.IS_ACTIVE AS IS_ACTIV4_118_1_, phoneimpl2_.IS_DEFAULT AS IS_DEFAU5_118_1_, phoneimpl2_.PHONE_NUMBER AS PHONE_NU6_118_1_, phoneimpl3_.PHONE_ID AS PHONE_ID1_118_2_, phoneimpl3_.COUNTRY_CODE AS COUNTRY_2_118_2_ , phoneimpl3_.EXTENSION AS EXTENSIO3_118_2_, phoneimpl3_.IS_ACTIVE AS IS_ACTIV4_118_2_, phoneimpl3_.IS_DEFAULT AS IS_DEFAU5_118_2_, phoneimpl3_.PHONE_NUMBER AS PHONE_NU6_118_2_, phoneimpl4_.PHONE_ID AS PHONE_ID1_118_3_ , phoneimpl4_.COUNTRY_CODE AS COUNTRY_2_118_3_, phoneimpl4_.EXTENSION AS EXTENSIO3_118_3_, phoneimpl4_.IS_ACTIVE AS IS_ACTIV4_118_3_, phoneimpl4_.IS_DEFAULT AS IS_DEFAU5_118_3_, phoneimpl4_.PHONE_NUMBER AS PHONE_NU6_118_3_ , candidateo5_.FULFILLMENT_GROUP_ID AS FULFILLM3_19_10_, candidateo5_.CANDIDATE_FG_OFFER_ID AS CANDIDAT1_19_10_, candidateo5_.CANDIDATE_FG_OFFER_ID AS CANDIDAT1_19_4_, candidateo5_.DISCOUNTED_PRICE AS DISCOUNT2_19_4_, candidateo5_.FULFILLMENT_GROUP_ID AS FULFILLM3_19_4_ , candidateo5_.OFFER_ID AS OFFER_ID4_19_4_, fulfillmen6_.FULFILLMENT_OPTION_ID AS FULFILLM1_71_5_, fulfillmen6_.FULFILLMENT_TYPE AS FULFILLM2_71_5_, fulfillmen6_.LONG_DESCRIPTION AS LONG_DES3_71_5_, fulfillmen6_.NAME AS NAME4_71_5_ , fulfillmen6_.TAX_CODE AS TAX_CODE5_71_5_, fulfillmen6_.TAXABLE AS TAXABLE6_71_5_, fulfillmen6_.USE_FLAT_RATES AS USE_FLAT7_71_5_, fulfillmen6_1_.CURRENCY_CODE AS CURRENCY3_72_5_, fulfillmen6_1_.PRICE AS PRICE1_72_5_ , CASE  WHEN fulfillmen6_1_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 1 WHEN fulfillmen6_2_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 2 WHEN fulfillmen6_3_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 3 WHEN fulfillmen6_.FULFILLMENT_OPTION_ID IS NOT NULL THEN 0 END AS clazz_5_, personalme7_.PERSONAL_MESSAGE_ID AS PERSONAL1_116_6_, personalme7_.MESSAGE AS MESSAGE2_116_6_, personalme7_.MESSAGE_FROM AS MESSAGE_3_116_6_, personalme7_.MESSAGE_TO AS MESSAGE_4_116_6_ , personalme7_.OCCASION AS OCCASION5_116_6_, phoneimpl8_.PHONE_ID AS PHONE_ID1_118_7_, phoneimpl8_.COUNTRY_CODE AS COUNTRY_2_118_7_, phoneimpl8_.EXTENSION AS EXTENSIO3_118_7_, phoneimpl8_.IS_ACTIVE AS IS_ACTIV4_118_7_ , phoneimpl8_.IS_DEFAULT AS IS_DEFAU5_118_7_, phoneimpl8_.PHONE_NUMBER AS PHONE_NU6_118_7_ FROM BLC_FULFILLMENT_GROUP fulfillmen0_ LEFT JOIN BLC_ADDRESS addressimp1_ ON fulfillmen0_.ADDRESS_ID = addressimp1_.ADDRESS_ID LEFT JOIN BLC_PHONE phoneimpl2_ ON addressimp1_.PHONE_FAX_ID = phoneimpl2_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl3_ ON addressimp1_.PHONE_PRIMARY_ID = phoneimpl3_.PHONE_ID LEFT JOIN BLC_PHONE phoneimpl4_ ON addressimp1_.PHONE_SECONDARY_ID = phoneimpl4_.PHONE_ID LEFT JOIN BLC_CANDIDATE_FG_OFFER candidateo5_ ON fulfillmen0_.FULFILLMENT_GROUP_ID = candidateo5_.FULFILLMENT_GROUP_ID LEFT JOIN BLC_FULFILLMENT_OPTION fulfillmen6_ ON fulfillmen0_.FULFILLMENT_OPTION_ID = fulfillmen6_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPTION_FIXED fulfillmen6_1_ ON fulfillmen6_.FULFILLMENT_OPTION_ID = fulfillmen6_1_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_PRC fulfillmen6_2_ ON fulfillmen6_.FULFILLMENT_OPTION_ID = fulfillmen6_2_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_FULFILLMENT_OPT_BANDED_WGT fulfillmen6_3_ ON fulfillmen6_.FULFILLMENT_OPTION_ID = fulfillmen6_3_.FULFILLMENT_OPTION_ID LEFT JOIN BLC_PERSONAL_MESSAGE personalme7_ ON fulfillmen0_.PERSONAL_MESSAGE_ID = personalme7_.PERSONAL_MESSAGE_ID LEFT JOIN BLC_PHONE phoneimpl8_ ON fulfillmen0_.PHONE_ID = phoneimpl8_.PHONE_ID WHERE fulfillmen0_.FULFILLMENT_GROUP_ID = ?',
    parameters={RS_q72_r1_col3:BIGINT},
    retVals={fulfillmen0_.fulfillment_group_id:BIGINT, fulfillmen0_.address_id:BIGINT, fulfillmen0_.delivery_instruction:VARCHAR, fulfillmen0_.fulfillment_option_id:BIGINT, fulfillmen0_.price:DECIMAL, fulfillmen0_.shipping_price_taxable:BIT, fulfillmen0_.merchandise_total:DECIMAL, fulfillmen0_.method:VARCHAR, fulfillmen0_.order_id:BIGINT, fulfillmen0_.personal_message_id:BIGINT, fulfillmen0_.phone_id:BIGINT, fulfillmen0_.is_primary:BIT, fulfillmen0_.reference_number:VARCHAR, fulfillmen0_.retail_price:DECIMAL, fulfillmen0_.sale_price:DECIMAL, fulfillmen0_.fulfillment_group_sequnce:INT, fulfillmen0_.service:VARCHAR, fulfillmen0_.shipping_override:BIT, fulfillmen0_.status:VARCHAR, fulfillmen0_.total:DECIMAL, fulfillmen0_.total_fee_tax:DECIMAL, fulfillmen0_.total_fg_tax:DECIMAL, fulfillmen0_.total_item_tax:DECIMAL, fulfillmen0_.total_tax:DECIMAL, fulfillmen0_.type:VARCHAR, addressimp1_.address_id:BIGINT, addressimp1_.address_line1:VARCHAR, addressimp1_.address_line2:VARCHAR, addressimp1_.address_line3:VARCHAR, addressimp1_.city:VARCHAR, addressimp1_.company_name:VARCHAR, addressimp1_.country:VARCHAR, addressimp1_.county:VARCHAR, addressimp1_.email_address:VARCHAR, addressimp1_.fax:VARCHAR, addressimp1_.first_name:VARCHAR, addressimp1_.full_name:VARCHAR, addressimp1_.is_active:BIT, addressimp1_.is_business:BIT, addressimp1_.is_default:BIT, addressimp1_.is_mailing:BIT, addressimp1_.is_street:BIT, addressimp1_.iso_country_alpha2:VARCHAR, addressimp1_.iso_country_sub:VARCHAR, addressimp1_.last_name:VARCHAR, addressimp1_.phone_fax_id:BIGINT, addressimp1_.phone_primary_id:BIGINT, addressimp1_.phone_secondary_id:BIGINT, addressimp1_.postal_code:VARCHAR, addressimp1_.primary_phone:VARCHAR, addressimp1_.secondary_phone:VARCHAR, addressimp1_.standardized:BIT, addressimp1_.state_prov_region:VARCHAR, addressimp1_.sub_state_prov_reg:VARCHAR, addressimp1_.tokenized_address:VARCHAR, addressimp1_.verification_level:VARCHAR, addressimp1_.zip_four:VARCHAR, phoneimpl2_.phone_id:BIGINT, phoneimpl2_.country_code:VARCHAR, phoneimpl2_.extension:VARCHAR, phoneimpl2_.is_active:BIT, phoneimpl2_.is_default:BIT, phoneimpl2_.phone_number:VARCHAR, phoneimpl3_.phone_id:BIGINT, phoneimpl3_.country_code:VARCHAR, phoneimpl3_.extension:VARCHAR, phoneimpl3_.is_active:BIT, phoneimpl3_.is_default:BIT, phoneimpl3_.phone_number:VARCHAR, phoneimpl4_.phone_id:BIGINT, phoneimpl4_.country_code:VARCHAR, phoneimpl4_.extension:VARCHAR, phoneimpl4_.is_active:BIT, phoneimpl4_.is_default:BIT, phoneimpl4_.phone_number:VARCHAR, candidateo5_.fulfillment_group_id:BIGINT, candidateo5_.candidate_fg_offer_id:BIGINT, candidateo5_.candidate_fg_offer_id:BIGINT, candidateo5_.discounted_price:DECIMAL, candidateo5_.fulfillment_group_id:BIGINT, candidateo5_.offer_id:BIGINT, fulfillmen6_.fulfillment_option_id:BIGINT, fulfillmen6_.fulfillment_type:VARCHAR, fulfillmen6_.long_description:LONGTEXT, fulfillmen6_.name:VARCHAR, fulfillmen6_.tax_code:VARCHAR, fulfillmen6_.taxable:BIT, fulfillmen6_.use_flat_rates:BIT, fulfillmen6_1_.currency_code:VARCHAR, fulfillmen6_1_.price:DECIMAL, clazz_5_:INT, personalme7_.personal_message_id:BIGINT, personalme7_.message:VARCHAR, personalme7_.message_from:VARCHAR, personalme7_.message_to:VARCHAR, personalme7_.occasion:VARCHAR, phoneimpl8_.phone_id:BIGINT, phoneimpl8_.country_code:VARCHAR, phoneimpl8_.extension:VARCHAR, phoneimpl8_.is_active:BIT, phoneimpl8_.is_default:BIT, phoneimpl8_.phone_number:VARCHAR}
}