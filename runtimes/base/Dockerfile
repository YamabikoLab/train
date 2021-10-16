FROM ubuntu:21.10

LABEL maintainer="yamabiko"

ARG TIME_ZONE
ARG WWWUSER
ARG WWWGROUP
ARG RUBY_VERSION

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=${TIME_ZONE}

USER root

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update \
    && apt install -y tzdata \
    && apt install -y build-essential procps curl file git zlib1g-dev \
    && apt install -y mysql-client && apt install -y libmysqld-dev \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && apt -y autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd --force -g ${WWWGROUP} train
RUN useradd -ms /bin/bash --no-user-group -g ${WWWGROUP} -u ${WWWUSER} train

USER train

WORKDIR /home/train
RUN mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew \
    && echo 'eval "$($HOME/homebrew/bin/brew shellenv)"' >> $HOME/.bashrc && eval "$(homebrew/bin/brew shellenv)" \
    && brew update --force --quiet \
    && chmod -R go-w "$(brew --prefix)/share/zsh" \
    && echo 'eval "$(rbenv init - bash)"' >> $HOME/.bashrc && eval "$(rbenv init - bash)" \
    && rbenv install ${RUBY_VERSION} && rbenv global ${RUBY_VERSION} && rbenv rehash \
    && gem install bundler && gem install rails && rbenv rehash

CMD ["/bin/bash"]