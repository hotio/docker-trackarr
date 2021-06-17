FROM hotio/base@sha256:88ada9d66911befea35f6652c41269e983bba707f77bb96b7a2184b9ce27b867

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
