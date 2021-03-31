FROM hotio/base@sha256:ee86e69c172066a6f7b98e742eaad46c4717f687ba22bb532f140500d589472d

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
