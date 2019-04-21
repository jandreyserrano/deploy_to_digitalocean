# #!/usr/bin/env sh
# set -x

# echo "Connecting..."
# echo $REMOTE_USER
# tar -czf package.tgz build && \
# scp Dockerfile $REMOTE_USER@$REMOTE_HOST:$REMOTE_APP_DIR && \
# scp Dockerfile $REMOTE_USER@$REMOTE_HOST && \
# ssh -y $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh


#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  echo "Connecting..."

else
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  echo "Connecting..."
  yes | scp Dockerfile $REMOTE_USER@$REMOTE_HOST && \
  ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh
  echo "................"
  echo "Not deploying, since this branch isn't master."
fi
