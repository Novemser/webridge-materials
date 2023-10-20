## How to build

```shell
./gradlew build publishToMavenLocal -x test
```

## How to use

Here is a quick example on how to use webench

```shell
java -jar build/libs/webench-1.0-SNAPSHOT.jar --app pybbs --workload forum --host localhost --web-host http://localhost:8000 --database pybbs_ys --port 3306 --schema /home/pybbs/pybbs_schema_and_data_en.sql --perf-base-dir /tmp/perf/pybbs --distribution-base-dir data/forum --warmup 30 --time 60 --threads 1 --username admin --password password --populateDb
```