FROM train

LABEL maintainer="yamabiko"

ENV DEBIAN_FRONTEND noninteractive

ARG USER_NAME
ARG NODESOURCE_VERSION

USER root

RUN curl -sL ${NODESOURCE_VERSION} | bash - \
    && apt install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y yarn \
    && apt install -y vim \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ${USER_NAME}

COPY Gemfile /var/www/html/Gemfile

WORKDIR /var/www/html

ENV PATH $PATH:${HOME}/.rbenv/shims
ENV PATH $PATH:${HOME}/homebrew/bin

RUN rbenv exec bundle install && rbenv rehash

EXPOSE 3000 1234 26162