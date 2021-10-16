FROM train AS stage1

LABEL maintainer="yamabiko"

USER train

ARG APP_NAME

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

ENV PATH $PATH:/home/train/.rbenv/shims
ENV PATH $PATH:/home/train/homebrew/bin

RUN rm -rf ${APP_NAME} && rails new ${APP_NAME} -d mysql

FROM scratch AS export-stage
COPY --from=stage1 /var/www/html/${APP_NAME} .