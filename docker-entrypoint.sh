#!/bin/sh

# 替换环境变量
envsubst < /app/application.yml > /app/application.yml.tmp
mv /app/application.yml.tmp /app/application.yml

# 执行传入的命令
exec "$@" 