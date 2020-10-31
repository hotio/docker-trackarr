FROM hotio/base@sha256:1b30180b67dcaa60791c454e26c36e68fcc9efed8c5ca3f47903a234f3d7d656

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
