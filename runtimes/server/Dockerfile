FROM train

LABEL maintainer="yamabiko"

USER root

WORKDIR /var/www/html

RUN apt update \
    && apt install -y supervisor \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start-container /usr/local/bin/start-container
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/bin/start-container

ENTRYPOINT ["start-container"]