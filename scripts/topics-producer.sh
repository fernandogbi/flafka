#!/bin/bash

docker-compose exec kafka sh /kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1