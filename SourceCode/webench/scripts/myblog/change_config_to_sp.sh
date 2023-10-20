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
sed -i 's/webridge.use.sp=true/webridge.use.sp=true/g' src/main/resources/application.properties
sed -i 's/webridge.use.sp=false/webridge.use.sp=true/g' src/main/resources/application.properties

cd "${PWD}" || exit
