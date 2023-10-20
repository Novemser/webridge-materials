## How to compile

```shell
mvn clean package -Dmaven.test.skip=true
```

## How to run

```shell
/home/openjdk8-webridge/build/linux-x86_64-normal-server-release/images/j2sdk-image/bin/java -Djava.security.policy=webridge.policy -jar target/my-blog-4.0.0-SNAPSHOT.jar
```