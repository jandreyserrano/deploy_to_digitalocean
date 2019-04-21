#!/usr/bin/env sh
set -x

# echo "Travis build  number - ${TRAVIS_BUILD_NUMBER}"
pwd && \
source .env_travis && \
cd test/ && \

echo "-------------------" && \
docker ps
# docker rmi $(docker images -q)
# docker pull jandrey15/nginx:latest
docker pull jandrey15/nginx:$TRAVIS_BUILD_NUMBER
# docker run --name my-nginx-$TRAVIS_BUILD_NUMBER -d -p 80:80 jandrey15/nginx:latest
docker stop my-nginx
docker run --rm --name my-nginx -d -p 80:80 jandrey15/nginx:$TRAVIS_BUILD_NUMBER
# docker build -t jandrey15/nginx:$TRAVIS_BUILD_NUMBER .
# docker run --name my-nginx -d -p 8080:80 jandrey15/nginx
docker ps -a
# docker rm $(docker ps -a -q)
