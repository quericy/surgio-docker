FROM frankyue/surgio

COPY docker-entrypoint.sh gateway.js /
COPY gateway.js /my-rule-store/
RUN  chmod +x /docker-entrypoint.sh && \
     \cp -rf /gateway.js /my-rule-store/

# Persistent config file
VOLUME [ "/var/config"]
ENTRYPOINT [ "/docker-entrypoint.sh" ]
