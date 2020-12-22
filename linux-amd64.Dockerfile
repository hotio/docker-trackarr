FROM hotio/base@sha256:449185c200e0d2f7b67656d01b2c8d47b3dcea710e546b036f380a74a7e72ca3

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
