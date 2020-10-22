FROM hotio/base@sha256:395d6ccb23727ce89b8551e31f98b71a6012596cf0736e4e30ed55a045818815

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
