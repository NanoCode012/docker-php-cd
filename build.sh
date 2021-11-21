#!/bin/bash

# Stop if error
set -e

# Only run if container(s) is UP
if docker-compose ps | grep -q "Up" ; then
    echo 'Container is currently running. Building container(s)..'
    #docker-compose build
    docker-compose down
fi

# Choose the first for simple deploy
#        the second to use Composer
#        the third to use SSL with nginx-proxy
#        the fourth to use all

cmd='docker-compose -f docker-compose.yml '

if [ "$USE_COMPOSER" = true ] ; then
    echo 'Using Composer'
    cmd+='-f docker-compose.composer.yml '
fi

if [ "$USE_SSL" = true ] ; then
    echo 'Using SSL'
    cmd+='-f docker-compose.ssl.yml '
fi

cmd+='up -d --force-recreate --build'

echo $(eval "$cmd")
