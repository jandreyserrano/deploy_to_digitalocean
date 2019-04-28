#!/usr/bin/env sh
set -x

pwd && \
source .env_travis && \
# cd test/ && \

echo "-------------------" && \

echo $TRAVIS_BUILD_NUMBER
docker service ls
docker service update --image jandrey15/nginx:$TRAVIS_BUILD_NUMBER my-nginx
docker service ps my-nginx
