#!/bin/bash

docker image build -t apache-flume:$1 --build-arg VERSION=$1 ./build/flume