#!/bin/bash

docker-compose exec kafka sh /kafka/bin/kafka-topics.sh --create --topic $1 --zookeeper zookeeper:2181 --partitions 1 --replication-factor 1