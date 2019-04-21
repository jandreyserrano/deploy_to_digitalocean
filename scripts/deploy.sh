#!/usr/bin/env sh
set -x

echo "Connecting..."
echo $REMOTE_USER
# tar -czf package.tgz build && \
# scp Dockerfile $REMOTE_USER@$REMOTE_HOST:$REMOTE_APP_DIR && \
scp Dockerfile $REMOTE_USER@$REMOTE_HOST && \
ssh -y $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh
