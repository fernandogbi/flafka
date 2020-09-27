#!/bin/bash

if [ ! -f "./credentials.env" ]; then
    echo "creating twitter credentials file..."
    echo "ACCESS_TOKEN=" >> credentials.env
    echo "ACCESS_TOKEN_SECRET=" >> credentials.env
    echo "CONSUMER_KEY=" >> credentials.env
    echo "CONSUMER_SECRET=" >> credentials.env
fi


echo "creating kafka and zookeeper services"

export CONFIG_FILE=$1
export AGENT_NAME=$2 
docker-compose up -d kafka

echo "wating a time to kafka start and create default topics..."
sleep 5

sh ./scripts/topics-create.sh twitter_to_kafka
sh ./scripts/topics-create.sh spool_to_kafka

echo "creating flume service"

if [ ! -d "./conf/flume/spool_to_kafka" ]; then
    mkdir "./conf/flume/spool_to_kafka"
fi

CONFIG_FILE=$1 docker-compose up -d flume

echo "done!"