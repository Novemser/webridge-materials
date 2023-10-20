#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
LOG_DIR=/tmp/log/apollo/latency
SCHEMA_FILE=/root/apollo/ApolloPortalSchemaAndData.sql
PERF_BASE_DIR=/root/perf/apollo/latency
DB_HOST=172.17.90.253
SERVER_HOST=172.20.209.139
DB_PORT=3306
DB_PASSWORD="admin"
DB_NAME=ApolloPortalDB
WEB_HOST="http://172.20.209.139:8070"
LOG_NAME_PREF="SP"

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

run () {
    java -jar webench-1.0-SNAPSHOT.jar \
      --app apollo \
      --workload config_manage \
      --schema ${SCHEMA_FILE} --threads 1 --warmup 300 --time 600 --period 60 \
      --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} --populateDb \
      --perf-base-dir ${PERF_BASE_DIR}/${LOG_NAME_PREF}/"${TIMESTAMP}" \
      --web-host ${WEB_HOST} \
      --distribution-base-dir data/config_manage \
      --database ${DB_NAME} > ${LOG_DIR}/webench-latency-${LOG_NAME_PREF}-"${TIMESTAMP}".log 2>&1
}

cd ${WEBENCH_ROOT} || exit
./gradlew jar
cd ${WEBENCH_ROOT}/build/libs || exit
sh ${WEBENCH_ROOT}/scripts/apollo/restart_web_using_normal.sh
LOG_NAME_PREF="NORMAL"
run
sh ${WEBENCH_ROOT}/scripts/apollo/restart_web_using_sp.sh
LOG_NAME_PREF="SP"
run

cd "${PWD}" || exit

ssh root@$SERVER_HOST "ps aux | grep 'apollo' | awk '{print \$2}' | xargs kill -9"