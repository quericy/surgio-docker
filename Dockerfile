FROM mhart/alpine-node:12

COPY docker-entrypoint.sh gateway.js /

RUN  apk update && apk add bash && \
     chmod +x /docker-entrypoint.sh

# Persistent config file
VOLUME [ "/var/config"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
