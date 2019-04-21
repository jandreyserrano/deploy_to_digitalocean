#!/bin/bash
set -xe

echo "hello world"

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
