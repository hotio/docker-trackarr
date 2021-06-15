FROM hotio/base@sha256:8856f3a1decd8abb2ffdc3e4aca69e546b474ef7fff0382212f0296f3af58a25

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
