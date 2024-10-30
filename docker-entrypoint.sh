#!/bin/sh

# 替换环境变量
if [ -f /app/application.yml ]; then
    envsubst < /app/application.yml > /app/application.yml.tmp
    mv /app/application.yml.tmp /app/application.yml
fi

if [ -f /app/application-prod.yml ]; then
    envsubst < /app/application-prod.yml > /app/application-prod.yml.tmp
    mv /app/application-prod.yml.tmp /app/application-prod.yml
fi

# 执行传入的命令
exec "$@" 