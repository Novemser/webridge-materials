#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
SHOPIZER_ROOT=/root/shopizer
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${SHOPIZER_ROOT} || exit
sed -i 's/webridge.use.sp=false/webridge.use.sp=true/g' sm-shop/src/main/resources/webridge.properties
mvn install -DskipTests

cd ${SHOPIZER_ROOT}/sm-shop/target || exit
echo 'Started shopizer'
java -Xmx16g -jar ROOT.war > $LOG_DIR/shopizer-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1