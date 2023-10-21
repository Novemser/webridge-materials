#!/bin/bash

for NUM_PATH in 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 10240
do
  ./gradlew :micro-benchmarks:run --args="172.17.90.253 3306 shopizer root admin ${NUM_PATH}" | grep 'Total time used'
done
