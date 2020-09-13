FROM hotio/base@sha256:862937c0d795328dea8b83d5ee04a9aa82e729adb939e84f8b79f8123800cea5

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
