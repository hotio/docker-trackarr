FROM hotio/base@sha256:047c65b9a204d6936c5aaa69e085cad72bc15bd9df9c582de7fd94c2470a7daa

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
