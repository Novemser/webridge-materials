## How to build

```shell
./gradlew build publishToMavenLocal -x test
```

## How to use

Here is a quick example on how to use webench

```shell
java -jar build/libs/webench-1.0-SNAPSHOT.jar --app pybbs --workload forum --host localhost --web-host http://localhost:8000 --database pybbs_ys --port 3306 --schema /home/pybbs/pybbs_schema_and_data_en.sql --perf-base-dir /tmp/perf/pybbs --distribution-base-dir data/forum --warmup 30 --time 60 --threads 1 --username admin --password password --populateDb
```

## Parameters

For more details, refer to `src/main/java/webench/meta/argument/Args.java`

`--workload` the workload type for the workload generator to generate

`--threads` number of worker threads to issue requests

`--warmup` warmup time in seconds

`--time` workload running time in seconds

`--period` period for statistics

`--populateDb` whether to create the tables and populate data before the benchmark

`--onlyPopulateDb` whether to create the tables and populate data without running the benchmark

`--scale` the scale factor

`--host` MySQL server host name

`--database` MySQL database instance name

`--username` MySQL server host name

`--password` MySQL server password

`--port` MySQL server port

`--app` The application name Valid names:broadleaf, shopizer, sagan, apollo, pybbs, myblog

`--web-host` Web server port

`--perf-base-dir` Base directory to store perf result

`--distribution-base-dir` Access distribution base directory