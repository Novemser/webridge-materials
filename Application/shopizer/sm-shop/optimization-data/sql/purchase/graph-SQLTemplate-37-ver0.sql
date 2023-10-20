SqlNo=123
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=124
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=125
SQLNode {
    sqlTemplate='SELECT country0_.COUNTRY_ID AS COUNTRY_1_6_0_, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_7_1_, country0_.GEOZONE_ID AS GEOZONE_4_6_0_, country0_.COUNTRY_ISOCODE AS COUNTRY_2_6_0_, country0_.COUNTRY_SUPPORTED AS COUNTRY_3_6_0_ , descriptio1_.DATE_CREATED AS DATE_CRE2_7_1_, descriptio1_.DATE_MODIFIED AS DATE_MOD3_7_1_, descriptio1_.UPDT_ID AS UPDT_ID4_7_1_, descriptio1_.DESCRIPTION AS DESCRIPT5_7_1_, descriptio1_.LANGUAGE_ID AS LANGUAGE8_7_1_ , descriptio1_.NAME AS NAME6_7_1_, descriptio1_.TITLE AS TITLE7_7_1_, descriptio1_.COUNTRY_ID AS COUNTRY_9_7_1_, descriptio1_.COUNTRY_ID AS COUNTRY_9_7_0__, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_7_0__ FROM COUNTRY country0_ LEFT JOIN COUNTRY_DESCRIPTION descriptio1_ ON country0_.COUNTRY_ID = descriptio1_.COUNTRY_ID WHERE descriptio1_.LANGUAGE_ID = ?',
    parameters={RS_q2_r1_col3:INT},
    retVals={country0_.country_id:INT, descriptio1_.description_id:BIGINT, country0_.geozone_id:BIGINT, country0_.country_isocode:VARCHAR, country0_.country_supported:BIT, descriptio1_.date_created:DATETIME, descriptio1_.date_modified:DATETIME, descriptio1_.updt_id:VARCHAR, descriptio1_.description:LONGTEXT, descriptio1_.language_id:INT, descriptio1_.name:VARCHAR, descriptio1_.title:VARCHAR, descriptio1_.country_id:INT, descriptio1_.country_id:INT, descriptio1_.description_id:BIGINT}
}
