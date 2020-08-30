#!/bin/bash

docker-compose exec kafka sh /kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092