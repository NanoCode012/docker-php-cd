#!/bin/bash

# Stop if error
set -e

docker-compose build
docker-compose down

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

cmd+='up -d'

echo $(eval "$cmd")