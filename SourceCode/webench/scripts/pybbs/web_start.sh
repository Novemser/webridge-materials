#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
PYBBS_ROOT=/root/pybbs
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-webridge-server-release/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${PYBBS_ROOT} || exit
java -Xmx16g -Djava.security.policy=webridge.policy -jar target/pybbs.jar --spring.profiles.active=dev > $LOG_DIR/pybbs-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1
