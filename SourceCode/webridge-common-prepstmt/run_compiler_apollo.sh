#!/bin/bash

./gradlew build publishToMavenLocal -x test

BASE_DIR=`pwd`
APP_NAME=apollo
APP_BASE_DIR=/root/apollo-offline
GENERATED_SP_DIR=/root/generatedSP/apollo
SCHEMA_DEFINE_FILE=$APP_BASE_DIR/ApolloPortalSchema.sql

CLASSPATH=$BASE_DIR/lib/build/libs/lib.jar:$BASE_DIR/slf4j-simple-1.7.30.jar:$BASE_DIR/basic-components/build/libs/basic-components.jar:$BASE_DIR/utils/build/libs/utils.jar
CONCOLIC_EXEC_ENDPOINT=http://172.20.209.147:8099
OFFLINE_SERVER_HOST=172.20.209.147
CONCOLIC_JDK_PATH=/root/openjdk8-webridge/build/linux-x86_64-normal-zero-release/images/j2sdk-image

echo "Downloading logger implementation from maven..."
wget --no-clobber https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/1.7.30/slf4j-simple-1.7.30.jar

java -Xmx16g -Xss20m -Djava.security.policy=$APP_BASE_DIR/webridge.policy \
-classpath $CLASSPATH \
webridge.common.offline.compiler.OfflineCompilerServer \
--baseDir $APP_BASE_DIR \
--concolic-http-endpoint $CONCOLIC_EXEC_ENDPOINT \
--concolic-jdk-path $CONCOLIC_JDK_PATH \
--sp-def-dir $GENERATED_SP_DIR \
--schema-sql $SCHEMA_DEFINE_FILE \
--app-name $APP_NAME \
--host $OFFLINE_SERVER_HOST