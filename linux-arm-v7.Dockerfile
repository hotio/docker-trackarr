FROM hotio/base@sha256:60aaa76ce60cbb19050c556a68f6d20b917442d4b1c97dc5c79f8e06c7c96c82

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
