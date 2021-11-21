#!/bin/bash

# Stop if error
set -e

# Choose the first for simple deploy
#        the second to use Composer
#        the third to use SSL with nginx-proxy
#        the fourth to use all

CONF='-f docker-compose.yml '

if [ "$USE_COMPOSER" = true ] ; then
    echo 'Using Composer'
    CONF+='-f docker-compose.composer.yml '
fi

if [ "$USE_SSL" = true ] ; then
    echo 'Using SSL'
    CONF+='-f docker-compose.ssl.yml '
fi

docker-compose ${CONF} build --no-cache
docker-compose down

docker-compose ${CONF} up -d
