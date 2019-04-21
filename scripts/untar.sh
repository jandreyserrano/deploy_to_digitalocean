#!/usr/bin/env sh
set -x

cd test/
# docker build -t jandrey15/nginx:$TRAVIS_BUILD_NUMBER .
# docker run --name my-nginx -d -p 8080:80 jandrey15/nginx
docker ps -a
