FROM hotio/base@sha256:d770b77b0546dc792fa0b800eff7e22b6c2dcb372abb87bcbd628c29ee9d7650

EXPOSE 7337

ARG URL_ARM
RUN curl -fsSL "${URL_ARM}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
