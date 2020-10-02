FROM mhart/alpine-node:12

COPY docker-entrypoint.sh gateway.js /

RUN  apk update && apk add bash && \
     chmod +x /docker-entrypoint.sh && \
     /usr/bin/npm init surgio-store /my-rule-store --use-cnpm

# Persistent config file
VOLUME [ "/var/config"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
