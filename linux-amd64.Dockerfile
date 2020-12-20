FROM hotio/base@sha256:200cc5e4ecbca44bee1d8cf84cb6a9f43d4ff30b53d442c92d4c37ad69af69fb

EXPOSE 7337

ARG URL_AMD64
RUN curl -fsSL "${URL_AMD64}" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && chmod 755 "${APP_DIR}/trackarr"

COPY root/ /
