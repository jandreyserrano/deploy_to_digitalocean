#!/bin/bash
set -xe

echo "------------------"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jandrey15/nginx:$TRAVIS_BUILD_NUMBER

echo "------------------"

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  echo "Connecting..."
  scp -o StrictHostKeyChecking=no Dockerfile $REMOTE_USER@$REMOTE_HOST:~/test && \
  ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh
  echo "Deployment..."

else
  echo "Not deploying, since this branch isn't master."
fi
