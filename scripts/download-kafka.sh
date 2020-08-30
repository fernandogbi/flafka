#!/bin/bash

readonly KAFKA_FOLDER="./build/kafka/kafka-src"

curl http://ftp.unicamp.br/pub/apache/kafka/2.5.0/kafka-$1-src.tgz --output ./build/kafka/kafka-src.tgz

if [ ! -d "$KAFKA_FOLDER" ]; then
    echo "creating kafka source folder"
    mkdir $KAFKA_FOLDER
fi

tar -xzvf ./build/kafka/kafka-src.tgz -C $KAFKA_FOLDER --strip-components=1

rm ./build/kafka/kafka-src.tgz