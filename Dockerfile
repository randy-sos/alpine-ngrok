FROM alpine:latest
RUN mkdir -p /usr/local/bin \
    && mkdir /temp_docker \
    && chmod -R +x /temp_docker \
    && cd /temp_docker \
    && mkdir /var/log/ngrok \
    && chmod -R +w /var/log/ngrok \
    && mkdir /root/.ngrok2 \
    && chmod -R +w /root/.ngrok2

COPY docker-entrypoint.sh /usr/local/bin/
COPY ngrok /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/ngrok \
    && rm -rf /temp_docker

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 4040
