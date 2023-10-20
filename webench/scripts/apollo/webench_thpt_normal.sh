#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
APOLLO_ROOT=/root/apollo
LOG_DIR=/tmp/log/apollo
SCHEMA_FILE=/root/apollo/ApolloPortalSchema.sql
PERF_BASE_DIR=/root/benchmark/apollo/thpt
DB_HOST=172.17.90.253
SERVER_HOST=172.20.209.139
#DB_HOST=172.20.209.141
#DB_HOST=172.23.76.177
DB_PORT=3306
DB_PASSWORD="admin"
DB_NAME=ApolloPortalDB
WEB_HOST="http://172.20.209.139:8070"

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

cd ${WEBENCH_ROOT} || exit
./gradlew jar

cd ${WEBENCH_ROOT}/build/libs || exit
for NUM_THD in 2 4 8 16 32 48 56 64
do
  sh ${WEBENCH_ROOT}/scripts/apollo/restart_web.sh
  echo 'Started WeBench! Thread number: ' ${NUM_THD}
  java -Xmx16g -jar webench-1.0-SNAPSHOT.jar \
    --workload config_manage --app apollo --distribution-base-dir data/config_manage \
    --schema ${SCHEMA_FILE} --threads $NUM_THD --warmup 300 --time 600 --period 60 \
    --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} \
    --perf-base-dir ${PERF_BASE_DIR}/"${TIMESTAMP}_NORMAL_${NUM_THD}_threads" \
    --web-host ${WEB_HOST} \
    --database ${DB_NAME} > ${LOG_DIR}/webench-"${TIMESTAMP}_${NUM_THD}_threads".log 2>&1
done

cd "${PWD}" || exit

ssh root@$SERVER_HOST "ps aux | grep 'apollo' | awk '{print \$2}' | xargs kill -9"