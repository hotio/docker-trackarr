FROM hotio/base@sha256:da1df0b31b7ce8db14acc08a2a3cc60699e5270752c4aac9a5497f955606aea5

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
