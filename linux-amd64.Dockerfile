FROM hotio/base@sha256:89ac56c3a5766e65f351fd2934b00527d6175004b86f87da47058b91dc7d9246

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
