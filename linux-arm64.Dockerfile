FROM hotio/base@sha256:92ed5514d8dae810198a48454d99f182a81e65b02b6bef0a504847f52cadbe1a

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
