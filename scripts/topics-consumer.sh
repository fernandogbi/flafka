#!/bin/bash

docker-compose exec kafka sh /kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning