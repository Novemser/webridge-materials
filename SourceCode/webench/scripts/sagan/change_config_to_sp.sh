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
sed -i 's/webridge.use.sp: true/webridge.use.sp: true/g' sagan-site/src/main/resources/application.yml
sed -i 's/webridge.use.sp: false/webridge.use.sp: true/g' sagan-site/src/main/resources/application.yml

cd "${PWD}" || exit
