FROM hotio/base@sha256:7a632e4f16bbbe10d2aaab75a8e7cff3ae868bb7d06e9a10182e385739f9fc7e

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
