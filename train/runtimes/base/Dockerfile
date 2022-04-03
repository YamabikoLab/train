FROM ubuntu:21.04

LABEL maintainer="yamabiko"

ARG TIME_ZONE
ARG WWWUSER
ARG WWWGROUP
ARG USER_NAME
ARG GROUP_NAME
ARG RUBY_VERSION

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=${TIME_ZONE}

USER root

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update \
    && apt install -y tzdata \
    && apt install -y build-essential procps curl file git zlib1g-dev \
    && apt install -y mysql-client && apt install -y libmysqld-dev

RUN groupadd --force -g ${WWWGROUP} ${GROUP_NAME}
RUN useradd -ms /bin/bash --no-user-group -g ${WWWGROUP} -u ${WWWUSER} ${USER_NAME}

USER ${USER_NAME}

ARG HOME_DIR=/home/${USER_NAME}

WORKDIR ${HOME_DIR}

RUN mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew \
    && echo 'eval "$(${HOME_DIR}/homebrew/bin/brew shellenv)"' >> $HOME/.bashrc && eval "$(${HOME_DIR}/homebrew/bin/brew shellenv)" \
    && brew update --force --quiet \
    && chmod -R go-w "$(brew --prefix)/share/zsh" \
    && brew install rbenv \
    && echo 'eval "$(rbenv init - bash)"' >> ${HOME_DIR}/.bashrc && eval "$(rbenv init - bash)" \
    && rbenv install ${RUBY_VERSION} && rbenv global ${RUBY_VERSION} \
    && rbenv exec gem install bundler && rbenv exec gem install rails

CMD ["/bin/bash"]