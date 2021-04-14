FROM hotio/base@sha256:2a66be43f9e6b8cd54f188f29df8290e60d9882875de7ead42336f6814749a02

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
