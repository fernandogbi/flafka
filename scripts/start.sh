#!/bin/bash

echo "creating kafka and zookeeper services"

CONFIG_FILE=$1 docker-compose up -d kafka

echo "wating a time to kafka start and create default topics..."
sleep 5

sh ./scripts/topics-create.sh twitter_to_kafka
sh ./scripts/topics-create.sh spool_to_kafka

echo "creating flume service"

if [ ! -d "./conf/flume/spool_to_kafka" ]; then
    mkdir "./conf/flume/spool_to_kafka"
fi

if [ ! -d "./conf/flume/spool_to_logger" ]; then
    mkdir "./conf/flume/spool_to_logger"
fi

CONFIG_FILE=$1 docker-compose up -d flume

echo "done!"