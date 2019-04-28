#!/usr/bin/env sh
set -x

# echo "Travis build  number - ${TRAVIS_BUILD_NUMBER}"
pwd && \
source .env_travis && \
cd test/ && \

echo "-------------------" && \
docker service ls
docker service update --image jandrey15/nginx my-nginx
docker service ps my-nginx
