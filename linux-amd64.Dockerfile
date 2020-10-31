FROM hotio/base@sha256:d1223a83f726d54dfb17b5757f8ac65f3d0f884c132b48667265a9f5e022e871

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
