FROM hotio/base@sha256:f9b216e4d1e5dddef8dd0dbe0cbd42ff017076980024d2f716c47e91ce180758

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
