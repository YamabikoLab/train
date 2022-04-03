FROM train

LABEL maintainer="yamabiko"

ENV DEBIAN_FRONTEND noninteractive

ARG USER_NAME
ARG NODESOURCE_VERSION

USER root

RUN curl -sL ${NODESOURCE_VERSION} | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn \
    && apt-get install -y vim \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER_NAME}

COPY Gemfile /var/www/html/Gemfile
COPY Gemfile.lock /var/www/html/Gemfile.lock

WORKDIR /var/www/html

ARG HOME_DIR=/home/${USER_NAME}

ENV PATH $PATH:${HOME_DIR}/.rbenv/shims
ENV PATH $PATH:${HOME_DIR}/homebrew/bin

RUN rbenv exec bundle install && rbenv rehash

EXPOSE 3000 1234 26162