FROM hotio/base@sha256:86193f73d044cd6f560c16cfa8bf6a432b735a1fd4bce11cf219437175438932

EXPOSE 7337

ARG URL_ARM64
RUN curl -fsSL "${URL_ARM64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
