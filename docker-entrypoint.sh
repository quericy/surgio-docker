#!/bin/bash

# timezone
ln -sf /usr/share/zoneinfo/${TZ:-"Asia/Shanghai"} /etc/localtime
echo ${TZ:-"Asia/Shanghai"} > /etc/timezone


# custom config
config_dir="/var/config"
if [ -d $config_dir ]&&[ "$(ls -A $config_dir)" ];then
    \cp -rf /var/config/* /my-rule-store/
fi

cd /my-rule-store
npm run update && node gateway.js
