#!/bin/bash
DB_HOST=$1
DB_PORT=$2
DB_USER=$3
DB_PASSWORD=$4
DB_NAME=$5

for PC_NUM in 2 4 8 16 32 64 128 256 512 1024 2048 4096 10240
do
  python3 gen_pc.py ${PC_NUM} > sp_${PC_NUM}.sql
  mysql -u${DB_USER} -p${DB_PASSWORD} -h${DB_HOST} -P${DB_PORT} shopizer_hgs < sp_${PC_NUM}.sql
done
