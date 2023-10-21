# How to build

```shell
mvn clean compile package
```

# How to run

## Online

### Change the java path to your own
```shell
/home/openjdk8-webridge/build/linux-x86_64-normal-server-release/images/j2sdk-image/bin/java -Djava.security.policy=webridge.policy -jar target/pybbs.jar --spring.profiles.active=dev
```

# Configuration

Refer to `pybbs/src/main/resources/application-dev.yml`, `pybbs/src/main/resources/application.yml`