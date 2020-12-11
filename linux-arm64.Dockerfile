FROM hotio/base@sha256:e1da4f9793ecf2e0f67d1c97f2cca68eb30617ea5e909ec17dd75f7536ce432f

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
