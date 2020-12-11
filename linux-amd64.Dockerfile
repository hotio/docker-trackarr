FROM hotio/base@sha256:42068ebaa6321d33a4e182cb66c8b40d87027a0936afbdff3ed4d85f315cc77a

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
