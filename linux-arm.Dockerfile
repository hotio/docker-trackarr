FROM hotio/base@sha256:dba94df91a2c476ec1e3717a2f76fd01ef5b9fcf1a1baa0efbac5e3c5b5f77d4

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
