#!/bin/bash

# timezone
ln -sf /usr/share/zoneinfo/${TZ:-"Asia/Shanghai"} /etc/localtime
echo ${TZ:-"Asia/Shanghai"} > /etc/timezone

# install rule-store
cd /
npm init surgio-store my-rule-store --use-cnpm

# create gateway
\cp -rf /gateway.js /my-rule-store/

# custom config
config_dir="/var/config"
if [ -d $config_dir ]&&[ "$(ls -A $config_dir)" ];then
    \cp -rf /var/config/* /my-rule-store/
fi

if [ -f /my-rule-store/package.json ];then
    sed -i '/"scripts": {/a "generage": "surgio generate",' /my-rule-store/package.json
fi

cd /my-rule-store
npm i @surgio/gateway --save
npm run generage && node gateway.js
