FROM hotio/base@sha256:4dcb1ba156a481dd87a1df46a3df05300aafa5ed9985c7027094d77d4a2a4f30

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
