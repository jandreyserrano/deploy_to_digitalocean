#!/usr/bin/env sh
set -x

docker run --name my-nginx -d -p 8080:80 jandrey15/nginx
docker ps -a

# export NODE_ENV=production
# export NVM_BIN=$HOME/.nvm/versions/node/v6.9.0/bin

# cd /var/www/YOUR-DOMAIN.com && \
# tar zxvf package.tgz -C . && \
# mv build/package.json . && \
# npm install && \
# npm run start