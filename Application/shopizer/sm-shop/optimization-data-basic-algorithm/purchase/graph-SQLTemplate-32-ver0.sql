SqlNo=104
SQLNode {
    sqlTemplate='set autocommit=1',
    parameters={},
    retVals={}
}
SqlNo=105
SQLNode {
    sqlTemplate='set autocommit=0',
    parameters={},
    retVals={}
}
SqlNo=106
SQLNode {
    sqlTemplate='SELECT zone0_.ZONE_ID AS ZONE_ID1_82_0_, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_83_1_, zone0_.ZONE_CODE AS ZONE_COD2_82_0_, zone0_.COUNTRY_ID AS COUNTRY_3_82_0_, descriptio1_.DATE_CREATED AS DATE_CRE2_83_1_ , descriptio1_.DATE_MODIFIED AS DATE_MOD3_83_1_, descriptio1_.UPDT_ID AS UPDT_ID4_83_1_, descriptio1_.DESCRIPTION AS DESCRIPT5_83_1_, descriptio1_.LANGUAGE_ID AS LANGUAGE8_83_1_, descriptio1_.NAME AS NAME6_83_1_ , descriptio1_.TITLE AS TITLE7_83_1_, descriptio1_.ZONE_ID AS ZONE_ID9_83_1_, descriptio1_.ZONE_ID AS ZONE_ID9_83_0__, descriptio1_.DESCRIPTION_ID AS DESCRIPT1_83_0__ FROM ZONE zone0_ LEFT JOIN ZONE_DESCRIPTION descriptio1_ ON zone0_.ZONE_ID = descriptio1_.ZONE_ID WHERE descriptio1_.LANGUAGE_ID = ?',
    parameters={RS_q2_r1_col3:INT},
    retVals={zone0_.zone_id:BIGINT, descriptio1_.description_id:BIGINT, zone0_.zone_code:VARCHAR, zone0_.country_id:INT, descriptio1_.date_created:DATETIME, descriptio1_.date_modified:DATETIME, descriptio1_.updt_id:VARCHAR, descriptio1_.description:LONGTEXT, descriptio1_.language_id:INT, descriptio1_.name:VARCHAR, descriptio1_.title:VARCHAR, descriptio1_.zone_id:BIGINT, descriptio1_.zone_id:BIGINT, descriptio1_.description_id:BIGINT}
}
