#!/bin/bash

./gradlew build publishToMavenLocal -x test

APP_NAME=pybbs
APP_BASE_DIR=pybbs-offline
GENERATED_SP_DIR=offline-compiler/pybbs
SCHEMA_DEFINE_FILE=$APP_BASE_DIR/pybbs_schema.sql

CLASSPATH=./lib/build/libs/lib.jar:./slf4j-simple-1.7.30.jar
CONCOLIC_EXEC_ENDPOINT=http://127.0.0.1:8099
CONCOLIC_JDK_PATH=openjdk8-webridge/build/linux-x86_64-normal-zero-release/images/j2sdk-image

echo "Downloading logger implementation from maven..."
wget --no-clobber https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/1.7.30/slf4j-simple-1.7.30.jar
# echo "grant {permission java.net.SocketPermission \"localhost:1024-\",\"accept,connect,resolve,listen\"; permission java.lang.RuntimePermission \"getClassLoader\"; permission java.lang.RuntimePermission \"setContextClassLoader\"; permission java.lang.RuntimePermission \"accessClassInPackage.sun.reflect\"; permission java.lang.RuntimePermission \"java.io.FilePermission \"<<ALL FILES>>\", \"read, write, execute\";};" > /tmp/webridge.jvm.policy

java -Djava.security.policy=$APP_BASE_DIR/webridge.policy \
-classpath $CLASSPATH \
webridge.common.offline.compiler.OfflineCompilerServer \
--baseDir $APP_BASE_DIR \
--concolic-http-endpoint $CONCOLIC_EXEC_ENDPOINT \
--concolic-jdk-path $CONCOLIC_JDK_PATH \
--sp-def-dir $GENERATED_SP_DIR \
--schema-sql $SCHEMA_DEFINE_FILE \
--app-name $APP_NAME
