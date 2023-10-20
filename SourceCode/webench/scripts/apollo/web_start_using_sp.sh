#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
APOLLO_ROOT=/root/apollo
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${APOLLO_ROOT} || exit
sed -i 's/webridge.use.sp: true/webridge.use.sp: true/g' apollo-portal/src/main/resources/application.yml
sed -i 's/webridge.use.sp: false/webridge.use.sp: true/g' apollo-portal/src/main/resources/application.yml
mvn clean package -Dmaven.test.skip=true

cd ${APOLLO_ROOT} || exit
echo 'Started Apollo backgroud services'
java -Dapollo_profile=github -jar ${APOLLO_ROOT}/apollo-assembly/target/apollo-assembly-2.1.0.jar --configservice --adminservice &
echo 'wait 60s for Apollo backgroud services to start'
sleep 60

cd ${APOLLO_ROOT} || exit
echo 'Started Apollo Portal'
java -Xmx16g -cp /home/root/.m2/repository/webridge/webridge-common/0.1/webridge-common-0.1.jar -Dapollo_profile=github,auth -Ddev_meta=http://localhost:8080/ -Dserver.port=8070 -Djava.security.policy=webridge.policy -jar apollo-portal/target/apollo-portal-2.1.0.jar > $LOG_DIR/apollo-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1 $P2