#!/bin/bash

# Stop if error
set -e 

# -------------------------------------------------------------------------- #

# Load env file
set -a
source .env
set +a

# -------------------------------------------------------------------------- #

# Setup
echo 'Checking for newer versions'

if [ -d app/.git ]; then
    cd app
    git pull
    cd ..
fi;

# -------------------------------------------------------------------------- #

# Start containers
docker-compose build
docker-compose down

# Choose the first for simple deploy
#        the second with SSL (used with nginx-proxy)
docker-compose up -d
# docker-compose up -d -f docker-compose.yml -f docker-compose.ssl.yml

# -------------------------------------------------------------------------- #

# Post
echo 'Sleeping a bit...'
sleep 35

echo 'Sending final commands to container...'

# Add any post changes below
# docker exec -i ${CONTAINER_NAME} bash -c "echo 'hello'"

echo 'Done!'