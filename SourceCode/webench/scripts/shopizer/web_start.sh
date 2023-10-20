#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
JPF_ROOT=/root/jpf-web
SHOPIZER_ROOT=/root/shopizer
SQL_DIR=/root/sql
LOG_DIR=/root/log
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH

cd ${SHOPIZER_ROOT}/sm-shop || exit
mvn package spring-boot:repackage -Dmaven.test.skip=true
cd ${SHOPIZER_ROOT}/sm-shop/target || exit
java -Xmx16g -jar ROOT.war > $LOG_DIR/shopizer-"${TIMESTAMP}".log 2>&1 &
P1=$!

cd "${PWD}" || exit
wait $P1
