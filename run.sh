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
git pull

if [ -d app/.git ]; then
    cd app
    git pull
    cd ..
fi;

echo "Temporarily changing owner of mysql dir to $USER"
sudo chown -R ${USER}:${USER} mysql

# -------------------------------------------------------------------------- #

# Start containers
echo 'Rebuilding containers.. Shutting off old ones if exists..'
bash build.sh

# -------------------------------------------------------------------------- #

# Post
echo 'Sleeping a bit...'
sleep 35

echo 'Sending final commands to container...'

# Add any post changes below
# docker exec -i ${CONTAINER_NAME} bash -c "echo 'hello'"

echo 'Done!'