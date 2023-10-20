#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
SAGAN_ROOT=/root/sagan
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${SAGAN_ROOT} || exit
sed -i 's/webridge.use.sp: true/webridge.use.sp: false/g' sagan-site/src/main/resources/application.yml
sed -i 's/webridge.use.sp: false/webridge.use.sp: false/g' sagan-site/src/main/resources/application.yml

cd ${SAGAN_ROOT} || exit
echo 'Started Sagan backgroud services'
./gradlew :sagan-renderer:bootRun &
echo 'wait 20s for Sagan backgroud services to start'
sleep 20

cd ${SAGAN_ROOT} || exit
echo 'Started Sagan Site'
SPRING_PROFILES_ACTIVE=standalone ./gradlew :sagan-site:bootRun > $LOG_DIR/sagan-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1 $P2