FROM hotio/base@sha256:446dc3af8d33da7fb194ac1a5170f27c76fefa89067023a1cab73463edb925d8

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
