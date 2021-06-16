FROM hotio/base@sha256:e4b68d01d4bd68602b1a4c40684a60133628145bf68d6ab08c9e3681c88ca9ac

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
