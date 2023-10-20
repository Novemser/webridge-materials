#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
MYBLOG_ROOT=/root/my-blog
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${MYBLOG_ROOT} || exit
sed -i 's/webridge.use.sp=true/webridge.use.sp=false/g' src/main/resources/application.properties
sed -i 's/webridge.use.sp=false/webridge.use.sp=false/g' src/main/resources/application.properties
mvn clean package -Dmaven.test.skip=true

cd ${MYBLOG_ROOT} || exit
java -Xmx16g -jar target/my-blog-4.0.0-SNAPSHOT.jar  > $LOG_DIR/my-blog-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1
