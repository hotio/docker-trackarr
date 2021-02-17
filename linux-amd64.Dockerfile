FROM hotio/base@sha256:8a0ec9d1e1c36cea119cd3820b348b1983dca9bd893cac0e035127967576ce64

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
