#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
LOG_DIR=/tmp/log/broadleaf/latency
SCHEMA_FILE=/root/jpf-web/broadleaf-react-benchmark/api-input/blf_with_user.sql
PERF_BASE_DIR=/root/perf/broadleaf/latency
DB_HOST=172.17.90.253
DB_PORT=3306
DB_PASSWORD="admin"
WEB_HOST="http://172.20.209.139:3000"
DB_NAME=broadleaf_react

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

cd ${WEBENCH_ROOT} || exit
./gradlew jar
cd ${WEBENCH_ROOT}/build/libs || exit
sh ${WEBENCH_ROOT}/scripts/broadleaf/restart_web.sh
java -jar webench-1.0-SNAPSHOT.jar \
  --schema ${SCHEMA_FILE} --threads 1 --warmup 300 --time 1800 --period 60 \
  --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} --populateDb \
  --perf-base-dir ${PERF_BASE_DIR}/"${TIMESTAMP}" \
  --web-host ${WEB_HOST} \
  --database ${DB_NAME} > ${LOG_DIR}/webench-"${TIMESTAMP}".log 2>&1

cd "${PWD}" || exit
