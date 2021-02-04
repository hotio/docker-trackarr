FROM hotio/base@sha256:fc9c0387c1150b5d77418a739767102e3383c583aee4ed9e09bf24c41e2fa0f0

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
