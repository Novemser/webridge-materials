#!/bin/bash

set -x
PWD=$(pwd)
TIMESTAMP=$(date +%F-%T)
WEBENCH_ROOT=/root/webench
LOG_DIR=/tmp/log/my-blog/thpt
SCHEMA_FILE=/root/my-blog/My-Blog-schema-and-data.sql
PERF_BASE_DIR=/root/perf/my-blog/thpt
DB_HOST=172.17.90.253
DB_PORT=3306
DB_PASSWORD="admin"
DB_NAME=my_blog_db
WEB_HOST="http://172.20.209.139:9080"
LOG_NAME_PREF="SP"

mkdir -p $LOG_DIR
mkdir -p $PERF_BASE_DIR

run () {
    java -jar webench-1.0-SNAPSHOT.jar \
      --app myblog \
      --workload blogging \
      --schema ${SCHEMA_FILE} --threads ${NUM_THD} --warmup 300 --time 600 --period 60 \
      --host ${DB_HOST} --port ${DB_PORT} --password ${DB_PASSWORD} --populateDb \
      --perf-base-dir ${PERF_BASE_DIR}/${LOG_NAME_PREF}/"${TIMESTAMP}"_${LOG_NAME_PREF}_${NUM_THD}_threads \
      --web-host ${WEB_HOST} \
      --distribution-base-dir data/blogging \
      --database ${DB_NAME} > ${LOG_DIR}/webench-thpt-${LOG_NAME_PREF}-"${TIMESTAMP}".log 2>&1
}

cd ${WEBENCH_ROOT} || exit
./gradlew jar
cd ${WEBENCH_ROOT}/build/libs || exit
for NUM_THD in 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100
do
  sh ${WEBENCH_ROOT}/scripts/myblog/restart_web_using_normal.sh
  LOG_NAME_PREF="NORMAL"
  run
  sh ${WEBENCH_ROOT}/scripts/myblog/restart_web_using_sp.sh
  LOG_NAME_PREF="SP"
  run
done

cd "${PWD}" || exit