FROM hotio/base@sha256:8332ef574312f79be79393f6cda4cafcb9ab4e1a016944cb523d149b6f7f7ef3

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
