#!/bin/bash

# Stop if error
set -e

docker-compose build
docker-compose down

# Choose the first for simple deploy
#        the second to use Composer
#        the third to use SSL with nginx-proxy
#        the fourth to use all

command = 'docker-compose -f docker-compose.yml '

if [ "$USE_COMPOSER" = true ] ; then
    echo 'Using Composer'
    command += '-f docker-compose.composer.yml '
fi

if [ "$USE_SSL" = true ] ; then
    echo 'Using SSL'
    command += '-f docker-compose.ssl.yml '
fi

command += 'up -d'

echo $(eval "$command")