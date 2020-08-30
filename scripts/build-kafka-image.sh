#!/bin/bash

docker image build -t apache-kafka:$1 --build-arg VERSION=$1 ./build/kafka