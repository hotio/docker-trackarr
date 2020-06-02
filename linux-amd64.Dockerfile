FROM hotio/base@sha256:ad79f26c53e2c7e1ed36dba0a0686990c503835134c63d9ed5aa7951e1b45c23

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
