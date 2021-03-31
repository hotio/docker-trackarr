FROM hotio/base@sha256:d3f7d0d2e9cd937bc1499d9f79fa33267b6520abcd341d28e2516268eb08b955

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
