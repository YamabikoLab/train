FROM train

LABEL maintainer="yamabiko"

ARG TIME_ZONE
ARG WWWUSER
ARG WWWGROUP
ARG RUBY_VERSION

ENV DEBIAN_FRONTEND noninteractive

USER train

WORKDIR /var/www/html

RUN bundle install

USER root

RUN apt install -y supervisor \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY train/runtimes/app/start-container /usr/local/bin/start-container
COPY train/runtimes/app/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY train/runtimes/app/start-rails.sh /home/train/start-rails.sh

RUN chmod +x /usr/local/bin/start-container && chmod +x /home/train/start-rails.sh && chown train:train /home/train/start-rails.sh

EXPOSE 3000 1234 26162

ENTRYPOINT ["start-container"]