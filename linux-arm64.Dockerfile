FROM hotio/base@sha256:919a5fd851bcbefbe652b8ced0a4fdf8173ba8a58039e1fac0d4256225454086

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
