FROM train

LABEL maintainer="yamabiko"

ARG APP_NAME

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html/${APP_NAME}

COPY Gemfile /var/www/html/${APP_NAME}/Gemfile

USER train

ENV PATH $PATH:/home/train/.rbenv/shims
ENV PATH $PATH:/home/train/homebrew/bin

RUN bundle install

USER root

RUN apt update && apt install -y supervisor && apt install -y vim \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY train/runtimes/app/start-container /usr/local/bin/start-container
COPY train/runtimes/app/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY train/runtimes/app/start-rails.sh /home/train/start-rails.sh

RUN chmod +x /usr/local/bin/start-container && chmod +x /home/train/start-rails.sh && chown train:train /home/train/start-rails.sh

EXPOSE 3000 1234 26162

ENTRYPOINT ["start-container"]