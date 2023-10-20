## Test StoredProcedureManager

### To run webridge-common only, edit `basic-components/build.gradle` to change dependency of slf4j

### From
```groovy
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-api
    compileOnly group: 'org.slf4j', name: 'slf4j-api', version: '1.7.30'
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-simple
    compileOnly group: 'org.slf4j', name: 'slf4j-simple', version: '1.7.30'
```

### To
```groovy
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-api
    implementation group: 'org.slf4j', name: 'slf4j-api', version: '1.7.30'
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-simple
    implementation group: 'org.slf4j', name: 'slf4j-simple', version: '1.7.30'
```

## Sample

```shell

```