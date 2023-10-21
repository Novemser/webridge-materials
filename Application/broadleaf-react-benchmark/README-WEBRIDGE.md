# How to build

```shell
mvn clean install -Dmaven.test.skip=true
```

# How to run 

```shell
cd api
mvn spring-boot:run
cd site
yarn
yarn develop
```

# Configuration file

Refer to `api/src/main/resources/runtime-properties/default.properties`