FROM hotio/base@sha256:ee7f049308909eba6561fdd199d648e95c5ccd3d205e9c054ce2943b82445170

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
