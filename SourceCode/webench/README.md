## Example 

## Sagan

```shell
java -jar webench-1.0-SNAPSHOT.jar --workload blogging --app sagan --host 172.17.90.253 --web-host http://172.20.209.139:8080 --database sagan_ys --port 3306 --schema /root/sagan/sagan_schema.sql --distribution-base-dir data/blogging --perf-base-dir ~/benchmark/sagan-webench-debug-createProject-warm30-time60 --warmup 30 --time 60 --threads 1
```
