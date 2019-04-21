#!/bin/bash
set -xe

echo "----------------"

if [ $TRAVIS_BRANCH == 'master' ] ; then

  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  docker push jandrey15/nginx:$TRAVIS_BUILD_NUMBER
  docker push jandrey15/nginx:latest
  
  echo "----------------"
  
  echo export TRAVIS_BUILD_NUMBER=$TRAVIS_BUILD_NUMBER > .env_travis

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  echo "Connecting..."
  scp -o StrictHostKeyChecking=no Dockerfile $REMOTE_USER@$REMOTE_HOST:~/test && \
  scp -o StrictHostKeyChecking=no .env_travis $REMOTE_USER@$REMOTE_HOST:~/ && \
  ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh
  echo "Deployment..."

else
  echo "Not deploying, since this branch isn't master."
fi
