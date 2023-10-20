#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
LOG_DIR=/tmp/log/shopizer
SCHEMA_FILE=/root/shopizer/shopizer-default.sql
PERF_BASE_DIR=/root/perf/shopizer/thpt-random-add-purchase
DB_HOST=172.17.90.253
#DB_HOST=172.20.209.141
#DB_HOST=172.23.76.177
DB_PORT=3306
DB_PASSWORD="admin"
DB_NAME=shopizer_hgs
WEB_HOST="http://172.20.209.139:8089/api/v1"

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

cd ${WEBENCH_ROOT} || exit
./gradlew jar
cd ${WEBENCH_ROOT}/build/libs || exit
for NUM_THD in 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100
do
  sh ${WEBENCH_ROOT}/scripts/shopizer/restart_web.sh
  java -Xmx16g -jar webench-1.0-SNAPSHOT.jar \
    --app shopizer \
    --schema ${SCHEMA_FILE} --threads $NUM_THD --warmup 300 --time 600 --period 60 \
    --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} --populateDb \
    --perf-base-dir ${PERF_BASE_DIR}/"${TIMESTAMP}_NORMAL_${NUM_THD}_threads" \
    --web-host ${WEB_HOST} \
    --distribution-base-dir data/eCommerce.random_purchase_and_add \
    --database ${DB_NAME} > ${LOG_DIR}/webench-"${TIMESTAMP}_${NUM_THD}_threads".log 2>&1
done

cd "${PWD}" || exit
