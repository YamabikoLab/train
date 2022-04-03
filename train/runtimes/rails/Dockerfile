FROM train AS stage1

LABEL maintainer="yamabiko"

ARG APP_NAME
ARG OPTION

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

ENV PATH $PATH:/home/train/.rbenv/shims
ENV PATH $PATH:/home/train/homebrew/bin

RUN chown -R train:train /var/www/html

USER train 

RUN rm -rf ./* && rbenv exec rails new ${APP_NAME} ${OPTION} \
    && rm -rf ${APP_NAME}/.git && mkdir _${APP_NAME} && cp -rf ${APP_NAME}/. _${APP_NAME}

FROM scratch AS export-stage
ARG APP_NAME
COPY --from=stage1 /var/www/html/_${APP_NAME}/. .