#!/bin/bash

if [ $# -eq 0 ]; then
    docker-compose logs -f --tail 10
else
    docker-compose logs -f --tail 10 $1
fi