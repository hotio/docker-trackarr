FROM hotio/base@sha256:c564bcaf3fcbe846e5d85a9aca3c3c6812d23d0bbcda62ef573e1c47ad5700ac

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
