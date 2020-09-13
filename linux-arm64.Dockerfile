FROM hotio/base@sha256:12a997c30659bf971cda4b0225148f7cdd149f5d14992f65471a92dab1c8eed4

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
