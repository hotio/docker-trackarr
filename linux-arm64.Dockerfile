FROM hotio/base@sha256:daf0f3b3e00da8862d547d7d4994574b69247b17faa02ccb03b34deba8c47615

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
