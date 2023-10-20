#!/bin/bash

set -x
trap 'pkill -P $$' SIGINT SIGTERM
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
JPF_ROOT=/root/jpf-web
BROADLEAF_ROOT=/root/jpf-web/broadleaf-react-benchmark
SQL_DIR=/root/sql
LOG_DIR=/root/log
DB_HOST=172.20.209.143
DB_USER="root"
DB_PASSWORD="admin"
export JAVA_HOME=/root/jdk-concolic/j2sdk-image
export PATH=$JAVA_HOME/bin:$PATH
cd ${JPF_ROOT} || exit
#./scripts/add_sp_to_db.sh ${DB_HOST} ${DB_USER} ${DB_PASSWORD} "${SQL_DIR}/*"

cd ${BROADLEAF_ROOT}/api || exit
mvn package spring-boot:repackage -Dmaven.test.skip=true
cd ${BROADLEAF_ROOT}/api/target || exit
java -Xmx16g -jar api.jar > $LOG_DIR/broadleaf-"${TIMESTAMP}".log 2>&1 &
P1=$!

cd ${BROADLEAF_ROOT}/site || exit
yarn develop > /dev/null 2>&1 &
P2=$!

cd "${PWD}" || exit
wait $P1 $P2
