FROM train

LABEL maintainer="yamabiko"

ENV DEBIAN_FRONTEND noninteractive

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

EXPOSE 3000

ENTRYPOINT ["start-container"]