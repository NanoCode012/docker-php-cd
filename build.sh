#!/bin/bash

# Stop if error
set -e

docker-compose build
docker-compose down

# Choose the first for simple deploy
#        the second with SSL (used with nginx-proxy)
docker-compose up -d
# docker-compose up -d -f docker-compose.yml -f docker-compose.ssl.yml