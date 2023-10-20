#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
LOG_DIR=/tmp/log/broadleaf
SCHEMA_FILE=/root/jpf-web/broadleaf-react-benchmark/api-input/blf_with_user.sql
PERF_BASE_DIR=/root/perf/broadleaf/memory-16g
DB_HOST=172.17.90.250
#DB_HOST=172.20.209.141
#DB_HOST=172.23.76.177
DB_PORT=3306
DB_PASSWORD="admin"
#WEB_HOST="http://localhost:3000"
WEB_HOST="http://172.20.209.139:3000"
DB_NAME=broadleaf_react

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

cd ${WEBENCH_ROOT} || exit
./gradlew jar
cd ${WEBENCH_ROOT}/build/libs || exit
#for NUM_THD in 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100
#for NUM_THD in 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100
#for NUM_THD in 68 72 76 84 88 92 96 100
for NUM_THD in 120 140 160 180 200
do
#NUM_THD=40
  sh ${WEBENCH_ROOT}/scripts/broadleaf/restart_web.sh
  java -Xmx16g -jar webench-1.0-SNAPSHOT.jar \
    --app broadleaf \
    --schema ${SCHEMA_FILE} --threads $NUM_THD --warmup 60 --time 120 --period 60 \
    --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} --populateDb \
    --perf-base-dir ${PERF_BASE_DIR}/"${TIMESTAMP}_ADD_SLEEP_TO_STP_${NUM_THD}_threads" \
    --web-host ${WEB_HOST} \
    --database ${DB_NAME} > ${LOG_DIR}/webench-"${TIMESTAMP}_${NUM_THD}_threads".log 2>&1
done

cd "${PWD}" || exit
