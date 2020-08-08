FROM hotio/base@sha256:04bac33ed8094edb3100b0f4482d4c605a1bbbac7128ba994269b6b889842fdb

EXPOSE 7337

ARG TRACKARR_URL
RUN curl -fsSL "${TRACKARR_URL}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
