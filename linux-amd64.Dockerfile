FROM hotio/base@sha256:00a1fae6f0857fff9fd9489c5a6842c25f35ce2233ea1e1d2073b3ab4ad0b76c

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
