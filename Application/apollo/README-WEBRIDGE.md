# How to build

```shell
mvn clean package -Dmaven.test.skip=true
```

# How to run

## Start the assembly module (serving as a background process)

```shell
java -Dapollo_profile=github -jar apollo-assembly/target/apollo-assembly-2.1.0.jar --configservice --adminservice
```

## Start the online portal

```shell
java -cp /root/.m2/repository/webridge/webridge-common/0.1/webridge-common-0.1.jar -Dapollo_profile=github,auth -Ddev_meta=http://localhost:8080/ -Dserver.port=8070 -Djava.security.policy=webridge.policy -jar apollo-portal/target/apollo-portal-2.1.0.jar
```