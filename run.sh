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
bash build.sh

# -------------------------------------------------------------------------- #

# Post
echo 'Sleeping a bit...'
sleep 35

echo 'Sending final commands to container...'

# Add any post changes below
# docker exec -i ${CONTAINER_NAME} bash -c "echo 'hello'"

echo 'Done!'