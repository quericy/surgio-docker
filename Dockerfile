FROM node:18-alpine

COPY docker-entrypoint.sh gateway.js /

# init surgio and rules
RUN  apk update && apk add bash && \
     chmod +x /docker-entrypoint.sh && \
     /usr/local/bin/npm init surgio-store /my-rule-store --use-cnpm  && \
     cd /my-rule-store && /usr/local/bin/npm install surgio@latest && /usr/local/bin/npm install @surgio/gateway@latest && \
     /usr/local/bin/npm cache clean --force

# Persistent config file
VOLUME [ "/var/config"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
