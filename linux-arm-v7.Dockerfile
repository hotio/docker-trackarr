FROM hotio/base@sha256:82a916191ff569cb247ee6895beac151cb867e518b932f7105c0ef9c560dfbae

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
