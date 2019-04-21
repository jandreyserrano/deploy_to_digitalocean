#!/usr/bin/env sh
set -x

# echo "Travis build  number - ${TRAVIS_BUILD_NUMBER}"

cd test/

echo "-------------------"
docker ps
# docker rmi $(docker images -q)
docker pull jandrey15/nginx:latest
# docker build -t jandrey15/nginx:$TRAVIS_BUILD_NUMBER .
# docker run --name my-nginx -d -p 8080:80 jandrey15/nginx
docker ps -a
# docker rm $(docker ps -a -q)
