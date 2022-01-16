FROM mhart/alpine-node:12

COPY docker-entrypoint.sh gateway.js /

# init surgio and rules
RUN  apk update && apk add bash && \
     chmod +x /docker-entrypoint.sh && \
     /usr/bin/npm init surgio-store /my-rule-store --use-cnpm  && \
     cd /my-rule-store && /usr/bin/npm install surgio@latest && /usr/bin/npm install @surgio/gateway@latest && \
     /usr/bin/npm cache clean --force

# Persistent config file
VOLUME [ "/var/config"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
