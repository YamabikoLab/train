FROM train/app AS stage1

LABEL maintainer="yamabiko"

USER train

ARG APP_NAME

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

ENV PATH $PATH:/home/train/.rbenv/shims
ENV PATH $PATH:/home/train/homebrew/bin

RUN rm -rf ./* && rails new ${APP_NAME} -d mysql

WORKDIR /var/www/html/${APP_NAME}

RUN bundle install

WORKDIR /var/www/html

RUN cp -rfp ${APP_NAME}/. . && rm -rf ${APP_NAME}

FROM scratch AS export-stage
COPY --from=stage1 /var/www/html/. .