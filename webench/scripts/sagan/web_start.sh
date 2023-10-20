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
./gradlew :sagan-renderer:bootRun &

cd ${SAGAN_ROOT} || exit
SPRING_PROFILES_ACTIVE=standalone ./gradlew :sagan-site:bootRun -Dorg.gradle.jvmargs=-Xmx16g > $LOG_DIR/sagan-"${TIMESTAMP}".log 2>&1 &

cd "${PWD}" || exit
wait $P1
