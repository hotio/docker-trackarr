FROM hotio/base@sha256:4a96bd748c0358bcfc43efb8b16ec4689c88cd29c1ed1dfb9090526639710bec

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
