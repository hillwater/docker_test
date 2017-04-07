#!/bin/bash


JAR_S3_PATH=$1
shift
OTHER_ARGS=$*

java -version

echo "jar s3 path: $JAR_S3_PATH"
echo "other args: $OTHER_ARGS"

cd /tmp
wget -O tmp.jar  $JAR_S3_PATH


java -cp tmp.jar $OTHER_ARGS
