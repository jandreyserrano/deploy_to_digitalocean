#!/usr/bin/env sh
set -x

echo "Connecting..."
# tar -czf package.tgz build && \
# scp Dockerfile $REMOTE_USER@$REMOTE_HOST:$REMOTE_APP_DIR && \
scp Dockerfile $REMOTE_USER@$REMOTE_HOST && \
ssh $REMOTE_USER@$REMOTE_HOST 'bash -s' < ./scripts/untar.sh