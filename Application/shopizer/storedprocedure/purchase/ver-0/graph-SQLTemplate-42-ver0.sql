SqlNo=53
SQLNode {
    sqlTemplate='SELECT integratio0_.MODULE_CONF_ID AS MODULE_C1_30_, integratio0_.DATE_CREATED AS DATE_CRE2_30_, integratio0_.DATE_MODIFIED AS DATE_MOD3_30_, integratio0_.UPDT_ID AS UPDT_ID4_30_, integratio0_.CODE AS CODE5_30_ , integratio0_.DETAILS AS DETAILS6_30_, integratio0_.CONFIGURATION AS CONFIGUR7_30_, integratio0_.CUSTOM_IND AS CUSTOM_I8_30_, integratio0_.IMAGE AS IMAGE9_30_, integratio0_.MODULE AS MODULE10_30_ , integratio0_.REGIONS AS REGIONS11_30_, integratio0_.TYPE AS TYPE12_30_ FROM MODULE_CONFIGURATION integratio0_ WHERE integratio0_.MODULE = ?',
    parameters={"PAYMENT":VARCHAR},
    retVals={integratio0_.module_conf_id:BIGINT, integratio0_.date_created:DATETIME, integratio0_.date_modified:DATETIME, integratio0_.updt_id:VARCHAR, integratio0_.code:VARCHAR, integratio0_.details:LONGTEXT, integratio0_.configuration:VARCHAR, integratio0_.custom_ind:BIT, integratio0_.image:VARCHAR, integratio0_.module:VARCHAR, integratio0_.regions:VARCHAR, integratio0_.type:VARCHAR}
}
