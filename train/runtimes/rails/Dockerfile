FROM train AS stage1

LABEL maintainer="yamabiko"

ARG APP_NAME
ARG OPTION
ARG USER_NAME
ARG GROUP_NAME

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /var/www/html

ENV PATH $PATH:/home/${USER_NAME}/.rbenv/shims
ENV PATH $PATH:/home/${USER_NAME}/homebrew/bin

RUN chown -R ${USER_NAME}:${GROUP_NAME} /var/www/html

USER ${USER_NAME} 

RUN rm -rf ./* && rbenv exec rails new ${APP_NAME} ${OPTION} \
    && rm -rf ${APP_NAME}/.git && mkdir _${APP_NAME} && mv ${APP_NAME}/. _${APP_NAME}

FROM scratch AS export-stage
ARG APP_NAME
COPY --from=stage1 /var/www/html/_${APP_NAME}/. .