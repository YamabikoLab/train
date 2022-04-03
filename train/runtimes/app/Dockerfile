FROM train

LABEL maintainer="yamabiko"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

COPY Gemfile /var/www/html/Gemfile

USER train

ENV PATH $PATH:/home/train/.rbenv/shims
ENV PATH $PATH:/home/train/homebrew/bin

RUN rbenv exec bundle install \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000 1234 26162