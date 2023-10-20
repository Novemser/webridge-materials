SqlNo=104
SQLNode {
    sqlTemplate='SELECT systemprop0_.BLC_SYSTEM_PROPERTY_ID AS BLC_SYST1_174_, systemprop0_.FRIENDLY_GROUP AS FRIENDLY2_174_, systemprop0_.FRIENDLY_NAME AS FRIENDLY3_174_, systemprop0_.FRIENDLY_TAB AS FRIENDLY4_174_, systemprop0_.PROPERTY_NAME AS PROPERTY5_174_ , systemprop0_.OVERRIDE_GENERATED_PROP_NAME AS OVERRIDE6_174_, systemprop0_.PROPERTY_TYPE AS PROPERTY7_174_, systemprop0_.PROPERTY_VALUE AS PROPERTY8_174_ FROM BLC_SYSTEM_PROPERTY systemprop0_ WHERE systemprop0_.PROPERTY_NAME = ?',
    parameters={"order.lock.database.session.affinity":VARCHAR},
    retVals={systemprop0_.blc_system_property_id:BIGINT, systemprop0_.friendly_group:VARCHAR, systemprop0_.friendly_name:VARCHAR, systemprop0_.friendly_tab:VARCHAR, systemprop0_.property_name:VARCHAR, systemprop0_.override_generated_prop_name:BIT, systemprop0_.property_type:VARCHAR, systemprop0_.property_value:VARCHAR}
}
